! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "f562fc419a3ccb8a0af93a69906d8e640a0ac739"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "60161601-f5bf-4e36-be2b-414fed62b7d3", e._sentryDebugIdIdentifier = "sentry-dbid-60161601-f5bf-4e36-be2b-414fed62b7d3")
    } catch (e) {}
}(),
function() {
    var e = {
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
                        for (var e = "", a = 0; a < arguments.length; a++) {
                            var i = arguments[a];
                            i && (e = o(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var a = "";
                                for (var i in e) r.call(e, i) && e[i] && (a = o(a, i));
                                return a
                            }(i)))
                        }
                        return e
                    }

                    function o(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            }
        },
        t = {};

    function r(n) {
        var o = t[n];
        if (void 0 !== o) return o.exports;
        var a = t[n] = {
            exports: {}
        };
        return e[n](a, a.exports, r), a.exports
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
        }, r.nc = void 0, r.rv = function() {
            return "1.7.12"
        }, r.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, O, w, j, x, S, P, E, A, C, I, R, N, k, D, T, L, M, _, U, F, B, K, W, z, H, V, X, G = window.ReactJSX,
                q = window.TanstackQuery,
                Y = window.Roblox["core-scripts"].util.ready,
                $ = r.n(Y),
                Z = window.Roblox["core-scripts"].react,
                Q = "data:image/webp;base64,UklGRrADAABXRUJQVlA4WAoAAAAQAAAAOwAAHAAAQUxQSOsAAAABgGNt2zHnHdaetLadLtmNsQDbdlLbtsqkHpSxbX/zj/U9G4iICSCX4uiiGdPdq8/vTNOFUWLyNGXwlFk4ZSf9ye6pKm4tXN+UK90IXLBwPxfgImDPArjr70Q5b4GcUTiUWjCFYiJKvAaxXMaTqMcC2yUKP8I5DM39x/nPmrAAjxqQ9LdIdy9Ir3dI9yYk4zTSZBHDYfnRpzgnkZIhnAExpd+j3KYSiepQqkVEpF3HWNWQY/gBwn4YOY/Y5m8znFz7tT7z9dTsR+5KMkdvBF6Em+EMMXkoTyvfPv/6Z+6aBc/N/1/n22WpcnIJAFZQOCCeAgAAsA4AnQEqPAAdAD6ROJhIJaMiITAb+ACwEglsAJ0yhHXno/mCVb+y7BwXfr7x7eqjbAeYD9bPVz9BvlAdYb6AHlp/uB8G3+A/4Pphu/TXQhi//S809EB69BEZldQNIV/eNVlDmUDW33lPn0iGBlkHEoP7xzvxv4W7IPVKwg+gAO9wOYzsI8BSlu/ljXZqxJsDV2tD+qayuJoxUFkUptaQf93n7fV4hUgJ+Uf/kpj4AqJAtsX5hJKtHHJlA0l7tylf+1SOJ1un0rrDm2Up4a6mCFRb/+W/vzfxAH3D9myHP/NfjX7ifoc/H7vgudmvtLqz+hb9lyHGakbAh+at5OqNY8Lo7/c/Rd1YFFWBSYBdcwPiQzjecF1Xv8R2dj9vKtM9tG+6SEBuPEV31LvRnBpXZ2XjpXFA9v38V7MMCzD2xxa06JeC+cVPiHvpVzfH8c63KCGOBFLltx9UIWiwO/c0fNzieqYIEsY2OIkx/wrhbV4GMtEp1U/7N3a7/Qq9r/h+LEI8sYOrGm1MU2P/BL4fYeBDZFMdJZ519a6U9S4K0wTMro82cnTukNfm7VyZ5hONbhEmAOc3OOYiFKgqzFC716CnyAatzIyDr0CosyN1Uh1epW+K2w7UmZ36T6i2+3vzCUz+pCLHl5zfc3yHC5sTR9yT368/W2zLQGXLxDmulSMj6HAO2VABHUwOJFjwIZT/+SB3RcruT4FqGiItnt6evy0vY4eSL9ALvRwkehZMB6Xj/2dzV507O+xEyOf7DL0zpSV3B/Oxz2jju+fUOFvOLM2J+VLuONA8wTfqy78vrhQfIVlpkdzQ+ZzJ3vL/FVZIgcqzYBBbKgUTEjq/+jSvW3vcOy7IA539GoeB3ydM4gyDy0h9FTsf9CO0fQAAAA==",
                J = [{
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
                    postfixIcon: Q
                }, {
                    name: "sitemap",
                    path: "/sitemap",
                    labelTranslationKey: "Label.Sitemap"
                }],
                ee = [{
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
                    postfixIcon: Q
                }, {
                    name: "sitemap",
                    path: "/sitemap",
                    labelTranslationKey: "Label.Sitemap"
                }],
                et = window.PropTypes,
                er = r.n(et),
                en = JSON.parse('{"P":["CommonUI.Features","Common.AlertsAndOptions","Feature.Tracking","Feature.Privacy"]}'),
                eo = window.HeaderScripts,
                ea = window.Roblox,
                ei = window.CoreUtilities,
                el = window.Roblox["core-scripts"].endpoints;

            function ec(e) {
                var t = e.translate,
                    r = new Date().getFullYear();
                return (0, G.jsx)("p", {
                    className: "text-footer footer-note",
                    children: t("Description.CopyRightMessageDynamicYear", {
                        copyrightYear: r
                    })
                })
            }
            ec.propTypes = {
                translate: er().func.isRequired
            };
            var eu = window.React,
                es = r.n(eu),
                ef = r(611),
                ep = r.n(ef),
                ed = window.Roblox["core-scripts"].eventStream,
                ey = window.Roblox["core-scripts"].intl.intl,
                em = r.n(ey),
                eb = window.ReactStyleGuide,
                ev = "RBXViralAcquisition",
                eh = "Description.RBXViralAcquisition",
                eg = "RBXSource",
                eO = "Description.RBXSource",
                ew = "Heading.GoogleAnalytics",
                ej = [{
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
                ex = (0, el.getAbsoluteUrl)("/info/privacy"),
                eS = (0, el.getAbsoluteUrl)("/support"),
                eP = function(e) {
                    var t = e.cookieName,
                        r = e.description;
                    return (0, G.jsxs)("div", {
                        className: "cookie-item",
                        children: [(0, G.jsx)("p", {
                            className: "cookie-name font-body text",
                            children: t
                        }), (0, G.jsx)("p", {
                            className: "cookie-description font-footer",
                            children: r
                        })]
                    })
                },
                eE = function(e) {
                    var t = e.translate,
                        r = e.isNonEssentialCookieListVisible,
                        n = ep()({
                            hidden: !r
                        }),
                        o = ej.map(function(e) {
                            return (0, G.jsxs)("div", {
                                className: "google-analytics-company-info-sec",
                                children: [(0, G.jsx)("p", {
                                    className: "font-caption-header text-emphasis",
                                    children: t(e.label)
                                }), (0, G.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: t(e.content)
                                })]
                            }, e.label)
                        }),
                        a = (0, G.jsx)("a", {
                            className: "text-link",
                            target: "_blank",
                            href: "https://support.google.com/analytics/answer/11397207",
                            rel: "noreferrer",
                            children: t(ew)
                        }),
                        i = t("Description.GAReadMore"),
                        l = i.indexOf("{googleAnalyticsLink}"),
                        c = (0, G.jsxs)("p", {
                            className: "font-caption-body text",
                            children: [i.substring(0, l), a]
                        }),
                        u = (0, G.jsxs)("div", {
                            children: [(0, G.jsxs)("a", {
                                className: "font-header-2 text-emphasis",
                                href: "https://marketingplatform.google.com/about/analytics/",
                                children: [t(ew), (0, G.jsx)("span", {
                                    className: "icon-nav-external-link-sm cookie-external-link-icon"
                                })]
                            }), (0, G.jsxs)("div", {
                                children: [(0, G.jsx)("span", {
                                    className: "google-analytics-info-subheader",
                                    children: t("Label.OwnedBy")
                                }), (0, G.jsx)("span", {
                                    className: "font-caption-header text-emphasis",
                                    children: "Google Inc."
                                })]
                            }), (0, G.jsx)("p", {
                                className: "text-emphasis google-analytics-company-info-sec",
                                children: t("Heading.GoogleAnalyticsPurpose")
                            }), (0, G.jsx)("span", {
                                className: "font-caption-body text",
                                children: t("Description.GoogleAnalyticsPurpose")
                            }), (0, G.jsx)("p", {
                                className: "text-emphasis google-analytics-company-info-sec",
                                children: t("Heading.CompanyCollection")
                            }), o, c]
                        }),
                        s = (0, G.jsxs)("div", {
                            className: "analytics-cookie-list",
                            children: [(0, G.jsx)(eP, {
                                cookieName: ev,
                                description: t(eh)
                            }), (0, G.jsx)(eP, {
                                cookieName: eg,
                                description: t(eO)
                            })]
                        });
                    return (0, G.jsxs)("div", {
                        className: n,
                        children: [s, u]
                    })
                },
                eA = "RBXcb",
                eC = function(e) {
                    var t, r = "".concat(e, "="),
                        n = null == (t = document.cookie.split("; ").find(function(e) {
                            return e.startsWith(r)
                        })) ? void 0 : t.split("=")[1];
                    return null == n ? null : {
                        name: e,
                        value: decodeURIComponent(n)
                    }
                },
                eI = function(e, t, r) {
                    var n, o = null == r.sameSite ? "" : ";samesite=".concat(r.sameSite),
                        a = null == r.domain ? "" : ";domain=".concat(r.domain),
                        i = ";path=".concat(null != (n = r.path) ? n : "/"),
                        l = null == r.expires ? "" : ";expires=".concat(r.expires.toUTCString()),
                        c = null == r.maxAge ? "" : ";max-age=".concat(r.maxAge);
                    document.cookie = "".concat(e, "=").concat(encodeURIComponent(t), ";secure").concat(o).concat(a).concat(i).concat(l).concat(c)
                },
                eR = function(e, t, r) {
                    eI(e, t, r)
                },
                eN = function(e, t) {
                    eI(e, "", {
                        domain: t.domain,
                        path: t.path,
                        expires: new Date(0)
                    })
                },
                ek = window.Roblox["core-scripts"].environmentUrls,
                eD = r.n(ek),
                eT = function(e, t) {
                    eC(eA) && eN(eA, {
                        domain: eD().domain
                    });
                    var r = "",
                        n = [];
                    t.forEach(function(o, a) {
                        e.includes(o) ? r += "".concat(o, "=true&") : (r += "".concat(o, "=false&"), n.push(o)), a === t.length - 1 && (r = r.slice(0, -1))
                    }), n.forEach(function(e) {
                        eN(e, {
                            domain: eD().domain
                        })
                    }), eR(eA, r, {
                        maxAge: 15552e3,
                        domain: eD().domain
                    })
                },
                eL = function() {
                    var e = eC(eA);
                    return !!e && !!e.value.split("&").find(function(e) {
                        return "true" === e.split("=")[1]
                    })
                };

            function eM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e_(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eM(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eM(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var eU = e_((0, eb.createModal)(), 2),
                eF = eU[0],
                eB = eU[1],
                eK = function(e) {
                    var t = e.nonEssentialCookieList,
                        r = e.essentialCookieList,
                        n = e.translate,
                        o = e.closeConsentTool,
                        a = eL(),
                        i = e_((0, eu.useState)(a), 2),
                        l = i[0],
                        c = i[1],
                        u = e_((0, eu.useState)(!1), 2),
                        s = u[0],
                        f = u[1],
                        p = e_((0, eu.useState)(!1), 2),
                        d = p[0],
                        y = p[1];
                    (0, eu.useEffect)(function() {
                        eB.open()
                    }, []);
                    var m = ep()({
                            hidden: !s
                        }),
                        b = ep()("cookie-consent-tool-collaps", {
                            on: d
                        }),
                        v = ep()("cookie-consent-tool-collaps font-header-2 text-emphasis ", {
                            on: s
                        }),
                        h = new(em())().getRobloxLocale(),
                        g = ei.urlService.getUrlWithLocale("string" == typeof ex ? ex : "", h),
                        O = (0, G.jsx)("div", {
                            className: "cookie-consent-tool-info-link",
                            children: (0, G.jsxs)("a", {
                                className: "text-link",
                                target: "_blank",
                                href: g,
                                rel: "noreferrer",
                                children: [n("Description.PrivacyPolicy"), (0, G.jsx)("span", {
                                    className: "icon-nav-external-link-sm cookie-external-link-icon"
                                })]
                            })
                        }),
                        w = (0, G.jsx)("div", {
                            className: "cookie-consent-tool-info-link",
                            children: (0, G.jsxs)("a", {
                                className: "text-link",
                                target: "_blank",
                                href: "string" == typeof eS ? eS : "",
                                rel: "noreferrer",
                                children: [n("Action.RequestData"), (0, G.jsx)("span", {
                                    className: "icon-nav-external-link-sm cookie-external-link-icon"
                                })]
                            })
                        }),
                        j = (0, G.jsxs)("div", {
                            children: [(0, G.jsxs)("div", {
                                className: "static-section",
                                children: [(0, G.jsx)("div", {
                                    className: "font-header-2 text-emphasis google-analytics-company-info-sec",
                                    children: n("Heading.InformationCollection")
                                }), (0, G.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: n("Description.InformationCollection")
                                })]
                            }), (0, G.jsxs)("div", {
                                className: "static-section",
                                children: [(0, G.jsx)("div", {
                                    className: "font-header-2 text-emphasis google-analytics-company-info-sec",
                                    children: n("Heading.InformationCollection2")
                                }), (0, G.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: n("Description.InformationCollection2")
                                })]
                            }), (0, G.jsxs)("div", {
                                className: "static-section",
                                children: [(0, G.jsx)("div", {
                                    className: "font-header-2 text-emphasis google-analytics-company-info-sec",
                                    children: n("Heading.InformationPartnerCollection")
                                }), (0, G.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: n("Description.InformationPartnerCollection")
                                })]
                            })]
                        }),
                        x = (0, G.jsxs)("div", {
                            children: [(0, G.jsx)("button", {
                                className: b,
                                type: "button",
                                onClick: function() {
                                    y(!d)
                                },
                                children: (0, G.jsx)("span", {
                                    className: "font-header-2 text-emphasis",
                                    children: n("Heading.AnalyticsCookies")
                                })
                            }), (0, G.jsx)(eb.Toggle, {
                                className: "cookie-toggle",
                                isOn: l,
                                onToggle: function() {
                                    c(!l)
                                }
                            })]
                        }),
                        S = r.map(function(e) {
                            return (0, G.jsx)(eP, {
                                cookieName: e.cookieName,
                                description: n(e.description)
                            }, e.cookieName)
                        }),
                        P = (0, G.jsxs)("div", {
                            children: [w, O]
                        }),
                        E = (0, G.jsxs)("div", {
                            className: "essential-cookie-section",
                            children: [(0, G.jsx)("button", {
                                className: v,
                                type: "button",
                                onClick: function() {
                                    f(!s)
                                },
                                children: n("Heading.EssentialCookies")
                            }), (0, G.jsx)("div", {
                                className: m,
                                children: S
                            })]
                        }),
                        A = (0, G.jsxs)("div", {
                            className: "cookie-consent-tool-body",
                            children: [j, P, E, x, (0, G.jsx)(eE, {
                                isNonEssentialCookieListVisible: d,
                                translate: n
                            })]
                        });
                    return (0, G.jsx)(eF, {
                        title: n("Heading.CookieSettings"),
                        body: A,
                        actionButtonShow: !0,
                        actionButtonText: n("Action.SavePreferences"),
                        neutralButtonText: n("Action.Cancel"),
                        onAction: function() {
                            eT(l ? t : [], t), o(null)
                        },
                        onNeutral: function() {
                            o("banner")
                        },
                        id: "cookie-consent-tool-modal",
                        size: "lg"
                    })
                };

            function eW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ez = function(e) {
                    var t, r = e.nonEssentialCookieList,
                        n = e.essentialCookieList,
                        o = e.translate,
                        a = e.onCloseConsentTool,
                        i = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, eu.useState)(!1)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return eW(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eW(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        l = i[0],
                        c = i[1],
                        u = {
                            open: function() {
                                c(!0)
                            },
                            close: function() {
                                c(!1)
                            }
                        };
                    return [l ? (0, G.jsx)(eK, {
                        translate: o,
                        essentialCookieList: n,
                        nonEssentialCookieList: r,
                        closeConsentTool: function(e) {
                            u.close(), null == a || a(e)
                        }
                    }) : (0, G.jsx)("div", {}), u]
                },
                eH = window.Roblox["core-scripts"].meta.user,
                eV = function(e) {
                    null != e && (0, eH.isAuthenticated)() && eR("RBXcp", e ? "restricted" : "standard", {
                        domain: eD().domain,
                        maxAge: 15552e3,
                        sameSite: "lax"
                    })
                },
                eX = window.Roblox["core-scripts"].guac;

            function eG(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var eq = function() {
                var e;
                return (e = function() {
                    var e;
                    return function(e, t) {
                        var r, n, o, a = {
                                label: 0,
                                sent: function() {
                                    if (1 & o[0]) throw o[1];
                                    return o[1]
                                },
                                trys: [],
                                ops: []
                            },
                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            l = Object.defineProperty;
                        return l(i, "next", {
                            value: c(0)
                        }), l(i, "throw", {
                            value: c(1)
                        }), l(i, "return", {
                            value: c(2)
                        }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), i;

                        function c(l) {
                            return function(c) {
                                var u = [l, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                    if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                    switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, n = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                a.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && a.label < o[1]) {
                                                a.label = o[1], o = u;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(u);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, a)
                                } catch (e) {
                                    u = [6, e], n = 0
                                } finally {
                                    r = o = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, (0, eX.callBehaviour)("cookie-policy")];
                            case 1:
                                if (void 0 !== (e = t.sent())) return eV(e.RestrictNonEssentialTrackingConsent), [2, e];
                                return [2, {
                                    ShouldDisplayCookieBannerV3: !1,
                                    NonEssentialCookieList: [],
                                    EssentialCookieList: []
                                }]
                        }
                    })
                }, function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            eG(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            eG(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                })()
            };

            function eY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e$(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function eZ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eY(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eY(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eQ(e) {
                var t = e.translate,
                    r = eZ((0, eu.useState)([]), 2),
                    n = r[0],
                    o = r[1],
                    a = eZ((0, eu.useState)([]), 2),
                    i = a[0],
                    l = a[1];
                (0, eu.useEffect)(function() {
                    var e;
                    (e = function() {
                        var e;
                        return function(e, t) {
                            var r, n, o, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(i, "next", {
                                value: c(0)
                            }), l(i, "throw", {
                                value: c(1)
                            }), l(i, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), i;

                            function c(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    a.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && a.label < o[1]) {
                                                    a.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && a.label < o[2]) {
                                                    a.label = o[2], a.ops.push(u);
                                                    break
                                                }
                                                o[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, a)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return [4, eq()];
                                case 1:
                                    return (e = t.sent()).ShouldDisplayCookieBannerV3 && e.NonEssentialCookieList && (o(e.NonEssentialCookieList), l(e.EssentialCookieList)), [2]
                            }
                        })
                    }, function() {
                        var t = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var a = e.apply(t, r);

                            function i(e) {
                                e$(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                e$(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                }, []);
                var c = eZ(ez({
                        nonEssentialCookieList: n,
                        essentialCookieList: i,
                        translate: t
                    }), 2),
                    u = c[0],
                    s = c[1];
                return i.length > 0 ? (0, G.jsxs)("div", {
                    children: [(0, G.jsx)("button", {
                        onClick: s.open,
                        className: "btn text-footer-nav footer-button-link",
                        type: "button",
                        "data-testid": "cookie-consent-link",
                        children: t("Heading.CookieSettings")
                    }), u]
                }) : null
            }
            eQ.propTypes = {
                translate: er().func.isRequired
            };
            var eJ = window.Roblox["core-scripts"].util.url,
                e0 = function() {
                    for (var e, t, r = 0, n = "", o = arguments.length; r < o; r++)(e = arguments[r]) && (t = function e(t) {
                        var r, n, o = "";
                        if ("string" == typeof t || "number" == typeof t) o += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var a = t.length;
                                for (r = 0; r < a; r++) t[r] && (n = e(t[r])) && (o && (o += " "), o += n)
                            } else
                                for (n in t) t[n] && (o && (o += " "), o += n);
                        return o
                    }(e)) && (n && (n += " "), n += t);
                    return n
                },
                e1 = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                e2 = function(e) {
                    var t = e.className;
                    return es().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: e0("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                };

            function e3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e6(e) {
                if (Array.isArray(e)) return e
            }

            function e8() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function e5(e, t) {
                if (e) {
                    if ("string" == typeof e) return e3(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return e3(e, t)
                }
            }
            var e4 = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                e7 = es().forwardRef(function(e, t) {
                    var r, n = e6(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || e5(r) || e8(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.name,
                        l = o.size,
                        c = o.className,
                        u = (o.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(o, ["name", "size", "className", "children"])),
                        s = (e6(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || e5(a, 1) || e8())[0];
                    return es().createElement("span", function(e) {
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
                        ref: s,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: e0("grow-0 shrink-0 basis-auto icon", i, e4[void 0 === l ? "Medium" : l], c)
                    }, u))
                });
            e7.displayName = "Icon";
            var e9 = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                te = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                tt = function(e) {
                    var t = e.variant,
                        r = e.size,
                        n = e.isCircular,
                        o = e.className,
                        a = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["variant", "size", "isCircular", "className"]);
                    return es().createElement("button", function(e) {
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
                        type: "button",
                        className: e0("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", e1, te[t], e9[r], n && "radius-circle", o)
                    }, a), es().createElement(e2, null), es().createElement(e7, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function tr(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function tn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function to(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function ta() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = to(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : to(t[e], null)
                        }
                    }
                }
            }

            function ti() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return eu.useCallback(ta.apply(void 0, function(e) {
                    if (Array.isArray(e)) return tn(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tn(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tn(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function tl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tc(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function tu(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        tc(e, t, r[t])
                    })
                }
                return e
            }

            function ts(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function tf(e) {
                return function(e) {
                    if (Array.isArray(e)) return tl(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tl(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tl(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tp(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return eu.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return eu.useMemo(function() {
                                var t, o;
                                return tc({}, "__scope".concat(e), (t = tu({}, r), o = null != (o = tc({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                                    var t = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        t.push.apply(t, r)
                                    }
                                    return t
                                })(Object(o)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(o, e))
                                }), t))
                            }, [r, n])
                        }
                    };
                return n.scopeName = e, [function(t, n) {
                    var o = eu.createContext(n),
                        a = r.length;
                    r = tf(r).concat([n]);
                    var i = function(t) {
                        var r, n = t.scope,
                            i = t.children,
                            l = ts(t, ["scope", "children"]),
                            c = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                            u = eu.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, G.jsx)(c.Provider, {
                            value: u,
                            children: i
                        })
                    };
                    return i.displayName = t + "Provider", [i, function(r, i) {
                        var l, c = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                            u = eu.useContext(c);
                        if (u) return u;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, td.apply(void 0, [n].concat(tf(t)))]
            }

            function td() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var n = t[0];
                if (1 === t.length) return n;
                var o = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var r = e.reduce(function(e, r) {
                            var n = r.useScope,
                                o = r.scopeName;
                            return tu({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return eu.useMemo(function() {
                            return tc({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var ty = (null == (H = globalThis) ? void 0 : H.document) ? eu.useLayoutEffect : function() {};

            function tm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var tb = eu[" useId ".trim().toString()] || function() {},
                tv = 0;

            function th(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = eu.useState(tb())) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return tm(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tm(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return ty(function() {
                    e || o(function(e) {
                        return null != e ? e : String(tv++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function tg(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tO(e) {
                var t = eu.useRef(e);
                return eu.useEffect(function() {
                    t.current = e
                }), eu.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return tg(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return tg(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tg(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function tw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tj(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tw(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tw(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tx(e) {
                var t, r, n, o, a, i, l, c = e.prop,
                    u = e.defaultProp,
                    s = e.onChange,
                    f = void 0 === s ? function() {} : s,
                    p = tj((r = (t = {
                        defaultProp: u,
                        onChange: f
                    }).defaultProp, n = t.onChange, a = tj(o = eu.useState(r), 1)[0], i = eu.useRef(a), l = tO(n), eu.useEffect(function() {
                        i.current !== a && (l(a), i.current = a)
                    }, [a, i, l]), o), 2),
                    d = p[0],
                    y = p[1],
                    m = void 0 !== c,
                    b = m ? c : d,
                    v = tO(f);
                return [b, eu.useCallback(function(e) {
                    if (m) {
                        var t = "function" == typeof e ? e(c) : e;
                        t !== c && v(t)
                    } else y(e)
                }, [m, c, y, v])]
            }
            var tS = window.RadixUI["react-dismissable-layer"],
                tP = window.ReactDOM,
                tE = r.n(tP);

            function tA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tC(e) {
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

            function tI(e, t) {
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

            function tR(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function tN(e) {
                return function(e) {
                    if (Array.isArray(e)) return tA(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tA(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tA(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tk(e) {
                var t, r, n = (t = e, (r = eu.forwardRef(function(e, t) {
                        var r = e.children,
                            n = tR(e, ["children"]);
                        if (eu.isValidElement(r)) {
                            var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = tC({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            a.apply(void 0, tN(t)), o.apply(void 0, tN(t))
                                        } : o && (r[n] = o) : "style" === n ? r[n] = tC({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return tC({}, e, r)
                                }(n, r.props);
                            return r.type !== eu.Fragment && (s.ref = t ? ta(t, u) : u), eu.cloneElement(r, s)
                        }
                        return eu.Children.count(r) > 1 ? eu.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = eu.forwardRef(function(e, t) {
                        var r = e.children,
                            o = tR(e, ["children"]),
                            a = eu.Children.toArray(r),
                            i = a.find(tT);
                        if (i) {
                            var l = i.props.children,
                                c = a.map(function(e) {
                                    return e !== i ? e : eu.Children.count(l) > 1 ? eu.Children.only(null) : eu.isValidElement(l) ? l.props.children : null
                                });
                            return (0, G.jsx)(n, tI(tC({}, o), {
                                ref: t,
                                children: eu.isValidElement(l) ? eu.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, G.jsx)(n, tI(tC({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var tD = Symbol("radix.slottable");

            function tT(e) {
                return eu.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tD
            }

            function tL(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function tM(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        tL(e, t, r[t])
                    })
                }
                return e
            }

            function t_(e, t) {
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
            var tU = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = tk("Primitive.".concat(t)),
                    n = eu.forwardRef(function(e, n) {
                        var o = e.asChild,
                            a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }(e, ["asChild"]),
                            i = o ? r : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, G.jsx)(i, t_(tM({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), t_(tM({}, e), tL({}, t, n))
            }, {});

            function tF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tB(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || tK(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tK(e, t) {
                if (e) {
                    if ("string" == typeof e) return tF(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tF(e, t)
                }
            }
            var tW = "focusScope.autoFocusOnMount",
                tz = "focusScope.autoFocusOnUnmount",
                tH = {
                    bubbles: !1,
                    cancelable: !0
                },
                tV = eu.forwardRef(function(e, t) {
                    var r, n, o = e.loop,
                        a = void 0 !== o && o,
                        i = e.trapped,
                        l = void 0 !== i && i,
                        c = e.onMountAutoFocus,
                        u = e.onUnmountAutoFocus,
                        s = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        f = tB(eu.useState(null), 2),
                        p = f[0],
                        d = f[1],
                        y = tO(c),
                        m = tO(u),
                        b = eu.useRef(null),
                        v = ti(t, function(e) {
                            return d(e)
                        }),
                        h = eu.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    eu.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                    if (!h.paused && p) {
                                        var t = e.target;
                                        p.contains(t) ? b.current = t : tq(b.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!h.paused && p) {
                                        var t = e.relatedTarget;
                                        null !== t && (p.contains(t) || tq(b.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", e), document.addEventListener("focusout", t);
                            var r = new MutationObserver(function(e) {
                                if (document.activeElement === document.body) {
                                    var t = !0,
                                        r = !1,
                                        n = void 0;
                                    try {
                                        for (var o, a = e[Symbol.iterator](); !(t = (o = a.next()).done); t = !0) o.value.removedNodes.length > 0 && tq(p)
                                    } catch (e) {
                                        r = !0, n = e
                                    } finally {
                                        try {
                                            t || null == a.return || a.return()
                                        } finally {
                                            if (r) throw n
                                        }
                                    }
                                }
                            });
                            return p && r.observe(p, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), r.disconnect()
                                }
                        }
                    }, [l, p, h.paused]), eu.useEffect(function() {
                        if (p) {
                            tY.add(h);
                            var e = document.activeElement;
                            if (!p.contains(e)) {
                                var t = new CustomEvent(tW, tH);
                                p.addEventListener(tW, y), p.dispatchEvent(t), t.defaultPrevented || (function(e) {
                                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = t.select,
                                        n = void 0 !== r && r,
                                        o = document.activeElement,
                                        a = !0,
                                        i = !1,
                                        l = void 0;
                                    try {
                                        for (var c, u = e[Symbol.iterator](); !(a = (c = u.next()).done); a = !0) {
                                            var s = c.value;
                                            if (tq(s, {
                                                    select: n
                                                }), document.activeElement !== o) return
                                        }
                                    } catch (e) {
                                        i = !0, l = e
                                    } finally {
                                        try {
                                            a || null == u.return || u.return()
                                        } finally {
                                            if (i) throw l
                                        }
                                    }
                                }(tX(p).filter(function(e) {
                                    return "A" !== e.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === e && tq(p))
                            }
                            return function() {
                                p.removeEventListener(tW, y), setTimeout(function() {
                                    var t = new CustomEvent(tz, tH);
                                    p.addEventListener(tz, m), p.dispatchEvent(t), t.defaultPrevented || tq(null != e ? e : document.body, {
                                        select: !0
                                    }), p.removeEventListener(tz, m), tY.remove(h)
                                }, 0)
                            }
                        }
                    }, [p, y, m, h]);
                    var g = eu.useCallback(function(e) {
                        if ((a || l) && !h.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                r = document.activeElement;
                            if (t && r) {
                                var n, o, i = e.currentTarget,
                                    c = tB([tG(o = tX(n = i), n), tG(o.reverse(), n)], 2),
                                    u = c[0],
                                    s = c[1];
                                u && s ? e.shiftKey || r !== s ? e.shiftKey && r === u && (e.preventDefault(), a && tq(s, {
                                    select: !0
                                })) : (e.preventDefault(), a && tq(u, {
                                    select: !0
                                })) : r === i && e.preventDefault()
                            }
                        }
                    }, [a, l, h.paused]);
                    return (0, G.jsx)(tU.div, (r = function(e) {
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
                        tabIndex: -1
                    }, s), n = n = {
                        ref: v,
                        onKeyDown: g
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function tX(e) {
                for (var t = [], r = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) t.push(r.currentNode);
                return t
            }

            function tG(e, t) {
                var r = !0,
                    n = !1,
                    o = void 0;
                try {
                    for (var a, i = e[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                        var l = a.value;
                        if (! function(e, t) {
                                var r = t.upTo;
                                if ("hidden" === getComputedStyle(e).visibility) return !0;
                                for (; e && (void 0 === r || e !== r);) {
                                    if ("none" === getComputedStyle(e).display) return !0;
                                    e = e.parentElement
                                }
                                return !1
                            }(l, {
                                upTo: t
                            })) return l
                    }
                } catch (e) {
                    n = !0, o = e
                } finally {
                    try {
                        r || null == i.return || i.return()
                    } finally {
                        if (n) throw o
                    }
                }
            }

            function tq(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = t.select;
                if (e && e.focus) {
                    var n, o, a, i = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== i && (o = n = e, null != (a = HTMLInputElement) && "u" > typeof Symbol && a[Symbol.hasInstance] ? !!a[Symbol.hasInstance](o) : o instanceof a) && "select" in n && void 0 !== r && r && e.select()
                }
            }
            tV.displayName = "FocusScope";
            var tY = (e = [], {
                add: function(t) {
                    var r = e[0];
                    t !== r && (null == r || r.pause()), (e = t$(e, t)).unshift(t)
                },
                remove: function(t) {
                    var r;
                    null == (r = (e = t$(e, t))[0]) || r.resume()
                }
            });

            function t$(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return tF(e)
                    }(e) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || tK(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r.indexOf(t);
                return -1 !== n && r.splice(n, 1), r
            }

            function tZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var tQ = eu.forwardRef(function(e, t) {
                var r, n, o, a, i, l = e.container,
                    c = function(e, t) {
                        if (null == e) return {};
                        var r, n, o, a = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }
                        if (a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    a = Object.getOwnPropertyNames(e);
                                for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                return o
                            }(e, t), Object.getOwnPropertySymbols)
                            for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                        return a
                    }(e, ["container"]),
                    u = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = eu.useState(!1)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return tZ(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tZ(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = u[0],
                    f = u[1];
                ty(function() {
                    return f(!0)
                }, []);
                var p = l || s && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
                return p ? tE().createPortal((0, G.jsx)(tU.div, (n = function(e) {
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
                }({}, c), o = o = {
                    ref: t
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(o)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                }), n)), p) : null
            });

            function tJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t0(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tJ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tJ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            tQ.displayName = "Portal";
            var t1 = function(e) {
                var t, r, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h = e.present,
                    g = e.children,
                    O = (t = h, a = (o = t0(eu.useState(), 2))[0], i = o[1], l = eu.useRef({}), c = eu.useRef(t), u = eu.useRef("none"), f = (s = t0((r = t ? "mounted" : "unmounted", n = {
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
                    }, eu.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], eu.useEffect(function() {
                        var e = t2(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), ty(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = t2(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), c.current = t
                        }
                    }, [t, p]), ty(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = t2(l.current).includes(e.animationName);
                                    if (e.target === a && n && (p("ANIMATION_END"), !c.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (u.current = t2(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [a, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: eu.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), i(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : eu.Children.only(g),
                    j = ti(O.ref, (v = (b = null == (y = Object.getOwnPropertyDescriptor((d = w).props, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? d.ref : (v = (b = null == (m = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof g || O.isPresent ? eu.cloneElement(w, {
                    ref: j
                }) : null
            };

            function t2(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            t1.displayName = "Presence";
            var t3 = window.RadixUI["react-focus-guards"],
                t6 = function() {
                    return (t6 = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function t8(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
                return r
            }
            var t5 = "right-scroll-bar-position",
                t4 = "width-before-scroll-bar";

            function t7(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var t9 = "u" > typeof window ? eu.useLayoutEffect : eu.useEffect,
                re = new WeakMap,
                rt = (void 0 === n && (n = {}), (void 0 === o && (o = function(e) {
                    return e
                }), a = [], i = !1, l = {
                    read: function() {
                        if (i) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return a.length ? a[a.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = o(e, i);
                        return a.push(t),
                            function() {
                                a = a.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (i = !0; a.length;) {
                            var t = a;
                            a = [], t.forEach(e)
                        }
                        a = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return a
                            }
                        }
                    },
                    assignMedium: function(e) {
                        i = !0;
                        var t = [];
                        if (a.length) {
                            var r = a;
                            a = [], r.forEach(e), t = a
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            o = function() {
                                return Promise.resolve().then(n)
                            };
                        o(), a = {
                            push: function(e) {
                                t.push(e), o()
                            },
                            filter: function(e) {
                                return t = t.filter(e), a
                            }
                        }
                    }
                }).options = t6({
                    async: !0,
                    ssr: !1
                }, n), l),
                rr = function() {},
                rn = eu.forwardRef(function(e, t) {
                    var r, n, o, a, i = eu.useRef(null),
                        l = eu.useState({
                            onScrollCapture: rr,
                            onWheelCapture: rr,
                            onTouchMoveCapture: rr
                        }),
                        c = l[0],
                        u = l[1],
                        s = e.forwardProps,
                        f = e.children,
                        p = e.className,
                        d = e.removeScrollBar,
                        y = e.enabled,
                        m = e.shards,
                        b = e.sideCar,
                        v = e.noRelative,
                        h = e.noIsolation,
                        g = e.inert,
                        O = e.allowPinchZoom,
                        w = e.as,
                        j = e.gapMode,
                        x = t8(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = (r = [i, t], n = function(e) {
                            return r.forEach(function(t) {
                                return t7(t, e)
                            })
                        }, (o = (0, eu.useState)(function() {
                            return {
                                value: null,
                                callback: n,
                                facade: {
                                    get current() {
                                        return o.value
                                    },
                                    set current(value) {
                                        var e = o.value;
                                        e !== value && (o.value = value, o.callback(value, e))
                                    }
                                }
                            }
                        })[0]).callback = n, a = o.facade, t9(function() {
                            var e = re.get(a);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    o = a.current;
                                t.forEach(function(e) {
                                    n.has(e) || t7(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || t7(e, o)
                                })
                            }
                            re.set(a, r)
                        }, [r]), a),
                        P = t6(t6({}, x), c);
                    return eu.createElement(eu.Fragment, null, y && eu.createElement(b, {
                        sideCar: rt,
                        removeScrollBar: d,
                        shards: m,
                        noRelative: v,
                        noIsolation: h,
                        inert: g,
                        setCallbacks: u,
                        allowPinchZoom: !!O,
                        lockRef: i,
                        gapMode: j
                    }), s ? eu.cloneElement(eu.Children.only(f), t6(t6({}, P), {
                        ref: S
                    })) : eu.createElement(void 0 === w ? "div" : w, t6({}, P, {
                        className: p,
                        ref: S
                    }), f))
                });
            rn.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, rn.classNames = {
                fullWidth: t4,
                zeroRight: t5
            };
            var ro = function(e) {
                var t = e.sideCar,
                    r = t8(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return eu.createElement(n, t6({}, r))
            };
            ro.isSideCarExport = !0;
            var ra = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = V || r.nc;
                                    return t && e.setAttribute("nonce", t), e
                                }())) {
                                var o, a;
                                (o = t).styleSheet ? o.styleSheet.cssText = n : o.appendChild(document.createTextNode(n)), a = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(a)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                ri = function() {
                    var e = ra();
                    return function(t, r) {
                        eu.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                rl = function() {
                    var e = ri();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                rc = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                ru = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                rs = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [ru(r), ru(n), ru(o)]
                },
                rf = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return rc;
                    var t = rs(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                rp = rl(),
                rd = "data-scroll-locked",
                ry = function(e, t, r, n) {
                    var o = e.left,
                        a = e.top,
                        i = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(rd, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(i, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(t5, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(t4, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(t5, " .").concat(t5, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(t4, " .").concat(t4, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(rd, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                rm = function() {
                    var e = parseInt(document.body.getAttribute(rd) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                rb = function() {
                    eu.useEffect(function() {
                        return document.body.setAttribute(rd, (rm() + 1).toString()),
                            function() {
                                var e = rm() - 1;
                                e <= 0 ? document.body.removeAttribute(rd) : document.body.setAttribute(rd, e.toString())
                            }
                    }, [])
                },
                rv = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        o = void 0 === n ? "margin" : n;
                    rb();
                    var a = eu.useMemo(function() {
                        return rf(o)
                    }, [o]);
                    return eu.createElement(rp, {
                        styles: ry(a, !t, o, r ? "" : "!important")
                    })
                },
                rh = !1;
            if ("u" > typeof window) try {
                var rg = Object.defineProperty({}, "passive", {
                    get: function() {
                        return rh = !0, !0
                    }
                });
                window.addEventListener("test", rg, rg), window.removeEventListener("test", rg, rg)
            } catch (e) {
                rh = !1
            }
            var rO = !!rh && {
                passive: !1
            };

            function rw(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var rj = function(e, t) {
                    if (!rw(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                rx = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && rw(n, ShadowRoot) && (n = n.host), rS(e, n)) {
                            var o = rP(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                rS = function(e, t) {
                    return "v" === e ? rj(t, "overflowY") : rj(t, "overflowX")
                },
                rP = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                rE = function(e, t, r, n, o) {
                    var a, i = (a = window.getComputedStyle(t).direction, "h" === e && "rtl" === a ? -1 : 1),
                        l = i * n,
                        c = r.target,
                        u = t.contains(c),
                        s = !1,
                        f = l > 0,
                        p = 0,
                        d = 0;
                    do {
                        if (!c) break;
                        var y = rP(e, c),
                            m = y[0],
                            b = y[1] - y[2] - i * m;
                        (m || b) && rS(e, c) && (p += b, d += m);
                        var v = c.parentNode;
                        c = v && v.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? v.host : v
                    } while (!u && c !== document.body || u && (t.contains(c) || t === c));
                    return f && (o && 1 > Math.abs(p) || !o && l > p) ? s = !0 : !f && (o && 1 > Math.abs(d) || !o && -l > d) && (s = !0), s
                },
                rA = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                rC = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                rI = function(e) {
                    return e && "current" in e ? e.current : e
                },
                rR = 0,
                rN = [],
                rk = (c = function(e) {
                    var t = eu.useRef([]),
                        r = eu.useRef([0, 0]),
                        n = eu.useRef(),
                        o = eu.useState(rR++)[0],
                        a = eu.useState(rl)[0],
                        i = eu.useRef(e);
                    eu.useEffect(function() {
                        i.current = e
                    }, [e]), eu.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, o = 0, a = t.length; o < a; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(rI), !0).filter(Boolean);
                            return t.forEach(function(e) {
                                    return e.classList.add("allow-interactivity-".concat(o))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(o)), t.forEach(function(e) {
                                        return e.classList.remove("allow-interactivity-".concat(o))
                                    })
                                }
                        }
                    }, [e.inert, e.lockRef.current, e.shards]);
                    var l = eu.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !i.current.allowPinchZoom;
                            var o, a = rA(e),
                                l = r.current,
                                c = "deltaX" in e ? e.deltaX : l[0] - a[0],
                                u = "deltaY" in e ? e.deltaY : l[1] - a[1],
                                s = e.target,
                                f = Math.abs(c) > Math.abs(u) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var p = rx(f, s);
                            if (!p) return !0;
                            if (p ? o = f : (o = "v" === f ? "h" : "v", p = rx(f, s)), !p) return !1;
                            if (!n.current && "changedTouches" in e && (c || u) && (n.current = o), !o) return !0;
                            var d = n.current || o;
                            return rE(d, t, e, "h" === d ? c : u, !0)
                        }, []),
                        c = eu.useCallback(function(e) {
                            if (rN.length && rN[rN.length - 1] === a) {
                                var r = "deltaY" in e ? rC(e) : rA(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var o = (i.current.shards || []).map(rI).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !i.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        u = eu.useCallback(function(e, r, n, o) {
                            var a = {
                                name: e,
                                delta: r,
                                target: n,
                                should: o,
                                shadowParent: function(e) {
                                    for (var t, r, n = null; null !== e;) t = e, (null != (r = ShadowRoot) && "u" > typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r) && (n = e.host, e = e.host), e = e.parentNode;
                                    return n
                                }(n)
                            };
                            t.current.push(a), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== a
                                })
                            }, 1)
                        }, []),
                        s = eu.useCallback(function(e) {
                            r.current = rA(e), n.current = void 0
                        }, []),
                        f = eu.useCallback(function(t) {
                            u(t.type, rC(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        p = eu.useCallback(function(t) {
                            u(t.type, rA(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    eu.useEffect(function() {
                        return rN.push(a), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", c, rO), document.addEventListener("touchmove", c, rO), document.addEventListener("touchstart", s, rO),
                            function() {
                                rN = rN.filter(function(e) {
                                    return e !== a
                                }), document.removeEventListener("wheel", c, rO), document.removeEventListener("touchmove", c, rO), document.removeEventListener("touchstart", s, rO)
                            }
                    }, []);
                    var d = e.removeScrollBar,
                        y = e.inert;
                    return eu.createElement(eu.Fragment, null, y ? eu.createElement(a, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, d ? eu.createElement(rv, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, rt.useMedium(c), ro),
                rD = eu.forwardRef(function(e, t) {
                    return eu.createElement(rn, t6({}, e, {
                        ref: t,
                        sideCar: rk
                    }))
                });
            rD.classNames = rn.classNames;
            var rT = new WeakMap,
                rL = new WeakMap,
                rM = {},
                r_ = 0,
                rU = function(e) {
                    return e && (e.host || rU(e.parentNode))
                },
                rF = function(e, t, r, n) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = rU(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    rM[r] || (rM[r] = new WeakMap);
                    var a = rM[r],
                        i = [],
                        l = new Set,
                        c = new Set(o),
                        u = function(e) {
                            !e || l.has(e) || (l.add(e), u(e.parentNode))
                        };
                    o.forEach(u);
                    var s = function(e) {
                        !e || c.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (l.has(e)) s(e);
                            else try {
                                var t = e.getAttribute(n),
                                    o = null !== t && "false" !== t,
                                    c = (rT.get(e) || 0) + 1,
                                    u = (a.get(e) || 0) + 1;
                                rT.set(e, c), a.set(e, u), i.push(e), 1 === c && o && rL.set(e, !0), 1 === u && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), r_++,
                        function() {
                            i.forEach(function(e) {
                                var t = rT.get(e) - 1,
                                    o = a.get(e) - 1;
                                rT.set(e, t), a.set(e, o), t || (rL.has(e) || e.removeAttribute(n), rL.delete(e)), o || e.removeAttribute(r)
                            }), --r_ || (rT = new WeakMap, rT = new WeakMap, rL = new WeakMap, rM = {})
                        }
                },
                rB = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), rF(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function rK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rW(e) {
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

            function rz(e, t) {
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

            function rH(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function rV(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rK(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rK(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rX = "Dialog",
                rG = rV(tp(rX), 2),
                rq = rG[0];
            rG[1];
            var rY = rV(rq(rX), 2),
                r$ = rY[0],
                rZ = rY[1],
                rQ = function(e) {
                    var t = e.__scopeDialog,
                        r = e.children,
                        n = e.open,
                        o = e.defaultOpen,
                        a = e.onOpenChange,
                        i = e.modal,
                        l = eu.useRef(null),
                        c = eu.useRef(null),
                        u = rV(tx({
                            prop: n,
                            defaultProp: o,
                            onChange: a
                        }), 2),
                        s = u[0],
                        f = u[1];
                    return (0, G.jsx)(r$, {
                        scope: t,
                        triggerRef: l,
                        contentRef: c,
                        contentId: th(),
                        titleId: th(),
                        descriptionId: th(),
                        open: void 0 !== s && s,
                        onOpenChange: f,
                        onOpenToggle: eu.useCallback(function() {
                            return f(function(e) {
                                return !e
                            })
                        }, [f]),
                        modal: void 0 === i || i,
                        children: r
                    })
                };
            rQ.displayName = rX;
            var rJ = "DialogTrigger";
            eu.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = rH(e, ["__scopeDialog"]),
                    o = rZ(rJ, r),
                    a = ti(t, o.triggerRef);
                return (0, G.jsx)(tU.button, rz(rW({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": nu(o.open)
                }, n), {
                    ref: a,
                    onClick: tr(e.onClick, o.onOpenToggle)
                }))
            }).displayName = rJ;
            var r0 = "DialogPortal",
                r1 = rV(rq(r0, {
                    forceMount: void 0
                }), 2),
                r2 = r1[0],
                r3 = r1[1],
                r6 = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        a = rZ(r0, t);
                    return (0, G.jsx)(r2, {
                        scope: t,
                        forceMount: r,
                        children: eu.Children.map(n, function(e) {
                            return (0, G.jsx)(t1, {
                                present: r || a.open,
                                children: (0, G.jsx)(tQ, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            r6.displayName = r0;
            var r8 = "DialogOverlay",
                r5 = eu.forwardRef(function(e, t) {
                    var r = r3(r8, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = rH(e, ["forceMount"]),
                        i = rZ(r8, e.__scopeDialog);
                    return i.modal ? (0, G.jsx)(t1, {
                        present: o || i.open,
                        children: (0, G.jsx)(r7, rz(rW({}, a), {
                            ref: t
                        }))
                    }) : null
                });
            r5.displayName = r8;
            var r4 = tk("DialogOverlay.RemoveScroll"),
                r7 = eu.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = rH(e, ["__scopeDialog"]),
                        o = rZ(r8, r);
                    return (0, G.jsx)(rD, {
                        as: r4,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, G.jsx)(tU.div, rz(rW({
                            "data-state": nu(o.open)
                        }, n), {
                            ref: t,
                            style: rW({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                r9 = "DialogContent",
                ne = eu.forwardRef(function(e, t) {
                    var r = r3(r9, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = rH(e, ["forceMount"]),
                        i = rZ(r9, e.__scopeDialog);
                    return (0, G.jsx)(t1, {
                        present: o || i.open,
                        children: i.modal ? (0, G.jsx)(nt, rz(rW({}, a), {
                            ref: t
                        })) : (0, G.jsx)(nr, rz(rW({}, a), {
                            ref: t
                        }))
                    })
                });
            ne.displayName = r9;
            var nt = eu.forwardRef(function(e, t) {
                    var r = rZ(r9, e.__scopeDialog),
                        n = eu.useRef(null),
                        o = ti(t, r.contentRef, n);
                    return eu.useEffect(function() {
                        var e = n.current;
                        if (e) return rB(e)
                    }, []), (0, G.jsx)(nn, rz(rW({}, e), {
                        ref: o,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: tr(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: tr(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: tr(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                nr = eu.forwardRef(function(e, t) {
                    var r = rZ(r9, e.__scopeDialog),
                        n = eu.useRef(!1),
                        o = eu.useRef(!1);
                    return (0, G.jsx)(nn, rz(rW({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var a, i;
                            null == (a = e.onCloseAutoFocus) || a.call(e, t), t.defaultPrevented || (n.current || null == (i = r.triggerRef.current) || i.focus(), t.preventDefault()), n.current = !1, o.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (a = e.onInteractOutside) || a.call(e, t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                            var a, i, l = t.target;
                            (null == (i = r.triggerRef.current) ? void 0 : i.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                        }
                    }))
                }),
                nn = eu.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        i = rH(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = rZ(r9, r),
                        c = eu.useRef(null),
                        u = ti(t, c);
                    return (0, t3.useFocusGuards)(), (0, G.jsxs)(G.Fragment, {
                        children: [(0, G.jsx)(tV, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: a,
                            children: (0, G.jsx)(tS.DismissableLayer, rz(rW({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": nu(l.open)
                            }, i), {
                                ref: u,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, G.jsxs)(G.Fragment, {
                            children: [(0, G.jsx)(nd, {
                                titleId: l.titleId
                            }), (0, G.jsx)(ny, {
                                contentRef: c,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                no = "DialogTitle",
                na = eu.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = rH(e, ["__scopeDialog"]),
                        o = rZ(no, r);
                    return (0, G.jsx)(tU.h2, rz(rW({
                        id: o.titleId
                    }, n), {
                        ref: t
                    }))
                });
            na.displayName = no;
            var ni = "DialogDescription";
            eu.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = rH(e, ["__scopeDialog"]),
                    o = rZ(ni, r);
                return (0, G.jsx)(tU.p, rz(rW({
                    id: o.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = ni;
            var nl = "DialogClose",
                nc = eu.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = rH(e, ["__scopeDialog"]),
                        o = rZ(nl, r);
                    return (0, G.jsx)(tU.button, rz(rW({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: tr(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function nu(e) {
                return e ? "open" : "closed"
            }
            nc.displayName = nl;
            var ns = "DialogTitleWarning",
                nf = rV((u = {
                    contentName: r9,
                    titleName: no,
                    docsSlug: "dialog"
                }, s = eu.createContext(u), (f = function(e) {
                    var t = e.children,
                        r = ts(e, ["children"]),
                        n = eu.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, G.jsx)(s.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = ns + "Provider", [f, function(e) {
                    var t = eu.useContext(s);
                    if (t) return t;
                    if (void 0 !== u) return u;
                    throw Error("`".concat(e, "` must be used within `").concat(ns, "`"))
                }]), 2),
                np = (nf[0], nf[1]),
                nd = function(e) {
                    var t = e.titleId,
                        r = np(ns),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return eu.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                ny = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = np("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return eu.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(o))
                    }, [o, t, r]), null
                };

            function nm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nb(e) {
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

            function nv(e, t) {
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

            function nh(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function ng(e) {
                return function(e) {
                    if (Array.isArray(e)) return nm(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nm(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nm(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nO(e) {
                var t, r, n = (t = e, (r = eu.forwardRef(function(e, t) {
                        var r = e.children,
                            n = nh(e, ["children"]);
                        if (eu.isValidElement(r)) {
                            var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = nb({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = a.apply(void 0, ng(t));
                                            return o.apply(void 0, ng(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = nb({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return nb({}, e, r)
                                }(n, r.props);
                            return r.type !== eu.Fragment && (s.ref = t ? ta(t, u) : u), eu.cloneElement(r, s)
                        }
                        return eu.Children.count(r) > 1 ? eu.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = eu.forwardRef(function(e, t) {
                        var r = e.children,
                            o = nh(e, ["children"]),
                            a = eu.Children.toArray(r),
                            i = a.find(nj);
                        if (i) {
                            var l = i.props.children,
                                c = a.map(function(e) {
                                    return e !== i ? e : eu.Children.count(l) > 1 ? eu.Children.only(null) : eu.isValidElement(l) ? l.props.children : null
                                });
                            return (0, G.jsx)(n, nv(nb({}, o), {
                                ref: t,
                                children: eu.isValidElement(l) ? eu.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, G.jsx)(n, nv(nb({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var nw = Symbol("radix.slottable");

            function nj(e) {
                return eu.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nw
            }

            function nx(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function nS(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        nx(e, t, r[t])
                    })
                }
                return e
            }

            function nP(e, t) {
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
            var nE = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r = nO("Primitive.".concat(t)),
                    n = eu.forwardRef(function(e, n) {
                        var o = e.asChild,
                            a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }(e, ["asChild"]),
                            i = o ? r : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, G.jsx)(i, nP(nS({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), nP(nS({}, e), nx({}, t, n))
            }, {});

            function nA(e) {
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
            var nC = Object.freeze({
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
                nI = eu.forwardRef(function(e, t) {
                    var r, n;
                    return (0, G.jsx)(nE.span, (r = nA({}, e), n = n = {
                        ref: t,
                        style: nA({}, nC, e.style)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function nR(e) {
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

            function nN(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }
            nI.displayName = "VisuallyHidden";
            var nk = (0, eu.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                nD = function() {
                    var e = (0, eu.useContext)(nk);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                nT = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                nL = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                nM = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                n_ = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.children,
                        o = e.size,
                        a = e.type,
                        i = void 0 === a ? "Default" : a,
                        l = e.isModal,
                        c = e.hasCloseAffordance,
                        u = e.closeLabel,
                        s = e.hasMarginTop,
                        f = void 0 === s || s,
                        p = e.hasMarginBottom,
                        d = void 0 === p || p,
                        y = e.hasDescription,
                        m = void 0 !== y && y,
                        b = e.experimentalDisablePointerEventsStylingOnBody,
                        v = void 0 !== b && b,
                        h = (0, eu.useMemo)(function() {
                            return {
                                size: o,
                                isModal: l,
                                type: i,
                                hasCloseAffordance: c,
                                closeLabel: u,
                                hasMarginTop: f,
                                hasMarginBottom: d,
                                hasDescription: m
                            }
                        }, [o, l, i, c, u, f, d, m]);
                    return (0, eu.useEffect)(function() {
                        v && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [v, t]), es().createElement(nk.Provider, {
                        value: h
                    }, es().createElement(rQ, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            n_.displayName = "Dialog";
            var nU = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    o = e.overlayClassName,
                    a = e.overlayStyle,
                    i = e.onOpenAutoFocus,
                    l = nN(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = nD(),
                    u = c.size,
                    s = c.isModal,
                    f = c.hasCloseAffordance,
                    p = c.closeLabel,
                    d = c.hasDescription,
                    y = e0("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
                    m = e0("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return es().createElement(r6, null, es().createElement(r5, {
                    className: y,
                    style: a
                }, es().createElement(ne, nR({
                    className: m,
                    "data-size": u,
                    style: n,
                    onOpenAutoFocus: i
                }, !d && {
                    "aria-describedby": void 0
                }, l), f && es().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, es().createElement(nc, {
                    asChild: !0
                }, es().createElement(tt, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": p
                }))), t)))
            };
            nU.displayName = "DialogContent";
            var nF = function(e) {
                var t = e.children,
                    r = e.className,
                    n = nN(e, ["children", "className"]),
                    o = nD(),
                    a = o.size,
                    i = o.hasMarginTop,
                    l = o.hasMarginBottom,
                    c = e0(nT[a], i && nL[a], l && nM[a], r);
                return es().createElement("div", nR({
                    className: c
                }, n), t)
            };
            nF.displayName = "DialogBody";
            var nB = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    o = nN(e, ["children", "className", "hidden"]),
                    a = es().createElement(na, nR({
                        className: r
                    }, o), t);
                return n ? es().createElement(nI, null, a) : a
            };
            nB.displayName = "DialogTitle";
            var nK = function(e) {
                var t = e.children,
                    r = e.className,
                    n = nN(e, ["children", "className"]),
                    o = nD().size,
                    a = e0(nT[o], nM[o], r);
                return es().createElement("div", nR({
                    className: a
                }, n), t)
            };
            nK.displayName = "DialogFooter";
            var nW = function(e) {
                var t = e.width,
                    r = e.height;
                return es().createElement("svg", {
                    className: "foundation-web-loading-spinner",
                    width: t,
                    height: r,
                    viewBox: "0 0 20 20",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg"
                }, es().createElement("path", {
                    fillRule: "evenodd",
                    clipRule: "evenodd",
                    fill: "currentColor",
                    d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                }))
            };

            function nz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nH(e) {
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

            function nV(e, t) {
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

            function nX(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function nG(e) {
                return function(e) {
                    if (Array.isArray(e)) return nz(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nz(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nz(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nq(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var nY = Symbol.for("react.lazy"),
                n$ = eu[" use ".trim().toString()];

            function nZ(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : nq(e)) === "object" && "$$typeof" in e && e.$$typeof === nY && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : nq(t)) === "object" && null !== t && "then" in t
            }
            var nQ = ((t = eu.forwardRef(function(e, t) {
                    var r = e.children,
                        n = nX(e, ["children"]);
                    if (nZ(r) && "function" == typeof n$ && (r = n$(r._payload)), eu.isValidElement(r)) {
                        var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = nH({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = a.apply(void 0, nG(t));
                                        return o.apply(void 0, nG(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = nH({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                }(n);
                                return nH({}, e, r)
                            }(n, r.props);
                        return r.type !== eu.Fragment && (s.ref = t ? ta(t, u) : u), eu.cloneElement(r, s)
                    }
                    return eu.Children.count(r) > 1 ? eu.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), p = t, (d = eu.forwardRef(function(e, t) {
                    var r = e.children,
                        n = nX(e, ["children"]);
                    nZ(r) && "function" == typeof n$ && (r = n$(r._payload));
                    var o = eu.Children.toArray(r),
                        a = o.find(n0);
                    if (a) {
                        var i = a.props.children,
                            l = o.map(function(e) {
                                return e !== a ? e : eu.Children.count(i) > 1 ? eu.Children.only(null) : eu.isValidElement(i) ? i.props.children : null
                            });
                        return (0, G.jsx)(p, nV(nH({}, n), {
                            ref: t,
                            children: eu.isValidElement(i) ? eu.cloneElement(i, void 0, l) : null
                        }))
                    }
                    return (0, G.jsx)(p, nV(nH({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), d),
                nJ = Symbol("radix.slottable");

            function n0(e) {
                return eu.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nJ
            }

            function n1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n2(e) {
                if (Array.isArray(e)) return e
            }

            function n3() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function n6(e) {
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

            function n8(e, t) {
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

            function n5(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function n4(e, t) {
                if (e) {
                    if ("string" == typeof e) return n1(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return n1(e, t)
                }
            }
            var n7 = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                n9 = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                oe = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                ot = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                or = (0, eu.forwardRef)(function(e, t) {
                    var r, n = n2(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || n4(r) || n3(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.children,
                        l = o.className,
                        c = o.style,
                        u = o.isDisabled,
                        s = void 0 !== u && u,
                        f = o.isLoading,
                        p = void 0 !== f && f,
                        d = o.icon,
                        y = o.size,
                        m = void 0 === y ? "Large" : y,
                        b = o.variant,
                        v = void 0 === b ? "Emphasis" : b,
                        h = o.asChild,
                        g = n5(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        O = (n2(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || n4(a, 1) || n3())[0],
                        w = e0("foundation-web-button", s ? "opacity-[0.5]" : [e1, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", n9[m], s ? ot[v] : oe[v], l),
                        j = n6({
                            textDecoration: "none"
                        }, c),
                        x = function(e) {
                            return es().createElement(es().Fragment, null, es().createElement(e2, null), p && es().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, es().createElement(nW, {
                                width: n7[m],
                                height: n7[m]
                            })), es().createElement("span", {
                                className: e0("flex items-center min-width-0", "Large" === m || "Medium" === m ? "gap-small" : "gap-xsmall", p && "invisible")
                            }, d && es().createElement(e7, {
                                name: d,
                                size: m
                            }), es().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (h) {
                        g.as;
                        var S = n5(g, ["as"]),
                            P = es().Children.only(i);
                        return es().createElement(nQ, n8(n6({
                            ref: O
                        }, S), {
                            className: w,
                            style: j,
                            "aria-disabled": s || void 0
                        }), es().cloneElement(P, {}, x(P.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var E = g.href,
                            A = n5(g, ["as", "href"]);
                        return es().createElement("a", n8(n6({
                            ref: O
                        }, A), {
                            "aria-disabled": s,
                            href: s ? void 0 : E,
                            className: w,
                            style: j
                        }), x(i))
                    }
                    g.as;
                    var C = n5(g, ["as"]);
                    return es().createElement("button", n8(n6({
                        ref: O,
                        type: "button"
                    }, C), {
                        disabled: s,
                        className: w,
                        style: j
                    }), x(i))
                }),
                on = window.Roblox["core-scripts"].http.http,
                oo = function(e, t) {
                    var r = "".concat(eD().apiGatewayUrl, "/access-management/v1/upsell-feature-access"),
                        n = new URLSearchParams({
                            featureName: e,
                            namespace: t
                        });
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(r, "?").concat(n.toString())
                    }
                };

            function oa(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function oi(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            oa(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            oa(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function ol(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: c(0)
                }), l(i, "throw", {
                    value: c(1)
                }), l(i, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < o[1]) {
                                        a.label = o[1], o = u;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(u);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function oc(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var ou = function(e, t) {
                    var r;
                    return (r = function() {
                        var r;
                        return function(e, t) {
                            var r, n, o, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(i, "next", {
                                value: c(0)
                            }), l(i, "throw", {
                                value: c(1)
                            }), l(i, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), i;

                            function c(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    a.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && a.label < o[1]) {
                                                    a.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && a.label < o[2]) {
                                                    a.label = o[2], a.ops.push(u);
                                                    break
                                                }
                                                o[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, a)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return r = oo(e, t), [4, on.get(r)];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(n, o) {
                            var a = r.apply(e, t);

                            function i(e) {
                                oc(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                oc(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                },
                os = '<a href="https://en.help.roblox.com/hc/articles/28943243301780" target="_blank" rel="noreferrer" class="text-link">',
                of = "<a href=",
                op = function(e) {
                    return " onclick=\"if(window.location.pathname.includes('/my/account')){event.preventDefault();window.location.href='".concat(e, '\';window.location.reload();}" class="text-link">')
                },
                od = "</a>",
                oy = "<br />";

            function om(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var ob = function(e) {
                var t = e.showModal,
                    r = e.onModalClose,
                    n = e.translate,
                    o = e.intl,
                    a = (0, q.useQuery)({
                        queryKey: ["yourPrivacyChoicesModal"],
                        queryFn: function() {
                            var e;
                            return (e = function() {
                                var e, t, r, n, o, a;
                                return function(e, t) {
                                    var r, n, o, a = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & o[0]) throw o[1];
                                                return o[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        l = Object.defineProperty;
                                    return l(i, "next", {
                                        value: c(0)
                                    }), l(i, "throw", {
                                        value: c(1)
                                    }), l(i, "return", {
                                        value: c(2)
                                    }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), i;

                                    function c(l) {
                                        return function(c) {
                                            var u = [l, c];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                                if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                                switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                                    case 0:
                                                    case 1:
                                                        o = u;
                                                        break;
                                                    case 4:
                                                        return a.label++, {
                                                            value: u[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        a.label++, n = u[1], u = [0];
                                                        continue;
                                                    case 7:
                                                        u = a.ops.pop(), a.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                            a = 0;
                                                            continue
                                                        }
                                                        if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                            a.label = u[1];
                                                            break
                                                        }
                                                        if (6 === u[0] && a.label < o[1]) {
                                                            a.label = o[1], o = u;
                                                            break
                                                        }
                                                        if (o && a.label < o[2]) {
                                                            a.label = o[2], a.ops.push(u);
                                                            break
                                                        }
                                                        o[2] && a.ops.pop(), a.trys.pop();
                                                        continue
                                                }
                                                u = t.call(e, a)
                                            } catch (e) {
                                                u = [6, e], n = 0
                                            } finally {
                                                r = o = 0
                                            }
                                            if (5 & u[0]) throw u[1];
                                            return {
                                                value: u[0] ? u[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            if (r = null != (e = null == (t = (0, eH.authenticatedUser)()) ? void 0 : t.isAuthenticated) && e, n = !!navigator.globalPrivacyControl, !r) return [3, 2];
                                            return [4, oi(function() {
                                                var e;
                                                return ol(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return e = {
                                                                withCredentials: !0,
                                                                url: "".concat(eD().userSettingsApi, "/v1/user-settings/gpc")
                                                            }, [4, on.post(e)];
                                                        case 1:
                                                            return t.sent(), [2]
                                                    }
                                                })
                                            })()];
                                        case 1:
                                            i.sent(), i.label = 2;
                                        case 2:
                                            if (o = !1, !r) return [3, 4];
                                            return [4, ou("ShouldShowAdsSettings", "account_management/UserSettingsPolicy")];
                                        case 3:
                                            o = "Granted" === i.sent().access, i.label = 4;
                                        case 4:
                                            if (a = !1, !r) return [3, 6];
                                            return [4, oi(function() {
                                                return ol(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            return [4, on.get({
                                                                retryable: !0,
                                                                withCredentials: !0,
                                                                url: "".concat(eD().userSettingsApi, "/v1/user-settings")
                                                            })];
                                                        case 1:
                                                            return [2, e.sent().data]
                                                    }
                                                })
                                            })()];
                                        case 5:
                                            a = "Enabled" === i.sent().allowSellShareData, i.label = 6;
                                        case 6:
                                            return [2, {
                                                isGpcDetected: n,
                                                canUserManageAdsSettings: o,
                                                isAdsSellShareDataEnabled: a
                                            }]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    r = arguments;
                                return new Promise(function(n, o) {
                                    var a = e.apply(t, r);

                                    function i(e) {
                                        om(a, n, o, i, l, "next", e)
                                    }

                                    function l(e) {
                                        om(a, n, o, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        },
                        enabled: t,
                        cacheTime: 0
                    }),
                    i = a.data,
                    l = a.isLoading,
                    c = a.isError;
                return (0, G.jsx)(n_, {
                    open: t,
                    onOpenChange: r,
                    size: "Small",
                    isModal: !0,
                    hasCloseAffordance: !0,
                    closeLabel: "Action.Close",
                    children: (0, G.jsx)(nU, {
                        children: (0, G.jsxs)(es().Fragment, {
                            children: [(0, G.jsxs)(nF, {
                                children: [l ? (0, G.jsx)(nB, {
                                    hidden: !0,
                                    className: "text-heading-small",
                                    children: n("Description.Loading")
                                }) : (0, G.jsx)(nB, {
                                    className: "text-heading-small",
                                    children: c ? n("Title.Error") : i.isGpcDetected ? n("Title.GpcDetected") : n("Title.NoGpcDetected")
                                }), function() {
                                    if (l) return (0, G.jsx)(eb.Loading, {});
                                    var e, t = (e = o.getRobloxLocale(), (0, eJ.getUrlWithLocale)("/my/account#!/privacy/AdPreferences", e)),
                                        r = n("Body.Error"),
                                        a = n("Body.GpcMissingSettingIneligible", {
                                            lineBreak: oy,
                                            aTagStart: os,
                                            aTagEnd: od
                                        }),
                                        u = n("Body.GpcMissingSettingEligible", {
                                            lineBreak: oy,
                                            aTagWithHref: of,
                                            link: t,
                                            hrefEnd: op(t),
                                            aTagEnd: od
                                        }),
                                        s = n("Body.GpcDetectedSettingEnabledIneligible", {
                                            lineBreak: oy,
                                            aTagStart: os,
                                            aTagEnd: od
                                        }),
                                        f = n("Body.GpcDetectedSettingEnabledEligible", {
                                            lineBreak: oy,
                                            aTagWithHref: of,
                                            link: t,
                                            hrefEnd: op(t),
                                            aTagEnd: od
                                        }),
                                        p = n("Body.GpcDetectedSettingDisabledIneligible", {
                                            lineBreak: oy,
                                            aTagStart: os,
                                            aTagEnd: od
                                        }),
                                        d = n("Body.GpcDetectedSettingDisabledEligible", {
                                            lineBreak: oy,
                                            aTagWithHref: of,
                                            link: t,
                                            hrefEnd: op(t),
                                            aTagEnd: od
                                        }),
                                        y = c ? r : i.isGpcDetected ? i.isAdsSellShareDataEnabled ? i.canUserManageAdsSettings ? f : s : i.canUserManageAdsSettings ? d : p : i.canUserManageAdsSettings ? u : a;
                                    return (0, G.jsx)("div", {
                                        className: "text-body-medium",
                                        dangerouslySetInnerHTML: {
                                            __html: y
                                        }
                                    })
                                }()]
                            }), !l && (0, G.jsx)(nK, {
                                className: "width-full",
                                children: (0, G.jsx)(or, {
                                    className: "width-full",
                                    size: "Large",
                                    variant: "Emphasis",
                                    onClick: r,
                                    children: n("Action.Ok")
                                })
                            })]
                        })
                    })
                })
            };

            function ov(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var oh = function() {
                var e;
                return (e = function() {
                    return function(e, t) {
                        var r, n, o, a = {
                                label: 0,
                                sent: function() {
                                    if (1 & o[0]) throw o[1];
                                    return o[1]
                                },
                                trys: [],
                                ops: []
                            },
                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            l = Object.defineProperty;
                        return l(i, "next", {
                            value: c(0)
                        }), l(i, "throw", {
                            value: c(1)
                        }), l(i, "return", {
                            value: c(2)
                        }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), i;

                        function c(l) {
                            return function(c) {
                                var u = [l, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                    if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                    switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, n = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                a.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && a.label < o[1]) {
                                                a.label = o[1], o = u;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(u);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, a)
                                } catch (e) {
                                    u = [6, e], n = 0
                                } finally {
                                    r = o = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(e) {
                        switch (e.label) {
                            case 0:
                                return e.trys.push([0, 2, , 3]), [4, (0, eX.callBehaviour)("footer-ui")];
                            case 1:
                                return [2, e.sent().IsPrivacyChoiceModalEnabled];
                            case 2:
                                return e.sent(), [2, !1];
                            case 3:
                                return [2]
                        }
                    })
                }, function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            ov(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            ov(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                })()
            };

            function og(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oO(e) {
                var t, r = e.translate,
                    n = e.intl,
                    o = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, eu.useState)(!1)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return og(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return og(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    a = o[0],
                    i = o[1],
                    l = (0, q.useQuery)({
                        queryKey: ["isYourPrivacyChoicesModalEnabled"],
                        queryFn: oh,
                        placeholderData: !1
                    }).data,
                    c = J,
                    u = !1,
                    s = document.getElementById("footer-container");
                if (null != s) {
                    var f = s.getAttribute("data-is-giftcards-footer-enabled");
                    null != f && (u = "true" === f.toLowerCase())
                }
                u && (c = ee);
                var p = c.map(function(e) {
                    return (0, G.jsx)("li", {
                        className: "footer-link",
                        children: "your-privacy-choices" === e.name && l ? (0, G.jsxs)("button", {
                            onClick: function() {
                                return i(!0)
                            },
                            className: "text-footer-nav footer-button-link",
                            type: "button",
                            children: [r(e.labelTranslationKey), (0, G.jsx)("img", {
                                src: e.postfixIcon,
                                alt: "",
                                className: "footer-postfixIcon"
                            })]
                        }) : (0, G.jsxs)("a", {
                            href: ei.urlService.getUrlWithLocale(e.path, n.getRobloxLocale()),
                            className: ep()("text-footer-nav", e.cssClass),
                            target: "_blank",
                            rel: "noreferrer",
                            onClick: function(t) {
                                var r;
                                return r = e.name, void(0, ed.sendEventWithTarget)("PageFooter", "click", {
                                    destination: "".concat(r),
                                    source: "".concat(t.currentTarget.ownerDocument.location.pathname)
                                }, ed.targetTypes.WWW)
                            },
                            children: [r(e.labelTranslationKey), e.postfixIcon ? (0, G.jsx)("img", {
                                src: e.postfixIcon,
                                alt: "",
                                className: "footer-postfixIcon"
                            }) : ""]
                        })
                    }, e.name)
                });
                return (0, G.jsxs)(es().Fragment, {
                    children: [(0, G.jsxs)("ul", {
                        className: "row footer-links flex flex-wrap justify-center padding-bottom-xxsmall",
                        children: [p, (0, G.jsx)("li", {
                            children: (0, G.jsx)(eQ, {
                                translate: r
                            })
                        })]
                    }), (0, G.jsx)(ob, {
                        showModal: a,
                        onModalClose: function() {
                            return i(!1)
                        },
                        translate: r,
                        intl: n
                    })]
                })
            }
            oO.propTypes = {
                translate: er().func.isRequired,
                intl: er().shape({
                    getRobloxLocale: er().func.isRequired
                }).isRequired
            };
            var ow = window.CoreRobloxUtilities,
                oj = 0,
                ox = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, eu.useRef)();
                    return t.current || (oj += 1, t.current = "".concat(e).concat(oj)), t.current
                };

            function oS(e) {
                var t = e.className;
                return es().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: e0("block", t),
                    style: {
                        marginTop: -1
                    }
                }, es().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function oP(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function oE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oA(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function oC() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = oA(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : oA(t[e], null)
                        }
                    }
                }
            }

            function oI() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return eu.useCallback(oC.apply(void 0, function(e) {
                    if (Array.isArray(e)) return oE(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return oE(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oE(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function oR(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oN(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ok(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        oN(e, t, r[t])
                    })
                }
                return e
            }

            function oD(e) {
                return function(e) {
                    if (Array.isArray(e)) return oR(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return oR(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oR(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oT(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return eu.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return eu.useMemo(function() {
                                var t, o;
                                return oN({}, "__scope".concat(e), (t = ok({}, r), o = null != (o = oN({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                                    var t = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        t.push.apply(t, r)
                                    }
                                    return t
                                })(Object(o)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(o, e))
                                }), t))
                            }, [r, n])
                        }
                    };
                return n.scopeName = e, [function(t, n) {
                    var o = eu.createContext(n),
                        a = r.length;
                    r = oD(r).concat([n]);
                    var i = function(t) {
                        var r, n = t.scope,
                            i = t.children,
                            l = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }(t, ["scope", "children"]),
                            c = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                            u = eu.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, G.jsx)(c.Provider, {
                            value: u,
                            children: i
                        })
                    };
                    return i.displayName = t + "Provider", [i, function(r, i) {
                        var l, c = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                            u = eu.useContext(c);
                        if (u) return u;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, oL.apply(void 0, [n].concat(oD(t)))]
            }

            function oL() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var n = t[0];
                if (1 === t.length) return n;
                var o = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var r = e.reduce(function(e, r) {
                            var n = r.useScope,
                                o = r.scopeName;
                            return ok({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return eu.useMemo(function() {
                            return oN({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var oM = (null == (X = globalThis) ? void 0 : X.document) ? eu.useLayoutEffect : function() {};

            function o_(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var oU = eu["useId".toString()] || function() {},
                oF = 0,
                oB = ["top", "right", "bottom", "left"],
                oK = Math.min,
                oW = Math.max,
                oz = Math.round,
                oH = Math.floor,
                oV = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                oX = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                oG = {
                    start: "end",
                    end: "start"
                };

            function oq(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function oY(e) {
                return e.split("-")[0]
            }

            function o$(e) {
                return e.split("-")[1]
            }

            function oZ(e) {
                return "x" === e ? "y" : "x"
            }

            function oQ(e) {
                return "y" === e ? "height" : "width"
            }
            var oJ = new Set(["top", "bottom"]);

            function o0(e) {
                return oJ.has(oY(e)) ? "y" : "x"
            }

            function o1(e) {
                return e.replace(/start|end/g, function(e) {
                    return oG[e]
                })
            }
            var o2 = ["left", "right"],
                o3 = ["right", "left"],
                o6 = ["top", "bottom"],
                o8 = ["bottom", "top"];

            function o5(e) {
                return e.replace(/left|right|bottom|top/g, function(e) {
                    return oX[e]
                })
            }

            function o4(e) {
                return "number" != typeof e ? function(e) {
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
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0
                }, e) : {
                    top: e,
                    right: e,
                    bottom: e,
                    left: e
                }
            }

            function o7(e) {
                var t = e.x,
                    r = e.y,
                    n = e.width,
                    o = e.height;
                return {
                    width: n,
                    height: o,
                    top: r,
                    left: t,
                    right: t + n,
                    bottom: r + o,
                    x: t,
                    y: r
                }
            }

            function o9(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ae(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function at(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            ae(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            ae(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function ar(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function an(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        ar(e, t, r[t])
                    })
                }
                return e
            }

            function ao(e, t) {
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

            function aa(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function ai(e) {
                return function(e) {
                    if (Array.isArray(e)) return o9(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return o9(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o9(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function al(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: c(0)
                }), l(i, "throw", {
                    value: c(1)
                }), l(i, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < o[1]) {
                                        a.label = o[1], o = u;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(u);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function ac(e, t, r) {
                var n, o = e.reference,
                    a = e.floating,
                    i = o0(t),
                    l = oZ(o0(t)),
                    c = oQ(l),
                    u = oY(t),
                    s = "y" === i,
                    f = o.x + o.width / 2 - a.width / 2,
                    p = o.y + o.height / 2 - a.height / 2,
                    d = o[c] / 2 - a[c] / 2;
                switch (u) {
                    case "top":
                        n = {
                            x: f,
                            y: o.y - a.height
                        };
                        break;
                    case "bottom":
                        n = {
                            x: f,
                            y: o.y + o.height
                        };
                        break;
                    case "right":
                        n = {
                            x: o.x + o.width,
                            y: p
                        };
                        break;
                    case "left":
                        n = {
                            x: o.x - a.width,
                            y: p
                        };
                        break;
                    default:
                        n = {
                            x: o.x,
                            y: o.y
                        }
                }
                switch (o$(t)) {
                    case "start":
                        n[l] -= d * (r && s ? -1 : 1);
                        break;
                    case "end":
                        n[l] += d * (r && s ? -1 : 1)
                }
                return n
            }

            function au(e, t) {
                return at(function() {
                    var r, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, O, w, j, x, S, P, E, A, C, I, R, N, k;
                    return al(this, function(D) {
                        switch (D.label) {
                            case 0:
                                return void 0 === t && (t = {}), n = e.x, o = e.y, a = e.platform, i = e.rects, l = e.elements, c = e.strategy, f = void 0 === (s = (u = oq(t, e)).boundary) ? "clippingAncestors" : s, d = void 0 === (p = u.rootBoundary) ? "viewport" : p, m = void 0 === (y = u.elementContext) ? "floating" : y, v = void 0 !== (b = u.altBoundary) && b, g = o4(void 0 === (h = u.padding) ? 0 : h), O = "floating" === m ? "reference" : "floating", w = l[v ? O : m], x = a.getClippingRect, S = {}, [4, null == a.isElement ? void 0 : a.isElement(w)];
                            case 1:
                                if (!(null == (r = D.sent()) || r)) return [3, 2];
                                return P = w, [3, 5];
                            case 2:
                                if (E = w.contextElement) return [3, 4];
                                return [4, null == a.getDocumentElement ? void 0 : a.getDocumentElement(l.floating)];
                            case 3:
                                E = D.sent(), D.label = 4;
                            case 4:
                                P = E, D.label = 5;
                            case 5:
                                return [4, x.apply(a, [(S.element = P, S.boundary = f, S.rootBoundary = d, S.strategy = c, S)])];
                            case 6:
                                return j = o7.apply(void 0, [D.sent()]), A = "floating" === m ? {
                                    x: n,
                                    y: o,
                                    width: i.floating.width,
                                    height: i.floating.height
                                } : i.reference, [4, null == a.getOffsetParent ? void 0 : a.getOffsetParent(l.floating)];
                            case 7:
                                return C = D.sent(), [4, null == a.isElement ? void 0 : a.isElement(C)];
                            case 8:
                                if (!D.sent()) return [3, 10];
                                return [4, null == a.getScale ? void 0 : a.getScale(C)];
                            case 9:
                                return R = D.sent() || {
                                    x: 1,
                                    y: 1
                                }, [3, 11];
                            case 10:
                                R = {
                                    x: 1,
                                    y: 1
                                }, D.label = 11;
                            case 11:
                                if (I = R, !a.convertOffsetParentRelativeRectToViewportRelativeRect) return [3, 13];
                                return [4, a.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: l,
                                    rect: A,
                                    offsetParent: C,
                                    strategy: c
                                })];
                            case 12:
                                return k = D.sent(), [3, 14];
                            case 13:
                                k = A, D.label = 14;
                            case 14:
                                return N = o7.apply(void 0, [k]), [2, {
                                    top: (j.top - N.top + g.top) / I.y,
                                    bottom: (N.bottom - j.bottom + g.bottom) / I.y,
                                    left: (j.left - N.left + g.left) / I.x,
                                    right: (N.right - j.right + g.right) / I.x
                                }]
                        }
                    })
                })()
            }

            function as(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function af(e) {
                return oB.some(function(t) {
                    return e[t] >= 0
                })
            }
            var ap = new Set(["left", "top"]);

            function ad(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function ay() {
                return "u" > typeof window
            }

            function am(e) {
                return ah(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function ab(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function av(e) {
                var t;
                return null == (t = (ah(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function ah(e) {
                return !!ay() && (ad(e, Node) || ad(e, ab(e).Node))
            }

            function ag(e) {
                return !!ay() && (ad(e, Element) || ad(e, ab(e).Element))
            }

            function aO(e) {
                return !!ay() && (ad(e, HTMLElement) || ad(e, ab(e).HTMLElement))
            }

            function aw(e) {
                return !(!ay() || "u" < typeof ShadowRoot) && (ad(e, ShadowRoot) || ad(e, ab(e).ShadowRoot))
            }
            var aj = new Set(["inline", "contents"]);

            function ax(e) {
                var t = aT(e),
                    r = t.overflow,
                    n = t.overflowX,
                    o = t.overflowY,
                    a = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + o + n) && !aj.has(a)
            }
            var aS = new Set(["table", "td", "th"]),
                aP = [":popover-open", ":modal"];

            function aE(e) {
                return aP.some(function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                })
            }
            var aA = ["transform", "translate", "scale", "rotate", "perspective"],
                aC = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                aI = ["paint", "layout", "strict", "content"];

            function aR(e) {
                var t = aN(),
                    r = ag(e) ? aT(e) : e;
                return aA.some(function(e) {
                    return !!r[e] && "none" !== r[e]
                }) || !!r.containerType && "normal" !== r.containerType || !t && !!r.backdropFilter && "none" !== r.backdropFilter || !t && !!r.filter && "none" !== r.filter || aC.some(function(e) {
                    return (r.willChange || "").includes(e)
                }) || aI.some(function(e) {
                    return (r.contain || "").includes(e)
                })
            }

            function aN() {
                return !("u" < typeof CSS) && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var ak = new Set(["html", "body", "#document"]);

            function aD(e) {
                return ak.has(am(e))
            }

            function aT(e) {
                return ab(e).getComputedStyle(e)
            }

            function aL(e) {
                return ag(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function aM(e) {
                if ("html" === am(e)) return e;
                var t = e.assignedSlot || e.parentNode || aw(e) && e.host || av(e);
                return aw(t) ? t.host : t
            }

            function a_(e, t, r) {
                void 0 === t && (t = []), void 0 === r && (r = !0);
                var n, o = function e(t) {
                        var r = aM(t);
                        return aD(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : aO(r) && ax(r) ? r : e(r)
                    }(e),
                    a = o === (null == (n = e.ownerDocument) ? void 0 : n.body),
                    i = ab(o);
                if (a) {
                    var l = aU(i);
                    return t.concat(i, i.visualViewport || [], ax(o) ? o : [], l && r ? a_(l) : [])
                }
                return t.concat(o, a_(o, [], r))
            }

            function aU(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function aF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aB(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function aK(e) {
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

            function aW(e, t) {
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

            function az(e) {
                return function(e) {
                    if (Array.isArray(e)) return aF(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || aH(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aH(e, t) {
                if (e) {
                    if ("string" == typeof e) return aF(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aF(e, t)
                }
            }

            function aV(e) {
                var t = aT(e),
                    r = parseFloat(t.width) || 0,
                    n = parseFloat(t.height) || 0,
                    o = aO(e),
                    a = o ? e.offsetWidth : r,
                    i = o ? e.offsetHeight : n,
                    l = oz(r) !== a || oz(n) !== i;
                return l && (r = a, n = i), {
                    width: r,
                    height: n,
                    $: l
                }
            }

            function aX(e) {
                return ag(e) ? e : e.contextElement
            }

            function aG(e) {
                var t = aX(e);
                if (!aO(t)) return oV(1);
                var r = t.getBoundingClientRect(),
                    n = aV(t),
                    o = n.width,
                    a = n.height,
                    i = n.$,
                    l = (i ? oz(r.width) : r.width) / o,
                    c = (i ? oz(r.height) : r.height) / a;
                return l && Number.isFinite(l) || (l = 1), c && Number.isFinite(c) || (c = 1), {
                    x: l,
                    y: c
                }
            }
            var aq = oV(0);

            function aY(e) {
                var t = ab(e);
                return aN() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : aq
            }

            function a$(e, t, r, n) {
                void 0 === t && (t = !1), void 0 === r && (r = !1);
                var o, a = e.getBoundingClientRect(),
                    i = aX(e),
                    l = oV(1);
                t && (n ? ag(n) && (l = aG(n)) : l = aG(e));
                var c = (void 0 === (o = r) && (o = !1), n && (!o || n === ab(i)) && o) ? aY(i) : oV(0),
                    u = (a.left + c.x) / l.x,
                    s = (a.top + c.y) / l.y,
                    f = a.width / l.x,
                    p = a.height / l.y;
                if (i)
                    for (var d = ab(i), y = n && ag(n) ? ab(n) : n, m = d, b = aU(m); b && n && y !== m;) {
                        var v = aG(b),
                            h = b.getBoundingClientRect(),
                            g = aT(b),
                            O = h.left + (b.clientLeft + parseFloat(g.paddingLeft)) * v.x,
                            w = h.top + (b.clientTop + parseFloat(g.paddingTop)) * v.y;
                        u *= v.x, s *= v.y, f *= v.x, p *= v.y, u += O, s += w, b = aU(m = ab(b))
                    }
                return o7({
                    width: f,
                    height: p,
                    x: u,
                    y: s
                })
            }

            function aZ(e, t) {
                var r = aL(e).scrollLeft;
                return t ? t.left + r : a$(av(e)).left + r
            }

            function aQ(e, t) {
                var r = e.getBoundingClientRect();
                return {
                    x: r.left + t.scrollLeft - aZ(e, r),
                    y: r.top + t.scrollTop
                }
            }
            var aJ = new Set(["absolute", "fixed"]);

            function a0(e, t, r) {
                if ("viewport" === t) n = function(e, t) {
                    var r = ab(e),
                        n = av(e),
                        o = r.visualViewport,
                        a = n.clientWidth,
                        i = n.clientHeight,
                        l = 0,
                        c = 0;
                    if (o) {
                        a = o.width, i = o.height;
                        var u = aN();
                        (!u || u && "fixed" === t) && (l = o.offsetLeft, c = o.offsetTop)
                    }
                    var s = aZ(n);
                    if (s <= 0) {
                        var f = n.ownerDocument,
                            p = f.body,
                            d = getComputedStyle(p),
                            y = "CSS1Compat" === f.compatMode && parseFloat(d.marginLeft) + parseFloat(d.marginRight) || 0,
                            m = Math.abs(n.clientWidth - p.clientWidth - y);
                        m <= 25 && (a -= m)
                    } else s <= 25 && (a += s);
                    return {
                        width: a,
                        height: i,
                        x: l,
                        y: c
                    }
                }(e, r);
                else if ("document" === t) o = av(e), a = av(o), i = aL(o), l = o.ownerDocument.body, c = oW(a.scrollWidth, a.clientWidth, l.scrollWidth, l.clientWidth), u = oW(a.scrollHeight, a.clientHeight, l.scrollHeight, l.clientHeight), s = -i.scrollLeft + aZ(o), f = -i.scrollTop, "rtl" === aT(l).direction && (s += oW(a.clientWidth, l.clientWidth) - c), n = {
                    width: c,
                    height: u,
                    x: s,
                    y: f
                };
                else if (ag(t)) d = (p = a$(t, !0, "fixed" === r)).top + t.clientTop, y = p.left + t.clientLeft, m = aO(t) ? aG(t) : oV(1), n = {
                    width: t.clientWidth * m.x,
                    height: t.clientHeight * m.y,
                    x: y * m.x,
                    y: d * m.y
                };
                else {
                    var n, o, a, i, l, c, u, s, f, p, d, y, m, b = aY(e);
                    n = {
                        x: t.x - b.x,
                        y: t.y - b.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return o7(n)
            }

            function a1(e, t, r) {
                var n = aO(t),
                    o = av(t),
                    a = "fixed" === r,
                    i = a$(e, !0, a, t),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    c = oV(0);
                if (n || !n && !a)
                    if (("body" !== am(t) || ax(o)) && (l = aL(t)), n) {
                        var u = a$(t, !0, a, t);
                        c.x = u.x + t.clientLeft, c.y = u.y + t.clientTop
                    } else o && (c.x = aZ(o));
                a && !n && o && (c.x = aZ(o));
                var s = !o || n || a ? oV(0) : aQ(o, l);
                return {
                    x: i.left + l.scrollLeft - c.x - s.x,
                    y: i.top + l.scrollTop - c.y - s.y,
                    width: i.width,
                    height: i.height
                }
            }

            function a2(e) {
                return "static" === aT(e).position
            }

            function a3(e, t) {
                if (!aO(e) || "fixed" === aT(e).position) return null;
                if (t) return t(e);
                var r = e.offsetParent;
                return av(e) === r && (r = r.ownerDocument.body), r
            }

            function a6(e, t) {
                var r, n = ab(e);
                if (aE(e)) return n;
                if (!aO(e)) {
                    for (var o = aM(e); o && !aD(o);) {
                        if (ag(o) && !a2(o)) return o;
                        o = aM(o)
                    }
                    return n
                }
                for (var a = a3(e, t); a && (r = a, aS.has(am(r))) && a2(a);) a = a3(a, t);
                return a && aD(a) && a2(a) && !aR(a) ? n : a || function(e) {
                    for (var t = aM(e); aO(t) && !aD(t);) {
                        if (aR(t)) return t;
                        if (aE(t)) break;
                        t = aM(t)
                    }
                    return null
                }(e) || n
            }
            var a8 = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        r = e.rect,
                        n = e.offsetParent,
                        o = "fixed" === e.strategy,
                        a = av(n),
                        i = !!t && aE(t.floating);
                    if (n === a || i && o) return r;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        c = oV(1),
                        u = oV(0),
                        s = aO(n);
                    if ((s || !s && !o) && (("body" !== am(n) || ax(a)) && (l = aL(n)), aO(n))) {
                        var f = a$(n);
                        c = aG(n), u.x = f.x + n.clientLeft, u.y = f.y + n.clientTop
                    }
                    var p = !a || s || o ? oV(0) : aQ(a, l);
                    return {
                        width: r.width * c.x,
                        height: r.height * c.y,
                        x: r.x * c.x - l.scrollLeft * c.x + u.x + p.x,
                        y: r.y * c.y - l.scrollTop * c.y + u.y + p.y
                    }
                },
                getDocumentElement: av,
                getClippingRect: function(e) {
                    var t = e.element,
                        r = e.boundary,
                        n = e.rootBoundary,
                        o = e.strategy,
                        a = az("clippingAncestors" === r ? aE(t) ? [] : function(e, t) {
                            var r = t.get(e);
                            if (r) return r;
                            for (var n = a_(e, [], !1).filter(function(e) {
                                    return ag(e) && "body" !== am(e)
                                }), o = null, a = "fixed" === aT(e).position, i = a ? aM(e) : e; ag(i) && !aD(i);) {
                                var l = aT(i),
                                    c = aR(i);
                                c || "fixed" !== l.position || (o = null), (a ? !c && !o : !c && "static" === l.position && !!o && aJ.has(o.position) || ax(i) && !c && function e(t, r) {
                                    var n = aM(t);
                                    return !(n === r || !ag(n) || aD(n)) && ("fixed" === aT(n).position || e(n, r))
                                }(e, i)) ? n = n.filter(function(e) {
                                    return e !== i
                                }) : o = l, i = aM(i)
                            }
                            return t.set(e, n), n
                        }(t, this._c) : [].concat(r)).concat([n]),
                        i = a[0],
                        l = a.reduce(function(e, r) {
                            var n = a0(t, r, o);
                            return e.top = oW(n.top, e.top), e.right = oK(n.right, e.right), e.bottom = oK(n.bottom, e.bottom), e.left = oW(n.left, e.left), e
                        }, a0(t, i, o));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: a6,
                getElementRects: function(e) {
                    var t;
                    return (t = function() {
                        var t, r, n, o;
                        return function(e, t) {
                            var r, n, o, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(i, "next", {
                                value: c(0)
                            }), l(i, "throw", {
                                value: c(1)
                            }), l(i, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), i;

                            function c(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    a.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && a.label < o[1]) {
                                                    a.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && a.label < o[2]) {
                                                    a.label = o[2], a.ops.push(u);
                                                    break
                                                }
                                                o[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, a)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    return t = this.getOffsetParent || a6, [4, (0, this.getDimensions)(e.floating)];
                                case 1:
                                    return r = a.sent(), n = {}, o = [e.reference], [4, t(e.floating)];
                                case 2:
                                    return [2, (n.reference = a1.apply(void 0, o.concat([a.sent(), e.strategy])), n.floating = {
                                        x: 0,
                                        y: 0,
                                        width: r.width,
                                        height: r.height
                                    }, n)]
                            }
                        })
                    }, function() {
                        var e = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var a = t.apply(e, r);

                            function i(e) {
                                aB(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                aB(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    }).call(this)
                },
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = aV(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: aG,
                isElement: ag,
                isRTL: function(e) {
                    return "rtl" === aT(e).direction
                }
            };

            function a5(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function a4(e, t, r, n) {
                void 0 === n && (n = {});
                var o, a = n.ancestorScroll,
                    i = void 0 === a || a,
                    l = n.ancestorResize,
                    c = void 0 === l || l,
                    u = n.elementResize,
                    s = void 0 === u ? "function" == typeof ResizeObserver : u,
                    f = n.layoutShift,
                    p = void 0 === f ? "function" == typeof IntersectionObserver : f,
                    d = n.animationFrame,
                    y = void 0 !== d && d,
                    m = aX(e),
                    b = i || c ? az(m ? a_(m) : []).concat(az(a_(t))) : [];
                b.forEach(function(e) {
                    i && e.addEventListener("scroll", r, {
                        passive: !0
                    }), c && e.addEventListener("resize", r)
                });
                var v = m && p ? function(e, t) {
                        var r, n = null,
                            o = av(e);

                        function a() {
                            var e;
                            clearTimeout(r), null == (e = n) || e.disconnect(), n = null
                        }
                        return ! function i(l, c) {
                            void 0 === l && (l = !1), void 0 === c && (c = 1), a();
                            var u = e.getBoundingClientRect(),
                                s = u.left,
                                f = u.top,
                                p = u.width,
                                d = u.height;
                            if (l || t(), p && d) {
                                var y = {
                                        rootMargin: -oH(f) + "px " + -oH(o.clientWidth - (s + p)) + "px " + -oH(o.clientHeight - (f + d)) + "px " + -oH(s) + "px",
                                        threshold: oW(0, oK(1, c)) || 1
                                    },
                                    m = !0;
                                try {
                                    n = new IntersectionObserver(b, aW(aK({}, y), {
                                        root: o.ownerDocument
                                    }))
                                } catch (e) {
                                    n = new IntersectionObserver(b, y)
                                }
                                n.observe(e)
                            }

                            function b(t) {
                                var n = t[0].intersectionRatio;
                                if (n !== c) {
                                    if (!m) return i();
                                    n ? i(!1, n) : r = setTimeout(function() {
                                        i(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== n || a5(u, e.getBoundingClientRect()) || i(), m = !1
                            }
                        }(!0), a
                    }(m, r) : null,
                    h = -1,
                    g = null;
                s && (g = new ResizeObserver(function(e) {
                    var n = (function(e) {
                        if (Array.isArray(e)) return e
                    }(e) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(e) || aH(e, 1) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())[0];
                    n && n.target === m && g && (g.unobserve(t), cancelAnimationFrame(h), h = requestAnimationFrame(function() {
                        var e;
                        null == (e = g) || e.observe(t)
                    })), r()
                }), m && !y && g.observe(m), g.observe(t));
                var O = y ? a$(e) : null;
                return y && function t() {
                        var n = a$(e);
                        O && !a5(O, n) && r(), O = n, o = requestAnimationFrame(t)
                    }(), r(),
                    function() {
                        var e;
                        b.forEach(function(e) {
                            i && e.removeEventListener("scroll", r), c && e.removeEventListener("resize", r)
                        }), null == v || v(), null == (e = g) || e.disconnect(), g = null, y && cancelAnimationFrame(o)
                    }
            }
            var a7 = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return at(function() {
                                var r, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, O, w, j, x, S, P, E, A, C, I, R, N, k, D, T, L, M, _, U;
                                return al(this, function(F) {
                                    switch (F.label) {
                                        case 0:
                                            if (r = t.x, n = t.y, o = t.placement, a = t.rects, i = t.platform, l = t.elements, c = t.middlewareData, s = (u = oq(e, t) || {}).element, p = void 0 === (f = u.padding) ? 0 : f, null == s) return [2, {}];
                                            return d = o4(p), y = {
                                                x: r,
                                                y: n
                                            }, b = oQ(m = oZ(o0(o))), [4, i.getDimensions(s)];
                                        case 1:
                                            return v = F.sent(), g = (h = "y" === m) ? "top" : "left", O = h ? "bottom" : "right", w = h ? "clientHeight" : "clientWidth", j = a.reference[b] + a.reference[m] - y[m] - a.floating[b], x = y[m] - a.reference[m], [4, null == i.getOffsetParent ? void 0 : i.getOffsetParent(s)];
                                        case 2:
                                            if (E = !(P = (S = F.sent()) ? S[w] : 0)) return [3, 4];
                                            return [4, null == i.isElement ? void 0 : i.isElement(S)];
                                        case 3:
                                            E = !F.sent(), F.label = 4;
                                        case 4:
                                            return E && (P = l.floating[w] || a.floating[b]), A = j / 2 - x / 2, C = P / 2 - v[b] / 2 - 1, I = oK(d[g], C), R = oK(d[O], C), N = I, k = P - v[b] - R, T = oW(N, oK(D = P / 2 - v[b] / 2 + A, k)), M = (L = !c.arrow && null != o$(o) && D !== T && a.reference[b] / 2 - (D < N ? I : R) - v[b] / 2 < 0) ? D < N ? D - N : D - k : 0, [2, (ar(U = {}, m, y[m] + M), ar(U, "data", an((ar(_ = {}, m, T), ar(_, "centerOffset", D - T - M), _), L && {
                                                alignmentOffset: M
                                            })), ar(U, "reset", L), U)]
                                    }
                                })
                            })()
                        }
                    }
                },
                a9 = function(e, t, r) {
                    var n, o = new Map,
                        a = aK({
                            platform: a8
                        }, r),
                        i = aW(aK({}, a.platform), {
                            _c: o
                        });
                    return n = aW(aK({}, a), {
                        platform: i
                    }), at(function() {
                        var r, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, O, w, j, x, S, P, E, A, C;
                        return al(this, function(I) {
                            switch (I.label) {
                                case 0:
                                    return o = void 0 === (r = n.placement) ? "bottom" : r, i = void 0 === (a = n.strategy) ? "absolute" : a, c = void 0 === (l = n.middleware) ? [] : l, u = n.platform, s = c.filter(Boolean), [4, null == u.isRTL ? void 0 : u.isRTL(t)];
                                case 1:
                                    return f = I.sent(), [4, u.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: i
                                    })];
                                case 2:
                                    y = (d = ac(p = I.sent(), o, f)).x, m = d.y, b = o, v = {}, h = 0, g = 0, I.label = 3;
                                case 3:
                                    if (!(g < s.length)) return [3, 11];
                                    return w = (O = s[g]).name, [4, (0, O.fn)({
                                        x: y,
                                        y: m,
                                        initialPlacement: o,
                                        placement: b,
                                        strategy: i,
                                        middlewareData: v,
                                        rects: p,
                                        platform: u,
                                        elements: {
                                            reference: e,
                                            floating: t
                                        }
                                    })];
                                case 4:
                                    var R;
                                    if (x = (j = I.sent()).x, S = j.y, P = j.data, E = j.reset, y = null != x ? x : y, m = null != S ? S : m, v = ao(an({}, v), ar({}, w, an({}, v[w], P))), !(E && h <= 50)) return [3, 10];
                                    if (h++, (void 0 === E ? "undefined" : (R = E) && "u" > typeof Symbol && R.constructor === Symbol ? "symbol" : typeof R) != "object") return [3, 9];
                                    if (E.placement && (b = E.placement), !E.rects) return [3, 8];
                                    if (!0 !== E.rects) return [3, 6];
                                    return [4, u.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: i
                                    })];
                                case 5:
                                    return A = I.sent(), [3, 7];
                                case 6:
                                    A = E.rects, I.label = 7;
                                case 7:
                                    p = A, I.label = 8;
                                case 8:
                                    y = (C = ac(p, b, f)).x, m = C.y, I.label = 9;
                                case 9:
                                    g = -1, I.label = 10;
                                case 10:
                                    return g++, [3, 3];
                                case 11:
                                    return [2, {
                                        x: y,
                                        y: m,
                                        placement: b,
                                        strategy: i,
                                        middlewareData: v
                                    }]
                            }
                        })
                    })()
                };

            function ie(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
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

            function io(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ie(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ie(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ia(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var ii = "u" > typeof document ? eu.useLayoutEffect : function() {};

            function il(e, t) {
                if (e === t) return !0;
                if ((void 0 === e ? "undefined" : ia(e)) !== (void 0 === t ? "undefined" : ia(t))) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                if (e && t && (void 0 === e ? "undefined" : ia(e)) === "object") {
                    if (Array.isArray(e)) {
                        if ((r = e.length) !== t.length) return !1;
                        for (n = r; 0 != n--;)
                            if (!il(e[n], t[n])) return !1;
                        return !0
                    }
                    if ((r = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (n = r; 0 != n--;)
                        if (!({}).hasOwnProperty.call(t, o[n])) return !1;
                    for (n = r; 0 != n--;) {
                        var r, n, o, a = o[n];
                        if (("_owner" !== a || !e.$$typeof) && !il(e[a], t[a])) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function ic(e) {
                return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function iu(e, t) {
                var r = ic(e);
                return Math.round(t * r) / r
            }

            function is(e) {
                var t = eu.useRef(e);
                return ii(function() {
                    t.current = e
                }), t
            }

            function ip(e) {
                void 0 === e && (e = {});
                var t = e.placement,
                    r = void 0 === t ? "bottom" : t,
                    n = e.strategy,
                    o = void 0 === n ? "absolute" : n,
                    a = e.middleware,
                    i = void 0 === a ? [] : a,
                    l = e.platform,
                    c = e.elements,
                    u = void 0 === c ? {} : c,
                    s = u.reference,
                    f = u.floating,
                    p = e.transform,
                    d = void 0 === p || p,
                    y = e.whileElementsMounted,
                    m = e.open,
                    b = io(eu.useState({
                        x: 0,
                        y: 0,
                        strategy: o,
                        placement: r,
                        middlewareData: {},
                        isPositioned: !1
                    }), 2),
                    v = b[0],
                    h = b[1],
                    g = io(eu.useState(i), 2),
                    O = g[0],
                    w = g[1];
                il(O, i) || w(i);
                var j = io(eu.useState(null), 2),
                    x = j[0],
                    S = j[1],
                    P = io(eu.useState(null), 2),
                    E = P[0],
                    A = P[1],
                    C = eu.useCallback(function(e) {
                        e !== k.current && (k.current = e, S(e))
                    }, []),
                    I = eu.useCallback(function(e) {
                        e !== D.current && (D.current = e, A(e))
                    }, []),
                    R = s || x,
                    N = f || E,
                    k = eu.useRef(null),
                    D = eu.useRef(null),
                    T = eu.useRef(v),
                    L = null != y,
                    M = is(y),
                    _ = is(l),
                    U = is(m),
                    F = eu.useCallback(function() {
                        if (k.current && D.current) {
                            var e = {
                                placement: r,
                                strategy: o,
                                middleware: O
                            };
                            _.current && (e.platform = _.current), a9(k.current, D.current, e).then(function(e) {
                                var t = ir(it({}, e), {
                                    isPositioned: !1 !== U.current
                                });
                                B.current && !il(T.current, t) && (T.current = t, tP.flushSync(function() {
                                    h(t)
                                }))
                            })
                        }
                    }, [O, r, o, _, U]);
                ii(function() {
                    !1 === m && T.current.isPositioned && (T.current.isPositioned = !1, h(function(e) {
                        return ir(it({}, e), {
                            isPositioned: !1
                        })
                    }))
                }, [m]);
                var B = eu.useRef(!1);
                ii(function() {
                    return B.current = !0,
                        function() {
                            B.current = !1
                        }
                }, []), ii(function() {
                    if (R && (k.current = R), N && (D.current = N), R && N) {
                        if (M.current) return M.current(R, N, F);
                        F()
                    }
                }, [R, N, F, M, L]);
                var K = eu.useMemo(function() {
                        return {
                            reference: k,
                            floating: D,
                            setReference: C,
                            setFloating: I
                        }
                    }, [C, I]),
                    W = eu.useMemo(function() {
                        return {
                            reference: R,
                            floating: N
                        }
                    }, [R, N]),
                    z = eu.useMemo(function() {
                        var e = {
                            position: o,
                            left: 0,
                            top: 0
                        };
                        if (!W.floating) return e;
                        var t = iu(W.floating, v.x),
                            r = iu(W.floating, v.y);
                        return d ? it(ir(it({}, e), {
                            transform: "translate(" + t + "px, " + r + "px)"
                        }), ic(W.floating) >= 1.5 && {
                            willChange: "transform"
                        }) : {
                            position: o,
                            left: t,
                            top: r
                        }
                    }, [o, d, W.floating, v.x, v.y]);
                return eu.useMemo(function() {
                    return ir(it({}, v), {
                        update: F,
                        refs: K,
                        elements: W,
                        floatingStyles: z
                    })
                }, [v, F, K, W, z])
            }
            var id = function(e, t) {
                    var r;
                    return ir(it({}, (void 0 === (r = e) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(e) {
                            return at(function() {
                                var t, n, o, a, i, l, c;
                                return al(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            var s;
                                            return o = e.x, a = e.y, i = e.placement, l = e.middlewareData, [4, (s = r, at(function() {
                                                var t, r, n, o, a, i, l, c, u, f, p, d, y, m;
                                                return al(this, function(b) {
                                                    switch (b.label) {
                                                        case 0:
                                                            return t = e.placement, r = e.platform, n = e.elements, [4, null == r.isRTL ? void 0 : r.isRTL(n.floating)];
                                                        case 1:
                                                            return o = b.sent(), a = oY(t), i = o$(t), l = "y" === o0(t), c = ap.has(a) ? -1 : 1, u = o && l ? -1 : 1, d = (p = "number" == typeof(f = oq(s, e)) ? {
                                                                mainAxis: f,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: f.mainAxis || 0,
                                                                crossAxis: f.crossAxis || 0,
                                                                alignmentAxis: f.alignmentAxis
                                                            }).mainAxis, y = p.crossAxis, m = p.alignmentAxis, i && "number" == typeof m && (y = "end" === i ? -1 * m : m), [2, l ? {
                                                                x: y * u,
                                                                y: d * c
                                                            } : {
                                                                x: d * c,
                                                                y: y * u
                                                            }]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            if (c = u.sent(), i === (null == (t = l.offset) ? void 0 : t.placement) && null != (n = l.arrow) && n.alignmentOffset) return [2, {}];
                                            return [2, {
                                                x: o + c.x,
                                                y: a + c.y,
                                                data: ao(an({}, c), {
                                                    placement: i
                                                })
                                            }]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                iy = function(e, t) {
                    var r;
                    return ir(it({}, (void 0 === (r = e) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(e) {
                            return at(function() {
                                var t, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, O, w, j, x, S, P, E, A, C, I;
                                return al(this, function(R) {
                                    switch (R.label) {
                                        case 0:
                                            return t = e.x, n = e.y, o = e.placement, l = void 0 === (i = (a = oq(r, e)).mainAxis) || i, u = void 0 !== (c = a.crossAxis) && c, f = void 0 === (s = a.limiter) ? {
                                                fn: function(e) {
                                                    return {
                                                        x: e.x,
                                                        y: e.y
                                                    }
                                                }
                                            } : s, p = aa(a, ["mainAxis", "crossAxis", "limiter"]), d = {
                                                x: t,
                                                y: n
                                            }, [4, au(e, p)];
                                        case 1:
                                            return y = R.sent(), v = d[b = oZ(m = o0(oY(o)))], h = d[m], l && (g = "y" === b ? "top" : "left", O = "y" === b ? "bottom" : "right", w = v + y[g], j = v - y[O], v = oW(w, oK(v, j))), u && (x = "y" === m ? "top" : "left", S = "y" === m ? "bottom" : "right", P = h + y[x], E = h - y[S], h = oW(P, oK(h, E))), C = f.fn(ao(an({}, e), (ar(A = {}, b, v), ar(A, m, h), A))), [2, ao(an({}, C), {
                                                data: {
                                                    x: C.x - t,
                                                    y: C.y - n,
                                                    enabled: (ar(I = {}, b, l), ar(I, m, u), I)
                                                }
                                            })]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                im = function(e, t) {
                    var r;
                    return ir(it({}, (void 0 === (r = e) && (r = {}), {
                        options: r,
                        fn: function(e) {
                            var t, n = e.x,
                                o = e.y,
                                a = e.placement,
                                i = e.rects,
                                l = e.middlewareData,
                                c = oq(r, e),
                                u = c.offset,
                                s = c.mainAxis,
                                f = c.crossAxis,
                                p = {
                                    x: n,
                                    y: o
                                },
                                d = o0(a),
                                y = oZ(d),
                                m = p[y],
                                b = p[d],
                                v = oq(void 0 === u ? 0 : u, e),
                                h = "number" == typeof v ? {
                                    mainAxis: v,
                                    crossAxis: 0
                                } : an({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, v);
                            if (void 0 === s || s) {
                                var g = "y" === y ? "height" : "width",
                                    O = i.reference[y] - i.floating[g] + h.mainAxis,
                                    w = i.reference[y] + i.reference[g] - h.mainAxis;
                                m < O ? m = O : m > w && (m = w)
                            }
                            if (void 0 === f || f) {
                                var j, x, S = "y" === y ? "width" : "height",
                                    P = ap.has(oY(a)),
                                    E = i.reference[d] - i.floating[S] + (P && (null == (j = l.offset) ? void 0 : j[d]) || 0) + (P ? 0 : h.crossAxis),
                                    A = i.reference[d] + i.reference[S] + (P ? 0 : (null == (x = l.offset) ? void 0 : x[d]) || 0) - (P ? h.crossAxis : 0);
                                b < E ? b = E : b > A && (b = A)
                            }
                            return ar(t = {}, y, m), ar(t, d, b), t
                        }
                    })), {
                        options: [e, t]
                    })
                },
                ib = function(e, t) {
                    var r;
                    return ir(it({}, (void 0 === (r = e) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(e) {
                            return at(function() {
                                var t, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, O, w, j, x, S, P, E, A, C, I, R, N, k, D, T, L, M, _, U, F, B, K;
                                return al(this, function(W) {
                                    var z, H, V, X, G, q, Y, $, Z, Q, J, ee, et, er, en;
                                    switch (W.label) {
                                        case 0:
                                            if (o = e.placement, a = e.middlewareData, i = e.rects, l = e.initialPlacement, c = e.platform, u = e.elements, p = void 0 === (f = (s = oq(r, e)).mainAxis) || f, y = void 0 === (d = s.crossAxis) || d, m = s.fallbackPlacements, v = void 0 === (b = s.fallbackStrategy) ? "bestFit" : b, g = void 0 === (h = s.fallbackAxisSideDirection) ? "none" : h, w = void 0 === (O = s.flipAlignment) || O, j = aa(s, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (t = a.arrow) && t.alignmentOffset) return [2, {}];
                                            return x = oY(o), S = o0(l), P = oY(l) === l, [4, null == c.isRTL ? void 0 : c.isRTL(u.floating)];
                                        case 1:
                                            return E = W.sent(), A = m || (P || !w ? [o5(l)] : (H = o5(z = l), [o1(z), H, o1(H)])), C = "none" !== g, !m && C && (I = A).push.apply(I, ai((V = l, X = w, G = g, q = E, Y = o$(V), $ = function(e, t, r) {
                                                switch (e) {
                                                    case "top":
                                                    case "bottom":
                                                        if (r) return t ? o3 : o2;
                                                        return t ? o2 : o3;
                                                    case "left":
                                                    case "right":
                                                        return t ? o6 : o8;
                                                    default:
                                                        return []
                                                }
                                            }(oY(V), "start" === G, q), Y && ($ = $.map(function(e) {
                                                return e + "-" + Y
                                            }), X && ($ = $.concat($.map(o1)))), $))), R = [l].concat(ai(A)), [4, au(e, j)];
                                        case 2:
                                            if (N = W.sent(), k = [], D = (null == (n = a.flip) ? void 0 : n.overflows) || [], p && k.push(N[x]), y && (Z = o, Q = i, void 0 === (J = E) && (J = !1), ee = o$(Z), er = oQ(et = oZ(o0(Z))), en = "x" === et ? ee === (J ? "end" : "start") ? "right" : "left" : "start" === ee ? "bottom" : "top", Q.reference[er] > Q.floating[er] && (en = o5(en)), T = [en, o5(en)], k.push(N[T[0]], N[T[1]])), D = ai(D).concat([{
                                                    placement: o,
                                                    overflows: k
                                                }]), !k.every(function(e) {
                                                    return e <= 0
                                                })) {
                                                if ((U = R[_ = ((null == (L = a.flip) ? void 0 : L.index) || 0) + 1]) && ("alignment" !== y || S === o0(U) || D.every(function(e) {
                                                        return o0(e.placement) !== S || e.overflows[0] > 0
                                                    }))) return [2, {
                                                    data: {
                                                        index: _,
                                                        overflows: D
                                                    },
                                                    reset: {
                                                        placement: U
                                                    }
                                                }];
                                                if (!(F = null == (M = D.filter(function(e) {
                                                        return e.overflows[0] <= 0
                                                    }).sort(function(e, t) {
                                                        return e.overflows[1] - t.overflows[1]
                                                    })[0]) ? void 0 : M.placement)) switch (v) {
                                                    case "bestFit":
                                                        (K = null == (B = D.filter(function(e) {
                                                            if (C) {
                                                                var t = o0(e.placement);
                                                                return t === S || "y" === t
                                                            }
                                                            return !0
                                                        }).map(function(e) {
                                                            return [e.placement, e.overflows.filter(function(e) {
                                                                return e > 0
                                                            }).reduce(function(e, t) {
                                                                return e + t
                                                            }, 0)]
                                                        }).sort(function(e, t) {
                                                            return e[1] - t[1]
                                                        })[0]) ? void 0 : B[0]) && (F = K);
                                                        break;
                                                    case "initialPlacement":
                                                        F = l
                                                }
                                                if (o !== F) return [2, {
                                                    reset: {
                                                        placement: F
                                                    }
                                                }]
                                            }
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                iv = function(e, t) {
                    var r;
                    return ir(it({}, (void 0 === (r = e) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(e) {
                            return at(function() {
                                var t, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, O, w, j, x, S, P, E, A, C, I, R, N;
                                return al(this, function(k) {
                                    switch (k.label) {
                                        case 0:
                                            return o = e.placement, a = e.rects, i = e.platform, l = e.elements, s = void 0 === (u = (c = oq(r, e)).apply) ? function() {} : u, [4, au(e, aa(c, ["apply"]))];
                                        case 1:
                                            if (f = k.sent(), p = oY(o), d = o$(o), y = "y" === o0(o), b = (m = a.floating).width, v = m.height, "top" !== p && "bottom" !== p) return [3, 3];
                                            return h = p, [4, null == i.isRTL ? void 0 : i.isRTL(l.floating)];
                                        case 2:
                                            return g = d === (k.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            g = p, h = "end" === d ? "top" : "bottom", k.label = 4;
                                        case 4:
                                            return O = v - f.top - f.bottom, w = b - f.left - f.right, j = oK(v - f[h], O), x = oK(b - f[g], w), S = !e.middlewareData.shift, P = j, E = x, null != (t = e.middlewareData.shift) && t.enabled.x && (E = w), null != (n = e.middlewareData.shift) && n.enabled.y && (P = O), S && !d && (A = oW(f.left, 0), C = oW(f.right, 0), I = oW(f.top, 0), R = oW(f.bottom, 0), y ? E = b - 2 * (0 !== A || 0 !== C ? A + C : oW(f.left, f.right)) : P = v - 2 * (0 !== I || 0 !== R ? I + R : oW(f.top, f.bottom))), [4, s(ao(an({}, e), {
                                                availableWidth: E,
                                                availableHeight: P
                                            }))];
                                        case 5:
                                            return k.sent(), [4, i.getDimensions(l.floating)];
                                        case 6:
                                            if (N = k.sent(), b !== N.width || v !== N.height) return [2, {
                                                reset: {
                                                    rects: !0
                                                }
                                            }];
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                ih = function(e, t) {
                    var r;
                    return ir(it({}, (void 0 === (r = e) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(e) {
                            return at(function() {
                                var t, n, o, a, i, l, c;
                                return al(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            switch (t = e.rects, a = void 0 === (o = (n = oq(r, e)).strategy) ? "referenceHidden" : o, i = aa(n, ["strategy"]), a) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, au(e, ao(an({}, i), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: l = as(u.sent(), t.reference),
                                                    referenceHidden: af(l)
                                                }
                                            }];
                                        case 3:
                                            return [4, au(e, ao(an({}, i), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: c = as(u.sent(), t.floating),
                                                    escaped: af(c)
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
                        options: [e, t]
                    })
                },
                ig = function(e, t) {
                    return ir(it({}, {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            var r = "function" == typeof e ? e(t) : e,
                                n = r.element,
                                o = r.padding;
                            return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? a7({
                                element: n.current,
                                padding: o
                            }).fn(t) : {} : n ? a7({
                                element: n,
                                padding: o
                            }).fn(t) : {}
                        }
                    }), {
                        options: [e, t]
                    })
                };

            function iO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iw(e) {
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

            function ij(e, t) {
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

            function ix(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function iS(e) {
                return function(e) {
                    if (Array.isArray(e)) return iO(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return iO(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iO(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var iP = eu.forwardRef(function(e, t) {
                var r = e.children,
                    n = ix(e, ["children"]),
                    o = eu.Children.toArray(r),
                    a = o.find(iC);
                if (a) {
                    var i = a.props.children,
                        l = o.map(function(e) {
                            return e !== a ? e : eu.Children.count(i) > 1 ? eu.Children.only(null) : eu.isValidElement(i) ? i.props.children : null
                        });
                    return (0, G.jsx)(iE, ij(iw({}, n), {
                        ref: t,
                        children: eu.isValidElement(i) ? eu.cloneElement(i, void 0, l) : null
                    }))
                }
                return (0, G.jsx)(iE, ij(iw({}, n), {
                    ref: t,
                    children: r
                }))
            });
            iP.displayName = "Slot";
            var iE = eu.forwardRef(function(e, t) {
                var r = e.children,
                    n = ix(e, ["children"]);
                if (eu.isValidElement(r)) {
                    var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref;
                    return eu.cloneElement(r, ij(iw({}, function(e, t) {
                        var r = iw({}, t);
                        for (var n in t) ! function(n) {
                            var o = e[n],
                                a = t[n];
                            /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                a.apply(void 0, iS(t)), o.apply(void 0, iS(t))
                            } : o && (r[n] = o) : "style" === n ? r[n] = iw({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                        }(n);
                        return iw({}, e, r)
                    }(n, r.props)), {
                        ref: t ? oC(t, u) : u
                    }))
                }
                return eu.Children.count(r) > 1 ? eu.Children.only(null) : null
            });
            iE.displayName = "SlotClone";
            var iA = function(e) {
                var t = e.children;
                return (0, G.jsx)(G.Fragment, {
                    children: t
                })
            };

            function iC(e) {
                return eu.isValidElement(e) && e.type === iA
            }

            function iI(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function iR(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        iI(e, t, r[t])
                    })
                }
                return e
            }

            function iN(e, t) {
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
            var ik = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var r = eu.forwardRef(function(e, r) {
                        var n = e.asChild,
                            o = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }(e, ["asChild"]),
                            a = n ? iP : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, G.jsx)(a, iN(iR({}, o), {
                            ref: r
                        }))
                    });
                    return r.displayName = "Primitive.".concat(t), iN(iR({}, e), iI({}, t, r))
                }, {}),
                iD = eu.forwardRef(function(e, t) {
                    var r, n, o = e.children,
                        a = e.width,
                        i = e.height,
                        l = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["children", "width", "height"]);
                    return (0, G.jsx)(ik.svg, (r = function(e) {
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
                    }({}, l), n = n = {
                        ref: t,
                        width: void 0 === a ? 10 : a,
                        height: void 0 === i ? 5 : i,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: e.asChild ? o : (0, G.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function iT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iL(e) {
                var t = eu.useRef(e);
                return eu.useEffect(function() {
                    t.current = e
                }), eu.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return iT(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return iT(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iT(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function iM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i_(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iU(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function iF(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        iU(e, t, r[t])
                    })
                }
                return e
            }

            function iB(e, t) {
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

            function iK(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function iW(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || iz(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iz(e, t) {
                if (e) {
                    if ("string" == typeof e) return i_(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i_(e, t)
                }
            }
            iD.displayName = "Arrow";
            var iH = "Popper",
                iV = iW(oT(iH), 2),
                iX = iV[0],
                iG = iV[1],
                iq = iW(iX(iH), 2),
                iY = iq[0],
                i$ = iq[1],
                iZ = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = iW(eu.useState(null), 2),
                        o = n[0],
                        a = n[1];
                    return (0, G.jsx)(iY, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: a,
                        children: r
                    })
                };
            iZ.displayName = iH;
            var iQ = "PopperAnchor",
                iJ = eu.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        o = iK(e, ["__scopePopper", "virtualRef"]),
                        a = i$(iQ, r),
                        i = eu.useRef(null),
                        l = oI(t, i);
                    return eu.useEffect(function() {
                        a.onAnchorChange((null == n ? void 0 : n.current) || i.current)
                    }), n ? null : (0, G.jsx)(ik.div, iB(iF({}, o), {
                        ref: l
                    }))
                });
            iJ.displayName = iQ;
            var i0 = "PopperContent",
                i1 = iW(iX(i0), 2),
                i2 = i1[0],
                i3 = i1[1],
                i6 = eu.forwardRef(function(e, t) {
                    var r, n, o, a, i, l, c, u, s, f, p, d, y = e.__scopePopper,
                        m = e.side,
                        b = e.sideOffset,
                        v = e.align,
                        h = void 0 === v ? "center" : v,
                        g = e.alignOffset,
                        O = e.arrowPadding,
                        w = e.avoidCollisions,
                        j = void 0 === w || w,
                        x = e.collisionBoundary,
                        S = void 0 === x ? [] : x,
                        P = e.collisionPadding,
                        E = void 0 === P ? 0 : P,
                        A = e.sticky,
                        C = e.hideWhenDetached,
                        I = e.updatePositionStrategy,
                        R = void 0 === I ? "optimized" : I,
                        N = e.onPlaced,
                        k = iK(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        D = i$(i0, y),
                        T = iW(eu.useState(null), 2),
                        L = T[0],
                        M = T[1],
                        _ = oI(t, function(e) {
                            return M(e)
                        }),
                        U = iW(eu.useState(null), 2),
                        F = U[0],
                        B = U[1],
                        K = (o = (n = function(e) {
                            if (Array.isArray(e)) return e
                        }(r = eu.useState(void 0)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(r) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return iM(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iM(e, 2)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], a = n[1], oM(function() {
                            if (F) {
                                a({
                                    width: F.offsetWidth,
                                    height: F.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, r, n = e[0];
                                        if ("borderBoxSize" in n) {
                                            var o = n.borderBoxSize,
                                                i = Array.isArray(o) ? o[0] : o;
                                            t = i.inlineSize, r = i.blockSize
                                        } else t = F.offsetWidth, r = F.offsetHeight;
                                        a({
                                            width: t,
                                            height: r
                                        })
                                    }
                                });
                                return e.observe(F, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(F)
                                    }
                            }
                            a(void 0)
                        }, [F]), o),
                        W = null != (i = null == K ? void 0 : K.width) ? i : 0,
                        z = null != (l = null == K ? void 0 : K.height) ? l : 0,
                        H = "number" == typeof E ? E : iF({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, E),
                        V = Array.isArray(S) ? S : [S],
                        X = V.length > 0,
                        q = {
                            padding: H,
                            boundary: V.filter(i7),
                            altBoundary: X
                        },
                        Y = ip({
                            strategy: "fixed",
                            placement: (void 0 === m ? "bottom" : m) + ("center" !== h ? "-" + h : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return a4.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return i_(e)
                                })(t) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || iz(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === R
                                }]))
                            },
                            elements: {
                                reference: D.anchor
                            },
                            middleware: [id({
                                mainAxis: (void 0 === b ? 0 : b) + z,
                                alignmentAxis: void 0 === g ? 0 : g
                            }), j && iy(iF({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === A ? "partial" : A) ? im() : void 0
                            }, q)), j && ib(iF({}, q)), iv(iB(iF({}, q), {
                                apply: function(e) {
                                    var t = e.elements,
                                        r = e.rects,
                                        n = e.availableWidth,
                                        o = e.availableHeight,
                                        a = r.reference,
                                        i = a.width,
                                        l = a.height,
                                        c = t.floating.style;
                                    c.setProperty("--radix-popper-available-width", "".concat(n, "px")), c.setProperty("--radix-popper-available-height", "".concat(o, "px")), c.setProperty("--radix-popper-anchor-width", "".concat(i, "px")), c.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                                }
                            })), F && ig({
                                element: F,
                                padding: void 0 === O ? 0 : O
                            }), i9({
                                arrowWidth: W,
                                arrowHeight: z
                            }), void 0 !== C && C && ih(iF({
                                strategy: "referenceHidden"
                            }, q))]
                        }),
                        $ = Y.refs,
                        Z = Y.floatingStyles,
                        Q = Y.placement,
                        J = Y.isPositioned,
                        ee = Y.middlewareData,
                        et = iW(le(Q), 2),
                        er = et[0],
                        en = et[1],
                        eo = iL(N);
                    oM(function() {
                        J && (null == eo || eo())
                    }, [J, eo]);
                    var ea = null == (c = ee.arrow) ? void 0 : c.x,
                        ei = null == (u = ee.arrow) ? void 0 : u.y,
                        el = (null == (s = ee.arrow) ? void 0 : s.centerOffset) !== 0,
                        ec = iW(eu.useState(), 2),
                        es = ec[0],
                        ef = ec[1];
                    return oM(function() {
                        L && ef(window.getComputedStyle(L).zIndex)
                    }, [L]), (0, G.jsx)("div", {
                        ref: $.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: iF(iB(iF({}, Z), iU({
                            transform: J ? Z.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: es
                        }, "--radix-popper-transform-origin", [null == (f = ee.transformOrigin) ? void 0 : f.x, null == (p = ee.transformOrigin) ? void 0 : p.y].join(" "))), (null == (d = ee.hide) ? void 0 : d.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, G.jsx)(i2, {
                            scope: y,
                            placedSide: er,
                            onArrowChange: B,
                            arrowX: ea,
                            arrowY: ei,
                            shouldHideArrow: el,
                            children: (0, G.jsx)(ik.div, iB(iF({
                                "data-side": er,
                                "data-align": en
                            }, k), {
                                ref: _,
                                style: iB(iF({}, k.style), {
                                    animation: J ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            i6.displayName = i0;
            var i8 = "PopperArrow",
                i5 = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                i4 = eu.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        o = iK(e, ["__scopePopper"]),
                        a = i3(i8, n),
                        i = i5[a.placedSide];
                    return (0, G.jsx)("span", {
                        ref: a.onArrowChange,
                        style: (iU(r = {
                            position: "absolute",
                            left: a.arrowX,
                            top: a.arrowY
                        }, i, 0), iU(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [a.placedSide]), iU(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [a.placedSide]), iU(r, "visibility", a.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, G.jsx)(iD, iB(iF({}, o), {
                            ref: t,
                            style: iB(iF({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function i7(e) {
                return null !== e
            }
            i4.displayName = i8;
            var i9 = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var r, n, o, a, i, l = t.placement,
                            c = t.rects,
                            u = t.middlewareData,
                            s = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0,
                            f = s ? 0 : e.arrowWidth,
                            p = s ? 0 : e.arrowHeight,
                            d = iW(le(l), 2),
                            y = d[0],
                            m = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [d[1]],
                            b = (null != (r = null == (a = u.arrow) ? void 0 : a.x) ? r : 0) + f / 2,
                            v = (null != (n = null == (i = u.arrow) ? void 0 : i.y) ? n : 0) + p / 2,
                            h = "",
                            g = "";
                        return "bottom" === y ? (h = s ? m : "".concat(b, "px"), g = "".concat(-p, "px")) : "top" === y ? (h = s ? m : "".concat(b, "px"), g = "".concat(c.floating.height + p, "px")) : "right" === y ? (h = "".concat(-p, "px"), g = s ? m : "".concat(v, "px")) : "left" === y && (h = "".concat(c.floating.width + p, "px"), g = s ? m : "".concat(v, "px")), {
                            data: {
                                x: h,
                                y: g
                            }
                        }
                    }
                }
            };

            function le(e) {
                var t = iW(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function lt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var lr = eu.forwardRef(function(e, t) {
                var r, n, o, a, i, l = e.container,
                    c = function(e, t) {
                        if (null == e) return {};
                        var r, n, o, a = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }
                        if (a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    a = Object.getOwnPropertyNames(e);
                                for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                return o
                            }(e, t), Object.getOwnPropertySymbols)
                            for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                        return a
                    }(e, ["container"]),
                    u = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = eu.useState(!1)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return lt(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lt(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = u[0],
                    f = u[1];
                oM(function() {
                    return f(!0)
                }, []);
                var p = l || s && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
                return p ? tE().createPortal((0, G.jsx)(ik.div, (n = function(e) {
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
                }({}, c), o = o = {
                    ref: t
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(o)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                }), n)), p) : null
            });

            function ln(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lo(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ln(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ln(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            lr.displayName = "Portal";
            var la = function(e) {
                var t, r, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h = e.present,
                    g = e.children,
                    O = (t = h, a = (o = lo(eu.useState(), 2))[0], i = o[1], l = eu.useRef({}), c = eu.useRef(t), u = eu.useRef("none"), f = (s = lo((r = t ? "mounted" : "unmounted", n = {
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
                    }, eu.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], eu.useEffect(function() {
                        var e = li(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), oM(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = li(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), c.current = t
                        }
                    }, [t, p]), oM(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = li(l.current).includes(e.animationName);
                                    if (e.target === a && n && (p("ANIMATION_END"), !c.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (u.current = li(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [a, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: eu.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), i(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : eu.Children.only(g),
                    j = oI(O.ref, (v = (b = null == (y = Object.getOwnPropertyDescriptor((d = w).props, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? d.ref : (v = (b = null == (m = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof g || O.isPresent ? eu.cloneElement(w, {
                    ref: j
                }) : null
            };

            function li(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function ll(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lc(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ll(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ll(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lu(e) {
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
            la.displayName = "Presence";
            var ls = eu.forwardRef(function(e, t) {
                var r, n;
                return (0, G.jsx)(ik.span, (r = lu({}, e), n = n = {
                    ref: t,
                    style: lu({
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
                    }, e.style)
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(n)).forEach(function(e) {
                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                }), r))
            });

            function lf(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lp(e) {
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

            function ld(e, t) {
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

            function ly(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function lm(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || lv(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lb(e) {
                return function(e) {
                    if (Array.isArray(e)) return lf(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || lv(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lv(e, t) {
                if (e) {
                    if ("string" == typeof e) return lf(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lf(e, t)
                }
            }
            ls.displayName = "VisuallyHidden";
            var lh = lm(oT("Tooltip", [iG]), 2),
                lg = lh[0];
            lh[1];
            var lO = iG(),
                lw = "TooltipProvider",
                lj = "tooltip.open",
                lx = lm(lg(lw), 2),
                lS = lx[0],
                lP = lx[1],
                lE = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.delayDuration,
                        n = e.skipDelayDuration,
                        o = void 0 === n ? 300 : n,
                        a = e.disableHoverableContent,
                        i = e.children,
                        l = lm(eu.useState(!0), 2),
                        c = l[0],
                        u = l[1],
                        s = eu.useRef(!1),
                        f = eu.useRef(0);
                    return eu.useEffect(function() {
                        var e = f.current;
                        return function() {
                            return window.clearTimeout(e)
                        }
                    }, []), (0, G.jsx)(lS, {
                        scope: t,
                        isOpenDelayed: c,
                        delayDuration: void 0 === r ? 700 : r,
                        onOpen: eu.useCallback(function() {
                            window.clearTimeout(f.current), u(!1)
                        }, []),
                        onClose: eu.useCallback(function() {
                            window.clearTimeout(f.current), f.current = window.setTimeout(function() {
                                return u(!0)
                            }, o)
                        }, [o]),
                        isPointerInTransitRef: s,
                        onPointerInTransitChange: eu.useCallback(function(e) {
                            s.current = e
                        }, []),
                        disableHoverableContent: void 0 !== a && a,
                        children: i
                    })
                };
            lE.displayName = lw;
            var lA = "Tooltip",
                lC = lm(lg(lA), 2),
                lI = lC[0],
                lR = lC[1],
                lN = function(e) {
                    var t, r, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, O, w, j = e.__scopeTooltip,
                        x = e.children,
                        S = e.open,
                        P = e.defaultOpen,
                        E = e.onOpenChange,
                        A = e.disableHoverableContent,
                        C = e.delayDuration,
                        I = lP(lA, e.__scopeTooltip),
                        R = lO(j),
                        N = lm(eu.useState(null), 2),
                        k = N[0],
                        D = N[1],
                        T = (s = (u = function(e) {
                            if (Array.isArray(e)) return e
                        }(c = eu.useState(oU())) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(c) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return o_(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o_(e, 2)
                            }
                        }(c) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], f = u[1], oM(function() {
                            f(function(e) {
                                return null != e ? e : String(oF++)
                            })
                        }, [void 0]), s ? "radix-".concat(s) : ""),
                        L = eu.useRef(0),
                        M = null != A ? A : I.disableHoverableContent,
                        _ = null != C ? C : I.delayDuration,
                        U = eu.useRef(!1),
                        F = lm((d = (p = {
                            prop: S,
                            defaultProp: void 0 !== P && P,
                            onChange: function(e) {
                                e ? (I.onOpen(), document.dispatchEvent(new CustomEvent(lj))) : I.onClose(), null == E || E(e)
                            }
                        }).prop, v = (b = lc((r = (t = {
                            defaultProp: p.defaultProp,
                            onChange: m = void 0 === (y = p.onChange) ? function() {} : y
                        }).defaultProp, n = t.onChange, a = lc(o = eu.useState(r), 1)[0], i = eu.useRef(a), l = iL(n), eu.useEffect(function() {
                            i.current !== a && (l(a), i.current = a)
                        }, [a, i, l]), o), 2))[0], h = b[1], O = (g = void 0 !== d) ? d : v, w = iL(m), [O, eu.useCallback(function(e) {
                            if (g) {
                                var t = "function" == typeof e ? e(d) : e;
                                t !== d && w(t)
                            } else h(e)
                        }, [g, d, h, w])]), 2),
                        B = F[0],
                        K = void 0 !== B && B,
                        W = F[1],
                        z = eu.useMemo(function() {
                            return K ? U.current ? "delayed-open" : "instant-open" : "closed"
                        }, [K]),
                        H = eu.useCallback(function() {
                            window.clearTimeout(L.current), L.current = 0, U.current = !1, W(!0)
                        }, [W]),
                        V = eu.useCallback(function() {
                            window.clearTimeout(L.current), L.current = 0, W(!1)
                        }, [W]),
                        X = eu.useCallback(function() {
                            window.clearTimeout(L.current), L.current = window.setTimeout(function() {
                                U.current = !0, W(!0), L.current = 0
                            }, _)
                        }, [_, W]);
                    return eu.useEffect(function() {
                        return function() {
                            L.current && (window.clearTimeout(L.current), L.current = 0)
                        }
                    }, []), (0, G.jsx)(iZ, ld(lp({}, R), {
                        children: (0, G.jsx)(lI, {
                            scope: j,
                            contentId: T,
                            open: K,
                            stateAttribute: z,
                            trigger: k,
                            onTriggerChange: D,
                            onTriggerEnter: eu.useCallback(function() {
                                I.isOpenDelayed ? X() : H()
                            }, [I.isOpenDelayed, X, H]),
                            onTriggerLeave: eu.useCallback(function() {
                                M ? V() : (window.clearTimeout(L.current), L.current = 0)
                            }, [V, M]),
                            onOpen: H,
                            onClose: V,
                            disableHoverableContent: M,
                            children: x
                        })
                    }))
                };
            lN.displayName = lA;
            var lk = "TooltipTrigger",
                lD = eu.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = ly(e, ["__scopeTooltip"]),
                        o = lR(lk, r),
                        a = lP(lk, r),
                        i = lO(r),
                        l = oI(t, eu.useRef(null), o.onTriggerChange),
                        c = eu.useRef(!1),
                        u = eu.useRef(!1),
                        s = eu.useCallback(function() {
                            return c.current = !1
                        }, []);
                    return eu.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", s)
                        }
                    }, [s]), (0, G.jsx)(iJ, ld(lp({
                        asChild: !0
                    }, i), {
                        children: (0, G.jsx)(ik.button, ld(lp({
                            "aria-describedby": o.open ? o.contentId : void 0,
                            "data-state": o.stateAttribute
                        }, n), {
                            ref: l,
                            onPointerMove: oP(e.onPointerMove, function(e) {
                                "touch" !== e.pointerType && (u.current || a.isPointerInTransitRef.current || (o.onTriggerEnter(), u.current = !0))
                            }),
                            onPointerLeave: oP(e.onPointerLeave, function() {
                                o.onTriggerLeave(), u.current = !1
                            }),
                            onPointerDown: oP(e.onPointerDown, function() {
                                c.current = !0, document.addEventListener("pointerup", s, {
                                    once: !0
                                })
                            }),
                            onFocus: oP(e.onFocus, function() {
                                c.current || o.onOpen()
                            }),
                            onBlur: oP(e.onBlur, o.onClose),
                            onClick: oP(e.onClick, o.onClose)
                        }))
                    }))
                });
            lD.displayName = lk;
            var lT = "TooltipPortal",
                lL = lm(lg(lT, {
                    forceMount: void 0
                }), 2),
                lM = lL[0],
                l_ = lL[1],
                lU = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        a = lR(lT, t);
                    return (0, G.jsx)(lM, {
                        scope: t,
                        forceMount: r,
                        children: (0, G.jsx)(la, {
                            present: r || a.open,
                            children: (0, G.jsx)(lr, {
                                asChild: !0,
                                container: o,
                                children: n
                            })
                        })
                    })
                };
            lU.displayName = lT;
            var lF = "TooltipContent",
                lB = eu.forwardRef(function(e, t) {
                    var r = l_(lF, e.__scopeTooltip),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = e.side,
                        i = void 0 === a ? "top" : a,
                        l = ly(e, ["forceMount", "side"]),
                        c = lR(lF, e.__scopeTooltip);
                    return (0, G.jsx)(la, {
                        present: o || c.open,
                        children: c.disableHoverableContent ? (0, G.jsx)(lV, ld(lp({
                            side: i
                        }, l), {
                            ref: t
                        })) : (0, G.jsx)(lK, ld(lp({
                            side: i
                        }, l), {
                            ref: t
                        }))
                    })
                }),
                lK = eu.forwardRef(function(e, t) {
                    var r = lR(lF, e.__scopeTooltip),
                        n = lP(lF, e.__scopeTooltip),
                        o = eu.useRef(null),
                        a = oI(t, o),
                        i = lm(eu.useState(null), 2),
                        l = i[0],
                        c = i[1],
                        u = r.trigger,
                        s = r.onClose,
                        f = o.current,
                        p = n.onPointerInTransitChange,
                        d = eu.useCallback(function() {
                            c(null), p(!1)
                        }, [p]),
                        y = eu.useCallback(function(e, t) {
                            var r, n, o, a, i, l, u = e.currentTarget,
                                s = {
                                    x: e.clientX,
                                    y: e.clientY
                                },
                                f = function(e, t) {
                                    var r = Math.abs(t.top - e.y),
                                        n = Math.abs(t.bottom - e.y),
                                        o = Math.abs(t.right - e.x),
                                        a = Math.abs(t.left - e.x);
                                    switch (Math.min(r, n, o, a)) {
                                        case a:
                                            return "left";
                                        case o:
                                            return "right";
                                        case r:
                                            return "top";
                                        case n:
                                            return "bottom";
                                        default:
                                            throw Error("unreachable")
                                    }
                                }(s, u.getBoundingClientRect()),
                                d = function(e, t) {
                                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5,
                                        n = [];
                                    switch (t) {
                                        case "top":
                                            n.push({
                                                x: e.x - r,
                                                y: e.y + r
                                            }, {
                                                x: e.x + r,
                                                y: e.y + r
                                            });
                                            break;
                                        case "bottom":
                                            n.push({
                                                x: e.x - r,
                                                y: e.y - r
                                            }, {
                                                x: e.x + r,
                                                y: e.y - r
                                            });
                                            break;
                                        case "left":
                                            n.push({
                                                x: e.x + r,
                                                y: e.y - r
                                            }, {
                                                x: e.x + r,
                                                y: e.y + r
                                            });
                                            break;
                                        case "right":
                                            n.push({
                                                x: e.x - r,
                                                y: e.y - r
                                            }, {
                                                x: e.x - r,
                                                y: e.y + r
                                            })
                                    }
                                    return n
                                }(s, f),
                                y = (n = (r = t.getBoundingClientRect()).top, o = r.right, a = r.bottom, [{
                                    x: i = r.left,
                                    y: n
                                }, {
                                    x: o,
                                    y: n
                                }, {
                                    x: o,
                                    y: a
                                }, {
                                    x: i,
                                    y: a
                                }]);
                            c(((l = lb(d).concat(lb(y)).slice()).sort(function(e, t) {
                                return e.x < t.x ? -1 : e.x > t.x ? 1 : e.y < t.y ? -1 : 1 * !!(e.y > t.y)
                            }), function(e) {
                                if (e.length <= 1) return e.slice();
                                for (var t = [], r = 0; r < e.length; r++) {
                                    for (var n = e[r]; t.length >= 2;) {
                                        var o = t[t.length - 1],
                                            a = t[t.length - 2];
                                        if ((o.x - a.x) * (n.y - a.y) >= (o.y - a.y) * (n.x - a.x)) t.pop();
                                        else break
                                    }
                                    t.push(n)
                                }
                                t.pop();
                                for (var i = [], l = e.length - 1; l >= 0; l--) {
                                    for (var c = e[l]; i.length >= 2;) {
                                        var u = i[i.length - 1],
                                            s = i[i.length - 2];
                                        if ((u.x - s.x) * (c.y - s.y) >= (u.y - s.y) * (c.x - s.x)) i.pop();
                                        else break
                                    }
                                    i.push(c)
                                }
                                return (i.pop(), 1 === t.length && 1 === i.length && t[0].x === i[0].x && t[0].y === i[0].y) ? t : t.concat(i)
                            }(l))), p(!0)
                        }, [p]);
                    return eu.useEffect(function() {
                        return function() {
                            return d()
                        }
                    }, [d]), eu.useEffect(function() {
                        if (u && f) {
                            var e = function(e) {
                                    return y(e, f)
                                },
                                t = function(e) {
                                    return y(e, u)
                                };
                            return u.addEventListener("pointerleave", e), f.addEventListener("pointerleave", t),
                                function() {
                                    u.removeEventListener("pointerleave", e), f.removeEventListener("pointerleave", t)
                                }
                        }
                    }, [u, f, y, d]), eu.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                var t = e.target,
                                    r = {
                                        x: e.clientX,
                                        y: e.clientY
                                    },
                                    n = (null == u ? void 0 : u.contains(t)) || (null == f ? void 0 : f.contains(t)),
                                    o = ! function(e, t) {
                                        for (var r = e.x, n = e.y, o = !1, a = 0, i = t.length - 1; a < t.length; i = a++) {
                                            var l = t[a].x,
                                                c = t[a].y,
                                                u = t[i].x,
                                                s = t[i].y;
                                            c > n != s > n && r < (u - l) * (n - c) / (s - c) + l && (o = !o)
                                        }
                                        return o
                                    }(r, l);
                                n ? d() : o && (d(), s())
                            };
                            return document.addEventListener("pointermove", e),
                                function() {
                                    return document.removeEventListener("pointermove", e)
                                }
                        }
                    }, [u, f, l, s, d]), (0, G.jsx)(lV, ld(lp({}, e), {
                        ref: a
                    }))
                }),
                lW = lm(lg(lA, {
                    isInside: !1
                }), 2),
                lz = lW[0],
                lH = lW[1],
                lV = eu.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = e.children,
                        o = e["aria-label"],
                        a = e.onEscapeKeyDown,
                        i = e.onPointerDownOutside,
                        l = ly(e, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        c = lR(lF, r),
                        u = lO(r),
                        s = c.onClose;
                    return eu.useEffect(function() {
                        return document.addEventListener(lj, s),
                            function() {
                                return document.removeEventListener(lj, s)
                            }
                    }, [s]), eu.useEffect(function() {
                        if (c.trigger) {
                            var e = function(e) {
                                var t = e.target;
                                (null == t ? void 0 : t.contains(c.trigger)) && s()
                            };
                            return window.addEventListener("scroll", e, {
                                    capture: !0
                                }),
                                function() {
                                    return window.removeEventListener("scroll", e, {
                                        capture: !0
                                    })
                                }
                        }
                    }, [c.trigger, s]), (0, G.jsx)(tS.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: a,
                        onPointerDownOutside: i,
                        onFocusOutside: function(e) {
                            return e.preventDefault()
                        },
                        onDismiss: s,
                        children: (0, G.jsxs)(i6, ld(lp({
                            "data-state": c.stateAttribute
                        }, u, l), {
                            ref: t,
                            style: lp({}, l.style, {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, G.jsx)(iA, {
                                children: n
                            }), (0, G.jsx)(lz, {
                                scope: r,
                                isInside: !0,
                                children: (0, G.jsx)(ls, {
                                    id: c.contentId,
                                    role: "tooltip",
                                    children: o || n
                                })
                            })]
                        }))
                    })
                });
            lB.displayName = lF;
            var lX = "TooltipArrow",
                lG = eu.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = ly(e, ["__scopeTooltip"]),
                        o = lO(r);
                    return lH(lX, r).isInside ? null : (0, G.jsx)(i4, ld(lp({}, o, n), {
                        ref: t
                    }))
                });

            function lq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lY(e) {
                var t, r = e.position,
                    n = e.hasBeak,
                    o = e.title,
                    a = e.description,
                    i = e.ariaLabel,
                    l = e.delayDurationMs,
                    c = e.children,
                    u = e.open,
                    s = e.onOpenChange,
                    f = e.contentClassName,
                    p = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = r.split("-")) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
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
                    d = p[0],
                    y = p[1],
                    m = null != i ? i : "string" == typeof o && null == a ? o : void 0;
                return eu.createElement(lE, {
                    delayDuration: void 0 === l ? 500 : l
                }, eu.createElement(lN, {
                    open: u,
                    onOpenChange: s
                }, c, eu.createElement(lU, null, eu.createElement(lB, {
                    side: d,
                    align: y,
                    "aria-label": m,
                    className: e0("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", f),
                    sideOffset: 5
                }, (void 0 === n || n) && eu.createElement(lG, {
                    asChild: !0
                }, eu.createElement(oS, {
                    className: "content-[var(--inverse-surface-0)]"
                })), eu.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, eu.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, o), a && eu.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, a))))))
            }

            function l$(e) {
                var t = e.children,
                    r = e.asChild,
                    n = e.className;
                return eu.createElement(lD, {
                    asChild: r,
                    className: n
                }, t)
            }
            lG.displayName = lX;
            var lZ = function(e) {
                    var t = e.title,
                        r = e.description,
                        n = e.position;
                    return es().createElement(lY, {
                        position: void 0 === n ? "top-center" : n,
                        title: t,
                        description: r
                    }, es().createElement(l$, {
                        asChild: !0
                    }, es().createElement("span", {
                        role: "button",
                        tabIndex: 0,
                        "aria-label": t,
                        className: "flex items-center content-muted",
                        "data-testid": "label-tooltip-trigger"
                    }, es().createElement(e7, {
                        name: "icon-regular-circle-i",
                        size: "Small"
                    }))))
                },
                lQ = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                lJ = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                };

            function l0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function l1(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return l0(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return l0(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0];
                return Math.min(r[1], Math.max(n, e))
            }

            function l2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function l3(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function l6(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        l3(e, t, r[t])
                    })
                }
                return e
            }

            function l8(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return l2(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l2(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var l5 = eu.createContext(void 0);

            function l4(e) {
                var t = eu.useContext(l5);
                return e || t || "ltr"
            }
            var l7 = eu.forwardRef(function(e, t) {
                var r, n, o = e.children,
                    a = e.width,
                    i = e.height,
                    l = function(e, t) {
                        if (null == e) return {};
                        var r, n, o, a = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }
                        if (a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    a = Object.getOwnPropertyNames(e);
                                for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                return o
                            }(e, t), Object.getOwnPropertySymbols)
                            for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                        return a
                    }(e, ["children", "width", "height"]);
                return (0, G.jsx)(tU.svg, (r = function(e) {
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
                }({}, l), n = n = {
                    ref: t,
                    width: void 0 === a ? 10 : a,
                    height: void 0 === i ? 5 : i,
                    viewBox: "0 0 30 10",
                    preserveAspectRatio: "none",
                    children: e.asChild ? o : (0, G.jsx)("polygon", {
                        points: "0,0 30,0 15,10"
                    })
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(n)).forEach(function(e) {
                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                }), r))
            });

            function l9(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ce(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ct(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function cr(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        ct(e, t, r[t])
                    })
                }
                return e
            }

            function cn(e, t) {
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

            function co(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function ca(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || ci(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ci(e, t) {
                if (e) {
                    if ("string" == typeof e) return ce(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ce(e, t)
                }
            }
            l7.displayName = "Arrow";
            var cl = "Popper",
                cc = ca(tp(cl), 2),
                cu = cc[0],
                cs = cc[1],
                cf = ca(cu(cl), 2),
                cp = cf[0],
                cd = cf[1],
                cy = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = ca(eu.useState(null), 2),
                        o = n[0],
                        a = n[1];
                    return (0, G.jsx)(cp, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: a,
                        children: r
                    })
                };
            cy.displayName = cl;
            var cm = "PopperAnchor",
                cb = eu.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        o = co(e, ["__scopePopper", "virtualRef"]),
                        a = cd(cm, r),
                        i = eu.useRef(null),
                        l = ti(t, i);
                    return eu.useEffect(function() {
                        a.onAnchorChange((null == n ? void 0 : n.current) || i.current)
                    }), n ? null : (0, G.jsx)(tU.div, cn(cr({}, o), {
                        ref: l
                    }))
                });
            cb.displayName = cm;
            var cv = "PopperContent",
                ch = ca(cu(cv), 2),
                cg = ch[0],
                cO = ch[1],
                cw = eu.forwardRef(function(e, t) {
                    var r, n, o, a, i, l, c, u, s, f, p, d, y = e.__scopePopper,
                        m = e.side,
                        b = e.sideOffset,
                        v = e.align,
                        h = void 0 === v ? "center" : v,
                        g = e.alignOffset,
                        O = e.arrowPadding,
                        w = e.avoidCollisions,
                        j = void 0 === w || w,
                        x = e.collisionBoundary,
                        S = void 0 === x ? [] : x,
                        P = e.collisionPadding,
                        E = void 0 === P ? 0 : P,
                        A = e.sticky,
                        C = e.hideWhenDetached,
                        I = e.updatePositionStrategy,
                        R = void 0 === I ? "optimized" : I,
                        N = e.onPlaced,
                        k = co(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        D = cd(cv, y),
                        T = ca(eu.useState(null), 2),
                        L = T[0],
                        M = T[1],
                        _ = ti(t, function(e) {
                            return M(e)
                        }),
                        U = ca(eu.useState(null), 2),
                        F = U[0],
                        B = U[1],
                        K = (o = (n = function(e) {
                            if (Array.isArray(e)) return e
                        }(r = eu.useState(void 0)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(r) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return l9(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return l9(e, 2)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], a = n[1], ty(function() {
                            if (F) {
                                a({
                                    width: F.offsetWidth,
                                    height: F.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, r, n = e[0];
                                        if ("borderBoxSize" in n) {
                                            var o = n.borderBoxSize,
                                                i = Array.isArray(o) ? o[0] : o;
                                            t = i.inlineSize, r = i.blockSize
                                        } else t = F.offsetWidth, r = F.offsetHeight;
                                        a({
                                            width: t,
                                            height: r
                                        })
                                    }
                                });
                                return e.observe(F, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(F)
                                    }
                            }
                            a(void 0)
                        }, [F]), o),
                        W = null != (i = null == K ? void 0 : K.width) ? i : 0,
                        z = null != (l = null == K ? void 0 : K.height) ? l : 0,
                        H = "number" == typeof E ? E : cr({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, E),
                        V = Array.isArray(S) ? S : [S],
                        X = V.length > 0,
                        q = {
                            padding: H,
                            boundary: V.filter(cP),
                            altBoundary: X
                        },
                        Y = ip({
                            strategy: "fixed",
                            placement: (void 0 === m ? "bottom" : m) + ("center" !== h ? "-" + h : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return a4.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return ce(e)
                                })(t) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || ci(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === R
                                }]))
                            },
                            elements: {
                                reference: D.anchor
                            },
                            middleware: [id({
                                mainAxis: (void 0 === b ? 0 : b) + z,
                                alignmentAxis: void 0 === g ? 0 : g
                            }), j && iy(cr({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === A ? "partial" : A) ? im() : void 0
                            }, q)), j && ib(cr({}, q)), iv(cn(cr({}, q), {
                                apply: function(e) {
                                    var t = e.elements,
                                        r = e.rects,
                                        n = e.availableWidth,
                                        o = e.availableHeight,
                                        a = r.reference,
                                        i = a.width,
                                        l = a.height,
                                        c = t.floating.style;
                                    c.setProperty("--radix-popper-available-width", "".concat(n, "px")), c.setProperty("--radix-popper-available-height", "".concat(o, "px")), c.setProperty("--radix-popper-anchor-width", "".concat(i, "px")), c.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                                }
                            })), F && ig({
                                element: F,
                                padding: void 0 === O ? 0 : O
                            }), cE({
                                arrowWidth: W,
                                arrowHeight: z
                            }), void 0 !== C && C && ih(cr({
                                strategy: "referenceHidden"
                            }, q))]
                        }),
                        $ = Y.refs,
                        Z = Y.floatingStyles,
                        Q = Y.placement,
                        J = Y.isPositioned,
                        ee = Y.middlewareData,
                        et = ca(cA(Q), 2),
                        er = et[0],
                        en = et[1],
                        eo = tO(N);
                    ty(function() {
                        J && (null == eo || eo())
                    }, [J, eo]);
                    var ea = null == (c = ee.arrow) ? void 0 : c.x,
                        ei = null == (u = ee.arrow) ? void 0 : u.y,
                        el = (null == (s = ee.arrow) ? void 0 : s.centerOffset) !== 0,
                        ec = ca(eu.useState(), 2),
                        es = ec[0],
                        ef = ec[1];
                    return ty(function() {
                        L && ef(window.getComputedStyle(L).zIndex)
                    }, [L]), (0, G.jsx)("div", {
                        ref: $.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: cr(cn(cr({}, Z), ct({
                            transform: J ? Z.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: es
                        }, "--radix-popper-transform-origin", [null == (f = ee.transformOrigin) ? void 0 : f.x, null == (p = ee.transformOrigin) ? void 0 : p.y].join(" "))), (null == (d = ee.hide) ? void 0 : d.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, G.jsx)(cg, {
                            scope: y,
                            placedSide: er,
                            onArrowChange: B,
                            arrowX: ea,
                            arrowY: ei,
                            shouldHideArrow: el,
                            children: (0, G.jsx)(tU.div, cn(cr({
                                "data-side": er,
                                "data-align": en
                            }, k), {
                                ref: _,
                                style: cn(cr({}, k.style), {
                                    animation: J ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            cw.displayName = cv;
            var cj = "PopperArrow",
                cx = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                cS = eu.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        o = co(e, ["__scopePopper"]),
                        a = cO(cj, n),
                        i = cx[a.placedSide];
                    return (0, G.jsx)("span", {
                        ref: a.onArrowChange,
                        style: (ct(r = {
                            position: "absolute",
                            left: a.arrowX,
                            top: a.arrowY
                        }, i, 0), ct(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [a.placedSide]), ct(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [a.placedSide]), ct(r, "visibility", a.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, G.jsx)(l7, cn(cr({}, o), {
                            ref: t,
                            style: cn(cr({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function cP(e) {
                return null !== e
            }
            cS.displayName = cj;
            var cE = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var r, n, o, a, i, l = t.placement,
                            c = t.rects,
                            u = t.middlewareData,
                            s = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0,
                            f = s ? 0 : e.arrowWidth,
                            p = s ? 0 : e.arrowHeight,
                            d = ca(cA(l), 2),
                            y = d[0],
                            m = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [d[1]],
                            b = (null != (r = null == (a = u.arrow) ? void 0 : a.x) ? r : 0) + f / 2,
                            v = (null != (n = null == (i = u.arrow) ? void 0 : i.y) ? n : 0) + p / 2,
                            h = "",
                            g = "";
                        return "bottom" === y ? (h = s ? m : "".concat(b, "px"), g = "".concat(-p, "px")) : "top" === y ? (h = s ? m : "".concat(b, "px"), g = "".concat(c.floating.height + p, "px")) : "right" === y ? (h = "".concat(-p, "px"), g = s ? m : "".concat(v, "px")) : "left" === y && (h = "".concat(c.floating.width + p, "px"), g = s ? m : "".concat(v, "px")), {
                            data: {
                                x: h,
                                y: g
                            }
                        }
                    }
                }
            };

            function cA(e) {
                var t = ca(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function cC(e) {
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
            var cI = eu.forwardRef(function(e, t) {
                var r, n;
                return (0, G.jsx)(tU.span, (r = cC({}, e), n = n = {
                    ref: t,
                    style: cC({
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
                    }, e.style)
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(n)).forEach(function(e) {
                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                }), r))
            });

            function cR(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cN(e) {
                if (Array.isArray(e)) return e
            }

            function ck() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function cD(e) {
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

            function cT(e, t) {
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

            function cL(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function cM(e, t) {
                return cN(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || c_(e, t) || ck()
            }

            function c_(e, t) {
                if (e) {
                    if ("string" == typeof e) return cR(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cR(e, t)
                }
            }
            cI.displayName = "VisuallyHidden";
            var cU = [" ", "Enter", "ArrowUp", "ArrowDown"],
                cF = [" ", "Enter"],
                cB = "Select",
                cK = cM((b = (m = l8(tp(y = cB + "CollectionProvider"), 2))[0], v = m[1], g = (h = l8(b(y, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], O = h[1], (w = function(e) {
                    var t = e.scope,
                        r = e.children,
                        n = es().useRef(null),
                        o = es().useRef(new Map).current;
                    return (0, G.jsx)(g, {
                        scope: t,
                        itemMap: o,
                        collectionRef: n,
                        children: r
                    })
                }).displayName = y, x = tk(j = cB + "CollectionSlot"), (S = es().forwardRef(function(e, t) {
                    var r = e.scope,
                        n = e.children,
                        o = ti(t, O(j, r).collectionRef);
                    return (0, G.jsx)(x, {
                        ref: o,
                        children: n
                    })
                })).displayName = j, E = "data-radix-collection-item", A = tk(P = cB + "CollectionItemSlot"), (C = es().forwardRef(function(e, t) {
                    var r, n, o = e.scope,
                        a = e.children,
                        i = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["scope", "children"]),
                        l = es().useRef(null),
                        c = ti(t, l),
                        u = O(P, o);
                    return es().useEffect(function() {
                        return u.itemMap.set(l, l6({
                                ref: l
                            }, i)),
                            function() {
                                u.itemMap.delete(l)
                            }
                    }), (0, G.jsx)(A, (r = l6({}, l3({}, E, "")), n = n = {
                        ref: c,
                        children: a
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                })).displayName = P, [{
                    Provider: w,
                    Slot: S,
                    ItemSlot: C
                }, function(e) {
                    var t = O(cB + "CollectionConsumer", e);
                    return es().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var r = Array.from(e.querySelectorAll("[".concat(E, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return r.indexOf(e.ref.current) - r.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, v]), 3),
                cW = cK[0],
                cz = cK[1],
                cH = cM(tp(cB, [cK[2], cs]), 2),
                cV = cH[0];
            cH[1];
            var cX = cs(),
                cG = cM(cV(cB), 2),
                cq = cG[0],
                cY = cG[1],
                c$ = cM(cV(cB), 2),
                cZ = c$[0],
                cQ = c$[1],
                cJ = function(e) {
                    var t = e.__scopeSelect,
                        r = e.children,
                        n = e.open,
                        o = e.defaultOpen,
                        a = e.onOpenChange,
                        i = e.value,
                        l = e.defaultValue,
                        c = e.onValueChange,
                        u = e.dir,
                        s = e.name,
                        f = e.autoComplete,
                        p = e.disabled,
                        d = e.required,
                        y = e.form,
                        m = cX(t),
                        b = cM(eu.useState(null), 2),
                        v = b[0],
                        h = b[1],
                        g = cM(eu.useState(null), 2),
                        O = g[0],
                        w = g[1],
                        j = cM(eu.useState(!1), 2),
                        x = j[0],
                        S = j[1],
                        P = l4(u),
                        E = cM(tx({
                            prop: n,
                            defaultProp: o,
                            onChange: a
                        }), 2),
                        A = E[0],
                        C = E[1],
                        I = cM(tx({
                            prop: i,
                            defaultProp: l,
                            onChange: c
                        }), 2),
                        R = I[0],
                        N = I[1],
                        k = eu.useRef(null),
                        D = !v || y || !!v.closest("form"),
                        T = cM(eu.useState(new Set), 2),
                        L = T[0],
                        M = T[1],
                        _ = Array.from(L).map(function(e) {
                            return e.props.value
                        }).join(";");
                    return (0, G.jsx)(cy, cT(cD({}, m), {
                        children: (0, G.jsxs)(cq, {
                            required: d,
                            scope: t,
                            trigger: v,
                            onTriggerChange: h,
                            valueNode: O,
                            onValueNodeChange: w,
                            valueNodeHasChildren: x,
                            onValueNodeHasChildrenChange: S,
                            contentId: th(),
                            value: R,
                            onValueChange: N,
                            open: void 0 !== A && A,
                            onOpenChange: C,
                            dir: P,
                            triggerPointerDownPosRef: k,
                            disabled: p,
                            children: [(0, G.jsx)(cW.Provider, {
                                scope: t,
                                children: (0, G.jsx)(cZ, {
                                    scope: e.__scopeSelect,
                                    onNativeOptionAdd: eu.useCallback(function(e) {
                                        M(function(t) {
                                            return new Set(t).add(e)
                                        })
                                    }, []),
                                    onNativeOptionRemove: eu.useCallback(function(e) {
                                        M(function(t) {
                                            var r = new Set(t);
                                            return r.delete(e), r
                                        })
                                    }, []),
                                    children: r
                                })
                            }), D ? (0, G.jsxs)(uC, {
                                "aria-hidden": !0,
                                required: d,
                                tabIndex: -1,
                                name: s,
                                autoComplete: f,
                                value: R,
                                onChange: function(e) {
                                    return N(e.target.value)
                                },
                                disabled: p,
                                form: y,
                                children: [void 0 === R ? (0, G.jsx)("option", {
                                    value: ""
                                }) : null, Array.from(L)]
                            }, _) : null]
                        })
                    }))
                };
            cJ.displayName = cB;
            var c0 = "SelectTrigger",
                c1 = eu.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.disabled,
                        o = cL(e, ["__scopeSelect", "disabled"]),
                        a = cX(r),
                        i = cY(c0, r),
                        l = i.disabled || void 0 !== n && n,
                        c = ti(t, i.onTriggerChange),
                        u = cz(r),
                        s = eu.useRef("touch"),
                        f = cM(uI(function(e) {
                            var t = u().filter(function(e) {
                                    return !e.disabled
                                }),
                                r = t.find(function(e) {
                                    return e.value === i.value
                                }),
                                n = uR(t, e, r);
                            void 0 !== n && i.onValueChange(n.value)
                        }), 3),
                        p = f[0],
                        d = f[1],
                        y = f[2],
                        m = function(e) {
                            l || (i.onOpenChange(!0), y()), e && (i.triggerPointerDownPosRef.current = {
                                x: Math.round(e.pageX),
                                y: Math.round(e.pageY)
                            })
                        };
                    return (0, G.jsx)(cb, cT(cD({
                        asChild: !0
                    }, a), {
                        children: (0, G.jsx)(tU.button, cT(cD({
                            type: "button",
                            role: "combobox",
                            "aria-controls": i.contentId,
                            "aria-expanded": i.open,
                            "aria-required": i.required,
                            "aria-autocomplete": "none",
                            dir: i.dir,
                            "data-state": i.open ? "open" : "closed",
                            disabled: l,
                            "data-disabled": l ? "" : void 0,
                            "data-placeholder": uA(i.value) ? "" : void 0
                        }, o), {
                            ref: c,
                            onClick: tr(o.onClick, function(e) {
                                e.currentTarget.focus(), "mouse" !== s.current && m(e)
                            }),
                            onPointerDown: tr(o.onPointerDown, function(e) {
                                s.current = e.pointerType;
                                var t = e.target;
                                t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (m(e), e.preventDefault())
                            }),
                            onKeyDown: tr(o.onKeyDown, function(e) {
                                var t = "" !== p.current;
                                e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || d(e.key), (!t || " " !== e.key) && cU.includes(e.key) && (m(), e.preventDefault())
                            })
                        }))
                    }))
                });
            c1.displayName = c0;
            var c2 = "SelectValue",
                c3 = eu.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = (e.className, e.style, e.children),
                        o = e.placeholder,
                        a = cL(e, ["__scopeSelect", "className", "style", "children", "placeholder"]),
                        i = cY(c2, r),
                        l = i.onValueNodeHasChildrenChange,
                        c = void 0 !== n,
                        u = ti(t, i.onValueNodeChange);
                    return ty(function() {
                        l(c)
                    }, [l, c]), (0, G.jsx)(tU.span, cT(cD({}, a), {
                        ref: u,
                        style: {
                            pointerEvents: "none"
                        },
                        children: uA(i.value) ? (0, G.jsx)(G.Fragment, {
                            children: void 0 === o ? "" : o
                        }) : n
                    }))
                });
            c3.displayName = c2;
            var c6 = eu.forwardRef(function(e, t) {
                e.__scopeSelect;
                var r = e.children,
                    n = cL(e, ["__scopeSelect", "children"]);
                return (0, G.jsx)(tU.span, cT(cD({
                    "aria-hidden": !0
                }, n), {
                    ref: t,
                    children: r || "▼"
                }))
            });
            c6.displayName = "SelectIcon";
            var c8 = function(e) {
                return (0, G.jsx)(tQ, cD({
                    asChild: !0
                }, e))
            };
            c8.displayName = "SelectPortal";
            var c5 = "SelectContent",
                c4 = eu.forwardRef(function(e, t) {
                    var r = cY(c5, e.__scopeSelect),
                        n = cM(eu.useState(), 2),
                        o = n[0],
                        a = n[1];
                    return (ty(function() {
                        a(new DocumentFragment)
                    }, []), r.open) ? (0, G.jsx)(ur, cT(cD({}, e), {
                        ref: t
                    })) : o ? tP.createPortal((0, G.jsx)(c9, {
                        scope: e.__scopeSelect,
                        children: (0, G.jsx)(cW.Slot, {
                            scope: e.__scopeSelect,
                            children: (0, G.jsx)("div", {
                                children: e.children
                            })
                        })
                    }), o) : null
                });
            c4.displayName = c5;
            var c7 = cM(cV(c5), 2),
                c9 = c7[0],
                ue = c7[1],
                ut = tk("SelectContent.RemoveScroll"),
                ur = eu.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.position,
                        o = void 0 === n ? "item-aligned" : n,
                        a = e.onCloseAutoFocus,
                        i = e.onEscapeKeyDown,
                        l = e.onPointerDownOutside,
                        c = e.side,
                        u = e.sideOffset,
                        s = e.align,
                        f = e.alignOffset,
                        p = e.arrowPadding,
                        d = e.collisionBoundary,
                        y = e.collisionPadding,
                        m = e.sticky,
                        b = e.hideWhenDetached,
                        v = e.avoidCollisions,
                        h = cL(e, ["__scopeSelect", "position", "onCloseAutoFocus", "onEscapeKeyDown", "onPointerDownOutside", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "avoidCollisions"]),
                        g = cY(c5, r),
                        O = cM(eu.useState(null), 2),
                        w = O[0],
                        j = O[1],
                        x = cM(eu.useState(null), 2),
                        S = x[0],
                        P = x[1],
                        E = ti(t, function(e) {
                            return j(e)
                        }),
                        A = cM(eu.useState(null), 2),
                        C = A[0],
                        I = A[1],
                        R = cM(eu.useState(null), 2),
                        N = R[0],
                        k = R[1],
                        D = cz(r),
                        T = cM(eu.useState(!1), 2),
                        L = T[0],
                        M = T[1],
                        _ = eu.useRef(!1);
                    eu.useEffect(function() {
                        if (w) return rB(w)
                    }, [w]), (0, t3.useFocusGuards)();
                    var U = eu.useCallback(function(e) {
                            var t = cN(c = D().map(function(e) {
                                    return e.ref.current
                                })) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(c) || c_(c) || ck(),
                                r = t[0],
                                n = cM(t.slice(1).slice(-1), 1)[0],
                                o = document.activeElement,
                                a = !0,
                                i = !1,
                                l = void 0;
                            try {
                                for (var c, u, s = e[Symbol.iterator](); !(a = (u = s.next()).done); a = !0) {
                                    var f = u.value;
                                    if (f === o || (null == f || f.scrollIntoView({
                                            block: "nearest"
                                        }), f === r && S && (S.scrollTop = 0), f === n && S && (S.scrollTop = S.scrollHeight), null == f || f.focus(), document.activeElement !== o)) return
                                }
                            } catch (e) {
                                i = !0, l = e
                            } finally {
                                try {
                                    a || null == s.return || s.return()
                                } finally {
                                    if (i) throw l
                                }
                            }
                        }, [D, S]),
                        F = eu.useCallback(function() {
                            return U([C, w])
                        }, [U, C, w]);
                    eu.useEffect(function() {
                        L && F()
                    }, [L, F]);
                    var B = g.onOpenChange,
                        K = g.triggerPointerDownPosRef;
                    eu.useEffect(function() {
                        if (w) {
                            var e = {
                                    x: 0,
                                    y: 0
                                },
                                t = function(t) {
                                    var r, n, o, a;
                                    e = {
                                        x: Math.abs(Math.round(t.pageX) - (null != (r = null == (o = K.current) ? void 0 : o.x) ? r : 0)),
                                        y: Math.abs(Math.round(t.pageY) - (null != (n = null == (a = K.current) ? void 0 : a.y) ? n : 0))
                                    }
                                },
                                r = function(r) {
                                    e.x <= 10 && e.y <= 10 ? r.preventDefault() : w.contains(r.target) || B(!1), document.removeEventListener("pointermove", t), K.current = null
                                };
                            return null !== K.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                                    capture: !0,
                                    once: !0
                                })),
                                function() {
                                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                                        capture: !0
                                    })
                                }
                        }
                    }, [w, B, K]), eu.useEffect(function() {
                        var e = function() {
                            return B(!1)
                        };
                        return window.addEventListener("blur", e), window.addEventListener("resize", e),
                            function() {
                                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
                            }
                    }, [B]);
                    var W = cM(uI(function(e) {
                            var t = D().filter(function(e) {
                                    return !e.disabled
                                }),
                                r = t.find(function(e) {
                                    return e.ref.current === document.activeElement
                                }),
                                n = uR(t, e, r);
                            n && setTimeout(function() {
                                return n.ref.current.focus()
                            })
                        }), 2),
                        z = W[0],
                        H = W[1],
                        V = eu.useCallback(function(e, t, r) {
                            var n = !_.current && !r;
                            (void 0 !== g.value && g.value === t || n) && (I(e), n && (_.current = !0))
                        }, [g.value]),
                        X = eu.useCallback(function() {
                            return null == w ? void 0 : w.focus()
                        }, [w]),
                        q = eu.useCallback(function(e, t, r) {
                            var n = !_.current && !r;
                            (void 0 !== g.value && g.value === t || n) && k(e)
                        }, [g.value]),
                        Y = "popper" === o ? uo : un,
                        $ = Y === uo ? {
                            side: c,
                            sideOffset: u,
                            align: s,
                            alignOffset: f,
                            arrowPadding: p,
                            collisionBoundary: d,
                            collisionPadding: y,
                            sticky: m,
                            hideWhenDetached: b,
                            avoidCollisions: v
                        } : {};
                    return (0, G.jsx)(c9, {
                        scope: r,
                        content: w,
                        viewport: S,
                        onViewportChange: P,
                        itemRefCallback: V,
                        selectedItem: C,
                        onItemLeave: X,
                        itemTextRefCallback: q,
                        focusSelectedItem: F,
                        selectedItemText: N,
                        position: o,
                        isPositioned: L,
                        searchRef: z,
                        children: (0, G.jsx)(rD, {
                            as: ut,
                            allowPinchZoom: !0,
                            children: (0, G.jsx)(tV, {
                                asChild: !0,
                                trapped: g.open,
                                onMountAutoFocus: function(e) {
                                    e.preventDefault()
                                },
                                onUnmountAutoFocus: tr(a, function(e) {
                                    var t;
                                    null == (t = g.trigger) || t.focus({
                                        preventScroll: !0
                                    }), e.preventDefault()
                                }),
                                children: (0, G.jsx)(tS.DismissableLayer, {
                                    asChild: !0,
                                    disableOutsidePointerEvents: !0,
                                    onEscapeKeyDown: i,
                                    onPointerDownOutside: l,
                                    onFocusOutside: function(e) {
                                        return e.preventDefault()
                                    },
                                    onDismiss: function() {
                                        return g.onOpenChange(!1)
                                    },
                                    children: (0, G.jsx)(Y, cT(cD({
                                        role: "listbox",
                                        id: g.contentId,
                                        "data-state": g.open ? "open" : "closed",
                                        dir: g.dir,
                                        onContextMenu: function(e) {
                                            return e.preventDefault()
                                        }
                                    }, h, $), {
                                        onPlaced: function() {
                                            return M(!0)
                                        },
                                        ref: E,
                                        style: cD({
                                            display: "flex",
                                            flexDirection: "column",
                                            outline: "none"
                                        }, h.style),
                                        onKeyDown: tr(h.onKeyDown, function(e) {
                                            var t = e.ctrlKey || e.altKey || e.metaKey;
                                            if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || H(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                                var r = D().filter(function(e) {
                                                    return !e.disabled
                                                }).map(function(e) {
                                                    return e.ref.current
                                                });
                                                if (["ArrowUp", "End"].includes(e.key) && (r = r.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                                    var n = e.target,
                                                        o = r.indexOf(n);
                                                    r = r.slice(o + 1)
                                                }
                                                setTimeout(function() {
                                                    return U(r)
                                                }), e.preventDefault()
                                            }
                                        })
                                    }))
                                })
                            })
                        })
                    })
                });
            ur.displayName = "SelectContentImpl";
            var un = eu.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.onPlaced,
                    o = cL(e, ["__scopeSelect", "onPlaced"]),
                    a = cY(c5, r),
                    i = ue(c5, r),
                    l = cM(eu.useState(null), 2),
                    c = l[0],
                    u = l[1],
                    s = cM(eu.useState(null), 2),
                    f = s[0],
                    p = s[1],
                    d = ti(t, function(e) {
                        return p(e)
                    }),
                    y = cz(r),
                    m = eu.useRef(!1),
                    b = eu.useRef(!0),
                    v = i.viewport,
                    h = i.selectedItem,
                    g = i.selectedItemText,
                    O = i.focusSelectedItem,
                    w = eu.useCallback(function() {
                        if (a.trigger && a.valueNode && c && f && v && h && g) {
                            var e = a.trigger.getBoundingClientRect(),
                                t = f.getBoundingClientRect(),
                                r = a.valueNode.getBoundingClientRect(),
                                o = g.getBoundingClientRect();
                            if ("rtl" !== a.dir) {
                                var i = o.left - t.left,
                                    l = r.left - i,
                                    u = e.left - l,
                                    s = e.width + u,
                                    p = Math.max(s, t.width),
                                    d = l1(l, [10, Math.max(10, window.innerWidth - 10 - p)]);
                                c.style.minWidth = s + "px", c.style.left = d + "px"
                            } else {
                                var b = t.right - o.right,
                                    O = window.innerWidth - r.right - b,
                                    w = window.innerWidth - e.right - O,
                                    j = e.width + w,
                                    x = Math.max(j, t.width),
                                    S = l1(O, [10, Math.max(10, window.innerWidth - 10 - x)]);
                                c.style.minWidth = j + "px", c.style.right = S + "px"
                            }
                            var P = y(),
                                E = window.innerHeight - 20,
                                A = v.scrollHeight,
                                C = window.getComputedStyle(f),
                                I = parseInt(C.borderTopWidth, 10),
                                R = parseInt(C.paddingTop, 10),
                                N = parseInt(C.borderBottomWidth, 10),
                                k = I + R + A + parseInt(C.paddingBottom, 10) + N,
                                D = Math.min(5 * h.offsetHeight, k),
                                T = window.getComputedStyle(v),
                                L = parseInt(T.paddingTop, 10),
                                M = parseInt(T.paddingBottom, 10),
                                _ = e.top + e.height / 2 - 10,
                                U = h.offsetHeight / 2,
                                F = I + R + (h.offsetTop + U);
                            if (F <= _) {
                                var B = P.length > 0 && h === P[P.length - 1].ref.current;
                                c.style.bottom = "0px";
                                var K = Math.max(E - _, U + (B ? M : 0) + (f.clientHeight - v.offsetTop - v.offsetHeight) + N);
                                c.style.height = F + K + "px"
                            } else {
                                var W = P.length > 0 && h === P[0].ref.current;
                                c.style.top = "0px";
                                var z = Math.max(_, I + v.offsetTop + (W ? L : 0) + U);
                                c.style.height = z + (k - F) + "px", v.scrollTop = F - _ + v.offsetTop
                            }
                            c.style.margin = "".concat(10, "px 0"), c.style.minHeight = D + "px", c.style.maxHeight = E + "px", null == n || n(), requestAnimationFrame(function() {
                                return m.current = !0
                            })
                        }
                    }, [y, a.trigger, a.valueNode, c, f, v, h, g, a.dir, n]);
                ty(function() {
                    return w()
                }, [w]);
                var j = cM(eu.useState(), 2),
                    x = j[0],
                    S = j[1];
                ty(function() {
                    f && S(window.getComputedStyle(f).zIndex)
                }, [f]);
                var P = eu.useCallback(function(e) {
                    e && !0 === b.current && (w(), null == O || O(), b.current = !1)
                }, [w, O]);
                return (0, G.jsx)(ui, {
                    scope: r,
                    contentWrapper: c,
                    shouldExpandOnScrollRef: m,
                    onScrollButtonChange: P,
                    children: (0, G.jsx)("div", {
                        ref: u,
                        style: {
                            display: "flex",
                            flexDirection: "column",
                            position: "fixed",
                            zIndex: x
                        },
                        children: (0, G.jsx)(tU.div, cT(cD({}, o), {
                            ref: d,
                            style: cD({
                                boxSizing: "border-box",
                                maxHeight: "100%"
                            }, o.style)
                        }))
                    })
                })
            });
            un.displayName = "SelectItemAlignedPosition";
            var uo = eu.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.align,
                    o = e.collisionPadding,
                    a = cL(e, ["__scopeSelect", "align", "collisionPadding"]),
                    i = cX(r);
                return (0, G.jsx)(cw, cT(cD({}, i, a), {
                    ref: t,
                    align: void 0 === n ? "start" : n,
                    collisionPadding: void 0 === o ? 10 : o,
                    style: cD({
                        boxSizing: "border-box"
                    }, a.style, {
                        "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                        "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                        "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                        "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                        "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
                    })
                }))
            });
            uo.displayName = "SelectPopperPosition";
            var ua = cM(cV(c5, {}), 2),
                ui = ua[0],
                ul = ua[1],
                uc = "SelectViewport",
                uu = eu.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.nonce,
                        o = cL(e, ["__scopeSelect", "nonce"]),
                        a = ue(uc, r),
                        i = ul(uc, r),
                        l = ti(t, a.onViewportChange),
                        c = eu.useRef(0);
                    return (0, G.jsxs)(G.Fragment, {
                        children: [(0, G.jsx)("style", {
                            dangerouslySetInnerHTML: {
                                __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                            },
                            nonce: n
                        }), (0, G.jsx)(cW.Slot, {
                            scope: r,
                            children: (0, G.jsx)(tU.div, cT(cD({
                                "data-radix-select-viewport": "",
                                role: "presentation"
                            }, o), {
                                ref: l,
                                style: cD({
                                    position: "relative",
                                    flex: 1,
                                    overflow: "hidden auto"
                                }, o.style),
                                onScroll: tr(o.onScroll, function(e) {
                                    var t = e.currentTarget,
                                        r = i.contentWrapper,
                                        n = i.shouldExpandOnScrollRef;
                                    if ((null == n ? void 0 : n.current) && r) {
                                        var o = Math.abs(c.current - t.scrollTop);
                                        if (o > 0) {
                                            var a = window.innerHeight - 20,
                                                l = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                            if (l < a) {
                                                var u = l + o,
                                                    s = Math.min(a, u),
                                                    f = u - s;
                                                r.style.height = s + "px", "0px" === r.style.bottom && (t.scrollTop = f > 0 ? f : 0, r.style.justifyContent = "flex-end")
                                            }
                                        }
                                    }
                                    c.current = t.scrollTop
                                })
                            }))
                        })]
                    })
                });
            uu.displayName = uc;
            var us = "SelectGroup",
                uf = cM(cV(us), 2),
                up = uf[0],
                ud = uf[1];
            eu.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = cL(e, ["__scopeSelect"]),
                    o = th();
                return (0, G.jsx)(up, {
                    scope: r,
                    id: o,
                    children: (0, G.jsx)(tU.div, cT(cD({
                        role: "group",
                        "aria-labelledby": o
                    }, n), {
                        ref: t
                    }))
                })
            }).displayName = us;
            var uy = "SelectLabel";
            eu.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = cL(e, ["__scopeSelect"]),
                    o = ud(uy, r);
                return (0, G.jsx)(tU.div, cT(cD({
                    id: o.id
                }, n), {
                    ref: t
                }))
            }).displayName = uy;
            var um = "SelectItem",
                ub = cM(cV(um), 2),
                uv = ub[0],
                uh = ub[1],
                ug = eu.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.value,
                        o = e.disabled,
                        a = void 0 !== o && o,
                        i = e.textValue,
                        l = cL(e, ["__scopeSelect", "value", "disabled", "textValue"]),
                        c = cY(um, r),
                        u = ue(um, r),
                        s = c.value === n,
                        f = cM(eu.useState(null != i ? i : ""), 2),
                        p = f[0],
                        d = f[1],
                        y = cM(eu.useState(!1), 2),
                        m = y[0],
                        b = y[1],
                        v = ti(t, function(e) {
                            var t;
                            return null == (t = u.itemRefCallback) ? void 0 : t.call(u, e, n, a)
                        }),
                        h = th(),
                        g = eu.useRef("touch"),
                        O = function() {
                            a || (c.onValueChange(n), c.onOpenChange(!1))
                        };
                    if ("" === n) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
                    return (0, G.jsx)(uv, {
                        scope: r,
                        value: n,
                        disabled: a,
                        textId: h,
                        isSelected: s,
                        onItemTextChange: eu.useCallback(function(e) {
                            d(function(t) {
                                var r;
                                return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                            })
                        }, []),
                        children: (0, G.jsx)(cW.ItemSlot, {
                            scope: r,
                            value: n,
                            disabled: a,
                            textValue: p,
                            children: (0, G.jsx)(tU.div, cT(cD({
                                role: "option",
                                "aria-labelledby": h,
                                "data-highlighted": m ? "" : void 0,
                                "aria-selected": s && m,
                                "data-state": s ? "checked" : "unchecked",
                                "aria-disabled": a || void 0,
                                "data-disabled": a ? "" : void 0,
                                tabIndex: a ? void 0 : -1
                            }, l), {
                                ref: v,
                                onFocus: tr(l.onFocus, function() {
                                    return b(!0)
                                }),
                                onBlur: tr(l.onBlur, function() {
                                    return b(!1)
                                }),
                                onClick: tr(l.onClick, function() {
                                    "mouse" !== g.current && O()
                                }),
                                onPointerUp: tr(l.onPointerUp, function() {
                                    "mouse" === g.current && O()
                                }),
                                onPointerDown: tr(l.onPointerDown, function(e) {
                                    g.current = e.pointerType
                                }),
                                onPointerMove: tr(l.onPointerMove, function(e) {
                                    if (g.current = e.pointerType, a) {
                                        var t;
                                        null == (t = u.onItemLeave) || t.call(u)
                                    } else "mouse" === g.current && e.currentTarget.focus({
                                        preventScroll: !0
                                    })
                                }),
                                onPointerLeave: tr(l.onPointerLeave, function(e) {
                                    if (e.currentTarget === document.activeElement) {
                                        var t;
                                        null == (t = u.onItemLeave) || t.call(u)
                                    }
                                }),
                                onKeyDown: tr(l.onKeyDown, function(e) {
                                    var t;
                                    ((null == (t = u.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (cF.includes(e.key) && O(), " " === e.key && e.preventDefault())
                                })
                            }))
                        })
                    })
                });
            ug.displayName = um;
            var uO = "SelectItemText",
                uw = eu.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = (e.className, e.style, cL(e, ["__scopeSelect", "className", "style"])),
                        o = cY(uO, r),
                        a = ue(uO, r),
                        i = uh(uO, r),
                        l = cQ(uO, r),
                        c = cM(eu.useState(null), 2),
                        u = c[0],
                        s = c[1],
                        f = ti(t, function(e) {
                            return s(e)
                        }, i.onItemTextChange, function(e) {
                            var t;
                            return null == (t = a.itemTextRefCallback) ? void 0 : t.call(a, e, i.value, i.disabled)
                        }),
                        p = null == u ? void 0 : u.textContent,
                        d = eu.useMemo(function() {
                            return (0, G.jsx)("option", {
                                value: i.value,
                                disabled: i.disabled,
                                children: p
                            }, i.value)
                        }, [i.disabled, i.value, p]),
                        y = l.onNativeOptionAdd,
                        m = l.onNativeOptionRemove;
                    return ty(function() {
                        return y(d),
                            function() {
                                return m(d)
                            }
                    }, [y, m, d]), (0, G.jsxs)(G.Fragment, {
                        children: [(0, G.jsx)(tU.span, cT(cD({
                            id: i.textId
                        }, n), {
                            ref: f
                        })), i.isSelected && o.valueNode && !o.valueNodeHasChildren ? tP.createPortal(n.children, o.valueNode) : null]
                    })
                });
            uw.displayName = uO;
            var uj = "SelectItemIndicator";
            eu.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = cL(e, ["__scopeSelect"]);
                return uh(uj, r).isSelected ? (0, G.jsx)(tU.span, cT(cD({
                    "aria-hidden": !0
                }, n), {
                    ref: t
                })) : null
            }).displayName = uj;
            var ux = "SelectScrollUpButton";
            eu.forwardRef(function(e, t) {
                var r = ue(ux, e.__scopeSelect),
                    n = ul(ux, e.__scopeSelect),
                    o = cM(eu.useState(!1), 2),
                    a = o[0],
                    i = o[1],
                    l = ti(t, n.onScrollButtonChange);
                return ty(function() {
                    if (r.viewport && r.isPositioned) {
                        var e = function() {
                                i(t.scrollTop > 0)
                            },
                            t = r.viewport;
                        return e(), t.addEventListener("scroll", e),
                            function() {
                                return t.removeEventListener("scroll", e)
                            }
                    }
                }, [r.viewport, r.isPositioned]), a ? (0, G.jsx)(uP, cT(cD({}, e), {
                    ref: l,
                    onAutoScroll: function() {
                        var e = r.viewport,
                            t = r.selectedItem;
                        e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
                    }
                })) : null
            }).displayName = ux;
            var uS = "SelectScrollDownButton";
            eu.forwardRef(function(e, t) {
                var r = ue(uS, e.__scopeSelect),
                    n = ul(uS, e.__scopeSelect),
                    o = cM(eu.useState(!1), 2),
                    a = o[0],
                    i = o[1],
                    l = ti(t, n.onScrollButtonChange);
                return ty(function() {
                    if (r.viewport && r.isPositioned) {
                        var e = function() {
                                var e = t.scrollHeight - t.clientHeight;
                                i(Math.ceil(t.scrollTop) < e)
                            },
                            t = r.viewport;
                        return e(), t.addEventListener("scroll", e),
                            function() {
                                return t.removeEventListener("scroll", e)
                            }
                    }
                }, [r.viewport, r.isPositioned]), a ? (0, G.jsx)(uP, cT(cD({}, e), {
                    ref: l,
                    onAutoScroll: function() {
                        var e = r.viewport,
                            t = r.selectedItem;
                        e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
                    }
                })) : null
            }).displayName = uS;
            var uP = eu.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.onAutoScroll,
                    o = cL(e, ["__scopeSelect", "onAutoScroll"]),
                    a = ue("SelectScrollButton", r),
                    i = eu.useRef(null),
                    l = cz(r),
                    c = eu.useCallback(function() {
                        null !== i.current && (window.clearInterval(i.current), i.current = null)
                    }, []);
                return eu.useEffect(function() {
                    return function() {
                        return c()
                    }
                }, [c]), ty(function() {
                    var e, t = l().find(function(e) {
                        return e.ref.current === document.activeElement
                    });
                    null == t || null == (e = t.ref.current) || e.scrollIntoView({
                        block: "nearest"
                    })
                }, [l]), (0, G.jsx)(tU.div, cT(cD({
                    "aria-hidden": !0
                }, o), {
                    ref: t,
                    style: cD({
                        flexShrink: 0
                    }, o.style),
                    onPointerDown: tr(o.onPointerDown, function() {
                        null === i.current && (i.current = window.setInterval(n, 50))
                    }),
                    onPointerMove: tr(o.onPointerMove, function() {
                        var e;
                        null == (e = a.onItemLeave) || e.call(a), null === i.current && (i.current = window.setInterval(n, 50))
                    }),
                    onPointerLeave: tr(o.onPointerLeave, function() {
                        c()
                    })
                }))
            });
            eu.forwardRef(function(e, t) {
                e.__scopeSelect;
                var r = cL(e, ["__scopeSelect"]);
                return (0, G.jsx)(tU.div, cT(cD({
                    "aria-hidden": !0
                }, r), {
                    ref: t
                }))
            }).displayName = "SelectSeparator";
            var uE = "SelectArrow";

            function uA(e) {
                return "" === e || void 0 === e
            }
            eu.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = cL(e, ["__scopeSelect"]),
                    o = cX(r),
                    a = cY(uE, r),
                    i = ue(uE, r);
                return a.open && "popper" === i.position ? (0, G.jsx)(cS, cT(cD({}, o, n), {
                    ref: t
                })) : null
            }).displayName = uE;
            var uC = eu.forwardRef(function(e, t) {
                var r, n = e.value,
                    o = cL(e, ["value"]),
                    a = eu.useRef(null),
                    i = ti(t, a),
                    l = (r = eu.useRef({
                        value: n,
                        previous: n
                    }), eu.useMemo(function() {
                        return r.current.value !== n && (r.current.previous = r.current.value, r.current.value = n), r.current.previous
                    }, [n]));
                return eu.useEffect(function() {
                    var e = a.current,
                        t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
                    if (l !== n && t) {
                        var r = new Event("change", {
                            bubbles: !0
                        });
                        t.call(e, n), e.dispatchEvent(r)
                    }
                }, [l, n]), (0, G.jsx)(cI, {
                    asChild: !0,
                    children: (0, G.jsx)("select", cT(cD({}, o), {
                        ref: i,
                        defaultValue: n
                    }))
                })
            });

            function uI(e) {
                var t = tO(e),
                    r = eu.useRef(""),
                    n = eu.useRef(0),
                    o = eu.useCallback(function(e) {
                        var o = r.current + e;
                        t(o),
                            function e(t) {
                                r.current = t, window.clearTimeout(n.current), "" !== t && (n.current = window.setTimeout(function() {
                                    return e("")
                                }, 1e3))
                            }(o)
                    }, [t]),
                    a = eu.useCallback(function() {
                        r.current = "", window.clearTimeout(n.current)
                    }, []);
                return eu.useEffect(function() {
                    return function() {
                        return window.clearTimeout(n.current)
                    }
                }, []), [r, o, a]
            }

            function uR(e, t, r) {
                var n, o, a = t.length > 1 && Array.from(t).every(function(e) {
                        return e === t[0]
                    }) ? t[0] : t,
                    i = r ? e.indexOf(r) : -1,
                    l = (n = e, o = Math.max(i, 0), n.map(function(e, t) {
                        return n[(o + t) % n.length]
                    }));
                1 === a.length && (l = l.filter(function(e) {
                    return e !== r
                }));
                var c = l.find(function(e) {
                    return e.textValue.toLowerCase().startsWith(a.toLowerCase())
                });
                return c !== r ? c : void 0
            }
            uC.displayName = "BubbleSelect";
            var uN = (0, eu.createContext)(null),
                uk = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-600"
                },
                uD = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                uT = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                uL = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                uM = {
                    XSmall: "gap-xsmall",
                    Small: "gap-small",
                    Medium: "gap-small",
                    Large: "gap-small"
                },
                u_ = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                uU = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                uF = (0, eu.forwardRef)(function(e, t) {
                    var r = e.label,
                        n = e.labelTooltip,
                        o = e.ariaLabelledBy,
                        a = e.ariaLabel,
                        i = e.className,
                        l = e.size,
                        c = e.variant,
                        u = void 0 === c ? "Standard" : c,
                        s = e.value,
                        f = e.placeholder,
                        p = e.isDisabled,
                        d = e.hasError,
                        y = e.hint,
                        m = e.onValueChange,
                        b = e.onOpenChange,
                        v = e.children,
                        h = ox(),
                        g = (0, eu.useMemo)(function() {
                            return {
                                size: l
                            }
                        }, [l]),
                        O = r ? es().createElement("span", {
                            id: h,
                            className: e0(uT[l], "content-emphasis")
                        }, r) : null;
                    return es().createElement(uN.Provider, {
                        value: g
                    }, es().createElement("div", {
                        className: e0("flex flex-col", p && ["opacity-[0.5]", "pointer-events-none"], uM[l], i)
                    }, O && (n ? es().createElement("div", {
                        className: "flex items-center gap-xsmall"
                    }, O, es().createElement(lZ, n)) : O), es().createElement(cJ, {
                        value: s,
                        disabled: p,
                        onValueChange: m,
                        onOpenChange: b
                    }, es().createElement(c1, {
                        className: e0("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", lQ[u], lJ[u], u_[l], uU[l], uD[l], uL[l], d ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === s ? "content-muted" : "content-default"),
                        ref: t,
                        "aria-labelledby": r ? h : o,
                        "aria-label": a
                    }, es().createElement(e2, null), es().createElement("div", {
                        className: "grow-1 text-truncate-split text-align-x-left"
                    }, es().createElement(c3, {
                        placeholder: f
                    })), es().createElement(c6, {
                        className: e0(uk[l], "icon icon-regular-chevron-large-down content-default")
                    })), es().createElement(c8, null, es().createElement(c4, {
                        position: "popper",
                        className: "padding-y-small foundation-web-portal-zindex",
                        style: {
                            maxHeight: "var(--radix-select-content-available-height)"
                        }
                    }, v))), y && es().createElement("span", {
                        className: e0("text-caption-small", {
                            "content-system-alert": d,
                            "content-default": !d
                        })
                    }, y)))
                });

            function uB(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function uK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            uF.displayName = "Dropdown", "u" > typeof window && window.document && window.document.createElement;

            function uW(e, t, r) {
                return (uW = uY() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && uX(o, r.prototype), o
                }).apply(null, arguments)
            }

            function uz(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function uH(e) {
                return (uH = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function uV(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        uz(e, t, r[t])
                    })
                }
                return e
            }

            function uX(e, t) {
                return (uX = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function uG(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
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

            function uq(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (uq = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return uW(e, arguments, uH(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), uX(r, e)
                })(e)
            }

            function uY() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (uY = function() {
                    return !!e
                })()
            }

            function u$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uZ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return u$(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return u$(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            uq(Map);
            var uQ = eu[" useInsertionEffect ".trim().toString()] || ty;

            function uJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function u0(e) {
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

            function u1(e, t) {
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

            function u2(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function u3(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || u6(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function u6(e, t) {
                if (e) {
                    if ("string" == typeof e) return uJ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uJ(e, t)
                }
            }
            Symbol("RADIX:SYNC_STATE");
            var u8 = "rovingFocusGroup.onEntryFocus",
                u5 = {
                    bubbles: !1,
                    cancelable: !0
                },
                u4 = "RovingFocusGroup",
                u7 = u3((N = (R = uG(tp(I = u4 + "CollectionProvider"), 2))[0], k = R[1], T = (D = uG(N(I, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], L = D[1], (M = function(e) {
                    var t = e.scope,
                        r = e.children,
                        n = es().useRef(null),
                        o = es().useRef(new Map).current;
                    return (0, G.jsx)(T, {
                        scope: t,
                        itemMap: o,
                        collectionRef: n,
                        children: r
                    })
                }).displayName = I, U = nO(_ = u4 + "CollectionSlot"), (F = es().forwardRef(function(e, t) {
                    var r = e.scope,
                        n = e.children,
                        o = ti(t, L(_, r).collectionRef);
                    return (0, G.jsx)(U, {
                        ref: o,
                        children: n
                    })
                })).displayName = _, K = "data-radix-collection-item", W = nO(B = u4 + "CollectionItemSlot"), (z = es().forwardRef(function(e, t) {
                    var r, n, o = e.scope,
                        a = e.children,
                        i = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["scope", "children"]),
                        l = es().useRef(null),
                        c = ti(t, l),
                        u = L(B, o);
                    return es().useEffect(function() {
                        return u.itemMap.set(l, uV({
                                ref: l
                            }, i)),
                            function() {
                                u.itemMap.delete(l)
                            }
                    }), (0, G.jsx)(W, (r = uV({}, uz({}, K, "")), n = n = {
                        ref: c,
                        children: a
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                })).displayName = B, [{
                    Provider: M,
                    Slot: F,
                    ItemSlot: z
                }, function(e) {
                    var t = L(u4 + "CollectionConsumer", e);
                    return es().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var r = Array.from(e.querySelectorAll("[".concat(K, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return r.indexOf(e.ref.current) - r.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, k]), 3),
                u9 = u7[0],
                se = u7[1],
                st = u3(tp(u4, [u7[2]]), 2),
                sr = st[0];
            st[1];
            var sn = u3(sr(u4), 2),
                so = sn[0],
                sa = sn[1],
                si = eu.forwardRef(function(e, t) {
                    return (0, G.jsx)(u9.Provider, {
                        scope: e.__scopeRovingFocusGroup,
                        children: (0, G.jsx)(u9.Slot, {
                            scope: e.__scopeRovingFocusGroup,
                            children: (0, G.jsx)(sl, u1(u0({}, e), {
                                ref: t
                            }))
                        })
                    })
                });
            si.displayName = u4;
            var sl = eu.forwardRef(function(e, t) {
                    var r, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, O, w, j = e.__scopeRovingFocusGroup,
                        x = e.orientation,
                        S = e.loop,
                        P = e.dir,
                        E = e.currentTabStopId,
                        A = e.defaultCurrentTabStopId,
                        C = e.onCurrentTabStopIdChange,
                        I = e.onEntryFocus,
                        R = e.preventScrollOnEntryFocus,
                        N = void 0 !== R && R,
                        k = u2(e, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        D = eu.useRef(null),
                        T = ti(t, D),
                        L = l4(P),
                        M = u3((f = (s = {
                            prop: E,
                            defaultProp: null != A ? A : null,
                            onChange: C,
                            caller: u4
                        }).prop, p = s.defaultProp, d = s.onChange, y = s.caller, b = (m = uZ((n = (r = {
                            defaultProp: p,
                            onChange: void 0 === d ? function() {} : d
                        }).defaultProp, o = r.onChange, i = (a = uZ(eu.useState(n), 2))[0], l = a[1], c = eu.useRef(i), u = eu.useRef(o), uQ(function() {
                            u.current = o
                        }, [o]), eu.useEffect(function() {
                            if (c.current !== i) {
                                var e;
                                null == (e = u.current) || e.call(u, i), c.current = i
                            }
                        }, [i, c]), [i, l, u]), 3))[0], v = m[1], h = m[2], O = (g = void 0 !== f) ? f : b, w = eu.useRef(void 0 !== f), eu.useEffect(function() {
                            var e = w.current;
                            if (e !== g) {
                                var t = g ? "controlled" : "uncontrolled";
                                console.warn("".concat(y, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                            }
                            w.current = g
                        }, [g, y]), [O, eu.useCallback(function(e) {
                            if (g) {
                                var t, r = "function" == typeof e ? e(f) : e;
                                r !== f && (null == (t = h.current) || t.call(h, r))
                            } else v(e)
                        }, [g, f, v, h])]), 2),
                        _ = M[0],
                        U = M[1],
                        F = u3(eu.useState(!1), 2),
                        B = F[0],
                        K = F[1],
                        W = tO(I),
                        z = se(j),
                        H = eu.useRef(!1),
                        V = u3(eu.useState(0), 2),
                        X = V[0],
                        q = V[1];
                    return eu.useEffect(function() {
                        var e = D.current;
                        if (e) return e.addEventListener(u8, W),
                            function() {
                                return e.removeEventListener(u8, W)
                            }
                    }, [W]), (0, G.jsx)(so, {
                        scope: j,
                        orientation: x,
                        dir: L,
                        loop: void 0 !== S && S,
                        currentTabStopId: _,
                        onItemFocus: eu.useCallback(function(e) {
                            return U(e)
                        }, [U]),
                        onItemShiftTab: eu.useCallback(function() {
                            return K(!0)
                        }, []),
                        onFocusableItemAdd: eu.useCallback(function() {
                            return q(function(e) {
                                return e + 1
                            })
                        }, []),
                        onFocusableItemRemove: eu.useCallback(function() {
                            return q(function(e) {
                                return e - 1
                            })
                        }, []),
                        children: (0, G.jsx)(nE.div, u1(u0({
                            tabIndex: B || 0 === X ? -1 : 0,
                            "data-orientation": x
                        }, k), {
                            ref: T,
                            style: u0({
                                outline: "none"
                            }, e.style),
                            onMouseDown: uB(e.onMouseDown, function() {
                                H.current = !0
                            }),
                            onFocus: uB(e.onFocus, function(e) {
                                var t = !H.current;
                                if (e.target === e.currentTarget && t && !B) {
                                    var r = new CustomEvent(u8, u5);
                                    if (e.currentTarget.dispatchEvent(r), !r.defaultPrevented) {
                                        var n = z().filter(function(e) {
                                            return e.focusable
                                        });
                                        sf([n.find(function(e) {
                                            return e.active
                                        }), n.find(function(e) {
                                            return e.id === _
                                        })].concat(function(e) {
                                            if (Array.isArray(e)) return uJ(e)
                                        }(n) || function(e) {
                                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(n) || u6(n) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()).filter(Boolean).map(function(e) {
                                            return e.ref.current
                                        }), N)
                                    }
                                }
                                H.current = !1
                            }),
                            onBlur: uB(e.onBlur, function() {
                                return K(!1)
                            })
                        }))
                    })
                }),
                sc = "RovingFocusGroupItem",
                su = eu.forwardRef(function(e, t) {
                    var r = e.__scopeRovingFocusGroup,
                        n = e.focusable,
                        o = void 0 === n || n,
                        a = e.active,
                        i = e.tabStopId,
                        l = e.children,
                        c = u2(e, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        u = th(),
                        s = i || u,
                        f = sa(sc, r),
                        p = f.currentTabStopId === s,
                        d = se(r),
                        y = f.onFocusableItemAdd,
                        m = f.onFocusableItemRemove,
                        b = f.currentTabStopId;
                    return eu.useEffect(function() {
                        if (o) return y(),
                            function() {
                                return m()
                            }
                    }, [o, y, m]), (0, G.jsx)(u9.ItemSlot, {
                        scope: r,
                        id: s,
                        focusable: o,
                        active: void 0 !== a && a,
                        children: (0, G.jsx)(nE.span, u1(u0({
                            tabIndex: p ? 0 : -1,
                            "data-orientation": f.orientation
                        }, c), {
                            ref: t,
                            onMouseDown: uB(e.onMouseDown, function(e) {
                                o ? f.onItemFocus(s) : e.preventDefault()
                            }),
                            onFocus: uB(e.onFocus, function() {
                                return f.onItemFocus(s)
                            }),
                            onKeyDown: uB(e.onKeyDown, function(e) {
                                if ("Tab" === e.key && e.shiftKey) return void f.onItemShiftTab();
                                if (e.target === e.currentTarget) {
                                    var t = function(e, t, r) {
                                        var n, o = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                                        if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return ss[o]
                                    }(e, f.orientation, f.dir);
                                    if (void 0 !== t) {
                                        if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                                        e.preventDefault();
                                        var r = d().filter(function(e) {
                                            return e.focusable
                                        }).map(function(e) {
                                            return e.ref.current
                                        });
                                        if ("last" === t) r.reverse();
                                        else if ("prev" === t || "next" === t) {
                                            "prev" === t && r.reverse();
                                            var n, o, a = r.indexOf(e.currentTarget);
                                            r = f.loop ? (n = r, o = a + 1, n.map(function(e, t) {
                                                return n[(o + t) % n.length]
                                            })) : r.slice(a + 1)
                                        }
                                        setTimeout(function() {
                                            return sf(r)
                                        })
                                    }
                                }
                            }),
                            children: "function" == typeof l ? l({
                                isCurrentTabStop: p,
                                hasTabStop: null != b
                            }) : l
                        }))
                    })
                });
            su.displayName = sc;
            var ss = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function sf(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    r = document.activeElement,
                    n = !0,
                    o = !1,
                    a = void 0;
                try {
                    for (var i, l = e[Symbol.iterator](); !(n = (i = l.next()).done); n = !0) {
                        var c = i.value;
                        if (c === r || (c.focus({
                                preventScroll: t
                            }), document.activeElement !== r)) return
                    }
                } catch (e) {
                    o = !0, a = e
                } finally {
                    try {
                        n || null == l.return || l.return()
                    } finally {
                        if (o) throw a
                    }
                }
            }

            function sp(e) {
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

            function sd(e, t) {
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

            function sy(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }
            var sm = {
                    XSmall: "radius-medium",
                    Small: "radius-large",
                    Medium: "radius-large",
                    Large: "radius-large"
                },
                sb = {
                    XSmall: "padding-xsmall",
                    Small: "padding-small",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                sv = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                sh = {
                    XSmall: "padding-y-xsmall",
                    Small: "padding-y-small",
                    Medium: "padding-y-small",
                    Large: "padding-y-medium"
                },
                sg = {
                    XSmall: "gap-x-medium",
                    Small: "gap-x-medium",
                    Medium: "gap-x-medium",
                    Large: "gap-x-large"
                },
                sO = {
                    XSmall: "gap-y-xxsmall",
                    Small: "gap-y-xxsmall",
                    Medium: "gap-y-xsmall",
                    Large: "gap-y-xsmall"
                },
                sw = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                sj = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                sx = (0, eu.createContext)(null),
                sS = function() {
                    var e = (0, eu.useContext)(sx);
                    if (!e) throw Error("Menu components must be used within a Menu");
                    return e
                },
                sP = function(e) {
                    var t, r = e.children,
                        n = e.className,
                        o = e.size,
                        a = (0, eu.useContext)(uN),
                        i = a ? "dropdown" : "standalone",
                        l = null != (t = null != o ? o : null == a ? void 0 : a.size) ? t : "Medium",
                        c = (0, eu.useMemo)(function() {
                            return {
                                size: l,
                                mode: i
                            }
                        }, [l, i]),
                        u = e0("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", sm[l], n),
                        s = "standalone" === i ? es().createElement(si, {
                            asChild: !0,
                            orientation: "vertical",
                            loop: !0
                        }, es().createElement("div", {
                            role: "menu",
                            tabIndex: -1,
                            className: u
                        }, r)) : es().createElement("div", {
                            className: u
                        }, r);
                    return es().createElement(sx.Provider, {
                        value: c
                    }, "dropdown" === i ? es().createElement(uu, {
                        asChild: !0,
                        style: {
                            width: "var(--radix-popper-anchor-width)"
                        }
                    }, s) : s)
                },
                sE = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = sS().size;
                    return es().createElement("div", {
                        role: "group",
                        className: e0(sb[n], r)
                    }, t)
                },
                sA = function(e) {
                    var t, r = e.value,
                        n = e.leading,
                        o = e.title,
                        a = e.description,
                        i = e.trailing,
                        l = e.disabled,
                        c = e.className,
                        u = e.onSelect,
                        s = e.asChild,
                        f = e.children,
                        p = sy(e, ["value", "leading", "title", "description", "trailing", "disabled", "className", "onSelect", "asChild", "children"]),
                        d = sS(),
                        y = d.size,
                        m = d.mode,
                        b = e0(e1, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", sw[y], sv[y], sh[y], sg[y], sj[y], l && "opacity-[0.5]", l && "pointer-events-none", c),
                        v = es().createElement("span", {
                            className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
                        }, o);
                    switch (m) {
                        case "dropdown":
                            v = es().createElement(uw, {
                                asChild: !0
                            }, v);
                            break;
                        case "standalone":
                            break;
                        default:
                            console.error("Invalid menu mode:", m)
                    }
                    var h = es().createElement(es().Fragment, null, !l && es().createElement(e2, null), n, es().createElement("div", {
                        className: e0("grow-1 text-truncate-split flex flex-col", sO[y])
                    }, v, a && es().createElement("div", {
                        className: "foundation-web-menu-item-description content-muted"
                    }, a)), i);
                    if (s) {
                        p.as;
                        var g = sy(p, ["as"]),
                            O = es().Children.only(f),
                            w = void 0 === o && O.props.children;
                        t = es().createElement(nQ, sd(sp({}, g), {
                            role: "standalone" === m ? "menuitem" : void 0,
                            "aria-disabled": l || void 0,
                            className: b,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: l ? void 0 : u
                        }), w ? es().cloneElement(O, {}, es().createElement(es().Fragment, null, !l && es().createElement(e2, null), O.props.children)) : es().cloneElement(O, {}, h))
                    } else if ("a" === p.as) {
                        p.as;
                        var j = p.href,
                            x = sy(p, ["as", "href"]);
                        t = es().createElement("a", sd(sp({}, x), {
                            role: "standalone" === m ? "menuitem" : void 0,
                            "aria-disabled": l,
                            href: l ? void 0 : j,
                            className: b,
                            style: {
                                outlineOffset: 0,
                                textDecoration: "none"
                            },
                            onClick: l ? void 0 : u
                        }), h)
                    } else {
                        p.as;
                        var S = sy(p, ["as"]);
                        t = es().createElement("button", sd(sp({
                            type: "button"
                        }, S), {
                            role: "standalone" === m ? "menuitem" : void 0,
                            "aria-disabled": l,
                            className: b,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: l ? void 0 : u
                        }), h)
                    }
                    return "dropdown" === m ? es().createElement(ug, {
                        value: r,
                        disabled: l,
                        asChild: !0
                    }, t) : es().createElement(su, {
                        asChild: !0,
                        focusable: !0,
                        tabStopId: r
                    }, t)
                };

            function sC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sI(e) {
                if (Array.isArray(e)) return e
            }

            function sR() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function sN(e, t) {
                if (e) {
                    if ("string" == typeof e) return sC(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sC(e, t)
                }
            }
            var sk = {
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
                sD = es().forwardRef(function(e, t) {
                    var r, n = sI(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || sN(r) || sR(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.className,
                        l = o.size,
                        c = void 0 === l ? "Large" : l,
                        u = o.variant,
                        s = o.value,
                        f = o.showValue,
                        p = void 0 !== f && f,
                        d = o.ariaLabel,
                        y = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(o, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        m = (sI(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || sN(a, 1) || sR())[0],
                        b = sk[c],
                        v = b.dimension,
                        h = b.strokeWidth,
                        g = b.textClass,
                        O = b.valueContainerSize,
                        w = (v - h) / 2,
                        j = 2 * Math.PI * w,
                        x = v / 2,
                        S = Math.min(100, Math.max(0, void 0 === s ? 0 : s)),
                        P = p && void 0 !== O ? O : v,
                        E = "Determinate" === (void 0 === u ? "Determinate" : u);
                    return es().createElement("div", function(e) {
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
                        ref: m,
                        className: e0("foundation-web-progress-circle inline-flex items-center justify-center", i),
                        role: "progressbar",
                        "aria-label": d,
                        "aria-valuemin": E ? 0 : void 0,
                        "aria-valuemax": E ? 100 : void 0,
                        "aria-valuenow": E ? S : void 0,
                        style: {
                            width: P,
                            height: P
                        }
                    }, y), es().createElement("svg", {
                        width: v,
                        height: v,
                        viewBox: "0 0 ".concat(v, " ").concat(v),
                        className: "relative"
                    }, es().createElement("circle", {
                        cx: x,
                        cy: x,
                        r: w,
                        fill: "none",
                        strokeWidth: h,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), es().createElement("circle", {
                        cx: x,
                        cy: x,
                        r: w,
                        fill: "none",
                        strokeWidth: h,
                        strokeDasharray: E ? j : "".concat(.75 * j, " ").concat(.25 * j),
                        strokeDashoffset: E ? j * (1 - S / 100) : 0,
                        strokeLinecap: "round",
                        className: e0(!E && "foundation-web-progress-circle-indeterminate"),
                        style: E ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), E && p && "Large" === c && es().createElement("div", {
                        className: e0("absolute content-emphasis flex items-center justify-center", g),
                        "aria-hidden": "true"
                    }, es().createElement("span", null, Math.round(S)), es().createElement("span", null, "%")))
                });

            function sT(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            sD.displayName = "ProgressCircle";
            var sL = function() {
                    var e;
                    return (e = function() {
                        return function(e, t) {
                            var r, n, o, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(i, "next", {
                                value: c(0)
                            }), l(i, "throw", {
                                value: c(1)
                            }), l(i, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), i;

                            function c(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    a.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && a.label < o[1]) {
                                                    a.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && a.label < o[2]) {
                                                    a.label = o[2], a.ops.push(u);
                                                    break
                                                }
                                                o[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, a)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, ei.httpService.post({
                                        url: "".concat(eD().authApi, "/v2/session/refresh"),
                                        withCredentials: !0
                                    }, {})];
                                case 1:
                                    return e.sent(), [2]
                            }
                        })
                    }, function() {
                        var t = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var a = e.apply(t, r);

                            function i(e) {
                                sT(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                sT(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                },
                sM = ow.eventStreamService.eventTypes,
                s_ = "Localization",
                sU = {
                    changeLanguage: {
                        name: "changeLanguage",
                        type: sM.formInteraction,
                        context: s_,
                        requiredParams: ["userId", "newSupportedLocaleCode", "previousSupportedLocaleCode"]
                    },
                    changeLanguageModal: {
                        name: "changeLanguageModal",
                        type: sM.formInteraction,
                        context: s_,
                        requiredParams: ["userId", "newSupportedLocaleCode"]
                    }
                };

            function sF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sB(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function sK(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function sW(e) {
                return (sW = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function sz(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        sK(e, t, r[t])
                    })
                }
                return e
            }

            function sH(e, t) {
                return (sH = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function sV(e) {
                return function(e) {
                    if (Array.isArray(e)) return sF(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return sF(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sF(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sX() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (sX = function() {
                    return !!e
                })()
            }
            var sG = ow.dataStores.localeDataStore,
                sq = function(e) {
                    return e.locale && e.locale.nativeName ? e.isEnabledForFullExperience ? e.locale.nativeName : "".concat(e.locale.nativeName, "*") : ""
                },
                sY = function(e) {
                    var t;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function r(e) {
                        var t, n, o;
                        if (!(this instanceof r)) throw TypeError("Cannot call a class as a function");
                        return n = r, o = [e], n = sW(n), (t = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, sX() ? Reflect.construct(n, o || [], sW(this).constructor) : n.apply(this, o))).state = {
                            supportedLocales: [],
                            userLocale: {},
                            showUnsupportedModal: !1,
                            isUserLocaleUnsupported: !1,
                            isLocaleUpdateInProgress: !1
                        }, t.handleNativeLanguageChange = t.handleNativeLanguageChange.bind(t), t.hideUnsupportedModal = t.hideUnsupportedModal.bind(t), t
                    }
                    return r.prototype = Object.create(e && e.prototype, {
                            constructor: {
                                value: r,
                                writable: !0,
                                configurable: !0
                            }
                        }), e && sH(r, e), t = [{
                            key: "componentDidMount",
                            value: function() {
                                this.loadSupportedLocales()
                            }
                        }, {
                            key: "handleLanguageChange",
                            value: function(e) {
                                var t = this,
                                    r = sz({}, e.locale),
                                    n = this.state.userLocale,
                                    o = this.props,
                                    a = o.isAuthenticatedUser,
                                    i = o.onLanguageChange,
                                    l = sz({}, n);
                                a ? (this.setState({
                                    isLocaleUpdateInProgress: !0
                                }), sG.setUserLocale(r.locale).then(function() {
                                    var n;
                                    return (n = function() {
                                        return function(e, t) {
                                            var r, n, o, a = {
                                                    label: 0,
                                                    sent: function() {
                                                        if (1 & o[0]) throw o[1];
                                                        return o[1]
                                                    },
                                                    trys: [],
                                                    ops: []
                                                },
                                                i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                                l = Object.defineProperty;
                                            return l(i, "next", {
                                                value: c(0)
                                            }), l(i, "throw", {
                                                value: c(1)
                                            }), l(i, "return", {
                                                value: c(2)
                                            }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                                value: function() {
                                                    return this
                                                }
                                            }), i;

                                            function c(l) {
                                                return function(c) {
                                                    var u = [l, c];
                                                    if (r) throw TypeError("Generator is already executing.");
                                                    for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                                            case 0:
                                                            case 1:
                                                                o = u;
                                                                break;
                                                            case 4:
                                                                return a.label++, {
                                                                    value: u[1],
                                                                    done: !1
                                                                };
                                                            case 5:
                                                                a.label++, n = u[1], u = [0];
                                                                continue;
                                                            case 7:
                                                                u = a.ops.pop(), a.trys.pop();
                                                                continue;
                                                            default:
                                                                if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                    a = 0;
                                                                    continue
                                                                }
                                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                                    a.label = u[1];
                                                                    break
                                                                }
                                                                if (6 === u[0] && a.label < o[1]) {
                                                                    a.label = o[1], o = u;
                                                                    break
                                                                }
                                                                if (o && a.label < o[2]) {
                                                                    a.label = o[2], a.ops.push(u);
                                                                    break
                                                                }
                                                                o[2] && a.ops.pop(), a.trys.pop();
                                                                continue
                                                        }
                                                        u = t.call(e, a)
                                                    } catch (e) {
                                                        u = [6, e], n = 0
                                                    } finally {
                                                        r = o = 0
                                                    }
                                                    if (5 & u[0]) throw u[1];
                                                    return {
                                                        value: u[0] ? u[1] : void 0,
                                                        done: !0
                                                    }
                                                }
                                            }
                                        }(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return [4, sL()];
                                                case 1:
                                                    return t.sent(), e.isEnabledForFullExperience ? i(r) : (this.showUnsupportedLocaleMessage(), this.showUnsupportedLocaleModal(r)), [2]
                                            }
                                        })
                                    }, function() {
                                        var e = this,
                                            t = arguments;
                                        return new Promise(function(r, o) {
                                            var a = n.apply(e, t);

                                            function i(e) {
                                                sB(a, r, o, i, l, "next", e)
                                            }

                                            function l(e) {
                                                sB(a, r, o, i, l, "throw", e)
                                            }
                                            i(void 0)
                                        })
                                    }).call(t)
                                }, function(e) {
                                    console.error(e)
                                }).finally(function() {
                                    t.setState({
                                        isLocaleUpdateInProgress: !1
                                    })
                                })) : i(r), this.setUserLocaleByLocaleCode(r.locale), ow.eventStreamService.sendEvent(sU.changeLanguage, {
                                    userId: eo.authenticatedUser.id,
                                    newSupportedLocaleCode: r.locale,
                                    previousSupportedLocaleCode: l.locale.locale
                                })
                            }
                        }, {
                            key: "getFoundationSelector",
                            value: function() {
                                var e, t, r = this,
                                    n = this.state,
                                    o = n.supportedLocales,
                                    a = n.userLocale,
                                    i = n.isLocaleUpdateInProgress,
                                    l = (e = Object).assign.apply(e, sV(o.map(function(e) {
                                        return sK({}, e.locale.locale, e)
                                    })));
                                return (0, G.jsx)(uF, {
                                    value: null == a || null == (t = a.locale) ? void 0 : t.locale,
                                    className: "form-group",
                                    onValueChange: function(e) {
                                        return r.handleLanguageChange(l[e])
                                    },
                                    size: "Medium",
                                    placeholder: "Language",
                                    isDisabled: i,
                                    children: (0, G.jsx)(sP, {
                                        children: (0, G.jsx)(sE, {
                                            children: o.map(function(e) {
                                                return (0, G.jsx)(sA, {
                                                    title: sq(e),
                                                    value: e.locale.locale
                                                }, e.locale.id)
                                            })
                                        })
                                    })
                                })
                            }
                        }, {
                            key: "handleNativeLanguageChange",
                            value: function(e) {
                                var t = this.state.supportedLocales,
                                    r = e.target.value,
                                    n = t.find(function(e) {
                                        return e.locale.locale === r
                                    });
                                this.handleLanguageChange(n)
                            }
                        }, {
                            key: "getNativeSelector",
                            value: function() {
                                var e = this.state,
                                    t = e.supportedLocales,
                                    r = e.userLocale,
                                    n = t.map(function(e) {
                                        return {
                                            value: e.locale.locale,
                                            key: e.locale.id,
                                            label: sq(e)
                                        }
                                    }),
                                    o = r.locale && r.locale.locale;
                                return n.length > 0 && (0, G.jsx)("select", {
                                    id: "language-switcher",
                                    className: "flex items-center justify-between width-full bg-none stroke-standard stroke-contrast-alpha cursor-pointer radius-medium height-1000 text-body-medium padding-x-medium",
                                    value: o,
                                    onChange: this.handleNativeLanguageChange,
                                    children: n.map(function(e) {
                                        return (0, G.jsx)("option", {
                                            value: e.value,
                                            className: "flex width-full items-center bg-none padding-x-medium stroke-standard ",
                                            children: e.label
                                        }, e.key)
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
                            value: function(e) {
                                var t = this.findSupportedLocaleByLocaleCode(e);
                                this.setState({
                                    userLocale: sz({}, t)
                                }), t.isEnabledForFullExperience || this.showUnsupportedLocaleMessage()
                            }
                        }, {
                            key: "sortSupportedLocalesByFullExperience",
                            value: function(e) {
                                if (Array.isArray(e)) {
                                    var t = e.filter(function(e) {
                                            return e.isEnabledForFullExperience
                                        }).sort(function(e, t) {
                                            return e.locale.nativeName > t.locale.nativeName ? 1 : -1
                                        }),
                                        r = e.filter(function(e) {
                                            return !e.isEnabledForFullExperience
                                        }).sort(function(e, t) {
                                            return e.locale.nativeName > t.locale.nativeName ? 1 : -1
                                        });
                                    return sV(t).concat(sV(r))
                                }
                                return e
                            }
                        }, {
                            key: "filterLocalesBySeoSupport",
                            value: function(e) {
                                return Array.isArray(e) ? e.filter(function(e) {
                                    return e.isEnabledForFullExperience && 2 === e.locale.language.languageCode.length
                                }).sort(function(e, t) {
                                    return e.locale.nativeName > t.locale.nativeName ? 1 : -1
                                }) : e
                            }
                        }, {
                            key: "findSupportedLocaleByLocaleCode",
                            value: function(e) {
                                return this.state.supportedLocales.find(function(t) {
                                    return t.locale.locale === e
                                })
                            }
                        }, {
                            key: "loadSupportedLocales",
                            value: function() {
                                var e = this;
                                sG.getLocalesWithCache(6e5).then(function(t) {
                                    e.props.hideSeoUnsupportedLocales ? e.setState({
                                        supportedLocales: e.filterLocalesBySeoSupport(t.data)
                                    }) : e.setState({
                                        supportedLocales: e.sortSupportedLocalesByFullExperience(t.data)
                                    }), e.loadUserLocale()
                                }, function(e) {
                                    console.error(e)
                                })
                            }
                        }, {
                            key: "loadUserLocale",
                            value: function() {
                                var e = this,
                                    t = ei.urlService.getQueryParam("locale");
                                if (t) this.setUserLocaleByLocaleCode(t);
                                else {
                                    var r = this.props.isAuthenticatedUser;
                                    sG.getUserLocale().then(function(t) {
                                        var n = r ? t.data.ugc.locale : t.data.signupAndLogin.locale;
                                        e.setUserLocaleByLocaleCode(n)
                                    }, function(e) {
                                        console.error(e)
                                    })
                                }
                            }
                        }, {
                            key: "showUnsupportedLocaleModal",
                            value: function(e) {
                                this.props.showWarningModalForUnsupportedLocale && (this.setState({
                                    showUnsupportedModal: !0
                                }), ow.eventStreamService.sendEvent(sU.changeLanguageModal, {
                                    userId: eo.authenticatedUser.id,
                                    newSupportedLocaleCode: e.locale
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
                                var e = this.props.translate,
                                    t = this.state,
                                    r = t.showUnsupportedModal,
                                    n = t.isUserLocaleUnsupported,
                                    o = t.supportedLocales,
                                    a = t.userLocale;
                                return (0, G.jsxs)(es().Fragment, {
                                    children: [o.length > 0 && a.locale ? (0, G.jsx)("div", {
                                        className: "language-selector-wrapper",
                                        children: this.getSelector()
                                    }) : (0, G.jsx)(sD, {
                                        variant: "Indeterminate",
                                        size: "Medium"
                                    }), r && (0, G.jsx)(n_, {
                                        open: r,
                                        isModal: !0,
                                        size: "Medium",
                                        type: "Default",
                                        children: (0, G.jsxs)(nU, {
                                            children: [(0, G.jsxs)(nF, {
                                                className: "flex flex-col gap-y-xsmall items-center",
                                                children: [(0, G.jsx)(nB, {
                                                    className: "text-heading-medium",
                                                    children: e("Heading.UnsupportedLanguage")
                                                }), (0, G.jsx)("div", {
                                                    className: "text-body-medium content-default",
                                                    children: e("Description.UnsupportedLanguage")
                                                })]
                                            }), (0, G.jsx)(nK, {
                                                className: "flex gap-x-small items-center",
                                                children: (0, G.jsx)(or, {
                                                    variant: "Standard",
                                                    className: "fill",
                                                    size: "Medium",
                                                    onClick: this.hideUnsupportedModal,
                                                    children: e("Action.Ok")
                                                })
                                            })]
                                        })
                                    }), n && (0, G.jsx)("div", {
                                        className: "row",
                                        children: (0, G.jsx)("span", {
                                            className: "text text-error",
                                            children: e("Description.UnsupportedLanguage")
                                        })
                                    })]
                                })
                            }
                        }],
                        function(e, t) {
                            for (var r = 0; r < t.length; r++) {
                                var n = t[r];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                            }
                        }(r.prototype, t), r
                }(es().Component);

            function s$(e) {
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

            function sZ(e) {
                var t = ei.pageName.PageNameProvider.getInternalPageName(),
                    r = (0, el.removeUrlLocale)(window.location.pathname),
                    n = "/" === r.toLowerCase() || "Login" === t || "CreateAccount" === t || "Landing" === t,
                    o = null === eo.authenticatedUser || void 0 === eo.authenticatedUser ? void 0 : eo.authenticatedUser.isAuthenticated,
                    a = ea.DeviceMeta && new ea.DeviceMeta,
                    i = a && (a.isPhone || a.isTablet),
                    l = o || n,
                    c = e.translate;
                return (0, G.jsxs)("div", {
                    className: "footer",
                    children: [(0, G.jsx)(oO, s$({}, e)), (0, G.jsxs)("div", {
                        className: "row copyright-container flex items-center justify-between padding-top-xlarge gutter-x-small",
                        children: [(0, G.jsx)("div", {
                            className: "col-sm-6 col-md-3",
                            children: l && (0, G.jsx)(sY, {
                                translate: c,
                                onLanguageChange: function(e) {
                                    var t = e.locale,
                                        o = e.language;
                                    if (n && t) {
                                        var a = Object.fromEntries(new URLSearchParams(window.location.search)),
                                            i = {
                                                pathname: "/".concat(o.languageCode).concat("/" === r ? "" : r),
                                                query: a
                                            };
                                        window.location.href = ei.urlService.formatUrl(i)
                                    } else window.location.reload()
                                },
                                isAuthenticatedUser: o,
                                showWarningMessageForUnsupportedLocale: !1,
                                hideSeoUnsupportedLocales: n,
                                isNative: i
                            })
                        }), (0, G.jsx)("div", {
                            className: l ? "col-sm-6 col-md-9" : "col-sm-12",
                            children: (0, G.jsx)(ec, s$({}, e))
                        })]
                    })]
                })
            }

            function sQ(e) {
                var t = e.translate,
                    r = e.intl;
                return (0, G.jsx)(sZ, {
                    translate: t,
                    intl: r
                })
            }
            sY.defaultProps = {
                onLanguageChange: function() {},
                isAuthenticatedUser: !1,
                isNative: !1,
                showWarningModalForUnsupportedLocale: !0,
                showWarningMessageForUnsupportedLocale: !0,
                hideSeoUnsupportedLocales: !1
            }, sY.propTypes = {
                isAuthenticatedUser: er().bool,
                onLanguageChange: er().func,
                isNative: er().bool,
                showWarningModalForUnsupportedLocale: er().bool,
                showWarningMessageForUnsupportedLocale: er().bool,
                translate: er().func.isRequired,
                hideSeoUnsupportedLocales: er().bool
            }, sZ.propTypes = {
                translate: er().func.isRequired
            }, sQ.propTypes = {
                translate: er().func.isRequired,
                intl: er().shape({
                    getRobloxLocale: er().func.isRequired
                }).isRequired
            };
            var sJ = (0, Z.withTranslations)(sQ, en.P),
                s0 = function(e, t) {
                    ea.DeviceMeta && ow.hybridService && new ea.DeviceMeta().isInApp && ow.hybridService.localization && ow.hybridService.localization(e, t)
                };

            function s1(e) {
                var t = e.translate,
                    r = null === eo.authenticatedUser || void 0 === eo.authenticatedUser ? void 0 : eo.authenticatedUser.isAuthenticated;
                return (0, G.jsx)(sY, {
                    onLanguageChange: function(e) {
                        var t = e.locale;
                        t && s0(t, function() {
                            console.warn("Language Change Hybrid Event: ".concat(t))
                        }), window.location.reload()
                    },
                    translate: t,
                    isAuthenticatedUser: r
                })
            }
            window.Roblox.AccountSettingsLanguageSelector = s1, s1.propTypes = {
                translate: er().func.isRequired
            };
            var s2 = (0, Z.withTranslations)(s1, en.P),
                s3 = "account-settings-language-selector";
            $()(function() {
                var e = document.getElementById("footer-container");
                if (e) {
                    var t = (0, G.jsx)(q.QueryClientProvider, {
                        client: Z.queryClient,
                        children: (0, G.jsx)(sJ, {})
                    });
                    (0, Z.renderWithErrorBoundary)(t, e)
                }
                var r = document.getElementById(s3),
                    n = 10,
                    o = function() {
                        (r = document.getElementById(s3)) || !(n > 0) ? r && (0, Z.renderWithErrorBoundary)((0, G.jsx)(s2, {}), r): (n -= 1, setTimeout(o, 200))
                    };
                o(), window.location.pathname.toLowerCase().indexOf("/my/account") > -1 && (window.onhashchange = function() {
                    if ("#!/info" === window.location.hash) {
                        var e = document.getElementById(s3);
                        e && (0, Z.renderWithErrorBoundary)((0, G.jsx)(s2, {}), e)
                    }
                })
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Footer");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/footer-3c271502450c21fc.js.map
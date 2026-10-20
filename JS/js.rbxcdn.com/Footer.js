! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "50bfdfd1085202272a7ed4454945c15224042af0"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "23a7e90c-716b-462d-8f76-5dc48890e123", e._sentryDebugIdIdentifier = "sentry-dbid-23a7e90c-716b-462d-8f76-5dc48890e123")
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
            var e, t, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, w, O, j, x, S, P, E, A, C, I, R, N, k, D, T, L, M, _, U, F, B, W, K, z, H, V, X = window.ReactJSX,
                G = window.TanstackQuery,
                q = window.Roblox["core-scripts"].util.ready,
                Y = r.n(q),
                $ = window.Roblox["core-scripts"].react,
                Z = "data:image/webp;base64,UklGRrADAABXRUJQVlA4WAoAAAAQAAAAOwAAHAAAQUxQSOsAAAABgGNt2zHnHdaetLadLtmNsQDbdlLbtsqkHpSxbX/zj/U9G4iICSCX4uiiGdPdq8/vTNOFUWLyNGXwlFk4ZSf9ye6pKm4tXN+UK90IXLBwPxfgImDPArjr70Q5b4GcUTiUWjCFYiJKvAaxXMaTqMcC2yUKP8I5DM39x/nPmrAAjxqQ9LdIdy9Ir3dI9yYk4zTSZBHDYfnRpzgnkZIhnAExpd+j3KYSiepQqkVEpF3HWNWQY/gBwn4YOY/Y5m8znFz7tT7z9dTsR+5KMkdvBF6Em+EMMXkoTyvfPv/6Z+6aBc/N/1/n22WpcnIJAFZQOCCeAgAAsA4AnQEqPAAdAD6ROJhIJaMiITAb+ACwEglsAJ0yhHXno/mCVb+y7BwXfr7x7eqjbAeYD9bPVz9BvlAdYb6AHlp/uB8G3+A/4Pphu/TXQhi//S809EB69BEZldQNIV/eNVlDmUDW33lPn0iGBlkHEoP7xzvxv4W7IPVKwg+gAO9wOYzsI8BSlu/ljXZqxJsDV2tD+qayuJoxUFkUptaQf93n7fV4hUgJ+Uf/kpj4AqJAtsX5hJKtHHJlA0l7tylf+1SOJ1un0rrDm2Up4a6mCFRb/+W/vzfxAH3D9myHP/NfjX7ifoc/H7vgudmvtLqz+hb9lyHGakbAh+at5OqNY8Lo7/c/Rd1YFFWBSYBdcwPiQzjecF1Xv8R2dj9vKtM9tG+6SEBuPEV31LvRnBpXZ2XjpXFA9v38V7MMCzD2xxa06JeC+cVPiHvpVzfH8c63KCGOBFLltx9UIWiwO/c0fNzieqYIEsY2OIkx/wrhbV4GMtEp1U/7N3a7/Qq9r/h+LEI8sYOrGm1MU2P/BL4fYeBDZFMdJZ519a6U9S4K0wTMro82cnTukNfm7VyZ5hONbhEmAOc3OOYiFKgqzFC716CnyAatzIyDr0CosyN1Uh1epW+K2w7UmZ36T6i2+3vzCUz+pCLHl5zfc3yHC5sTR9yT368/W2zLQGXLxDmulSMj6HAO2VABHUwOJFjwIZT/+SB3RcruT4FqGiItnt6evy0vY4eSL9ALvRwkehZMB6Xj/2dzV507O+xEyOf7DL0zpSV3B/Oxz2jju+fUOFvOLM2J+VLuONA8wTfqy78vrhQfIVlpkdzQ+ZzJ3vL/FVZIgcqzYBBbKgUTEjq/+jSvW3vcOy7IA539GoeB3ydM4gyDy0h9FTsf9CO0fQAAAA==",
                Q = [{
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
                    postfixIcon: Z
                }, {
                    name: "sitemap",
                    path: "/sitemap",
                    labelTranslationKey: "Label.Sitemap"
                }],
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
                    postfixIcon: Z
                }, {
                    name: "sitemap",
                    path: "/sitemap",
                    labelTranslationKey: "Label.Sitemap"
                }],
                ee = window.PropTypes,
                et = r.n(ee),
                er = JSON.parse('{"P":["CommonUI.Features","Common.AlertsAndOptions","Feature.Tracking","Feature.Privacy"]}'),
                en = window.HeaderScripts,
                eo = window.Roblox,
                ea = window.CoreUtilities,
                ei = window.Roblox["core-scripts"].endpoints;

            function el(e) {
                var t = e.translate,
                    r = new Date().getFullYear();
                return (0, X.jsx)("p", {
                    className: "text-footer footer-note",
                    children: t("Description.CopyRightMessageDynamicYear", {
                        copyrightYear: r
                    })
                })
            }
            el.propTypes = {
                translate: et().func.isRequired
            };
            var ec = window.React,
                eu = r.n(ec),
                es = r(611),
                ef = r.n(es),
                ep = window.Roblox["core-scripts"].eventStream,
                ed = window.Roblox["core-scripts"].intl.intl,
                ey = r.n(ed),
                em = window.ReactStyleGuide,
                eb = "RBXViralAcquisition",
                ev = "Description.RBXViralAcquisition",
                eh = "RBXSource",
                eg = "Description.RBXSource",
                ew = "Heading.GoogleAnalytics",
                eO = [{
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
                ej = (0, ei.getAbsoluteUrl)("/info/privacy"),
                ex = (0, ei.getAbsoluteUrl)("/support"),
                eS = function(e) {
                    var t = e.cookieName,
                        r = e.description;
                    return (0, X.jsxs)("div", {
                        className: "cookie-item",
                        children: [(0, X.jsx)("p", {
                            className: "cookie-name font-body text",
                            children: t
                        }), (0, X.jsx)("p", {
                            className: "cookie-description font-footer",
                            children: r
                        })]
                    })
                },
                eP = function(e) {
                    var t = e.translate,
                        r = e.isNonEssentialCookieListVisible,
                        n = ef()({
                            hidden: !r
                        }),
                        o = eO.map(function(e) {
                            return (0, X.jsxs)("div", {
                                className: "google-analytics-company-info-sec",
                                children: [(0, X.jsx)("p", {
                                    className: "font-caption-header text-emphasis",
                                    children: t(e.label)
                                }), (0, X.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: t(e.content)
                                })]
                            }, e.label)
                        }),
                        a = (0, X.jsx)("a", {
                            className: "text-link",
                            target: "_blank",
                            href: "https://support.google.com/analytics/answer/11397207",
                            rel: "noreferrer",
                            children: t(ew)
                        }),
                        i = t("Description.GAReadMore"),
                        l = i.indexOf("{googleAnalyticsLink}"),
                        c = (0, X.jsxs)("p", {
                            className: "font-caption-body text",
                            children: [i.substring(0, l), a]
                        }),
                        u = (0, X.jsxs)("div", {
                            children: [(0, X.jsxs)("a", {
                                className: "font-header-2 text-emphasis",
                                href: "https://marketingplatform.google.com/about/analytics/",
                                children: [t(ew), (0, X.jsx)("span", {
                                    className: "icon-nav-external-link-sm cookie-external-link-icon"
                                })]
                            }), (0, X.jsxs)("div", {
                                children: [(0, X.jsx)("span", {
                                    className: "google-analytics-info-subheader",
                                    children: t("Label.OwnedBy")
                                }), (0, X.jsx)("span", {
                                    className: "font-caption-header text-emphasis",
                                    children: "Google Inc."
                                })]
                            }), (0, X.jsx)("p", {
                                className: "text-emphasis google-analytics-company-info-sec",
                                children: t("Heading.GoogleAnalyticsPurpose")
                            }), (0, X.jsx)("span", {
                                className: "font-caption-body text",
                                children: t("Description.GoogleAnalyticsPurpose")
                            }), (0, X.jsx)("p", {
                                className: "text-emphasis google-analytics-company-info-sec",
                                children: t("Heading.CompanyCollection")
                            }), o, c]
                        }),
                        s = (0, X.jsxs)("div", {
                            className: "analytics-cookie-list",
                            children: [(0, X.jsx)(eS, {
                                cookieName: eb,
                                description: t(ev)
                            }), (0, X.jsx)(eS, {
                                cookieName: eh,
                                description: t(eg)
                            })]
                        });
                    return (0, X.jsxs)("div", {
                        className: n,
                        children: [s, u]
                    })
                },
                eE = "RBXcb",
                eA = function(e) {
                    var t, r = "".concat(e, "="),
                        n = null == (t = document.cookie.split("; ").find(function(e) {
                            return e.startsWith(r)
                        })) ? void 0 : t.slice(r.length);
                    return null == n ? null : {
                        name: e,
                        value: decodeURIComponent(n)
                    }
                },
                eC = function(e, t, r) {
                    var n, o = null == r.sameSite ? "" : ";samesite=".concat(r.sameSite),
                        a = null == r.domain ? "" : ";domain=".concat(r.domain),
                        i = ";path=".concat(null != (n = r.path) ? n : "/"),
                        l = null == r.expires ? "" : ";expires=".concat(r.expires.toUTCString()),
                        c = null == r.maxAge ? "" : ";max-age=".concat(r.maxAge);
                    document.cookie = "".concat(e, "=").concat(encodeURIComponent(t), ";secure").concat(o).concat(a).concat(i).concat(l).concat(c)
                },
                eI = function(e, t, r) {
                    eC(e, t, r)
                },
                eR = function(e, t) {
                    eC(e, "", {
                        domain: t.domain,
                        path: t.path,
                        expires: new Date(0)
                    })
                },
                eN = window.Roblox["core-scripts"].environmentUrls,
                ek = r.n(eN),
                eD = function(e, t) {
                    eA(eE) && eR(eE, {
                        domain: ek().domain
                    });
                    var r = "",
                        n = [];
                    t.forEach(function(o, a) {
                        e.includes(o) ? r += "".concat(o, "=true&") : (r += "".concat(o, "=false&"), n.push(o)), a === t.length - 1 && (r = r.slice(0, -1))
                    }), n.forEach(function(e) {
                        eR(e, {
                            domain: ek().domain
                        })
                    }), eI(eE, r, {
                        maxAge: 15552e3,
                        domain: ek().domain
                    })
                },
                eT = function() {
                    var e = eA(eE);
                    return !!e && !!e.value.split("&").find(function(e) {
                        return "true" === e.split("=")[1]
                    })
                };

            function eL(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eM(e, t) {
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
                        if ("string" == typeof e) return eL(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eL(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var e_ = eM((0, em.createModal)(), 2),
                eU = e_[0],
                eF = e_[1],
                eB = function(e) {
                    var t = e.nonEssentialCookieList,
                        r = e.essentialCookieList,
                        n = e.translate,
                        o = e.closeConsentTool,
                        a = eT(),
                        i = eM((0, ec.useState)(a), 2),
                        l = i[0],
                        c = i[1],
                        u = eM((0, ec.useState)(!1), 2),
                        s = u[0],
                        f = u[1],
                        p = eM((0, ec.useState)(!1), 2),
                        d = p[0],
                        y = p[1];
                    (0, ec.useEffect)(function() {
                        eF.open()
                    }, []);
                    var m = ef()({
                            hidden: !s
                        }),
                        b = ef()("cookie-consent-tool-collaps", {
                            on: d
                        }),
                        v = ef()("cookie-consent-tool-collaps font-header-2 text-emphasis ", {
                            on: s
                        }),
                        h = new(ey())().getRobloxLocale(),
                        g = ea.urlService.getUrlWithLocale("string" == typeof ej ? ej : "", h),
                        w = (0, X.jsx)("div", {
                            className: "cookie-consent-tool-info-link",
                            children: (0, X.jsxs)("a", {
                                className: "text-link",
                                target: "_blank",
                                href: g,
                                rel: "noreferrer",
                                children: [n("Description.PrivacyPolicy"), (0, X.jsx)("span", {
                                    className: "icon-nav-external-link-sm cookie-external-link-icon"
                                })]
                            })
                        }),
                        O = (0, X.jsx)("div", {
                            className: "cookie-consent-tool-info-link",
                            children: (0, X.jsxs)("a", {
                                className: "text-link",
                                target: "_blank",
                                href: "string" == typeof ex ? ex : "",
                                rel: "noreferrer",
                                children: [n("Action.RequestData"), (0, X.jsx)("span", {
                                    className: "icon-nav-external-link-sm cookie-external-link-icon"
                                })]
                            })
                        }),
                        j = (0, X.jsxs)("div", {
                            children: [(0, X.jsxs)("div", {
                                className: "static-section",
                                children: [(0, X.jsx)("div", {
                                    className: "font-header-2 text-emphasis google-analytics-company-info-sec",
                                    children: n("Heading.InformationCollection")
                                }), (0, X.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: n("Description.InformationCollection")
                                })]
                            }), (0, X.jsxs)("div", {
                                className: "static-section",
                                children: [(0, X.jsx)("div", {
                                    className: "font-header-2 text-emphasis google-analytics-company-info-sec",
                                    children: n("Heading.InformationCollection2")
                                }), (0, X.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: n("Description.InformationCollection2")
                                })]
                            }), (0, X.jsxs)("div", {
                                className: "static-section",
                                children: [(0, X.jsx)("div", {
                                    className: "font-header-2 text-emphasis google-analytics-company-info-sec",
                                    children: n("Heading.InformationPartnerCollection")
                                }), (0, X.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: n("Description.InformationPartnerCollection")
                                })]
                            })]
                        }),
                        x = (0, X.jsxs)("div", {
                            children: [(0, X.jsx)("button", {
                                className: b,
                                type: "button",
                                onClick: function() {
                                    y(!d)
                                },
                                children: (0, X.jsx)("span", {
                                    className: "font-header-2 text-emphasis",
                                    children: n("Heading.AnalyticsCookies")
                                })
                            }), (0, X.jsx)(em.Toggle, {
                                className: "cookie-toggle",
                                isOn: l,
                                onToggle: function() {
                                    c(!l)
                                }
                            })]
                        }),
                        S = r.map(function(e) {
                            return (0, X.jsx)(eS, {
                                cookieName: e.cookieName,
                                description: n(e.description)
                            }, e.cookieName)
                        }),
                        P = (0, X.jsxs)("div", {
                            children: [O, w]
                        }),
                        E = (0, X.jsxs)("div", {
                            className: "essential-cookie-section",
                            children: [(0, X.jsx)("button", {
                                className: v,
                                type: "button",
                                onClick: function() {
                                    f(!s)
                                },
                                children: n("Heading.EssentialCookies")
                            }), (0, X.jsx)("div", {
                                className: m,
                                children: S
                            })]
                        }),
                        A = (0, X.jsxs)("div", {
                            className: "cookie-consent-tool-body",
                            children: [j, P, E, x, (0, X.jsx)(eP, {
                                isNonEssentialCookieListVisible: d,
                                translate: n
                            })]
                        });
                    return (0, X.jsx)(eU, {
                        title: n("Heading.CookieSettings"),
                        body: A,
                        actionButtonShow: !0,
                        actionButtonText: n("Action.SavePreferences"),
                        neutralButtonText: n("Action.Cancel"),
                        onAction: function() {
                            eD(l ? t : [], t), o(null)
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
            var eK = function(e) {
                    var t, r = e.nonEssentialCookieList,
                        n = e.essentialCookieList,
                        o = e.translate,
                        a = e.onCloseConsentTool,
                        i = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, ec.useState)(!1)) || function(e) {
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
                    return [l ? (0, X.jsx)(eB, {
                        translate: o,
                        essentialCookieList: n,
                        nonEssentialCookieList: r,
                        closeConsentTool: function(e) {
                            u.close(), null == a || a(e)
                        }
                    }) : (0, X.jsx)("div", {}), u]
                },
                ez = window.Roblox["core-scripts"].meta.user,
                eH = function(e) {
                    null != e && (0, ez.isAuthenticated)() && eI("RBXcp", e ? "restricted" : "standard", {
                        domain: ek().domain,
                        maxAge: 15552e3,
                        sameSite: "lax"
                    })
                },
                eV = window.Roblox["core-scripts"].guac;

            function eX(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var eG = function() {
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
                                return [4, (0, eV.callBehaviour)("cookie-policy")];
                            case 1:
                                if (void 0 !== (e = t.sent())) return eH(e.RestrictNonEssentialTrackingConsent), [2, e];
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
                            eX(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            eX(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                })()
            };

            function eq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eY(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function e$(e, t) {
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
                        if ("string" == typeof e) return eq(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eq(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eZ(e) {
                var t = e.translate,
                    r = e$((0, ec.useState)([]), 2),
                    n = r[0],
                    o = r[1],
                    a = e$((0, ec.useState)([]), 2),
                    i = a[0],
                    l = a[1];
                (0, ec.useEffect)(function() {
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
                                    return [4, eG()];
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
                                eY(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                eY(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                }, []);
                var c = e$(eK({
                        nonEssentialCookieList: n,
                        essentialCookieList: i,
                        translate: t
                    }), 2),
                    u = c[0],
                    s = c[1];
                return i.length > 0 ? (0, X.jsxs)("div", {
                    children: [(0, X.jsx)("button", {
                        onClick: s.open,
                        className: "btn text-footer-nav footer-button-link",
                        type: "button",
                        "data-testid": "cookie-consent-link",
                        children: t("Heading.CookieSettings")
                    }), u]
                }) : null
            }
            eZ.propTypes = {
                translate: et().func.isRequired
            };
            var eQ = window.Roblox["core-scripts"].util.url,
                eJ = function() {
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
                e0 = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                e1 = function(e) {
                    var t = e.className;
                    return eu().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: eJ("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                };

            function e2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e3(e) {
                if (Array.isArray(e)) return e
            }

            function e6() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function e8(e, t) {
                if (e) {
                    if ("string" == typeof e) return e2(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return e2(e, t)
                }
            }
            var e5 = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                e4 = eu().forwardRef(function(e, t) {
                    var r, n = e3(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || e8(r) || e6(),
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
                        s = (e3(a) || function(e) {
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
                        }(a) || e8(a, 1) || e6())[0];
                    return eu().createElement("span", function(e) {
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
                        className: eJ("grow-0 shrink-0 basis-auto icon", i, e5[void 0 === l ? "Medium" : l], c)
                    }, u))
                });
            e4.displayName = "Icon";
            var e7 = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                e9 = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                te = function(e) {
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
                    return eu().createElement("button", function(e) {
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
                        className: eJ("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", e0, e9[t], e7[r], n && "radius-circle", o)
                    }, a), eu().createElement(e1, null), eu().createElement(e4, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function tt(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function tr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tn(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function to() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = tn(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : tn(t[e], null)
                        }
                    }
                }
            }

            function ta() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return ec.useCallback(to.apply(void 0, function(e) {
                    if (Array.isArray(e)) return tr(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tr(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tr(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function ti(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tl(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function tc(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        tl(e, t, r[t])
                    })
                }
                return e
            }

            function tu(e, t) {
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

            function ts(e) {
                return function(e) {
                    if (Array.isArray(e)) return ti(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ti(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ti(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tf(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return ec.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return ec.useMemo(function() {
                                var t, o;
                                return tl({}, "__scope".concat(e), (t = tc({}, r), o = null != (o = tl({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                    var o = ec.createContext(n),
                        a = r.length;
                    r = ts(r).concat([n]);
                    var i = function(t) {
                        var r, n = t.scope,
                            i = t.children,
                            l = tu(t, ["scope", "children"]),
                            c = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                            u = ec.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, X.jsx)(c.Provider, {
                            value: u,
                            children: i
                        })
                    };
                    return i.displayName = t + "Provider", [i, function(r, i) {
                        var l, c = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                            u = ec.useContext(c);
                        if (u) return u;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, tp.apply(void 0, [n].concat(ts(t)))]
            }

            function tp() {
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
                            return tc({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return ec.useMemo(function() {
                            return tl({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var td = (null == (z = globalThis) ? void 0 : z.document) ? ec.useLayoutEffect : function() {};

            function ty(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var tm = ec[" useId ".trim().toString()] || function() {},
                tb = 0;

            function tv(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = ec.useState(tm())) || function(e) {
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
                            if ("string" == typeof e) return ty(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ty(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return td(function() {
                    e || o(function(e) {
                        return null != e ? e : String(tb++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function th(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tg(e) {
                var t = ec.useRef(e);
                return ec.useEffect(function() {
                    t.current = e
                }), ec.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return th(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return th(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return th(e, void 0)
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

            function tO(e, t) {
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

            function tj(e) {
                var t, r, n, o, a, i, l, c = e.prop,
                    u = e.defaultProp,
                    s = e.onChange,
                    f = void 0 === s ? function() {} : s,
                    p = tO((r = (t = {
                        defaultProp: u,
                        onChange: f
                    }).defaultProp, n = t.onChange, a = tO(o = ec.useState(r), 1)[0], i = ec.useRef(a), l = tg(n), ec.useEffect(function() {
                        i.current !== a && (l(a), i.current = a)
                    }, [a, i, l]), o), 2),
                    d = p[0],
                    y = p[1],
                    m = void 0 !== c,
                    b = m ? c : d,
                    v = tg(f);
                return [b, ec.useCallback(function(e) {
                    if (m) {
                        var t = "function" == typeof e ? e(c) : e;
                        t !== c && v(t)
                    } else y(e)
                }, [m, c, y, v])]
            }
            var tx = window.RadixUI["react-dismissable-layer"],
                tS = window.RadixUI["react-focus-scope"],
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
                var t, r, n = (t = e, (r = ec.forwardRef(function(e, t) {
                        var r = e.children,
                            n = tR(e, ["children"]);
                        if (ec.isValidElement(r)) {
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
                            return r.type !== ec.Fragment && (s.ref = t ? to(t, u) : u), ec.cloneElement(r, s)
                        }
                        return ec.Children.count(r) > 1 ? ec.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = ec.forwardRef(function(e, t) {
                        var r = e.children,
                            o = tR(e, ["children"]),
                            a = ec.Children.toArray(r),
                            i = a.find(tT);
                        if (i) {
                            var l = i.props.children,
                                c = a.map(function(e) {
                                    return e !== i ? e : ec.Children.count(l) > 1 ? ec.Children.only(null) : ec.isValidElement(l) ? l.props.children : null
                                });
                            return (0, X.jsx)(n, tI(tC({}, o), {
                                ref: t,
                                children: ec.isValidElement(l) ? ec.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, X.jsx)(n, tI(tC({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var tD = Symbol("radix.slottable");

            function tT(e) {
                return ec.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tD
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
                    n = ec.forwardRef(function(e, n) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, X.jsx)(i, t_(tM({}, a), {
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
            var tB = ec.forwardRef(function(e, t) {
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
                    }(r = ec.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return tF(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tF(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = u[0],
                    f = u[1];
                td(function() {
                    return f(!0)
                }, []);
                var p = l || s && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
                return p ? tE().createPortal((0, X.jsx)(tU.div, (n = function(e) {
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

            function tW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tK(e, t) {
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
                        if ("string" == typeof e) return tW(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tW(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            tB.displayName = "Portal";
            var tz = function(e) {
                var t, r, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h = e.present,
                    g = e.children,
                    w = (t = h, a = (o = tK(ec.useState(), 2))[0], i = o[1], l = ec.useRef({}), c = ec.useRef(t), u = ec.useRef("none"), f = (s = tK((r = t ? "mounted" : "unmounted", n = {
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
                    }, ec.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], ec.useEffect(function() {
                        var e = tH(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), td(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = tH(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), c.current = t
                        }
                    }, [t, p]), td(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = tH(l.current).includes(e.animationName);
                                    if (e.target === a && n && (p("ANIMATION_END"), !c.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (u.current = tH(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [a, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: ec.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), i(e)
                        }, [])
                    }),
                    O = "function" == typeof g ? g({
                        present: w.isPresent
                    }) : ec.Children.only(g),
                    j = ta(w.ref, (v = (b = null == (y = Object.getOwnPropertyDescriptor((d = O).props, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? d.ref : (v = (b = null == (m = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof g || w.isPresent ? ec.cloneElement(O, {
                    ref: j
                }) : null
            };

            function tH(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            tz.displayName = "Presence";
            var tV = window.RadixUI["react-focus-guards"],
                tX = function() {
                    return (tX = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function tG(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
                return r
            }
            var tq = "right-scroll-bar-position",
                tY = "width-before-scroll-bar";

            function t$(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var tZ = "u" > typeof window ? ec.useLayoutEffect : ec.useEffect,
                tQ = new WeakMap,
                tJ = (void 0 === t && (t = {}), (void 0 === n && (n = function(e) {
                    return e
                }), o = [], a = !1, i = {
                    read: function() {
                        if (a) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return o.length ? o[o.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = n(e, a);
                        return o.push(t),
                            function() {
                                o = o.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (a = !0; o.length;) {
                            var t = o;
                            o = [], t.forEach(e)
                        }
                        o = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return o
                            }
                        }
                    },
                    assignMedium: function(e) {
                        a = !0;
                        var t = [];
                        if (o.length) {
                            var r = o;
                            o = [], r.forEach(e), t = o
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            i = function() {
                                return Promise.resolve().then(n)
                            };
                        i(), o = {
                            push: function(e) {
                                t.push(e), i()
                            },
                            filter: function(e) {
                                return t = t.filter(e), o
                            }
                        }
                    }
                }).options = tX({
                    async: !0,
                    ssr: !1
                }, t), i),
                t0 = function() {},
                t1 = ec.forwardRef(function(e, t) {
                    var r, n, o, a, i = ec.useRef(null),
                        l = ec.useState({
                            onScrollCapture: t0,
                            onWheelCapture: t0,
                            onTouchMoveCapture: t0
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
                        w = e.allowPinchZoom,
                        O = e.as,
                        j = e.gapMode,
                        x = tG(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = (r = [i, t], n = function(e) {
                            return r.forEach(function(t) {
                                return t$(t, e)
                            })
                        }, (o = (0, ec.useState)(function() {
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
                        })[0]).callback = n, a = o.facade, tZ(function() {
                            var e = tQ.get(a);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    o = a.current;
                                t.forEach(function(e) {
                                    n.has(e) || t$(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || t$(e, o)
                                })
                            }
                            tQ.set(a, r)
                        }, [r]), a),
                        P = tX(tX({}, x), c);
                    return ec.createElement(ec.Fragment, null, y && ec.createElement(b, {
                        sideCar: tJ,
                        removeScrollBar: d,
                        shards: m,
                        noRelative: v,
                        noIsolation: h,
                        inert: g,
                        setCallbacks: u,
                        allowPinchZoom: !!w,
                        lockRef: i,
                        gapMode: j
                    }), s ? ec.cloneElement(ec.Children.only(f), tX(tX({}, P), {
                        ref: S
                    })) : ec.createElement(void 0 === O ? "div" : O, tX({}, P, {
                        className: p,
                        ref: S
                    }), f))
                });
            t1.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, t1.classNames = {
                fullWidth: tY,
                zeroRight: tq
            };
            var t2 = function(e) {
                var t = e.sideCar,
                    r = tG(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return ec.createElement(n, tX({}, r))
            };
            t2.isSideCarExport = !0;
            var t3 = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = H || r.nc;
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
                t6 = function() {
                    var e = t3();
                    return function(t, r) {
                        ec.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                t8 = function() {
                    var e = t6();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                t5 = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                t4 = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                t7 = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [t4(r), t4(n), t4(o)]
                },
                t9 = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return t5;
                    var t = t7(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                re = t8(),
                rt = "data-scroll-locked",
                rr = function(e, t, r, n) {
                    var o = e.left,
                        a = e.top,
                        i = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(rt, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(i, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(tq, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(tY, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(tq, " .").concat(tq, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(tY, " .").concat(tY, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(rt, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                rn = function() {
                    var e = parseInt(document.body.getAttribute(rt) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                ro = function() {
                    ec.useEffect(function() {
                        return document.body.setAttribute(rt, (rn() + 1).toString()),
                            function() {
                                var e = rn() - 1;
                                e <= 0 ? document.body.removeAttribute(rt) : document.body.setAttribute(rt, e.toString())
                            }
                    }, [])
                },
                ra = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        o = void 0 === n ? "margin" : n;
                    ro();
                    var a = ec.useMemo(function() {
                        return t9(o)
                    }, [o]);
                    return ec.createElement(re, {
                        styles: rr(a, !t, o, r ? "" : "!important")
                    })
                },
                ri = !1;
            if ("u" > typeof window) try {
                var rl = Object.defineProperty({}, "passive", {
                    get: function() {
                        return ri = !0, !0
                    }
                });
                window.addEventListener("test", rl, rl), window.removeEventListener("test", rl, rl)
            } catch (e) {
                ri = !1
            }
            var rc = !!ri && {
                passive: !1
            };

            function ru(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var rs = function(e, t) {
                    if (!ru(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                rf = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && ru(n, ShadowRoot) && (n = n.host), rp(e, n)) {
                            var o = rd(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                rp = function(e, t) {
                    return "v" === e ? rs(t, "overflowY") : rs(t, "overflowX")
                },
                rd = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                ry = function(e, t, r, n, o) {
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
                        var y = rd(e, c),
                            m = y[0],
                            b = y[1] - y[2] - i * m;
                        (m || b) && rp(e, c) && (p += b, d += m);
                        var v = c.parentNode;
                        c = v && v.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? v.host : v
                    } while (!u && c !== document.body || u && (t.contains(c) || t === c));
                    return f && (o && 1 > Math.abs(p) || !o && l > p) ? s = !0 : !f && (o && 1 > Math.abs(d) || !o && -l > d) && (s = !0), s
                },
                rm = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                rb = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                rv = function(e) {
                    return e && "current" in e ? e.current : e
                },
                rh = 0,
                rg = [],
                rw = (l = function(e) {
                    var t = ec.useRef([]),
                        r = ec.useRef([0, 0]),
                        n = ec.useRef(),
                        o = ec.useState(rh++)[0],
                        a = ec.useState(t8)[0],
                        i = ec.useRef(e);
                    ec.useEffect(function() {
                        i.current = e
                    }, [e]), ec.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, o = 0, a = t.length; o < a; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(rv), !0).filter(Boolean);
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
                    var l = ec.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !i.current.allowPinchZoom;
                            var o, a = rm(e),
                                l = r.current,
                                c = "deltaX" in e ? e.deltaX : l[0] - a[0],
                                u = "deltaY" in e ? e.deltaY : l[1] - a[1],
                                s = e.target,
                                f = Math.abs(c) > Math.abs(u) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var p = rf(f, s);
                            if (!p) return !0;
                            if (p ? o = f : (o = "v" === f ? "h" : "v", p = rf(f, s)), !p) return !1;
                            if (!n.current && "changedTouches" in e && (c || u) && (n.current = o), !o) return !0;
                            var d = n.current || o;
                            return ry(d, t, e, "h" === d ? c : u, !0)
                        }, []),
                        c = ec.useCallback(function(e) {
                            if (rg.length && rg[rg.length - 1] === a) {
                                var r = "deltaY" in e ? rb(e) : rm(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var o = (i.current.shards || []).map(rv).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !i.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        u = ec.useCallback(function(e, r, n, o) {
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
                        s = ec.useCallback(function(e) {
                            r.current = rm(e), n.current = void 0
                        }, []),
                        f = ec.useCallback(function(t) {
                            u(t.type, rb(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        p = ec.useCallback(function(t) {
                            u(t.type, rm(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    ec.useEffect(function() {
                        return rg.push(a), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", c, rc), document.addEventListener("touchmove", c, rc), document.addEventListener("touchstart", s, rc),
                            function() {
                                rg = rg.filter(function(e) {
                                    return e !== a
                                }), document.removeEventListener("wheel", c, rc), document.removeEventListener("touchmove", c, rc), document.removeEventListener("touchstart", s, rc)
                            }
                    }, []);
                    var d = e.removeScrollBar,
                        y = e.inert;
                    return ec.createElement(ec.Fragment, null, y ? ec.createElement(a, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, d ? ec.createElement(ra, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, tJ.useMedium(l), t2),
                rO = ec.forwardRef(function(e, t) {
                    return ec.createElement(t1, tX({}, e, {
                        ref: t,
                        sideCar: rw
                    }))
                });
            rO.classNames = t1.classNames;
            var rj = new WeakMap,
                rx = new WeakMap,
                rS = {},
                rP = 0,
                rE = function(e) {
                    return e && (e.host || rE(e.parentNode))
                },
                rA = function(e, t, r, n) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = rE(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    rS[r] || (rS[r] = new WeakMap);
                    var a = rS[r],
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
                                    c = (rj.get(e) || 0) + 1,
                                    u = (a.get(e) || 0) + 1;
                                rj.set(e, c), a.set(e, u), i.push(e), 1 === c && o && rx.set(e, !0), 1 === u && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), rP++,
                        function() {
                            i.forEach(function(e) {
                                var t = rj.get(e) - 1,
                                    o = a.get(e) - 1;
                                rj.set(e, t), a.set(e, o), t || (rx.has(e) || e.removeAttribute(n), rx.delete(e)), o || e.removeAttribute(r)
                            }), --rP || (rj = new WeakMap, rj = new WeakMap, rx = new WeakMap, rS = {})
                        }
                },
                rC = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), rA(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function rI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rR(e) {
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

            function rN(e, t) {
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

            function rk(e, t) {
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

            function rD(e, t) {
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
                        if ("string" == typeof e) return rI(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rI(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rT = "Dialog",
                rL = rD(tf(rT), 2),
                rM = rL[0];
            rL[1];
            var r_ = rD(rM(rT), 2),
                rU = r_[0],
                rF = r_[1],
                rB = function(e) {
                    var t = e.__scopeDialog,
                        r = e.children,
                        n = e.open,
                        o = e.defaultOpen,
                        a = e.onOpenChange,
                        i = e.modal,
                        l = ec.useRef(null),
                        c = ec.useRef(null),
                        u = rD(tj({
                            prop: n,
                            defaultProp: o,
                            onChange: a
                        }), 2),
                        s = u[0],
                        f = u[1];
                    return (0, X.jsx)(rU, {
                        scope: t,
                        triggerRef: l,
                        contentRef: c,
                        contentId: tv(),
                        titleId: tv(),
                        descriptionId: tv(),
                        open: void 0 !== s && s,
                        onOpenChange: f,
                        onOpenToggle: ec.useCallback(function() {
                            return f(function(e) {
                                return !e
                            })
                        }, [f]),
                        modal: void 0 === i || i,
                        children: r
                    })
                };
            rB.displayName = rT;
            var rW = "DialogTrigger";
            ec.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = rk(e, ["__scopeDialog"]),
                    o = rF(rW, r),
                    a = ta(t, o.triggerRef);
                return (0, X.jsx)(tU.button, rN(rR({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": r4(o.open)
                }, n), {
                    ref: a,
                    onClick: tt(e.onClick, o.onOpenToggle)
                }))
            }).displayName = rW;
            var rK = "DialogPortal",
                rz = rD(rM(rK, {
                    forceMount: void 0
                }), 2),
                rH = rz[0],
                rV = rz[1],
                rX = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        a = rF(rK, t);
                    return (0, X.jsx)(rH, {
                        scope: t,
                        forceMount: r,
                        children: ec.Children.map(n, function(e) {
                            return (0, X.jsx)(tz, {
                                present: r || a.open,
                                children: (0, X.jsx)(tB, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            rX.displayName = rK;
            var rG = "DialogOverlay",
                rq = ec.forwardRef(function(e, t) {
                    var r = rV(rG, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = rk(e, ["forceMount"]),
                        i = rF(rG, e.__scopeDialog);
                    return i.modal ? (0, X.jsx)(tz, {
                        present: o || i.open,
                        children: (0, X.jsx)(r$, rN(rR({}, a), {
                            ref: t
                        }))
                    }) : null
                });
            rq.displayName = rG;
            var rY = tk("DialogOverlay.RemoveScroll"),
                r$ = ec.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = rk(e, ["__scopeDialog"]),
                        o = rF(rG, r);
                    return (0, X.jsx)(rO, {
                        as: rY,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, X.jsx)(tU.div, rN(rR({
                            "data-state": r4(o.open)
                        }, n), {
                            ref: t,
                            style: rR({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                rZ = "DialogContent",
                rQ = ec.forwardRef(function(e, t) {
                    var r = rV(rZ, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = rk(e, ["forceMount"]),
                        i = rF(rZ, e.__scopeDialog);
                    return (0, X.jsx)(tz, {
                        present: o || i.open,
                        children: i.modal ? (0, X.jsx)(rJ, rN(rR({}, a), {
                            ref: t
                        })) : (0, X.jsx)(r0, rN(rR({}, a), {
                            ref: t
                        }))
                    })
                });
            rQ.displayName = rZ;
            var rJ = ec.forwardRef(function(e, t) {
                    var r = rF(rZ, e.__scopeDialog),
                        n = ec.useRef(null),
                        o = ta(t, r.contentRef, n);
                    return ec.useEffect(function() {
                        var e = n.current;
                        if (e) return rC(e)
                    }, []), (0, X.jsx)(r1, rN(rR({}, e), {
                        ref: o,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: tt(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: tt(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: tt(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                r0 = ec.forwardRef(function(e, t) {
                    var r = rF(rZ, e.__scopeDialog),
                        n = ec.useRef(!1),
                        o = ec.useRef(!1);
                    return (0, X.jsx)(r1, rN(rR({}, e), {
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
                r1 = ec.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        i = rk(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = rF(rZ, r),
                        c = ec.useRef(null),
                        u = ta(t, c);
                    return (0, tV.useFocusGuards)(), (0, X.jsxs)(X.Fragment, {
                        children: [(0, X.jsx)(tS.FocusScope, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: a,
                            children: (0, X.jsx)(tx.DismissableLayer, rN(rR({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": r4(l.open)
                            }, i), {
                                ref: u,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, X.jsxs)(X.Fragment, {
                            children: [(0, X.jsx)(nt, {
                                titleId: l.titleId
                            }), (0, X.jsx)(nr, {
                                contentRef: c,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                r2 = "DialogTitle",
                r3 = ec.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = rk(e, ["__scopeDialog"]),
                        o = rF(r2, r);
                    return (0, X.jsx)(tU.h2, rN(rR({
                        id: o.titleId
                    }, n), {
                        ref: t
                    }))
                });
            r3.displayName = r2;
            var r6 = "DialogDescription";
            ec.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = rk(e, ["__scopeDialog"]),
                    o = rF(r6, r);
                return (0, X.jsx)(tU.p, rN(rR({
                    id: o.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = r6;
            var r8 = "DialogClose",
                r5 = ec.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = rk(e, ["__scopeDialog"]),
                        o = rF(r8, r);
                    return (0, X.jsx)(tU.button, rN(rR({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: tt(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function r4(e) {
                return e ? "open" : "closed"
            }
            r5.displayName = r8;
            var r7 = "DialogTitleWarning",
                r9 = rD((c = {
                    contentName: rZ,
                    titleName: r2,
                    docsSlug: "dialog"
                }, u = ec.createContext(c), (s = function(e) {
                    var t = e.children,
                        r = tu(e, ["children"]),
                        n = ec.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, X.jsx)(u.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = r7 + "Provider", [s, function(e) {
                    var t = ec.useContext(u);
                    if (t) return t;
                    if (void 0 !== c) return c;
                    throw Error("`".concat(e, "` must be used within `").concat(r7, "`"))
                }]), 2),
                ne = (r9[0], r9[1]),
                nt = function(e) {
                    var t = e.titleId,
                        r = ne(r7),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return ec.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                nr = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = ne("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return ec.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(o))
                    }, [o, t, r]), null
                };

            function nn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function no(e) {
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

            function na(e, t) {
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

            function ni(e, t) {
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

            function nl(e) {
                return function(e) {
                    if (Array.isArray(e)) return nn(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nn(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nn(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nc(e) {
                var t, r, n = (t = e, (r = ec.forwardRef(function(e, t) {
                        var r = e.children,
                            n = ni(e, ["children"]);
                        if (ec.isValidElement(r)) {
                            var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = no({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = a.apply(void 0, nl(t));
                                            return o.apply(void 0, nl(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = no({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return no({}, e, r)
                                }(n, r.props);
                            return r.type !== ec.Fragment && (s.ref = t ? to(t, u) : u), ec.cloneElement(r, s)
                        }
                        return ec.Children.count(r) > 1 ? ec.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = ec.forwardRef(function(e, t) {
                        var r = e.children,
                            o = ni(e, ["children"]),
                            a = ec.Children.toArray(r),
                            i = a.find(ns);
                        if (i) {
                            var l = i.props.children,
                                c = a.map(function(e) {
                                    return e !== i ? e : ec.Children.count(l) > 1 ? ec.Children.only(null) : ec.isValidElement(l) ? l.props.children : null
                                });
                            return (0, X.jsx)(n, na(no({}, o), {
                                ref: t,
                                children: ec.isValidElement(l) ? ec.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, X.jsx)(n, na(no({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var nu = Symbol("radix.slottable");

            function ns(e) {
                return ec.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nu
            }

            function nf(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function np(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        nf(e, t, r[t])
                    })
                }
                return e
            }

            function nd(e, t) {
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
            var ny = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r = nc("Primitive.".concat(t)),
                    n = ec.forwardRef(function(e, n) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, X.jsx)(i, nd(np({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), nd(np({}, e), nf({}, t, n))
            }, {});

            function nm(e) {
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
            var nb = Object.freeze({
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
                nv = ec.forwardRef(function(e, t) {
                    var r, n;
                    return (0, X.jsx)(ny.span, (r = nm({}, e), n = n = {
                        ref: t,
                        style: nm({}, nb, e.style)
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

            function nh(e) {
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

            function ng(e, t) {
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
            nv.displayName = "VisuallyHidden";
            var nw = (0, ec.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                nO = function() {
                    var e = (0, ec.useContext)(nw);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                nj = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                nx = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                nS = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                nP = function(e) {
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
                        h = (0, ec.useMemo)(function() {
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
                    return (0, ec.useEffect)(function() {
                        v && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [v, t]), eu().createElement(nw.Provider, {
                        value: h
                    }, eu().createElement(rB, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            nP.displayName = "Dialog";
            var nE = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    o = e.overlayClassName,
                    a = e.overlayStyle,
                    i = e.onOpenAutoFocus,
                    l = ng(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = nO(),
                    u = c.size,
                    s = c.isModal,
                    f = c.hasCloseAffordance,
                    p = c.closeLabel,
                    d = c.hasDescription,
                    y = eJ("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
                    m = eJ("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return eu().createElement(rX, null, eu().createElement(rq, {
                    className: y,
                    style: a
                }, eu().createElement(rQ, nh({
                    className: m,
                    "data-size": u,
                    style: n,
                    onOpenAutoFocus: i
                }, !d && {
                    "aria-describedby": void 0
                }, l), f && eu().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, eu().createElement(r5, {
                    asChild: !0
                }, eu().createElement(te, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": p
                }))), t)))
            };
            nE.displayName = "DialogContent";
            var nA = function(e) {
                var t = e.children,
                    r = e.className,
                    n = ng(e, ["children", "className"]),
                    o = nO(),
                    a = o.size,
                    i = o.hasMarginTop,
                    l = o.hasMarginBottom,
                    c = eJ(nj[a], i && nx[a], l && nS[a], r);
                return eu().createElement("div", nh({
                    className: c
                }, n), t)
            };
            nA.displayName = "DialogBody";
            var nC = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    o = ng(e, ["children", "className", "hidden"]),
                    a = eu().createElement(r3, nh({
                        className: r
                    }, o), t);
                return n ? eu().createElement(nv, null, a) : a
            };
            nC.displayName = "DialogTitle";
            var nI = function(e) {
                var t = e.children,
                    r = e.className,
                    n = ng(e, ["children", "className"]),
                    o = nO().size,
                    a = eJ(nj[o], nS[o], r);
                return eu().createElement("div", nh({
                    className: a
                }, n), t)
            };
            nI.displayName = "DialogFooter";
            var nR = function(e) {
                var t = e.width,
                    r = e.height;
                return eu().createElement("svg", {
                    className: "foundation-web-loading-spinner",
                    width: t,
                    height: r,
                    viewBox: "0 0 20 20",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg"
                }, eu().createElement("path", {
                    fillRule: "evenodd",
                    clipRule: "evenodd",
                    fill: "currentColor",
                    d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                }))
            };

            function nN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nk(e) {
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

            function nD(e, t) {
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

            function nT(e, t) {
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

            function nL(e) {
                return function(e) {
                    if (Array.isArray(e)) return nN(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nN(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nN(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nM(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var n_ = Symbol.for("react.lazy"),
                nU = ec[" use ".trim().toString()];

            function nF(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : nM(e)) === "object" && "$$typeof" in e && e.$$typeof === n_ && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : nM(t)) === "object" && null !== t && "then" in t
            }
            var nB = ((e = ec.forwardRef(function(e, t) {
                    var r = e.children,
                        n = nT(e, ["children"]);
                    if (nF(r) && "function" == typeof nU && (r = nU(r._payload)), ec.isValidElement(r)) {
                        var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = nk({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = a.apply(void 0, nL(t));
                                        return o.apply(void 0, nL(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = nk({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                }(n);
                                return nk({}, e, r)
                            }(n, r.props);
                        return r.type !== ec.Fragment && (s.ref = t ? to(t, u) : u), ec.cloneElement(r, s)
                    }
                    return ec.Children.count(r) > 1 ? ec.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), f = e, (p = ec.forwardRef(function(e, t) {
                    var r = e.children,
                        n = nT(e, ["children"]);
                    nF(r) && "function" == typeof nU && (r = nU(r._payload));
                    var o = ec.Children.toArray(r),
                        a = o.find(nK);
                    if (a) {
                        var i = a.props.children,
                            l = o.map(function(e) {
                                return e !== a ? e : ec.Children.count(i) > 1 ? ec.Children.only(null) : ec.isValidElement(i) ? i.props.children : null
                            });
                        return (0, X.jsx)(f, nD(nk({}, n), {
                            ref: t,
                            children: ec.isValidElement(i) ? ec.cloneElement(i, void 0, l) : null
                        }))
                    }
                    return (0, X.jsx)(f, nD(nk({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), p),
                nW = Symbol("radix.slottable");

            function nK(e) {
                return ec.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nW
            }

            function nz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nH(e) {
                if (Array.isArray(e)) return e
            }

            function nV() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function nX(e) {
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

            function nG(e, t) {
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

            function nq(e, t) {
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

            function nY(e, t) {
                if (e) {
                    if ("string" == typeof e) return nz(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nz(e, t)
                }
            }
            var n$ = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                nZ = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                nQ = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                nJ = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                n0 = (0, ec.forwardRef)(function(e, t) {
                    var r, n = nH(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || nY(r) || nV(),
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
                        g = nq(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        w = (nH(a) || function(e) {
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
                        }(a) || nY(a, 1) || nV())[0],
                        O = eJ("foundation-web-button", s ? "opacity-[0.5]" : [e0, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", nZ[m], s ? nJ[v] : nQ[v], l),
                        j = nX({
                            textDecoration: "none"
                        }, c),
                        x = function(e) {
                            return eu().createElement(eu().Fragment, null, eu().createElement(e1, null), p && eu().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, eu().createElement(nR, {
                                width: n$[m],
                                height: n$[m]
                            })), eu().createElement("span", {
                                className: eJ("flex items-center min-width-0", "Large" === m || "Medium" === m ? "gap-small" : "gap-xsmall", p && "invisible")
                            }, d && eu().createElement(e4, {
                                name: d,
                                size: m
                            }), eu().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (h) {
                        g.as;
                        var S = nq(g, ["as"]),
                            P = eu().Children.only(i);
                        return eu().createElement(nB, nG(nX({
                            ref: w
                        }, S), {
                            className: O,
                            style: j,
                            "aria-disabled": s || void 0
                        }), eu().cloneElement(P, {}, x(P.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var E = g.href,
                            A = nq(g, ["as", "href"]);
                        return eu().createElement("a", nG(nX({
                            ref: w
                        }, A), {
                            "aria-disabled": s,
                            href: s ? void 0 : E,
                            className: O,
                            style: j
                        }), x(i))
                    }
                    g.as;
                    var C = nq(g, ["as"]);
                    return eu().createElement("button", nG(nX({
                        ref: w,
                        type: "button"
                    }, C), {
                        disabled: s,
                        className: O,
                        style: j
                    }), x(i))
                }),
                n1 = window.Roblox["core-scripts"].http.http,
                n2 = function(e, t) {
                    var r = "".concat(ek().apiGatewayUrl, "/access-management/v1/upsell-feature-access"),
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

            function n3(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function n6(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            n3(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            n3(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function n8(e, t) {
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

            function n5(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var n4 = function(e, t) {
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
                                    return r = n2(e, t), [4, n1.get(r)];
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
                                n5(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                n5(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                },
                n7 = '<a href="https://en.help.roblox.com/hc/articles/28943243301780" target="_blank" rel="noreferrer" class="text-link">',
                n9 = "<a href=",
                oe = function(e) {
                    return " onclick=\"if(window.location.pathname.includes('/my/account')){event.preventDefault();window.location.href='".concat(e, '\';window.location.reload();}" class="text-link">')
                },
                ot = "</a>",
                or = "<br />";

            function on(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var oo = function(e) {
                var t = e.showModal,
                    r = e.onModalClose,
                    n = e.translate,
                    o = e.intl,
                    a = (0, G.useQuery)({
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
                                            if (r = null != (e = null == (t = (0, ez.authenticatedUser)()) ? void 0 : t.isAuthenticated) && e, n = !!navigator.globalPrivacyControl, !r) return [3, 2];
                                            return [4, n6(function() {
                                                var e;
                                                return n8(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return e = {
                                                                withCredentials: !0,
                                                                url: "".concat(ek().userSettingsApi, "/v1/user-settings/gpc")
                                                            }, [4, n1.post(e)];
                                                        case 1:
                                                            return t.sent(), [2]
                                                    }
                                                })
                                            })()];
                                        case 1:
                                            i.sent(), i.label = 2;
                                        case 2:
                                            if (o = !1, !r) return [3, 4];
                                            return [4, n4("ShouldShowAdsSettings", "account_management/UserSettingsPolicy")];
                                        case 3:
                                            o = "Granted" === i.sent().access, i.label = 4;
                                        case 4:
                                            if (a = !1, !r) return [3, 6];
                                            return [4, n6(function() {
                                                return n8(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            return [4, n1.get({
                                                                retryable: !0,
                                                                withCredentials: !0,
                                                                url: "".concat(ek().userSettingsApi, "/v1/user-settings")
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
                                        on(a, n, o, i, l, "next", e)
                                    }

                                    function l(e) {
                                        on(a, n, o, i, l, "throw", e)
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
                return (0, X.jsx)(nP, {
                    open: t,
                    onOpenChange: r,
                    size: "Small",
                    isModal: !0,
                    hasCloseAffordance: !0,
                    closeLabel: "Action.Close",
                    children: (0, X.jsx)(nE, {
                        children: (0, X.jsxs)(eu().Fragment, {
                            children: [(0, X.jsxs)(nA, {
                                children: [l ? (0, X.jsx)(nC, {
                                    hidden: !0,
                                    className: "text-heading-small",
                                    children: n("Description.Loading")
                                }) : (0, X.jsx)(nC, {
                                    className: "text-heading-small",
                                    children: c ? n("Title.Error") : i.isGpcDetected ? n("Title.GpcDetected") : n("Title.NoGpcDetected")
                                }), function() {
                                    if (l) return (0, X.jsx)(em.Loading, {});
                                    var e, t = (e = o.getRobloxLocale(), (0, eQ.getUrlWithLocale)("/my/account#!/privacy/AdPreferences", e)),
                                        r = n("Body.Error"),
                                        a = n("Body.GpcMissingSettingIneligible", {
                                            lineBreak: or,
                                            aTagStart: n7,
                                            aTagEnd: ot
                                        }),
                                        u = n("Body.GpcMissingSettingEligible", {
                                            lineBreak: or,
                                            aTagWithHref: n9,
                                            link: t,
                                            hrefEnd: oe(t),
                                            aTagEnd: ot
                                        }),
                                        s = n("Body.GpcDetectedSettingEnabledIneligible", {
                                            lineBreak: or,
                                            aTagStart: n7,
                                            aTagEnd: ot
                                        }),
                                        f = n("Body.GpcDetectedSettingEnabledEligible", {
                                            lineBreak: or,
                                            aTagWithHref: n9,
                                            link: t,
                                            hrefEnd: oe(t),
                                            aTagEnd: ot
                                        }),
                                        p = n("Body.GpcDetectedSettingDisabledIneligible", {
                                            lineBreak: or,
                                            aTagStart: n7,
                                            aTagEnd: ot
                                        }),
                                        d = n("Body.GpcDetectedSettingDisabledEligible", {
                                            lineBreak: or,
                                            aTagWithHref: n9,
                                            link: t,
                                            hrefEnd: oe(t),
                                            aTagEnd: ot
                                        }),
                                        y = c ? r : i.isGpcDetected ? i.isAdsSellShareDataEnabled ? i.canUserManageAdsSettings ? f : s : i.canUserManageAdsSettings ? d : p : i.canUserManageAdsSettings ? u : a;
                                    return (0, X.jsx)("div", {
                                        className: "text-body-medium",
                                        dangerouslySetInnerHTML: {
                                            __html: y
                                        }
                                    })
                                }()]
                            }), !l && (0, X.jsx)(nI, {
                                className: "width-full",
                                children: (0, X.jsx)(n0, {
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
            var oi = function() {
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
                                return e.trys.push([0, 2, , 3]), [4, (0, eV.callBehaviour)("footer-ui")];
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
                            oa(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            oa(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                })()
            };

            function ol(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oc(e) {
                var t, r = e.translate,
                    n = e.intl,
                    o = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, ec.useState)(!1)) || function(e) {
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
                            if ("string" == typeof e) return ol(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ol(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    a = o[0],
                    i = o[1],
                    l = (0, G.useQuery)({
                        queryKey: ["isYourPrivacyChoicesModalEnabled"],
                        queryFn: oi,
                        placeholderData: !1
                    }).data,
                    c = Q,
                    u = !1,
                    s = document.getElementById("footer-container");
                if (null != s) {
                    var f = s.getAttribute("data-is-giftcards-footer-enabled");
                    null != f && (u = "true" === f.toLowerCase())
                }
                u && (c = J);
                var p = c.map(function(e) {
                    return (0, X.jsx)("li", {
                        className: "footer-link",
                        children: "your-privacy-choices" === e.name && l ? (0, X.jsxs)("button", {
                            onClick: function() {
                                return i(!0)
                            },
                            className: "text-footer-nav footer-button-link",
                            type: "button",
                            children: [r(e.labelTranslationKey), (0, X.jsx)("img", {
                                src: e.postfixIcon,
                                alt: "",
                                className: "footer-postfixIcon"
                            })]
                        }) : (0, X.jsxs)("a", {
                            href: ea.urlService.getUrlWithLocale(e.path, n.getRobloxLocale()),
                            className: ef()("text-footer-nav", e.cssClass),
                            target: "_blank",
                            rel: "noreferrer",
                            onClick: function(t) {
                                var r;
                                return r = e.name, void(0, ep.sendEventWithTarget)("PageFooter", "click", {
                                    destination: "".concat(r),
                                    source: "".concat(t.currentTarget.ownerDocument.location.pathname)
                                }, ep.targetTypes.WWW)
                            },
                            children: [r(e.labelTranslationKey), e.postfixIcon ? (0, X.jsx)("img", {
                                src: e.postfixIcon,
                                alt: "",
                                className: "footer-postfixIcon"
                            }) : ""]
                        })
                    }, e.name)
                });
                return (0, X.jsxs)(eu().Fragment, {
                    children: [(0, X.jsxs)("ul", {
                        className: "row footer-links flex flex-wrap justify-center padding-bottom-xxsmall",
                        children: [p, (0, X.jsx)("li", {
                            children: (0, X.jsx)(eZ, {
                                translate: r
                            })
                        })]
                    }), (0, X.jsx)(oo, {
                        showModal: a,
                        onModalClose: function() {
                            return i(!1)
                        },
                        translate: r,
                        intl: n
                    })]
                })
            }
            oc.propTypes = {
                translate: et().func.isRequired,
                intl: et().shape({
                    getRobloxLocale: et().func.isRequired
                }).isRequired
            };
            var ou = window.CoreRobloxUtilities,
                os = 0,
                of = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, ec.useRef)();
                    return t.current || (os += 1, t.current = "".concat(e).concat(os)), t.current
                };

            function op(e) {
                var t = e.className;
                return eu().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: eJ("block", t),
                    style: {
                        marginTop: -1
                    }
                }, eu().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function od(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function oy(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function om(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function ob() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = om(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : om(t[e], null)
                        }
                    }
                }
            }

            function ov() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return ec.useCallback(ob.apply(void 0, function(e) {
                    if (Array.isArray(e)) return oy(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return oy(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oy(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function oh(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function og(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ow(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        og(e, t, r[t])
                    })
                }
                return e
            }

            function oO(e) {
                return function(e) {
                    if (Array.isArray(e)) return oh(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return oh(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oh(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oj(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return ec.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return ec.useMemo(function() {
                                var t, o;
                                return og({}, "__scope".concat(e), (t = ow({}, r), o = null != (o = og({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                    var o = ec.createContext(n),
                        a = r.length;
                    r = oO(r).concat([n]);
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
                            u = ec.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, X.jsx)(c.Provider, {
                            value: u,
                            children: i
                        })
                    };
                    return i.displayName = t + "Provider", [i, function(r, i) {
                        var l, c = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                            u = ec.useContext(c);
                        if (u) return u;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, ox.apply(void 0, [n].concat(oO(t)))]
            }

            function ox() {
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
                            return ow({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return ec.useMemo(function() {
                            return og({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var oS = (null == (V = globalThis) ? void 0 : V.document) ? ec.useLayoutEffect : function() {};

            function oP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var oE = ec["useId".toString()] || function() {},
                oA = 0,
                oC = ["top", "right", "bottom", "left"],
                oI = Math.min,
                oR = Math.max,
                oN = Math.round,
                ok = Math.floor,
                oD = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                oT = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                oL = {
                    start: "end",
                    end: "start"
                };

            function oM(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function o_(e) {
                return e.split("-")[0]
            }

            function oU(e) {
                return e.split("-")[1]
            }

            function oF(e) {
                return "x" === e ? "y" : "x"
            }

            function oB(e) {
                return "y" === e ? "height" : "width"
            }
            var oW = new Set(["top", "bottom"]);

            function oK(e) {
                return oW.has(o_(e)) ? "y" : "x"
            }

            function oz(e) {
                return e.replace(/start|end/g, function(e) {
                    return oL[e]
                })
            }
            var oH = ["left", "right"],
                oV = ["right", "left"],
                oX = ["top", "bottom"],
                oG = ["bottom", "top"];

            function oq(e) {
                return e.replace(/left|right|bottom|top/g, function(e) {
                    return oT[e]
                })
            }

            function oY(e) {
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

            function o$(e) {
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

            function oZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oQ(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function oJ(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            oQ(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            oQ(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function o0(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function o1(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        o0(e, t, r[t])
                    })
                }
                return e
            }

            function o2(e, t) {
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

            function o3(e, t) {
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

            function o6(e) {
                return function(e) {
                    if (Array.isArray(e)) return oZ(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return oZ(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oZ(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function o8(e, t) {
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

            function o5(e, t, r) {
                var n, o = e.reference,
                    a = e.floating,
                    i = oK(t),
                    l = oF(oK(t)),
                    c = oB(l),
                    u = o_(t),
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
                switch (oU(t)) {
                    case "start":
                        n[l] -= d * (r && s ? -1 : 1);
                        break;
                    case "end":
                        n[l] += d * (r && s ? -1 : 1)
                }
                return n
            }

            function o4(e, t) {
                return oJ(function() {
                    var r, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, w, O, j, x, S, P, E, A, C, I, R, N, k;
                    return o8(this, function(D) {
                        switch (D.label) {
                            case 0:
                                return void 0 === t && (t = {}), n = e.x, o = e.y, a = e.platform, i = e.rects, l = e.elements, c = e.strategy, f = void 0 === (s = (u = oM(t, e)).boundary) ? "clippingAncestors" : s, d = void 0 === (p = u.rootBoundary) ? "viewport" : p, m = void 0 === (y = u.elementContext) ? "floating" : y, v = void 0 !== (b = u.altBoundary) && b, g = oY(void 0 === (h = u.padding) ? 0 : h), w = "floating" === m ? "reference" : "floating", O = l[v ? w : m], x = a.getClippingRect, S = {}, [4, null == a.isElement ? void 0 : a.isElement(O)];
                            case 1:
                                if (!(null == (r = D.sent()) || r)) return [3, 2];
                                return P = O, [3, 5];
                            case 2:
                                if (E = O.contextElement) return [3, 4];
                                return [4, null == a.getDocumentElement ? void 0 : a.getDocumentElement(l.floating)];
                            case 3:
                                E = D.sent(), D.label = 4;
                            case 4:
                                P = E, D.label = 5;
                            case 5:
                                return [4, x.apply(a, [(S.element = P, S.boundary = f, S.rootBoundary = d, S.strategy = c, S)])];
                            case 6:
                                return j = o$.apply(void 0, [D.sent()]), A = "floating" === m ? {
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
                                return N = o$.apply(void 0, [k]), [2, {
                                    top: (j.top - N.top + g.top) / I.y,
                                    bottom: (N.bottom - j.bottom + g.bottom) / I.y,
                                    left: (j.left - N.left + g.left) / I.x,
                                    right: (N.right - j.right + g.right) / I.x
                                }]
                        }
                    })
                })()
            }

            function o7(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function o9(e) {
                return oC.some(function(t) {
                    return e[t] >= 0
                })
            }
            var ae = new Set(["left", "top"]);

            function at(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function ar() {
                return "u" > typeof window
            }

            function an(e) {
                return ai(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function ao(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function aa(e) {
                var t;
                return null == (t = (ai(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function ai(e) {
                return !!ar() && (at(e, Node) || at(e, ao(e).Node))
            }

            function al(e) {
                return !!ar() && (at(e, Element) || at(e, ao(e).Element))
            }

            function ac(e) {
                return !!ar() && (at(e, HTMLElement) || at(e, ao(e).HTMLElement))
            }

            function au(e) {
                return !(!ar() || "u" < typeof ShadowRoot) && (at(e, ShadowRoot) || at(e, ao(e).ShadowRoot))
            }
            var as = new Set(["inline", "contents"]);

            function af(e) {
                var t = aj(e),
                    r = t.overflow,
                    n = t.overflowX,
                    o = t.overflowY,
                    a = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + o + n) && !as.has(a)
            }
            var ap = new Set(["table", "td", "th"]),
                ad = [":popover-open", ":modal"];

            function ay(e) {
                return ad.some(function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                })
            }
            var am = ["transform", "translate", "scale", "rotate", "perspective"],
                ab = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                av = ["paint", "layout", "strict", "content"];

            function ah(e) {
                var t = ag(),
                    r = al(e) ? aj(e) : e;
                return am.some(function(e) {
                    return !!r[e] && "none" !== r[e]
                }) || !!r.containerType && "normal" !== r.containerType || !t && !!r.backdropFilter && "none" !== r.backdropFilter || !t && !!r.filter && "none" !== r.filter || ab.some(function(e) {
                    return (r.willChange || "").includes(e)
                }) || av.some(function(e) {
                    return (r.contain || "").includes(e)
                })
            }

            function ag() {
                return !("u" < typeof CSS) && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var aw = new Set(["html", "body", "#document"]);

            function aO(e) {
                return aw.has(an(e))
            }

            function aj(e) {
                return ao(e).getComputedStyle(e)
            }

            function ax(e) {
                return al(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function aS(e) {
                if ("html" === an(e)) return e;
                var t = e.assignedSlot || e.parentNode || au(e) && e.host || aa(e);
                return au(t) ? t.host : t
            }

            function aP(e, t, r) {
                void 0 === t && (t = []), void 0 === r && (r = !0);
                var n, o = function e(t) {
                        var r = aS(t);
                        return aO(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : ac(r) && af(r) ? r : e(r)
                    }(e),
                    a = o === (null == (n = e.ownerDocument) ? void 0 : n.body),
                    i = ao(o);
                if (a) {
                    var l = aE(i);
                    return t.concat(i, i.visualViewport || [], af(o) ? o : [], l && r ? aP(l) : [])
                }
                return t.concat(o, aP(o, [], r))
            }

            function aE(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function aA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aC(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function aI(e) {
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

            function aR(e, t) {
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

            function aN(e) {
                return function(e) {
                    if (Array.isArray(e)) return aA(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || ak(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ak(e, t) {
                if (e) {
                    if ("string" == typeof e) return aA(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aA(e, t)
                }
            }

            function aD(e) {
                var t = aj(e),
                    r = parseFloat(t.width) || 0,
                    n = parseFloat(t.height) || 0,
                    o = ac(e),
                    a = o ? e.offsetWidth : r,
                    i = o ? e.offsetHeight : n,
                    l = oN(r) !== a || oN(n) !== i;
                return l && (r = a, n = i), {
                    width: r,
                    height: n,
                    $: l
                }
            }

            function aT(e) {
                return al(e) ? e : e.contextElement
            }

            function aL(e) {
                var t = aT(e);
                if (!ac(t)) return oD(1);
                var r = t.getBoundingClientRect(),
                    n = aD(t),
                    o = n.width,
                    a = n.height,
                    i = n.$,
                    l = (i ? oN(r.width) : r.width) / o,
                    c = (i ? oN(r.height) : r.height) / a;
                return l && Number.isFinite(l) || (l = 1), c && Number.isFinite(c) || (c = 1), {
                    x: l,
                    y: c
                }
            }
            var aM = oD(0);

            function a_(e) {
                var t = ao(e);
                return ag() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : aM
            }

            function aU(e, t, r, n) {
                void 0 === t && (t = !1), void 0 === r && (r = !1);
                var o, a = e.getBoundingClientRect(),
                    i = aT(e),
                    l = oD(1);
                t && (n ? al(n) && (l = aL(n)) : l = aL(e));
                var c = (void 0 === (o = r) && (o = !1), n && (!o || n === ao(i)) && o) ? a_(i) : oD(0),
                    u = (a.left + c.x) / l.x,
                    s = (a.top + c.y) / l.y,
                    f = a.width / l.x,
                    p = a.height / l.y;
                if (i)
                    for (var d = ao(i), y = n && al(n) ? ao(n) : n, m = d, b = aE(m); b && n && y !== m;) {
                        var v = aL(b),
                            h = b.getBoundingClientRect(),
                            g = aj(b),
                            w = h.left + (b.clientLeft + parseFloat(g.paddingLeft)) * v.x,
                            O = h.top + (b.clientTop + parseFloat(g.paddingTop)) * v.y;
                        u *= v.x, s *= v.y, f *= v.x, p *= v.y, u += w, s += O, b = aE(m = ao(b))
                    }
                return o$({
                    width: f,
                    height: p,
                    x: u,
                    y: s
                })
            }

            function aF(e, t) {
                var r = ax(e).scrollLeft;
                return t ? t.left + r : aU(aa(e)).left + r
            }

            function aB(e, t) {
                var r = e.getBoundingClientRect();
                return {
                    x: r.left + t.scrollLeft - aF(e, r),
                    y: r.top + t.scrollTop
                }
            }
            var aW = new Set(["absolute", "fixed"]);

            function aK(e, t, r) {
                if ("viewport" === t) n = function(e, t) {
                    var r = ao(e),
                        n = aa(e),
                        o = r.visualViewport,
                        a = n.clientWidth,
                        i = n.clientHeight,
                        l = 0,
                        c = 0;
                    if (o) {
                        a = o.width, i = o.height;
                        var u = ag();
                        (!u || u && "fixed" === t) && (l = o.offsetLeft, c = o.offsetTop)
                    }
                    var s = aF(n);
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
                else if ("document" === t) o = aa(e), a = aa(o), i = ax(o), l = o.ownerDocument.body, c = oR(a.scrollWidth, a.clientWidth, l.scrollWidth, l.clientWidth), u = oR(a.scrollHeight, a.clientHeight, l.scrollHeight, l.clientHeight), s = -i.scrollLeft + aF(o), f = -i.scrollTop, "rtl" === aj(l).direction && (s += oR(a.clientWidth, l.clientWidth) - c), n = {
                    width: c,
                    height: u,
                    x: s,
                    y: f
                };
                else if (al(t)) d = (p = aU(t, !0, "fixed" === r)).top + t.clientTop, y = p.left + t.clientLeft, m = ac(t) ? aL(t) : oD(1), n = {
                    width: t.clientWidth * m.x,
                    height: t.clientHeight * m.y,
                    x: y * m.x,
                    y: d * m.y
                };
                else {
                    var n, o, a, i, l, c, u, s, f, p, d, y, m, b = a_(e);
                    n = {
                        x: t.x - b.x,
                        y: t.y - b.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return o$(n)
            }

            function az(e, t, r) {
                var n = ac(t),
                    o = aa(t),
                    a = "fixed" === r,
                    i = aU(e, !0, a, t),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    c = oD(0);
                if (n || !n && !a)
                    if (("body" !== an(t) || af(o)) && (l = ax(t)), n) {
                        var u = aU(t, !0, a, t);
                        c.x = u.x + t.clientLeft, c.y = u.y + t.clientTop
                    } else o && (c.x = aF(o));
                a && !n && o && (c.x = aF(o));
                var s = !o || n || a ? oD(0) : aB(o, l);
                return {
                    x: i.left + l.scrollLeft - c.x - s.x,
                    y: i.top + l.scrollTop - c.y - s.y,
                    width: i.width,
                    height: i.height
                }
            }

            function aH(e) {
                return "static" === aj(e).position
            }

            function aV(e, t) {
                if (!ac(e) || "fixed" === aj(e).position) return null;
                if (t) return t(e);
                var r = e.offsetParent;
                return aa(e) === r && (r = r.ownerDocument.body), r
            }

            function aX(e, t) {
                var r, n = ao(e);
                if (ay(e)) return n;
                if (!ac(e)) {
                    for (var o = aS(e); o && !aO(o);) {
                        if (al(o) && !aH(o)) return o;
                        o = aS(o)
                    }
                    return n
                }
                for (var a = aV(e, t); a && (r = a, ap.has(an(r))) && aH(a);) a = aV(a, t);
                return a && aO(a) && aH(a) && !ah(a) ? n : a || function(e) {
                    for (var t = aS(e); ac(t) && !aO(t);) {
                        if (ah(t)) return t;
                        if (ay(t)) break;
                        t = aS(t)
                    }
                    return null
                }(e) || n
            }
            var aG = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        r = e.rect,
                        n = e.offsetParent,
                        o = "fixed" === e.strategy,
                        a = aa(n),
                        i = !!t && ay(t.floating);
                    if (n === a || i && o) return r;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        c = oD(1),
                        u = oD(0),
                        s = ac(n);
                    if ((s || !s && !o) && (("body" !== an(n) || af(a)) && (l = ax(n)), ac(n))) {
                        var f = aU(n);
                        c = aL(n), u.x = f.x + n.clientLeft, u.y = f.y + n.clientTop
                    }
                    var p = !a || s || o ? oD(0) : aB(a, l);
                    return {
                        width: r.width * c.x,
                        height: r.height * c.y,
                        x: r.x * c.x - l.scrollLeft * c.x + u.x + p.x,
                        y: r.y * c.y - l.scrollTop * c.y + u.y + p.y
                    }
                },
                getDocumentElement: aa,
                getClippingRect: function(e) {
                    var t = e.element,
                        r = e.boundary,
                        n = e.rootBoundary,
                        o = e.strategy,
                        a = aN("clippingAncestors" === r ? ay(t) ? [] : function(e, t) {
                            var r = t.get(e);
                            if (r) return r;
                            for (var n = aP(e, [], !1).filter(function(e) {
                                    return al(e) && "body" !== an(e)
                                }), o = null, a = "fixed" === aj(e).position, i = a ? aS(e) : e; al(i) && !aO(i);) {
                                var l = aj(i),
                                    c = ah(i);
                                c || "fixed" !== l.position || (o = null), (a ? !c && !o : !c && "static" === l.position && !!o && aW.has(o.position) || af(i) && !c && function e(t, r) {
                                    var n = aS(t);
                                    return !(n === r || !al(n) || aO(n)) && ("fixed" === aj(n).position || e(n, r))
                                }(e, i)) ? n = n.filter(function(e) {
                                    return e !== i
                                }) : o = l, i = aS(i)
                            }
                            return t.set(e, n), n
                        }(t, this._c) : [].concat(r)).concat([n]),
                        i = a[0],
                        l = a.reduce(function(e, r) {
                            var n = aK(t, r, o);
                            return e.top = oR(n.top, e.top), e.right = oI(n.right, e.right), e.bottom = oI(n.bottom, e.bottom), e.left = oR(n.left, e.left), e
                        }, aK(t, i, o));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: aX,
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
                                    return t = this.getOffsetParent || aX, [4, (0, this.getDimensions)(e.floating)];
                                case 1:
                                    return r = a.sent(), n = {}, o = [e.reference], [4, t(e.floating)];
                                case 2:
                                    return [2, (n.reference = az.apply(void 0, o.concat([a.sent(), e.strategy])), n.floating = {
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
                                aC(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                aC(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    }).call(this)
                },
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = aD(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: aL,
                isElement: al,
                isRTL: function(e) {
                    return "rtl" === aj(e).direction
                }
            };

            function aq(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function aY(e, t, r, n) {
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
                    m = aT(e),
                    b = i || c ? aN(m ? aP(m) : []).concat(aN(aP(t))) : [];
                b.forEach(function(e) {
                    i && e.addEventListener("scroll", r, {
                        passive: !0
                    }), c && e.addEventListener("resize", r)
                });
                var v = m && p ? function(e, t) {
                        var r, n = null,
                            o = aa(e);

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
                                        rootMargin: -ok(f) + "px " + -ok(o.clientWidth - (s + p)) + "px " + -ok(o.clientHeight - (f + d)) + "px " + -ok(s) + "px",
                                        threshold: oR(0, oI(1, c)) || 1
                                    },
                                    m = !0;
                                try {
                                    n = new IntersectionObserver(b, aR(aI({}, y), {
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
                                1 !== n || aq(u, e.getBoundingClientRect()) || i(), m = !1
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
                    }(e) || ak(e, 1) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())[0];
                    n && n.target === m && g && (g.unobserve(t), cancelAnimationFrame(h), h = requestAnimationFrame(function() {
                        var e;
                        null == (e = g) || e.observe(t)
                    })), r()
                }), m && !y && g.observe(m), g.observe(t));
                var w = y ? aU(e) : null;
                return y && function t() {
                        var n = aU(e);
                        w && !aq(w, n) && r(), w = n, o = requestAnimationFrame(t)
                    }(), r(),
                    function() {
                        var e;
                        b.forEach(function(e) {
                            i && e.removeEventListener("scroll", r), c && e.removeEventListener("resize", r)
                        }), null == v || v(), null == (e = g) || e.disconnect(), g = null, y && cancelAnimationFrame(o)
                    }
            }
            var a$ = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return oJ(function() {
                                var r, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, w, O, j, x, S, P, E, A, C, I, R, N, k, D, T, L, M, _, U;
                                return o8(this, function(F) {
                                    switch (F.label) {
                                        case 0:
                                            if (r = t.x, n = t.y, o = t.placement, a = t.rects, i = t.platform, l = t.elements, c = t.middlewareData, s = (u = oM(e, t) || {}).element, p = void 0 === (f = u.padding) ? 0 : f, null == s) return [2, {}];
                                            return d = oY(p), y = {
                                                x: r,
                                                y: n
                                            }, b = oB(m = oF(oK(o))), [4, i.getDimensions(s)];
                                        case 1:
                                            return v = F.sent(), g = (h = "y" === m) ? "top" : "left", w = h ? "bottom" : "right", O = h ? "clientHeight" : "clientWidth", j = a.reference[b] + a.reference[m] - y[m] - a.floating[b], x = y[m] - a.reference[m], [4, null == i.getOffsetParent ? void 0 : i.getOffsetParent(s)];
                                        case 2:
                                            if (E = !(P = (S = F.sent()) ? S[O] : 0)) return [3, 4];
                                            return [4, null == i.isElement ? void 0 : i.isElement(S)];
                                        case 3:
                                            E = !F.sent(), F.label = 4;
                                        case 4:
                                            return E && (P = l.floating[O] || a.floating[b]), A = j / 2 - x / 2, C = P / 2 - v[b] / 2 - 1, I = oI(d[g], C), R = oI(d[w], C), N = I, k = P - v[b] - R, T = oR(N, oI(D = P / 2 - v[b] / 2 + A, k)), M = (L = !c.arrow && null != oU(o) && D !== T && a.reference[b] / 2 - (D < N ? I : R) - v[b] / 2 < 0) ? D < N ? D - N : D - k : 0, [2, (o0(U = {}, m, y[m] + M), o0(U, "data", o1((o0(_ = {}, m, T), o0(_, "centerOffset", D - T - M), _), L && {
                                                alignmentOffset: M
                                            })), o0(U, "reset", L), U)]
                                    }
                                })
                            })()
                        }
                    }
                },
                aZ = function(e, t, r) {
                    var n, o = new Map,
                        a = aI({
                            platform: aG
                        }, r),
                        i = aR(aI({}, a.platform), {
                            _c: o
                        });
                    return n = aR(aI({}, a), {
                        platform: i
                    }), oJ(function() {
                        var r, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, w, O, j, x, S, P, E, A, C;
                        return o8(this, function(I) {
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
                                    y = (d = o5(p = I.sent(), o, f)).x, m = d.y, b = o, v = {}, h = 0, g = 0, I.label = 3;
                                case 3:
                                    if (!(g < s.length)) return [3, 11];
                                    return O = (w = s[g]).name, [4, (0, w.fn)({
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
                                    if (x = (j = I.sent()).x, S = j.y, P = j.data, E = j.reset, y = null != x ? x : y, m = null != S ? S : m, v = o2(o1({}, v), o0({}, O, o1({}, v[O], P))), !(E && h <= 50)) return [3, 10];
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
                                    y = (C = o5(p, b, f)).x, m = C.y, I.label = 9;
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

            function aQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aJ(e) {
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

            function a0(e, t) {
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

            function a1(e, t) {
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
                        if ("string" == typeof e) return aQ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aQ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a2(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var a3 = "u" > typeof document ? ec.useLayoutEffect : function() {};

            function a6(e, t) {
                if (e === t) return !0;
                if ((void 0 === e ? "undefined" : a2(e)) !== (void 0 === t ? "undefined" : a2(t))) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                if (e && t && (void 0 === e ? "undefined" : a2(e)) === "object") {
                    if (Array.isArray(e)) {
                        if ((r = e.length) !== t.length) return !1;
                        for (n = r; 0 != n--;)
                            if (!a6(e[n], t[n])) return !1;
                        return !0
                    }
                    if ((r = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (n = r; 0 != n--;)
                        if (!({}).hasOwnProperty.call(t, o[n])) return !1;
                    for (n = r; 0 != n--;) {
                        var r, n, o, a = o[n];
                        if (("_owner" !== a || !e.$$typeof) && !a6(e[a], t[a])) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function a8(e) {
                return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function a5(e, t) {
                var r = a8(e);
                return Math.round(t * r) / r
            }

            function a4(e) {
                var t = ec.useRef(e);
                return a3(function() {
                    t.current = e
                }), t
            }

            function a7(e) {
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
                    b = a1(ec.useState({
                        x: 0,
                        y: 0,
                        strategy: o,
                        placement: r,
                        middlewareData: {},
                        isPositioned: !1
                    }), 2),
                    v = b[0],
                    h = b[1],
                    g = a1(ec.useState(i), 2),
                    w = g[0],
                    O = g[1];
                a6(w, i) || O(i);
                var j = a1(ec.useState(null), 2),
                    x = j[0],
                    S = j[1],
                    P = a1(ec.useState(null), 2),
                    E = P[0],
                    A = P[1],
                    C = ec.useCallback(function(e) {
                        e !== k.current && (k.current = e, S(e))
                    }, []),
                    I = ec.useCallback(function(e) {
                        e !== D.current && (D.current = e, A(e))
                    }, []),
                    R = s || x,
                    N = f || E,
                    k = ec.useRef(null),
                    D = ec.useRef(null),
                    T = ec.useRef(v),
                    L = null != y,
                    M = a4(y),
                    _ = a4(l),
                    U = a4(m),
                    F = ec.useCallback(function() {
                        if (k.current && D.current) {
                            var e = {
                                placement: r,
                                strategy: o,
                                middleware: w
                            };
                            _.current && (e.platform = _.current), aZ(k.current, D.current, e).then(function(e) {
                                var t = a0(aJ({}, e), {
                                    isPositioned: !1 !== U.current
                                });
                                B.current && !a6(T.current, t) && (T.current = t, tP.flushSync(function() {
                                    h(t)
                                }))
                            })
                        }
                    }, [w, r, o, _, U]);
                a3(function() {
                    !1 === m && T.current.isPositioned && (T.current.isPositioned = !1, h(function(e) {
                        return a0(aJ({}, e), {
                            isPositioned: !1
                        })
                    }))
                }, [m]);
                var B = ec.useRef(!1);
                a3(function() {
                    return B.current = !0,
                        function() {
                            B.current = !1
                        }
                }, []), a3(function() {
                    if (R && (k.current = R), N && (D.current = N), R && N) {
                        if (M.current) return M.current(R, N, F);
                        F()
                    }
                }, [R, N, F, M, L]);
                var W = ec.useMemo(function() {
                        return {
                            reference: k,
                            floating: D,
                            setReference: C,
                            setFloating: I
                        }
                    }, [C, I]),
                    K = ec.useMemo(function() {
                        return {
                            reference: R,
                            floating: N
                        }
                    }, [R, N]),
                    z = ec.useMemo(function() {
                        var e = {
                            position: o,
                            left: 0,
                            top: 0
                        };
                        if (!K.floating) return e;
                        var t = a5(K.floating, v.x),
                            r = a5(K.floating, v.y);
                        return d ? aJ(a0(aJ({}, e), {
                            transform: "translate(" + t + "px, " + r + "px)"
                        }), a8(K.floating) >= 1.5 && {
                            willChange: "transform"
                        }) : {
                            position: o,
                            left: t,
                            top: r
                        }
                    }, [o, d, K.floating, v.x, v.y]);
                return ec.useMemo(function() {
                    return a0(aJ({}, v), {
                        update: F,
                        refs: W,
                        elements: K,
                        floatingStyles: z
                    })
                }, [v, F, W, K, z])
            }
            var a9 = function(e, t) {
                    var r;
                    return a0(aJ({}, (void 0 === (r = e) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(e) {
                            return oJ(function() {
                                var t, n, o, a, i, l, c;
                                return o8(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            var s;
                                            return o = e.x, a = e.y, i = e.placement, l = e.middlewareData, [4, (s = r, oJ(function() {
                                                var t, r, n, o, a, i, l, c, u, f, p, d, y, m;
                                                return o8(this, function(b) {
                                                    switch (b.label) {
                                                        case 0:
                                                            return t = e.placement, r = e.platform, n = e.elements, [4, null == r.isRTL ? void 0 : r.isRTL(n.floating)];
                                                        case 1:
                                                            return o = b.sent(), a = o_(t), i = oU(t), l = "y" === oK(t), c = ae.has(a) ? -1 : 1, u = o && l ? -1 : 1, d = (p = "number" == typeof(f = oM(s, e)) ? {
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
                                                data: o2(o1({}, c), {
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
                ie = function(e, t) {
                    var r;
                    return a0(aJ({}, (void 0 === (r = e) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(e) {
                            return oJ(function() {
                                var t, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, w, O, j, x, S, P, E, A, C, I;
                                return o8(this, function(R) {
                                    switch (R.label) {
                                        case 0:
                                            return t = e.x, n = e.y, o = e.placement, l = void 0 === (i = (a = oM(r, e)).mainAxis) || i, u = void 0 !== (c = a.crossAxis) && c, f = void 0 === (s = a.limiter) ? {
                                                fn: function(e) {
                                                    return {
                                                        x: e.x,
                                                        y: e.y
                                                    }
                                                }
                                            } : s, p = o3(a, ["mainAxis", "crossAxis", "limiter"]), d = {
                                                x: t,
                                                y: n
                                            }, [4, o4(e, p)];
                                        case 1:
                                            return y = R.sent(), v = d[b = oF(m = oK(o_(o)))], h = d[m], l && (g = "y" === b ? "top" : "left", w = "y" === b ? "bottom" : "right", O = v + y[g], j = v - y[w], v = oR(O, oI(v, j))), u && (x = "y" === m ? "top" : "left", S = "y" === m ? "bottom" : "right", P = h + y[x], E = h - y[S], h = oR(P, oI(h, E))), C = f.fn(o2(o1({}, e), (o0(A = {}, b, v), o0(A, m, h), A))), [2, o2(o1({}, C), {
                                                data: {
                                                    x: C.x - t,
                                                    y: C.y - n,
                                                    enabled: (o0(I = {}, b, l), o0(I, m, u), I)
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
                it = function(e, t) {
                    var r;
                    return a0(aJ({}, (void 0 === (r = e) && (r = {}), {
                        options: r,
                        fn: function(e) {
                            var t, n = e.x,
                                o = e.y,
                                a = e.placement,
                                i = e.rects,
                                l = e.middlewareData,
                                c = oM(r, e),
                                u = c.offset,
                                s = c.mainAxis,
                                f = c.crossAxis,
                                p = {
                                    x: n,
                                    y: o
                                },
                                d = oK(a),
                                y = oF(d),
                                m = p[y],
                                b = p[d],
                                v = oM(void 0 === u ? 0 : u, e),
                                h = "number" == typeof v ? {
                                    mainAxis: v,
                                    crossAxis: 0
                                } : o1({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, v);
                            if (void 0 === s || s) {
                                var g = "y" === y ? "height" : "width",
                                    w = i.reference[y] - i.floating[g] + h.mainAxis,
                                    O = i.reference[y] + i.reference[g] - h.mainAxis;
                                m < w ? m = w : m > O && (m = O)
                            }
                            if (void 0 === f || f) {
                                var j, x, S = "y" === y ? "width" : "height",
                                    P = ae.has(o_(a)),
                                    E = i.reference[d] - i.floating[S] + (P && (null == (j = l.offset) ? void 0 : j[d]) || 0) + (P ? 0 : h.crossAxis),
                                    A = i.reference[d] + i.reference[S] + (P ? 0 : (null == (x = l.offset) ? void 0 : x[d]) || 0) - (P ? h.crossAxis : 0);
                                b < E ? b = E : b > A && (b = A)
                            }
                            return o0(t = {}, y, m), o0(t, d, b), t
                        }
                    })), {
                        options: [e, t]
                    })
                },
                ir = function(e, t) {
                    var r;
                    return a0(aJ({}, (void 0 === (r = e) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(e) {
                            return oJ(function() {
                                var t, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, w, O, j, x, S, P, E, A, C, I, R, N, k, D, T, L, M, _, U, F, B, W;
                                return o8(this, function(K) {
                                    var z, H, V, X, G, q, Y, $, Z, Q, J, ee, et, er, en;
                                    switch (K.label) {
                                        case 0:
                                            if (o = e.placement, a = e.middlewareData, i = e.rects, l = e.initialPlacement, c = e.platform, u = e.elements, p = void 0 === (f = (s = oM(r, e)).mainAxis) || f, y = void 0 === (d = s.crossAxis) || d, m = s.fallbackPlacements, v = void 0 === (b = s.fallbackStrategy) ? "bestFit" : b, g = void 0 === (h = s.fallbackAxisSideDirection) ? "none" : h, O = void 0 === (w = s.flipAlignment) || w, j = o3(s, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (t = a.arrow) && t.alignmentOffset) return [2, {}];
                                            return x = o_(o), S = oK(l), P = o_(l) === l, [4, null == c.isRTL ? void 0 : c.isRTL(u.floating)];
                                        case 1:
                                            return E = K.sent(), A = m || (P || !O ? [oq(l)] : (H = oq(z = l), [oz(z), H, oz(H)])), C = "none" !== g, !m && C && (I = A).push.apply(I, o6((V = l, X = O, G = g, q = E, Y = oU(V), $ = function(e, t, r) {
                                                switch (e) {
                                                    case "top":
                                                    case "bottom":
                                                        if (r) return t ? oV : oH;
                                                        return t ? oH : oV;
                                                    case "left":
                                                    case "right":
                                                        return t ? oX : oG;
                                                    default:
                                                        return []
                                                }
                                            }(o_(V), "start" === G, q), Y && ($ = $.map(function(e) {
                                                return e + "-" + Y
                                            }), X && ($ = $.concat($.map(oz)))), $))), R = [l].concat(o6(A)), [4, o4(e, j)];
                                        case 2:
                                            if (N = K.sent(), k = [], D = (null == (n = a.flip) ? void 0 : n.overflows) || [], p && k.push(N[x]), y && (Z = o, Q = i, void 0 === (J = E) && (J = !1), ee = oU(Z), er = oB(et = oF(oK(Z))), en = "x" === et ? ee === (J ? "end" : "start") ? "right" : "left" : "start" === ee ? "bottom" : "top", Q.reference[er] > Q.floating[er] && (en = oq(en)), T = [en, oq(en)], k.push(N[T[0]], N[T[1]])), D = o6(D).concat([{
                                                    placement: o,
                                                    overflows: k
                                                }]), !k.every(function(e) {
                                                    return e <= 0
                                                })) {
                                                if ((U = R[_ = ((null == (L = a.flip) ? void 0 : L.index) || 0) + 1]) && ("alignment" !== y || S === oK(U) || D.every(function(e) {
                                                        return oK(e.placement) !== S || e.overflows[0] > 0
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
                                                        (W = null == (B = D.filter(function(e) {
                                                            if (C) {
                                                                var t = oK(e.placement);
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
                                                        })[0]) ? void 0 : B[0]) && (F = W);
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
                io = function(e, t) {
                    var r;
                    return a0(aJ({}, (void 0 === (r = e) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(e) {
                            return oJ(function() {
                                var t, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, w, O, j, x, S, P, E, A, C, I, R, N;
                                return o8(this, function(k) {
                                    switch (k.label) {
                                        case 0:
                                            return o = e.placement, a = e.rects, i = e.platform, l = e.elements, s = void 0 === (u = (c = oM(r, e)).apply) ? function() {} : u, [4, o4(e, o3(c, ["apply"]))];
                                        case 1:
                                            if (f = k.sent(), p = o_(o), d = oU(o), y = "y" === oK(o), b = (m = a.floating).width, v = m.height, "top" !== p && "bottom" !== p) return [3, 3];
                                            return h = p, [4, null == i.isRTL ? void 0 : i.isRTL(l.floating)];
                                        case 2:
                                            return g = d === (k.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            g = p, h = "end" === d ? "top" : "bottom", k.label = 4;
                                        case 4:
                                            return w = v - f.top - f.bottom, O = b - f.left - f.right, j = oI(v - f[h], w), x = oI(b - f[g], O), S = !e.middlewareData.shift, P = j, E = x, null != (t = e.middlewareData.shift) && t.enabled.x && (E = O), null != (n = e.middlewareData.shift) && n.enabled.y && (P = w), S && !d && (A = oR(f.left, 0), C = oR(f.right, 0), I = oR(f.top, 0), R = oR(f.bottom, 0), y ? E = b - 2 * (0 !== A || 0 !== C ? A + C : oR(f.left, f.right)) : P = v - 2 * (0 !== I || 0 !== R ? I + R : oR(f.top, f.bottom))), [4, s(o2(o1({}, e), {
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
                ia = function(e, t) {
                    var r;
                    return a0(aJ({}, (void 0 === (r = e) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(e) {
                            return oJ(function() {
                                var t, n, o, a, i, l, c;
                                return o8(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            switch (t = e.rects, a = void 0 === (o = (n = oM(r, e)).strategy) ? "referenceHidden" : o, i = o3(n, ["strategy"]), a) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, o4(e, o2(o1({}, i), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: l = o7(u.sent(), t.reference),
                                                    referenceHidden: o9(l)
                                                }
                                            }];
                                        case 3:
                                            return [4, o4(e, o2(o1({}, i), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: c = o7(u.sent(), t.floating),
                                                    escaped: o9(c)
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
                ii = function(e, t) {
                    return a0(aJ({}, {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            var r = "function" == typeof e ? e(t) : e,
                                n = r.element,
                                o = r.padding;
                            return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? a$({
                                element: n.current,
                                padding: o
                            }).fn(t) : {} : n ? a$({
                                element: n,
                                padding: o
                            }).fn(t) : {}
                        }
                    }), {
                        options: [e, t]
                    })
                };

            function il(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ic(e) {
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

            function iu(e, t) {
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

            function is(e, t) {
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

            function ip(e) {
                return function(e) {
                    if (Array.isArray(e)) return il(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return il(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return il(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var id = ec.forwardRef(function(e, t) {
                var r = e.children,
                    n = is(e, ["children"]),
                    o = ec.Children.toArray(r),
                    a = o.find(ib);
                if (a) {
                    var i = a.props.children,
                        l = o.map(function(e) {
                            return e !== a ? e : ec.Children.count(i) > 1 ? ec.Children.only(null) : ec.isValidElement(i) ? i.props.children : null
                        });
                    return (0, X.jsx)(iy, iu(ic({}, n), {
                        ref: t,
                        children: ec.isValidElement(i) ? ec.cloneElement(i, void 0, l) : null
                    }))
                }
                return (0, X.jsx)(iy, iu(ic({}, n), {
                    ref: t,
                    children: r
                }))
            });
            id.displayName = "Slot";
            var iy = ec.forwardRef(function(e, t) {
                var r = e.children,
                    n = is(e, ["children"]);
                if (ec.isValidElement(r)) {
                    var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref;
                    return ec.cloneElement(r, iu(ic({}, function(e, t) {
                        var r = ic({}, t);
                        for (var n in t) ! function(n) {
                            var o = e[n],
                                a = t[n];
                            /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                a.apply(void 0, ip(t)), o.apply(void 0, ip(t))
                            } : o && (r[n] = o) : "style" === n ? r[n] = ic({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                        }(n);
                        return ic({}, e, r)
                    }(n, r.props)), {
                        ref: t ? ob(t, u) : u
                    }))
                }
                return ec.Children.count(r) > 1 ? ec.Children.only(null) : null
            });
            iy.displayName = "SlotClone";
            var im = function(e) {
                var t = e.children;
                return (0, X.jsx)(X.Fragment, {
                    children: t
                })
            };

            function ib(e) {
                return ec.isValidElement(e) && e.type === im
            }

            function iv(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ih(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        iv(e, t, r[t])
                    })
                }
                return e
            }

            function ig(e, t) {
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
            var iw = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var r = ec.forwardRef(function(e, r) {
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
                            a = n ? id : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, X.jsx)(a, ig(ih({}, o), {
                            ref: r
                        }))
                    });
                    return r.displayName = "Primitive.".concat(t), ig(ih({}, e), iv({}, t, r))
                }, {}),
                iO = ec.forwardRef(function(e, t) {
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
                    return (0, X.jsx)(iw.svg, (r = function(e) {
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
                        children: e.asChild ? o : (0, X.jsx)("polygon", {
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

            function ij(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ix(e) {
                var t = ec.useRef(e);
                return ec.useEffect(function() {
                    t.current = e
                }), ec.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return ij(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return ij(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ij(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function iS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iE(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function iA(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        iE(e, t, r[t])
                    })
                }
                return e
            }

            function iC(e, t) {
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

            function iI(e, t) {
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

            function iR(e, t) {
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
                }(e, t) || iN(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iN(e, t) {
                if (e) {
                    if ("string" == typeof e) return iP(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iP(e, t)
                }
            }
            iO.displayName = "Arrow";
            var ik = "Popper",
                iD = iR(oj(ik), 2),
                iT = iD[0],
                iL = iD[1],
                iM = iR(iT(ik), 2),
                i_ = iM[0],
                iU = iM[1],
                iF = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = iR(ec.useState(null), 2),
                        o = n[0],
                        a = n[1];
                    return (0, X.jsx)(i_, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: a,
                        children: r
                    })
                };
            iF.displayName = ik;
            var iB = "PopperAnchor",
                iW = ec.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        o = iI(e, ["__scopePopper", "virtualRef"]),
                        a = iU(iB, r),
                        i = ec.useRef(null),
                        l = ov(t, i);
                    return ec.useEffect(function() {
                        a.onAnchorChange((null == n ? void 0 : n.current) || i.current)
                    }), n ? null : (0, X.jsx)(iw.div, iC(iA({}, o), {
                        ref: l
                    }))
                });
            iW.displayName = iB;
            var iK = "PopperContent",
                iz = iR(iT(iK), 2),
                iH = iz[0],
                iV = iz[1],
                iX = ec.forwardRef(function(e, t) {
                    var r, n, o, a, i, l, c, u, s, f, p, d, y = e.__scopePopper,
                        m = e.side,
                        b = e.sideOffset,
                        v = e.align,
                        h = void 0 === v ? "center" : v,
                        g = e.alignOffset,
                        w = e.arrowPadding,
                        O = e.avoidCollisions,
                        j = void 0 === O || O,
                        x = e.collisionBoundary,
                        S = void 0 === x ? [] : x,
                        P = e.collisionPadding,
                        E = void 0 === P ? 0 : P,
                        A = e.sticky,
                        C = e.hideWhenDetached,
                        I = e.updatePositionStrategy,
                        R = void 0 === I ? "optimized" : I,
                        N = e.onPlaced,
                        k = iI(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        D = iU(iK, y),
                        T = iR(ec.useState(null), 2),
                        L = T[0],
                        M = T[1],
                        _ = ov(t, function(e) {
                            return M(e)
                        }),
                        U = iR(ec.useState(null), 2),
                        F = U[0],
                        B = U[1],
                        W = (o = (n = function(e) {
                            if (Array.isArray(e)) return e
                        }(r = ec.useState(void 0)) || function(e) {
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
                                if ("string" == typeof e) return iS(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iS(e, 2)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], a = n[1], oS(function() {
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
                        K = null != (i = null == W ? void 0 : W.width) ? i : 0,
                        z = null != (l = null == W ? void 0 : W.height) ? l : 0,
                        H = "number" == typeof E ? E : iA({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, E),
                        V = Array.isArray(S) ? S : [S],
                        G = V.length > 0,
                        q = {
                            padding: H,
                            boundary: V.filter(i$),
                            altBoundary: G
                        },
                        Y = a7({
                            strategy: "fixed",
                            placement: (void 0 === m ? "bottom" : m) + ("center" !== h ? "-" + h : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return aY.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return iP(e)
                                })(t) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || iN(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === R
                                }]))
                            },
                            elements: {
                                reference: D.anchor
                            },
                            middleware: [a9({
                                mainAxis: (void 0 === b ? 0 : b) + z,
                                alignmentAxis: void 0 === g ? 0 : g
                            }), j && ie(iA({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === A ? "partial" : A) ? it() : void 0
                            }, q)), j && ir(iA({}, q)), io(iC(iA({}, q), {
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
                            })), F && ii({
                                element: F,
                                padding: void 0 === w ? 0 : w
                            }), iZ({
                                arrowWidth: K,
                                arrowHeight: z
                            }), void 0 !== C && C && ia(iA({
                                strategy: "referenceHidden"
                            }, q))]
                        }),
                        $ = Y.refs,
                        Z = Y.floatingStyles,
                        Q = Y.placement,
                        J = Y.isPositioned,
                        ee = Y.middlewareData,
                        et = iR(iQ(Q), 2),
                        er = et[0],
                        en = et[1],
                        eo = ix(N);
                    oS(function() {
                        J && (null == eo || eo())
                    }, [J, eo]);
                    var ea = null == (c = ee.arrow) ? void 0 : c.x,
                        ei = null == (u = ee.arrow) ? void 0 : u.y,
                        el = (null == (s = ee.arrow) ? void 0 : s.centerOffset) !== 0,
                        eu = iR(ec.useState(), 2),
                        es = eu[0],
                        ef = eu[1];
                    return oS(function() {
                        L && ef(window.getComputedStyle(L).zIndex)
                    }, [L]), (0, X.jsx)("div", {
                        ref: $.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: iA(iC(iA({}, Z), iE({
                            transform: J ? Z.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: es
                        }, "--radix-popper-transform-origin", [null == (f = ee.transformOrigin) ? void 0 : f.x, null == (p = ee.transformOrigin) ? void 0 : p.y].join(" "))), (null == (d = ee.hide) ? void 0 : d.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, X.jsx)(iH, {
                            scope: y,
                            placedSide: er,
                            onArrowChange: B,
                            arrowX: ea,
                            arrowY: ei,
                            shouldHideArrow: el,
                            children: (0, X.jsx)(iw.div, iC(iA({
                                "data-side": er,
                                "data-align": en
                            }, k), {
                                ref: _,
                                style: iC(iA({}, k.style), {
                                    animation: J ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            iX.displayName = iK;
            var iG = "PopperArrow",
                iq = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                iY = ec.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        o = iI(e, ["__scopePopper"]),
                        a = iV(iG, n),
                        i = iq[a.placedSide];
                    return (0, X.jsx)("span", {
                        ref: a.onArrowChange,
                        style: (iE(r = {
                            position: "absolute",
                            left: a.arrowX,
                            top: a.arrowY
                        }, i, 0), iE(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [a.placedSide]), iE(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [a.placedSide]), iE(r, "visibility", a.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, X.jsx)(iO, iC(iA({}, o), {
                            ref: t,
                            style: iC(iA({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function i$(e) {
                return null !== e
            }
            iY.displayName = iG;
            var iZ = function(e) {
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
                            d = iR(iQ(l), 2),
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

            function iQ(e) {
                var t = iR(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function iJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var i0 = ec.forwardRef(function(e, t) {
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
                    }(r = ec.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return iJ(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iJ(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = u[0],
                    f = u[1];
                oS(function() {
                    return f(!0)
                }, []);
                var p = l || s && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
                return p ? tE().createPortal((0, X.jsx)(iw.div, (n = function(e) {
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

            function i1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i2(e, t) {
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
                        if ("string" == typeof e) return i1(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i1(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            i0.displayName = "Portal";
            var i3 = function(e) {
                var t, r, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h = e.present,
                    g = e.children,
                    w = (t = h, a = (o = i2(ec.useState(), 2))[0], i = o[1], l = ec.useRef({}), c = ec.useRef(t), u = ec.useRef("none"), f = (s = i2((r = t ? "mounted" : "unmounted", n = {
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
                    }, ec.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], ec.useEffect(function() {
                        var e = i6(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), oS(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = i6(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), c.current = t
                        }
                    }, [t, p]), oS(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = i6(l.current).includes(e.animationName);
                                    if (e.target === a && n && (p("ANIMATION_END"), !c.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (u.current = i6(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [a, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: ec.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), i(e)
                        }, [])
                    }),
                    O = "function" == typeof g ? g({
                        present: w.isPresent
                    }) : ec.Children.only(g),
                    j = ov(w.ref, (v = (b = null == (y = Object.getOwnPropertyDescriptor((d = O).props, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? d.ref : (v = (b = null == (m = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof g || w.isPresent ? ec.cloneElement(O, {
                    ref: j
                }) : null
            };

            function i6(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function i8(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i5(e, t) {
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
                        if ("string" == typeof e) return i8(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i8(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function i4(e) {
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
            i3.displayName = "Presence";
            var i7 = ec.forwardRef(function(e, t) {
                var r, n;
                return (0, X.jsx)(iw.span, (r = i4({}, e), n = n = {
                    ref: t,
                    style: i4({
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

            function i9(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function le(e) {
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

            function lt(e, t) {
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

            function lr(e, t) {
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

            function ln(e, t) {
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
                }(e, t) || la(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lo(e) {
                return function(e) {
                    if (Array.isArray(e)) return i9(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || la(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function la(e, t) {
                if (e) {
                    if ("string" == typeof e) return i9(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i9(e, t)
                }
            }
            i7.displayName = "VisuallyHidden";
            var li = ln(oj("Tooltip", [iL]), 2),
                ll = li[0];
            li[1];
            var lc = iL(),
                lu = "TooltipProvider",
                ls = "tooltip.open",
                lf = ln(ll(lu), 2),
                lp = lf[0],
                ld = lf[1],
                ly = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.delayDuration,
                        n = e.skipDelayDuration,
                        o = void 0 === n ? 300 : n,
                        a = e.disableHoverableContent,
                        i = e.children,
                        l = ln(ec.useState(!0), 2),
                        c = l[0],
                        u = l[1],
                        s = ec.useRef(!1),
                        f = ec.useRef(0);
                    return ec.useEffect(function() {
                        var e = f.current;
                        return function() {
                            return window.clearTimeout(e)
                        }
                    }, []), (0, X.jsx)(lp, {
                        scope: t,
                        isOpenDelayed: c,
                        delayDuration: void 0 === r ? 700 : r,
                        onOpen: ec.useCallback(function() {
                            window.clearTimeout(f.current), u(!1)
                        }, []),
                        onClose: ec.useCallback(function() {
                            window.clearTimeout(f.current), f.current = window.setTimeout(function() {
                                return u(!0)
                            }, o)
                        }, [o]),
                        isPointerInTransitRef: s,
                        onPointerInTransitChange: ec.useCallback(function(e) {
                            s.current = e
                        }, []),
                        disableHoverableContent: void 0 !== a && a,
                        children: i
                    })
                };
            ly.displayName = lu;
            var lm = "Tooltip",
                lb = ln(ll(lm), 2),
                lv = lb[0],
                lh = lb[1],
                lg = function(e) {
                    var t, r, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, w, O, j = e.__scopeTooltip,
                        x = e.children,
                        S = e.open,
                        P = e.defaultOpen,
                        E = e.onOpenChange,
                        A = e.disableHoverableContent,
                        C = e.delayDuration,
                        I = ld(lm, e.__scopeTooltip),
                        R = lc(j),
                        N = ln(ec.useState(null), 2),
                        k = N[0],
                        D = N[1],
                        T = (s = (u = function(e) {
                            if (Array.isArray(e)) return e
                        }(c = ec.useState(oE())) || function(e) {
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
                                if ("string" == typeof e) return oP(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oP(e, 2)
                            }
                        }(c) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], f = u[1], oS(function() {
                            f(function(e) {
                                return null != e ? e : String(oA++)
                            })
                        }, [void 0]), s ? "radix-".concat(s) : ""),
                        L = ec.useRef(0),
                        M = null != A ? A : I.disableHoverableContent,
                        _ = null != C ? C : I.delayDuration,
                        U = ec.useRef(!1),
                        F = ln((d = (p = {
                            prop: S,
                            defaultProp: void 0 !== P && P,
                            onChange: function(e) {
                                e ? (I.onOpen(), document.dispatchEvent(new CustomEvent(ls))) : I.onClose(), null == E || E(e)
                            }
                        }).prop, v = (b = i5((r = (t = {
                            defaultProp: p.defaultProp,
                            onChange: m = void 0 === (y = p.onChange) ? function() {} : y
                        }).defaultProp, n = t.onChange, a = i5(o = ec.useState(r), 1)[0], i = ec.useRef(a), l = ix(n), ec.useEffect(function() {
                            i.current !== a && (l(a), i.current = a)
                        }, [a, i, l]), o), 2))[0], h = b[1], w = (g = void 0 !== d) ? d : v, O = ix(m), [w, ec.useCallback(function(e) {
                            if (g) {
                                var t = "function" == typeof e ? e(d) : e;
                                t !== d && O(t)
                            } else h(e)
                        }, [g, d, h, O])]), 2),
                        B = F[0],
                        W = void 0 !== B && B,
                        K = F[1],
                        z = ec.useMemo(function() {
                            return W ? U.current ? "delayed-open" : "instant-open" : "closed"
                        }, [W]),
                        H = ec.useCallback(function() {
                            window.clearTimeout(L.current), L.current = 0, U.current = !1, K(!0)
                        }, [K]),
                        V = ec.useCallback(function() {
                            window.clearTimeout(L.current), L.current = 0, K(!1)
                        }, [K]),
                        G = ec.useCallback(function() {
                            window.clearTimeout(L.current), L.current = window.setTimeout(function() {
                                U.current = !0, K(!0), L.current = 0
                            }, _)
                        }, [_, K]);
                    return ec.useEffect(function() {
                        return function() {
                            L.current && (window.clearTimeout(L.current), L.current = 0)
                        }
                    }, []), (0, X.jsx)(iF, lt(le({}, R), {
                        children: (0, X.jsx)(lv, {
                            scope: j,
                            contentId: T,
                            open: W,
                            stateAttribute: z,
                            trigger: k,
                            onTriggerChange: D,
                            onTriggerEnter: ec.useCallback(function() {
                                I.isOpenDelayed ? G() : H()
                            }, [I.isOpenDelayed, G, H]),
                            onTriggerLeave: ec.useCallback(function() {
                                M ? V() : (window.clearTimeout(L.current), L.current = 0)
                            }, [V, M]),
                            onOpen: H,
                            onClose: V,
                            disableHoverableContent: M,
                            children: x
                        })
                    }))
                };
            lg.displayName = lm;
            var lw = "TooltipTrigger",
                lO = ec.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = lr(e, ["__scopeTooltip"]),
                        o = lh(lw, r),
                        a = ld(lw, r),
                        i = lc(r),
                        l = ov(t, ec.useRef(null), o.onTriggerChange),
                        c = ec.useRef(!1),
                        u = ec.useRef(!1),
                        s = ec.useCallback(function() {
                            return c.current = !1
                        }, []);
                    return ec.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", s)
                        }
                    }, [s]), (0, X.jsx)(iW, lt(le({
                        asChild: !0
                    }, i), {
                        children: (0, X.jsx)(iw.button, lt(le({
                            "aria-describedby": o.open ? o.contentId : void 0,
                            "data-state": o.stateAttribute
                        }, n), {
                            ref: l,
                            onPointerMove: od(e.onPointerMove, function(e) {
                                "touch" !== e.pointerType && (u.current || a.isPointerInTransitRef.current || (o.onTriggerEnter(), u.current = !0))
                            }),
                            onPointerLeave: od(e.onPointerLeave, function() {
                                o.onTriggerLeave(), u.current = !1
                            }),
                            onPointerDown: od(e.onPointerDown, function() {
                                c.current = !0, document.addEventListener("pointerup", s, {
                                    once: !0
                                })
                            }),
                            onFocus: od(e.onFocus, function() {
                                c.current || o.onOpen()
                            }),
                            onBlur: od(e.onBlur, o.onClose),
                            onClick: od(e.onClick, o.onClose)
                        }))
                    }))
                });
            lO.displayName = lw;
            var lj = "TooltipPortal",
                lx = ln(ll(lj, {
                    forceMount: void 0
                }), 2),
                lS = lx[0],
                lP = lx[1],
                lE = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        a = lh(lj, t);
                    return (0, X.jsx)(lS, {
                        scope: t,
                        forceMount: r,
                        children: (0, X.jsx)(i3, {
                            present: r || a.open,
                            children: (0, X.jsx)(i0, {
                                asChild: !0,
                                container: o,
                                children: n
                            })
                        })
                    })
                };
            lE.displayName = lj;
            var lA = "TooltipContent",
                lC = ec.forwardRef(function(e, t) {
                    var r = lP(lA, e.__scopeTooltip),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = e.side,
                        i = void 0 === a ? "top" : a,
                        l = lr(e, ["forceMount", "side"]),
                        c = lh(lA, e.__scopeTooltip);
                    return (0, X.jsx)(i3, {
                        present: o || c.open,
                        children: c.disableHoverableContent ? (0, X.jsx)(lD, lt(le({
                            side: i
                        }, l), {
                            ref: t
                        })) : (0, X.jsx)(lI, lt(le({
                            side: i
                        }, l), {
                            ref: t
                        }))
                    })
                }),
                lI = ec.forwardRef(function(e, t) {
                    var r = lh(lA, e.__scopeTooltip),
                        n = ld(lA, e.__scopeTooltip),
                        o = ec.useRef(null),
                        a = ov(t, o),
                        i = ln(ec.useState(null), 2),
                        l = i[0],
                        c = i[1],
                        u = r.trigger,
                        s = r.onClose,
                        f = o.current,
                        p = n.onPointerInTransitChange,
                        d = ec.useCallback(function() {
                            c(null), p(!1)
                        }, [p]),
                        y = ec.useCallback(function(e, t) {
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
                            c(((l = lo(d).concat(lo(y)).slice()).sort(function(e, t) {
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
                    return ec.useEffect(function() {
                        return function() {
                            return d()
                        }
                    }, [d]), ec.useEffect(function() {
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
                    }, [u, f, y, d]), ec.useEffect(function() {
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
                    }, [u, f, l, s, d]), (0, X.jsx)(lD, lt(le({}, e), {
                        ref: a
                    }))
                }),
                lR = ln(ll(lm, {
                    isInside: !1
                }), 2),
                lN = lR[0],
                lk = lR[1],
                lD = ec.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = e.children,
                        o = e["aria-label"],
                        a = e.onEscapeKeyDown,
                        i = e.onPointerDownOutside,
                        l = lr(e, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        c = lh(lA, r),
                        u = lc(r),
                        s = c.onClose;
                    return ec.useEffect(function() {
                        return document.addEventListener(ls, s),
                            function() {
                                return document.removeEventListener(ls, s)
                            }
                    }, [s]), ec.useEffect(function() {
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
                    }, [c.trigger, s]), (0, X.jsx)(tx.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: a,
                        onPointerDownOutside: i,
                        onFocusOutside: function(e) {
                            return e.preventDefault()
                        },
                        onDismiss: s,
                        children: (0, X.jsxs)(iX, lt(le({
                            "data-state": c.stateAttribute
                        }, u, l), {
                            ref: t,
                            style: le({}, l.style, {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, X.jsx)(im, {
                                children: n
                            }), (0, X.jsx)(lN, {
                                scope: r,
                                isInside: !0,
                                children: (0, X.jsx)(i7, {
                                    id: c.contentId,
                                    role: "tooltip",
                                    children: o || n
                                })
                            })]
                        }))
                    })
                });
            lC.displayName = lA;
            var lT = "TooltipArrow",
                lL = ec.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = lr(e, ["__scopeTooltip"]),
                        o = lc(r);
                    return lk(lT, r).isInside ? null : (0, X.jsx)(iY, lt(le({}, o, n), {
                        ref: t
                    }))
                });

            function lM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function l_(e) {
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
                            if ("string" == typeof e) return lM(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lM(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    d = p[0],
                    y = p[1],
                    m = null != i ? i : "string" == typeof o && null == a ? o : void 0;
                return ec.createElement(ly, {
                    delayDuration: void 0 === l ? 500 : l
                }, ec.createElement(lg, {
                    open: u,
                    onOpenChange: s
                }, c, ec.createElement(lE, null, ec.createElement(lC, {
                    side: d,
                    align: y,
                    "aria-label": m,
                    className: eJ("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", f),
                    sideOffset: 5
                }, (void 0 === n || n) && ec.createElement(lL, {
                    asChild: !0
                }, ec.createElement(op, {
                    className: "content-[var(--inverse-surface-0)]"
                })), ec.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, ec.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, o), a && ec.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, a))))))
            }

            function lU(e) {
                var t = e.children,
                    r = e.asChild,
                    n = e.className;
                return ec.createElement(lO, {
                    asChild: r,
                    className: n
                }, t)
            }
            lL.displayName = lT;
            var lF = function(e) {
                    var t = e.title,
                        r = e.description,
                        n = e.position;
                    return eu().createElement(l_, {
                        position: void 0 === n ? "top-center" : n,
                        title: t,
                        description: r
                    }, eu().createElement(lU, {
                        asChild: !0
                    }, eu().createElement("span", {
                        role: "button",
                        tabIndex: 0,
                        "aria-label": t,
                        className: "flex items-center content-muted",
                        "data-testid": "label-tooltip-trigger"
                    }, eu().createElement(e4, {
                        name: "icon-regular-circle-i",
                        size: "Small"
                    }))))
                },
                lB = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                lW = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                };

            function lK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lz(e, t) {
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
                            if ("string" == typeof e) return lK(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lK(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0];
                return Math.min(r[1], Math.max(n, e))
            }

            function lH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lV(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function lX(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        lV(e, t, r[t])
                    })
                }
                return e
            }

            function lG(e, t) {
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
                        if ("string" == typeof e) return lH(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lH(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var lq = ec.createContext(void 0);

            function lY(e) {
                var t = ec.useContext(lq);
                return e || t || "ltr"
            }
            var l$ = ec.forwardRef(function(e, t) {
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
                return (0, X.jsx)(tU.svg, (r = function(e) {
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
                    children: e.asChild ? o : (0, X.jsx)("polygon", {
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

            function lZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lJ(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function l0(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        lJ(e, t, r[t])
                    })
                }
                return e
            }

            function l1(e, t) {
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

            function l2(e, t) {
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

            function l3(e, t) {
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
                }(e, t) || l6(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function l6(e, t) {
                if (e) {
                    if ("string" == typeof e) return lQ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lQ(e, t)
                }
            }
            l$.displayName = "Arrow";
            var l8 = "Popper",
                l5 = l3(tf(l8), 2),
                l4 = l5[0],
                l7 = l5[1],
                l9 = l3(l4(l8), 2),
                ce = l9[0],
                ct = l9[1],
                cr = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = l3(ec.useState(null), 2),
                        o = n[0],
                        a = n[1];
                    return (0, X.jsx)(ce, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: a,
                        children: r
                    })
                };
            cr.displayName = l8;
            var cn = "PopperAnchor",
                co = ec.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        o = l2(e, ["__scopePopper", "virtualRef"]),
                        a = ct(cn, r),
                        i = ec.useRef(null),
                        l = ta(t, i);
                    return ec.useEffect(function() {
                        a.onAnchorChange((null == n ? void 0 : n.current) || i.current)
                    }), n ? null : (0, X.jsx)(tU.div, l1(l0({}, o), {
                        ref: l
                    }))
                });
            co.displayName = cn;
            var ca = "PopperContent",
                ci = l3(l4(ca), 2),
                cl = ci[0],
                cc = ci[1],
                cu = ec.forwardRef(function(e, t) {
                    var r, n, o, a, i, l, c, u, s, f, p, d, y = e.__scopePopper,
                        m = e.side,
                        b = e.sideOffset,
                        v = e.align,
                        h = void 0 === v ? "center" : v,
                        g = e.alignOffset,
                        w = e.arrowPadding,
                        O = e.avoidCollisions,
                        j = void 0 === O || O,
                        x = e.collisionBoundary,
                        S = void 0 === x ? [] : x,
                        P = e.collisionPadding,
                        E = void 0 === P ? 0 : P,
                        A = e.sticky,
                        C = e.hideWhenDetached,
                        I = e.updatePositionStrategy,
                        R = void 0 === I ? "optimized" : I,
                        N = e.onPlaced,
                        k = l2(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        D = ct(ca, y),
                        T = l3(ec.useState(null), 2),
                        L = T[0],
                        M = T[1],
                        _ = ta(t, function(e) {
                            return M(e)
                        }),
                        U = l3(ec.useState(null), 2),
                        F = U[0],
                        B = U[1],
                        W = (o = (n = function(e) {
                            if (Array.isArray(e)) return e
                        }(r = ec.useState(void 0)) || function(e) {
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
                                if ("string" == typeof e) return lZ(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lZ(e, 2)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], a = n[1], td(function() {
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
                        K = null != (i = null == W ? void 0 : W.width) ? i : 0,
                        z = null != (l = null == W ? void 0 : W.height) ? l : 0,
                        H = "number" == typeof E ? E : l0({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, E),
                        V = Array.isArray(S) ? S : [S],
                        G = V.length > 0,
                        q = {
                            padding: H,
                            boundary: V.filter(cd),
                            altBoundary: G
                        },
                        Y = a7({
                            strategy: "fixed",
                            placement: (void 0 === m ? "bottom" : m) + ("center" !== h ? "-" + h : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return aY.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return lQ(e)
                                })(t) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || l6(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === R
                                }]))
                            },
                            elements: {
                                reference: D.anchor
                            },
                            middleware: [a9({
                                mainAxis: (void 0 === b ? 0 : b) + z,
                                alignmentAxis: void 0 === g ? 0 : g
                            }), j && ie(l0({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === A ? "partial" : A) ? it() : void 0
                            }, q)), j && ir(l0({}, q)), io(l1(l0({}, q), {
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
                            })), F && ii({
                                element: F,
                                padding: void 0 === w ? 0 : w
                            }), cy({
                                arrowWidth: K,
                                arrowHeight: z
                            }), void 0 !== C && C && ia(l0({
                                strategy: "referenceHidden"
                            }, q))]
                        }),
                        $ = Y.refs,
                        Z = Y.floatingStyles,
                        Q = Y.placement,
                        J = Y.isPositioned,
                        ee = Y.middlewareData,
                        et = l3(cm(Q), 2),
                        er = et[0],
                        en = et[1],
                        eo = tg(N);
                    td(function() {
                        J && (null == eo || eo())
                    }, [J, eo]);
                    var ea = null == (c = ee.arrow) ? void 0 : c.x,
                        ei = null == (u = ee.arrow) ? void 0 : u.y,
                        el = (null == (s = ee.arrow) ? void 0 : s.centerOffset) !== 0,
                        eu = l3(ec.useState(), 2),
                        es = eu[0],
                        ef = eu[1];
                    return td(function() {
                        L && ef(window.getComputedStyle(L).zIndex)
                    }, [L]), (0, X.jsx)("div", {
                        ref: $.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: l0(l1(l0({}, Z), lJ({
                            transform: J ? Z.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: es
                        }, "--radix-popper-transform-origin", [null == (f = ee.transformOrigin) ? void 0 : f.x, null == (p = ee.transformOrigin) ? void 0 : p.y].join(" "))), (null == (d = ee.hide) ? void 0 : d.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, X.jsx)(cl, {
                            scope: y,
                            placedSide: er,
                            onArrowChange: B,
                            arrowX: ea,
                            arrowY: ei,
                            shouldHideArrow: el,
                            children: (0, X.jsx)(tU.div, l1(l0({
                                "data-side": er,
                                "data-align": en
                            }, k), {
                                ref: _,
                                style: l1(l0({}, k.style), {
                                    animation: J ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            cu.displayName = ca;
            var cs = "PopperArrow",
                cf = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                cp = ec.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        o = l2(e, ["__scopePopper"]),
                        a = cc(cs, n),
                        i = cf[a.placedSide];
                    return (0, X.jsx)("span", {
                        ref: a.onArrowChange,
                        style: (lJ(r = {
                            position: "absolute",
                            left: a.arrowX,
                            top: a.arrowY
                        }, i, 0), lJ(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [a.placedSide]), lJ(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [a.placedSide]), lJ(r, "visibility", a.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, X.jsx)(l$, l1(l0({}, o), {
                            ref: t,
                            style: l1(l0({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function cd(e) {
                return null !== e
            }
            cp.displayName = cs;
            var cy = function(e) {
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
                            d = l3(cm(l), 2),
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

            function cm(e) {
                var t = l3(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function cb(e) {
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
            var cv = ec.forwardRef(function(e, t) {
                var r, n;
                return (0, X.jsx)(tU.span, (r = cb({}, e), n = n = {
                    ref: t,
                    style: cb({
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

            function ch(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cg(e) {
                if (Array.isArray(e)) return e
            }

            function cw() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function cO(e) {
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

            function cj(e, t) {
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

            function cx(e, t) {
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

            function cS(e, t) {
                return cg(e) || function(e, t) {
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
                }(e, t) || cP(e, t) || cw()
            }

            function cP(e, t) {
                if (e) {
                    if ("string" == typeof e) return ch(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ch(e, t)
                }
            }
            cv.displayName = "VisuallyHidden";
            var cE = [" ", "Enter", "ArrowUp", "ArrowDown"],
                cA = [" ", "Enter"],
                cC = "Select",
                cI = cS((m = (y = lG(tf(d = cC + "CollectionProvider"), 2))[0], b = y[1], h = (v = lG(m(d, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], g = v[1], (w = function(e) {
                    var t = e.scope,
                        r = e.children,
                        n = eu().useRef(null),
                        o = eu().useRef(new Map).current;
                    return (0, X.jsx)(h, {
                        scope: t,
                        itemMap: o,
                        collectionRef: n,
                        children: r
                    })
                }).displayName = d, j = tk(O = cC + "CollectionSlot"), (x = eu().forwardRef(function(e, t) {
                    var r = e.scope,
                        n = e.children,
                        o = ta(t, g(O, r).collectionRef);
                    return (0, X.jsx)(j, {
                        ref: o,
                        children: n
                    })
                })).displayName = O, P = "data-radix-collection-item", E = tk(S = cC + "CollectionItemSlot"), (A = eu().forwardRef(function(e, t) {
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
                        l = eu().useRef(null),
                        c = ta(t, l),
                        u = g(S, o);
                    return eu().useEffect(function() {
                        return u.itemMap.set(l, lX({
                                ref: l
                            }, i)),
                            function() {
                                u.itemMap.delete(l)
                            }
                    }), (0, X.jsx)(E, (r = lX({}, lV({}, P, "")), n = n = {
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
                })).displayName = S, [{
                    Provider: w,
                    Slot: x,
                    ItemSlot: A
                }, function(e) {
                    var t = g(cC + "CollectionConsumer", e);
                    return eu().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var r = Array.from(e.querySelectorAll("[".concat(P, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return r.indexOf(e.ref.current) - r.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, b]), 3),
                cR = cI[0],
                cN = cI[1],
                ck = cS(tf(cC, [cI[2], l7]), 2),
                cD = ck[0];
            ck[1];
            var cT = l7(),
                cL = cS(cD(cC), 2),
                cM = cL[0],
                c_ = cL[1],
                cU = cS(cD(cC), 2),
                cF = cU[0],
                cB = cU[1],
                cW = function(e) {
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
                        m = cT(t),
                        b = cS(ec.useState(null), 2),
                        v = b[0],
                        h = b[1],
                        g = cS(ec.useState(null), 2),
                        w = g[0],
                        O = g[1],
                        j = cS(ec.useState(!1), 2),
                        x = j[0],
                        S = j[1],
                        P = lY(u),
                        E = cS(tj({
                            prop: n,
                            defaultProp: o,
                            onChange: a
                        }), 2),
                        A = E[0],
                        C = E[1],
                        I = cS(tj({
                            prop: i,
                            defaultProp: l,
                            onChange: c
                        }), 2),
                        R = I[0],
                        N = I[1],
                        k = ec.useRef(null),
                        D = !v || y || !!v.closest("form"),
                        T = cS(ec.useState(new Set), 2),
                        L = T[0],
                        M = T[1],
                        _ = Array.from(L).map(function(e) {
                            return e.props.value
                        }).join(";");
                    return (0, X.jsx)(cr, cj(cO({}, m), {
                        children: (0, X.jsxs)(cM, {
                            required: d,
                            scope: t,
                            trigger: v,
                            onTriggerChange: h,
                            valueNode: w,
                            onValueNodeChange: O,
                            valueNodeHasChildren: x,
                            onValueNodeHasChildrenChange: S,
                            contentId: tv(),
                            value: R,
                            onValueChange: N,
                            open: void 0 !== A && A,
                            onOpenChange: C,
                            dir: P,
                            triggerPointerDownPosRef: k,
                            disabled: p,
                            children: [(0, X.jsx)(cR.Provider, {
                                scope: t,
                                children: (0, X.jsx)(cF, {
                                    scope: e.__scopeSelect,
                                    onNativeOptionAdd: ec.useCallback(function(e) {
                                        M(function(t) {
                                            return new Set(t).add(e)
                                        })
                                    }, []),
                                    onNativeOptionRemove: ec.useCallback(function(e) {
                                        M(function(t) {
                                            var r = new Set(t);
                                            return r.delete(e), r
                                        })
                                    }, []),
                                    children: r
                                })
                            }), D ? (0, X.jsxs)(ub, {
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
                                children: [void 0 === R ? (0, X.jsx)("option", {
                                    value: ""
                                }) : null, Array.from(L)]
                            }, _) : null]
                        })
                    }))
                };
            cW.displayName = cC;
            var cK = "SelectTrigger",
                cz = ec.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.disabled,
                        o = cx(e, ["__scopeSelect", "disabled"]),
                        a = cT(r),
                        i = c_(cK, r),
                        l = i.disabled || void 0 !== n && n,
                        c = ta(t, i.onTriggerChange),
                        u = cN(r),
                        s = ec.useRef("touch"),
                        f = cS(uv(function(e) {
                            var t = u().filter(function(e) {
                                    return !e.disabled
                                }),
                                r = t.find(function(e) {
                                    return e.value === i.value
                                }),
                                n = uh(t, e, r);
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
                    return (0, X.jsx)(co, cj(cO({
                        asChild: !0
                    }, a), {
                        children: (0, X.jsx)(tU.button, cj(cO({
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
                            "data-placeholder": um(i.value) ? "" : void 0
                        }, o), {
                            ref: c,
                            onClick: tt(o.onClick, function(e) {
                                e.currentTarget.focus(), "mouse" !== s.current && m(e)
                            }),
                            onPointerDown: tt(o.onPointerDown, function(e) {
                                s.current = e.pointerType;
                                var t = e.target;
                                t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (m(e), e.preventDefault())
                            }),
                            onKeyDown: tt(o.onKeyDown, function(e) {
                                var t = "" !== p.current;
                                e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || d(e.key), (!t || " " !== e.key) && cE.includes(e.key) && (m(), e.preventDefault())
                            })
                        }))
                    }))
                });
            cz.displayName = cK;
            var cH = "SelectValue",
                cV = ec.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = (e.className, e.style, e.children),
                        o = e.placeholder,
                        a = cx(e, ["__scopeSelect", "className", "style", "children", "placeholder"]),
                        i = c_(cH, r),
                        l = i.onValueNodeHasChildrenChange,
                        c = void 0 !== n,
                        u = ta(t, i.onValueNodeChange);
                    return td(function() {
                        l(c)
                    }, [l, c]), (0, X.jsx)(tU.span, cj(cO({}, a), {
                        ref: u,
                        style: {
                            pointerEvents: "none"
                        },
                        children: um(i.value) ? (0, X.jsx)(X.Fragment, {
                            children: void 0 === o ? "" : o
                        }) : n
                    }))
                });
            cV.displayName = cH;
            var cX = ec.forwardRef(function(e, t) {
                e.__scopeSelect;
                var r = e.children,
                    n = cx(e, ["__scopeSelect", "children"]);
                return (0, X.jsx)(tU.span, cj(cO({
                    "aria-hidden": !0
                }, n), {
                    ref: t,
                    children: r || "▼"
                }))
            });
            cX.displayName = "SelectIcon";
            var cG = function(e) {
                return (0, X.jsx)(tB, cO({
                    asChild: !0
                }, e))
            };
            cG.displayName = "SelectPortal";
            var cq = "SelectContent",
                cY = ec.forwardRef(function(e, t) {
                    var r = c_(cq, e.__scopeSelect),
                        n = cS(ec.useState(), 2),
                        o = n[0],
                        a = n[1];
                    return (td(function() {
                        a(new DocumentFragment)
                    }, []), r.open) ? (0, X.jsx)(c0, cj(cO({}, e), {
                        ref: t
                    })) : o ? tP.createPortal((0, X.jsx)(cZ, {
                        scope: e.__scopeSelect,
                        children: (0, X.jsx)(cR.Slot, {
                            scope: e.__scopeSelect,
                            children: (0, X.jsx)("div", {
                                children: e.children
                            })
                        })
                    }), o) : null
                });
            cY.displayName = cq;
            var c$ = cS(cD(cq), 2),
                cZ = c$[0],
                cQ = c$[1],
                cJ = tk("SelectContent.RemoveScroll"),
                c0 = ec.forwardRef(function(e, t) {
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
                        h = cx(e, ["__scopeSelect", "position", "onCloseAutoFocus", "onEscapeKeyDown", "onPointerDownOutside", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "avoidCollisions"]),
                        g = c_(cq, r),
                        w = cS(ec.useState(null), 2),
                        O = w[0],
                        j = w[1],
                        x = cS(ec.useState(null), 2),
                        S = x[0],
                        P = x[1],
                        E = ta(t, function(e) {
                            return j(e)
                        }),
                        A = cS(ec.useState(null), 2),
                        C = A[0],
                        I = A[1],
                        R = cS(ec.useState(null), 2),
                        N = R[0],
                        k = R[1],
                        D = cN(r),
                        T = cS(ec.useState(!1), 2),
                        L = T[0],
                        M = T[1],
                        _ = ec.useRef(!1);
                    ec.useEffect(function() {
                        if (O) return rC(O)
                    }, [O]), (0, tV.useFocusGuards)();
                    var U = ec.useCallback(function(e) {
                            var t = cg(c = D().map(function(e) {
                                    return e.ref.current
                                })) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(c) || cP(c) || cw(),
                                r = t[0],
                                n = cS(t.slice(1).slice(-1), 1)[0],
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
                        F = ec.useCallback(function() {
                            return U([C, O])
                        }, [U, C, O]);
                    ec.useEffect(function() {
                        L && F()
                    }, [L, F]);
                    var B = g.onOpenChange,
                        W = g.triggerPointerDownPosRef;
                    ec.useEffect(function() {
                        if (O) {
                            var e = {
                                    x: 0,
                                    y: 0
                                },
                                t = function(t) {
                                    var r, n, o, a;
                                    e = {
                                        x: Math.abs(Math.round(t.pageX) - (null != (r = null == (o = W.current) ? void 0 : o.x) ? r : 0)),
                                        y: Math.abs(Math.round(t.pageY) - (null != (n = null == (a = W.current) ? void 0 : a.y) ? n : 0))
                                    }
                                },
                                r = function(r) {
                                    e.x <= 10 && e.y <= 10 ? r.preventDefault() : O.contains(r.target) || B(!1), document.removeEventListener("pointermove", t), W.current = null
                                };
                            return null !== W.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                                    capture: !0,
                                    once: !0
                                })),
                                function() {
                                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                                        capture: !0
                                    })
                                }
                        }
                    }, [O, B, W]), ec.useEffect(function() {
                        var e = function() {
                            return B(!1)
                        };
                        return window.addEventListener("blur", e), window.addEventListener("resize", e),
                            function() {
                                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
                            }
                    }, [B]);
                    var K = cS(uv(function(e) {
                            var t = D().filter(function(e) {
                                    return !e.disabled
                                }),
                                r = t.find(function(e) {
                                    return e.ref.current === document.activeElement
                                }),
                                n = uh(t, e, r);
                            n && setTimeout(function() {
                                return n.ref.current.focus()
                            })
                        }), 2),
                        z = K[0],
                        H = K[1],
                        V = ec.useCallback(function(e, t, r) {
                            var n = !_.current && !r;
                            (void 0 !== g.value && g.value === t || n) && (I(e), n && (_.current = !0))
                        }, [g.value]),
                        G = ec.useCallback(function() {
                            return null == O ? void 0 : O.focus()
                        }, [O]),
                        q = ec.useCallback(function(e, t, r) {
                            var n = !_.current && !r;
                            (void 0 !== g.value && g.value === t || n) && k(e)
                        }, [g.value]),
                        Y = "popper" === o ? c2 : c1,
                        $ = Y === c2 ? {
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
                    return (0, X.jsx)(cZ, {
                        scope: r,
                        content: O,
                        viewport: S,
                        onViewportChange: P,
                        itemRefCallback: V,
                        selectedItem: C,
                        onItemLeave: G,
                        itemTextRefCallback: q,
                        focusSelectedItem: F,
                        selectedItemText: N,
                        position: o,
                        isPositioned: L,
                        searchRef: z,
                        children: (0, X.jsx)(rO, {
                            as: cJ,
                            allowPinchZoom: !0,
                            children: (0, X.jsx)(tS.FocusScope, {
                                asChild: !0,
                                trapped: g.open,
                                onMountAutoFocus: function(e) {
                                    e.preventDefault()
                                },
                                onUnmountAutoFocus: tt(a, function(e) {
                                    var t;
                                    null == (t = g.trigger) || t.focus({
                                        preventScroll: !0
                                    }), e.preventDefault()
                                }),
                                children: (0, X.jsx)(tx.DismissableLayer, {
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
                                    children: (0, X.jsx)(Y, cj(cO({
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
                                        style: cO({
                                            display: "flex",
                                            flexDirection: "column",
                                            outline: "none"
                                        }, h.style),
                                        onKeyDown: tt(h.onKeyDown, function(e) {
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
            c0.displayName = "SelectContentImpl";
            var c1 = ec.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.onPlaced,
                    o = cx(e, ["__scopeSelect", "onPlaced"]),
                    a = c_(cq, r),
                    i = cQ(cq, r),
                    l = cS(ec.useState(null), 2),
                    c = l[0],
                    u = l[1],
                    s = cS(ec.useState(null), 2),
                    f = s[0],
                    p = s[1],
                    d = ta(t, function(e) {
                        return p(e)
                    }),
                    y = cN(r),
                    m = ec.useRef(!1),
                    b = ec.useRef(!0),
                    v = i.viewport,
                    h = i.selectedItem,
                    g = i.selectedItemText,
                    w = i.focusSelectedItem,
                    O = ec.useCallback(function() {
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
                                    d = lz(l, [10, Math.max(10, window.innerWidth - 10 - p)]);
                                c.style.minWidth = s + "px", c.style.left = d + "px"
                            } else {
                                var b = t.right - o.right,
                                    w = window.innerWidth - r.right - b,
                                    O = window.innerWidth - e.right - w,
                                    j = e.width + O,
                                    x = Math.max(j, t.width),
                                    S = lz(w, [10, Math.max(10, window.innerWidth - 10 - x)]);
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
                                var W = Math.max(E - _, U + (B ? M : 0) + (f.clientHeight - v.offsetTop - v.offsetHeight) + N);
                                c.style.height = F + W + "px"
                            } else {
                                var K = P.length > 0 && h === P[0].ref.current;
                                c.style.top = "0px";
                                var z = Math.max(_, I + v.offsetTop + (K ? L : 0) + U);
                                c.style.height = z + (k - F) + "px", v.scrollTop = F - _ + v.offsetTop
                            }
                            c.style.margin = "".concat(10, "px 0"), c.style.minHeight = D + "px", c.style.maxHeight = E + "px", null == n || n(), requestAnimationFrame(function() {
                                return m.current = !0
                            })
                        }
                    }, [y, a.trigger, a.valueNode, c, f, v, h, g, a.dir, n]);
                td(function() {
                    return O()
                }, [O]);
                var j = cS(ec.useState(), 2),
                    x = j[0],
                    S = j[1];
                td(function() {
                    f && S(window.getComputedStyle(f).zIndex)
                }, [f]);
                var P = ec.useCallback(function(e) {
                    e && !0 === b.current && (O(), null == w || w(), b.current = !1)
                }, [O, w]);
                return (0, X.jsx)(c6, {
                    scope: r,
                    contentWrapper: c,
                    shouldExpandOnScrollRef: m,
                    onScrollButtonChange: P,
                    children: (0, X.jsx)("div", {
                        ref: u,
                        style: {
                            display: "flex",
                            flexDirection: "column",
                            position: "fixed",
                            zIndex: x
                        },
                        children: (0, X.jsx)(tU.div, cj(cO({}, o), {
                            ref: d,
                            style: cO({
                                boxSizing: "border-box",
                                maxHeight: "100%"
                            }, o.style)
                        }))
                    })
                })
            });
            c1.displayName = "SelectItemAlignedPosition";
            var c2 = ec.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.align,
                    o = e.collisionPadding,
                    a = cx(e, ["__scopeSelect", "align", "collisionPadding"]),
                    i = cT(r);
                return (0, X.jsx)(cu, cj(cO({}, i, a), {
                    ref: t,
                    align: void 0 === n ? "start" : n,
                    collisionPadding: void 0 === o ? 10 : o,
                    style: cO({
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
            c2.displayName = "SelectPopperPosition";
            var c3 = cS(cD(cq, {}), 2),
                c6 = c3[0],
                c8 = c3[1],
                c5 = "SelectViewport",
                c4 = ec.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.nonce,
                        o = cx(e, ["__scopeSelect", "nonce"]),
                        a = cQ(c5, r),
                        i = c8(c5, r),
                        l = ta(t, a.onViewportChange),
                        c = ec.useRef(0);
                    return (0, X.jsxs)(X.Fragment, {
                        children: [(0, X.jsx)("style", {
                            dangerouslySetInnerHTML: {
                                __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                            },
                            nonce: n
                        }), (0, X.jsx)(cR.Slot, {
                            scope: r,
                            children: (0, X.jsx)(tU.div, cj(cO({
                                "data-radix-select-viewport": "",
                                role: "presentation"
                            }, o), {
                                ref: l,
                                style: cO({
                                    position: "relative",
                                    flex: 1,
                                    overflow: "hidden auto"
                                }, o.style),
                                onScroll: tt(o.onScroll, function(e) {
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
            c4.displayName = c5;
            var c7 = "SelectGroup",
                c9 = cS(cD(c7), 2),
                ue = c9[0],
                ut = c9[1];
            ec.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = cx(e, ["__scopeSelect"]),
                    o = tv();
                return (0, X.jsx)(ue, {
                    scope: r,
                    id: o,
                    children: (0, X.jsx)(tU.div, cj(cO({
                        role: "group",
                        "aria-labelledby": o
                    }, n), {
                        ref: t
                    }))
                })
            }).displayName = c7;
            var ur = "SelectLabel";
            ec.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = cx(e, ["__scopeSelect"]),
                    o = ut(ur, r);
                return (0, X.jsx)(tU.div, cj(cO({
                    id: o.id
                }, n), {
                    ref: t
                }))
            }).displayName = ur;
            var un = "SelectItem",
                uo = cS(cD(un), 2),
                ua = uo[0],
                ui = uo[1],
                ul = ec.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.value,
                        o = e.disabled,
                        a = void 0 !== o && o,
                        i = e.textValue,
                        l = cx(e, ["__scopeSelect", "value", "disabled", "textValue"]),
                        c = c_(un, r),
                        u = cQ(un, r),
                        s = c.value === n,
                        f = cS(ec.useState(null != i ? i : ""), 2),
                        p = f[0],
                        d = f[1],
                        y = cS(ec.useState(!1), 2),
                        m = y[0],
                        b = y[1],
                        v = ta(t, function(e) {
                            var t;
                            return null == (t = u.itemRefCallback) ? void 0 : t.call(u, e, n, a)
                        }),
                        h = tv(),
                        g = ec.useRef("touch"),
                        w = function() {
                            a || (c.onValueChange(n), c.onOpenChange(!1))
                        };
                    if ("" === n) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
                    return (0, X.jsx)(ua, {
                        scope: r,
                        value: n,
                        disabled: a,
                        textId: h,
                        isSelected: s,
                        onItemTextChange: ec.useCallback(function(e) {
                            d(function(t) {
                                var r;
                                return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                            })
                        }, []),
                        children: (0, X.jsx)(cR.ItemSlot, {
                            scope: r,
                            value: n,
                            disabled: a,
                            textValue: p,
                            children: (0, X.jsx)(tU.div, cj(cO({
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
                                onFocus: tt(l.onFocus, function() {
                                    return b(!0)
                                }),
                                onBlur: tt(l.onBlur, function() {
                                    return b(!1)
                                }),
                                onClick: tt(l.onClick, function() {
                                    "mouse" !== g.current && w()
                                }),
                                onPointerUp: tt(l.onPointerUp, function() {
                                    "mouse" === g.current && w()
                                }),
                                onPointerDown: tt(l.onPointerDown, function(e) {
                                    g.current = e.pointerType
                                }),
                                onPointerMove: tt(l.onPointerMove, function(e) {
                                    if (g.current = e.pointerType, a) {
                                        var t;
                                        null == (t = u.onItemLeave) || t.call(u)
                                    } else "mouse" === g.current && e.currentTarget.focus({
                                        preventScroll: !0
                                    })
                                }),
                                onPointerLeave: tt(l.onPointerLeave, function(e) {
                                    if (e.currentTarget === document.activeElement) {
                                        var t;
                                        null == (t = u.onItemLeave) || t.call(u)
                                    }
                                }),
                                onKeyDown: tt(l.onKeyDown, function(e) {
                                    var t;
                                    ((null == (t = u.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (cA.includes(e.key) && w(), " " === e.key && e.preventDefault())
                                })
                            }))
                        })
                    })
                });
            ul.displayName = un;
            var uc = "SelectItemText",
                uu = ec.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = (e.className, e.style, cx(e, ["__scopeSelect", "className", "style"])),
                        o = c_(uc, r),
                        a = cQ(uc, r),
                        i = ui(uc, r),
                        l = cB(uc, r),
                        c = cS(ec.useState(null), 2),
                        u = c[0],
                        s = c[1],
                        f = ta(t, function(e) {
                            return s(e)
                        }, i.onItemTextChange, function(e) {
                            var t;
                            return null == (t = a.itemTextRefCallback) ? void 0 : t.call(a, e, i.value, i.disabled)
                        }),
                        p = null == u ? void 0 : u.textContent,
                        d = ec.useMemo(function() {
                            return (0, X.jsx)("option", {
                                value: i.value,
                                disabled: i.disabled,
                                children: p
                            }, i.value)
                        }, [i.disabled, i.value, p]),
                        y = l.onNativeOptionAdd,
                        m = l.onNativeOptionRemove;
                    return td(function() {
                        return y(d),
                            function() {
                                return m(d)
                            }
                    }, [y, m, d]), (0, X.jsxs)(X.Fragment, {
                        children: [(0, X.jsx)(tU.span, cj(cO({
                            id: i.textId
                        }, n), {
                            ref: f
                        })), i.isSelected && o.valueNode && !o.valueNodeHasChildren ? tP.createPortal(n.children, o.valueNode) : null]
                    })
                });
            uu.displayName = uc;
            var us = "SelectItemIndicator";
            ec.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = cx(e, ["__scopeSelect"]);
                return ui(us, r).isSelected ? (0, X.jsx)(tU.span, cj(cO({
                    "aria-hidden": !0
                }, n), {
                    ref: t
                })) : null
            }).displayName = us;
            var uf = "SelectScrollUpButton";
            ec.forwardRef(function(e, t) {
                var r = cQ(uf, e.__scopeSelect),
                    n = c8(uf, e.__scopeSelect),
                    o = cS(ec.useState(!1), 2),
                    a = o[0],
                    i = o[1],
                    l = ta(t, n.onScrollButtonChange);
                return td(function() {
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
                }, [r.viewport, r.isPositioned]), a ? (0, X.jsx)(ud, cj(cO({}, e), {
                    ref: l,
                    onAutoScroll: function() {
                        var e = r.viewport,
                            t = r.selectedItem;
                        e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
                    }
                })) : null
            }).displayName = uf;
            var up = "SelectScrollDownButton";
            ec.forwardRef(function(e, t) {
                var r = cQ(up, e.__scopeSelect),
                    n = c8(up, e.__scopeSelect),
                    o = cS(ec.useState(!1), 2),
                    a = o[0],
                    i = o[1],
                    l = ta(t, n.onScrollButtonChange);
                return td(function() {
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
                }, [r.viewport, r.isPositioned]), a ? (0, X.jsx)(ud, cj(cO({}, e), {
                    ref: l,
                    onAutoScroll: function() {
                        var e = r.viewport,
                            t = r.selectedItem;
                        e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
                    }
                })) : null
            }).displayName = up;
            var ud = ec.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.onAutoScroll,
                    o = cx(e, ["__scopeSelect", "onAutoScroll"]),
                    a = cQ("SelectScrollButton", r),
                    i = ec.useRef(null),
                    l = cN(r),
                    c = ec.useCallback(function() {
                        null !== i.current && (window.clearInterval(i.current), i.current = null)
                    }, []);
                return ec.useEffect(function() {
                    return function() {
                        return c()
                    }
                }, [c]), td(function() {
                    var e, t = l().find(function(e) {
                        return e.ref.current === document.activeElement
                    });
                    null == t || null == (e = t.ref.current) || e.scrollIntoView({
                        block: "nearest"
                    })
                }, [l]), (0, X.jsx)(tU.div, cj(cO({
                    "aria-hidden": !0
                }, o), {
                    ref: t,
                    style: cO({
                        flexShrink: 0
                    }, o.style),
                    onPointerDown: tt(o.onPointerDown, function() {
                        null === i.current && (i.current = window.setInterval(n, 50))
                    }),
                    onPointerMove: tt(o.onPointerMove, function() {
                        var e;
                        null == (e = a.onItemLeave) || e.call(a), null === i.current && (i.current = window.setInterval(n, 50))
                    }),
                    onPointerLeave: tt(o.onPointerLeave, function() {
                        c()
                    })
                }))
            });
            ec.forwardRef(function(e, t) {
                e.__scopeSelect;
                var r = cx(e, ["__scopeSelect"]);
                return (0, X.jsx)(tU.div, cj(cO({
                    "aria-hidden": !0
                }, r), {
                    ref: t
                }))
            }).displayName = "SelectSeparator";
            var uy = "SelectArrow";

            function um(e) {
                return "" === e || void 0 === e
            }
            ec.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = cx(e, ["__scopeSelect"]),
                    o = cT(r),
                    a = c_(uy, r),
                    i = cQ(uy, r);
                return a.open && "popper" === i.position ? (0, X.jsx)(cp, cj(cO({}, o, n), {
                    ref: t
                })) : null
            }).displayName = uy;
            var ub = ec.forwardRef(function(e, t) {
                var r, n = e.value,
                    o = cx(e, ["value"]),
                    a = ec.useRef(null),
                    i = ta(t, a),
                    l = (r = ec.useRef({
                        value: n,
                        previous: n
                    }), ec.useMemo(function() {
                        return r.current.value !== n && (r.current.previous = r.current.value, r.current.value = n), r.current.previous
                    }, [n]));
                return ec.useEffect(function() {
                    var e = a.current,
                        t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
                    if (l !== n && t) {
                        var r = new Event("change", {
                            bubbles: !0
                        });
                        t.call(e, n), e.dispatchEvent(r)
                    }
                }, [l, n]), (0, X.jsx)(cv, {
                    asChild: !0,
                    children: (0, X.jsx)("select", cj(cO({}, o), {
                        ref: i,
                        defaultValue: n
                    }))
                })
            });

            function uv(e) {
                var t = tg(e),
                    r = ec.useRef(""),
                    n = ec.useRef(0),
                    o = ec.useCallback(function(e) {
                        var o = r.current + e;
                        t(o),
                            function e(t) {
                                r.current = t, window.clearTimeout(n.current), "" !== t && (n.current = window.setTimeout(function() {
                                    return e("")
                                }, 1e3))
                            }(o)
                    }, [t]),
                    a = ec.useCallback(function() {
                        r.current = "", window.clearTimeout(n.current)
                    }, []);
                return ec.useEffect(function() {
                    return function() {
                        return window.clearTimeout(n.current)
                    }
                }, []), [r, o, a]
            }

            function uh(e, t, r) {
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
            ub.displayName = "BubbleSelect";
            var ug = (0, ec.createContext)(null),
                uw = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-600"
                },
                uO = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                uj = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                ux = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                uS = {
                    XSmall: "gap-xsmall",
                    Small: "gap-small",
                    Medium: "gap-small",
                    Large: "gap-small"
                },
                uP = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                uE = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                uA = (0, ec.forwardRef)(function(e, t) {
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
                        h = of(),
                        g = (0, ec.useMemo)(function() {
                            return {
                                size: l
                            }
                        }, [l]),
                        w = r ? eu().createElement("span", {
                            id: h,
                            className: eJ(uj[l], "content-emphasis")
                        }, r) : null;
                    return eu().createElement(ug.Provider, {
                        value: g
                    }, eu().createElement("div", {
                        className: eJ("flex flex-col", p && ["opacity-[0.5]", "pointer-events-none"], uS[l], i)
                    }, w && (n ? eu().createElement("div", {
                        className: "flex items-center gap-xsmall"
                    }, w, eu().createElement(lF, n)) : w), eu().createElement(cW, {
                        value: s,
                        disabled: p,
                        onValueChange: m,
                        onOpenChange: b
                    }, eu().createElement(cz, {
                        className: eJ("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", lB[u], lW[u], uP[l], uE[l], uO[l], ux[l], d ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === s ? "content-muted" : "content-default"),
                        ref: t,
                        "aria-labelledby": r ? h : o,
                        "aria-label": a
                    }, eu().createElement(e1, null), eu().createElement("div", {
                        className: "grow-1 text-truncate-split text-align-x-left"
                    }, eu().createElement(cV, {
                        placeholder: f
                    })), eu().createElement(cX, {
                        className: eJ(uw[l], "icon icon-regular-chevron-large-down content-default")
                    })), eu().createElement(cG, null, eu().createElement(cY, {
                        position: "popper",
                        className: "padding-y-small foundation-web-portal-zindex",
                        style: {
                            maxHeight: "var(--radix-select-content-available-height)"
                        }
                    }, v))), y && eu().createElement("span", {
                        className: eJ("text-caption-small", {
                            "content-system-alert": d,
                            "content-default": !d
                        })
                    }, y)))
                });

            function uC(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function uI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            uA.displayName = "Dropdown", "u" > typeof window && window.document && window.document.createElement;

            function uR(e, t, r) {
                return (uR = u_() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && uT(o, r.prototype), o
                }).apply(null, arguments)
            }

            function uN(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function uk(e) {
                return (uk = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function uD(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        uN(e, t, r[t])
                    })
                }
                return e
            }

            function uT(e, t) {
                return (uT = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function uL(e, t) {
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
                        if ("string" == typeof e) return uI(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uI(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uM(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (uM = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return uR(e, arguments, uk(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), uT(r, e)
                })(e)
            }

            function u_() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (u_ = function() {
                    return !!e
                })()
            }

            function uU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uF(e, t) {
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
                        if ("string" == typeof e) return uU(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uU(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            uM(Map);
            var uB = ec[" useInsertionEffect ".trim().toString()] || td;

            function uW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uK(e) {
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

            function uz(e, t) {
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

            function uH(e, t) {
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

            function uV(e, t) {
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
                }(e, t) || uX(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uX(e, t) {
                if (e) {
                    if ("string" == typeof e) return uW(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uW(e, t)
                }
            }
            Symbol("RADIX:SYNC_STATE");
            var uG = "rovingFocusGroup.onEntryFocus",
                uq = {
                    bubbles: !1,
                    cancelable: !0
                },
                uY = "RovingFocusGroup",
                u$ = uV((R = (I = uL(tf(C = uY + "CollectionProvider"), 2))[0], N = I[1], D = (k = uL(R(C, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], T = k[1], (L = function(e) {
                    var t = e.scope,
                        r = e.children,
                        n = eu().useRef(null),
                        o = eu().useRef(new Map).current;
                    return (0, X.jsx)(D, {
                        scope: t,
                        itemMap: o,
                        collectionRef: n,
                        children: r
                    })
                }).displayName = C, _ = nc(M = uY + "CollectionSlot"), (U = eu().forwardRef(function(e, t) {
                    var r = e.scope,
                        n = e.children,
                        o = ta(t, T(M, r).collectionRef);
                    return (0, X.jsx)(_, {
                        ref: o,
                        children: n
                    })
                })).displayName = M, B = "data-radix-collection-item", W = nc(F = uY + "CollectionItemSlot"), (K = eu().forwardRef(function(e, t) {
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
                        l = eu().useRef(null),
                        c = ta(t, l),
                        u = T(F, o);
                    return eu().useEffect(function() {
                        return u.itemMap.set(l, uD({
                                ref: l
                            }, i)),
                            function() {
                                u.itemMap.delete(l)
                            }
                    }), (0, X.jsx)(W, (r = uD({}, uN({}, B, "")), n = n = {
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
                })).displayName = F, [{
                    Provider: L,
                    Slot: U,
                    ItemSlot: K
                }, function(e) {
                    var t = T(uY + "CollectionConsumer", e);
                    return eu().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var r = Array.from(e.querySelectorAll("[".concat(B, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return r.indexOf(e.ref.current) - r.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, N]), 3),
                uZ = u$[0],
                uQ = u$[1],
                uJ = uV(tf(uY, [u$[2]]), 2),
                u0 = uJ[0];
            uJ[1];
            var u1 = uV(u0(uY), 2),
                u2 = u1[0],
                u3 = u1[1],
                u6 = ec.forwardRef(function(e, t) {
                    return (0, X.jsx)(uZ.Provider, {
                        scope: e.__scopeRovingFocusGroup,
                        children: (0, X.jsx)(uZ.Slot, {
                            scope: e.__scopeRovingFocusGroup,
                            children: (0, X.jsx)(u8, uz(uK({}, e), {
                                ref: t
                            }))
                        })
                    })
                });
            u6.displayName = uY;
            var u8 = ec.forwardRef(function(e, t) {
                    var r, n, o, a, i, l, c, u, s, f, p, d, y, m, b, v, h, g, w, O, j = e.__scopeRovingFocusGroup,
                        x = e.orientation,
                        S = e.loop,
                        P = e.dir,
                        E = e.currentTabStopId,
                        A = e.defaultCurrentTabStopId,
                        C = e.onCurrentTabStopIdChange,
                        I = e.onEntryFocus,
                        R = e.preventScrollOnEntryFocus,
                        N = void 0 !== R && R,
                        k = uH(e, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        D = ec.useRef(null),
                        T = ta(t, D),
                        L = lY(P),
                        M = uV((f = (s = {
                            prop: E,
                            defaultProp: null != A ? A : null,
                            onChange: C,
                            caller: uY
                        }).prop, p = s.defaultProp, d = s.onChange, y = s.caller, b = (m = uF((n = (r = {
                            defaultProp: p,
                            onChange: void 0 === d ? function() {} : d
                        }).defaultProp, o = r.onChange, i = (a = uF(ec.useState(n), 2))[0], l = a[1], c = ec.useRef(i), u = ec.useRef(o), uB(function() {
                            u.current = o
                        }, [o]), ec.useEffect(function() {
                            if (c.current !== i) {
                                var e;
                                null == (e = u.current) || e.call(u, i), c.current = i
                            }
                        }, [i, c]), [i, l, u]), 3))[0], v = m[1], h = m[2], w = (g = void 0 !== f) ? f : b, O = ec.useRef(void 0 !== f), ec.useEffect(function() {
                            var e = O.current;
                            if (e !== g) {
                                var t = g ? "controlled" : "uncontrolled";
                                console.warn("".concat(y, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                            }
                            O.current = g
                        }, [g, y]), [w, ec.useCallback(function(e) {
                            if (g) {
                                var t, r = "function" == typeof e ? e(f) : e;
                                r !== f && (null == (t = h.current) || t.call(h, r))
                            } else v(e)
                        }, [g, f, v, h])]), 2),
                        _ = M[0],
                        U = M[1],
                        F = uV(ec.useState(!1), 2),
                        B = F[0],
                        W = F[1],
                        K = tg(I),
                        z = uQ(j),
                        H = ec.useRef(!1),
                        V = uV(ec.useState(0), 2),
                        G = V[0],
                        q = V[1];
                    return ec.useEffect(function() {
                        var e = D.current;
                        if (e) return e.addEventListener(uG, K),
                            function() {
                                return e.removeEventListener(uG, K)
                            }
                    }, [K]), (0, X.jsx)(u2, {
                        scope: j,
                        orientation: x,
                        dir: L,
                        loop: void 0 !== S && S,
                        currentTabStopId: _,
                        onItemFocus: ec.useCallback(function(e) {
                            return U(e)
                        }, [U]),
                        onItemShiftTab: ec.useCallback(function() {
                            return W(!0)
                        }, []),
                        onFocusableItemAdd: ec.useCallback(function() {
                            return q(function(e) {
                                return e + 1
                            })
                        }, []),
                        onFocusableItemRemove: ec.useCallback(function() {
                            return q(function(e) {
                                return e - 1
                            })
                        }, []),
                        children: (0, X.jsx)(ny.div, uz(uK({
                            tabIndex: B || 0 === G ? -1 : 0,
                            "data-orientation": x
                        }, k), {
                            ref: T,
                            style: uK({
                                outline: "none"
                            }, e.style),
                            onMouseDown: uC(e.onMouseDown, function() {
                                H.current = !0
                            }),
                            onFocus: uC(e.onFocus, function(e) {
                                var t = !H.current;
                                if (e.target === e.currentTarget && t && !B) {
                                    var r = new CustomEvent(uG, uq);
                                    if (e.currentTarget.dispatchEvent(r), !r.defaultPrevented) {
                                        var n = z().filter(function(e) {
                                            return e.focusable
                                        });
                                        u9([n.find(function(e) {
                                            return e.active
                                        }), n.find(function(e) {
                                            return e.id === _
                                        })].concat(function(e) {
                                            if (Array.isArray(e)) return uW(e)
                                        }(n) || function(e) {
                                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(n) || uX(n) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()).filter(Boolean).map(function(e) {
                                            return e.ref.current
                                        }), N)
                                    }
                                }
                                H.current = !1
                            }),
                            onBlur: uC(e.onBlur, function() {
                                return W(!1)
                            })
                        }))
                    })
                }),
                u5 = "RovingFocusGroupItem",
                u4 = ec.forwardRef(function(e, t) {
                    var r = e.__scopeRovingFocusGroup,
                        n = e.focusable,
                        o = void 0 === n || n,
                        a = e.active,
                        i = e.tabStopId,
                        l = e.children,
                        c = uH(e, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        u = tv(),
                        s = i || u,
                        f = u3(u5, r),
                        p = f.currentTabStopId === s,
                        d = uQ(r),
                        y = f.onFocusableItemAdd,
                        m = f.onFocusableItemRemove,
                        b = f.currentTabStopId;
                    return ec.useEffect(function() {
                        if (o) return y(),
                            function() {
                                return m()
                            }
                    }, [o, y, m]), (0, X.jsx)(uZ.ItemSlot, {
                        scope: r,
                        id: s,
                        focusable: o,
                        active: void 0 !== a && a,
                        children: (0, X.jsx)(ny.span, uz(uK({
                            tabIndex: p ? 0 : -1,
                            "data-orientation": f.orientation
                        }, c), {
                            ref: t,
                            onMouseDown: uC(e.onMouseDown, function(e) {
                                o ? f.onItemFocus(s) : e.preventDefault()
                            }),
                            onFocus: uC(e.onFocus, function() {
                                return f.onItemFocus(s)
                            }),
                            onKeyDown: uC(e.onKeyDown, function(e) {
                                if ("Tab" === e.key && e.shiftKey) return void f.onItemShiftTab();
                                if (e.target === e.currentTarget) {
                                    var t = function(e, t, r) {
                                        var n, o = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                                        if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return u7[o]
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
                                            return u9(r)
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
            u4.displayName = u5;
            var u7 = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function u9(e) {
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

            function se(e) {
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

            function st(e, t) {
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

            function sr(e, t) {
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
            var sn = {
                    XSmall: "radius-medium",
                    Small: "radius-large",
                    Medium: "radius-large",
                    Large: "radius-large"
                },
                so = {
                    XSmall: "padding-xsmall",
                    Small: "padding-small",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                sa = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                si = {
                    XSmall: "padding-y-xsmall",
                    Small: "padding-y-small",
                    Medium: "padding-y-small",
                    Large: "padding-y-medium"
                },
                sl = {
                    XSmall: "gap-x-medium",
                    Small: "gap-x-medium",
                    Medium: "gap-x-medium",
                    Large: "gap-x-large"
                },
                sc = {
                    XSmall: "gap-y-xxsmall",
                    Small: "gap-y-xxsmall",
                    Medium: "gap-y-xsmall",
                    Large: "gap-y-xsmall"
                },
                su = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                ss = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                sf = (0, ec.createContext)(null),
                sp = function() {
                    var e = (0, ec.useContext)(sf);
                    if (!e) throw Error("Menu components must be used within a Menu");
                    return e
                },
                sd = function(e) {
                    var t, r = e.children,
                        n = e.className,
                        o = e.size,
                        a = (0, ec.useContext)(ug),
                        i = a ? "dropdown" : "standalone",
                        l = null != (t = null != o ? o : null == a ? void 0 : a.size) ? t : "Medium",
                        c = (0, ec.useMemo)(function() {
                            return {
                                size: l,
                                mode: i
                            }
                        }, [l, i]),
                        u = eJ("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", sn[l], n),
                        s = "standalone" === i ? eu().createElement(u6, {
                            asChild: !0,
                            orientation: "vertical",
                            loop: !0
                        }, eu().createElement("div", {
                            role: "menu",
                            tabIndex: -1,
                            className: u
                        }, r)) : eu().createElement("div", {
                            className: u
                        }, r);
                    return eu().createElement(sf.Provider, {
                        value: c
                    }, "dropdown" === i ? eu().createElement(c4, {
                        asChild: !0,
                        style: {
                            width: "var(--radix-popper-anchor-width)"
                        }
                    }, s) : s)
                },
                sy = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = sp().size;
                    return eu().createElement("div", {
                        role: "group",
                        className: eJ(so[n], r)
                    }, t)
                },
                sm = function(e) {
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
                        p = sr(e, ["value", "leading", "title", "description", "trailing", "disabled", "className", "onSelect", "asChild", "children"]),
                        d = sp(),
                        y = d.size,
                        m = d.mode,
                        b = eJ(e0, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", su[y], sa[y], si[y], sl[y], ss[y], l && "opacity-[0.5]", l && "pointer-events-none", c),
                        v = eu().createElement("span", {
                            className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
                        }, o);
                    switch (m) {
                        case "dropdown":
                            v = eu().createElement(uu, {
                                asChild: !0
                            }, v);
                            break;
                        case "standalone":
                            break;
                        default:
                            console.error("Invalid menu mode:", m)
                    }
                    var h = eu().createElement(eu().Fragment, null, !l && eu().createElement(e1, null), n, eu().createElement("div", {
                        className: eJ("grow-1 text-truncate-split flex flex-col", sc[y])
                    }, v, a && eu().createElement("div", {
                        className: "foundation-web-menu-item-description content-muted"
                    }, a)), i);
                    if (s) {
                        p.as;
                        var g = sr(p, ["as"]),
                            w = eu().Children.only(f),
                            O = void 0 === o && w.props.children;
                        t = eu().createElement(nB, st(se({}, g), {
                            role: "standalone" === m ? "menuitem" : void 0,
                            "aria-disabled": l || void 0,
                            className: b,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: l ? void 0 : u
                        }), O ? eu().cloneElement(w, {}, eu().createElement(eu().Fragment, null, !l && eu().createElement(e1, null), w.props.children)) : eu().cloneElement(w, {}, h))
                    } else if ("a" === p.as) {
                        p.as;
                        var j = p.href,
                            x = sr(p, ["as", "href"]);
                        t = eu().createElement("a", st(se({}, x), {
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
                        var S = sr(p, ["as"]);
                        t = eu().createElement("button", st(se({
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
                    return "dropdown" === m ? eu().createElement(ul, {
                        value: r,
                        disabled: l,
                        asChild: !0
                    }, t) : eu().createElement(u4, {
                        asChild: !0,
                        focusable: !0,
                        tabStopId: r
                    }, t)
                };

            function sb(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sv(e) {
                if (Array.isArray(e)) return e
            }

            function sh() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function sg(e, t) {
                if (e) {
                    if ("string" == typeof e) return sb(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sb(e, t)
                }
            }
            var sw = {
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
                sO = eu().forwardRef(function(e, t) {
                    var r, n = sv(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || sg(r) || sh(),
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
                        m = (sv(a) || function(e) {
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
                        }(a) || sg(a, 1) || sh())[0],
                        b = sw[c],
                        v = b.dimension,
                        h = b.strokeWidth,
                        g = b.textClass,
                        w = b.valueContainerSize,
                        O = (v - h) / 2,
                        j = 2 * Math.PI * O,
                        x = v / 2,
                        S = Math.min(100, Math.max(0, void 0 === s ? 0 : s)),
                        P = p && void 0 !== w ? w : v,
                        E = "Determinate" === (void 0 === u ? "Determinate" : u);
                    return eu().createElement("div", function(e) {
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
                        className: eJ("foundation-web-progress-circle inline-flex items-center justify-center", i),
                        role: "progressbar",
                        "aria-label": d,
                        "aria-valuemin": E ? 0 : void 0,
                        "aria-valuemax": E ? 100 : void 0,
                        "aria-valuenow": E ? S : void 0,
                        style: {
                            width: P,
                            height: P
                        }
                    }, y), eu().createElement("svg", {
                        width: v,
                        height: v,
                        viewBox: "0 0 ".concat(v, " ").concat(v),
                        className: "relative"
                    }, eu().createElement("circle", {
                        cx: x,
                        cy: x,
                        r: O,
                        fill: "none",
                        strokeWidth: h,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), eu().createElement("circle", {
                        cx: x,
                        cy: x,
                        r: O,
                        fill: "none",
                        strokeWidth: h,
                        strokeDasharray: E ? j : "".concat(.75 * j, " ").concat(.25 * j),
                        strokeDashoffset: E ? j * (1 - S / 100) : 0,
                        strokeLinecap: "round",
                        className: eJ(!E && "foundation-web-progress-circle-indeterminate"),
                        style: E ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), E && p && "Large" === c && eu().createElement("div", {
                        className: eJ("absolute content-emphasis flex items-center justify-center", g),
                        "aria-hidden": "true"
                    }, eu().createElement("span", null, Math.round(S)), eu().createElement("span", null, "%")))
                });

            function sj(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            sO.displayName = "ProgressCircle";
            var sx = function() {
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
                                    return [4, ea.httpService.post({
                                        url: "".concat(ek().authApi, "/v2/session/refresh"),
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
                                sj(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                sj(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                },
                sS = ou.eventStreamService.eventTypes,
                sP = "Localization",
                sE = {
                    changeLanguage: {
                        name: "changeLanguage",
                        type: sS.formInteraction,
                        context: sP,
                        requiredParams: ["userId", "newSupportedLocaleCode", "previousSupportedLocaleCode"]
                    },
                    changeLanguageModal: {
                        name: "changeLanguageModal",
                        type: sS.formInteraction,
                        context: sP,
                        requiredParams: ["userId", "newSupportedLocaleCode"]
                    }
                };

            function sA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sC(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function sI(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function sR(e) {
                return (sR = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function sN(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        sI(e, t, r[t])
                    })
                }
                return e
            }

            function sk(e, t) {
                return (sk = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function sD(e) {
                return function(e) {
                    if (Array.isArray(e)) return sA(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return sA(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sA(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sT() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (sT = function() {
                    return !!e
                })()
            }
            var sL = ou.dataStores.localeDataStore,
                sM = function(e) {
                    return e.locale && e.locale.nativeName ? e.isEnabledForFullExperience ? e.locale.nativeName : "".concat(e.locale.nativeName, "*") : ""
                },
                s_ = function(e) {
                    var t;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function r(e) {
                        var t, n, o;
                        if (!(this instanceof r)) throw TypeError("Cannot call a class as a function");
                        return n = r, o = [e], n = sR(n), (t = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, sT() ? Reflect.construct(n, o || [], sR(this).constructor) : n.apply(this, o))).state = {
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
                        }), e && sk(r, e), t = [{
                            key: "componentDidMount",
                            value: function() {
                                this.loadSupportedLocales()
                            }
                        }, {
                            key: "handleLanguageChange",
                            value: function(e) {
                                var t = this,
                                    r = sN({}, e.locale),
                                    n = this.state.userLocale,
                                    o = this.props,
                                    a = o.isAuthenticatedUser,
                                    i = o.onLanguageChange,
                                    l = sN({}, n);
                                a ? (this.setState({
                                    isLocaleUpdateInProgress: !0
                                }), sL.setUserLocale(r.locale).then(function() {
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
                                                    return [4, sx()];
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
                                                sC(a, r, o, i, l, "next", e)
                                            }

                                            function l(e) {
                                                sC(a, r, o, i, l, "throw", e)
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
                                })) : i(r), this.setUserLocaleByLocaleCode(r.locale), ou.eventStreamService.sendEvent(sE.changeLanguage, {
                                    userId: en.authenticatedUser.id,
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
                                    l = (e = Object).assign.apply(e, sD(o.map(function(e) {
                                        return sI({}, e.locale.locale, e)
                                    })));
                                return (0, X.jsx)(uA, {
                                    value: null == a || null == (t = a.locale) ? void 0 : t.locale,
                                    className: "form-group",
                                    onValueChange: function(e) {
                                        return r.handleLanguageChange(l[e])
                                    },
                                    size: "Medium",
                                    placeholder: "Language",
                                    isDisabled: i,
                                    children: (0, X.jsx)(sd, {
                                        children: (0, X.jsx)(sy, {
                                            children: o.map(function(e) {
                                                return (0, X.jsx)(sm, {
                                                    title: sM(e),
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
                                            label: sM(e)
                                        }
                                    }),
                                    o = r.locale && r.locale.locale;
                                return n.length > 0 && (0, X.jsx)("select", {
                                    id: "language-switcher",
                                    className: "flex items-center justify-between width-full bg-none stroke-standard stroke-contrast-alpha cursor-pointer radius-medium height-1000 text-body-medium padding-x-medium",
                                    value: o,
                                    onChange: this.handleNativeLanguageChange,
                                    children: n.map(function(e) {
                                        return (0, X.jsx)("option", {
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
                                    userLocale: sN({}, t)
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
                                    return sD(t).concat(sD(r))
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
                                sL.getLocalesWithCache(6e5).then(function(t) {
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
                                    t = ea.urlService.getQueryParam("locale");
                                if (t) this.setUserLocaleByLocaleCode(t);
                                else {
                                    var r = this.props.isAuthenticatedUser;
                                    sL.getUserLocale().then(function(t) {
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
                                }), ou.eventStreamService.sendEvent(sE.changeLanguageModal, {
                                    userId: en.authenticatedUser.id,
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
                                return (0, X.jsxs)(eu().Fragment, {
                                    children: [o.length > 0 && a.locale ? (0, X.jsx)("div", {
                                        className: "language-selector-wrapper",
                                        children: this.getSelector()
                                    }) : (0, X.jsx)(sO, {
                                        variant: "Indeterminate",
                                        size: "Medium"
                                    }), r && (0, X.jsx)(nP, {
                                        open: r,
                                        isModal: !0,
                                        size: "Medium",
                                        type: "Default",
                                        children: (0, X.jsxs)(nE, {
                                            children: [(0, X.jsxs)(nA, {
                                                className: "flex flex-col gap-y-xsmall items-center",
                                                children: [(0, X.jsx)(nC, {
                                                    className: "text-heading-medium",
                                                    children: e("Heading.UnsupportedLanguage")
                                                }), (0, X.jsx)("div", {
                                                    className: "text-body-medium content-default",
                                                    children: e("Description.UnsupportedLanguage")
                                                })]
                                            }), (0, X.jsx)(nI, {
                                                className: "flex gap-x-small items-center",
                                                children: (0, X.jsx)(n0, {
                                                    variant: "Standard",
                                                    className: "fill",
                                                    size: "Medium",
                                                    onClick: this.hideUnsupportedModal,
                                                    children: e("Action.Ok")
                                                })
                                            })]
                                        })
                                    }), n && (0, X.jsx)("div", {
                                        className: "row",
                                        children: (0, X.jsx)("span", {
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
                }(eu().Component);

            function sU(e) {
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

            function sF(e) {
                var t = ea.pageName.PageNameProvider.getInternalPageName(),
                    r = (0, ei.removeUrlLocale)(window.location.pathname),
                    n = "/" === r.toLowerCase() || "Login" === t || "CreateAccount" === t || "Landing" === t,
                    o = null === en.authenticatedUser || void 0 === en.authenticatedUser ? void 0 : en.authenticatedUser.isAuthenticated,
                    a = eo.DeviceMeta && new eo.DeviceMeta,
                    i = a && (a.isPhone || a.isTablet),
                    l = o || n,
                    c = e.translate;
                return (0, X.jsxs)("div", {
                    className: "footer",
                    children: [(0, X.jsx)(oc, sU({}, e)), (0, X.jsxs)("div", {
                        className: "row copyright-container flex items-center justify-between padding-top-xlarge gutter-x-small",
                        children: [(0, X.jsx)("div", {
                            className: "col-sm-6 col-md-3",
                            children: l && (0, X.jsx)(s_, {
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
                                        window.location.href = ea.urlService.formatUrl(i)
                                    } else window.location.reload()
                                },
                                isAuthenticatedUser: o,
                                showWarningMessageForUnsupportedLocale: !1,
                                hideSeoUnsupportedLocales: n,
                                isNative: i
                            })
                        }), (0, X.jsx)("div", {
                            className: l ? "col-sm-6 col-md-9" : "col-sm-12",
                            children: (0, X.jsx)(el, sU({}, e))
                        })]
                    })]
                })
            }

            function sB(e) {
                var t = e.translate,
                    r = e.intl;
                return (0, X.jsx)(sF, {
                    translate: t,
                    intl: r
                })
            }
            s_.defaultProps = {
                onLanguageChange: function() {},
                isAuthenticatedUser: !1,
                isNative: !1,
                showWarningModalForUnsupportedLocale: !0,
                showWarningMessageForUnsupportedLocale: !0,
                hideSeoUnsupportedLocales: !1
            }, s_.propTypes = {
                isAuthenticatedUser: et().bool,
                onLanguageChange: et().func,
                isNative: et().bool,
                showWarningModalForUnsupportedLocale: et().bool,
                showWarningMessageForUnsupportedLocale: et().bool,
                translate: et().func.isRequired,
                hideSeoUnsupportedLocales: et().bool
            }, sF.propTypes = {
                translate: et().func.isRequired
            }, sB.propTypes = {
                translate: et().func.isRequired,
                intl: et().shape({
                    getRobloxLocale: et().func.isRequired
                }).isRequired
            };
            var sW = (0, $.withTranslations)(sB, er.P),
                sK = function(e, t) {
                    eo.DeviceMeta && ou.hybridService && new eo.DeviceMeta().isInApp && ou.hybridService.localization && ou.hybridService.localization(e, t)
                };

            function sz(e) {
                var t = e.translate,
                    r = null === en.authenticatedUser || void 0 === en.authenticatedUser ? void 0 : en.authenticatedUser.isAuthenticated;
                return (0, X.jsx)(s_, {
                    onLanguageChange: function(e) {
                        var t = e.locale;
                        t && sK(t, function() {
                            console.warn("Language Change Hybrid Event: ".concat(t))
                        }), window.location.reload()
                    },
                    translate: t,
                    isAuthenticatedUser: r
                })
            }
            window.Roblox.AccountSettingsLanguageSelector = sz, sz.propTypes = {
                translate: et().func.isRequired
            };
            var sH = (0, $.withTranslations)(sz, er.P),
                sV = "account-settings-language-selector";
            Y()(function() {
                var e = document.getElementById("footer-container");
                if (e) {
                    var t = (0, X.jsx)(G.QueryClientProvider, {
                        client: $.queryClient,
                        children: (0, X.jsx)(sW, {})
                    });
                    (0, $.renderWithErrorBoundary)(t, e)
                }
                var r = document.getElementById(sV),
                    n = 10,
                    o = function() {
                        (r = document.getElementById(sV)) || !(n > 0) ? r && (0, $.renderWithErrorBoundary)((0, X.jsx)(sH, {}), r): (n -= 1, setTimeout(o, 200))
                    };
                o(), window.location.pathname.toLowerCase().indexOf("/my/account") > -1 && (window.onhashchange = function() {
                    if ("#!/info" === window.location.hash) {
                        var e = document.getElementById(sV);
                        e && (0, $.renderWithErrorBoundary)((0, X.jsx)(sH, {}), e)
                    }
                })
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Footer");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/footer-449e7230c01479d5.js.map
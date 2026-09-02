! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "d1c247f3e0a1efdf8a739ef3115a0ebda2714a87"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "0aa452b9-b0cf-4b06-977b-e6ed3ac11f62", e._sentryDebugIdIdentifier = "sentry-dbid-0aa452b9-b0cf-4b06-977b-e6ed3ac11f62")
    } catch (e) {}
}(),
function() {
    var e = {
            942: function(e) {
                function t(e) {
                    return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
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
                        for (var e = "", i = 0; i < arguments.length; i++) {
                            var a = arguments[i];
                            a && (e = o(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var i = "";
                                for (var a in e) r.call(e, a) && e[a] && (i = o(i, a));
                                return i
                            }(a)))
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
            },
            960: function(e, t, r) {
                "use strict";
                e.exports = {}
            },
            496: function(e, t, r) {
                "use strict";
                e.exports = {}
            }
        },
        t = {};

    function r(n) {
        var o = t[n];
        if (void 0 !== o) return o.exports;
        var i = t[n] = {
            exports: {}
        };
        return e[n](i, i.exports, r), i.exports
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
    }, r.k = function(e) {
        return "" + e + ".css"
    }, r.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), r.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, r.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, r.nc = void 0, r.rv = function() {
        return "1.5.7"
    }, r.g.importScripts && (n = r.g.location + "");
    var n, o = r.g.document;
    if (!n && o && (o.currentScript && "SCRIPT" === o.currentScript.tagName.toUpperCase() && (n = o.currentScript.src), !n)) {
        var i = o.getElementsByTagName("script");
        if (i.length)
            for (var a = i.length - 1; a > -1 && (!n || !/^http(s?):/.test(n));) n = i[a--].src
    }
    if (!n) throw Error("Automatic publicPath is not supported in this browser");
    r.p = n.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), r.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var e, t, n, o, i, a, l, c, u, s, f, d, p, y, m, v, b, h, g, w, O, j, x, S, P, A, E, C, k, D, I, N, T, R, L, M, _, U, F, B, W, z, H, V, K, X, G = window.ReactJSX,
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
                ei = window.Roblox,
                ea = window.CoreUtilities,
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
                ef = r(942),
                ed = r.n(ef),
                ep = window.Roblox["core-scripts"].eventStream,
                ey = window.Roblox["core-scripts"].intl.intl,
                em = r.n(ey),
                ev = window.ReactStyleGuide,
                eb = "RBXViralAcquisition",
                eh = "Description.RBXViralAcquisition",
                eg = "RBXSource",
                ew = "Description.RBXSource",
                eO = "Heading.GoogleAnalytics",
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
                eA = function(e) {
                    var t = e.translate,
                        r = e.isNonEssentialCookieListVisible,
                        n = ed()({
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
                        i = (0, G.jsx)("a", {
                            className: "text-link",
                            target: "_blank",
                            href: "https://support.google.com/analytics/answer/11397207",
                            rel: "noreferrer",
                            children: t(eO)
                        }),
                        a = t("Description.GAReadMore"),
                        l = a.indexOf("{googleAnalyticsLink}"),
                        c = (0, G.jsxs)("p", {
                            className: "font-caption-body text",
                            children: [a.substring(0, l), i]
                        }),
                        u = (0, G.jsxs)("div", {
                            children: [(0, G.jsxs)("a", {
                                className: "font-header-2 text-emphasis",
                                href: "https://marketingplatform.google.com/about/analytics/",
                                children: [t(eO), (0, G.jsx)("span", {
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
                                cookieName: eb,
                                description: t(eh)
                            }), (0, G.jsx)(eP, {
                                cookieName: eg,
                                description: t(ew)
                            })]
                        });
                    return (0, G.jsxs)("div", {
                        className: n,
                        children: [s, u]
                    })
                },
                eE = "RBXcb",
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
                ek = function(e, t, r) {
                    var n, o = null == r.sameSite ? "" : ";samesite=".concat(r.sameSite),
                        i = null == r.domain ? "" : ";domain=".concat(r.domain),
                        a = ";path=".concat(null != (n = r.path) ? n : "/"),
                        l = null == r.expires ? "" : ";expires=".concat(r.expires.toUTCString()),
                        c = null == r.maxAge ? "" : ";max-age=".concat(r.maxAge);
                    document.cookie = "".concat(e, "=").concat(encodeURIComponent(t), ";secure").concat(o).concat(i).concat(a).concat(l).concat(c)
                },
                eD = function(e, t, r) {
                    ek(e, t, r)
                },
                eI = function(e, t) {
                    ek(e, "", {
                        domain: t.domain,
                        path: t.path,
                        expires: new Date(0)
                    })
                },
                eN = window.Roblox["core-scripts"].environmentUrls,
                eT = r.n(eN),
                eR = function(e, t) {
                    eC(eE) && eI(eE, {
                        domain: eT().domain
                    });
                    var r = "",
                        n = [];
                    t.forEach(function(o, i) {
                        e.includes(o) ? r += "".concat(o, "=true&") : (r += "".concat(o, "=false&"), n.push(o)), i === t.length - 1 && (r = r.slice(0, -1))
                    }), n.forEach(function(e) {
                        eI(e, {
                            domain: eT().domain
                        })
                    }), eD(eE, r, {
                        maxAge: 15552e3,
                        domain: eT().domain
                    })
                },
                eL = function() {
                    var e = eC(eE);
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
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
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
            var eU = e_((0, ev.createModal)(), 2),
                eF = eU[0],
                eB = eU[1],
                eW = function(e) {
                    var t = e.nonEssentialCookieList,
                        r = e.essentialCookieList,
                        n = e.translate,
                        o = e.closeConsentTool,
                        i = eL(),
                        a = e_((0, eu.useState)(i), 2),
                        l = a[0],
                        c = a[1],
                        u = e_((0, eu.useState)(!1), 2),
                        s = u[0],
                        f = u[1],
                        d = e_((0, eu.useState)(!1), 2),
                        p = d[0],
                        y = d[1];
                    (0, eu.useEffect)(function() {
                        eB.open()
                    }, []);
                    var m = ed()({
                            hidden: !s
                        }),
                        v = ed()("cookie-consent-tool-collaps", {
                            on: p
                        }),
                        b = ed()("cookie-consent-tool-collaps font-header-2 text-emphasis ", {
                            on: s
                        }),
                        h = new(em())().getRobloxLocale(),
                        g = ea.urlService.getUrlWithLocale("string" == typeof ex ? ex : "", h),
                        w = (0, G.jsx)("div", {
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
                        O = (0, G.jsx)("div", {
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
                                className: v,
                                type: "button",
                                onClick: function() {
                                    y(!p)
                                },
                                children: (0, G.jsx)("span", {
                                    className: "font-header-2 text-emphasis",
                                    children: n("Heading.AnalyticsCookies")
                                })
                            }), (0, G.jsx)(ev.Toggle, {
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
                            children: [O, w]
                        }),
                        A = (0, G.jsxs)("div", {
                            className: "essential-cookie-section",
                            children: [(0, G.jsx)("button", {
                                className: b,
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
                        E = (0, G.jsxs)("div", {
                            className: "cookie-consent-tool-body",
                            children: [j, P, A, x, (0, G.jsx)(eA, {
                                isNonEssentialCookieListVisible: p,
                                translate: n
                            })]
                        });
                    return (0, G.jsx)(eF, {
                        title: n("Heading.CookieSettings"),
                        body: E,
                        actionButtonShow: !0,
                        actionButtonText: n("Action.SavePreferences"),
                        neutralButtonText: n("Action.Cancel"),
                        onAction: function() {
                            eR(l ? t : [], t), o(null)
                        },
                        onNeutral: function() {
                            o("banner")
                        },
                        id: "cookie-consent-tool-modal",
                        size: "lg"
                    })
                };

            function ez(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var eH = function(e) {
                    var t, r = e.nonEssentialCookieList,
                        n = e.essentialCookieList,
                        o = e.translate,
                        i = e.onCloseConsentTool,
                        a = (t = (0, eu.useState)(!1), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    l = !1;
                                try {
                                    for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                                } catch (e) {
                                    l = !0, n = e
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (l) throw n
                                    }
                                }
                                return i
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return ez(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ez(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        l = a[0],
                        c = a[1],
                        u = {
                            open: function() {
                                c(!0)
                            },
                            close: function() {
                                c(!1)
                            }
                        };
                    return [l ? (0, G.jsx)(eW, {
                        translate: o,
                        essentialCookieList: n,
                        nonEssentialCookieList: r,
                        closeConsentTool: function(e) {
                            u.close(), null == i || i(e)
                        }
                    }) : (0, G.jsx)("div", {}), u]
                },
                eV = window.Roblox["core-scripts"].guac;

            function eK(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var eX = function() {
                var e;
                return (e = function() {
                    var e;
                    return function(e, t) {
                        var r, n, o, i = {
                                label: 0,
                                sent: function() {
                                    if (1 & o[0]) throw o[1];
                                    return o[1]
                                },
                                trys: [],
                                ops: []
                            },
                            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                            return this
                        }), a;

                        function l(l) {
                            return function(c) {
                                var u = [l, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                    if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                    switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, n = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                i.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && i.label < o[1]) {
                                                i.label = o[1], o = u;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(u);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, i)
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
                                if (void 0 !== (e = t.sent())) return [2, e];
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
                        var i = e.apply(t, r);

                        function a(e) {
                            eK(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            eK(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                })()
            };

            function eG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eq(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function eY(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eG(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eG(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function e$(e) {
                var t = e.translate,
                    r = eY((0, eu.useState)([]), 2),
                    n = r[0],
                    o = r[1],
                    i = eY((0, eu.useState)([]), 2),
                    a = i[0],
                    l = i[1];
                (0, eu.useEffect)(function() {
                    var e;
                    (e = function() {
                        var e;
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
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
                                    return [4, eX()];
                                case 1:
                                    return (e = t.sent()).ShouldDisplayCookieBannerV3 && e.NonEssentialCookieList && (o(e.NonEssentialCookieList), l(e.EssentialCookieList)), [2]
                            }
                        })
                    }, function() {
                        var t = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var i = e.apply(t, r);

                            function a(e) {
                                eq(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                eq(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                }, []);
                var c = eY(eH({
                        nonEssentialCookieList: n,
                        essentialCookieList: a,
                        translate: t
                    }), 2),
                    u = c[0],
                    s = c[1];
                return a.length > 0 ? (0, G.jsxs)("div", {
                    children: [(0, G.jsx)("button", {
                        onClick: s.open,
                        className: "btn text-footer-nav footer-button-link",
                        type: "button",
                        "data-testid": "cookie-consent-link",
                        children: t("Heading.CookieSettings")
                    }), u]
                }) : null
            }
            e$.propTypes = {
                translate: er().func.isRequired
            };
            var eZ = window.Roblox["core-scripts"].util.url,
                eQ = window.Roblox["core-scripts"].meta.user,
                eJ = function() {
                    for (var e, t, r = 0, n = "", o = arguments.length; r < o; r++)(e = arguments[r]) && (t = function e(t) {
                        var r, n, o = "";
                        if ("string" == typeof t || "number" == typeof t) o += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var i = t.length;
                                for (r = 0; r < i; r++) t[r] && (n = e(t[r])) && (o && (o += " "), o += n)
                            } else
                                for (n in t) t[n] && (o && (o += " "), o += n);
                        return o
                    }(e)) && (n && (n += " "), n += t);
                    return n
                },
                e0 = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                e1 = function(e) {
                    var t = e.className;
                    return es().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: eJ("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                e2 = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                e3 = es().forwardRef(function(e, t) {
                    var r = e.name,
                        n = e.size,
                        o = e.className,
                        i = (e.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, o = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    i = Object.keys(e);
                                for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                                return o
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(e);
                                for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                            }
                            return o
                        }(e, ["name", "size", "className", "children"]));
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
                        ref: t,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: eJ("grow-0 shrink-0 basis-auto icon", r, e2[void 0 === n ? "Medium" : n], o)
                    }, i))
                });
            e3.displayName = "Icon";
            var e6 = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                e8 = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                e5 = function(e) {
                    var t = e.variant,
                        r = e.size,
                        n = e.isCircular,
                        o = e.className,
                        i = function(e, t) {
                            if (null == e) return {};
                            var r, n, o = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    i = Object.keys(e);
                                for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                                return o
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(e);
                                for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                            }
                            return o
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
                        className: eJ("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", e0, e8[t], e6[r], n && "radius-circle", o)
                    }, i), es().createElement(e1, null), es().createElement(e3, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function e4(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function e7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e9(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function te() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = e9(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : e9(t[e], null)
                        }
                    }
                }
            }

            function tt() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return eu.useCallback(te.apply(void 0, function(e) {
                    if (Array.isArray(e)) return e7(e)
                }(t) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return e7(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return e7(e, t)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function tr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tn(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function to(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        tn(e, t, r[t])
                    })
                }
                return e
            }

            function ti(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function ta(e) {
                return function(e) {
                    if (Array.isArray(e)) return tr(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tr(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tr(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tl(e) {
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
                                return tn({}, "__scope".concat(e), (t = to({}, r), o = null != (o = tn({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e, t) {
                                    var r = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var n = Object.getOwnPropertySymbols(e);
                                        r.push.apply(r, n)
                                    }
                                    return r
                                })(Object(o)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(o, e))
                                }), t))
                            }, [r, n])
                        }
                    };
                return n.scopeName = e, [function(t, n) {
                    var o = eu.createContext(n),
                        i = r.length;
                    r = ta(r).concat([n]);
                    var a = function(t) {
                        var r, n = t.scope,
                            a = t.children,
                            l = ti(t, ["scope", "children"]),
                            c = (null == n || null == (r = n[e]) ? void 0 : r[i]) || o,
                            u = eu.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, G.jsx)(c.Provider, {
                            value: u,
                            children: a
                        })
                    };
                    return a.displayName = t + "Provider", [a, function(r, a) {
                        var l, c = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o,
                            u = eu.useContext(c);
                        if (u) return u;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, tc.apply(void 0, [n].concat(ta(t)))]
            }

            function tc() {
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
                            return to({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return eu.useMemo(function() {
                            return tn({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var tu = (null == (V = globalThis) ? void 0 : V.document) ? eu.useLayoutEffect : function() {};

            function ts(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var tf = eu[" useId ".trim().toString()] || function() {},
                td = 0;

            function tp(e) {
                var t, r = (t = eu.useState(tf()), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                l = !1;
                            try {
                                for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                            } catch (e) {
                                l = !0, n = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (l) throw n
                                }
                            }
                            return i
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return ts(e, 2);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ts(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    n = r[0],
                    o = r[1];
                return tu(function() {
                    e || o(function(e) {
                        return null != e ? e : String(td++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function ty(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tm(e) {
                var t = eu.useRef(e);
                return eu.useEffect(function() {
                    t.current = e
                }), eu.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return ty(e)
                        }(n) || function(e) {
                            if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return ty(e, void 0);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ty(e, t)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function tv(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tb(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tv(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tv(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function th(e) {
                var t, r, n, o, i, a, l, c = e.prop,
                    u = e.defaultProp,
                    s = e.onChange,
                    f = void 0 === s ? function() {} : s,
                    d = tb((r = (t = {
                        defaultProp: u,
                        onChange: f
                    }).defaultProp, n = t.onChange, i = tb(o = eu.useState(r), 1)[0], a = eu.useRef(i), l = tm(n), eu.useEffect(function() {
                        a.current !== i && (l(i), a.current = i)
                    }, [i, a, l]), o), 2),
                    p = d[0],
                    y = d[1],
                    m = void 0 !== c,
                    v = m ? c : p,
                    b = tm(f);
                return [v, eu.useCallback(function(e) {
                    if (m) {
                        var t = "function" == typeof e ? e(c) : e;
                        t !== c && b(t)
                    } else y(e)
                }, [m, c, y, b])]
            }
            var tg = window.RadixUI["react-dismissable-layer"],
                tw = window.ReactDOM,
                tO = r.n(tw);

            function tj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tx(e) {
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

            function tS(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function tP(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function tA(e) {
                return function(e) {
                    if (Array.isArray(e)) return tj(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tj(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tj(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tE(e) {
                var t, r, n = (t = e, (r = eu.forwardRef(function(e, t) {
                        var r = e.children,
                            n = tP(e, ["children"]);
                        if (eu.isValidElement(r)) {
                            var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = tx({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            i = t[n];
                                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            i.apply(void 0, tA(t)), o.apply(void 0, tA(t))
                                        } : o && (r[n] = o) : "style" === n ? r[n] = tx({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                    }(n);
                                    return tx({}, e, r)
                                }(n, r.props);
                            return r.type !== eu.Fragment && (s.ref = t ? te(t, u) : u), eu.cloneElement(r, s)
                        }
                        return eu.Children.count(r) > 1 ? eu.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = eu.forwardRef(function(e, t) {
                        var r = e.children,
                            o = tP(e, ["children"]),
                            i = eu.Children.toArray(r),
                            a = i.find(tk);
                        if (a) {
                            var l = a.props.children,
                                c = i.map(function(e) {
                                    return e !== a ? e : eu.Children.count(l) > 1 ? eu.Children.only(null) : eu.isValidElement(l) ? l.props.children : null
                                });
                            return (0, G.jsx)(n, tS(tx({}, o), {
                                ref: t,
                                children: eu.isValidElement(l) ? eu.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, G.jsx)(n, tS(tx({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var tC = Symbol("radix.slottable");

            function tk(e) {
                return eu.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tC
            }

            function tD(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function tI(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        tD(e, t, r[t])
                    })
                }
                return e
            }

            function tN(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var tT = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = tE("Primitive.".concat(t)),
                    n = eu.forwardRef(function(e, n) {
                        var o = e.asChild,
                            i = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.keys(e);
                                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                                    return o
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                                }
                                return o
                            }(e, ["asChild"]),
                            a = o ? r : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, G.jsx)(a, tN(tI({}, i), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), tN(tI({}, e), tD({}, t, n))
            }, {});

            function tR(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tL(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || tM(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tM(e, t) {
                if (e) {
                    if ("string" == typeof e) return tR(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tR(e, t)
                }
            }
            var t_ = "focusScope.autoFocusOnMount",
                tU = "focusScope.autoFocusOnUnmount",
                tF = {
                    bubbles: !1,
                    cancelable: !0
                },
                tB = eu.forwardRef(function(e, t) {
                    var r, n, o = e.loop,
                        i = void 0 !== o && o,
                        a = e.trapped,
                        l = void 0 !== a && a,
                        c = e.onMountAutoFocus,
                        u = e.onUnmountAutoFocus,
                        s = function(e, t) {
                            if (null == e) return {};
                            var r, n, o = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    i = Object.keys(e);
                                for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                                return o
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(e);
                                for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                            }
                            return o
                        }(e, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        f = tL(eu.useState(null), 2),
                        d = f[0],
                        p = f[1],
                        y = tm(c),
                        m = tm(u),
                        v = eu.useRef(null),
                        b = tt(t, function(e) {
                            return p(e)
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
                                    if (!h.paused && d) {
                                        var t = e.target;
                                        d.contains(t) ? v.current = t : tH(v.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!h.paused && d) {
                                        var t = e.relatedTarget;
                                        null !== t && (d.contains(t) || tH(v.current, {
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
                                        for (var o, i = e[Symbol.iterator](); !(t = (o = i.next()).done); t = !0) o.value.removedNodes.length > 0 && tH(d)
                                    } catch (e) {
                                        r = !0, n = e
                                    } finally {
                                        try {
                                            t || null == i.return || i.return()
                                        } finally {
                                            if (r) throw n
                                        }
                                    }
                                }
                            });
                            return d && r.observe(d, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), r.disconnect()
                                }
                        }
                    }, [l, d, h.paused]), eu.useEffect(function() {
                        if (d) {
                            tV.add(h);
                            var e = document.activeElement;
                            if (!d.contains(e)) {
                                var t = new CustomEvent(t_, tF);
                                d.addEventListener(t_, y), d.dispatchEvent(t), t.defaultPrevented || (function(e) {
                                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = t.select,
                                        n = void 0 !== r && r,
                                        o = document.activeElement,
                                        i = !0,
                                        a = !1,
                                        l = void 0;
                                    try {
                                        for (var c, u = e[Symbol.iterator](); !(i = (c = u.next()).done); i = !0) {
                                            var s = c.value;
                                            if (tH(s, {
                                                    select: n
                                                }), document.activeElement !== o) return
                                        }
                                    } catch (e) {
                                        a = !0, l = e
                                    } finally {
                                        try {
                                            i || null == u.return || u.return()
                                        } finally {
                                            if (a) throw l
                                        }
                                    }
                                }(tW(d).filter(function(e) {
                                    return "A" !== e.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === e && tH(d))
                            }
                            return function() {
                                d.removeEventListener(t_, y), setTimeout(function() {
                                    var t = new CustomEvent(tU, tF);
                                    d.addEventListener(tU, m), d.dispatchEvent(t), t.defaultPrevented || tH(null != e ? e : document.body, {
                                        select: !0
                                    }), d.removeEventListener(tU, m), tV.remove(h)
                                }, 0)
                            }
                        }
                    }, [d, y, m, h]);
                    var g = eu.useCallback(function(e) {
                        if ((i || l) && !h.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                r = document.activeElement;
                            if (t && r) {
                                var n, o, a = e.currentTarget,
                                    c = tL([tz(o = tW(n = a), n), tz(o.reverse(), n)], 2),
                                    u = c[0],
                                    s = c[1];
                                u && s ? e.shiftKey || r !== s ? e.shiftKey && r === u && (e.preventDefault(), i && tH(s, {
                                    select: !0
                                })) : (e.preventDefault(), i && tH(u, {
                                    select: !0
                                })) : r === a && e.preventDefault()
                            }
                        }
                    }, [i, l, h.paused]);
                    return (0, G.jsx)(tT.div, (r = function(e) {
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
                        ref: b,
                        onKeyDown: g
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                        var r = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var n = Object.getOwnPropertySymbols(e);
                            r.push.apply(r, n)
                        }
                        return r
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function tW(e) {
                for (var t = [], r = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) t.push(r.currentNode);
                return t
            }

            function tz(e, t) {
                var r = !0,
                    n = !1,
                    o = void 0;
                try {
                    for (var i, a = e[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                        var l = i.value;
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
                        r || null == a.return || a.return()
                    } finally {
                        if (n) throw o
                    }
                }
            }

            function tH(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = t.select;
                if (e && e.focus) {
                    var n, o, i, a = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== a && (o = n = e, null != (i = HTMLInputElement) && "undefined" != typeof Symbol && i[Symbol.hasInstance] ? !!i[Symbol.hasInstance](o) : o instanceof i) && "select" in n && void 0 !== r && r && e.select()
                }
            }
            tB.displayName = "FocusScope";
            var tV = (e = [], {
                add: function(t) {
                    var r = e[0];
                    t !== r && (null == r || r.pause()), (e = tK(e, t)).unshift(t)
                },
                remove: function(t) {
                    var r;
                    null == (r = (e = tK(e, t))[0]) || r.resume()
                }
            });

            function tK(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return tR(e)
                    }(e) || function(e) {
                        if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || tM(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r.indexOf(t);
                return -1 !== n && r.splice(n, 1), r
            }

            function tX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var tG = eu.forwardRef(function(e, t) {
                var r, n, o, i, a, l = e.container,
                    c = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = function(e, t) {
                            if (null == e) return {};
                            var r, n, o = {},
                                i = Object.keys(e);
                            for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                            return o
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var i = Object.getOwnPropertySymbols(e);
                            for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                        }
                        return o
                    }(e, ["container"]),
                    u = (r = eu.useState(!1), function(e) {
                        if (Array.isArray(e)) return e
                    }(r) || function(e, t) {
                        var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                l = !1;
                            try {
                                for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                            } catch (e) {
                                l = !0, n = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (l) throw n
                                }
                            }
                            return i
                        }
                    }(r, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return tX(e, 2);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tX(e, t)
                        }
                    }(r, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    s = u[0],
                    f = u[1];
                tu(function() {
                    return f(!0)
                }, []);
                var d = l || s && (null == (a = globalThis) || null == (i = a.document) ? void 0 : i.body);
                return d ? tO().createPortal((0, G.jsx)(tT.div, (n = function(e) {
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
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(o)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                }), n)), d) : null
            });

            function tq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tY(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tq(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tq(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            tG.displayName = "Portal";
            var t$ = function(e) {
                var t, r, n, o, i, a, l, c, u, s, f, d, p, y, m, v, b, h = e.present,
                    g = e.children,
                    w = (t = h, i = (o = tY(eu.useState(), 2))[0], a = o[1], l = eu.useRef({}), c = eu.useRef(t), u = eu.useRef("none"), f = (s = tY((r = t ? "mounted" : "unmounted", n = {
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
                    }, r)), 2))[0], d = s[1], eu.useEffect(function() {
                        var e = tZ(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), tu(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = tZ(e);
                            t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : r && n !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), c.current = t
                        }
                    }, [t, d]), tu(function() {
                        if (i) {
                            var e, t, r = null != (t = i.ownerDocument.defaultView) ? t : window,
                                n = function(t) {
                                    var n = tZ(l.current).includes(t.animationName);
                                    if (t.target === i && n && (d("ANIMATION_END"), !c.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", e = r.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (u.current = tZ(l.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", n), i.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(e), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", n), i.removeEventListener("animationend", n)
                                }
                        }
                        d("ANIMATION_END")
                    }, [i, d]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: eu.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    O = "function" == typeof g ? g({
                        present: w.isPresent
                    }) : eu.Children.only(g),
                    j = tt(w.ref, (b = (v = null == (y = Object.getOwnPropertyDescriptor((p = O).props, "ref")) ? void 0 : y.get) && "isReactWarning" in v && v.isReactWarning) ? p.ref : (b = (v = null == (m = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : m.get) && "isReactWarning" in v && v.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || w.isPresent ? eu.cloneElement(O, {
                    ref: j
                }) : null
            };

            function tZ(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            t$.displayName = "Presence";
            var tQ = window.RadixUI["react-focus-guards"],
                tJ = function() {
                    return (tJ = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function t0(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
                return r
            }
            var t1 = "right-scroll-bar-position",
                t2 = "width-before-scroll-bar";

            function t3(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var t6 = "undefined" != typeof window ? eu.useLayoutEffect : eu.useEffect,
                t8 = new WeakMap,
                t5 = (void 0 === n && (n = {}), (void 0 === o && (o = function(e) {
                    return e
                }), i = [], a = !1, l = {
                    read: function() {
                        if (a) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return i.length ? i[i.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = o(e, a);
                        return i.push(t),
                            function() {
                                i = i.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (a = !0; i.length;) {
                            var t = i;
                            i = [], t.forEach(e)
                        }
                        i = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return i
                            }
                        }
                    },
                    assignMedium: function(e) {
                        a = !0;
                        var t = [];
                        if (i.length) {
                            var r = i;
                            i = [], r.forEach(e), t = i
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            o = function() {
                                return Promise.resolve().then(n)
                            };
                        o(), i = {
                            push: function(e) {
                                t.push(e), o()
                            },
                            filter: function(e) {
                                return t = t.filter(e), i
                            }
                        }
                    }
                }).options = tJ({
                    async: !0,
                    ssr: !1
                }, n), l),
                t4 = function() {},
                t7 = eu.forwardRef(function(e, t) {
                    var r, n, o, i, a = eu.useRef(null),
                        l = eu.useState({
                            onScrollCapture: t4,
                            onWheelCapture: t4,
                            onTouchMoveCapture: t4
                        }),
                        c = l[0],
                        u = l[1],
                        s = e.forwardProps,
                        f = e.children,
                        d = e.className,
                        p = e.removeScrollBar,
                        y = e.enabled,
                        m = e.shards,
                        v = e.sideCar,
                        b = e.noRelative,
                        h = e.noIsolation,
                        g = e.inert,
                        w = e.allowPinchZoom,
                        O = e.as,
                        j = e.gapMode,
                        x = t0(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = (r = [a, t], n = function(e) {
                            return r.forEach(function(t) {
                                return t3(t, e)
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
                        })[0]).callback = n, i = o.facade, t6(function() {
                            var e = t8.get(i);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    o = i.current;
                                t.forEach(function(e) {
                                    n.has(e) || t3(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || t3(e, o)
                                })
                            }
                            t8.set(i, r)
                        }, [r]), i),
                        P = tJ(tJ({}, x), c);
                    return eu.createElement(eu.Fragment, null, y && eu.createElement(v, {
                        sideCar: t5,
                        removeScrollBar: p,
                        shards: m,
                        noRelative: b,
                        noIsolation: h,
                        inert: g,
                        setCallbacks: u,
                        allowPinchZoom: !!w,
                        lockRef: a,
                        gapMode: j
                    }), s ? eu.cloneElement(eu.Children.only(f), tJ(tJ({}, P), {
                        ref: S
                    })) : eu.createElement(void 0 === O ? "div" : O, tJ({}, P, {
                        className: d,
                        ref: S
                    }), f))
                });
            t7.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, t7.classNames = {
                fullWidth: t2,
                zeroRight: t1
            };
            var t9 = function(e) {
                var t = e.sideCar,
                    r = t0(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return eu.createElement(n, tJ({}, r))
            };
            t9.isSideCarExport = !0;
            var re = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = K || r.nc;
                                    return t && e.setAttribute("nonce", t), e
                                }())) {
                                var o, i;
                                (o = t).styleSheet ? o.styleSheet.cssText = n : o.appendChild(document.createTextNode(n)), i = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(i)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                rt = function() {
                    var e = re();
                    return function(t, r) {
                        eu.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                rr = function() {
                    var e = rt();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                rn = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                ro = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                ri = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [ro(r), ro(n), ro(o)]
                },
                ra = function(e) {
                    if (void 0 === e && (e = "margin"), "undefined" == typeof window) return rn;
                    var t = ri(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                rl = rr(),
                rc = "data-scroll-locked",
                ru = function(e, t, r, n) {
                    var o = e.left,
                        i = e.top,
                        a = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(rc, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(t1, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(t2, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(t1, " .").concat(t1, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(t2, " .").concat(t2, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(rc, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                rs = function() {
                    var e = parseInt(document.body.getAttribute(rc) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                rf = function() {
                    eu.useEffect(function() {
                        return document.body.setAttribute(rc, (rs() + 1).toString()),
                            function() {
                                var e = rs() - 1;
                                e <= 0 ? document.body.removeAttribute(rc) : document.body.setAttribute(rc, e.toString())
                            }
                    }, [])
                },
                rd = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        o = void 0 === n ? "margin" : n;
                    rf();
                    var i = eu.useMemo(function() {
                        return ra(o)
                    }, [o]);
                    return eu.createElement(rl, {
                        styles: ru(i, !t, o, r ? "" : "!important")
                    })
                },
                rp = !1;
            if ("undefined" != typeof window) try {
                var ry = Object.defineProperty({}, "passive", {
                    get: function() {
                        return rp = !0, !0
                    }
                });
                window.addEventListener("test", ry, ry), window.removeEventListener("test", ry, ry)
            } catch (e) {
                rp = !1
            }
            var rm = !!rp && {
                passive: !1
            };

            function rv(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var rb = function(e, t) {
                    if (!rv(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                rh = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("undefined" != typeof ShadowRoot && rv(n, ShadowRoot) && (n = n.host), rg(e, n)) {
                            var o = rw(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                rg = function(e, t) {
                    return "v" === e ? rb(t, "overflowY") : rb(t, "overflowX")
                },
                rw = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                rO = function(e, t, r, n, o) {
                    var i, a = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                        l = a * n,
                        c = r.target,
                        u = t.contains(c),
                        s = !1,
                        f = l > 0,
                        d = 0,
                        p = 0;
                    do {
                        if (!c) break;
                        var y = rw(e, c),
                            m = y[0],
                            v = y[1] - y[2] - a * m;
                        (m || v) && rg(e, c) && (d += v, p += m);
                        var b = c.parentNode;
                        c = b && b.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? b.host : b
                    } while (!u && c !== document.body || u && (t.contains(c) || t === c));
                    return f && (o && 1 > Math.abs(d) || !o && l > d) ? s = !0 : !f && (o && 1 > Math.abs(p) || !o && -l > p) && (s = !0), s
                },
                rj = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                rx = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                rS = function(e) {
                    return e && "current" in e ? e.current : e
                },
                rP = 0,
                rA = [],
                rE = (c = function(e) {
                    var t = eu.useRef([]),
                        r = eu.useRef([0, 0]),
                        n = eu.useRef(),
                        o = eu.useState(rP++)[0],
                        i = eu.useState(rr)[0],
                        a = eu.useRef(e);
                    eu.useEffect(function() {
                        a.current = e
                    }, [e]), eu.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, o = 0, i = t.length; o < i; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(rS), !0).filter(Boolean);
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
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var o, i = rj(e),
                                l = r.current,
                                c = "deltaX" in e ? e.deltaX : l[0] - i[0],
                                u = "deltaY" in e ? e.deltaY : l[1] - i[1],
                                s = e.target,
                                f = Math.abs(c) > Math.abs(u) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var d = rh(f, s);
                            if (!d) return !0;
                            if (d ? o = f : (o = "v" === f ? "h" : "v", d = rh(f, s)), !d) return !1;
                            if (!n.current && "changedTouches" in e && (c || u) && (n.current = o), !o) return !0;
                            var p = n.current || o;
                            return rO(p, t, e, "h" === p ? c : u, !0)
                        }, []),
                        c = eu.useCallback(function(e) {
                            if (rA.length && rA[rA.length - 1] === i) {
                                var r = "deltaY" in e ? rx(e) : rj(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var o = (a.current.shards || []).map(rS).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        u = eu.useCallback(function(e, r, n, o) {
                            var i = {
                                name: e,
                                delta: r,
                                target: n,
                                should: o,
                                shadowParent: function(e) {
                                    for (var t, r, n = null; null !== e;) t = e, (null != (r = ShadowRoot) && "undefined" != typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r) && (n = e.host, e = e.host), e = e.parentNode;
                                    return n
                                }(n)
                            };
                            t.current.push(i), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== i
                                })
                            }, 1)
                        }, []),
                        s = eu.useCallback(function(e) {
                            r.current = rj(e), n.current = void 0
                        }, []),
                        f = eu.useCallback(function(t) {
                            u(t.type, rx(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        d = eu.useCallback(function(t) {
                            u(t.type, rj(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    eu.useEffect(function() {
                        return rA.push(i), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: d
                            }), document.addEventListener("wheel", c, rm), document.addEventListener("touchmove", c, rm), document.addEventListener("touchstart", s, rm),
                            function() {
                                rA = rA.filter(function(e) {
                                    return e !== i
                                }), document.removeEventListener("wheel", c, rm), document.removeEventListener("touchmove", c, rm), document.removeEventListener("touchstart", s, rm)
                            }
                    }, []);
                    var p = e.removeScrollBar,
                        y = e.inert;
                    return eu.createElement(eu.Fragment, null, y ? eu.createElement(i, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, p ? eu.createElement(rd, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, t5.useMedium(c), t9),
                rC = eu.forwardRef(function(e, t) {
                    return eu.createElement(t7, tJ({}, e, {
                        ref: t,
                        sideCar: rE
                    }))
                });
            rC.classNames = t7.classNames;
            var rk = new WeakMap,
                rD = new WeakMap,
                rI = {},
                rN = 0,
                rT = function(e) {
                    return e && (e.host || rT(e.parentNode))
                },
                rR = function(e, t, r, n) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = rT(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    rI[r] || (rI[r] = new WeakMap);
                    var i = rI[r],
                        a = [],
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
                                    c = (rk.get(e) || 0) + 1,
                                    u = (i.get(e) || 0) + 1;
                                rk.set(e, c), i.set(e, u), a.push(e), 1 === c && o && rD.set(e, !0), 1 === u && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), rN++,
                        function() {
                            a.forEach(function(e) {
                                var t = rk.get(e) - 1,
                                    o = i.get(e) - 1;
                                rk.set(e, t), i.set(e, o), t || (rD.has(e) || e.removeAttribute(n), rD.delete(e)), o || e.removeAttribute(r)
                            }), --rN || (rk = new WeakMap, rk = new WeakMap, rD = new WeakMap, rI = {})
                        }
                },
                rL = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("undefined" == typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), rR(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function rM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r_(e) {
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

            function rU(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function rF(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function rB(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rM(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rM(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rW = "Dialog",
                rz = rB(tl(rW), 2),
                rH = rz[0];
            rz[1];
            var rV = rB(rH(rW), 2),
                rK = rV[0],
                rX = rV[1],
                rG = function(e) {
                    var t = e.__scopeDialog,
                        r = e.children,
                        n = e.open,
                        o = e.defaultOpen,
                        i = e.onOpenChange,
                        a = e.modal,
                        l = eu.useRef(null),
                        c = eu.useRef(null),
                        u = rB(th({
                            prop: n,
                            defaultProp: o,
                            onChange: i
                        }), 2),
                        s = u[0],
                        f = u[1];
                    return (0, G.jsx)(rK, {
                        scope: t,
                        triggerRef: l,
                        contentRef: c,
                        contentId: tp(),
                        titleId: tp(),
                        descriptionId: tp(),
                        open: void 0 !== s && s,
                        onOpenChange: f,
                        onOpenToggle: eu.useCallback(function() {
                            return f(function(e) {
                                return !e
                            })
                        }, [f]),
                        modal: void 0 === a || a,
                        children: r
                    })
                };
            rG.displayName = rW;
            var rq = "DialogTrigger";
            eu.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = rF(e, ["__scopeDialog"]),
                    o = rX(rq, r),
                    i = tt(t, o.triggerRef);
                return (0, G.jsx)(tT.button, rU(r_({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": no(o.open)
                }, n), {
                    ref: i,
                    onClick: e4(e.onClick, o.onOpenToggle)
                }))
            }).displayName = rq;
            var rY = "DialogPortal",
                r$ = rB(rH(rY, {
                    forceMount: void 0
                }), 2),
                rZ = r$[0],
                rQ = r$[1],
                rJ = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        i = rX(rY, t);
                    return (0, G.jsx)(rZ, {
                        scope: t,
                        forceMount: r,
                        children: eu.Children.map(n, function(e) {
                            return (0, G.jsx)(t$, {
                                present: r || i.open,
                                children: (0, G.jsx)(tG, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            rJ.displayName = rY;
            var r0 = "DialogOverlay",
                r1 = eu.forwardRef(function(e, t) {
                    var r = rQ(r0, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = rF(e, ["forceMount"]),
                        a = rX(r0, e.__scopeDialog);
                    return a.modal ? (0, G.jsx)(t$, {
                        present: o || a.open,
                        children: (0, G.jsx)(r3, rU(r_({}, i), {
                            ref: t
                        }))
                    }) : null
                });
            r1.displayName = r0;
            var r2 = tE("DialogOverlay.RemoveScroll"),
                r3 = eu.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = rF(e, ["__scopeDialog"]),
                        o = rX(r0, r);
                    return (0, G.jsx)(rC, {
                        as: r2,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, G.jsx)(tT.div, rU(r_({
                            "data-state": no(o.open)
                        }, n), {
                            ref: t,
                            style: r_({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                r6 = "DialogContent",
                r8 = eu.forwardRef(function(e, t) {
                    var r = rQ(r6, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = rF(e, ["forceMount"]),
                        a = rX(r6, e.__scopeDialog);
                    return (0, G.jsx)(t$, {
                        present: o || a.open,
                        children: a.modal ? (0, G.jsx)(r5, rU(r_({}, i), {
                            ref: t
                        })) : (0, G.jsx)(r4, rU(r_({}, i), {
                            ref: t
                        }))
                    })
                });
            r8.displayName = r6;
            var r5 = eu.forwardRef(function(e, t) {
                    var r = rX(r6, e.__scopeDialog),
                        n = eu.useRef(null),
                        o = tt(t, r.contentRef, n);
                    return eu.useEffect(function() {
                        var e = n.current;
                        if (e) return rL(e)
                    }, []), (0, G.jsx)(r7, rU(r_({}, e), {
                        ref: o,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: e4(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: e4(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: e4(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                r4 = eu.forwardRef(function(e, t) {
                    var r = rX(r6, e.__scopeDialog),
                        n = eu.useRef(!1),
                        o = eu.useRef(!1);
                    return (0, G.jsx)(r7, rU(r_({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var i, a;
                            null == (i = e.onCloseAutoFocus) || i.call(e, t), t.defaultPrevented || (n.current || null == (a = r.triggerRef.current) || a.focus(), t.preventDefault()), n.current = !1, o.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (i = e.onInteractOutside) || i.call(e, t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                            var i, a, l = t.target;
                            (null == (a = r.triggerRef.current) ? void 0 : a.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                        }
                    }))
                }),
                r7 = eu.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        i = e.onCloseAutoFocus,
                        a = rF(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = rX(r6, r),
                        c = eu.useRef(null),
                        u = tt(t, c);
                    return (0, tQ.useFocusGuards)(), (0, G.jsxs)(G.Fragment, {
                        children: [(0, G.jsx)(tB, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: i,
                            children: (0, G.jsx)(tg.DismissableLayer, rU(r_({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": no(l.open)
                            }, a), {
                                ref: u,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, G.jsxs)(G.Fragment, {
                            children: [(0, G.jsx)(nc, {
                                titleId: l.titleId
                            }), (0, G.jsx)(nu, {
                                contentRef: c,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                r9 = "DialogTitle",
                ne = eu.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = rF(e, ["__scopeDialog"]),
                        o = rX(r9, r);
                    return (0, G.jsx)(tT.h2, rU(r_({
                        id: o.titleId
                    }, n), {
                        ref: t
                    }))
                });
            ne.displayName = r9;
            var nt = "DialogDescription";
            eu.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = rF(e, ["__scopeDialog"]),
                    o = rX(nt, r);
                return (0, G.jsx)(tT.p, rU(r_({
                    id: o.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = nt;
            var nr = "DialogClose",
                nn = eu.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = rF(e, ["__scopeDialog"]),
                        o = rX(nr, r);
                    return (0, G.jsx)(tT.button, rU(r_({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: e4(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function no(e) {
                return e ? "open" : "closed"
            }
            nn.displayName = nr;
            var ni = "DialogTitleWarning",
                na = rB((u = {
                    contentName: r6,
                    titleName: r9,
                    docsSlug: "dialog"
                }, s = eu.createContext(u), (f = function(e) {
                    var t = e.children,
                        r = ti(e, ["children"]),
                        n = eu.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, G.jsx)(s.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = ni + "Provider", [f, function(e) {
                    var t = eu.useContext(s);
                    if (t) return t;
                    if (void 0 !== u) return u;
                    throw Error("`".concat(e, "` must be used within `").concat(ni, "`"))
                }]), 2),
                nl = (na[0], na[1]),
                nc = function(e) {
                    var t = e.titleId,
                        r = nl(ni),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return eu.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                nu = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = nl("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return eu.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(o))
                    }, [o, t, r]), null
                };

            function ns(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nf(e) {
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

            function nd(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function np(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function ny(e) {
                return function(e) {
                    if (Array.isArray(e)) return ns(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ns(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ns(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nm(e) {
                var t, r, n = (t = e, (r = eu.forwardRef(function(e, t) {
                        var r = e.children,
                            n = np(e, ["children"]);
                        if (eu.isValidElement(r)) {
                            var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = nf({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            i = t[n];
                                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = i.apply(void 0, ny(t));
                                            return o.apply(void 0, ny(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = nf({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                    }(n);
                                    return nf({}, e, r)
                                }(n, r.props);
                            return r.type !== eu.Fragment && (s.ref = t ? te(t, u) : u), eu.cloneElement(r, s)
                        }
                        return eu.Children.count(r) > 1 ? eu.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = eu.forwardRef(function(e, t) {
                        var r = e.children,
                            o = np(e, ["children"]),
                            i = eu.Children.toArray(r),
                            a = i.find(nb);
                        if (a) {
                            var l = a.props.children,
                                c = i.map(function(e) {
                                    return e !== a ? e : eu.Children.count(l) > 1 ? eu.Children.only(null) : eu.isValidElement(l) ? l.props.children : null
                                });
                            return (0, G.jsx)(n, nd(nf({}, o), {
                                ref: t,
                                children: eu.isValidElement(l) ? eu.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, G.jsx)(n, nd(nf({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var nv = Symbol("radix.slottable");

            function nb(e) {
                return eu.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nv
            }

            function nh(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ng(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        nh(e, t, r[t])
                    })
                }
                return e
            }

            function nw(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var nO = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r = nm("Primitive.".concat(t)),
                    n = eu.forwardRef(function(e, n) {
                        var o = e.asChild,
                            i = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.keys(e);
                                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                                    return o
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                                }
                                return o
                            }(e, ["asChild"]),
                            a = o ? r : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, G.jsx)(a, nw(ng({}, i), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), nw(ng({}, e), nh({}, t, n))
            }, {});

            function nj(e) {
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
            var nx = Object.freeze({
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
                nS = eu.forwardRef(function(e, t) {
                    var r, n;
                    return (0, G.jsx)(nO.span, (r = nj({}, e), n = n = {
                        ref: t,
                        style: nj({}, nx, e.style)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                        var r = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var n = Object.getOwnPropertySymbols(e);
                            r.push.apply(r, n)
                        }
                        return r
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function nP(e) {
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

            function nA(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }
            nS.displayName = "VisuallyHidden";
            var nE = (0, eu.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                nC = function() {
                    var e = (0, eu.useContext)(nE);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                nk = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                nD = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                nI = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                nN = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.children,
                        o = e.size,
                        i = e.type,
                        a = void 0 === i ? "Default" : i,
                        l = e.isModal,
                        c = e.hasCloseAffordance,
                        u = e.closeLabel,
                        s = e.hasMarginTop,
                        f = void 0 === s || s,
                        d = e.hasMarginBottom,
                        p = void 0 === d || d,
                        y = e.hasDescription,
                        m = void 0 !== y && y,
                        v = e.experimentalDisablePointerEventsStylingOnBody,
                        b = void 0 !== v && v,
                        h = (0, eu.useMemo)(function() {
                            return {
                                size: o,
                                isModal: l,
                                type: a,
                                hasCloseAffordance: c,
                                closeLabel: u,
                                hasMarginTop: f,
                                hasMarginBottom: p,
                                hasDescription: m
                            }
                        }, [o, l, a, c, u, f, p, m]);
                    return (0, eu.useEffect)(function() {
                        b && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [b, t]), es().createElement(nE.Provider, {
                        value: h
                    }, es().createElement(rG, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            nN.displayName = "Dialog";
            var nT = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    o = e.overlayClassName,
                    i = e.overlayStyle,
                    a = e.onOpenAutoFocus,
                    l = nA(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = nC(),
                    u = c.size,
                    s = c.isModal,
                    f = c.hasCloseAffordance,
                    d = c.closeLabel,
                    p = c.hasDescription,
                    y = eJ("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
                    m = eJ("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return es().createElement(rJ, null, es().createElement(r1, {
                    className: y,
                    style: i
                }, es().createElement(r8, nP({
                    className: m,
                    "data-size": u,
                    style: n,
                    onOpenAutoFocus: a
                }, !p && {
                    "aria-describedby": void 0
                }, l), f && es().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, es().createElement(nn, {
                    asChild: !0
                }, es().createElement(e5, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": d
                }))), t)))
            };
            nT.displayName = "DialogContent";
            var nR = function(e) {
                var t = e.children,
                    r = e.className,
                    n = nA(e, ["children", "className"]),
                    o = nC(),
                    i = o.size,
                    a = o.hasMarginTop,
                    l = o.hasMarginBottom,
                    c = eJ(nk[i], a && nD[i], l && nI[i], r);
                return es().createElement("div", nP({
                    className: c
                }, n), t)
            };
            nR.displayName = "DialogBody";
            var nL = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    o = nA(e, ["children", "className", "hidden"]),
                    i = es().createElement(ne, nP({
                        className: r
                    }, o), t);
                return n ? es().createElement(nS, null, i) : i
            };
            nL.displayName = "DialogTitle";
            var nM = function(e) {
                var t = e.children,
                    r = e.className,
                    n = nA(e, ["children", "className"]),
                    o = nC().size,
                    i = eJ(nk[o], nI[o], r);
                return es().createElement("div", nP({
                    className: i
                }, n), t)
            };
            nM.displayName = "DialogFooter";
            var n_ = function(e) {
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

            function nU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nF(e) {
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

            function nB(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function nW(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function nz(e) {
                return function(e) {
                    if (Array.isArray(e)) return nU(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nU(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nU(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nH(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var nV = Symbol.for("react.lazy"),
                nK = eu[" use ".trim().toString()];

            function nX(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : nH(e)) === "object" && "$$typeof" in e && e.$$typeof === nV && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : nH(t)) === "object" && null !== t && "then" in t
            }
            var nG = ((t = eu.forwardRef(function(e, t) {
                    var r = e.children,
                        n = nW(e, ["children"]);
                    if (nX(r) && "function" == typeof nK && (r = nK(r._payload)), eu.isValidElement(r)) {
                        var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = nF({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        i = t[n];
                                    /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = i.apply(void 0, nz(t));
                                        return o.apply(void 0, nz(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = nF({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                }(n);
                                return nF({}, e, r)
                            }(n, r.props);
                        return r.type !== eu.Fragment && (s.ref = t ? te(t, u) : u), eu.cloneElement(r, s)
                    }
                    return eu.Children.count(r) > 1 ? eu.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), d = t, (p = eu.forwardRef(function(e, t) {
                    var r = e.children,
                        n = nW(e, ["children"]);
                    nX(r) && "function" == typeof nK && (r = nK(r._payload));
                    var o = eu.Children.toArray(r),
                        i = o.find(nY);
                    if (i) {
                        var a = i.props.children,
                            l = o.map(function(e) {
                                return e !== i ? e : eu.Children.count(a) > 1 ? eu.Children.only(null) : eu.isValidElement(a) ? a.props.children : null
                            });
                        return (0, G.jsx)(d, nB(nF({}, n), {
                            ref: t,
                            children: eu.isValidElement(a) ? eu.cloneElement(a, void 0, l) : null
                        }))
                    }
                    return (0, G.jsx)(d, nB(nF({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), p),
                nq = Symbol("radix.slottable");

            function nY(e) {
                return eu.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nq
            }

            function n$(e) {
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

            function nZ(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function nQ(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }
            var nJ = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                n0 = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                n1 = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                n2 = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                n3 = (0, eu.forwardRef)(function(e, t) {
                    var r = e.children,
                        n = e.className,
                        o = e.style,
                        i = e.isDisabled,
                        a = void 0 !== i && i,
                        l = e.isLoading,
                        c = void 0 !== l && l,
                        u = e.icon,
                        s = e.size,
                        f = void 0 === s ? "Large" : s,
                        d = e.variant,
                        p = void 0 === d ? "Emphasis" : d,
                        y = e.asChild,
                        m = nQ(e, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        v = eJ("foundation-web-button", a ? "opacity-[0.5]" : [e0, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", n0[f], a ? n2[p] : n1[p], n),
                        b = n$({
                            textDecoration: "none"
                        }, o),
                        h = function(e) {
                            return es().createElement(es().Fragment, null, es().createElement(e1, null), c && es().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, es().createElement(n_, {
                                width: nJ[f],
                                height: nJ[f]
                            })), es().createElement("span", {
                                className: eJ("flex items-center min-width-0", "Large" === f || "Medium" === f ? "gap-small" : "gap-xsmall", c && "invisible")
                            }, u && es().createElement(e3, {
                                name: u,
                                size: f
                            }), es().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (y) {
                        m.as;
                        var g = nQ(m, ["as"]),
                            w = es().Children.only(r);
                        return es().createElement(nG, nZ(n$({
                            ref: t
                        }, g), {
                            className: v,
                            style: b,
                            "aria-disabled": a || void 0
                        }), es().cloneElement(w, {}, h(w.props.children)))
                    }
                    if ("a" === m.as) {
                        m.as;
                        var O = m.href,
                            j = nQ(m, ["as", "href"]);
                        return es().createElement("a", nZ(n$({
                            ref: t
                        }, j), {
                            "aria-disabled": a,
                            href: a ? void 0 : O,
                            className: v,
                            style: b
                        }), h(r))
                    }
                    m.as;
                    var x = nQ(m, ["as"]);
                    return es().createElement("button", nZ(n$({
                        ref: t,
                        type: "button"
                    }, x), {
                        disabled: a,
                        className: v,
                        style: b
                    }), h(r))
                }),
                n6 = window.Roblox["core-scripts"].http.http,
                n8 = function(e, t) {
                    var r = "".concat(eT().apiGatewayUrl, "/access-management/v1/upsell-feature-access"),
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

            function n5(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function n4(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            n5(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            n5(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function n7(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
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

            function n9(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var oe = function(e, t) {
                    var r;
                    return (r = function() {
                        var r;
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
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
                                    return r = n8(e, t), [4, n6.get(r)];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(n, o) {
                            var i = r.apply(e, t);

                            function a(e) {
                                n9(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                n9(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                ot = '<a href="https://en.help.roblox.com/hc/articles/28943243301780" target="_blank" rel="noreferrer" class="text-link">',
                or = "<a href=",
                on = function(e) {
                    return " onclick=\"if(window.location.pathname.includes('/my/account')){event.preventDefault();window.location.href='".concat(e, '\';window.location.reload();}" class="text-link">')
                },
                oo = "</a>",
                oi = "<br />";

            function oa(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var ol = function(e) {
                var t = e.showModal,
                    r = e.onModalClose,
                    n = e.translate,
                    o = e.intl,
                    i = (0, q.useQuery)({
                        queryKey: ["yourPrivacyChoicesModal"],
                        queryFn: function() {
                            var e;
                            return (e = function() {
                                var e, t, r, n, o, i;
                                return function(e, t) {
                                    var r, n, o, i = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & o[0]) throw o[1];
                                                return o[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                    return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                        return this
                                    }), a;

                                    function l(l) {
                                        return function(c) {
                                            var u = [l, c];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                                if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                                switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                                    case 0:
                                                    case 1:
                                                        o = u;
                                                        break;
                                                    case 4:
                                                        return i.label++, {
                                                            value: u[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        i.label++, n = u[1], u = [0];
                                                        continue;
                                                    case 7:
                                                        u = i.ops.pop(), i.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                            i = 0;
                                                            continue
                                                        }
                                                        if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                            i.label = u[1];
                                                            break
                                                        }
                                                        if (6 === u[0] && i.label < o[1]) {
                                                            i.label = o[1], o = u;
                                                            break
                                                        }
                                                        if (o && i.label < o[2]) {
                                                            i.label = o[2], i.ops.push(u);
                                                            break
                                                        }
                                                        o[2] && i.ops.pop(), i.trys.pop();
                                                        continue
                                                }
                                                u = t.call(e, i)
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
                                            if (r = null != (t = null == (e = (0, eQ.authenticatedUser)()) ? void 0 : e.isAuthenticated) && t, n = !!navigator.globalPrivacyControl, !r) return [3, 2];
                                            return [4, n4(function() {
                                                var e;
                                                return n7(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return e = {
                                                                withCredentials: !0,
                                                                url: "".concat(eT().userSettingsApi, "/v1/user-settings/gpc")
                                                            }, [4, n6.post(e)];
                                                        case 1:
                                                            return t.sent(), [2]
                                                    }
                                                })
                                            })()];
                                        case 1:
                                            a.sent(), a.label = 2;
                                        case 2:
                                            if (o = !1, !r) return [3, 4];
                                            return [4, oe("ShouldShowAdsSettings", "account_management/UserSettingsPolicy")];
                                        case 3:
                                            o = "Granted" === a.sent().access, a.label = 4;
                                        case 4:
                                            if (i = !1, !r) return [3, 6];
                                            return [4, n4(function() {
                                                return n7(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            return [4, n6.get({
                                                                retryable: !0,
                                                                withCredentials: !0,
                                                                url: "".concat(eT().userSettingsApi, "/v1/user-settings")
                                                            })];
                                                        case 1:
                                                            return [2, e.sent().data]
                                                    }
                                                })
                                            })()];
                                        case 5:
                                            i = "Enabled" === a.sent().allowSellShareData, a.label = 6;
                                        case 6:
                                            return [2, {
                                                isGpcDetected: n,
                                                canUserManageAdsSettings: o,
                                                isAdsSellShareDataEnabled: i
                                            }]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    r = arguments;
                                return new Promise(function(n, o) {
                                    var i = e.apply(t, r);

                                    function a(e) {
                                        oa(i, n, o, a, l, "next", e)
                                    }

                                    function l(e) {
                                        oa(i, n, o, a, l, "throw", e)
                                    }
                                    a(void 0)
                                })
                            })()
                        },
                        enabled: t,
                        cacheTime: 0
                    }),
                    a = i.data,
                    l = i.isLoading,
                    c = i.isError;
                return (0, G.jsx)(nN, {
                    open: t,
                    onOpenChange: r,
                    size: "Small",
                    isModal: !0,
                    hasCloseAffordance: !0,
                    closeLabel: "Action.Close",
                    children: (0, G.jsx)(nT, {
                        children: (0, G.jsxs)(es().Fragment, {
                            children: [(0, G.jsxs)(nR, {
                                children: [l ? (0, G.jsx)(nL, {
                                    hidden: !0,
                                    className: "text-heading-small",
                                    children: n("Description.Loading")
                                }) : (0, G.jsx)(nL, {
                                    className: "text-heading-small",
                                    children: c ? n("Title.Error") : a.isGpcDetected ? n("Title.GpcDetected") : n("Title.NoGpcDetected")
                                }), function() {
                                    if (l) return (0, G.jsx)(ev.Loading, {});
                                    var e, t = (e = o.getRobloxLocale(), (0, eZ.getUrlWithLocale)("/my/account#!/privacy/AdPreferences", e)),
                                        r = n("Body.Error"),
                                        i = n("Body.GpcMissingSettingIneligible", {
                                            lineBreak: oi,
                                            aTagStart: ot,
                                            aTagEnd: oo
                                        }),
                                        u = n("Body.GpcMissingSettingEligible", {
                                            lineBreak: oi,
                                            aTagWithHref: or,
                                            link: t,
                                            hrefEnd: on(t),
                                            aTagEnd: oo
                                        }),
                                        s = n("Body.GpcDetectedSettingEnabledIneligible", {
                                            lineBreak: oi,
                                            aTagStart: ot,
                                            aTagEnd: oo
                                        }),
                                        f = n("Body.GpcDetectedSettingEnabledEligible", {
                                            lineBreak: oi,
                                            aTagWithHref: or,
                                            link: t,
                                            hrefEnd: on(t),
                                            aTagEnd: oo
                                        }),
                                        d = n("Body.GpcDetectedSettingDisabledIneligible", {
                                            lineBreak: oi,
                                            aTagStart: ot,
                                            aTagEnd: oo
                                        }),
                                        p = n("Body.GpcDetectedSettingDisabledEligible", {
                                            lineBreak: oi,
                                            aTagWithHref: or,
                                            link: t,
                                            hrefEnd: on(t),
                                            aTagEnd: oo
                                        }),
                                        y = c ? r : a.isGpcDetected ? a.isAdsSellShareDataEnabled ? a.canUserManageAdsSettings ? f : s : a.canUserManageAdsSettings ? p : d : a.canUserManageAdsSettings ? u : i;
                                    return (0, G.jsx)("div", {
                                        className: "text-body-medium",
                                        dangerouslySetInnerHTML: {
                                            __html: y
                                        }
                                    })
                                }()]
                            }), !l && (0, G.jsx)(nM, {
                                className: "width-full",
                                children: (0, G.jsx)(n3, {
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

            function oc(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var ou = function() {
                var e;
                return (e = function() {
                    return function(e, t) {
                        var r, n, o, i = {
                                label: 0,
                                sent: function() {
                                    if (1 & o[0]) throw o[1];
                                    return o[1]
                                },
                                trys: [],
                                ops: []
                            },
                            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                            return this
                        }), a;

                        function l(l) {
                            return function(c) {
                                var u = [l, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                    if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                    switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, n = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                i.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && i.label < o[1]) {
                                                i.label = o[1], o = u;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(u);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, i)
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
                        var i = e.apply(t, r);

                        function a(e) {
                            oc(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            oc(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                })()
            };

            function os(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function of(e) {
                var t, r = e.translate,
                    n = e.intl,
                    o = (t = (0, eu.useState)(!1), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                l = !1;
                            try {
                                for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                            } catch (e) {
                                l = !0, n = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (l) throw n
                                }
                            }
                            return i
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return os(e, 2);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return os(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    i = o[0],
                    a = o[1],
                    l = (0, q.useQuery)({
                        queryKey: ["isYourPrivacyChoicesModalEnabled"],
                        queryFn: ou,
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
                var d = c.map(function(e) {
                    return (0, G.jsx)("li", {
                        className: "footer-link",
                        children: "your-privacy-choices" === e.name && l ? (0, G.jsxs)("button", {
                            onClick: function() {
                                return a(!0)
                            },
                            className: "text-footer-nav footer-button-link",
                            type: "button",
                            children: [r(e.labelTranslationKey), (0, G.jsx)("img", {
                                src: e.postfixIcon,
                                alt: "",
                                className: "footer-postfixIcon"
                            })]
                        }) : (0, G.jsxs)("a", {
                            href: ea.urlService.getUrlWithLocale(e.path, n.getRobloxLocale()),
                            className: ed()("text-footer-nav", e.cssClass),
                            target: "_blank",
                            rel: "noreferrer",
                            onClick: function(t) {
                                var r;
                                return r = e.name, void(0, ep.sendEventWithTarget)("PageFooter", "click", {
                                    destination: "".concat(r),
                                    source: "".concat(t.currentTarget.ownerDocument.location.pathname)
                                }, ep.targetTypes.WWW)
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
                        children: [d, (0, G.jsx)("li", {
                            children: (0, G.jsx)(e$, {
                                translate: r
                            })
                        })]
                    }), (0, G.jsx)(ol, {
                        showModal: i,
                        onModalClose: function() {
                            return a(!1)
                        },
                        translate: r,
                        intl: n
                    })]
                })
            }
            of.propTypes = {
                translate: er().func.isRequired,
                intl: er().shape({
                    getRobloxLocale: er().func.isRequired
                }).isRequired
            };
            var od = window.CoreRobloxUtilities,
                op = 0,
                oy = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, eu.useRef)();
                    return t.current || (op += 1, t.current = "".concat(e).concat(op)), t.current
                };

            function om(e) {
                var t = e.className;
                return es().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: eJ("block", t),
                    style: {
                        marginTop: -1
                    }
                }, es().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function ov(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function ob(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oh(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function og() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = oh(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : oh(t[e], null)
                        }
                    }
                }
            }

            function ow() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return eu.useCallback(og.apply(void 0, function(e) {
                    if (Array.isArray(e)) return ob(e)
                }(t) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ob(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ob(e, t)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function oO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oj(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ox(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        oj(e, t, r[t])
                    })
                }
                return e
            }

            function oS(e) {
                return function(e) {
                    if (Array.isArray(e)) return oO(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return oO(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oO(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oP(e) {
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
                                return oj({}, "__scope".concat(e), (t = ox({}, r), o = null != (o = oj({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e, t) {
                                    var r = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var n = Object.getOwnPropertySymbols(e);
                                        r.push.apply(r, n)
                                    }
                                    return r
                                })(Object(o)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(o, e))
                                }), t))
                            }, [r, n])
                        }
                    };
                return n.scopeName = e, [function(t, n) {
                    var o = eu.createContext(n),
                        i = r.length;
                    r = oS(r).concat([n]);
                    var a = function(t) {
                        var r, n = t.scope,
                            a = t.children,
                            l = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.keys(e);
                                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                                    return o
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                                }
                                return o
                            }(t, ["scope", "children"]),
                            c = (null == n || null == (r = n[e]) ? void 0 : r[i]) || o,
                            u = eu.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, G.jsx)(c.Provider, {
                            value: u,
                            children: a
                        })
                    };
                    return a.displayName = t + "Provider", [a, function(r, a) {
                        var l, c = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o,
                            u = eu.useContext(c);
                        if (u) return u;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, oA.apply(void 0, [n].concat(oS(t)))]
            }

            function oA() {
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
                            return ox({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return eu.useMemo(function() {
                            return oj({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var oE = (null == (X = globalThis) ? void 0 : X.document) ? eu.useLayoutEffect : function() {};

            function oC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ok = eu["useId".toString()] || function() {},
                oD = 0,
                oI = ["top", "right", "bottom", "left"],
                oN = Math.min,
                oT = Math.max,
                oR = Math.round,
                oL = Math.floor,
                oM = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                o_ = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                oU = {
                    start: "end",
                    end: "start"
                };

            function oF(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function oB(e) {
                return e.split("-")[0]
            }

            function oW(e) {
                return e.split("-")[1]
            }

            function oz(e) {
                return "x" === e ? "y" : "x"
            }

            function oH(e) {
                return "y" === e ? "height" : "width"
            }
            var oV = new Set(["top", "bottom"]);

            function oK(e) {
                return oV.has(oB(e)) ? "y" : "x"
            }

            function oX(e) {
                return e.replace(/start|end/g, function(e) {
                    return oU[e]
                })
            }
            var oG = ["left", "right"],
                oq = ["right", "left"],
                oY = ["top", "bottom"],
                o$ = ["bottom", "top"];

            function oZ(e) {
                return e.replace(/left|right|bottom|top/g, function(e) {
                    return o_[e]
                })
            }

            function oQ(e) {
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

            function oJ(e) {
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

            function o0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o1(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function o2(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            o1(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            o1(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function o3(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function o6(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        o3(e, t, r[t])
                    })
                }
                return e
            }

            function o8(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function o5(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function o4(e) {
                return function(e) {
                    if (Array.isArray(e)) return o0(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return o0(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o0(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function o7(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
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

            function o9(e, t, r) {
                var n, o = e.reference,
                    i = e.floating,
                    a = oK(t),
                    l = oz(oK(t)),
                    c = oH(l),
                    u = oB(t),
                    s = "y" === a,
                    f = o.x + o.width / 2 - i.width / 2,
                    d = o.y + o.height / 2 - i.height / 2,
                    p = o[c] / 2 - i[c] / 2;
                switch (u) {
                    case "top":
                        n = {
                            x: f,
                            y: o.y - i.height
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
                            y: d
                        };
                        break;
                    case "left":
                        n = {
                            x: o.x - i.width,
                            y: d
                        };
                        break;
                    default:
                        n = {
                            x: o.x,
                            y: o.y
                        }
                }
                switch (oW(t)) {
                    case "start":
                        n[l] -= p * (r && s ? -1 : 1);
                        break;
                    case "end":
                        n[l] += p * (r && s ? -1 : 1)
                }
                return n
            }

            function ie(e, t) {
                return o2(function() {
                    var r, n, o, i, a, l, c, u, s, f, d, p, y, m, v, b, h, g, w, O, j, x, S, P, A, E, C, k, D, I, N;
                    return o7(this, function(T) {
                        switch (T.label) {
                            case 0:
                                return void 0 === t && (t = {}), n = e.x, o = e.y, i = e.platform, a = e.rects, l = e.elements, c = e.strategy, f = void 0 === (s = (u = oF(t, e)).boundary) ? "clippingAncestors" : s, p = void 0 === (d = u.rootBoundary) ? "viewport" : d, m = void 0 === (y = u.elementContext) ? "floating" : y, b = void 0 !== (v = u.altBoundary) && v, g = oQ(void 0 === (h = u.padding) ? 0 : h), w = "floating" === m ? "reference" : "floating", O = l[b ? w : m], x = i.getClippingRect, S = {}, [4, null == i.isElement ? void 0 : i.isElement(O)];
                            case 1:
                                if (!(null == (r = T.sent()) || r)) return [3, 2];
                                return P = O, [3, 5];
                            case 2:
                                if (A = O.contextElement) return [3, 4];
                                return [4, null == i.getDocumentElement ? void 0 : i.getDocumentElement(l.floating)];
                            case 3:
                                A = T.sent(), T.label = 4;
                            case 4:
                                P = A, T.label = 5;
                            case 5:
                                return [4, x.apply(i, [(S.element = P, S.boundary = f, S.rootBoundary = p, S.strategy = c, S)])];
                            case 6:
                                return j = oJ.apply(void 0, [T.sent()]), E = "floating" === m ? {
                                    x: n,
                                    y: o,
                                    width: a.floating.width,
                                    height: a.floating.height
                                } : a.reference, [4, null == i.getOffsetParent ? void 0 : i.getOffsetParent(l.floating)];
                            case 7:
                                return C = T.sent(), [4, null == i.isElement ? void 0 : i.isElement(C)];
                            case 8:
                                if (!T.sent()) return [3, 10];
                                return [4, null == i.getScale ? void 0 : i.getScale(C)];
                            case 9:
                                return D = T.sent() || {
                                    x: 1,
                                    y: 1
                                }, [3, 11];
                            case 10:
                                D = {
                                    x: 1,
                                    y: 1
                                }, T.label = 11;
                            case 11:
                                if (k = D, !i.convertOffsetParentRelativeRectToViewportRelativeRect) return [3, 13];
                                return [4, i.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: l,
                                    rect: E,
                                    offsetParent: C,
                                    strategy: c
                                })];
                            case 12:
                                return N = T.sent(), [3, 14];
                            case 13:
                                N = E, T.label = 14;
                            case 14:
                                return I = oJ.apply(void 0, [N]), [2, {
                                    top: (j.top - I.top + g.top) / k.y,
                                    bottom: (I.bottom - j.bottom + g.bottom) / k.y,
                                    left: (j.left - I.left + g.left) / k.x,
                                    right: (I.right - j.right + g.right) / k.x
                                }]
                        }
                    })
                })()
            }

            function it(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function ir(e) {
                return oI.some(function(t) {
                    return e[t] >= 0
                })
            }
            var io = new Set(["left", "top"]);

            function ii(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function ia() {
                return "undefined" != typeof window
            }

            function il(e) {
                return is(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function ic(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function iu(e) {
                var t;
                return null == (t = (is(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function is(e) {
                return !!ia() && (ii(e, Node) || ii(e, ic(e).Node))
            }

            function id(e) {
                return !!ia() && (ii(e, Element) || ii(e, ic(e).Element))
            }

            function ip(e) {
                return !!ia() && (ii(e, HTMLElement) || ii(e, ic(e).HTMLElement))
            }

            function iy(e) {
                return !!ia() && "undefined" != typeof ShadowRoot && (ii(e, ShadowRoot) || ii(e, ic(e).ShadowRoot))
            }
            var im = new Set(["inline", "contents"]);

            function iv(e) {
                var t = iE(e),
                    r = t.overflow,
                    n = t.overflowX,
                    o = t.overflowY,
                    i = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + o + n) && !im.has(i)
            }
            var ib = new Set(["table", "td", "th"]),
                ih = [":popover-open", ":modal"];

            function ig(e) {
                return ih.some(function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                })
            }
            var iw = ["transform", "translate", "scale", "rotate", "perspective"],
                iO = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                ij = ["paint", "layout", "strict", "content"];

            function ix(e) {
                var t = iS(),
                    r = id(e) ? iE(e) : e;
                return iw.some(function(e) {
                    return !!r[e] && "none" !== r[e]
                }) || !!r.containerType && "normal" !== r.containerType || !t && !!r.backdropFilter && "none" !== r.backdropFilter || !t && !!r.filter && "none" !== r.filter || iO.some(function(e) {
                    return (r.willChange || "").includes(e)
                }) || ij.some(function(e) {
                    return (r.contain || "").includes(e)
                })
            }

            function iS() {
                return "undefined" != typeof CSS && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var iP = new Set(["html", "body", "#document"]);

            function iA(e) {
                return iP.has(il(e))
            }

            function iE(e) {
                return ic(e).getComputedStyle(e)
            }

            function iC(e) {
                return id(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function ik(e) {
                if ("html" === il(e)) return e;
                var t = e.assignedSlot || e.parentNode || iy(e) && e.host || iu(e);
                return iy(t) ? t.host : t
            }

            function iD(e, t, r) {
                void 0 === t && (t = []), void 0 === r && (r = !0);
                var n, o = function e(t) {
                        var r = ik(t);
                        return iA(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : ip(r) && iv(r) ? r : e(r)
                    }(e),
                    i = o === (null == (n = e.ownerDocument) ? void 0 : n.body),
                    a = ic(o);
                if (i) {
                    var l = iI(a);
                    return t.concat(a, a.visualViewport || [], iv(o) ? o : [], l && r ? iD(l) : [])
                }
                return t.concat(o, iD(o, [], r))
            }

            function iI(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function iN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iT(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function iR(e) {
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

            function iL(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function iM(e) {
                return function(e) {
                    if (Array.isArray(e)) return iN(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || i_(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function i_(e, t) {
                if (e) {
                    if ("string" == typeof e) return iN(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iN(e, t)
                }
            }

            function iU(e) {
                var t = iE(e),
                    r = parseFloat(t.width) || 0,
                    n = parseFloat(t.height) || 0,
                    o = ip(e),
                    i = o ? e.offsetWidth : r,
                    a = o ? e.offsetHeight : n,
                    l = oR(r) !== i || oR(n) !== a;
                return l && (r = i, n = a), {
                    width: r,
                    height: n,
                    $: l
                }
            }

            function iF(e) {
                return id(e) ? e : e.contextElement
            }

            function iB(e) {
                var t = iF(e);
                if (!ip(t)) return oM(1);
                var r = t.getBoundingClientRect(),
                    n = iU(t),
                    o = n.width,
                    i = n.height,
                    a = n.$,
                    l = (a ? oR(r.width) : r.width) / o,
                    c = (a ? oR(r.height) : r.height) / i;
                return l && Number.isFinite(l) || (l = 1), c && Number.isFinite(c) || (c = 1), {
                    x: l,
                    y: c
                }
            }
            var iW = oM(0);

            function iz(e) {
                var t = ic(e);
                return iS() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : iW
            }

            function iH(e, t, r, n) {
                void 0 === t && (t = !1), void 0 === r && (r = !1);
                var o, i = e.getBoundingClientRect(),
                    a = iF(e),
                    l = oM(1);
                t && (n ? id(n) && (l = iB(n)) : l = iB(e));
                var c = (void 0 === (o = r) && (o = !1), n && (!o || n === ic(a)) && o) ? iz(a) : oM(0),
                    u = (i.left + c.x) / l.x,
                    s = (i.top + c.y) / l.y,
                    f = i.width / l.x,
                    d = i.height / l.y;
                if (a)
                    for (var p = ic(a), y = n && id(n) ? ic(n) : n, m = p, v = iI(m); v && n && y !== m;) {
                        var b = iB(v),
                            h = v.getBoundingClientRect(),
                            g = iE(v),
                            w = h.left + (v.clientLeft + parseFloat(g.paddingLeft)) * b.x,
                            O = h.top + (v.clientTop + parseFloat(g.paddingTop)) * b.y;
                        u *= b.x, s *= b.y, f *= b.x, d *= b.y, u += w, s += O, v = iI(m = ic(v))
                    }
                return oJ({
                    width: f,
                    height: d,
                    x: u,
                    y: s
                })
            }

            function iV(e, t) {
                var r = iC(e).scrollLeft;
                return t ? t.left + r : iH(iu(e)).left + r
            }

            function iK(e, t) {
                var r = e.getBoundingClientRect();
                return {
                    x: r.left + t.scrollLeft - iV(e, r),
                    y: r.top + t.scrollTop
                }
            }
            var iX = new Set(["absolute", "fixed"]);

            function iG(e, t, r) {
                if ("viewport" === t) n = function(e, t) {
                    var r = ic(e),
                        n = iu(e),
                        o = r.visualViewport,
                        i = n.clientWidth,
                        a = n.clientHeight,
                        l = 0,
                        c = 0;
                    if (o) {
                        i = o.width, a = o.height;
                        var u = iS();
                        (!u || u && "fixed" === t) && (l = o.offsetLeft, c = o.offsetTop)
                    }
                    var s = iV(n);
                    if (s <= 0) {
                        var f = n.ownerDocument,
                            d = f.body,
                            p = getComputedStyle(d),
                            y = "CSS1Compat" === f.compatMode && parseFloat(p.marginLeft) + parseFloat(p.marginRight) || 0,
                            m = Math.abs(n.clientWidth - d.clientWidth - y);
                        m <= 25 && (i -= m)
                    } else s <= 25 && (i += s);
                    return {
                        width: i,
                        height: a,
                        x: l,
                        y: c
                    }
                }(e, r);
                else if ("document" === t) o = iu(e), i = iu(o), a = iC(o), l = o.ownerDocument.body, c = oT(i.scrollWidth, i.clientWidth, l.scrollWidth, l.clientWidth), u = oT(i.scrollHeight, i.clientHeight, l.scrollHeight, l.clientHeight), s = -a.scrollLeft + iV(o), f = -a.scrollTop, "rtl" === iE(l).direction && (s += oT(i.clientWidth, l.clientWidth) - c), n = {
                    width: c,
                    height: u,
                    x: s,
                    y: f
                };
                else if (id(t)) p = (d = iH(t, !0, "fixed" === r)).top + t.clientTop, y = d.left + t.clientLeft, m = ip(t) ? iB(t) : oM(1), n = {
                    width: t.clientWidth * m.x,
                    height: t.clientHeight * m.y,
                    x: y * m.x,
                    y: p * m.y
                };
                else {
                    var n, o, i, a, l, c, u, s, f, d, p, y, m, v = iz(e);
                    n = {
                        x: t.x - v.x,
                        y: t.y - v.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return oJ(n)
            }

            function iq(e, t, r) {
                var n = ip(t),
                    o = iu(t),
                    i = "fixed" === r,
                    a = iH(e, !0, i, t),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    c = oM(0);
                if (n || !n && !i)
                    if (("body" !== il(t) || iv(o)) && (l = iC(t)), n) {
                        var u = iH(t, !0, i, t);
                        c.x = u.x + t.clientLeft, c.y = u.y + t.clientTop
                    } else o && (c.x = iV(o));
                i && !n && o && (c.x = iV(o));
                var s = !o || n || i ? oM(0) : iK(o, l);
                return {
                    x: a.left + l.scrollLeft - c.x - s.x,
                    y: a.top + l.scrollTop - c.y - s.y,
                    width: a.width,
                    height: a.height
                }
            }

            function iY(e) {
                return "static" === iE(e).position
            }

            function i$(e, t) {
                if (!ip(e) || "fixed" === iE(e).position) return null;
                if (t) return t(e);
                var r = e.offsetParent;
                return iu(e) === r && (r = r.ownerDocument.body), r
            }

            function iZ(e, t) {
                var r, n = ic(e);
                if (ig(e)) return n;
                if (!ip(e)) {
                    for (var o = ik(e); o && !iA(o);) {
                        if (id(o) && !iY(o)) return o;
                        o = ik(o)
                    }
                    return n
                }
                for (var i = i$(e, t); i && (r = i, ib.has(il(r))) && iY(i);) i = i$(i, t);
                return i && iA(i) && iY(i) && !ix(i) ? n : i || function(e) {
                    for (var t = ik(e); ip(t) && !iA(t);) {
                        if (ix(t)) return t;
                        if (ig(t)) break;
                        t = ik(t)
                    }
                    return null
                }(e) || n
            }
            var iQ = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        r = e.rect,
                        n = e.offsetParent,
                        o = "fixed" === e.strategy,
                        i = iu(n),
                        a = !!t && ig(t.floating);
                    if (n === i || a && o) return r;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        c = oM(1),
                        u = oM(0),
                        s = ip(n);
                    if ((s || !s && !o) && (("body" !== il(n) || iv(i)) && (l = iC(n)), ip(n))) {
                        var f = iH(n);
                        c = iB(n), u.x = f.x + n.clientLeft, u.y = f.y + n.clientTop
                    }
                    var d = !i || s || o ? oM(0) : iK(i, l);
                    return {
                        width: r.width * c.x,
                        height: r.height * c.y,
                        x: r.x * c.x - l.scrollLeft * c.x + u.x + d.x,
                        y: r.y * c.y - l.scrollTop * c.y + u.y + d.y
                    }
                },
                getDocumentElement: iu,
                getClippingRect: function(e) {
                    var t = e.element,
                        r = e.boundary,
                        n = e.rootBoundary,
                        o = e.strategy,
                        i = iM("clippingAncestors" === r ? ig(t) ? [] : function(e, t) {
                            var r = t.get(e);
                            if (r) return r;
                            for (var n = iD(e, [], !1).filter(function(e) {
                                    return id(e) && "body" !== il(e)
                                }), o = null, i = "fixed" === iE(e).position, a = i ? ik(e) : e; id(a) && !iA(a);) {
                                var l = iE(a),
                                    c = ix(a);
                                c || "fixed" !== l.position || (o = null), (i ? !c && !o : !c && "static" === l.position && !!o && iX.has(o.position) || iv(a) && !c && function e(t, r) {
                                    var n = ik(t);
                                    return !(n === r || !id(n) || iA(n)) && ("fixed" === iE(n).position || e(n, r))
                                }(e, a)) ? n = n.filter(function(e) {
                                    return e !== a
                                }) : o = l, a = ik(a)
                            }
                            return t.set(e, n), n
                        }(t, this._c) : [].concat(r)).concat([n]),
                        a = i[0],
                        l = i.reduce(function(e, r) {
                            var n = iG(t, r, o);
                            return e.top = oT(n.top, e.top), e.right = oN(n.right, e.right), e.bottom = oN(n.bottom, e.bottom), e.left = oT(n.left, e.left), e
                        }, iG(t, a, o));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: iZ,
                getElementRects: function(e) {
                    var t;
                    return (t = function() {
                        var t, r, n, o;
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
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
                                    return t = this.getOffsetParent || iZ, [4, (0, this.getDimensions)(e.floating)];
                                case 1:
                                    return r = i.sent(), n = {}, o = [e.reference], [4, t(e.floating)];
                                case 2:
                                    return [2, (n.reference = iq.apply(void 0, o.concat([i.sent(), e.strategy])), n.floating = {
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
                            var i = t.apply(e, r);

                            function a(e) {
                                iT(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                iT(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    }).call(this)
                },
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = iU(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: iB,
                isElement: id,
                isRTL: function(e) {
                    return "rtl" === iE(e).direction
                }
            };

            function iJ(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function i0(e, t, r, n) {
                void 0 === n && (n = {});
                var o, i = n.ancestorScroll,
                    a = void 0 === i || i,
                    l = n.ancestorResize,
                    c = void 0 === l || l,
                    u = n.elementResize,
                    s = void 0 === u ? "function" == typeof ResizeObserver : u,
                    f = n.layoutShift,
                    d = void 0 === f ? "function" == typeof IntersectionObserver : f,
                    p = n.animationFrame,
                    y = void 0 !== p && p,
                    m = iF(e),
                    v = a || c ? iM(m ? iD(m) : []).concat(iM(iD(t))) : [];
                v.forEach(function(e) {
                    a && e.addEventListener("scroll", r, {
                        passive: !0
                    }), c && e.addEventListener("resize", r)
                });
                var b = m && d ? function(e, t) {
                        var r, n = null,
                            o = iu(e);

                        function i() {
                            var e;
                            clearTimeout(r), null == (e = n) || e.disconnect(), n = null
                        }
                        return ! function a(l, c) {
                            void 0 === l && (l = !1), void 0 === c && (c = 1), i();
                            var u = e.getBoundingClientRect(),
                                s = u.left,
                                f = u.top,
                                d = u.width,
                                p = u.height;
                            if (l || t(), d && p) {
                                var y = {
                                        rootMargin: -oL(f) + "px " + -oL(o.clientWidth - (s + d)) + "px " + -oL(o.clientHeight - (f + p)) + "px " + -oL(s) + "px",
                                        threshold: oT(0, oN(1, c)) || 1
                                    },
                                    m = !0;
                                try {
                                    n = new IntersectionObserver(v, iL(iR({}, y), {
                                        root: o.ownerDocument
                                    }))
                                } catch (e) {
                                    n = new IntersectionObserver(v, y)
                                }
                                n.observe(e)
                            }

                            function v(t) {
                                var n = t[0].intersectionRatio;
                                if (n !== c) {
                                    if (!m) return a();
                                    n ? a(!1, n) : r = setTimeout(function() {
                                        a(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== n || iJ(u, e.getBoundingClientRect()) || a(), m = !1
                            }
                        }(!0), i
                    }(m, r) : null,
                    h = -1,
                    g = null;
                s && (g = new ResizeObserver(function(e) {
                    var n = (function(e) {
                        if (Array.isArray(e)) return e
                    }(e) || function(e, t) {
                        var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                l = !1;
                            try {
                                for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                            } catch (e) {
                                l = !0, n = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (l) throw n
                                }
                            }
                            return i
                        }
                    }(e, 1) || i_(e, 1) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())[0];
                    n && n.target === m && g && (g.unobserve(t), cancelAnimationFrame(h), h = requestAnimationFrame(function() {
                        var e;
                        null == (e = g) || e.observe(t)
                    })), r()
                }), m && !y && g.observe(m), g.observe(t));
                var w = y ? iH(e) : null;
                return y && function t() {
                        var n = iH(e);
                        w && !iJ(w, n) && r(), w = n, o = requestAnimationFrame(t)
                    }(), r(),
                    function() {
                        var e;
                        v.forEach(function(e) {
                            a && e.removeEventListener("scroll", r), c && e.removeEventListener("resize", r)
                        }), null == b || b(), null == (e = g) || e.disconnect(), g = null, y && cancelAnimationFrame(o)
                    }
            }
            var i1 = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return o2(function() {
                                var r, n, o, i, a, l, c, u, s, f, d, p, y, m, v, b, h, g, w, O, j, x, S, P, A, E, C, k, D, I, N, T, R, L, M, _, U;
                                return o7(this, function(F) {
                                    switch (F.label) {
                                        case 0:
                                            if (r = t.x, n = t.y, o = t.placement, i = t.rects, a = t.platform, l = t.elements, c = t.middlewareData, s = (u = oF(e, t) || {}).element, d = void 0 === (f = u.padding) ? 0 : f, null == s) return [2, {}];
                                            return p = oQ(d), y = {
                                                x: r,
                                                y: n
                                            }, v = oH(m = oz(oK(o))), [4, a.getDimensions(s)];
                                        case 1:
                                            return b = F.sent(), g = (h = "y" === m) ? "top" : "left", w = h ? "bottom" : "right", O = h ? "clientHeight" : "clientWidth", j = i.reference[v] + i.reference[m] - y[m] - i.floating[v], x = y[m] - i.reference[m], [4, null == a.getOffsetParent ? void 0 : a.getOffsetParent(s)];
                                        case 2:
                                            if (A = !(P = (S = F.sent()) ? S[O] : 0)) return [3, 4];
                                            return [4, null == a.isElement ? void 0 : a.isElement(S)];
                                        case 3:
                                            A = !F.sent(), F.label = 4;
                                        case 4:
                                            return A && (P = l.floating[O] || i.floating[v]), E = j / 2 - x / 2, C = P / 2 - b[v] / 2 - 1, k = oN(p[g], C), D = oN(p[w], C), I = k, N = P - b[v] - D, R = oT(I, oN(T = P / 2 - b[v] / 2 + E, N)), M = (L = !c.arrow && null != oW(o) && T !== R && i.reference[v] / 2 - (T < I ? k : D) - b[v] / 2 < 0) ? T < I ? T - I : T - N : 0, [2, (o3(U = {}, m, y[m] + M), o3(U, "data", o6((o3(_ = {}, m, R), o3(_, "centerOffset", T - R - M), _), L && {
                                                alignmentOffset: M
                                            })), o3(U, "reset", L), U)]
                                    }
                                })
                            })()
                        }
                    }
                },
                i2 = function(e, t, r) {
                    var n, o = new Map,
                        i = iR({
                            platform: iQ
                        }, r),
                        a = iL(iR({}, i.platform), {
                            _c: o
                        });
                    return n = iL(iR({}, i), {
                        platform: a
                    }), o2(function() {
                        var r, o, i, a, l, c, u, s, f, d, p, y, m, v, b, h, g, w, O, j, x, S, P, A, E, C;
                        return o7(this, function(k) {
                            switch (k.label) {
                                case 0:
                                    return o = void 0 === (r = n.placement) ? "bottom" : r, a = void 0 === (i = n.strategy) ? "absolute" : i, c = void 0 === (l = n.middleware) ? [] : l, u = n.platform, s = c.filter(Boolean), [4, null == u.isRTL ? void 0 : u.isRTL(t)];
                                case 1:
                                    return f = k.sent(), [4, u.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 2:
                                    y = (p = o9(d = k.sent(), o, f)).x, m = p.y, v = o, b = {}, h = 0, g = 0, k.label = 3;
                                case 3:
                                    if (!(g < s.length)) return [3, 11];
                                    return O = (w = s[g]).name, [4, (0, w.fn)({
                                        x: y,
                                        y: m,
                                        initialPlacement: o,
                                        placement: v,
                                        strategy: a,
                                        middlewareData: b,
                                        rects: d,
                                        platform: u,
                                        elements: {
                                            reference: e,
                                            floating: t
                                        }
                                    })];
                                case 4:
                                    var D;
                                    if (x = (j = k.sent()).x, S = j.y, P = j.data, A = j.reset, y = null != x ? x : y, m = null != S ? S : m, b = o8(o6({}, b), o3({}, O, o6({}, b[O], P))), !(A && h <= 50)) return [3, 10];
                                    if (h++, (void 0 === A ? "undefined" : (D = A) && "undefined" != typeof Symbol && D.constructor === Symbol ? "symbol" : typeof D) != "object") return [3, 9];
                                    if (A.placement && (v = A.placement), !A.rects) return [3, 8];
                                    if (!0 !== A.rects) return [3, 6];
                                    return [4, u.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 5:
                                    return E = k.sent(), [3, 7];
                                case 6:
                                    E = A.rects, k.label = 7;
                                case 7:
                                    d = E, k.label = 8;
                                case 8:
                                    y = (C = o9(d, v, f)).x, m = C.y, k.label = 9;
                                case 9:
                                    g = -1, k.label = 10;
                                case 10:
                                    return g++, [3, 3];
                                case 11:
                                    return [2, {
                                        x: y,
                                        y: m,
                                        placement: v,
                                        strategy: a,
                                        middlewareData: b
                                    }]
                            }
                        })
                    })()
                };

            function i3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i6(e) {
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

            function i8(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function i5(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return i3(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i3(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function i4(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var i7 = "undefined" != typeof document ? eu.useLayoutEffect : function() {};

            function i9(e, t) {
                if (e === t) return !0;
                if ((void 0 === e ? "undefined" : i4(e)) !== (void 0 === t ? "undefined" : i4(t))) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                if (e && t && (void 0 === e ? "undefined" : i4(e)) === "object") {
                    if (Array.isArray(e)) {
                        if ((r = e.length) !== t.length) return !1;
                        for (n = r; 0 != n--;)
                            if (!i9(e[n], t[n])) return !1;
                        return !0
                    }
                    if ((r = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (n = r; 0 != n--;)
                        if (!({}).hasOwnProperty.call(t, o[n])) return !1;
                    for (n = r; 0 != n--;) {
                        var r, n, o, i = o[n];
                        if (("_owner" !== i || !e.$$typeof) && !i9(e[i], t[i])) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function ae(e) {
                return "undefined" == typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function at(e, t) {
                var r = ae(e);
                return Math.round(t * r) / r
            }

            function ar(e) {
                var t = eu.useRef(e);
                return i7(function() {
                    t.current = e
                }), t
            }

            function an(e) {
                void 0 === e && (e = {});
                var t = e.placement,
                    r = void 0 === t ? "bottom" : t,
                    n = e.strategy,
                    o = void 0 === n ? "absolute" : n,
                    i = e.middleware,
                    a = void 0 === i ? [] : i,
                    l = e.platform,
                    c = e.elements,
                    u = void 0 === c ? {} : c,
                    s = u.reference,
                    f = u.floating,
                    d = e.transform,
                    p = void 0 === d || d,
                    y = e.whileElementsMounted,
                    m = e.open,
                    v = i5(eu.useState({
                        x: 0,
                        y: 0,
                        strategy: o,
                        placement: r,
                        middlewareData: {},
                        isPositioned: !1
                    }), 2),
                    b = v[0],
                    h = v[1],
                    g = i5(eu.useState(a), 2),
                    w = g[0],
                    O = g[1];
                i9(w, a) || O(a);
                var j = i5(eu.useState(null), 2),
                    x = j[0],
                    S = j[1],
                    P = i5(eu.useState(null), 2),
                    A = P[0],
                    E = P[1],
                    C = eu.useCallback(function(e) {
                        e !== N.current && (N.current = e, S(e))
                    }, []),
                    k = eu.useCallback(function(e) {
                        e !== T.current && (T.current = e, E(e))
                    }, []),
                    D = s || x,
                    I = f || A,
                    N = eu.useRef(null),
                    T = eu.useRef(null),
                    R = eu.useRef(b),
                    L = null != y,
                    M = ar(y),
                    _ = ar(l),
                    U = ar(m),
                    F = eu.useCallback(function() {
                        if (N.current && T.current) {
                            var e = {
                                placement: r,
                                strategy: o,
                                middleware: w
                            };
                            _.current && (e.platform = _.current), i2(N.current, T.current, e).then(function(e) {
                                var t = i8(i6({}, e), {
                                    isPositioned: !1 !== U.current
                                });
                                B.current && !i9(R.current, t) && (R.current = t, tw.flushSync(function() {
                                    h(t)
                                }))
                            })
                        }
                    }, [w, r, o, _, U]);
                i7(function() {
                    !1 === m && R.current.isPositioned && (R.current.isPositioned = !1, h(function(e) {
                        return i8(i6({}, e), {
                            isPositioned: !1
                        })
                    }))
                }, [m]);
                var B = eu.useRef(!1);
                i7(function() {
                    return B.current = !0,
                        function() {
                            B.current = !1
                        }
                }, []), i7(function() {
                    if (D && (N.current = D), I && (T.current = I), D && I) {
                        if (M.current) return M.current(D, I, F);
                        F()
                    }
                }, [D, I, F, M, L]);
                var W = eu.useMemo(function() {
                        return {
                            reference: N,
                            floating: T,
                            setReference: C,
                            setFloating: k
                        }
                    }, [C, k]),
                    z = eu.useMemo(function() {
                        return {
                            reference: D,
                            floating: I
                        }
                    }, [D, I]),
                    H = eu.useMemo(function() {
                        var e = {
                            position: o,
                            left: 0,
                            top: 0
                        };
                        if (!z.floating) return e;
                        var t = at(z.floating, b.x),
                            r = at(z.floating, b.y);
                        return p ? i6(i8(i6({}, e), {
                            transform: "translate(" + t + "px, " + r + "px)"
                        }), ae(z.floating) >= 1.5 && {
                            willChange: "transform"
                        }) : {
                            position: o,
                            left: t,
                            top: r
                        }
                    }, [o, p, z.floating, b.x, b.y]);
                return eu.useMemo(function() {
                    return i8(i6({}, b), {
                        update: F,
                        refs: W,
                        elements: z,
                        floatingStyles: H
                    })
                }, [b, F, W, z, H])
            }
            var ao = function(e, t) {
                    var r;
                    return i8(i6({}, (void 0 === (r = e) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(e) {
                            return o2(function() {
                                var t, n, o, i, a, l, c;
                                return o7(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            var s;
                                            return o = e.x, i = e.y, a = e.placement, l = e.middlewareData, [4, (s = r, o2(function() {
                                                var t, r, n, o, i, a, l, c, u, f, d, p, y, m;
                                                return o7(this, function(v) {
                                                    switch (v.label) {
                                                        case 0:
                                                            return t = e.placement, r = e.platform, n = e.elements, [4, null == r.isRTL ? void 0 : r.isRTL(n.floating)];
                                                        case 1:
                                                            return o = v.sent(), i = oB(t), a = oW(t), l = "y" === oK(t), c = io.has(i) ? -1 : 1, u = o && l ? -1 : 1, p = (d = "number" == typeof(f = oF(s, e)) ? {
                                                                mainAxis: f,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: f.mainAxis || 0,
                                                                crossAxis: f.crossAxis || 0,
                                                                alignmentAxis: f.alignmentAxis
                                                            }).mainAxis, y = d.crossAxis, m = d.alignmentAxis, a && "number" == typeof m && (y = "end" === a ? -1 * m : m), [2, l ? {
                                                                x: y * u,
                                                                y: p * c
                                                            } : {
                                                                x: p * c,
                                                                y: y * u
                                                            }]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            if (c = u.sent(), a === (null == (t = l.offset) ? void 0 : t.placement) && null != (n = l.arrow) && n.alignmentOffset) return [2, {}];
                                            return [2, {
                                                x: o + c.x,
                                                y: i + c.y,
                                                data: o8(o6({}, c), {
                                                    placement: a
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
                ai = function(e, t) {
                    var r;
                    return i8(i6({}, (void 0 === (r = e) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(e) {
                            return o2(function() {
                                var t, n, o, i, a, l, c, u, s, f, d, p, y, m, v, b, h, g, w, O, j, x, S, P, A, E, C, k;
                                return o7(this, function(D) {
                                    switch (D.label) {
                                        case 0:
                                            return t = e.x, n = e.y, o = e.placement, l = void 0 === (a = (i = oF(r, e)).mainAxis) || a, u = void 0 !== (c = i.crossAxis) && c, f = void 0 === (s = i.limiter) ? {
                                                fn: function(e) {
                                                    return {
                                                        x: e.x,
                                                        y: e.y
                                                    }
                                                }
                                            } : s, d = o5(i, ["mainAxis", "crossAxis", "limiter"]), p = {
                                                x: t,
                                                y: n
                                            }, [4, ie(e, d)];
                                        case 1:
                                            return y = D.sent(), b = p[v = oz(m = oK(oB(o)))], h = p[m], l && (g = "y" === v ? "top" : "left", w = "y" === v ? "bottom" : "right", O = b + y[g], j = b - y[w], b = oT(O, oN(b, j))), u && (x = "y" === m ? "top" : "left", S = "y" === m ? "bottom" : "right", P = h + y[x], A = h - y[S], h = oT(P, oN(h, A))), C = f.fn(o8(o6({}, e), (o3(E = {}, v, b), o3(E, m, h), E))), [2, o8(o6({}, C), {
                                                data: {
                                                    x: C.x - t,
                                                    y: C.y - n,
                                                    enabled: (o3(k = {}, v, l), o3(k, m, u), k)
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
                aa = function(e, t) {
                    var r;
                    return i8(i6({}, (void 0 === (r = e) && (r = {}), {
                        options: r,
                        fn: function(e) {
                            var t, n = e.x,
                                o = e.y,
                                i = e.placement,
                                a = e.rects,
                                l = e.middlewareData,
                                c = oF(r, e),
                                u = c.offset,
                                s = c.mainAxis,
                                f = c.crossAxis,
                                d = {
                                    x: n,
                                    y: o
                                },
                                p = oK(i),
                                y = oz(p),
                                m = d[y],
                                v = d[p],
                                b = oF(void 0 === u ? 0 : u, e),
                                h = "number" == typeof b ? {
                                    mainAxis: b,
                                    crossAxis: 0
                                } : o6({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, b);
                            if (void 0 === s || s) {
                                var g = "y" === y ? "height" : "width",
                                    w = a.reference[y] - a.floating[g] + h.mainAxis,
                                    O = a.reference[y] + a.reference[g] - h.mainAxis;
                                m < w ? m = w : m > O && (m = O)
                            }
                            if (void 0 === f || f) {
                                var j, x, S = "y" === y ? "width" : "height",
                                    P = io.has(oB(i)),
                                    A = a.reference[p] - a.floating[S] + (P && (null == (j = l.offset) ? void 0 : j[p]) || 0) + (P ? 0 : h.crossAxis),
                                    E = a.reference[p] + a.reference[S] + (P ? 0 : (null == (x = l.offset) ? void 0 : x[p]) || 0) - (P ? h.crossAxis : 0);
                                v < A ? v = A : v > E && (v = E)
                            }
                            return o3(t = {}, y, m), o3(t, p, v), t
                        }
                    })), {
                        options: [e, t]
                    })
                },
                al = function(e, t) {
                    var r;
                    return i8(i6({}, (void 0 === (r = e) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(e) {
                            return o2(function() {
                                var t, n, o, i, a, l, c, u, s, f, d, p, y, m, v, b, h, g, w, O, j, x, S, P, A, E, C, k, D, I, N, T, R, L, M, _, U, F, B, W;
                                return o7(this, function(z) {
                                    var H, V, K, X, G, q, Y, $, Z, Q, J, ee, et, er, en;
                                    switch (z.label) {
                                        case 0:
                                            if (o = e.placement, i = e.middlewareData, a = e.rects, l = e.initialPlacement, c = e.platform, u = e.elements, d = void 0 === (f = (s = oF(r, e)).mainAxis) || f, y = void 0 === (p = s.crossAxis) || p, m = s.fallbackPlacements, b = void 0 === (v = s.fallbackStrategy) ? "bestFit" : v, g = void 0 === (h = s.fallbackAxisSideDirection) ? "none" : h, O = void 0 === (w = s.flipAlignment) || w, j = o5(s, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (t = i.arrow) && t.alignmentOffset) return [2, {}];
                                            return x = oB(o), S = oK(l), P = oB(l) === l, [4, null == c.isRTL ? void 0 : c.isRTL(u.floating)];
                                        case 1:
                                            return A = z.sent(), E = m || (P || !O ? [oZ(l)] : (V = oZ(H = l), [oX(H), V, oX(V)])), C = "none" !== g, !m && C && (k = E).push.apply(k, o4((K = l, X = O, G = g, q = A, Y = oW(K), $ = function(e, t, r) {
                                                switch (e) {
                                                    case "top":
                                                    case "bottom":
                                                        if (r) return t ? oq : oG;
                                                        return t ? oG : oq;
                                                    case "left":
                                                    case "right":
                                                        return t ? oY : o$;
                                                    default:
                                                        return []
                                                }
                                            }(oB(K), "start" === G, q), Y && ($ = $.map(function(e) {
                                                return e + "-" + Y
                                            }), X && ($ = $.concat($.map(oX)))), $))), D = [l].concat(o4(E)), [4, ie(e, j)];
                                        case 2:
                                            if (I = z.sent(), N = [], T = (null == (n = i.flip) ? void 0 : n.overflows) || [], d && N.push(I[x]), y && (Z = o, Q = a, void 0 === (J = A) && (J = !1), ee = oW(Z), er = oH(et = oz(oK(Z))), en = "x" === et ? ee === (J ? "end" : "start") ? "right" : "left" : "start" === ee ? "bottom" : "top", Q.reference[er] > Q.floating[er] && (en = oZ(en)), R = [en, oZ(en)], N.push(I[R[0]], I[R[1]])), T = o4(T).concat([{
                                                    placement: o,
                                                    overflows: N
                                                }]), !N.every(function(e) {
                                                    return e <= 0
                                                })) {
                                                if ((U = D[_ = ((null == (L = i.flip) ? void 0 : L.index) || 0) + 1]) && ("alignment" !== y || S === oK(U) || T.every(function(e) {
                                                        return oK(e.placement) !== S || e.overflows[0] > 0
                                                    }))) return [2, {
                                                    data: {
                                                        index: _,
                                                        overflows: T
                                                    },
                                                    reset: {
                                                        placement: U
                                                    }
                                                }];
                                                if (!(F = null == (M = T.filter(function(e) {
                                                        return e.overflows[0] <= 0
                                                    }).sort(function(e, t) {
                                                        return e.overflows[1] - t.overflows[1]
                                                    })[0]) ? void 0 : M.placement)) switch (b) {
                                                    case "bestFit":
                                                        (W = null == (B = T.filter(function(e) {
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
                ac = function(e, t) {
                    var r;
                    return i8(i6({}, (void 0 === (r = e) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(e) {
                            return o2(function() {
                                var t, n, o, i, a, l, c, u, s, f, d, p, y, m, v, b, h, g, w, O, j, x, S, P, A, E, C, k, D, I;
                                return o7(this, function(N) {
                                    switch (N.label) {
                                        case 0:
                                            return o = e.placement, i = e.rects, a = e.platform, l = e.elements, s = void 0 === (u = (c = oF(r, e)).apply) ? function() {} : u, [4, ie(e, o5(c, ["apply"]))];
                                        case 1:
                                            if (f = N.sent(), d = oB(o), p = oW(o), y = "y" === oK(o), v = (m = i.floating).width, b = m.height, "top" !== d && "bottom" !== d) return [3, 3];
                                            return h = d, [4, null == a.isRTL ? void 0 : a.isRTL(l.floating)];
                                        case 2:
                                            return g = p === (N.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            g = d, h = "end" === p ? "top" : "bottom", N.label = 4;
                                        case 4:
                                            return w = b - f.top - f.bottom, O = v - f.left - f.right, j = oN(b - f[h], w), x = oN(v - f[g], O), S = !e.middlewareData.shift, P = j, A = x, null != (t = e.middlewareData.shift) && t.enabled.x && (A = O), null != (n = e.middlewareData.shift) && n.enabled.y && (P = w), S && !p && (E = oT(f.left, 0), C = oT(f.right, 0), k = oT(f.top, 0), D = oT(f.bottom, 0), y ? A = v - 2 * (0 !== E || 0 !== C ? E + C : oT(f.left, f.right)) : P = b - 2 * (0 !== k || 0 !== D ? k + D : oT(f.top, f.bottom))), [4, s(o8(o6({}, e), {
                                                availableWidth: A,
                                                availableHeight: P
                                            }))];
                                        case 5:
                                            return N.sent(), [4, a.getDimensions(l.floating)];
                                        case 6:
                                            if (I = N.sent(), v !== I.width || b !== I.height) return [2, {
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
                au = function(e, t) {
                    var r;
                    return i8(i6({}, (void 0 === (r = e) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(e) {
                            return o2(function() {
                                var t, n, o, i, a, l, c;
                                return o7(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            switch (t = e.rects, i = void 0 === (o = (n = oF(r, e)).strategy) ? "referenceHidden" : o, a = o5(n, ["strategy"]), i) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, ie(e, o8(o6({}, a), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: l = it(u.sent(), t.reference),
                                                    referenceHidden: ir(l)
                                                }
                                            }];
                                        case 3:
                                            return [4, ie(e, o8(o6({}, a), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: c = it(u.sent(), t.floating),
                                                    escaped: ir(c)
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
                as = function(e, t) {
                    return i8(i6({}, {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            var r = "function" == typeof e ? e(t) : e,
                                n = r.element,
                                o = r.padding;
                            return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? i1({
                                element: n.current,
                                padding: o
                            }).fn(t) : {} : n ? i1({
                                element: n,
                                padding: o
                            }).fn(t) : {}
                        }
                    }), {
                        options: [e, t]
                    })
                };

            function af(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ad(e) {
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

            function ap(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function ay(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function am(e) {
                return function(e) {
                    if (Array.isArray(e)) return af(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return af(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return af(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var av = eu.forwardRef(function(e, t) {
                var r = e.children,
                    n = ay(e, ["children"]),
                    o = eu.Children.toArray(r),
                    i = o.find(ag);
                if (i) {
                    var a = i.props.children,
                        l = o.map(function(e) {
                            return e !== i ? e : eu.Children.count(a) > 1 ? eu.Children.only(null) : eu.isValidElement(a) ? a.props.children : null
                        });
                    return (0, G.jsx)(ab, ap(ad({}, n), {
                        ref: t,
                        children: eu.isValidElement(a) ? eu.cloneElement(a, void 0, l) : null
                    }))
                }
                return (0, G.jsx)(ab, ap(ad({}, n), {
                    ref: t,
                    children: r
                }))
            });
            av.displayName = "Slot";
            var ab = eu.forwardRef(function(e, t) {
                var r = e.children,
                    n = ay(e, ["children"]);
                if (eu.isValidElement(r)) {
                    var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref;
                    return eu.cloneElement(r, ap(ad({}, function(e, t) {
                        var r = ad({}, t);
                        for (var n in t) ! function(n) {
                            var o = e[n],
                                i = t[n];
                            /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                i.apply(void 0, am(t)), o.apply(void 0, am(t))
                            } : o && (r[n] = o) : "style" === n ? r[n] = ad({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                        }(n);
                        return ad({}, e, r)
                    }(n, r.props)), {
                        ref: t ? og(t, u) : u
                    }))
                }
                return eu.Children.count(r) > 1 ? eu.Children.only(null) : null
            });
            ab.displayName = "SlotClone";
            var ah = function(e) {
                var t = e.children;
                return (0, G.jsx)(G.Fragment, {
                    children: t
                })
            };

            function ag(e) {
                return eu.isValidElement(e) && e.type === ah
            }

            function aw(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function aO(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        aw(e, t, r[t])
                    })
                }
                return e
            }

            function aj(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var ax = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var r = eu.forwardRef(function(e, r) {
                        var n = e.asChild,
                            o = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.keys(e);
                                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                                    return o
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                                }
                                return o
                            }(e, ["asChild"]),
                            i = n ? av : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, G.jsx)(i, aj(aO({}, o), {
                            ref: r
                        }))
                    });
                    return r.displayName = "Primitive.".concat(t), aj(aO({}, e), aw({}, t, r))
                }, {}),
                aS = eu.forwardRef(function(e, t) {
                    var r, n, o = e.children,
                        i = e.width,
                        a = e.height,
                        l = function(e, t) {
                            if (null == e) return {};
                            var r, n, o = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    i = Object.keys(e);
                                for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                                return o
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(e);
                                for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                            }
                            return o
                        }(e, ["children", "width", "height"]);
                    return (0, G.jsx)(ax.svg, (r = function(e) {
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
                        width: void 0 === i ? 10 : i,
                        height: void 0 === a ? 5 : a,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: e.asChild ? o : (0, G.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                        var r = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var n = Object.getOwnPropertySymbols(e);
                            r.push.apply(r, n)
                        }
                        return r
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function aP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aA(e) {
                var t = eu.useRef(e);
                return eu.useEffect(function() {
                    t.current = e
                }), eu.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return aP(e)
                        }(n) || function(e) {
                            if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return aP(e, void 0);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aP(e, t)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function aE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ak(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function aD(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        ak(e, t, r[t])
                    })
                }
                return e
            }

            function aI(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function aN(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function aT(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || aR(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aR(e, t) {
                if (e) {
                    if ("string" == typeof e) return aC(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aC(e, t)
                }
            }
            aS.displayName = "Arrow";
            var aL = "Popper",
                aM = aT(oP(aL), 2),
                a_ = aM[0],
                aU = aM[1],
                aF = aT(a_(aL), 2),
                aB = aF[0],
                aW = aF[1],
                az = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = aT(eu.useState(null), 2),
                        o = n[0],
                        i = n[1];
                    return (0, G.jsx)(aB, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: i,
                        children: r
                    })
                };
            az.displayName = aL;
            var aH = "PopperAnchor",
                aV = eu.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        o = aN(e, ["__scopePopper", "virtualRef"]),
                        i = aW(aH, r),
                        a = eu.useRef(null),
                        l = ow(t, a);
                    return eu.useEffect(function() {
                        i.onAnchorChange((null == n ? void 0 : n.current) || a.current)
                    }), n ? null : (0, G.jsx)(ax.div, aI(aD({}, o), {
                        ref: l
                    }))
                });
            aV.displayName = aH;
            var aK = "PopperContent",
                aX = aT(a_(aK), 2),
                aG = aX[0],
                aq = aX[1],
                aY = eu.forwardRef(function(e, t) {
                    var r, n, o, i, a, l, c, u, s, f, d, p, y = e.__scopePopper,
                        m = e.side,
                        v = e.sideOffset,
                        b = e.align,
                        h = void 0 === b ? "center" : b,
                        g = e.alignOffset,
                        w = e.arrowPadding,
                        O = e.avoidCollisions,
                        j = void 0 === O || O,
                        x = e.collisionBoundary,
                        S = void 0 === x ? [] : x,
                        P = e.collisionPadding,
                        A = void 0 === P ? 0 : P,
                        E = e.sticky,
                        C = e.hideWhenDetached,
                        k = e.updatePositionStrategy,
                        D = void 0 === k ? "optimized" : k,
                        I = e.onPlaced,
                        N = aN(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        T = aW(aK, y),
                        R = aT(eu.useState(null), 2),
                        L = R[0],
                        M = R[1],
                        _ = ow(t, function(e) {
                            return M(e)
                        }),
                        U = aT(eu.useState(null), 2),
                        F = U[0],
                        B = U[1],
                        W = (o = (r = eu.useState(void 0), n = function(e) {
                            if (Array.isArray(e)) return e
                        }(r) || function(e, t) {
                            var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    l = !1;
                                try {
                                    for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                                } catch (e) {
                                    l = !0, n = e
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (l) throw n
                                    }
                                }
                                return i
                            }
                        }(r, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return aE(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aE(e, t)
                            }
                        }(r, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], i = n[1], oE(function() {
                            if (F) {
                                i({
                                    width: F.offsetWidth,
                                    height: F.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, r, n = e[0];
                                        if ("borderBoxSize" in n) {
                                            var o = n.borderBoxSize,
                                                a = Array.isArray(o) ? o[0] : o;
                                            t = a.inlineSize, r = a.blockSize
                                        } else t = F.offsetWidth, r = F.offsetHeight;
                                        i({
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
                            i(void 0)
                        }, [F]), o),
                        z = null != (d = null == W ? void 0 : W.width) ? d : 0,
                        H = null != (p = null == W ? void 0 : W.height) ? p : 0,
                        V = "number" == typeof A ? A : aD({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, A),
                        K = Array.isArray(S) ? S : [S],
                        X = K.length > 0,
                        q = {
                            padding: V,
                            boundary: K.filter(aJ),
                            altBoundary: X
                        },
                        Y = an({
                            strategy: "fixed",
                            placement: (void 0 === m ? "bottom" : m) + ("center" !== h ? "-" + h : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return i0.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return aC(e)
                                })(t) || function(e) {
                                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || aR(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === D
                                }]))
                            },
                            elements: {
                                reference: T.anchor
                            },
                            middleware: [ao({
                                mainAxis: (void 0 === v ? 0 : v) + H,
                                alignmentAxis: void 0 === g ? 0 : g
                            }), j && ai(aD({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === E ? "partial" : E) ? aa() : void 0
                            }, q)), j && al(aD({}, q)), ac(aI(aD({}, q), {
                                apply: function(e) {
                                    var t = e.elements,
                                        r = e.rects,
                                        n = e.availableWidth,
                                        o = e.availableHeight,
                                        i = r.reference,
                                        a = i.width,
                                        l = i.height,
                                        c = t.floating.style;
                                    c.setProperty("--radix-popper-available-width", "".concat(n, "px")), c.setProperty("--radix-popper-available-height", "".concat(o, "px")), c.setProperty("--radix-popper-anchor-width", "".concat(a, "px")), c.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                                }
                            })), F && as({
                                element: F,
                                padding: void 0 === w ? 0 : w
                            }), a0({
                                arrowWidth: z,
                                arrowHeight: H
                            }), void 0 !== C && C && au(aD({
                                strategy: "referenceHidden"
                            }, q))]
                        }),
                        $ = Y.refs,
                        Z = Y.floatingStyles,
                        Q = Y.placement,
                        J = Y.isPositioned,
                        ee = Y.middlewareData,
                        et = aT(a1(Q), 2),
                        er = et[0],
                        en = et[1],
                        eo = aA(I);
                    oE(function() {
                        J && (null == eo || eo())
                    }, [J, eo]);
                    var ei = null == (a = ee.arrow) ? void 0 : a.x,
                        ea = null == (l = ee.arrow) ? void 0 : l.y,
                        el = (null == (c = ee.arrow) ? void 0 : c.centerOffset) !== 0,
                        ec = aT(eu.useState(), 2),
                        es = ec[0],
                        ef = ec[1];
                    return oE(function() {
                        L && ef(window.getComputedStyle(L).zIndex)
                    }, [L]), (0, G.jsx)("div", {
                        ref: $.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: aD(aI(aD({}, Z), ak({
                            transform: J ? Z.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: es
                        }, "--radix-popper-transform-origin", [null == (u = ee.transformOrigin) ? void 0 : u.x, null == (s = ee.transformOrigin) ? void 0 : s.y].join(" "))), (null == (f = ee.hide) ? void 0 : f.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, G.jsx)(aG, {
                            scope: y,
                            placedSide: er,
                            onArrowChange: B,
                            arrowX: ei,
                            arrowY: ea,
                            shouldHideArrow: el,
                            children: (0, G.jsx)(ax.div, aI(aD({
                                "data-side": er,
                                "data-align": en
                            }, N), {
                                ref: _,
                                style: aI(aD({}, N.style), {
                                    animation: J ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            aY.displayName = aK;
            var a$ = "PopperArrow",
                aZ = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                aQ = eu.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        o = aN(e, ["__scopePopper"]),
                        i = aq(a$, n),
                        a = aZ[i.placedSide];
                    return (0, G.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (ak(r = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, a, 0), ak(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), ak(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), ak(r, "visibility", i.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, G.jsx)(aS, aI(aD({}, o), {
                            ref: t,
                            style: aI(aD({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function aJ(e) {
                return null !== e
            }
            aQ.displayName = a$;
            var a0 = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var r, n, o, i, a, l = t.placement,
                            c = t.rects,
                            u = t.middlewareData,
                            s = (null == (r = u.arrow) ? void 0 : r.centerOffset) !== 0,
                            f = s ? 0 : e.arrowWidth,
                            d = s ? 0 : e.arrowHeight,
                            p = aT(a1(l), 2),
                            y = p[0],
                            m = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [p[1]],
                            v = (null != (i = null == (n = u.arrow) ? void 0 : n.x) ? i : 0) + f / 2,
                            b = (null != (a = null == (o = u.arrow) ? void 0 : o.y) ? a : 0) + d / 2,
                            h = "",
                            g = "";
                        return "bottom" === y ? (h = s ? m : "".concat(v, "px"), g = "".concat(-d, "px")) : "top" === y ? (h = s ? m : "".concat(v, "px"), g = "".concat(c.floating.height + d, "px")) : "right" === y ? (h = "".concat(-d, "px"), g = s ? m : "".concat(b, "px")) : "left" === y && (h = "".concat(c.floating.width + d, "px"), g = s ? m : "".concat(b, "px")), {
                            data: {
                                x: h,
                                y: g
                            }
                        }
                    }
                }
            };

            function a1(e) {
                var t = aT(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function a2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var a3 = eu.forwardRef(function(e, t) {
                var r, n, o, i, a, l = e.container,
                    c = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = function(e, t) {
                            if (null == e) return {};
                            var r, n, o = {},
                                i = Object.keys(e);
                            for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                            return o
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var i = Object.getOwnPropertySymbols(e);
                            for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                        }
                        return o
                    }(e, ["container"]),
                    u = (r = eu.useState(!1), function(e) {
                        if (Array.isArray(e)) return e
                    }(r) || function(e, t) {
                        var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                l = !1;
                            try {
                                for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                            } catch (e) {
                                l = !0, n = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (l) throw n
                                }
                            }
                            return i
                        }
                    }(r, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return a2(e, 2);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a2(e, t)
                        }
                    }(r, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    s = u[0],
                    f = u[1];
                oE(function() {
                    return f(!0)
                }, []);
                var d = l || s && (null == (a = globalThis) || null == (i = a.document) ? void 0 : i.body);
                return d ? tO().createPortal((0, G.jsx)(ax.div, (n = function(e) {
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
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(o)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                }), n)), d) : null
            });

            function a6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function a8(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return a6(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a6(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            a3.displayName = "Portal";
            var a5 = function(e) {
                var t, r, n, o, i, a, l, c, u, s, f, d, p, y, m, v, b, h = e.present,
                    g = e.children,
                    w = (t = h, i = (o = a8(eu.useState(), 2))[0], a = o[1], l = eu.useRef({}), c = eu.useRef(t), u = eu.useRef("none"), f = (s = a8((r = t ? "mounted" : "unmounted", n = {
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
                    }, r)), 2))[0], d = s[1], eu.useEffect(function() {
                        var e = a4(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), oE(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = a4(e);
                            t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : r && n !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), c.current = t
                        }
                    }, [t, d]), oE(function() {
                        if (i) {
                            var e, t, r = null != (t = i.ownerDocument.defaultView) ? t : window,
                                n = function(t) {
                                    var n = a4(l.current).includes(t.animationName);
                                    if (t.target === i && n && (d("ANIMATION_END"), !c.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", e = r.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (u.current = a4(l.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", n), i.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(e), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", n), i.removeEventListener("animationend", n)
                                }
                        }
                        d("ANIMATION_END")
                    }, [i, d]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: eu.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    O = "function" == typeof g ? g({
                        present: w.isPresent
                    }) : eu.Children.only(g),
                    j = ow(w.ref, (b = (v = null == (y = Object.getOwnPropertyDescriptor((p = O).props, "ref")) ? void 0 : y.get) && "isReactWarning" in v && v.isReactWarning) ? p.ref : (b = (v = null == (m = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : m.get) && "isReactWarning" in v && v.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || w.isPresent ? eu.cloneElement(O, {
                    ref: j
                }) : null
            };

            function a4(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function a7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function a9(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return a7(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a7(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
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
            a5.displayName = "Presence";
            var lt = eu.forwardRef(function(e, t) {
                var r, n;
                return (0, G.jsx)(ax.span, (r = le({}, e), n = n = {
                    ref: t,
                    style: le({
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
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(n)).forEach(function(e) {
                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                }), r))
            });

            function lr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ln(e) {
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

            function lo(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function li(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function la(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || lc(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ll(e) {
                return function(e) {
                    if (Array.isArray(e)) return lr(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || lc(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lc(e, t) {
                if (e) {
                    if ("string" == typeof e) return lr(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lr(e, t)
                }
            }
            lt.displayName = "VisuallyHidden";
            var lu = la(oP("Tooltip", [aU]), 2),
                ls = lu[0];
            lu[1];
            var lf = aU(),
                ld = "TooltipProvider",
                lp = "tooltip.open",
                ly = la(ls(ld), 2),
                lm = ly[0],
                lv = ly[1],
                lb = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.delayDuration,
                        n = e.skipDelayDuration,
                        o = void 0 === n ? 300 : n,
                        i = e.disableHoverableContent,
                        a = e.children,
                        l = la(eu.useState(!0), 2),
                        c = l[0],
                        u = l[1],
                        s = eu.useRef(!1),
                        f = eu.useRef(0);
                    return eu.useEffect(function() {
                        var e = f.current;
                        return function() {
                            return window.clearTimeout(e)
                        }
                    }, []), (0, G.jsx)(lm, {
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
                        disableHoverableContent: void 0 !== i && i,
                        children: a
                    })
                };
            lb.displayName = ld;
            var lh = "Tooltip",
                lg = la(ls(lh), 2),
                lw = lg[0],
                lO = lg[1],
                lj = function(e) {
                    var t, r, n, o, i, a, l, c, u, s, f, d, p, y, m, v, b, h, g, w, O, j, x = e.__scopeTooltip,
                        S = e.children,
                        P = e.open,
                        A = e.defaultOpen,
                        E = e.onOpenChange,
                        C = e.disableHoverableContent,
                        k = e.delayDuration,
                        D = lv(lh, e.__scopeTooltip),
                        I = lf(x),
                        N = la(eu.useState(null), 2),
                        T = N[0],
                        R = N[1],
                        L = (f = (u = eu.useState(ok()), s = function(e) {
                            if (Array.isArray(e)) return e
                        }(u) || function(e, t) {
                            var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    l = !1;
                                try {
                                    for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                                } catch (e) {
                                    l = !0, n = e
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (l) throw n
                                    }
                                }
                                return i
                            }
                        }(u, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return oC(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oC(e, t)
                            }
                        }(u, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], d = s[1], oE(function() {
                            d(function(e) {
                                return null != e ? e : String(oD++)
                            })
                        }, [c]), c || (f ? "radix-".concat(f) : "")),
                        M = eu.useRef(0),
                        _ = null != C ? C : D.disableHoverableContent,
                        U = null != k ? k : D.delayDuration,
                        F = eu.useRef(!1),
                        B = la((y = (p = {
                            prop: P,
                            defaultProp: void 0 !== A && A,
                            onChange: function(e) {
                                e ? (D.onOpen(), document.dispatchEvent(new CustomEvent(lp))) : D.onClose(), null == E || E(e)
                            }
                        }).prop, h = (b = a9((r = (t = {
                            defaultProp: p.defaultProp,
                            onChange: v = void 0 === (m = p.onChange) ? function() {} : m
                        }).defaultProp, n = t.onChange, i = a9(o = eu.useState(r), 1)[0], a = eu.useRef(i), l = aA(n), eu.useEffect(function() {
                            a.current !== i && (l(i), a.current = i)
                        }, [i, a, l]), o), 2))[0], g = b[1], O = (w = void 0 !== y) ? y : h, j = aA(v), [O, eu.useCallback(function(e) {
                            if (w) {
                                var t = "function" == typeof e ? e(y) : e;
                                t !== y && j(t)
                            } else g(e)
                        }, [w, y, g, j])]), 2),
                        W = B[0],
                        z = void 0 !== W && W,
                        H = B[1],
                        V = eu.useMemo(function() {
                            return z ? F.current ? "delayed-open" : "instant-open" : "closed"
                        }, [z]),
                        K = eu.useCallback(function() {
                            window.clearTimeout(M.current), M.current = 0, F.current = !1, H(!0)
                        }, [H]),
                        X = eu.useCallback(function() {
                            window.clearTimeout(M.current), M.current = 0, H(!1)
                        }, [H]),
                        q = eu.useCallback(function() {
                            window.clearTimeout(M.current), M.current = window.setTimeout(function() {
                                F.current = !0, H(!0), M.current = 0
                            }, U)
                        }, [U, H]);
                    return eu.useEffect(function() {
                        return function() {
                            M.current && (window.clearTimeout(M.current), M.current = 0)
                        }
                    }, []), (0, G.jsx)(az, lo(ln({}, I), {
                        children: (0, G.jsx)(lw, {
                            scope: x,
                            contentId: L,
                            open: z,
                            stateAttribute: V,
                            trigger: T,
                            onTriggerChange: R,
                            onTriggerEnter: eu.useCallback(function() {
                                D.isOpenDelayed ? q() : K()
                            }, [D.isOpenDelayed, q, K]),
                            onTriggerLeave: eu.useCallback(function() {
                                _ ? X() : (window.clearTimeout(M.current), M.current = 0)
                            }, [X, _]),
                            onOpen: K,
                            onClose: X,
                            disableHoverableContent: _,
                            children: S
                        })
                    }))
                };
            lj.displayName = lh;
            var lx = "TooltipTrigger",
                lS = eu.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = li(e, ["__scopeTooltip"]),
                        o = lO(lx, r),
                        i = lv(lx, r),
                        a = lf(r),
                        l = ow(t, eu.useRef(null), o.onTriggerChange),
                        c = eu.useRef(!1),
                        u = eu.useRef(!1),
                        s = eu.useCallback(function() {
                            return c.current = !1
                        }, []);
                    return eu.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", s)
                        }
                    }, [s]), (0, G.jsx)(aV, lo(ln({
                        asChild: !0
                    }, a), {
                        children: (0, G.jsx)(ax.button, lo(ln({
                            "aria-describedby": o.open ? o.contentId : void 0,
                            "data-state": o.stateAttribute
                        }, n), {
                            ref: l,
                            onPointerMove: ov(e.onPointerMove, function(e) {
                                "touch" !== e.pointerType && (u.current || i.isPointerInTransitRef.current || (o.onTriggerEnter(), u.current = !0))
                            }),
                            onPointerLeave: ov(e.onPointerLeave, function() {
                                o.onTriggerLeave(), u.current = !1
                            }),
                            onPointerDown: ov(e.onPointerDown, function() {
                                c.current = !0, document.addEventListener("pointerup", s, {
                                    once: !0
                                })
                            }),
                            onFocus: ov(e.onFocus, function() {
                                c.current || o.onOpen()
                            }),
                            onBlur: ov(e.onBlur, o.onClose),
                            onClick: ov(e.onClick, o.onClose)
                        }))
                    }))
                });
            lS.displayName = lx;
            var lP = "TooltipPortal",
                lA = la(ls(lP, {
                    forceMount: void 0
                }), 2),
                lE = lA[0],
                lC = lA[1],
                lk = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        i = lO(lP, t);
                    return (0, G.jsx)(lE, {
                        scope: t,
                        forceMount: r,
                        children: (0, G.jsx)(a5, {
                            present: r || i.open,
                            children: (0, G.jsx)(a3, {
                                asChild: !0,
                                container: o,
                                children: n
                            })
                        })
                    })
                };
            lk.displayName = lP;
            var lD = "TooltipContent",
                lI = eu.forwardRef(function(e, t) {
                    var r = lC(lD, e.__scopeTooltip),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = e.side,
                        a = void 0 === i ? "top" : i,
                        l = li(e, ["forceMount", "side"]),
                        c = lO(lD, e.__scopeTooltip);
                    return (0, G.jsx)(a5, {
                        present: o || c.open,
                        children: c.disableHoverableContent ? (0, G.jsx)(lM, lo(ln({
                            side: a
                        }, l), {
                            ref: t
                        })) : (0, G.jsx)(lN, lo(ln({
                            side: a
                        }, l), {
                            ref: t
                        }))
                    })
                }),
                lN = eu.forwardRef(function(e, t) {
                    var r = lO(lD, e.__scopeTooltip),
                        n = lv(lD, e.__scopeTooltip),
                        o = eu.useRef(null),
                        i = ow(t, o),
                        a = la(eu.useState(null), 2),
                        l = a[0],
                        c = a[1],
                        u = r.trigger,
                        s = r.onClose,
                        f = o.current,
                        d = n.onPointerInTransitChange,
                        p = eu.useCallback(function() {
                            c(null), d(!1)
                        }, [d]),
                        y = eu.useCallback(function(e, t) {
                            var r, n, o, i, a, l, u = e.currentTarget,
                                s = {
                                    x: e.clientX,
                                    y: e.clientY
                                },
                                f = function(e, t) {
                                    var r = Math.abs(t.top - e.y),
                                        n = Math.abs(t.bottom - e.y),
                                        o = Math.abs(t.right - e.x),
                                        i = Math.abs(t.left - e.x);
                                    switch (Math.min(r, n, o, i)) {
                                        case i:
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
                                p = function(e, t) {
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
                                y = (n = (r = t.getBoundingClientRect()).top, o = r.right, i = r.bottom, [{
                                    x: a = r.left,
                                    y: n
                                }, {
                                    x: o,
                                    y: n
                                }, {
                                    x: o,
                                    y: i
                                }, {
                                    x: a,
                                    y: i
                                }]);
                            c(((l = ll(p).concat(ll(y)).slice()).sort(function(e, t) {
                                return e.x < t.x ? -1 : e.x > t.x ? 1 : e.y < t.y ? -1 : 1 * !!(e.y > t.y)
                            }), function(e) {
                                if (e.length <= 1) return e.slice();
                                for (var t = [], r = 0; r < e.length; r++) {
                                    for (var n = e[r]; t.length >= 2;) {
                                        var o = t[t.length - 1],
                                            i = t[t.length - 2];
                                        if ((o.x - i.x) * (n.y - i.y) >= (o.y - i.y) * (n.x - i.x)) t.pop();
                                        else break
                                    }
                                    t.push(n)
                                }
                                t.pop();
                                for (var a = [], l = e.length - 1; l >= 0; l--) {
                                    for (var c = e[l]; a.length >= 2;) {
                                        var u = a[a.length - 1],
                                            s = a[a.length - 2];
                                        if ((u.x - s.x) * (c.y - s.y) >= (u.y - s.y) * (c.x - s.x)) a.pop();
                                        else break
                                    }
                                    a.push(c)
                                }
                                return (a.pop(), 1 === t.length && 1 === a.length && t[0].x === a[0].x && t[0].y === a[0].y) ? t : t.concat(a)
                            }(l))), d(!0)
                        }, [d]);
                    return eu.useEffect(function() {
                        return function() {
                            return p()
                        }
                    }, [p]), eu.useEffect(function() {
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
                    }, [u, f, y, p]), eu.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                var t = e.target,
                                    r = {
                                        x: e.clientX,
                                        y: e.clientY
                                    },
                                    n = (null == u ? void 0 : u.contains(t)) || (null == f ? void 0 : f.contains(t)),
                                    o = ! function(e, t) {
                                        for (var r = e.x, n = e.y, o = !1, i = 0, a = t.length - 1; i < t.length; a = i++) {
                                            var l = t[i].x,
                                                c = t[i].y,
                                                u = t[a].x,
                                                s = t[a].y;
                                            c > n != s > n && r < (u - l) * (n - c) / (s - c) + l && (o = !o)
                                        }
                                        return o
                                    }(r, l);
                                n ? p() : o && (p(), s())
                            };
                            return document.addEventListener("pointermove", e),
                                function() {
                                    return document.removeEventListener("pointermove", e)
                                }
                        }
                    }, [u, f, l, s, p]), (0, G.jsx)(lM, lo(ln({}, e), {
                        ref: i
                    }))
                }),
                lT = la(ls(lh, {
                    isInside: !1
                }), 2),
                lR = lT[0],
                lL = lT[1],
                lM = eu.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = e.children,
                        o = e["aria-label"],
                        i = e.onEscapeKeyDown,
                        a = e.onPointerDownOutside,
                        l = li(e, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        c = lO(lD, r),
                        u = lf(r),
                        s = c.onClose;
                    return eu.useEffect(function() {
                        return document.addEventListener(lp, s),
                            function() {
                                return document.removeEventListener(lp, s)
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
                    }, [c.trigger, s]), (0, G.jsx)(tg.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: i,
                        onPointerDownOutside: a,
                        onFocusOutside: function(e) {
                            return e.preventDefault()
                        },
                        onDismiss: s,
                        children: (0, G.jsxs)(aY, lo(ln({
                            "data-state": c.stateAttribute
                        }, u, l), {
                            ref: t,
                            style: ln({}, l.style, {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, G.jsx)(ah, {
                                children: n
                            }), (0, G.jsx)(lR, {
                                scope: r,
                                isInside: !0,
                                children: (0, G.jsx)(lt, {
                                    id: c.contentId,
                                    role: "tooltip",
                                    children: o || n
                                })
                            })]
                        }))
                    })
                });
            lI.displayName = lD;
            var l_ = "TooltipArrow",
                lU = eu.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = li(e, ["__scopeTooltip"]),
                        o = lf(r);
                    return lL(l_, r).isInside ? null : (0, G.jsx)(aQ, lo(ln({}, o, n), {
                        ref: t
                    }))
                });

            function lF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lB(e) {
                var t, r = e.position,
                    n = e.hasBeak,
                    o = e.title,
                    i = e.description,
                    a = e.ariaLabel,
                    l = e.delayDurationMs,
                    c = e.children,
                    u = e.open,
                    s = e.onOpenChange,
                    f = e.contentClassName,
                    d = (t = r.split("-"), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                l = !1;
                            try {
                                for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                            } catch (e) {
                                l = !0, n = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (l) throw n
                                }
                            }
                            return i
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return lF(e, 2);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lF(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    p = d[0],
                    y = d[1],
                    m = null != a ? a : "string" == typeof o && null == i ? o : void 0;
                return eu.createElement(lb, {
                    delayDuration: void 0 === l ? 500 : l
                }, eu.createElement(lj, {
                    open: u,
                    onOpenChange: s
                }, c, eu.createElement(lk, null, eu.createElement(lI, {
                    side: p,
                    align: y,
                    "aria-label": m,
                    className: eJ("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", f),
                    sideOffset: 5
                }, (void 0 === n || n) && eu.createElement(lU, {
                    asChild: !0
                }, eu.createElement(om, {
                    className: "content-[var(--inverse-surface-0)]"
                })), eu.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, eu.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, o), i && eu.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, i))))))
            }

            function lW(e) {
                var t = e.children,
                    r = e.asChild,
                    n = e.className;
                return eu.createElement(lS, {
                    asChild: r,
                    className: n
                }, t)
            }
            lU.displayName = l_;
            var lz = function(e) {
                    var t = e.title,
                        r = e.description,
                        n = e.position;
                    return es().createElement(lB, {
                        position: void 0 === n ? "top-center" : n,
                        title: t,
                        description: r
                    }, es().createElement(lW, {
                        asChild: !0
                    }, es().createElement("span", {
                        role: "button",
                        tabIndex: 0,
                        "aria-label": t,
                        className: "flex items-center content-muted",
                        "data-testid": "label-tooltip-trigger"
                    }, es().createElement(e3, {
                        name: "icon-regular-circle-i",
                        size: "Small"
                    }))))
                },
                lH = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                lV = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                };

            function lK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lX(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                l = !1;
                            try {
                                for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                            } catch (e) {
                                l = !0, n = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (l) throw n
                                }
                            }
                            return i
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return lK(e, 2);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lK(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0];
                return Math.min(r[1], Math.max(n, e))
            }

            function lG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lq(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function lY(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        lq(e, t, r[t])
                    })
                }
                return e
            }

            function l$(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return lG(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lG(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var lZ = eu.createContext(void 0);

            function lQ(e) {
                var t = eu.useContext(lZ);
                return e || t || "ltr"
            }
            var lJ = eu.forwardRef(function(e, t) {
                var r, n, o = e.children,
                    i = e.width,
                    a = e.height,
                    l = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = function(e, t) {
                            if (null == e) return {};
                            var r, n, o = {},
                                i = Object.keys(e);
                            for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                            return o
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var i = Object.getOwnPropertySymbols(e);
                            for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                        }
                        return o
                    }(e, ["children", "width", "height"]);
                return (0, G.jsx)(tT.svg, (r = function(e) {
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
                    width: void 0 === i ? 10 : i,
                    height: void 0 === a ? 5 : a,
                    viewBox: "0 0 30 10",
                    preserveAspectRatio: "none",
                    children: e.asChild ? o : (0, G.jsx)("polygon", {
                        points: "0,0 30,0 15,10"
                    })
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(n)).forEach(function(e) {
                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                }), r))
            });

            function l0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function l1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function l2(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function l3(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        l2(e, t, r[t])
                    })
                }
                return e
            }

            function l6(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function l8(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function l5(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || l4(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function l4(e, t) {
                if (e) {
                    if ("string" == typeof e) return l1(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l1(e, t)
                }
            }
            lJ.displayName = "Arrow";
            var l7 = "Popper",
                l9 = l5(tl(l7), 2),
                ce = l9[0],
                ct = l9[1],
                cr = l5(ce(l7), 2),
                cn = cr[0],
                co = cr[1],
                ci = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = l5(eu.useState(null), 2),
                        o = n[0],
                        i = n[1];
                    return (0, G.jsx)(cn, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: i,
                        children: r
                    })
                };
            ci.displayName = l7;
            var ca = "PopperAnchor",
                cl = eu.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        o = l8(e, ["__scopePopper", "virtualRef"]),
                        i = co(ca, r),
                        a = eu.useRef(null),
                        l = tt(t, a);
                    return eu.useEffect(function() {
                        i.onAnchorChange((null == n ? void 0 : n.current) || a.current)
                    }), n ? null : (0, G.jsx)(tT.div, l6(l3({}, o), {
                        ref: l
                    }))
                });
            cl.displayName = ca;
            var cc = "PopperContent",
                cu = l5(ce(cc), 2),
                cs = cu[0],
                cf = cu[1],
                cd = eu.forwardRef(function(e, t) {
                    var r, n, o, i, a, l, c, u, s, f, d, p, y = e.__scopePopper,
                        m = e.side,
                        v = e.sideOffset,
                        b = e.align,
                        h = void 0 === b ? "center" : b,
                        g = e.alignOffset,
                        w = e.arrowPadding,
                        O = e.avoidCollisions,
                        j = void 0 === O || O,
                        x = e.collisionBoundary,
                        S = void 0 === x ? [] : x,
                        P = e.collisionPadding,
                        A = void 0 === P ? 0 : P,
                        E = e.sticky,
                        C = e.hideWhenDetached,
                        k = e.updatePositionStrategy,
                        D = void 0 === k ? "optimized" : k,
                        I = e.onPlaced,
                        N = l8(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        T = co(cc, y),
                        R = l5(eu.useState(null), 2),
                        L = R[0],
                        M = R[1],
                        _ = tt(t, function(e) {
                            return M(e)
                        }),
                        U = l5(eu.useState(null), 2),
                        F = U[0],
                        B = U[1],
                        W = (o = (r = eu.useState(void 0), n = function(e) {
                            if (Array.isArray(e)) return e
                        }(r) || function(e, t) {
                            var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    l = !1;
                                try {
                                    for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                                } catch (e) {
                                    l = !0, n = e
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (l) throw n
                                    }
                                }
                                return i
                            }
                        }(r, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return l0(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l0(e, t)
                            }
                        }(r, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], i = n[1], tu(function() {
                            if (F) {
                                i({
                                    width: F.offsetWidth,
                                    height: F.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, r, n = e[0];
                                        if ("borderBoxSize" in n) {
                                            var o = n.borderBoxSize,
                                                a = Array.isArray(o) ? o[0] : o;
                                            t = a.inlineSize, r = a.blockSize
                                        } else t = F.offsetWidth, r = F.offsetHeight;
                                        i({
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
                            i(void 0)
                        }, [F]), o),
                        z = null != (d = null == W ? void 0 : W.width) ? d : 0,
                        H = null != (p = null == W ? void 0 : W.height) ? p : 0,
                        V = "number" == typeof A ? A : l3({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, A),
                        K = Array.isArray(S) ? S : [S],
                        X = K.length > 0,
                        q = {
                            padding: V,
                            boundary: K.filter(cv),
                            altBoundary: X
                        },
                        Y = an({
                            strategy: "fixed",
                            placement: (void 0 === m ? "bottom" : m) + ("center" !== h ? "-" + h : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return i0.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return l1(e)
                                })(t) || function(e) {
                                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || l4(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === D
                                }]))
                            },
                            elements: {
                                reference: T.anchor
                            },
                            middleware: [ao({
                                mainAxis: (void 0 === v ? 0 : v) + H,
                                alignmentAxis: void 0 === g ? 0 : g
                            }), j && ai(l3({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === E ? "partial" : E) ? aa() : void 0
                            }, q)), j && al(l3({}, q)), ac(l6(l3({}, q), {
                                apply: function(e) {
                                    var t = e.elements,
                                        r = e.rects,
                                        n = e.availableWidth,
                                        o = e.availableHeight,
                                        i = r.reference,
                                        a = i.width,
                                        l = i.height,
                                        c = t.floating.style;
                                    c.setProperty("--radix-popper-available-width", "".concat(n, "px")), c.setProperty("--radix-popper-available-height", "".concat(o, "px")), c.setProperty("--radix-popper-anchor-width", "".concat(a, "px")), c.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                                }
                            })), F && as({
                                element: F,
                                padding: void 0 === w ? 0 : w
                            }), cb({
                                arrowWidth: z,
                                arrowHeight: H
                            }), void 0 !== C && C && au(l3({
                                strategy: "referenceHidden"
                            }, q))]
                        }),
                        $ = Y.refs,
                        Z = Y.floatingStyles,
                        Q = Y.placement,
                        J = Y.isPositioned,
                        ee = Y.middlewareData,
                        et = l5(ch(Q), 2),
                        er = et[0],
                        en = et[1],
                        eo = tm(I);
                    tu(function() {
                        J && (null == eo || eo())
                    }, [J, eo]);
                    var ei = null == (a = ee.arrow) ? void 0 : a.x,
                        ea = null == (l = ee.arrow) ? void 0 : l.y,
                        el = (null == (c = ee.arrow) ? void 0 : c.centerOffset) !== 0,
                        ec = l5(eu.useState(), 2),
                        es = ec[0],
                        ef = ec[1];
                    return tu(function() {
                        L && ef(window.getComputedStyle(L).zIndex)
                    }, [L]), (0, G.jsx)("div", {
                        ref: $.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: l3(l6(l3({}, Z), l2({
                            transform: J ? Z.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: es
                        }, "--radix-popper-transform-origin", [null == (u = ee.transformOrigin) ? void 0 : u.x, null == (s = ee.transformOrigin) ? void 0 : s.y].join(" "))), (null == (f = ee.hide) ? void 0 : f.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, G.jsx)(cs, {
                            scope: y,
                            placedSide: er,
                            onArrowChange: B,
                            arrowX: ei,
                            arrowY: ea,
                            shouldHideArrow: el,
                            children: (0, G.jsx)(tT.div, l6(l3({
                                "data-side": er,
                                "data-align": en
                            }, N), {
                                ref: _,
                                style: l6(l3({}, N.style), {
                                    animation: J ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            cd.displayName = cc;
            var cp = "PopperArrow",
                cy = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                cm = eu.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        o = l8(e, ["__scopePopper"]),
                        i = cf(cp, n),
                        a = cy[i.placedSide];
                    return (0, G.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (l2(r = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, a, 0), l2(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), l2(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), l2(r, "visibility", i.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, G.jsx)(lJ, l6(l3({}, o), {
                            ref: t,
                            style: l6(l3({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function cv(e) {
                return null !== e
            }
            cm.displayName = cp;
            var cb = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var r, n, o, i, a, l = t.placement,
                            c = t.rects,
                            u = t.middlewareData,
                            s = (null == (r = u.arrow) ? void 0 : r.centerOffset) !== 0,
                            f = s ? 0 : e.arrowWidth,
                            d = s ? 0 : e.arrowHeight,
                            p = l5(ch(l), 2),
                            y = p[0],
                            m = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [p[1]],
                            v = (null != (i = null == (n = u.arrow) ? void 0 : n.x) ? i : 0) + f / 2,
                            b = (null != (a = null == (o = u.arrow) ? void 0 : o.y) ? a : 0) + d / 2,
                            h = "",
                            g = "";
                        return "bottom" === y ? (h = s ? m : "".concat(v, "px"), g = "".concat(-d, "px")) : "top" === y ? (h = s ? m : "".concat(v, "px"), g = "".concat(c.floating.height + d, "px")) : "right" === y ? (h = "".concat(-d, "px"), g = s ? m : "".concat(b, "px")) : "left" === y && (h = "".concat(c.floating.width + d, "px"), g = s ? m : "".concat(b, "px")), {
                            data: {
                                x: h,
                                y: g
                            }
                        }
                    }
                }
            };

            function ch(e) {
                var t = l5(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function cg(e) {
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
            var cw = eu.forwardRef(function(e, t) {
                var r, n;
                return (0, G.jsx)(tT.span, (r = cg({}, e), n = n = {
                    ref: t,
                    style: cg({
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
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(n)).forEach(function(e) {
                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                }), r))
            });

            function cO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cj(e) {
                if (Array.isArray(e)) return e
            }

            function cx() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function cS(e) {
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

            function cP(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function cA(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function cE(e, t) {
                return cj(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || cC(e, t) || cx()
            }

            function cC(e, t) {
                if (e) {
                    if ("string" == typeof e) return cO(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cO(e, t)
                }
            }
            cw.displayName = "VisuallyHidden";
            var ck = [" ", "Enter", "ArrowUp", "ArrowDown"],
                cD = [" ", "Enter"],
                cI = "Select",
                cN = cE((v = (m = l$(tl(y = cI + "CollectionProvider"), 2))[0], b = m[1], g = (h = l$(v(y, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], w = h[1], (O = function(e) {
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
                }).displayName = y, x = tE(j = cI + "CollectionSlot"), (S = es().forwardRef(function(e, t) {
                    var r = e.scope,
                        n = e.children,
                        o = tt(t, w(j, r).collectionRef);
                    return (0, G.jsx)(x, {
                        ref: o,
                        children: n
                    })
                })).displayName = j, A = "data-radix-collection-item", E = tE(P = cI + "CollectionItemSlot"), (C = es().forwardRef(function(e, t) {
                    var r, n, o = e.scope,
                        i = e.children,
                        a = function(e, t) {
                            if (null == e) return {};
                            var r, n, o = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    i = Object.keys(e);
                                for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                                return o
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(e);
                                for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                            }
                            return o
                        }(e, ["scope", "children"]),
                        l = es().useRef(null),
                        c = tt(t, l),
                        u = w(P, o);
                    return es().useEffect(function() {
                        return u.itemMap.set(l, lY({
                                ref: l
                            }, a)),
                            function() {
                                u.itemMap.delete(l)
                            }
                    }), (0, G.jsx)(E, (r = lY({}, lq({}, A, "")), n = n = {
                        ref: c,
                        children: i
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                        var r = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var n = Object.getOwnPropertySymbols(e);
                            r.push.apply(r, n)
                        }
                        return r
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                })).displayName = P, [{
                    Provider: O,
                    Slot: S,
                    ItemSlot: C
                }, function(e) {
                    var t = w(cI + "CollectionConsumer", e);
                    return es().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var r = Array.from(e.querySelectorAll("[".concat(A, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return r.indexOf(e.ref.current) - r.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, b]), 3),
                cT = cN[0],
                cR = cN[1],
                cL = cE(tl(cI, [cN[2], ct]), 2),
                cM = cL[0];
            cL[1];
            var c_ = ct(),
                cU = cE(cM(cI), 2),
                cF = cU[0],
                cB = cU[1],
                cW = cE(cM(cI), 2),
                cz = cW[0],
                cH = cW[1],
                cV = function(e) {
                    var t = e.__scopeSelect,
                        r = e.children,
                        n = e.open,
                        o = e.defaultOpen,
                        i = e.onOpenChange,
                        a = e.value,
                        l = e.defaultValue,
                        c = e.onValueChange,
                        u = e.dir,
                        s = e.name,
                        f = e.autoComplete,
                        d = e.disabled,
                        p = e.required,
                        y = e.form,
                        m = c_(t),
                        v = cE(eu.useState(null), 2),
                        b = v[0],
                        h = v[1],
                        g = cE(eu.useState(null), 2),
                        w = g[0],
                        O = g[1],
                        j = cE(eu.useState(!1), 2),
                        x = j[0],
                        S = j[1],
                        P = lQ(u),
                        A = cE(th({
                            prop: n,
                            defaultProp: o,
                            onChange: i
                        }), 2),
                        E = A[0],
                        C = A[1],
                        k = cE(th({
                            prop: a,
                            defaultProp: l,
                            onChange: c
                        }), 2),
                        D = k[0],
                        I = k[1],
                        N = eu.useRef(null),
                        T = !b || y || !!b.closest("form"),
                        R = cE(eu.useState(new Set), 2),
                        L = R[0],
                        M = R[1],
                        _ = Array.from(L).map(function(e) {
                            return e.props.value
                        }).join(";");
                    return (0, G.jsx)(ci, cP(cS({}, m), {
                        children: (0, G.jsxs)(cF, {
                            required: p,
                            scope: t,
                            trigger: b,
                            onTriggerChange: h,
                            valueNode: w,
                            onValueNodeChange: O,
                            valueNodeHasChildren: x,
                            onValueNodeHasChildrenChange: S,
                            contentId: tp(),
                            value: D,
                            onValueChange: I,
                            open: void 0 !== E && E,
                            onOpenChange: C,
                            dir: P,
                            triggerPointerDownPosRef: N,
                            disabled: d,
                            children: [(0, G.jsx)(cT.Provider, {
                                scope: t,
                                children: (0, G.jsx)(cz, {
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
                            }), T ? (0, G.jsxs)(ug, {
                                "aria-hidden": !0,
                                required: p,
                                tabIndex: -1,
                                name: s,
                                autoComplete: f,
                                value: D,
                                onChange: function(e) {
                                    return I(e.target.value)
                                },
                                disabled: d,
                                form: y,
                                children: [void 0 === D ? (0, G.jsx)("option", {
                                    value: ""
                                }) : null, Array.from(L)]
                            }, _) : null]
                        })
                    }))
                };
            cV.displayName = cI;
            var cK = "SelectTrigger",
                cX = eu.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.disabled,
                        o = cA(e, ["__scopeSelect", "disabled"]),
                        i = c_(r),
                        a = cB(cK, r),
                        l = a.disabled || void 0 !== n && n,
                        c = tt(t, a.onTriggerChange),
                        u = cR(r),
                        s = eu.useRef("touch"),
                        f = cE(uw(function(e) {
                            var t = u().filter(function(e) {
                                    return !e.disabled
                                }),
                                r = t.find(function(e) {
                                    return e.value === a.value
                                }),
                                n = uO(t, e, r);
                            void 0 !== n && a.onValueChange(n.value)
                        }), 3),
                        d = f[0],
                        p = f[1],
                        y = f[2],
                        m = function(e) {
                            l || (a.onOpenChange(!0), y()), e && (a.triggerPointerDownPosRef.current = {
                                x: Math.round(e.pageX),
                                y: Math.round(e.pageY)
                            })
                        };
                    return (0, G.jsx)(cl, cP(cS({
                        asChild: !0
                    }, i), {
                        children: (0, G.jsx)(tT.button, cP(cS({
                            type: "button",
                            role: "combobox",
                            "aria-controls": a.contentId,
                            "aria-expanded": a.open,
                            "aria-required": a.required,
                            "aria-autocomplete": "none",
                            dir: a.dir,
                            "data-state": a.open ? "open" : "closed",
                            disabled: l,
                            "data-disabled": l ? "" : void 0,
                            "data-placeholder": uh(a.value) ? "" : void 0
                        }, o), {
                            ref: c,
                            onClick: e4(o.onClick, function(e) {
                                e.currentTarget.focus(), "mouse" !== s.current && m(e)
                            }),
                            onPointerDown: e4(o.onPointerDown, function(e) {
                                s.current = e.pointerType;
                                var t = e.target;
                                t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (m(e), e.preventDefault())
                            }),
                            onKeyDown: e4(o.onKeyDown, function(e) {
                                var t = "" !== d.current;
                                e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || p(e.key), (!t || " " !== e.key) && ck.includes(e.key) && (m(), e.preventDefault())
                            })
                        }))
                    }))
                });
            cX.displayName = cK;
            var cG = "SelectValue",
                cq = eu.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = (e.className, e.style, e.children),
                        o = e.placeholder,
                        i = cA(e, ["__scopeSelect", "className", "style", "children", "placeholder"]),
                        a = cB(cG, r),
                        l = a.onValueNodeHasChildrenChange,
                        c = void 0 !== n,
                        u = tt(t, a.onValueNodeChange);
                    return tu(function() {
                        l(c)
                    }, [l, c]), (0, G.jsx)(tT.span, cP(cS({}, i), {
                        ref: u,
                        style: {
                            pointerEvents: "none"
                        },
                        children: uh(a.value) ? (0, G.jsx)(G.Fragment, {
                            children: void 0 === o ? "" : o
                        }) : n
                    }))
                });
            cq.displayName = cG;
            var cY = eu.forwardRef(function(e, t) {
                e.__scopeSelect;
                var r = e.children,
                    n = cA(e, ["__scopeSelect", "children"]);
                return (0, G.jsx)(tT.span, cP(cS({
                    "aria-hidden": !0
                }, n), {
                    ref: t,
                    children: r || "▼"
                }))
            });
            cY.displayName = "SelectIcon";
            var c$ = function(e) {
                return (0, G.jsx)(tG, cS({
                    asChild: !0
                }, e))
            };
            c$.displayName = "SelectPortal";
            var cZ = "SelectContent",
                cQ = eu.forwardRef(function(e, t) {
                    var r = cB(cZ, e.__scopeSelect),
                        n = cE(eu.useState(), 2),
                        o = n[0],
                        i = n[1];
                    return (tu(function() {
                        i(new DocumentFragment)
                    }, []), r.open) ? (0, G.jsx)(c3, cP(cS({}, e), {
                        ref: t
                    })) : o ? tw.createPortal((0, G.jsx)(c0, {
                        scope: e.__scopeSelect,
                        children: (0, G.jsx)(cT.Slot, {
                            scope: e.__scopeSelect,
                            children: (0, G.jsx)("div", {
                                children: e.children
                            })
                        })
                    }), o) : null
                });
            cQ.displayName = cZ;
            var cJ = cE(cM(cZ), 2),
                c0 = cJ[0],
                c1 = cJ[1],
                c2 = tE("SelectContent.RemoveScroll"),
                c3 = eu.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.position,
                        o = void 0 === n ? "item-aligned" : n,
                        i = e.onCloseAutoFocus,
                        a = e.onEscapeKeyDown,
                        l = e.onPointerDownOutside,
                        c = e.side,
                        u = e.sideOffset,
                        s = e.align,
                        f = e.alignOffset,
                        d = e.arrowPadding,
                        p = e.collisionBoundary,
                        y = e.collisionPadding,
                        m = e.sticky,
                        v = e.hideWhenDetached,
                        b = e.avoidCollisions,
                        h = cA(e, ["__scopeSelect", "position", "onCloseAutoFocus", "onEscapeKeyDown", "onPointerDownOutside", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "avoidCollisions"]),
                        g = cB(cZ, r),
                        w = cE(eu.useState(null), 2),
                        O = w[0],
                        j = w[1],
                        x = cE(eu.useState(null), 2),
                        S = x[0],
                        P = x[1],
                        A = tt(t, function(e) {
                            return j(e)
                        }),
                        E = cE(eu.useState(null), 2),
                        C = E[0],
                        k = E[1],
                        D = cE(eu.useState(null), 2),
                        I = D[0],
                        N = D[1],
                        T = cR(r),
                        R = cE(eu.useState(!1), 2),
                        L = R[0],
                        M = R[1],
                        _ = eu.useRef(!1);
                    eu.useEffect(function() {
                        if (O) return rL(O)
                    }, [O]), (0, tQ.useFocusGuards)();
                    var U = eu.useCallback(function(e) {
                            var t = cj(c = T().map(function(e) {
                                    return e.ref.current
                                })) || function(e) {
                                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(c) || cC(c) || cx(),
                                r = t[0],
                                n = cE(t.slice(1).slice(-1), 1)[0],
                                o = document.activeElement,
                                i = !0,
                                a = !1,
                                l = void 0;
                            try {
                                for (var c, u, s = e[Symbol.iterator](); !(i = (u = s.next()).done); i = !0) {
                                    var f = u.value;
                                    if (f === o || (null == f || f.scrollIntoView({
                                            block: "nearest"
                                        }), f === r && S && (S.scrollTop = 0), f === n && S && (S.scrollTop = S.scrollHeight), null == f || f.focus(), document.activeElement !== o)) return
                                }
                            } catch (e) {
                                a = !0, l = e
                            } finally {
                                try {
                                    i || null == s.return || s.return()
                                } finally {
                                    if (a) throw l
                                }
                            }
                        }, [T, S]),
                        F = eu.useCallback(function() {
                            return U([C, O])
                        }, [U, C, O]);
                    eu.useEffect(function() {
                        L && F()
                    }, [L, F]);
                    var B = g.onOpenChange,
                        W = g.triggerPointerDownPosRef;
                    eu.useEffect(function() {
                        if (O) {
                            var e = {
                                    x: 0,
                                    y: 0
                                },
                                t = function(t) {
                                    var r, n, o, i;
                                    e = {
                                        x: Math.abs(Math.round(t.pageX) - (null != (o = null == (r = W.current) ? void 0 : r.x) ? o : 0)),
                                        y: Math.abs(Math.round(t.pageY) - (null != (i = null == (n = W.current) ? void 0 : n.y) ? i : 0))
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
                    }, [O, B, W]), eu.useEffect(function() {
                        var e = function() {
                            return B(!1)
                        };
                        return window.addEventListener("blur", e), window.addEventListener("resize", e),
                            function() {
                                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
                            }
                    }, [B]);
                    var z = cE(uw(function(e) {
                            var t = T().filter(function(e) {
                                    return !e.disabled
                                }),
                                r = t.find(function(e) {
                                    return e.ref.current === document.activeElement
                                }),
                                n = uO(t, e, r);
                            n && setTimeout(function() {
                                return n.ref.current.focus()
                            })
                        }), 2),
                        H = z[0],
                        V = z[1],
                        K = eu.useCallback(function(e, t, r) {
                            var n = !_.current && !r;
                            (void 0 !== g.value && g.value === t || n) && (k(e), n && (_.current = !0))
                        }, [g.value]),
                        X = eu.useCallback(function() {
                            return null == O ? void 0 : O.focus()
                        }, [O]),
                        q = eu.useCallback(function(e, t, r) {
                            var n = !_.current && !r;
                            (void 0 !== g.value && g.value === t || n) && N(e)
                        }, [g.value]),
                        Y = "popper" === o ? c8 : c6,
                        $ = Y === c8 ? {
                            side: c,
                            sideOffset: u,
                            align: s,
                            alignOffset: f,
                            arrowPadding: d,
                            collisionBoundary: p,
                            collisionPadding: y,
                            sticky: m,
                            hideWhenDetached: v,
                            avoidCollisions: b
                        } : {};
                    return (0, G.jsx)(c0, {
                        scope: r,
                        content: O,
                        viewport: S,
                        onViewportChange: P,
                        itemRefCallback: K,
                        selectedItem: C,
                        onItemLeave: X,
                        itemTextRefCallback: q,
                        focusSelectedItem: F,
                        selectedItemText: I,
                        position: o,
                        isPositioned: L,
                        searchRef: H,
                        children: (0, G.jsx)(rC, {
                            as: c2,
                            allowPinchZoom: !0,
                            children: (0, G.jsx)(tB, {
                                asChild: !0,
                                trapped: g.open,
                                onMountAutoFocus: function(e) {
                                    e.preventDefault()
                                },
                                onUnmountAutoFocus: e4(i, function(e) {
                                    var t;
                                    null == (t = g.trigger) || t.focus({
                                        preventScroll: !0
                                    }), e.preventDefault()
                                }),
                                children: (0, G.jsx)(tg.DismissableLayer, {
                                    asChild: !0,
                                    disableOutsidePointerEvents: !0,
                                    onEscapeKeyDown: a,
                                    onPointerDownOutside: l,
                                    onFocusOutside: function(e) {
                                        return e.preventDefault()
                                    },
                                    onDismiss: function() {
                                        return g.onOpenChange(!1)
                                    },
                                    children: (0, G.jsx)(Y, cP(cS({
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
                                        ref: A,
                                        style: cS({
                                            display: "flex",
                                            flexDirection: "column",
                                            outline: "none"
                                        }, h.style),
                                        onKeyDown: e4(h.onKeyDown, function(e) {
                                            var t = e.ctrlKey || e.altKey || e.metaKey;
                                            if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || V(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                                var r = T().filter(function(e) {
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
            c3.displayName = "SelectContentImpl";
            var c6 = eu.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.onPlaced,
                    o = cA(e, ["__scopeSelect", "onPlaced"]),
                    i = cB(cZ, r),
                    a = c1(cZ, r),
                    l = cE(eu.useState(null), 2),
                    c = l[0],
                    u = l[1],
                    s = cE(eu.useState(null), 2),
                    f = s[0],
                    d = s[1],
                    p = tt(t, function(e) {
                        return d(e)
                    }),
                    y = cR(r),
                    m = eu.useRef(!1),
                    v = eu.useRef(!0),
                    b = a.viewport,
                    h = a.selectedItem,
                    g = a.selectedItemText,
                    w = a.focusSelectedItem,
                    O = eu.useCallback(function() {
                        if (i.trigger && i.valueNode && c && f && b && h && g) {
                            var e = i.trigger.getBoundingClientRect(),
                                t = f.getBoundingClientRect(),
                                r = i.valueNode.getBoundingClientRect(),
                                o = g.getBoundingClientRect();
                            if ("rtl" !== i.dir) {
                                var a = o.left - t.left,
                                    l = r.left - a,
                                    u = e.left - l,
                                    s = e.width + u,
                                    d = Math.max(s, t.width),
                                    p = lX(l, [10, Math.max(10, window.innerWidth - 10 - d)]);
                                c.style.minWidth = s + "px", c.style.left = p + "px"
                            } else {
                                var v = t.right - o.right,
                                    w = window.innerWidth - r.right - v,
                                    O = window.innerWidth - e.right - w,
                                    j = e.width + O,
                                    x = Math.max(j, t.width),
                                    S = lX(w, [10, Math.max(10, window.innerWidth - 10 - x)]);
                                c.style.minWidth = j + "px", c.style.right = S + "px"
                            }
                            var P = y(),
                                A = window.innerHeight - 20,
                                E = b.scrollHeight,
                                C = window.getComputedStyle(f),
                                k = parseInt(C.borderTopWidth, 10),
                                D = parseInt(C.paddingTop, 10),
                                I = parseInt(C.borderBottomWidth, 10),
                                N = k + D + E + parseInt(C.paddingBottom, 10) + I,
                                T = Math.min(5 * h.offsetHeight, N),
                                R = window.getComputedStyle(b),
                                L = parseInt(R.paddingTop, 10),
                                M = parseInt(R.paddingBottom, 10),
                                _ = e.top + e.height / 2 - 10,
                                U = h.offsetHeight / 2,
                                F = k + D + (h.offsetTop + U);
                            if (F <= _) {
                                var B = P.length > 0 && h === P[P.length - 1].ref.current;
                                c.style.bottom = "0px";
                                var W = Math.max(A - _, U + (B ? M : 0) + (f.clientHeight - b.offsetTop - b.offsetHeight) + I);
                                c.style.height = F + W + "px"
                            } else {
                                var z = P.length > 0 && h === P[0].ref.current;
                                c.style.top = "0px";
                                var H = Math.max(_, k + b.offsetTop + (z ? L : 0) + U);
                                c.style.height = H + (N - F) + "px", b.scrollTop = F - _ + b.offsetTop
                            }
                            c.style.margin = "".concat(10, "px 0"), c.style.minHeight = T + "px", c.style.maxHeight = A + "px", null == n || n(), requestAnimationFrame(function() {
                                return m.current = !0
                            })
                        }
                    }, [y, i.trigger, i.valueNode, c, f, b, h, g, i.dir, n]);
                tu(function() {
                    return O()
                }, [O]);
                var j = cE(eu.useState(), 2),
                    x = j[0],
                    S = j[1];
                tu(function() {
                    f && S(window.getComputedStyle(f).zIndex)
                }, [f]);
                var P = eu.useCallback(function(e) {
                    e && !0 === v.current && (O(), null == w || w(), v.current = !1)
                }, [O, w]);
                return (0, G.jsx)(c4, {
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
                        children: (0, G.jsx)(tT.div, cP(cS({}, o), {
                            ref: p,
                            style: cS({
                                boxSizing: "border-box",
                                maxHeight: "100%"
                            }, o.style)
                        }))
                    })
                })
            });
            c6.displayName = "SelectItemAlignedPosition";
            var c8 = eu.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.align,
                    o = e.collisionPadding,
                    i = cA(e, ["__scopeSelect", "align", "collisionPadding"]),
                    a = c_(r);
                return (0, G.jsx)(cd, cP(cS({}, a, i), {
                    ref: t,
                    align: void 0 === n ? "start" : n,
                    collisionPadding: void 0 === o ? 10 : o,
                    style: cS({
                        boxSizing: "border-box"
                    }, i.style, {
                        "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                        "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                        "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                        "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                        "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
                    })
                }))
            });
            c8.displayName = "SelectPopperPosition";
            var c5 = cE(cM(cZ, {}), 2),
                c4 = c5[0],
                c7 = c5[1],
                c9 = "SelectViewport",
                ue = eu.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.nonce,
                        o = cA(e, ["__scopeSelect", "nonce"]),
                        i = c1(c9, r),
                        a = c7(c9, r),
                        l = tt(t, i.onViewportChange),
                        c = eu.useRef(0);
                    return (0, G.jsxs)(G.Fragment, {
                        children: [(0, G.jsx)("style", {
                            dangerouslySetInnerHTML: {
                                __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                            },
                            nonce: n
                        }), (0, G.jsx)(cT.Slot, {
                            scope: r,
                            children: (0, G.jsx)(tT.div, cP(cS({
                                "data-radix-select-viewport": "",
                                role: "presentation"
                            }, o), {
                                ref: l,
                                style: cS({
                                    position: "relative",
                                    flex: 1,
                                    overflow: "hidden auto"
                                }, o.style),
                                onScroll: e4(o.onScroll, function(e) {
                                    var t = e.currentTarget,
                                        r = a.contentWrapper,
                                        n = a.shouldExpandOnScrollRef;
                                    if ((null == n ? void 0 : n.current) && r) {
                                        var o = Math.abs(c.current - t.scrollTop);
                                        if (o > 0) {
                                            var i = window.innerHeight - 20,
                                                l = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                            if (l < i) {
                                                var u = l + o,
                                                    s = Math.min(i, u),
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
            ue.displayName = c9;
            var ut = "SelectGroup",
                ur = cE(cM(ut), 2),
                un = ur[0],
                uo = ur[1];
            eu.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = cA(e, ["__scopeSelect"]),
                    o = tp();
                return (0, G.jsx)(un, {
                    scope: r,
                    id: o,
                    children: (0, G.jsx)(tT.div, cP(cS({
                        role: "group",
                        "aria-labelledby": o
                    }, n), {
                        ref: t
                    }))
                })
            }).displayName = ut;
            var ui = "SelectLabel";
            eu.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = cA(e, ["__scopeSelect"]),
                    o = uo(ui, r);
                return (0, G.jsx)(tT.div, cP(cS({
                    id: o.id
                }, n), {
                    ref: t
                }))
            }).displayName = ui;
            var ua = "SelectItem",
                ul = cE(cM(ua), 2),
                uc = ul[0],
                uu = ul[1],
                us = eu.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.value,
                        o = e.disabled,
                        i = void 0 !== o && o,
                        a = e.textValue,
                        l = cA(e, ["__scopeSelect", "value", "disabled", "textValue"]),
                        c = cB(ua, r),
                        u = c1(ua, r),
                        s = c.value === n,
                        f = cE(eu.useState(null != a ? a : ""), 2),
                        d = f[0],
                        p = f[1],
                        y = cE(eu.useState(!1), 2),
                        m = y[0],
                        v = y[1],
                        b = tt(t, function(e) {
                            var t;
                            return null == (t = u.itemRefCallback) ? void 0 : t.call(u, e, n, i)
                        }),
                        h = tp(),
                        g = eu.useRef("touch"),
                        w = function() {
                            i || (c.onValueChange(n), c.onOpenChange(!1))
                        };
                    if ("" === n) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
                    return (0, G.jsx)(uc, {
                        scope: r,
                        value: n,
                        disabled: i,
                        textId: h,
                        isSelected: s,
                        onItemTextChange: eu.useCallback(function(e) {
                            p(function(t) {
                                var r;
                                return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                            })
                        }, []),
                        children: (0, G.jsx)(cT.ItemSlot, {
                            scope: r,
                            value: n,
                            disabled: i,
                            textValue: d,
                            children: (0, G.jsx)(tT.div, cP(cS({
                                role: "option",
                                "aria-labelledby": h,
                                "data-highlighted": m ? "" : void 0,
                                "aria-selected": s && m,
                                "data-state": s ? "checked" : "unchecked",
                                "aria-disabled": i || void 0,
                                "data-disabled": i ? "" : void 0,
                                tabIndex: i ? void 0 : -1
                            }, l), {
                                ref: b,
                                onFocus: e4(l.onFocus, function() {
                                    return v(!0)
                                }),
                                onBlur: e4(l.onBlur, function() {
                                    return v(!1)
                                }),
                                onClick: e4(l.onClick, function() {
                                    "mouse" !== g.current && w()
                                }),
                                onPointerUp: e4(l.onPointerUp, function() {
                                    "mouse" === g.current && w()
                                }),
                                onPointerDown: e4(l.onPointerDown, function(e) {
                                    g.current = e.pointerType
                                }),
                                onPointerMove: e4(l.onPointerMove, function(e) {
                                    if (g.current = e.pointerType, i) {
                                        var t;
                                        null == (t = u.onItemLeave) || t.call(u)
                                    } else "mouse" === g.current && e.currentTarget.focus({
                                        preventScroll: !0
                                    })
                                }),
                                onPointerLeave: e4(l.onPointerLeave, function(e) {
                                    if (e.currentTarget === document.activeElement) {
                                        var t;
                                        null == (t = u.onItemLeave) || t.call(u)
                                    }
                                }),
                                onKeyDown: e4(l.onKeyDown, function(e) {
                                    var t;
                                    ((null == (t = u.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (cD.includes(e.key) && w(), " " === e.key && e.preventDefault())
                                })
                            }))
                        })
                    })
                });
            us.displayName = ua;
            var uf = "SelectItemText",
                ud = eu.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = (e.className, e.style, cA(e, ["__scopeSelect", "className", "style"])),
                        o = cB(uf, r),
                        i = c1(uf, r),
                        a = uu(uf, r),
                        l = cH(uf, r),
                        c = cE(eu.useState(null), 2),
                        u = c[0],
                        s = c[1],
                        f = tt(t, function(e) {
                            return s(e)
                        }, a.onItemTextChange, function(e) {
                            var t;
                            return null == (t = i.itemTextRefCallback) ? void 0 : t.call(i, e, a.value, a.disabled)
                        }),
                        d = null == u ? void 0 : u.textContent,
                        p = eu.useMemo(function() {
                            return (0, G.jsx)("option", {
                                value: a.value,
                                disabled: a.disabled,
                                children: d
                            }, a.value)
                        }, [a.disabled, a.value, d]),
                        y = l.onNativeOptionAdd,
                        m = l.onNativeOptionRemove;
                    return tu(function() {
                        return y(p),
                            function() {
                                return m(p)
                            }
                    }, [y, m, p]), (0, G.jsxs)(G.Fragment, {
                        children: [(0, G.jsx)(tT.span, cP(cS({
                            id: a.textId
                        }, n), {
                            ref: f
                        })), a.isSelected && o.valueNode && !o.valueNodeHasChildren ? tw.createPortal(n.children, o.valueNode) : null]
                    })
                });
            ud.displayName = uf;
            var up = "SelectItemIndicator";
            eu.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = cA(e, ["__scopeSelect"]);
                return uu(up, r).isSelected ? (0, G.jsx)(tT.span, cP(cS({
                    "aria-hidden": !0
                }, n), {
                    ref: t
                })) : null
            }).displayName = up;
            var uy = "SelectScrollUpButton";
            eu.forwardRef(function(e, t) {
                var r = c1(uy, e.__scopeSelect),
                    n = c7(uy, e.__scopeSelect),
                    o = cE(eu.useState(!1), 2),
                    i = o[0],
                    a = o[1],
                    l = tt(t, n.onScrollButtonChange);
                return tu(function() {
                    if (r.viewport && r.isPositioned) {
                        var e = function() {
                                a(t.scrollTop > 0)
                            },
                            t = r.viewport;
                        return e(), t.addEventListener("scroll", e),
                            function() {
                                return t.removeEventListener("scroll", e)
                            }
                    }
                }, [r.viewport, r.isPositioned]), i ? (0, G.jsx)(uv, cP(cS({}, e), {
                    ref: l,
                    onAutoScroll: function() {
                        var e = r.viewport,
                            t = r.selectedItem;
                        e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
                    }
                })) : null
            }).displayName = uy;
            var um = "SelectScrollDownButton";
            eu.forwardRef(function(e, t) {
                var r = c1(um, e.__scopeSelect),
                    n = c7(um, e.__scopeSelect),
                    o = cE(eu.useState(!1), 2),
                    i = o[0],
                    a = o[1],
                    l = tt(t, n.onScrollButtonChange);
                return tu(function() {
                    if (r.viewport && r.isPositioned) {
                        var e = function() {
                                var e = t.scrollHeight - t.clientHeight;
                                a(Math.ceil(t.scrollTop) < e)
                            },
                            t = r.viewport;
                        return e(), t.addEventListener("scroll", e),
                            function() {
                                return t.removeEventListener("scroll", e)
                            }
                    }
                }, [r.viewport, r.isPositioned]), i ? (0, G.jsx)(uv, cP(cS({}, e), {
                    ref: l,
                    onAutoScroll: function() {
                        var e = r.viewport,
                            t = r.selectedItem;
                        e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
                    }
                })) : null
            }).displayName = um;
            var uv = eu.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.onAutoScroll,
                    o = cA(e, ["__scopeSelect", "onAutoScroll"]),
                    i = c1("SelectScrollButton", r),
                    a = eu.useRef(null),
                    l = cR(r),
                    c = eu.useCallback(function() {
                        null !== a.current && (window.clearInterval(a.current), a.current = null)
                    }, []);
                return eu.useEffect(function() {
                    return function() {
                        return c()
                    }
                }, [c]), tu(function() {
                    var e, t = l().find(function(e) {
                        return e.ref.current === document.activeElement
                    });
                    null == t || null == (e = t.ref.current) || e.scrollIntoView({
                        block: "nearest"
                    })
                }, [l]), (0, G.jsx)(tT.div, cP(cS({
                    "aria-hidden": !0
                }, o), {
                    ref: t,
                    style: cS({
                        flexShrink: 0
                    }, o.style),
                    onPointerDown: e4(o.onPointerDown, function() {
                        null === a.current && (a.current = window.setInterval(n, 50))
                    }),
                    onPointerMove: e4(o.onPointerMove, function() {
                        var e;
                        null == (e = i.onItemLeave) || e.call(i), null === a.current && (a.current = window.setInterval(n, 50))
                    }),
                    onPointerLeave: e4(o.onPointerLeave, function() {
                        c()
                    })
                }))
            });
            eu.forwardRef(function(e, t) {
                e.__scopeSelect;
                var r = cA(e, ["__scopeSelect"]);
                return (0, G.jsx)(tT.div, cP(cS({
                    "aria-hidden": !0
                }, r), {
                    ref: t
                }))
            }).displayName = "SelectSeparator";
            var ub = "SelectArrow";

            function uh(e) {
                return "" === e || void 0 === e
            }
            eu.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = cA(e, ["__scopeSelect"]),
                    o = c_(r),
                    i = cB(ub, r),
                    a = c1(ub, r);
                return i.open && "popper" === a.position ? (0, G.jsx)(cm, cP(cS({}, o, n), {
                    ref: t
                })) : null
            }).displayName = ub;
            var ug = eu.forwardRef(function(e, t) {
                var r, n = e.value,
                    o = cA(e, ["value"]),
                    i = eu.useRef(null),
                    a = tt(t, i),
                    l = (r = eu.useRef({
                        value: n,
                        previous: n
                    }), eu.useMemo(function() {
                        return r.current.value !== n && (r.current.previous = r.current.value, r.current.value = n), r.current.previous
                    }, [n]));
                return eu.useEffect(function() {
                    var e = i.current,
                        t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
                    if (l !== n && t) {
                        var r = new Event("change", {
                            bubbles: !0
                        });
                        t.call(e, n), e.dispatchEvent(r)
                    }
                }, [l, n]), (0, G.jsx)(cw, {
                    asChild: !0,
                    children: (0, G.jsx)("select", cP(cS({}, o), {
                        ref: a,
                        defaultValue: n
                    }))
                })
            });

            function uw(e) {
                var t = tm(e),
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
                    i = eu.useCallback(function() {
                        r.current = "", window.clearTimeout(n.current)
                    }, []);
                return eu.useEffect(function() {
                    return function() {
                        return window.clearTimeout(n.current)
                    }
                }, []), [r, o, i]
            }

            function uO(e, t, r) {
                var n, o, i = t.length > 1 && Array.from(t).every(function(e) {
                        return e === t[0]
                    }) ? t[0] : t,
                    a = r ? e.indexOf(r) : -1,
                    l = (n = e, o = Math.max(a, 0), n.map(function(e, t) {
                        return n[(o + t) % n.length]
                    }));
                1 === i.length && (l = l.filter(function(e) {
                    return e !== r
                }));
                var c = l.find(function(e) {
                    return e.textValue.toLowerCase().startsWith(i.toLowerCase())
                });
                return c !== r ? c : void 0
            }
            ug.displayName = "BubbleSelect";
            var uj = (0, eu.createContext)(null),
                ux = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-600"
                },
                uS = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                uP = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                uA = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                uE = {
                    XSmall: "gap-xsmall",
                    Small: "gap-small",
                    Medium: "gap-small",
                    Large: "gap-small"
                },
                uC = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                uk = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                uD = (0, eu.forwardRef)(function(e, t) {
                    var r = e.label,
                        n = e.labelTooltip,
                        o = e.ariaLabelledBy,
                        i = e.ariaLabel,
                        a = e.className,
                        l = e.size,
                        c = e.variant,
                        u = void 0 === c ? "Standard" : c,
                        s = e.value,
                        f = e.placeholder,
                        d = e.isDisabled,
                        p = e.hasError,
                        y = e.hint,
                        m = e.onValueChange,
                        v = e.onOpenChange,
                        b = e.children,
                        h = oy(),
                        g = (0, eu.useMemo)(function() {
                            return {
                                size: l
                            }
                        }, [l]),
                        w = r ? es().createElement("span", {
                            id: h,
                            className: eJ(uP[l], "content-emphasis")
                        }, r) : null;
                    return es().createElement(uj.Provider, {
                        value: g
                    }, es().createElement("div", {
                        className: eJ("flex flex-col", d && ["opacity-[0.5]", "pointer-events-none"], uE[l], a)
                    }, w && (n ? es().createElement("div", {
                        className: "flex items-center gap-xsmall"
                    }, w, es().createElement(lz, n)) : w), es().createElement(cV, {
                        value: s,
                        disabled: d,
                        onValueChange: m,
                        onOpenChange: v
                    }, es().createElement(cX, {
                        className: eJ("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", lH[u], lV[u], uC[l], uk[l], uS[l], uA[l], p ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === s ? "content-muted" : "content-default"),
                        ref: t,
                        "aria-labelledby": r ? h : o,
                        "aria-label": i
                    }, es().createElement(e1, null), es().createElement("div", {
                        className: "grow-1 text-truncate-split text-align-x-left"
                    }, es().createElement(cq, {
                        placeholder: f
                    })), es().createElement(cY, {
                        className: eJ(ux[l], "icon icon-regular-chevron-large-down content-default")
                    })), es().createElement(c$, null, es().createElement(cQ, {
                        position: "popper",
                        className: "padding-y-small foundation-web-portal-zindex",
                        style: {
                            maxHeight: "var(--radix-select-content-available-height)"
                        }
                    }, b))), y && es().createElement("span", {
                        className: eJ("text-caption-small", {
                            "content-system-alert": p,
                            "content-default": !p
                        })
                    }, y)))
                });

            function uI(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function uN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            uD.displayName = "Dropdown", "undefined" != typeof window && window.document && window.document.createElement;

            function uT(e, t, r) {
                return (uT = uB() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && u_(o, r.prototype), o
                }).apply(null, arguments)
            }

            function uR(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function uL(e) {
                return (uL = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function uM(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        uR(e, t, r[t])
                    })
                }
                return e
            }

            function u_(e, t) {
                return (u_ = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function uU(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return uN(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uN(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uF(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (uF = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return uT(e, arguments, uL(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), u_(r, e)
                })(e)
            }

            function uB() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (uB = function() {
                    return !!e
                })()
            }

            function uW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uz(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return uW(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uW(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            uF(Map);
            var uH = eu[" useInsertionEffect ".trim().toString()] || tu;

            function uV(e, t) {
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

            function uX(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function uG(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function uq(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || uY(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uY(e, t) {
                if (e) {
                    if ("string" == typeof e) return uV(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uV(e, t)
                }
            }
            Symbol("RADIX:SYNC_STATE");
            var u$ = "rovingFocusGroup.onEntryFocus",
                uZ = {
                    bubbles: !1,
                    cancelable: !0
                },
                uQ = "RovingFocusGroup",
                uJ = uq((I = (D = uU(tl(k = uQ + "CollectionProvider"), 2))[0], N = D[1], R = (T = uU(I(k, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], L = T[1], (M = function(e) {
                    var t = e.scope,
                        r = e.children,
                        n = es().useRef(null),
                        o = es().useRef(new Map).current;
                    return (0, G.jsx)(R, {
                        scope: t,
                        itemMap: o,
                        collectionRef: n,
                        children: r
                    })
                }).displayName = k, U = nm(_ = uQ + "CollectionSlot"), (F = es().forwardRef(function(e, t) {
                    var r = e.scope,
                        n = e.children,
                        o = tt(t, L(_, r).collectionRef);
                    return (0, G.jsx)(U, {
                        ref: o,
                        children: n
                    })
                })).displayName = _, W = "data-radix-collection-item", z = nm(B = uQ + "CollectionItemSlot"), (H = es().forwardRef(function(e, t) {
                    var r, n, o = e.scope,
                        i = e.children,
                        a = function(e, t) {
                            if (null == e) return {};
                            var r, n, o = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    i = Object.keys(e);
                                for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                                return o
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(e);
                                for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                            }
                            return o
                        }(e, ["scope", "children"]),
                        l = es().useRef(null),
                        c = tt(t, l),
                        u = L(B, o);
                    return es().useEffect(function() {
                        return u.itemMap.set(l, uM({
                                ref: l
                            }, a)),
                            function() {
                                u.itemMap.delete(l)
                            }
                    }), (0, G.jsx)(z, (r = uM({}, uR({}, W, "")), n = n = {
                        ref: c,
                        children: i
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                        var r = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var n = Object.getOwnPropertySymbols(e);
                            r.push.apply(r, n)
                        }
                        return r
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                })).displayName = B, [{
                    Provider: M,
                    Slot: F,
                    ItemSlot: H
                }, function(e) {
                    var t = L(uQ + "CollectionConsumer", e);
                    return es().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var r = Array.from(e.querySelectorAll("[".concat(W, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return r.indexOf(e.ref.current) - r.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, N]), 3),
                u0 = uJ[0],
                u1 = uJ[1],
                u2 = uq(tl(uQ, [uJ[2]]), 2),
                u3 = u2[0];
            u2[1];
            var u6 = uq(u3(uQ), 2),
                u8 = u6[0],
                u5 = u6[1],
                u4 = eu.forwardRef(function(e, t) {
                    return (0, G.jsx)(u0.Provider, {
                        scope: e.__scopeRovingFocusGroup,
                        children: (0, G.jsx)(u0.Slot, {
                            scope: e.__scopeRovingFocusGroup,
                            children: (0, G.jsx)(u7, uX(uK({}, e), {
                                ref: t
                            }))
                        })
                    })
                });
            u4.displayName = uQ;
            var u7 = eu.forwardRef(function(e, t) {
                    var r, n, o, i, a, l, c, u, s, f, d, p, y, m, v, b, h, g, w, O, j = e.__scopeRovingFocusGroup,
                        x = e.orientation,
                        S = e.loop,
                        P = e.dir,
                        A = e.currentTabStopId,
                        E = e.defaultCurrentTabStopId,
                        C = e.onCurrentTabStopIdChange,
                        k = e.onEntryFocus,
                        D = e.preventScrollOnEntryFocus,
                        I = void 0 !== D && D,
                        N = uG(e, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        T = eu.useRef(null),
                        R = tt(t, T),
                        L = lQ(P),
                        M = uq((f = (s = {
                            prop: A,
                            defaultProp: null != E ? E : null,
                            onChange: C,
                            caller: uQ
                        }).prop, d = s.defaultProp, p = s.onChange, y = s.caller, v = (m = uz((n = (r = {
                            defaultProp: d,
                            onChange: void 0 === p ? function() {} : p
                        }).defaultProp, o = r.onChange, a = (i = uz(eu.useState(n), 2))[0], l = i[1], c = eu.useRef(a), u = eu.useRef(o), uH(function() {
                            u.current = o
                        }, [o]), eu.useEffect(function() {
                            if (c.current !== a) {
                                var e;
                                null == (e = u.current) || e.call(u, a), c.current = a
                            }
                        }, [a, c]), [a, l, u]), 3))[0], b = m[1], h = m[2], w = (g = void 0 !== f) ? f : v, O = eu.useRef(void 0 !== f), eu.useEffect(function() {
                            var e = O.current;
                            if (e !== g) {
                                var t = g ? "controlled" : "uncontrolled";
                                console.warn("".concat(y, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                            }
                            O.current = g
                        }, [g, y]), [w, eu.useCallback(function(e) {
                            if (g) {
                                var t, r = "function" == typeof e ? e(f) : e;
                                r !== f && (null == (t = h.current) || t.call(h, r))
                            } else b(e)
                        }, [g, f, b, h])]), 2),
                        _ = M[0],
                        U = M[1],
                        F = uq(eu.useState(!1), 2),
                        B = F[0],
                        W = F[1],
                        z = tm(k),
                        H = u1(j),
                        V = eu.useRef(!1),
                        K = uq(eu.useState(0), 2),
                        X = K[0],
                        q = K[1];
                    return eu.useEffect(function() {
                        var e = T.current;
                        if (e) return e.addEventListener(u$, z),
                            function() {
                                return e.removeEventListener(u$, z)
                            }
                    }, [z]), (0, G.jsx)(u8, {
                        scope: j,
                        orientation: x,
                        dir: L,
                        loop: void 0 !== S && S,
                        currentTabStopId: _,
                        onItemFocus: eu.useCallback(function(e) {
                            return U(e)
                        }, [U]),
                        onItemShiftTab: eu.useCallback(function() {
                            return W(!0)
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
                        children: (0, G.jsx)(nO.div, uX(uK({
                            tabIndex: B || 0 === X ? -1 : 0,
                            "data-orientation": x
                        }, N), {
                            ref: R,
                            style: uK({
                                outline: "none"
                            }, e.style),
                            onMouseDown: uI(e.onMouseDown, function() {
                                V.current = !0
                            }),
                            onFocus: uI(e.onFocus, function(e) {
                                var t = !V.current;
                                if (e.target === e.currentTarget && t && !B) {
                                    var r = new CustomEvent(u$, uZ);
                                    if (e.currentTarget.dispatchEvent(r), !r.defaultPrevented) {
                                        var n = H().filter(function(e) {
                                            return e.focusable
                                        });
                                        sr([n.find(function(e) {
                                            return e.active
                                        }), n.find(function(e) {
                                            return e.id === _
                                        })].concat(function(e) {
                                            if (Array.isArray(e)) return uV(e)
                                        }(n) || function(e) {
                                            if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(n) || uY(n) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()).filter(Boolean).map(function(e) {
                                            return e.ref.current
                                        }), I)
                                    }
                                }
                                V.current = !1
                            }),
                            onBlur: uI(e.onBlur, function() {
                                return W(!1)
                            })
                        }))
                    })
                }),
                u9 = "RovingFocusGroupItem",
                se = eu.forwardRef(function(e, t) {
                    var r = e.__scopeRovingFocusGroup,
                        n = e.focusable,
                        o = void 0 === n || n,
                        i = e.active,
                        a = e.tabStopId,
                        l = e.children,
                        c = uG(e, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        u = tp(),
                        s = a || u,
                        f = u5(u9, r),
                        d = f.currentTabStopId === s,
                        p = u1(r),
                        y = f.onFocusableItemAdd,
                        m = f.onFocusableItemRemove,
                        v = f.currentTabStopId;
                    return eu.useEffect(function() {
                        if (o) return y(),
                            function() {
                                return m()
                            }
                    }, [o, y, m]), (0, G.jsx)(u0.ItemSlot, {
                        scope: r,
                        id: s,
                        focusable: o,
                        active: void 0 !== i && i,
                        children: (0, G.jsx)(nO.span, uX(uK({
                            tabIndex: d ? 0 : -1,
                            "data-orientation": f.orientation
                        }, c), {
                            ref: t,
                            onMouseDown: uI(e.onMouseDown, function(e) {
                                o ? f.onItemFocus(s) : e.preventDefault()
                            }),
                            onFocus: uI(e.onFocus, function() {
                                return f.onItemFocus(s)
                            }),
                            onKeyDown: uI(e.onKeyDown, function(e) {
                                if ("Tab" === e.key && e.shiftKey) return void f.onItemShiftTab();
                                if (e.target === e.currentTarget) {
                                    var t = function(e, t, r) {
                                        var n, o = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                                        if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return st[o]
                                    }(e, f.orientation, f.dir);
                                    if (void 0 !== t) {
                                        if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                                        e.preventDefault();
                                        var r = p().filter(function(e) {
                                            return e.focusable
                                        }).map(function(e) {
                                            return e.ref.current
                                        });
                                        if ("last" === t) r.reverse();
                                        else if ("prev" === t || "next" === t) {
                                            "prev" === t && r.reverse();
                                            var n, o, i = r.indexOf(e.currentTarget);
                                            r = f.loop ? (n = r, o = i + 1, n.map(function(e, t) {
                                                return n[(o + t) % n.length]
                                            })) : r.slice(i + 1)
                                        }
                                        setTimeout(function() {
                                            return sr(r)
                                        })
                                    }
                                }
                            }),
                            children: "function" == typeof l ? l({
                                isCurrentTabStop: d,
                                hasTabStop: null != v
                            }) : l
                        }))
                    })
                });
            se.displayName = u9;
            var st = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function sr(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    r = document.activeElement,
                    n = !0,
                    o = !1,
                    i = void 0;
                try {
                    for (var a, l = e[Symbol.iterator](); !(n = (a = l.next()).done); n = !0) {
                        var c = a.value;
                        if (c === r || (c.focus({
                                preventScroll: t
                            }), document.activeElement !== r)) return
                    }
                } catch (e) {
                    o = !0, i = e
                } finally {
                    try {
                        n || null == l.return || l.return()
                    } finally {
                        if (o) throw i
                    }
                }
            }

            function sn(e) {
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

            function so(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function si(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }
            var sa = {
                    XSmall: "radius-medium",
                    Small: "radius-large",
                    Medium: "radius-large",
                    Large: "radius-large"
                },
                sl = {
                    XSmall: "padding-xsmall",
                    Small: "padding-small",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                sc = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                su = {
                    XSmall: "padding-y-xsmall",
                    Small: "padding-y-small",
                    Medium: "padding-y-small",
                    Large: "padding-y-medium"
                },
                ss = {
                    XSmall: "gap-x-medium",
                    Small: "gap-x-medium",
                    Medium: "gap-x-medium",
                    Large: "gap-x-large"
                },
                sf = {
                    XSmall: "gap-y-xxsmall",
                    Small: "gap-y-xxsmall",
                    Medium: "gap-y-xsmall",
                    Large: "gap-y-xsmall"
                },
                sd = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                sp = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                sy = (0, eu.createContext)(null),
                sm = function() {
                    var e = (0, eu.useContext)(sy);
                    if (!e) throw Error("Menu components must be used within a Menu");
                    return e
                },
                sv = function(e) {
                    var t, r = e.children,
                        n = e.className,
                        o = e.size,
                        i = (0, eu.useContext)(uj),
                        a = i ? "dropdown" : "standalone",
                        l = null != (t = null != o ? o : null == i ? void 0 : i.size) ? t : "Medium",
                        c = (0, eu.useMemo)(function() {
                            return {
                                size: l,
                                mode: a
                            }
                        }, [l, a]),
                        u = eJ("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", sa[l], n),
                        s = "standalone" === a ? es().createElement(u4, {
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
                    return es().createElement(sy.Provider, {
                        value: c
                    }, "dropdown" === a ? es().createElement(ue, {
                        asChild: !0,
                        style: {
                            width: "var(--radix-popper-anchor-width)"
                        }
                    }, s) : s)
                },
                sb = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = sm().size;
                    return es().createElement("div", {
                        role: "group",
                        className: eJ(sl[n], r)
                    }, t)
                },
                sh = function(e) {
                    var t, r = e.value,
                        n = e.leading,
                        o = e.title,
                        i = e.description,
                        a = e.trailing,
                        l = e.disabled,
                        c = e.className,
                        u = e.onSelect,
                        s = e.asChild,
                        f = e.children,
                        d = si(e, ["value", "leading", "title", "description", "trailing", "disabled", "className", "onSelect", "asChild", "children"]),
                        p = sm(),
                        y = p.size,
                        m = p.mode,
                        v = eJ(e0, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", sd[y], sc[y], su[y], ss[y], sp[y], l && "opacity-[0.5]", l && "pointer-events-none", c),
                        b = es().createElement("span", {
                            className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
                        }, o);
                    switch (m) {
                        case "dropdown":
                            b = es().createElement(ud, {
                                asChild: !0
                            }, b);
                            break;
                        case "standalone":
                            break;
                        default:
                            console.error("Invalid menu mode:", m)
                    }
                    var h = es().createElement(es().Fragment, null, !l && es().createElement(e1, null), n, es().createElement("div", {
                        className: eJ("grow-1 text-truncate-split flex flex-col", sf[y])
                    }, b, i && es().createElement("div", {
                        className: "foundation-web-menu-item-description content-muted"
                    }, i)), a);
                    if (s) {
                        d.as;
                        var g = si(d, ["as"]),
                            w = es().Children.only(f),
                            O = void 0 === o && w.props.children;
                        t = es().createElement(nG, so(sn({}, g), {
                            role: "standalone" === m ? "menuitem" : void 0,
                            "aria-disabled": l || void 0,
                            className: v,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: l ? void 0 : u
                        }), O ? es().cloneElement(w, {}, es().createElement(es().Fragment, null, !l && es().createElement(e1, null), w.props.children)) : es().cloneElement(w, {}, h))
                    } else if ("a" === d.as) {
                        d.as;
                        var j = d.href,
                            x = si(d, ["as", "href"]);
                        t = es().createElement("a", so(sn({}, x), {
                            role: "standalone" === m ? "menuitem" : void 0,
                            "aria-disabled": l,
                            href: l ? void 0 : j,
                            className: v,
                            style: {
                                outlineOffset: 0,
                                textDecoration: "none"
                            },
                            onClick: l ? void 0 : u
                        }), h)
                    } else {
                        d.as;
                        var S = si(d, ["as"]);
                        t = es().createElement("button", so(sn({
                            type: "button"
                        }, S), {
                            role: "standalone" === m ? "menuitem" : void 0,
                            "aria-disabled": l,
                            className: v,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: l ? void 0 : u
                        }), h)
                    }
                    return "dropdown" === m ? es().createElement(us, {
                        value: r,
                        disabled: l,
                        asChild: !0
                    }, t) : es().createElement(se, {
                        asChild: !0,
                        focusable: !0,
                        tabStopId: r
                    }, t)
                },
                sg = {
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
                sw = es().forwardRef(function(e, t) {
                    var r = e.className,
                        n = e.size,
                        o = void 0 === n ? "Large" : n,
                        i = e.variant,
                        a = e.value,
                        l = e.showValue,
                        c = void 0 !== l && l,
                        u = e.ariaLabel,
                        s = function(e, t) {
                            if (null == e) return {};
                            var r, n, o = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    i = Object.keys(e);
                                for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                                return o
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(e);
                                for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                            }
                            return o
                        }(e, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        f = sg[o],
                        d = f.dimension,
                        p = f.strokeWidth,
                        y = f.textClass,
                        m = f.valueContainerSize,
                        v = (d - p) / 2,
                        b = 2 * Math.PI * v,
                        h = d / 2,
                        g = Math.min(100, Math.max(0, void 0 === a ? 0 : a)),
                        w = c && void 0 !== m ? m : d,
                        O = "Determinate" === (void 0 === i ? "Determinate" : i);
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
                        ref: t,
                        className: eJ("foundation-web-progress-circle inline-flex items-center justify-center", r),
                        role: "progressbar",
                        "aria-label": u,
                        "aria-valuemin": O ? 0 : void 0,
                        "aria-valuemax": O ? 100 : void 0,
                        "aria-valuenow": O ? g : void 0,
                        style: {
                            width: w,
                            height: w
                        }
                    }, s), es().createElement("svg", {
                        width: d,
                        height: d,
                        viewBox: "0 0 ".concat(d, " ").concat(d),
                        className: "relative"
                    }, es().createElement("circle", {
                        cx: h,
                        cy: h,
                        r: v,
                        fill: "none",
                        strokeWidth: p,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), es().createElement("circle", {
                        cx: h,
                        cy: h,
                        r: v,
                        fill: "none",
                        strokeWidth: p,
                        strokeDasharray: O ? b : "".concat(.75 * b, " ").concat(.25 * b),
                        strokeDashoffset: O ? b * (1 - g / 100) : 0,
                        strokeLinecap: "round",
                        className: eJ(!O && "foundation-web-progress-circle-indeterminate"),
                        style: O ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), O && c && "Large" === o && es().createElement("div", {
                        className: eJ("absolute content-emphasis flex items-center justify-center", y),
                        "aria-hidden": "true"
                    }, es().createElement("span", null, Math.round(g)), es().createElement("span", null, "%")))
                });

            function sO(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            sw.displayName = "ProgressCircle";
            var sj = function() {
                    var e;
                    return (e = function() {
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
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
                                        url: "".concat(eT().authApi, "/v2/session/refresh"),
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
                            var i = e.apply(t, r);

                            function a(e) {
                                sO(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                sO(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                sx = od.eventStreamService.eventTypes,
                sS = "Localization",
                sP = {
                    changeLanguage: {
                        name: "changeLanguage",
                        type: sx.formInteraction,
                        context: sS,
                        requiredParams: ["userId", "newSupportedLocaleCode", "previousSupportedLocaleCode"]
                    },
                    changeLanguageModal: {
                        name: "changeLanguageModal",
                        type: sx.formInteraction,
                        context: sS,
                        requiredParams: ["userId", "newSupportedLocaleCode"]
                    }
                };

            function sA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sE(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function sC(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function sk(e) {
                return (sk = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function sD(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        sC(e, t, r[t])
                    })
                }
                return e
            }

            function sI(e, t) {
                return (sI = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function sN(e) {
                return function(e) {
                    if (Array.isArray(e)) return sA(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sA(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sA(e, t)
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
            var sR = od.dataStores.localeDataStore,
                sL = function(e) {
                    return e.locale && e.locale.nativeName ? e.isEnabledForFullExperience ? e.locale.nativeName : "".concat(e.locale.nativeName, "*") : ""
                },
                sM = function(e) {
                    var t;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function r(e) {
                        var t, n, o;
                        if (!(this instanceof r)) throw TypeError("Cannot call a class as a function");
                        return n = r, o = [e], n = sk(n), (t = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "undefined" != typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, sT() ? Reflect.construct(n, o || [], sk(this).constructor) : n.apply(this, o))).state = {
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
                        }), e && sI(r, e), t = [{
                            key: "componentDidMount",
                            value: function() {
                                this.loadSupportedLocales()
                            }
                        }, {
                            key: "handleLanguageChange",
                            value: function(e) {
                                var t = this,
                                    r = sD({}, e.locale),
                                    n = this.state.userLocale,
                                    o = this.props,
                                    i = o.isAuthenticatedUser,
                                    a = o.onLanguageChange,
                                    l = sD({}, n);
                                i ? (this.setState({
                                    isLocaleUpdateInProgress: !0
                                }), sR.setUserLocale(r.locale).then(function() {
                                    var n;
                                    return (n = function() {
                                        return function(e, t) {
                                            var r, n, o, i = {
                                                    label: 0,
                                                    sent: function() {
                                                        if (1 & o[0]) throw o[1];
                                                        return o[1]
                                                    },
                                                    trys: [],
                                                    ops: []
                                                },
                                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                                return this
                                            }), a;

                                            function l(l) {
                                                return function(c) {
                                                    var u = [l, c];
                                                    if (r) throw TypeError("Generator is already executing.");
                                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                                            case 0:
                                                            case 1:
                                                                o = u;
                                                                break;
                                                            case 4:
                                                                return i.label++, {
                                                                    value: u[1],
                                                                    done: !1
                                                                };
                                                            case 5:
                                                                i.label++, n = u[1], u = [0];
                                                                continue;
                                                            case 7:
                                                                u = i.ops.pop(), i.trys.pop();
                                                                continue;
                                                            default:
                                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                    i = 0;
                                                                    continue
                                                                }
                                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                                    i.label = u[1];
                                                                    break
                                                                }
                                                                if (6 === u[0] && i.label < o[1]) {
                                                                    i.label = o[1], o = u;
                                                                    break
                                                                }
                                                                if (o && i.label < o[2]) {
                                                                    i.label = o[2], i.ops.push(u);
                                                                    break
                                                                }
                                                                o[2] && i.ops.pop(), i.trys.pop();
                                                                continue
                                                        }
                                                        u = t.call(e, i)
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
                                                    return [4, sj()];
                                                case 1:
                                                    return t.sent(), e.isEnabledForFullExperience ? a(r) : (this.showUnsupportedLocaleMessage(), this.showUnsupportedLocaleModal(r)), [2]
                                            }
                                        })
                                    }, function() {
                                        var e = this,
                                            t = arguments;
                                        return new Promise(function(r, o) {
                                            var i = n.apply(e, t);

                                            function a(e) {
                                                sE(i, r, o, a, l, "next", e)
                                            }

                                            function l(e) {
                                                sE(i, r, o, a, l, "throw", e)
                                            }
                                            a(void 0)
                                        })
                                    }).call(t)
                                }, function(e) {
                                    console.error(e)
                                }).finally(function() {
                                    t.setState({
                                        isLocaleUpdateInProgress: !1
                                    })
                                })) : a(r), this.setUserLocaleByLocaleCode(r.locale), od.eventStreamService.sendEvent(sP.changeLanguage, {
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
                                    i = n.userLocale,
                                    a = n.isLocaleUpdateInProgress,
                                    l = (e = Object).assign.apply(e, sN(o.map(function(e) {
                                        return sC({}, e.locale.locale, e)
                                    })));
                                return (0, G.jsx)(uD, {
                                    value: null == i || null == (t = i.locale) ? void 0 : t.locale,
                                    className: "form-group",
                                    onValueChange: function(e) {
                                        return r.handleLanguageChange(l[e])
                                    },
                                    size: "Medium",
                                    placeholder: "Language",
                                    isDisabled: a,
                                    children: (0, G.jsx)(sv, {
                                        children: (0, G.jsx)(sb, {
                                            children: o.map(function(e) {
                                                return (0, G.jsx)(sh, {
                                                    title: sL(e),
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
                                            label: sL(e)
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
                                    userLocale: sD({}, t)
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
                                    return sN(t).concat(sN(r))
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
                                sR.getLocalesWithCache(6e5).then(function(t) {
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
                                    sR.getUserLocale().then(function(t) {
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
                                }), od.eventStreamService.sendEvent(sP.changeLanguageModal, {
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
                                    i = t.userLocale;
                                return (0, G.jsxs)(es().Fragment, {
                                    children: [o.length > 0 && i.locale ? (0, G.jsx)("div", {
                                        className: "language-selector-wrapper",
                                        children: this.getSelector()
                                    }) : (0, G.jsx)(sw, {
                                        variant: "Indeterminate",
                                        size: "Medium"
                                    }), r && (0, G.jsx)(nN, {
                                        open: r,
                                        isModal: !0,
                                        size: "Medium",
                                        type: "Default",
                                        children: (0, G.jsxs)(nT, {
                                            children: [(0, G.jsxs)(nR, {
                                                className: "flex flex-col gap-y-xsmall items-center",
                                                children: [(0, G.jsx)(nL, {
                                                    className: "text-heading-medium",
                                                    children: e("Heading.UnsupportedLanguage")
                                                }), (0, G.jsx)("div", {
                                                    className: "text-body-medium content-default",
                                                    children: e("Description.UnsupportedLanguage")
                                                })]
                                            }), (0, G.jsx)(nM, {
                                                className: "flex gap-x-small items-center",
                                                children: (0, G.jsx)(n3, {
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

            function s_(e) {
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

            function sU(e) {
                var t = ea.pageName.PageNameProvider.getInternalPageName(),
                    r = (0, el.removeUrlLocale)(window.location.pathname),
                    n = "/" === r.toLowerCase() || "Login" === t || "CreateAccount" === t || "Landing" === t,
                    o = null === eo.authenticatedUser || void 0 === eo.authenticatedUser ? void 0 : eo.authenticatedUser.isAuthenticated,
                    i = ei.DeviceMeta && new ei.DeviceMeta,
                    a = i && (i.isPhone || i.isTablet),
                    l = o || n,
                    c = e.translate;
                return (0, G.jsxs)("div", {
                    className: "footer",
                    children: [(0, G.jsx)(of, s_({}, e)), (0, G.jsxs)("div", {
                        className: "row copyright-container flex items-center justify-between padding-top-xlarge gutter-x-small",
                        children: [(0, G.jsx)("div", {
                            className: "col-sm-6 col-md-3",
                            children: l && (0, G.jsx)(sM, {
                                translate: c,
                                onLanguageChange: function(e) {
                                    var t = e.locale,
                                        o = e.language;
                                    if (n && t) {
                                        var i = Object.fromEntries(new URLSearchParams(window.location.search)),
                                            a = {
                                                pathname: "/".concat(o.languageCode).concat("/" === r ? "" : r),
                                                query: i
                                            };
                                        window.location.href = ea.urlService.formatUrl(a)
                                    } else window.location.reload()
                                },
                                isAuthenticatedUser: o,
                                showWarningMessageForUnsupportedLocale: !1,
                                hideSeoUnsupportedLocales: n,
                                isNative: a
                            })
                        }), (0, G.jsx)("div", {
                            className: l ? "col-sm-6 col-md-9" : "col-sm-12",
                            children: (0, G.jsx)(ec, s_({}, e))
                        })]
                    })]
                })
            }

            function sF(e) {
                var t = e.translate,
                    r = e.intl;
                return (0, G.jsx)(sU, {
                    translate: t,
                    intl: r
                })
            }
            sM.defaultProps = {
                onLanguageChange: function() {},
                isAuthenticatedUser: !1,
                isNative: !1,
                showWarningModalForUnsupportedLocale: !0,
                showWarningMessageForUnsupportedLocale: !0,
                hideSeoUnsupportedLocales: !1
            }, sM.propTypes = {
                isAuthenticatedUser: er().bool,
                onLanguageChange: er().func,
                isNative: er().bool,
                showWarningModalForUnsupportedLocale: er().bool,
                showWarningMessageForUnsupportedLocale: er().bool,
                translate: er().func.isRequired,
                hideSeoUnsupportedLocales: er().bool
            }, sU.propTypes = {
                translate: er().func.isRequired
            }, sF.propTypes = {
                translate: er().func.isRequired,
                intl: er().shape({
                    getRobloxLocale: er().func.isRequired
                }).isRequired
            };
            var sB = (0, Z.withTranslations)(sF, en.P),
                sW = function(e, t) {
                    ei.DeviceMeta && od.hybridService && new ei.DeviceMeta().isInApp && od.hybridService.localization && od.hybridService.localization(e, t)
                };

            function sz(e) {
                var t = e.translate,
                    r = null === eo.authenticatedUser || void 0 === eo.authenticatedUser ? void 0 : eo.authenticatedUser.isAuthenticated;
                return (0, G.jsx)(sM, {
                    onLanguageChange: function(e) {
                        var t = e.locale;
                        t && sW(t, function() {
                            console.warn("Language Change Hybrid Event: ".concat(t))
                        }), window.location.reload()
                    },
                    translate: t,
                    isAuthenticatedUser: r
                })
            }
            window.Roblox.AccountSettingsLanguageSelector = sz, sz.propTypes = {
                translate: er().func.isRequired
            };
            var sH = (0, Z.withTranslations)(sz, en.P);
            r(496), r(960);
            var sV = "account-settings-language-selector";
            $()(function() {
                var e = document.getElementById("footer-container");
                if (e) {
                    var t = (0, G.jsx)(q.QueryClientProvider, {
                        client: Z.queryClient,
                        children: (0, G.jsx)(sB, {})
                    });
                    (0, Z.renderWithErrorBoundary)(t, e)
                }
                var r = document.getElementById(sV),
                    n = 10,
                    o = function() {
                        (r = document.getElementById(sV)) || !(n > 0) ? r && (0, Z.renderWithErrorBoundary)((0, G.jsx)(sH, {}), r): (n -= 1, setTimeout(o, 200))
                    };
                o(), window.location.pathname.toLowerCase().indexOf("/my/account") > -1 && (window.onhashchange = function() {
                    if ("#!/info" === window.location.hash) {
                        var e = document.getElementById(sV);
                        e && (0, Z.renderWithErrorBoundary)((0, G.jsx)(sH, {}), e)
                    }
                })
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Footer");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/footer-00661993a1e23526.js.map
! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "e0745b52c8e6a1830dcf5b1d0678a6146a2245bf"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "650af16b-d33d-4ca0-8241-f1c3607e973c", e._sentryDebugIdIdentifier = "sentry-dbid-650af16b-d33d-4ca0-8241-f1c3607e973c")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e, t, n, r, a, o, i, c, u, l, s, d, f, m, p = {},
        w = {};

    function g(e) {
        var t = w[e];
        if (void 0 !== t) return t.exports;
        var n = w[e] = {
            exports: {}
        };
        return p[e](n, n.exports, g), n.exports
    }
    g.m = p, g.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return g.d(t, {
            a: t
        }), t
    }, g.d = function(e, t) {
        for (var n in t) g.o(t, n) && !g.o(e, n) && Object.defineProperty(e, n, {
            enumerable: !0,
            get: t[n]
        })
    }, g.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, g.r = function(e) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, g.rv = function() {
        return "1.7.12"
    }, g.ruid = "bundler=rspack@1.7.12";
    var h = window.Roblox["core-scripts"].util.ready,
        b = g.n(h),
        v = window.ReactDOM,
        y = window.Roblox,
        S = window.CoreUtilities,
        I = window.CoreRobloxUtilities,
        E = window.ReactJSX,
        P = ((e = {}).Success = "success", e.Failure = "failure", e);

    function x(e) {
        var t = document.getElementById(e);
        t && (0, v.unmountComponentAtNode)(t)
    }
    var N = (0, E.jsx)("div", {
            id: "places-list-web-app"
        }),
        T = (0, E.jsx)("div", {
            id: "catalog-react-container"
        }),
        D = (0, E.jsx)("div", {
            id: "game-carousel-web-app"
        }),
        j = (0, E.jsx)("div", {
            id: "item-details-container",
            children: (0, E.jsx)("item-details", {})
        });

    function A(e) {
        return t.get(e, {})
    }
    var O = new Map([
            ["PlacesList", {
                setup: function(e) {
                    n.innerText = "".concat(A("Label.sHome"), " - Roblox"), (0, v.render)(N, r)
                },
                teardown: function() {
                    x("places-list-web-app")
                }
            }],
            ["Catalog", {
                setup: function(e) {
                    n.innerText = A("Label.sCatalog"), (0, v.render)(T, r)
                },
                teardown: function() {
                    x("catalog-react-container")
                }
            }],
            ["GameCarousel", {
                setup: function(e) {
                    n.innerText = "".concat(A("Label.Charts"), " - Roblox"), (0, v.render)(D, r)
                },
                teardown: function() {
                    x("games-carousel-page"), x("game-carousel-web-app")
                }
            }],
            ["ItemDetails", {
                setup: function(e) {
                    (0, v.render)(j, r)
                },
                teardown: function() {
                    x("item-details-container")
                }
            }]
        ]),
        L = function() {
            t = new y.TranslationResourceProvider().getTranslationResource("CommonUI.Features"), n = document.getElementsByTagName("title").item(0), r = document.getElementById("content")
        },
        R = "DynamicLocalizationResourceScript_";

    function C(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
        return r
    }

    function B(e, t, n, r, a, o, i) {
        try {
            var c = e[o](i),
                u = c.value
        } catch (e) {
            n(e);
            return
        }
        c.done ? t(u) : Promise.resolve(u).then(r, a)
    }

    function M(e) {
        return function() {
            var t = this,
                n = arguments;
            return new Promise(function(r, a) {
                var o = e.apply(t, n);

                function i(e) {
                    B(o, r, a, i, c, "next", e)
                }

                function c(e) {
                    B(o, r, a, i, c, "throw", e)
                }
                i(void 0)
            })
        }
    }

    function _(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            var n, r, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != a) {
                var o = [],
                    i = !0,
                    c = !1;
                try {
                    for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                } catch (e) {
                    c = !0, r = e
                } finally {
                    try {
                        i || null == a.return || a.return()
                    } finally {
                        if (c) throw r
                    }
                }
                return o
            }
        }(e, t) || k(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function k(e, t) {
        if (e) {
            if ("string" == typeof e) return C(e, t);
            var n = Object.prototype.toString.call(e).slice(8, -1);
            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return C(e, t)
        }
    }

    function U(e, t) {
        var n, r, a, o = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
            c = Object.defineProperty;
        return c(i, "next", {
            value: u(0)
        }), c(i, "throw", {
            value: u(1)
        }), c(i, "return", {
            value: u(2)
        }), "function" == typeof Symbol && c(i, Symbol.iterator, {
            value: function() {
                return this
            }
        }), i;

        function u(c) {
            return function(u) {
                var l = [c, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, l[0] && (o = 0)), o;) try {
                    if (n = 1, r && (a = 2 & l[0] ? r.return : l[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, l[1])).done) return a;
                    switch (r = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                        case 0:
                        case 1:
                            a = l;
                            break;
                        case 4:
                            return o.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            o.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                o.label = l[1];
                                break
                            }
                            if (6 === l[0] && o.label < a[1]) {
                                o.label = a[1], a = l;
                                break
                            }
                            if (a && o.label < a[2]) {
                                o.label = a[2], o.ops.push(l);
                                break
                            }
                            a[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    l = t.call(e, o)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = a = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }
    var W = /^\/(?:bundles|catalog)\/(\d+)/,
        H = 0;

    function K() {
        return H > 50 || Date.now() - m > 36e5
    }

    function J(e) {
        return y.Endpoints.removeUrlLocale(e).toLowerCase().replace(/\/$/, "")
    }

    function q(e) {
        if (!e) return "";
        var t = new URL(e);
        return t.hash = "", t.href
    }

    function F(e, t) {
        var n, r, a, o, i, c, u, s = S.pageName.PageNameProvider.getInternalPageName(),
            d = window.location.href,
            m = new Date().toISOString(),
            p = Date.now() - f;
        I.eventStreamService.sendEventWithTarget("web_page_routing", s, {
            url: d,
            lt: m,
            "Page.TransitionTime": p,
            "Page.TransitionStatus": e,
            "Page.TransitionError": null != (c = null == t ? void 0 : t.message) ? c : "",
            "Page.TransitionErrorDetails": null != (u = null == t ? void 0 : t.stack) ? u : ""
        }), e === P.Success && (n = S.pageName.PageNameProvider.getInternalPageName(), r = q(window.location.href), a = y.Endpoints.getPageUrlLocale(), o = new y.Intl().getRobloxLocale(), i = new Date().toISOString(), I.eventStreamService.sendEventWithTarget(I.eventStreamService.eventTypes.pageLoad, n, {
            url: r,
            urlloc: a,
            lt: i,
            effloc: o.toLowerCase(),
            refurl: q(l)
        }), y.PageHeartbeatEvent.Init([2, 8, 20, 60]))
    }

    function G(e) {
        var t, n = (null != (t = Error) && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) ? e : Error(String(e));
        F(P.Failure, n)
    }

    function z(e) {
        return M(function() {
            var t, n, r, o, i, l;
            return U(this, function(s) {
                switch (s.label) {
                    case 0:
                        var f, m, p, w;
                        return (t = O.get(d)) && t.teardown(), n = document.getElementById("content"), (0, v.unmountComponentAtNode)(n), f = d, p = new Set((null != (m = c.get(f)) ? m : []).map(function(e) {
                            return e.componentName
                        })), ((function(e) {
                            if (Array.isArray(e)) return C(e)
                        })(w = a.children) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(w) || k(w) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()).forEach(function(e) {
                            var t = e.getAttribute("data-bundlename");
                            ("LINK" !== e.tagName || null === t || p.has(t)) && e.remove()
                        }), n.innerHTML = "", r = c.get(e), (o = O.get(e)) && ((i = r[r.length - 1].backendData) ? (l = new Map(Object.entries(i)), o.setup(l)) : o.setup(new Map)), d = e, [4, M(function() {
                            var e;
                            return U(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return e = [], r.forEach(function(t) {
                                            u.has(t.componentName) || (t.pageScriptBundleTag && e.push(t.pageScriptBundleTag), e = e.concat(t.localizationBundleTags).concat(t.jsBundleTags).concat(t.cssBundleTags))
                                        }), a.insertAdjacentHTML("beforeend", e.join("\n")), [4, Array.from(a.querySelectorAll("script")).reduce(function(e, t) {
                                            return M(function() {
                                                return U(this, function(n) {
                                                    switch (n.label) {
                                                        case 0:
                                                            return [4, e];
                                                        case 1:
                                                            return n.sent(), [2, new Promise(function(e, n) {
                                                                var r = t.dataset.bundlename;
                                                                if (r.startsWith(R)) {
                                                                    if (u.has(r)) {
                                                                        t.remove(), e();
                                                                        return
                                                                    }
                                                                    u.add(r)
                                                                }
                                                                var o = document.createElement("script");
                                                                Array.from(t.attributes).forEach(function(e) {
                                                                    o.setAttribute(e.name, e.value)
                                                                }), o.onload = function() {
                                                                    e()
                                                                }, t.remove(), a.appendChild(o)
                                                            })]
                                                    }
                                                })
                                            })()
                                        }, Promise.resolve())];
                                    case 1:
                                        return t.sent(), [2]
                                }
                            })
                        })()];
                    case 1:
                        return s.sent(), H += 1, [4, M(function() {
                            var e, t, n, r, a;
                            return U(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if ("CatalogItem" !== (e = S.pageName.PageNameProvider.getInternalPageName()) && "BundleDetail" !== e || !(t = W.exec(J(window.location.pathname)))) return [3, 2];
                                        return [4, y.ItemDetailsHydrationService.getItemDetails([{
                                            id: parseInt(t[1], 10),
                                            itemType: "CatalogItem" === e ? "asset" : "bundle"
                                        }], !1, !0)];
                                    case 1:
                                        (n = o.sent()).length > 0 && (r = n[0], a = "".concat(window.location.pathname.substring(0, window.location.pathname.lastIndexOf("/")), "/").concat(S.seoName.formatSeoName(r.collectibleItemDetails.name)), window.history.replaceState(window.history.state, "", a)), o.label = 2;
                                    case 2:
                                        return [2]
                                }
                            })
                        })()];
                    case 2:
                        return s.sent(), F(P.Success), [2]
                }
            })
        })()
    }
    var $ = {
            "/home": "Home",
            "/catalog": "Catalog",
            "/charts": "Games"
        },
        X = {
            "/catalog": "CatalogItem",
            "/bundles": "BundleDetail"
        };

    function Y(e) {
        e.startsWith("/charts") && (e = "/charts");
        var t = o.get(e);
        if (t) return e in $ && S.pageName.PageNameProvider.setInternalPageName($[e]), t;
        var n = i.find(function(t) {
            return _(t, 1)[0].test(e)
        });
        if (n) {
            var r = Object.keys(X).find(function(t) {
                return e.startsWith(t)
            });
            return r && S.pageName.PageNameProvider.setInternalPageName(X[r]), n[1]
        }
        return null
    }

    function Q(e) {
        if (!K() && !e.ctrlKey && !e.metaKey && !e.shiftKey && !e.altKey) {
            var t = null;
            try {
                f = Date.now();
                var n = function(e) {
                    for (var t = e; null !== t;) {
                        if ("A" === t.tagName) return t;
                        t = t.parentElement
                    }
                    return null
                }(e.target);
                if (!(null == n ? void 0 : n.href)) return;
                var r = new URL(n.href),
                    a = J(r.pathname);
                if (r.origin !== window.location.origin || !r.href.endsWith(r.pathname) && (null === n.closest("#header") || "/catalog" !== a) && !("/home" === s && a.startsWith("/charts/v2")) || (l = window.location.href, window.dispatchEvent(new Event("setSearchMenuClose")), !(t = Y(a)))) return;
                e.preventDefault(), window.history.pushState({
                    referrer: l
                }, "", r.href), s = a
            } catch (e) {
                G(e);
                return
            }
            z(t).catch(G)
        }
    }

    function V(e) {
        var t = null;
        try {
            f = Date.now();
            var n, r = J(window.location.pathname);
            if ("/catalog" === r && "/catalog" === s && "" === window.location.search) return void e.stopImmediatePropagation();
            if (s === r) return;
            if (K()) return void window.location.reload();
            if (s = r, !(t = Y(r))) return void console.error("Component not found");
            l = null == (n = e.state) ? void 0 : n.referrer
        } catch (e) {
            G(e);
            return
        }
        z(t).catch(G)
    }

    function Z(e) {
        var t = null;
        try {
            f = Date.now();
            var n = e.detail.url,
                r = new URL(n),
                a = J(r.pathname);
            if (!(t = Y(a)) || K()) {
                window.location.href = n;
                return
            }
            l = window.location.href, window.history.pushState({
                referrer: l
            }, "", r.href), s = a
        } catch (e) {
            G(e);
            return
        }
        z(t).catch(G)
    }
    b()(function() {
        var e, t, n, r, l;
        e = JSON.parse((a = document.getElementById("routing")).dataset.pathtocomponent), t = JSON.parse(a.dataset.pathregextocomponent), n = JSON.parse(a.dataset.staticcomponentdata), o = new Map(Object.entries(e)), i = Object.entries(t).map(function(e) {
            var t = _(e, 2),
                n = t[0],
                r = t[1];
            return [new RegExp(n), r]
        }), c = new Map(Object.entries(n)), r = document.querySelectorAll("head > script[data-bundlename], body > script[data-bundlename]"), u = new Set, r.forEach(function(e) {
            u.add(e.dataset.bundlename)
        }), document.querySelectorAll('#routing > script[data-bundlename^="'.concat(R, '"]')).forEach(function(e) {
            u.add(e.dataset.bundlename)
        }), L(), (l = Y(s = J(window.location.pathname))) ? (d = l, document.body.addEventListener("click", Q), window.addEventListener("popstate", V), window.addEventListener("externalNavigation", Z), m = Date.now()) : console.error("Component not found")
    })
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "Routing");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/routing-44a0b7296ded2a89.js.map
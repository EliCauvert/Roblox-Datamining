! function() {
    "use strict";
    var i, e, t, n, a, r = {
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
        u = Roblox,
        o = ReactDOM,
        l = CoreRobloxUtilities,
        s = React,
        d = r.n(s);

    function f(e) {
        e = document.getElementById(e);
        e && (0, o.unmountComponentAtNode)(e)
    }(s = i = i || {}).Success = "success", s.Failure = "failure";
    var m = d().createElement("div", {
            id: "places-list-web-app"
        }),
        p = d().createElement("div", {
            id: "catalog-react-container"
        }),
        h = d().createElement("div", {
            id: "game-carousel-web-app"
        }),
        w = d().createElement("div", {
            id: "item-details-container"
        }, d().createElement("item-details", null));

    function g(e) {
        return t.get(e, {})
    }
    var v, b, y, S, E, P, T, N, I, L, C = {
            Setup: function() {
                e = new u.TranslationResourceProvider, t = e.getTranslationResource("CommonUI.Features"), n = document.getElementsByTagName("title").item(0), a = document.getElementById("content")
            },
            ComponentToSetupAndTeardownFuncs: new Map([
                ["PlacesList", {
                    setup: function(e) {
                        n.innerText = g("Label.sHome") + " - Roblox", (0, o.render)(m, a)
                    },
                    teardown: function() {
                        f("places-list-web-app")
                    }
                }],
                ["Catalog", {
                    setup: function(e) {
                        n.innerText = "" + g("Label.sCatalog"), (0, o.render)(p, a)
                    },
                    teardown: function() {
                        f("catalog-react-container")
                    }
                }],
                ["GameCarousel", {
                    setup: function(e) {
                        n.innerText = g("Label.Charts") + " - Roblox", (0, o.render)(h, a)
                    },
                    teardown: function() {
                        f("games-carousel-page"), f("game-carousel-web-app")
                    }
                }],
                ["ItemDetails", {
                    setup: function(e) {
                        (0, o.render)(w, a)
                    },
                    teardown: function() {
                        f("item-details-container")
                    }
                }]
            ]),
            RefreshTimeInMilliseconds: 36e5,
            DynamicLocalizationResourceScriptBundleNamePrefix: "DynamicLocalizationResourceScript_"
        },
        D = function(e, i, c, u) {
            return new(c = c || Promise)(function(n, t) {
                function a(e) {
                    try {
                        o(u.next(e))
                    } catch (e) {
                        t(e)
                    }
                }

                function r(e) {
                    try {
                        o(u.throw(e))
                    } catch (e) {
                        t(e)
                    }
                }

                function o(e) {
                    var t;
                    e.done ? n(e.value) : ((t = e.value) instanceof c ? t : new c(function(e) {
                        e(t)
                    })).then(a, r)
                }
                o((u = u.apply(e, i || [])).next())
            })
        },
        x = function(n, a) {
            var r, o, i, c = {
                    label: 0,
                    sent: function() {
                        if (1 & i[0]) throw i[1];
                        return i[1]
                    },
                    trys: [],
                    ops: []
                },
                e = {
                    next: t(0),
                    throw: t(1),
                    return: t(2)
                };
            return "function" == typeof Symbol && (e[Symbol.iterator] = function() {
                return this
            }), e;

            function t(t) {
                return function(e) {
                    return function(t) {
                        if (r) throw new TypeError("Generator is already executing.");
                        for (; c;) try {
                            if (r = 1, o && (i = 2 & t[0] ? o.return : t[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, t[1])).done) return i;
                            switch (o = 0, i && (t = [2 & t[0], i.value]), t[0]) {
                                case 0:
                                case 1:
                                    i = t;
                                    break;
                                case 4:
                                    return c.label++, {
                                        value: t[1],
                                        done: !1
                                    };
                                case 5:
                                    c.label++, o = t[1], t = [0];
                                    continue;
                                case 7:
                                    t = c.ops.pop(), c.trys.pop();
                                    continue;
                                default:
                                    if (!(i = 0 < (i = c.trys).length && i[i.length - 1]) && (6 === t[0] || 2 === t[0])) {
                                        c = 0;
                                        continue
                                    }
                                    if (3 === t[0] && (!i || t[1] > i[0] && t[1] < i[3])) {
                                        c.label = t[1];
                                        break
                                    }
                                    if (6 === t[0] && c.label < i[1]) {
                                        c.label = i[1], i = t;
                                        break
                                    }
                                    if (i && c.label < i[2]) {
                                        c.label = i[2], c.ops.push(t);
                                        break
                                    }
                                    i[2] && c.ops.pop(), c.trys.pop();
                                    continue
                            }
                            t = a.call(n, c)
                        } catch (e) {
                            t = [6, e], o = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & t[0]) throw t[1];
                        return {
                            value: t[0] ? t[1] : void 0,
                            done: !0
                        }
                    }([t, e])
                }
            }
        },
        R = /^\/(?:bundles|catalog)\/(\d+)/,
        B = 0;

    function O() {
        return 50 < B || Date.now() - L > C.RefreshTimeInMilliseconds
    }

    function M(e) {
        return u.Endpoints.removeUrlLocale(e).toLowerCase().replace(/\/$/, "")
    }

    function A(e) {
        if (!e) return "";
        e = new URL(e);
        return e.hash = "", e.href
    }

    function j(e, t) {
        var n = c.pageName.PageNameProvider.getInternalPageName(),
            a = window.location.href,
            r = (new Date).toISOString(),
            o = Date.now() - I;
        l.eventStreamService.sendEventWithTarget("web_page_routing", n, {
            url: a,
            lt: r,
            "Page.TransitionTime": o,
            "Page.TransitionStatus": e,
            "Page.TransitionError": null !== (a = null == t ? void 0 : t.message) && void 0 !== a ? a : "",
            "Page.TransitionErrorDetails": null !== (r = null == t ? void 0 : t.stack) && void 0 !== r ? r : ""
        }), e === i.Success && (o = c.pageName.PageNameProvider.getInternalPageName(), a = A(window.location.href), t = u.Endpoints.getPageUrlLocale(), r = (new u.Intl).getRobloxLocale(), e = (new Date).toISOString(), l.eventStreamService.sendEventWithTarget(l.eventStreamService.eventTypes.pageLoad, o, {
            url: a,
            urlloc: t,
            lt: e,
            effloc: r.toLowerCase(),
            refurl: A(P)
        }), u.PageHeartbeatEvent.Init([2, 8, 20, 60]))
    }

    function k(e) {
        e = e instanceof Error ? e : new Error(String(e));
        j(i.Failure, e)
    }

    function U(n) {
        return D(this, void 0, void 0, function() {
            var t, a = this;
            return x(this, function(e) {
                switch (e.label) {
                    case 0:
                        return t = [], n.forEach(function(e) {
                            E.has(e.componentName) || (e.pageScriptBundleTag && t.push(e.pageScriptBundleTag), t = t.concat(e.localizationBundleTags).concat(e.jsBundleTags).concat(e.cssBundleTags))
                        }), v.innerHTML = t.join("\n"), [4, Array.from(v.querySelectorAll("script")).reduce(function(t, n) {
                            return D(a, void 0, void 0, function() {
                                return x(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, t];
                                        case 1:
                                            return e.sent(), [2, (r = n, new Promise(function(e, t) {
                                                var n = r.dataset.bundlename;
                                                if (n.startsWith(C.DynamicLocalizationResourceScriptBundleNamePrefix)) {
                                                    if (E.has(n)) return r.remove(), void e();
                                                    E.add(n)
                                                }
                                                var a = document.createElement("script");
                                                Array.from(r.attributes).forEach(function(e) {
                                                    a.setAttribute(e.name, e.value)
                                                }), a.onload = function() {
                                                    e()
                                                }, r.remove(), v.appendChild(a)
                                            }))]
                                    }
                                    var r
                                })
                            })
                        }, Promise.resolve())];
                    case 1:
                        return e.sent(), [2]
                }
            })
        })
    }

    function H(r) {
        return D(this, void 0, void 0, function() {
            var t, n, a;
            return x(this, function(e) {
                switch (e.label) {
                    case 0:
                        return (n = C.ComponentToSetupAndTeardownFuncs.get(N)) && n.teardown(), a = document.getElementById("content"), (0, o.unmountComponentAtNode)(a), v.innerHTML = "", a.innerHTML = "", t = S.get(r), (n = C.ComponentToSetupAndTeardownFuncs.get(r)) && ((a = t[t.length - 1].backendData) ? (a = new Map(Object.entries(a)), n.setup(a)) : n.setup(new Map)), N = r, [4, U(t)];
                    case 1:
                        return e.sent(), B += 1, [4, function() {
                            return D(this, void 0, void 0, function() {
                                var t, n;
                                return x(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return "CatalogItem" !== (n = c.pageName.PageNameProvider.getInternalPageName()) && "BundleDetail" !== n ? [3, 2] : (t = R.exec(M(window.location.pathname))) ? [4, u.ItemDetailsHydrationService.getItemDetails([{
                                                id: parseInt(t[1], 10),
                                                itemType: "CatalogItem" === n ? "asset" : "bundle"
                                            }], !1, !0)] : [3, 2];
                                        case 1:
                                            0 < (n = e.sent()).length && (n = n[0], n = window.location.pathname.substring(0, window.location.pathname.lastIndexOf("/")) + "/" + c.seoName.formatSeoName(n.collectibleItemDetails.name), window.history.replaceState(window.history.state, "", n)), e.label = 2;
                                        case 2:
                                            return [2]
                                    }
                                })
                            })
                        }()];
                    case 2:
                        return e.sent(), j(i.Success), [2]
                }
            })
        })
    }
    var W = {
            "/home": "Home",
            "/catalog": "Catalog",
            "/charts": "Games"
        },
        F = {
            "/catalog": "CatalogItem",
            "/bundles": "BundleDetail"
        };

    function z(t) {
        t.startsWith("/charts") && (t = "/charts");
        var e = b.get(t);
        if (e) return t in W && c.pageName.PageNameProvider.setInternalPageName(W[t]), e;
        var n = y.find(function(e) {
            return e[0].test(t)
        });
        if (n) {
            e = Object.keys(F).find(function(e) {
                return t.startsWith(e)
            });
            return e && c.pageName.PageNameProvider.setInternalPageName(F[e]), n[1]
        }
        return null
    }

    function _(e) {
        if (!(O() || e.ctrlKey || e.metaKey || e.shiftKey || e.altKey)) {
            var t = null;
            try {
                I = Date.now();
                var n = function(e) {
                    for (var t = e; null !== t;) {
                        if ("A" === t.tagName) return t;
                        t = t.parentElement
                    }
                    return null
                }(e.target);
                if (!n || !n.href) return;
                var a = new URL(n.href),
                    r = M(a.pathname);
                if (!(a.origin === window.location.origin && (a.href.endsWith(a.pathname) || null !== n.closest("#header") && "/catalog" === r || "/home" === T && r.startsWith("/charts/v2")))) return;
                if (P = window.location.href, window.dispatchEvent(new Event("setSearchMenuClose")), !(t = z(r))) return;
                e.preventDefault(), window.history.pushState({
                    referrer: P
                }, "", a.href), T = r
            } catch (e) {
                return void k(e)
            }
            H(t).catch(k)
        }
    }

    function K(e) {
        var t = null;
        try {
            I = Date.now();
            var n = M(window.location.pathname);
            if ("/catalog" === n && "/catalog" === T && "" === window.location.search) return void e.stopImmediatePropagation();
            if (T === n) return;
            if (O()) return void window.location.reload();
            if (!(t = z(T = n))) return void console.error("Component not found");
            P = null === (n = e.state) || void 0 === n ? void 0 : n.referrer
        } catch (e) {
            return void k(e)
        }
        H(t).catch(k)
    }

    function q(e) {
        var t = null;
        try {
            I = Date.now();
            var n = e.detail.url,
                a = new URL(n),
                r = M(a.pathname);
            if (!(t = z(r)) || O()) return void(window.location.href = n);
            P = window.location.href, window.history.pushState({
                referrer: P
            }, "", a.href), T = r
        } catch (e) {
            return void k(e)
        }
        H(t).catch(k)
    }

    function G() {
        ! function() {
            v = document.getElementById("routing");
            var e = JSON.parse(v.dataset.pathtocomponent),
                t = JSON.parse(v.dataset.pathregextocomponent),
                n = JSON.parse(v.dataset.staticcomponentdata);
            b = new Map(Object.entries(e)), y = Object.entries(t).map(function(e) {
                var t = e[0],
                    e = e[1];
                return [new RegExp(t), e]
            }), S = new Map(Object.entries(n))
        }(), e = document.querySelectorAll("head > script[data-bundlename], body > script[data-bundlename]"), E = new Set, e.forEach(function(e) {
            E.add(e.dataset.bundlename)
        }), document.querySelectorAll('#routing > script[data-bundlename^="' + C.DynamicLocalizationResourceScriptBundleNamePrefix + '"]').forEach(function(e) {
            E.add(e.dataset.bundlename)
        }), C.Setup();
        var e = z(T = M(window.location.pathname));
        e ? (N = e, document.body.addEventListener("click", _), window.addEventListener("popstate", K), window.addEventListener("externalNavigation", q), L = Date.now()) : console.error("Component not found")
    }(0, c.ready)(function() {
        G()
    })
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/9defff786538afca36e33d873730133a-routing.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Routing");
;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "a6538fca-a235-d0fa-4407-60e44b4746bf")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 822586, (e, t, n) => {
    "trimStart" in String.prototype || (String.prototype.trimStart = String.prototype.trimLeft), "trimEnd" in String.prototype || (String.prototype.trimEnd = String.prototype.trimRight), "description" in Symbol.prototype || Object.defineProperty(Symbol.prototype, "description", {
        configurable: !0,
        get: function() {
            var e = /\((.*)\)/.exec(this.toString());
            return e ? e[1] : void 0
        }
    }), Array.prototype.flat || (Array.prototype.flat = function(e, t) {
        return t = this.concat.apply([], this), e > 1 && t.some(Array.isArray) ? t.flat(e - 1) : t
    }, Array.prototype.flatMap = function(e, t) {
        return this.map(e, t).flat()
    }), Promise.prototype.finally || (Promise.prototype.finally = function(e) {
        if ("function" != typeof e) return this.then(e, e);
        var t = this.constructor || Promise;
        return this.then(function(n) {
            return t.resolve(e()).then(function() {
                return n
            })
        }, function(n) {
            return t.resolve(e()).then(function() {
                throw n
            })
        })
    }), Object.fromEntries || (Object.fromEntries = function(e) {
        return Array.from(e).reduce(function(e, t) {
            return e[t[0]] = t[1], e
        }, {})
    }), Array.prototype.at || (Array.prototype.at = function(e) {
        var t = Math.trunc(e) || 0;
        if (t < 0 && (t += this.length), !(t < 0 || t >= this.length)) return this[t]
    }), Object.hasOwn || (Object.hasOwn = function(e, t) {
        if (null == e) throw TypeError("Cannot convert undefined or null to object");
        return Object.prototype.hasOwnProperty.call(Object(e), t)
    }), "canParse" in URL || (URL.canParse = function(e, t) {
        try {
            return new URL(e, t), !0
        } catch (e) {
            return !1
        }
    })
}, 238509, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    var r = {
        default: function() {
            return i
        },
        isEqualNode: function() {
            return o
        }
    };
    for (var a in r) Object.defineProperty(n, a, {
        enumerable: !0,
        get: r[a]
    });
    let l = e.r(118605);

    function o(e, t) {
        if (e instanceof HTMLElement && t instanceof HTMLElement) {
            let n = t.getAttribute("nonce");
            if (n && !e.getAttribute("nonce")) {
                let r = t.cloneNode(!0);
                return r.setAttribute("nonce", ""), r.nonce = n, n === e.nonce && e.isEqualNode(r)
            }
        }
        return e.isEqualNode(t)
    }

    function i() {
        return {
            mountedInstances: new Set,
            updateHead: e => {
                let t = {};
                e.forEach(e => {
                    if ("link" === e.type && e.props["data-optimized-fonts"])
                        if (document.querySelector('style[data-href="'.concat(e.props["data-href"], '"]'))) return;
                        else e.props.href = e.props["data-href"], e.props["data-href"] = void 0;
                    let n = t[e.type] || [];
                    n.push(e), t[e.type] = n
                });
                let n = t.title ? t.title[0] : null,
                    r = "";
                if (n) {
                    let {
                        children: e
                    } = n.props;
                    r = "string" == typeof e ? e : Array.isArray(e) ? e.join("") : ""
                }
                r !== document.title && (document.title = r), ["meta", "base", "link", "style", "script"].forEach(e => {
                    ! function(e, t) {
                        let n = document.querySelector("head");
                        if (!n) return;
                        let r = new Set(n.querySelectorAll("".concat(e, "[data-next-head]")));
                        if ("meta" === e) {
                            let e = n.querySelector("meta[charset]");
                            null !== e && r.add(e)
                        }
                        let a = [];
                        for (let e = 0; e < t.length; e++) {
                            let n = function(e) {
                                let {
                                    type: t,
                                    props: n
                                } = e, r = document.createElement(t);
                                (0, l.setAttributesFromProps)(r, n);
                                let {
                                    children: a,
                                    dangerouslySetInnerHTML: o
                                } = n;
                                return o ? r.innerHTML = o.__html || "" : a && (r.textContent = "string" == typeof a ? a : Array.isArray(a) ? a.join("") : ""), r
                            }(t[e]);
                            n.setAttribute("data-next-head", "");
                            let i = !0;
                            for (let e of r)
                                if (o(e, n)) {
                                    r.delete(e), i = !1;
                                    break
                                } i && a.push(n)
                        }
                        for (let e of r) {
                            var i;
                            null == (i = e.parentNode) || i.removeChild(e)
                        }
                        for (let e of a) "meta" === e.tagName.toLowerCase() && null !== e.getAttribute("charset") && n.prepend(e), n.appendChild(e)
                    }(e, t[e] || [])
                })
            }
        }
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 462162, (e, t, n) => {
    "use strict";
    let r, a, l, o, i, u, s, c, d, f, p, h;
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    var m = {
        emitter: function() {
            return H
        },
        hydrate: function() {
            return ef
        },
        initialize: function() {
            return $
        },
        router: function() {
            return r
        },
        version: function() {
            return B
        }
    };
    for (var g in m) Object.defineProperty(n, g, {
        enumerable: !0,
        get: m[g]
    });
    let v = e.r(85038),
        y = e.r(785517);
    e.r(822586);
    let b = v._(e.r(643766)),
        _ = v._(e.r(312122)),
        S = e.r(521418),
        w = v._(e.r(271320)),
        E = e.r(601069),
        k = e.r(563022),
        x = e.r(787510),
        T = e.r(342848),
        P = e.r(283330),
        C = e.r(241994),
        N = v._(e.r(238509)),
        R = v._(e.r(704797)),
        A = e.r(262857),
        L = e.r(48435),
        O = e.r(277551),
        I = e.r(154157),
        D = e.r(561286),
        M = e.r(988083),
        z = e.r(23421),
        F = e.r(640947),
        j = e.r(398275),
        U = e.r(485331);
    e.r(212908), e.r(669768);
    let B = "16.4.5",
        H = (0, w.default)(),
        q = !1;
    class W extends b.default.Component {
        componentDidCatch(e, t) {
            this.props.fn(e, t)
        }
        componentDidMount() {
            this.scrollToHash(), r.isSsr && (a.isFallback || a.nextExport && ((0, x.isDynamicRoute)(r.pathname) || location.search || 1) || a.props && a.props.__N_SSG && (location.search || 1)) && r.replace(r.pathname + "?" + String((0, T.assign)((0, T.urlQueryToSearchParams)(r.query), new URLSearchParams(location.search))), l, {
                _h: 1,
                shallow: !a.isFallback && !q
            }).catch(e => {
                if (!e.cancelled) throw e
            })
        }
        componentDidUpdate() {
            this.scrollToHash()
        }
        scrollToHash() {
            let {
                hash: e
            } = location;
            if (!(e = e && e.substring(1))) return;
            let t = document.getElementById(e);
            t && setTimeout(() => t.scrollIntoView(), 0)
        }
        render() {
            return this.props.children
        }
    }
    async function $() {
        arguments.length > 0 && void 0 !== arguments[0] && arguments[0], a = JSON.parse(document.getElementById("__NEXT_DATA__").textContent), window.__NEXT_DATA__ = a, h = a.defaultLocale;
        let t = a.assetPrefix || "";
        if (self.__next_set_public_path__("".concat(t, "/_next/")), l = (0, P.getURL)(), (0, M.hasBasePath)(l) && (l = (0, D.removeBasePath)(l)), a.scriptLoader) {
            let {
                initScriptLoader: t
            } = e.r(358982);
            t(a.scriptLoader)
        }
        o = new R.default(a.buildId, t);
        let n = e => {
            let [t, n] = e;
            return o.routeLoader.onEntrypoint(t, n)
        };
        return window.__NEXT_P && window.__NEXT_P.map(e => setTimeout(() => n(e), 0)), window.__NEXT_P = [], window.__NEXT_P.push = n, (u = (0, N.default)()).getIsSsr = () => r.isSsr, i = document.getElementById("__next"), {
            assetPrefix: t
        }
    }

    function V(e, t) {
        return (0, y.jsx)(e, {
            ...t
        })
    }

    function Q(e) {
        var t;
        let {
            children: n
        } = e, a = b.default.useMemo(() => (0, F.adaptForAppRouterInstance)(r), []);
        return (0, y.jsx)(W, {
            fn: e => Y({
                App: d,
                err: e
            }).catch(e => console.error("Error rendering page: ", e)),
            children: (0, y.jsx)(z.AppRouterContext.Provider, {
                value: a,
                children: (0, y.jsx)(j.SearchParamsContext.Provider, {
                    value: (0, F.adaptForSearchParams)(r),
                    children: (0, y.jsx)(F.PathnameContextProviderAdapter, {
                        router: r,
                        isAutoExport: null != (t = self.__NEXT_DATA__.autoExport) && t,
                        children: (0, y.jsx)(j.PathParamsContext.Provider, {
                            value: (0, F.adaptForPathParams)(r),
                            children: (0, y.jsx)(E.RouterContext.Provider, {
                                value: (0, L.makePublicRouterInstance)(r),
                                children: (0, y.jsx)(S.HeadManagerContext.Provider, {
                                    value: u,
                                    children: (0, y.jsx)(I.ImageConfigContext.Provider, {
                                        value: {
                                            deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
                                            imageSizes: [32, 48, 64, 96, 128, 256, 384],
                                            qualities: [75],
                                            path: "/_next/image",
                                            loader: "default",
                                            dangerouslyAllowSVG: !1,
                                            unoptimized: !1
                                        },
                                        children: n
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })
    }
    let G = e => t => {
        let n = {
            ...t,
            Component: p,
            err: a.err,
            router: r
        };
        return (0, y.jsx)(Q, {
            children: V(e, n)
        })
    };

    function Y(t) {
        let {
            App: n,
            err: i
        } = t;
        return console.error(i), console.error("A client-side exception has occurred, see here for more info: https://nextjs.org/docs/messages/client-side-exception-occurred"), o.loadPage("/_error").then(r => {
            let {
                page: a,
                styleSheets: l
            } = r;
            return (null == s ? void 0 : s.Component) === a ? e.A(336034).then(r => e.A(205640).then(e => (t.App = n = e.default, r))).then(e => ({
                ErrorComponent: e.default,
                styleSheets: []
            })) : {
                ErrorComponent: a,
                styleSheets: l
            }
        }).then(e => {
            var o;
            let {
                ErrorComponent: u,
                styleSheets: s
            } = e, c = G(n), d = {
                Component: u,
                AppTree: c,
                router: r,
                ctx: {
                    err: i,
                    pathname: a.page,
                    query: a.query,
                    asPath: l,
                    AppTree: c
                }
            };
            return Promise.resolve((null == (o = t.props) ? void 0 : o.err) ? t.props : (0, P.loadGetInitialProps)(n, d)).then(e => ec({
                ...t,
                err: i,
                Component: u,
                styleSheets: s,
                props: e
            }))
        })
    }

    function X(e) {
        let {
            callback: t
        } = e;
        return b.default.useLayoutEffect(() => t(), [t]), null
    }
    let K = "beforeRender",
        J = "afterRender",
        Z = "afterHydrate",
        ee = "routeChange",
        et = "Next.js-hydration",
        en = "Next.js-route-change-to-render",
        er = "Next.js-render",
        ea = null,
        el = !0;

    function eo() {
        [K, Z, J, ee].forEach(e => performance.clearMarks(e))
    }

    function ei() {
        P.ST && (performance.mark(Z), performance.getEntriesByName(K, "mark").length && (performance.measure("Next.js-before-hydration", "navigationStart", K), performance.measure(et, K, Z)), f && performance.getEntriesByName(et).forEach(f), eo())
    }

    function eu() {
        if (!P.ST) return;
        performance.mark(J);
        let e = performance.getEntriesByName(ee, "mark");
        e.length && (performance.getEntriesByName(K, "mark").length && (performance.measure(en, e[0].name, K), performance.measure(er, K, J), f && (performance.getEntriesByName(er).forEach(f), performance.getEntriesByName(en).forEach(f))), eo(), [en, er].forEach(e => performance.clearMeasures(e)))
    }

    function es(e) {
        let {
            callbacks: t,
            children: n
        } = e;
        return b.default.useLayoutEffect(() => t.forEach(e => e()), [t]), n
    }

    function ec(e) {
        var t, n;
        let a, l, {
                App: o,
                Component: u,
                props: d,
                err: f
            } = e,
            p = "initial" in e ? void 0 : e.styleSheets;
        u = u || s.Component;
        let h = {
            ...d = d || s.props,
            Component: u,
            err: f,
            router: r
        };
        s = h;
        let m = new Promise((e, t) => {
            c && c(), l = () => {
                c = null, e()
            }, c = () => {
                c = null;
                let e = Error("Cancel rendering route");
                e.cancelled = !0, t(e)
            }
        });

        function g() {
            l()
        }! function() {
            let e;
            if (!p) return;
            let t = new Set((e = document.querySelectorAll("style[data-n-href]"), [].slice.call(e)).map(e => e.getAttribute("data-n-href"))),
                n = document.querySelector("noscript[data-n-css]"),
                r = null == n ? void 0 : n.getAttribute("data-n-css");
            p.forEach(e => {
                let {
                    href: n,
                    text: a
                } = e;
                if (!t.has(n)) {
                    let e = document.createElement("style");
                    e.setAttribute("data-n-href", n), e.setAttribute("media", "x"), r && e.setAttribute("nonce", r), document.head.appendChild(e), e.appendChild(document.createTextNode(a))
                }
            })
        }();
        let v = (0, y.jsxs)(y.Fragment, {
            children: [(0, y.jsx)(X, {
                callback: function() {
                    if (e.scroll) {
                        let {
                            x: t,
                            y: n
                        } = e.scroll;
                        (0, k.disableSmoothScrollDuringRouteTransition)(() => {
                            window.scrollTo(t, n)
                        })
                    }
                }
            }), (0, y.jsxs)(Q, {
                children: [V(o, h), (0, y.jsx)(C.Portal, {
                    type: "next-route-announcer",
                    children: (0, y.jsx)(A.RouteAnnouncer, {})
                })]
            })]
        });
        return t = i, n = e => (0, y.jsx)(es, {
            callbacks: [e, g],
            children: v
        }), P.ST && performance.mark(K), a = n(el ? ei : eu), ea ? (0, b.default.startTransition)(() => {
            ea.render(a)
        }) : (ea = _.default.hydrateRoot(t, a, {
            onRecoverableError: U.onRecoverableError
        }), el = !1), m
    }
    async function ed(e) {
        if (e.err && (void 0 === e.Component || !e.isHydratePass)) return void await Y(e);
        try {
            await ec(e)
        } catch (n) {
            let t = (0, O.getProperError)(n);
            if (t.cancelled) throw t;
            await Y({
                ...e,
                err: t
            })
        }
    }
    async function ef(e) {
        let t = a.err;
        try {
            let e = await o.routeLoader.whenEntrypoint("/_app");
            if ("error" in e) throw e.error;
            let {
                component: t,
                exports: n
            } = e;
            d = t, n && n.reportWebVitals && (f = e => {
                let t, {
                        id: r,
                        name: a,
                        startTime: l,
                        value: o,
                        duration: i,
                        entryType: u,
                        entries: s,
                        attribution: c
                    } = e,
                    d = "".concat(Date.now(), "-").concat(Math.floor(Math.random() * (9e12 - 1)) + 1e12);
                s && s.length && (t = s[0].startTime);
                let f = {
                    id: r || d,
                    name: a,
                    startTime: l || t,
                    value: null == o ? i : o,
                    label: "mark" === u || "measure" === u ? "custom" : "web-vital"
                };
                c && (f.attribution = c), n.reportWebVitals(f)
            });
            let r = await o.routeLoader.whenEntrypoint(a.page);
            if ("error" in r) throw r.error;
            p = r.component
        } catch (e) {
            t = (0, O.getProperError)(e)
        }
        window.__NEXT_PRELOADREADY && await window.__NEXT_PRELOADREADY(a.dynamicIds), r = (0, L.createRouter)(a.page, a.query, l, {
            initialProps: a.props,
            pageLoader: o,
            App: d,
            Component: p,
            wrapApp: G,
            err: t,
            isFallback: !!a.isFallback,
            subscription: (e, t, n) => ed(Object.assign({}, e, {
                App: t,
                scroll: n
            })),
            locale: a.locale,
            locales: a.locales,
            defaultLocale: h,
            domainLocales: a.domainLocales,
            isPreview: a.isPreview
        }), q = await r._initialMatchesMiddlewarePromise;
        let n = {
            App: d,
            initial: !0,
            Component: p,
            props: a.props,
            err: t,
            isHydratePass: !0
        };
        (null == e ? void 0 : e.beforeRender) && await e.beforeRender(), ed(n)
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 12480, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), e.r(10174), e.r(115894);
    let r = e.r(462162);
    window.next = {
        version: r.version,
        turbopack: !0,
        get router() {
            return r.router
        },
        emitter: r.emitter
    }, self.__next_set_public_path__ = () => {}, self.__webpack_hash__ = "", (0, r.initialize)({}).then(() => (self.__turbopack_load_page_chunks__ = (t, n) => {
        Promise.all(n.map(t => e.l(t))).catch(e => console.error("failed to load chunks for page " + t, e))
    }, (0, r.hydrate)())).catch(e => {
        console.error("Error was not caught", e)
    }), ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 704797, (e, t, n) => {
    "use strict";
    var r = e.i(163021);
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "default", {
        enumerable: !0,
        get: function() {
            return h
        }
    });
    let a = e.r(85038),
        l = e.r(481994),
        o = e.r(389628),
        i = a._(e.r(549763)),
        u = e.r(990163),
        s = e.r(787510),
        c = e.r(739635),
        d = e.r(410723),
        f = e.r(600686);
    e.r(943800);
    let p = e.r(691392);
    class h {
        getPageList() {
            return (0, f.getClientBuildManifest)().then(e => e.sortedPages)
        }
        getMiddleware() {
            if (r.default.env.__NEXT_MIDDLEWARE_MATCHERS) {
                let e = r.default.env.__NEXT_MIDDLEWARE_MATCHERS;
                return window.__MIDDLEWARE_MATCHERS = e || void 0, window.__MIDDLEWARE_MATCHERS
            }
            if (window.__MIDDLEWARE_MATCHERS) return window.__MIDDLEWARE_MATCHERS;
            {
                let e = new Promise(e => {
                    let t = self.__MIDDLEWARE_MATCHERS_CB;
                    self.__MIDDLEWARE_MATCHERS_CB = () => {
                        e(self.__MIDDLEWARE_MATCHERS), t && t()
                    }
                });
                return (0, p.resolvePromiseWithTimeout)(e, (0, f.markAssetError)(Error("Failed to load client middleware manifest")), void 0)
            }
        }
        getDataHref(e) {
            var t;
            let n, {
                    asPath: r,
                    href: a,
                    locale: f
                } = e,
                {
                    pathname: p,
                    query: h,
                    search: m
                } = (0, c.parseRelativeUrl)(a),
                {
                    pathname: g
                } = (0, c.parseRelativeUrl)(r),
                v = (0, d.removeTrailingSlash)(p);
            if ("/" !== v[0]) throw Error('Route name should start with a "/", got "'.concat(v, '"'));
            return t = e.skipInterpolation ? g : (0, s.isDynamicRoute)(v) ? (0, o.interpolateAs)(p, g, h).result : v, n = (0, i.default)((0, d.removeTrailingSlash)((0, u.addLocale)(t, f)), ".json"), (0, l.addBasePath)("/_next/data/".concat(this.buildId).concat(n).concat(m), !0)
        }
        _isSsg(e) {
            return this.promisedSsgManifest.then(t => t.has(e))
        }
        loadPage(e) {
            return this.routeLoader.loadRoute(e).then(e => {
                if ("component" in e) return {
                    page: e.component,
                    mod: e.exports,
                    styleSheets: e.styles.map(e => ({
                        href: e.href,
                        text: e.content
                    }))
                };
                throw e.error
            })
        }
        prefetch(e) {
            return this.routeLoader.prefetch(e)
        }
        constructor(e, t) {
            this.routeLoader = (0, f.createRouteLoader)(t), this.buildId = e, this.assetPrefix = t, this.promisedSsgManifest = new Promise(e => {
                window.__SSG_MANIFEST ? e(window.__SSG_MANIFEST) : window.__SSG_MANIFEST_CB = () => {
                    e(window.__SSG_MANIFEST)
                }
            })
        }
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 241994, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "Portal", {
        enumerable: !0,
        get: function() {
            return l
        }
    });
    let r = e.r(643766),
        a = e.r(860663),
        l = e => {
            let {
                children: t,
                type: n
            } = e, [l, o] = (0, r.useState)(null);
            return (0, r.useEffect)(() => {
                let e = document.createElement(n);
                return document.body.appendChild(e), o(e), () => {
                    document.body.removeChild(e)
                }
            }, [n]), l ? (0, a.createPortal)(t, l) : null
        };
    ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 485331, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    var r = {
        isRecoverableError: function() {
            return c
        },
        onRecoverableError: function() {
            return d
        }
    };
    for (var a in r) Object.defineProperty(n, a, {
        enumerable: !0,
        get: r[a]
    });
    let l = e.r(85038),
        o = e.r(932334),
        i = l._(e.r(277551)),
        u = e.r(606043),
        s = new WeakSet;

    function c(e) {
        return s.has(e)
    }
    let d = e => {
        let t = (0, i.default)(e) && "cause" in e ? e.cause : e;
        (0, o.isBailoutToCSRError)(t) || (0, u.reportGlobalError)(t)
    };
    ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 606043, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "reportGlobalError", {
        enumerable: !0,
        get: function() {
            return r
        }
    });
    let r = "function" == typeof reportError ? reportError : e => {
        globalThis.console.error(e)
    };
    ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 10174, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    let r = (0, e.r(167886).getDeploymentId)();
    globalThis.NEXT_DEPLOYMENT_ID = r, ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 262857, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    var r = {
        RouteAnnouncer: function() {
            return c
        },
        default: function() {
            return d
        }
    };
    for (var a in r) Object.defineProperty(n, a, {
        enumerable: !0,
        get: r[a]
    });
    let l = e.r(85038),
        o = e.r(785517),
        i = l._(e.r(643766)),
        u = e.r(48435),
        s = {
            border: 0,
            clip: "rect(0 0 0 0)",
            height: "1px",
            margin: "-1px",
            overflow: "hidden",
            padding: 0,
            position: "absolute",
            top: 0,
            width: "1px",
            whiteSpace: "nowrap",
            wordWrap: "normal"
        },
        c = () => {
            let {
                asPath: e
            } = (0, u.useRouter)(), [t, n] = i.default.useState(""), r = i.default.useRef(e);
            return i.default.useEffect(() => {
                if (r.current !== e)
                    if (r.current = e, document.title) n(document.title);
                    else {
                        var t;
                        let r = document.querySelector("h1");
                        n((null != (t = null == r ? void 0 : r.innerText) ? t : null == r ? void 0 : r.textContent) || e)
                    }
            }, [e]), (0, o.jsx)("p", {
                "aria-live": "assertive",
                id: "__next-route-announcer__",
                role: "alert",
                style: s,
                children: t
            })
        },
        d = c;
    ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 212908, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "default", {
        enumerable: !0,
        get: function() {
            return l
        }
    });
    let r = e.r(85038)._(e.r(271320));
    class a {
        end(e) {
            if ("ended" === this.state.state) throw Error("Span has already ended");
            this.state = {
                state: "ended",
                endTime: null != e ? e : Date.now()
            }, this.onSpanEnd(this)
        }
        constructor(e, t, n) {
            var r, a;
            this.name = e, this.attributes = null != (r = t.attributes) ? r : {}, this.startTime = null != (a = t.startTime) ? a : Date.now(), this.onSpanEnd = n, this.state = {
                state: "inprogress"
            }
        }
    }
    let l = new class {
        startSpan(e, t) {
            return new a(e, t, this.handleSpanEnd)
        }
        onSpanEnd(e) {
            return this._emitter.on("spanend", e), () => {
                this._emitter.off("spanend", e)
            }
        }
        constructor() {
            this._emitter = (0, r.default)(), this.handleSpanEnd = e => {
                this._emitter.emit("spanend", e)
            }
        }
    };
    ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 115894, (e, t, n) => {
    "use strict";
    {
        let n = e.f({
            "private-next-instrumentation-client": {
                id: () => 171908,
                module: () => e.r(171908)
            }
        })("private-next-instrumentation-client");
        t.exports = Array.isArray(n) ? n : [n]
    }
}, 943800, (e, t, n) => {
    "use strict";
    var r, a, l, o = e.i(163021);
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    var i = {
        APP_CLIENT_INTERNALS: function() {
            return eo
        },
        APP_PATHS_MANIFEST: function() {
            return w
        },
        APP_PATH_ROUTES_MANIFEST: function() {
            return E
        },
        AdapterOutputType: function() {
            return p
        },
        BARREL_OPTIMIZATION_PREFIX: function() {
            return K
        },
        BLOCKED_PAGES: function() {
            return V
        },
        BUILD_ID_FILE: function() {
            return $
        },
        BUILD_MANIFEST: function() {
            return k
        },
        CLIENT_PUBLIC_FILES_PATH: function() {
            return Q
        },
        CLIENT_REFERENCE_MANIFEST: function() {
            return J
        },
        CLIENT_STATIC_FILES_PATH: function() {
            return G
        },
        CLIENT_STATIC_FILES_RUNTIME_MAIN: function() {
            return ea
        },
        CLIENT_STATIC_FILES_RUNTIME_MAIN_APP: function() {
            return el
        },
        CLIENT_STATIC_FILES_RUNTIME_POLYFILLS: function() {
            return es
        },
        CLIENT_STATIC_FILES_RUNTIME_POLYFILLS_SYMBOL: function() {
            return ec
        },
        CLIENT_STATIC_FILES_RUNTIME_REACT_REFRESH: function() {
            return ei
        },
        CLIENT_STATIC_FILES_RUNTIME_WEBPACK: function() {
            return eu
        },
        COMPILER_INDEXES: function() {
            return f
        },
        COMPILER_NAMES: function() {
            return d
        },
        CONFIG_FILES: function() {
            return W
        },
        DEFAULT_RUNTIME_WEBPACK: function() {
            return ed
        },
        DEFAULT_SANS_SERIF_FONT: function() {
            return eg
        },
        DEFAULT_SERIF_FONT: function() {
            return em
        },
        DEV_CLIENT_MIDDLEWARE_MANIFEST: function() {
            return B
        },
        DEV_CLIENT_PAGES_MANIFEST: function() {
            return M
        },
        DYNAMIC_CSS_MANIFEST: function() {
            return er
        },
        EDGE_RUNTIME_WEBPACK: function() {
            return ef
        },
        EDGE_UNSUPPORTED_NODE_APIS: function() {
            return eS
        },
        EXPORT_DETAIL: function() {
            return N
        },
        EXPORT_MARKER: function() {
            return C
        },
        FUNCTIONS_CONFIG_MANIFEST: function() {
            return x
        },
        IMAGES_MANIFEST: function() {
            return I
        },
        INTERCEPTION_ROUTE_REWRITE_MANIFEST: function() {
            return en
        },
        MIDDLEWARE_BUILD_MANIFEST: function() {
            return ee
        },
        MIDDLEWARE_MANIFEST: function() {
            return F
        },
        MIDDLEWARE_REACT_LOADABLE_MANIFEST: function() {
            return et
        },
        MODERN_BROWSERSLIST_TARGET: function() {
            return s.default
        },
        NEXT_BUILTIN_DOCUMENT: function() {
            return X
        },
        NEXT_FONT_MANIFEST: function() {
            return P
        },
        PAGES_MANIFEST: function() {
            return S
        },
        PHASE_ANALYZE: function() {
            return m
        },
        PHASE_DEVELOPMENT_SERVER: function() {
            return y
        },
        PHASE_EXPORT: function() {
            return h
        },
        PHASE_INFO: function() {
            return _
        },
        PHASE_PRODUCTION_BUILD: function() {
            return g
        },
        PHASE_PRODUCTION_SERVER: function() {
            return v
        },
        PHASE_TEST: function() {
            return b
        },
        PREFETCH_HINTS: function() {
            return A
        },
        PRERENDER_MANIFEST: function() {
            return R
        },
        PREVIEW_PROPS_MANIFEST: function() {
            return L
        },
        REACT_LOADABLE_MANIFEST: function() {
            return H
        },
        REQUEST_INSIGHTS_DEV_ENDPOINT: function() {
            return z
        },
        ROUTES_MANIFEST: function() {
            return O
        },
        RSC_MODULE_TYPES: function() {
            return e_
        },
        SERVER_DIRECTORY: function() {
            return q
        },
        SERVER_FILES_MANIFEST: function() {
            return D
        },
        SERVER_PROPS_ID: function() {
            return eh
        },
        SERVER_REFERENCE_MANIFEST: function() {
            return Z
        },
        STATIC_PROPS_ID: function() {
            return ep
        },
        STATIC_STATUS_PAGES: function() {
            return ev
        },
        STRING_LITERAL_DROP_BUNDLE: function() {
            return Y
        },
        SUBRESOURCE_INTEGRITY_MANIFEST: function() {
            return T
        },
        SYSTEM_ENTRYPOINTS: function() {
            return ew
        },
        TRACE_OUTPUT_VERSION: function() {
            return ey
        },
        TURBOPACK_CLIENT_BUILD_MANIFEST: function() {
            return U
        },
        TURBOPACK_CLIENT_MIDDLEWARE_MANIFEST: function() {
            return j
        },
        TURBO_TRACE_DEFAULT_MEMORY_LIMIT: function() {
            return eb
        },
        UNDERSCORE_GLOBAL_ERROR_ROUTE: function() {
            return c.UNDERSCORE_GLOBAL_ERROR_ROUTE
        },
        UNDERSCORE_GLOBAL_ERROR_ROUTE_ENTRY: function() {
            return c.UNDERSCORE_GLOBAL_ERROR_ROUTE_ENTRY
        },
        UNDERSCORE_NOT_FOUND_ROUTE: function() {
            return c.UNDERSCORE_NOT_FOUND_ROUTE
        },
        UNDERSCORE_NOT_FOUND_ROUTE_ENTRY: function() {
            return c.UNDERSCORE_NOT_FOUND_ROUTE_ENTRY
        }
    };
    for (var u in i) Object.defineProperty(n, u, {
        enumerable: !0,
        get: i[u]
    });
    let s = e.r(85038)._(e.r(857945)),
        c = e.r(219571),
        d = {
            client: "client",
            server: "server",
            edgeServer: "edge-server"
        },
        f = {
            [d.client]: 0,
            [d.server]: 1,
            [d.edgeServer]: 2
        };
    var p = ((r = {}).PAGES = "PAGES", r.PAGES_API = "PAGES_API", r.APP_PAGE = "APP_PAGE", r.APP_ROUTE = "APP_ROUTE", r.PRERENDER = "PRERENDER", r.STATIC_FILE = "STATIC_FILE", r.MIDDLEWARE = "MIDDLEWARE", r);
    let h = "phase-export",
        m = "phase-analyze",
        g = "phase-production-build",
        v = "phase-production-server",
        y = "phase-development-server",
        b = "phase-test",
        _ = "phase-info",
        S = "pages-manifest.json",
        w = "app-paths-manifest.json",
        E = "app-path-routes-manifest.json",
        k = "build-manifest.json",
        x = "functions-config-manifest.json",
        T = "subresource-integrity-manifest",
        P = "next-font-manifest",
        C = "export-marker.json",
        N = "export-detail.json",
        R = "prerender-manifest.json",
        A = "prefetch-hints.json",
        L = "preview-props.json",
        O = "routes-manifest.json",
        I = "images-manifest.json",
        D = "required-server-files",
        M = "_devPagesManifest.json",
        z = "/_next/development/request-insights",
        F = "middleware-manifest.json",
        j = "_clientMiddlewareManifest.js",
        U = "client-build-manifest.json",
        B = "_devMiddlewareManifest.json",
        H = "react-loadable-manifest.json",
        q = "server",
        W = ["next.config.js", "next.config.mjs", "next.config.ts", ...(null == (l = o.default) || null == (a = l.features) ? void 0 : a.typescript) ? ["next.config.mts"] : []],
        $ = "BUILD_ID",
        V = ["/_document", "/_app", "/_error"],
        Q = "public",
        G = "static",
        Y = "__NEXT_DROP_CLIENT_FILE__",
        X = "__NEXT_BUILTIN_DOCUMENT__",
        K = "__barrel_optimize__",
        J = "client-reference-manifest",
        Z = "server-reference-manifest",
        ee = "middleware-build-manifest",
        et = "middleware-react-loadable-manifest",
        en = "interception-route-rewrite-manifest",
        er = "dynamic-css-manifest",
        ea = "main",
        el = "".concat(ea, "-app"),
        eo = "app-pages-internals",
        ei = "react-refresh",
        eu = "webpack",
        es = "polyfills",
        ec = Symbol(es),
        ed = "webpack-runtime",
        ef = "edge-runtime-webpack",
        ep = "__N_SSG",
        eh = "__N_SSP",
        em = {
            name: "Times New Roman",
            xAvgCharWidth: 821,
            azAvgWidth: 854.3953488372093,
            unitsPerEm: 2048
        },
        eg = {
            name: "Arial",
            xAvgCharWidth: 904,
            azAvgWidth: 934.5116279069767,
            unitsPerEm: 2048
        },
        ev = ["/500"],
        ey = 1,
        eb = 6e3,
        e_ = {
            client: "client",
            server: "server"
        },
        eS = ["clearImmediate", "setImmediate", "BroadcastChannel", "ByteLengthQueuingStrategy", "CompressionStream", "CountQueuingStrategy", "DecompressionStream", "DomException", "MessageChannel", "MessageEvent", "MessagePort", "ReadableByteStreamController", "ReadableStreamBYOBRequest", "ReadableStreamDefaultController", "TransformStreamDefaultController", "WritableStreamDefaultController"],
        ew = new Set([ea, ei, el]);
    ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 219571, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    var r = {
        UNDERSCORE_GLOBAL_ERROR_ROUTE: function() {
            return i
        },
        UNDERSCORE_GLOBAL_ERROR_ROUTE_ENTRY: function() {
            return u
        },
        UNDERSCORE_NOT_FOUND_ROUTE: function() {
            return l
        },
        UNDERSCORE_NOT_FOUND_ROUTE_ENTRY: function() {
            return o
        }
    };
    for (var a in r) Object.defineProperty(n, a, {
        enumerable: !0,
        get: r[a]
    });
    let l = "/_not-found",
        o = "".concat(l, "/page"),
        i = "/_global-error",
        u = "".concat(i, "/page")
}, 154157, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "ImageConfigContext", {
        enumerable: !0,
        get: function() {
            return l
        }
    });
    let r = e.r(85038)._(e.r(643766)),
        a = e.r(35610),
        l = r.default.createContext(a.imageConfigDefault)
}, 35610, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    var r = {
        VALID_LOADERS: function() {
            return l
        },
        imageConfigDefault: function() {
            return s
        },
        prepareImageConfig: function() {
            return u
        }
    };
    for (var a in r) Object.defineProperty(n, a, {
        enumerable: !0,
        get: r[a]
    });
    let l = ["default", "imgix", "cloudinary", "akamai", "custom"],
        o = {},
        i = new WeakMap;

    function u(e, t) {
        let n = null != e ? e : o,
            r = null != t ? t : o,
            a = i.get(n);
        if (a) {
            let e = a.get(r);
            if (e) return e
        }
        let l = e || t || s,
            u = [...l.deviceSizes].sort((e, t) => e - t),
            c = [...l.imageSizes],
            d = {
                deviceSizes: u,
                imageSizes: c,
                allSizes: [...u, ...c].sort((e, t) => e - t),
                qualities: void 0 === l.qualities ? void 0 : [...l.qualities].sort((e, t) => e - t),
                path: l.path,
                loader: l.loader,
                dangerouslyAllowSVG: l.dangerouslyAllowSVG,
                unoptimized: l.unoptimized,
                domains: l.domains,
                remotePatterns: l.remotePatterns,
                localPatterns: "u" < typeof window && void 0 !== t ? t.localPatterns : l.localPatterns,
                output: l.output
            };
        return a || (a = new WeakMap, i.set(n, a)), a.set(r, d), d
    }
    let s = {
        deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
        imageSizes: [32, 48, 64, 96, 128, 256, 384],
        path: "/_next/image",
        loader: "default",
        loaderFile: "",
        domains: [],
        disableStaticImages: !1,
        minimumCacheTTL: 14400,
        formats: ["image/webp"],
        maximumDiskCacheSize: void 0,
        maximumRedirects: 3,
        maximumResponseBody: 5e7,
        dangerouslyAllowLocalIP: !1,
        dangerouslyAllowSVG: !1,
        contentSecurityPolicy: "script-src 'none'; frame-src 'none'; sandbox;",
        contentDispositionType: "attachment",
        localPatterns: void 0,
        remotePatterns: [],
        qualities: [75],
        unoptimized: !1,
        customCacheHandler: !1
    }
}, 857945, (e, t, n) => {
    "use strict";
    t.exports = ["chrome 111", "edge 111", "firefox 111", "safari 16.4"]
}, 640947, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    var r = {
        PathnameContextProviderAdapter: function() {
            return m
        },
        adaptForAppRouterInstance: function() {
            return f
        },
        adaptForPathParams: function() {
            return h
        },
        adaptForSearchParams: function() {
            return p
        }
    };
    for (var a in r) Object.defineProperty(n, a, {
        enumerable: !0,
        get: r[a]
    });
    let l = e.r(374156),
        o = e.r(785517),
        i = l._(e.r(643766)),
        u = e.r(398275),
        s = e.r(459197),
        c = e.r(442026),
        d = e.r(979880);

    function f(e) {
        return {
            back() {
                e.back()
            },
            forward() {
                e.forward()
            },
            refresh() {
                e.reload()
            },
            hmrRefresh() {},
            push(t) {
                let {
                    scroll: n
                } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                e.push(t, void 0, {
                    scroll: n
                })
            },
            replace(t) {
                let {
                    scroll: n
                } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                e.replace(t, void 0, {
                    scroll: n
                })
            },
            prefetch(t) {
                e.prefetch(t)
            },
            bfcacheId: "0"
        }
    }

    function p(e) {
        return e.isReady && e.query ? (0, c.asPathToSearchParams)(e.asPath) : new URLSearchParams
    }

    function h(e) {
        if (!e.isReady || !e.query) return null;
        let t = {};
        for (let n of Object.keys((0, d.getRouteRegex)(e.pathname).groups)) t[n] = e.query[n];
        return t
    }

    function m(e) {
        let {
            children: t,
            router: n,
            ...r
        } = e, a = (0, i.useRef)(r.isAutoExport), l = (0, i.useMemo)(() => {
            let e, t = a.current;
            if (t && (a.current = !1), (0, s.isDynamicRoute)(n.pathname) && (n.isFallback || t && !n.isReady)) return null;
            try {
                e = new URL(n.asPath, "http://f")
            } catch (e) {
                return "/"
            }
            return e.pathname
        }, [n.asPath, n.isFallback, n.isReady, n.pathname]);
        return (0, o.jsx)(u.PathnameContext.Provider, {
            value: l,
            children: t
        })
    }
}, 442026, (e, t, n) => {
    "use strict";

    function r(e) {
        return new URL(e, "http://n").searchParams
    }
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "asPathToSearchParams", {
        enumerable: !0,
        get: function() {
            return r
        }
    })
}, 521366, (e, t, n) => {
    "use strict";
    var r, a = e.i(163021),
        l = e.r(787371),
        o = e.r(643766),
        i = e.r(860663);

    function u(e) {
        var t = "https://react.dev/errors/" + e;
        if (1 < arguments.length) {
            t += "?args[]=" + encodeURIComponent(arguments[1]);
            for (var n = 2; n < arguments.length; n++) t += "&args[]=" + encodeURIComponent(arguments[n])
        }
        return "Minified React error #" + e + "; visit " + t + " for the full message or use the non-minified dev environment for full errors and additional helpful warnings."
    }

    function s(e) {
        return !(!e || 1 !== e.nodeType && 9 !== e.nodeType && 11 !== e.nodeType)
    }

    function c(e) {
        var t = e,
            n = e;
        if (e.alternate)
            for (; t.return;) t = t.return;
        else {
            e = t;
            do 0 != (4098 & (t = e).flags) && (n = t.return), e = t.return; while (e)
        }
        return 3 === t.tag ? n : null
    }

    function d(e) {
        if (13 === e.tag) {
            var t = e.memoizedState;
            if (null === t && null !== (e = e.alternate) && (t = e.memoizedState), null !== t) return t.dehydrated
        }
        return null
    }

    function f(e) {
        if (31 === e.tag) {
            var t = e.memoizedState;
            if (null === t && null !== (e = e.alternate) && (t = e.memoizedState), null !== t) return t.dehydrated
        }
        return null
    }

    function p(e) {
        if (c(e) !== e) throw Error(u(188))
    }
    var h = Object.assign,
        m = Symbol.for("react.element"),
        g = Symbol.for("react.transitional.element"),
        v = Symbol.for("react.portal"),
        y = Symbol.for("react.fragment"),
        b = Symbol.for("react.strict_mode"),
        _ = Symbol.for("react.profiler"),
        S = Symbol.for("react.consumer"),
        w = Symbol.for("react.context"),
        E = Symbol.for("react.forward_ref"),
        k = Symbol.for("react.suspense"),
        x = Symbol.for("react.suspense_list"),
        T = Symbol.for("react.memo"),
        P = Symbol.for("react.lazy");
    Symbol.for("react.scope");
    var C = Symbol.for("react.activity");
    Symbol.for("react.legacy_hidden"), Symbol.for("react.tracing_marker");
    var N = Symbol.for("react.memo_cache_sentinel");
    Symbol.for("react.view_transition");
    var R = Symbol.iterator;

    function A(e) {
        return null === e || "object" != typeof e ? null : "function" == typeof(e = R && e[R] || e["@@iterator"]) ? e : null
    }
    var L = Symbol.for("react.client.reference"),
        O = Array.isArray,
        I = o.__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE,
        D = i.__DOM_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE,
        M = {
            pending: !1,
            data: null,
            method: null,
            action: null
        },
        z = [],
        F = -1;

    function j(e) {
        return {
            current: e
        }
    }

    function U(e) {
        0 > F || (e.current = z[F], z[F] = null, F--)
    }

    function B(e, t) {
        z[++F] = e.current, e.current = t
    }
    var H = j(null),
        q = j(null),
        W = j(null),
        $ = j(null);

    function V(e, t) {
        switch (B(W, t), B(q, e), B(H, null), t.nodeType) {
            case 9:
            case 11:
                e = (e = t.documentElement) && (e = e.namespaceURI) ? sg(e) : 0;
                break;
            default:
                if (e = t.tagName, t = t.namespaceURI) e = sv(t = sg(t), e);
                else switch (e) {
                    case "svg":
                        e = 1;
                        break;
                    case "math":
                        e = 2;
                        break;
                    default:
                        e = 0
                }
        }
        U(H), B(H, e)
    }

    function Q() {
        U(H), U(q), U(W)
    }

    function G(e) {
        null !== e.memoizedState && B($, e);
        var t = H.current,
            n = sv(t, e.type);
        t !== n && (B(q, e), B(H, n))
    }

    function Y(e) {
        q.current === e && (U(H), U(q)), $.current === e && (U($), s7._currentValue = M)
    }

    function X(e) {
        if (void 0 === tD) try {
            throw Error()
        } catch (e) {
            var t = e.stack.trim().match(/\n( *(at )?)/);
            tD = t && t[1] || "", tM = -1 < e.stack.indexOf("\n    at") ? " (<anonymous>)" : -1 < e.stack.indexOf("@") ? "@unknown:0:0" : ""
        }
        return "\n" + tD + e + tM
    }
    var K = !1;

    function J(e, t) {
        if (!e || K) return "";
        K = !0;
        var n = Error.prepareStackTrace;
        Error.prepareStackTrace = void 0;
        try {
            var r = {
                DetermineComponentFrameRoot: function() {
                    try {
                        if (t) {
                            var n = function() {
                                throw Error()
                            };
                            if (Object.defineProperty(n.prototype, "props", {
                                    set: function() {
                                        throw Error()
                                    }
                                }), "object" == typeof Reflect && Reflect.construct) {
                                try {
                                    Reflect.construct(n, [])
                                } catch (e) {
                                    var r = e
                                }
                                Reflect.construct(e, [], n)
                            } else {
                                try {
                                    n.call()
                                } catch (e) {
                                    r = e
                                }
                                e.call(n.prototype)
                            }
                        } else {
                            try {
                                throw Error()
                            } catch (e) {
                                r = e
                            }(n = e()) && "function" == typeof n.catch && n.catch(function() {})
                        }
                    } catch (e) {
                        if (e && r && "string" == typeof e.stack) return [e.stack, r.stack]
                    }
                    return [null, null]
                }
            };
            r.DetermineComponentFrameRoot.displayName = "DetermineComponentFrameRoot";
            var a = Object.getOwnPropertyDescriptor(r.DetermineComponentFrameRoot, "name");
            a && a.configurable && Object.defineProperty(r.DetermineComponentFrameRoot, "name", {
                value: "DetermineComponentFrameRoot"
            });
            var l = r.DetermineComponentFrameRoot(),
                o = l[0],
                i = l[1];
            if (o && i) {
                var u = o.split("\n"),
                    s = i.split("\n");
                for (a = r = 0; r < u.length && !u[r].includes("DetermineComponentFrameRoot");) r++;
                for (; a < s.length && !s[a].includes("DetermineComponentFrameRoot");) a++;
                if (r === u.length || a === s.length)
                    for (r = u.length - 1, a = s.length - 1; 1 <= r && 0 <= a && u[r] !== s[a];) a--;
                for (; 1 <= r && 0 <= a; r--, a--)
                    if (u[r] !== s[a]) {
                        if (1 !== r || 1 !== a)
                            do
                                if (r--, a--, 0 > a || u[r] !== s[a]) {
                                    var c = "\n" + u[r].replace(" at new ", " at ");
                                    return e.displayName && c.includes("<anonymous>") && (c = c.replace("<anonymous>", e.displayName)), c
                                } while (1 <= r && 0 <= a) break
                    }
            }
        } finally {
            K = !1, Error.prepareStackTrace = n
        }
        return (n = e ? e.displayName || e.name : "") ? X(n) : ""
    }

    function Z(e) {
        try {
            var t = "",
                n = null;
            do t += function(e, t) {
                switch (e.tag) {
                    case 26:
                    case 27:
                    case 5:
                        return X(e.type);
                    case 16:
                        return X("Lazy");
                    case 13:
                        return e.child !== t && null !== t ? X("Suspense Fallback") : X("Suspense");
                    case 19:
                        return X("SuspenseList");
                    case 0:
                    case 15:
                        return J(e.type, !1);
                    case 11:
                        return J(e.type.render, !1);
                    case 1:
                        return J(e.type, !0);
                    case 31:
                        return X("Activity");
                    default:
                        return ""
                }
            }(e, n), n = e, e = e.return; while (e) return t
        } catch (e) {
            return "\nError generating stack: " + e.message + "\n" + e.stack
        }
    }
    var ee = Object.prototype.hasOwnProperty,
        et = l.unstable_scheduleCallback,
        en = l.unstable_cancelCallback,
        er = l.unstable_shouldYield,
        ea = l.unstable_requestPaint,
        el = l.unstable_now,
        eo = l.unstable_getCurrentPriorityLevel,
        ei = l.unstable_ImmediatePriority,
        eu = l.unstable_UserBlockingPriority,
        es = l.unstable_NormalPriority,
        ec = l.unstable_LowPriority,
        ed = l.unstable_IdlePriority,
        ef = (l.log, l.unstable_setDisableYieldValue, null),
        ep = null,
        eh = Math.clz32 ? Math.clz32 : function(e) {
            return 0 == (e >>>= 0) ? 32 : 31 - (em(e) / eg | 0) | 0
        },
        em = Math.log,
        eg = Math.LN2,
        ev = 256,
        ey = 262144,
        eb = 4194304;

    function e_(e) {
        var t = 42 & e;
        if (0 !== t) return t;
        switch (e & -e) {
            case 1:
                return 1;
            case 2:
                return 2;
            case 4:
                return 4;
            case 8:
                return 8;
            case 16:
                return 16;
            case 32:
                return 32;
            case 64:
                return 64;
            case 128:
                return 128;
            case 256:
            case 512:
            case 1024:
            case 2048:
            case 4096:
            case 8192:
            case 16384:
            case 32768:
            case 65536:
            case 131072:
                return 261888 & e;
            case 262144:
            case 524288:
            case 1048576:
            case 2097152:
                return 3932160 & e;
            case 4194304:
            case 8388608:
            case 0x1000000:
            case 0x2000000:
                return 0x3c00000 & e;
            case 0x4000000:
                return 0x4000000;
            case 0x8000000:
                return 0x8000000;
            case 0x10000000:
                return 0x10000000;
            case 0x20000000:
                return 0x20000000;
            case 0x40000000:
                return 0;
            default:
                return e
        }
    }

    function eS(e, t, n) {
        var r = e.pendingLanes;
        if (0 === r) return 0;
        var a = 0,
            l = e.suspendedLanes,
            o = e.pingedLanes;
        e = e.warmLanes;
        var i = 0x7ffffff & r;
        return 0 !== i ? 0 != (r = i & ~l) ? a = e_(r) : 0 != (o &= i) ? a = e_(o) : n || 0 != (n = i & ~e) && (a = e_(n)) : 0 != (i = r & ~l) ? a = e_(i) : 0 !== o ? a = e_(o) : n || 0 != (n = r & ~e) && (a = e_(n)), 0 === a ? 0 : 0 !== t && t !== a && 0 == (t & l) && ((l = a & -a) >= (n = t & -t) || 32 === l && 0 != (4194048 & n)) ? t : a
    }

    function ew(e, t) {
        return 0 == (e.pendingLanes & ~(e.suspendedLanes & ~e.pingedLanes) & t)
    }

    function eE() {
        var e = eb;
        return 0 == (0x3c00000 & (eb <<= 1)) && (eb = 4194304), e
    }

    function ek(e) {
        for (var t = [], n = 0; 31 > n; n++) t.push(e);
        return t
    }

    function ex(e, t) {
        e.pendingLanes |= t, 0x10000000 !== t && (e.suspendedLanes = 0, e.pingedLanes = 0, e.warmLanes = 0)
    }

    function eT(e, t, n) {
        e.pendingLanes |= t, e.suspendedLanes &= ~t;
        var r = 31 - eh(t);
        e.entangledLanes |= t, e.entanglements[r] = 0x40000000 | e.entanglements[r] | 261930 & n
    }

    function eP(e, t) {
        var n = e.entangledLanes |= t;
        for (e = e.entanglements; n;) {
            var r = 31 - eh(n),
                a = 1 << r;
            a & t | e[r] & t && (e[r] |= t), n &= ~a
        }
    }

    function eC(e, t) {
        var n = t & -t;
        return 0 != ((n = 0 != (42 & n) ? 1 : eN(n)) & (e.suspendedLanes | t)) ? 0 : n
    }

    function eN(e) {
        switch (e) {
            case 2:
                e = 1;
                break;
            case 8:
                e = 4;
                break;
            case 32:
                e = 16;
                break;
            case 256:
            case 512:
            case 1024:
            case 2048:
            case 4096:
            case 8192:
            case 16384:
            case 32768:
            case 65536:
            case 131072:
            case 262144:
            case 524288:
            case 1048576:
            case 2097152:
            case 4194304:
            case 8388608:
            case 0x1000000:
            case 0x2000000:
                e = 128;
                break;
            case 0x10000000:
                e = 0x8000000;
                break;
            default:
                e = 0
        }
        return e
    }

    function eR(e) {
        return 2 < (e &= -e) ? 8 < e ? 0 != (0x7ffffff & e) ? 32 : 0x10000000 : 8 : 2
    }

    function eA() {
        var e = D.p;
        return 0 !== e ? e : void 0 === (e = window.event) ? 32 : ch(e.type)
    }

    function eL(e, t) {
        var n = D.p;
        try {
            return D.p = e, t()
        } finally {
            D.p = n
        }
    }
    var eO = Math.random().toString(36).slice(2),
        eI = "__reactFiber$" + eO,
        eD = "__reactProps$" + eO,
        eM = "__reactContainer$" + eO,
        ez = "__reactEvents$" + eO,
        eF = "__reactListeners$" + eO,
        ej = "__reactHandles$" + eO,
        eU = "__reactResources$" + eO,
        eB = "__reactMarker$" + eO;

    function eH(e) {
        delete e[eI], delete e[eD], delete e[ez], delete e[eF], delete e[ej]
    }

    function eq(e) {
        var t = e[eI];
        if (t) return t;
        for (var n = e.parentNode; n;) {
            if (t = n[eM] || n[eI]) {
                if (n = t.alternate, null !== t.child || null !== n && null !== n.child)
                    for (e = sD(e); null !== e;) {
                        if (n = e[eI]) return n;
                        e = sD(e)
                    }
                return t
            }
            n = (e = n).parentNode
        }
        return null
    }

    function eW(e) {
        if (e = e[eI] || e[eM]) {
            var t = e.tag;
            if (5 === t || 6 === t || 13 === t || 31 === t || 26 === t || 27 === t || 3 === t) return e
        }
        return null
    }

    function e$(e) {
        var t = e.tag;
        if (5 === t || 26 === t || 27 === t || 6 === t) return e.stateNode;
        throw Error(u(33))
    }

    function eV(e) {
        var t = e[eU];
        return t || (t = e[eU] = {
            hoistableStyles: new Map,
            hoistableScripts: new Map
        }), t
    }

    function eQ(e) {
        e[eB] = !0
    }
    var eG = new Set,
        eY = {};

    function eX(e, t) {
        eK(e, t), eK(e + "Capture", t)
    }

    function eK(e, t) {
        for (eY[e] = t, e = 0; e < t.length; e++) eG.add(t[e])
    }
    var eJ = RegExp("^[:A-Z_a-z\\u00C0-\\u00D6\\u00D8-\\u00F6\\u00F8-\\u02FF\\u0370-\\u037D\\u037F-\\u1FFF\\u200C-\\u200D\\u2070-\\u218F\\u2C00-\\u2FEF\\u3001-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFFD][:A-Z_a-z\\u00C0-\\u00D6\\u00D8-\\u00F6\\u00F8-\\u02FF\\u0370-\\u037D\\u037F-\\u1FFF\\u200C-\\u200D\\u2070-\\u218F\\u2C00-\\u2FEF\\u3001-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFFD\\-.0-9\\u00B7\\u0300-\\u036F\\u203F-\\u2040]*$"),
        eZ = {},
        e0 = {};

    function e1(e, t, n) {
        if (ee.call(e0, t) || !ee.call(eZ, t) && (eJ.test(t) ? e0[t] = !0 : (eZ[t] = !0, !1)))
            if (null === n) e.removeAttribute(t);
            else {
                switch (typeof n) {
                    case "undefined":
                    case "function":
                    case "symbol":
                        e.removeAttribute(t);
                        return;
                    case "boolean":
                        var r = t.toLowerCase().slice(0, 5);
                        if ("data-" !== r && "aria-" !== r) return void e.removeAttribute(t)
                }
                e.setAttribute(t, "" + n)
            }
    }

    function e2(e, t, n) {
        if (null === n) e.removeAttribute(t);
        else {
            switch (typeof n) {
                case "undefined":
                case "function":
                case "symbol":
                case "boolean":
                    e.removeAttribute(t);
                    return
            }
            e.setAttribute(t, "" + n)
        }
    }

    function e3(e, t, n, r) {
        if (null === r) e.removeAttribute(n);
        else {
            switch (typeof r) {
                case "undefined":
                case "function":
                case "symbol":
                case "boolean":
                    e.removeAttribute(n);
                    return
            }
            e.setAttributeNS(t, n, "" + r)
        }
    }

    function e4(e) {
        switch (typeof e) {
            case "bigint":
            case "boolean":
            case "number":
            case "string":
            case "undefined":
            case "object":
                return e;
            default:
                return ""
        }
    }

    function e6(e) {
        var t = e.type;
        return (e = e.nodeName) && "input" === e.toLowerCase() && ("checkbox" === t || "radio" === t)
    }

    function e8(e) {
        if (!e._valueTracker) {
            var t = e6(e) ? "checked" : "value";
            e._valueTracker = function(e, t, n) {
                var r = Object.getOwnPropertyDescriptor(e.constructor.prototype, t);
                if (!e.hasOwnProperty(t) && void 0 !== r && "function" == typeof r.get && "function" == typeof r.set) {
                    var a = r.get,
                        l = r.set;
                    return Object.defineProperty(e, t, {
                        configurable: !0,
                        get: function() {
                            return a.call(this)
                        },
                        set: function(e) {
                            n = "" + e, l.call(this, e)
                        }
                    }), Object.defineProperty(e, t, {
                        enumerable: r.enumerable
                    }), {
                        getValue: function() {
                            return n
                        },
                        setValue: function(e) {
                            n = "" + e
                        },
                        stopTracking: function() {
                            e._valueTracker = null, delete e[t]
                        }
                    }
                }
            }(e, t, "" + e[t])
        }
    }

    function e5(e) {
        if (!e) return !1;
        var t = e._valueTracker;
        if (!t) return !0;
        var n = t.getValue(),
            r = "";
        return e && (r = e6(e) ? e.checked ? "true" : "false" : e.value), (e = r) !== n && (t.setValue(e), !0)
    }

    function e9(e) {
        if (void 0 === (e = e || ("u" > typeof document ? document : void 0))) return null;
        try {
            return e.activeElement || e.body
        } catch (t) {
            return e.body
        }
    }
    var e7 = /[\n"\\]/g;

    function te(e) {
        return e.replace(e7, function(e) {
            return "\\" + e.charCodeAt(0).toString(16) + " "
        })
    }

    function tt(e, t, n, r, a, l, o, i) {
        e.name = "", null != o && "function" != typeof o && "symbol" != typeof o && "boolean" != typeof o ? e.type = o : e.removeAttribute("type"), null != t ? "number" === o ? (0 === t && "" === e.value || e.value != t) && (e.value = "" + e4(t)) : e.value !== "" + e4(t) && (e.value = "" + e4(t)) : "submit" !== o && "reset" !== o || e.removeAttribute("value"), null != t ? tr(e, o, e4(t)) : null != n ? tr(e, o, e4(n)) : null != r && e.removeAttribute("value"), null == a && null != l && (e.defaultChecked = !!l), null != a && (e.checked = a && "function" != typeof a && "symbol" != typeof a), null != i && "function" != typeof i && "symbol" != typeof i && "boolean" != typeof i ? e.name = "" + e4(i) : e.removeAttribute("name")
    }

    function tn(e, t, n, r, a, l, o, i) {
        if (null != l && "function" != typeof l && "symbol" != typeof l && "boolean" != typeof l && (e.type = l), null != t || null != n) {
            if (("submit" === l || "reset" === l) && null == t) return void e8(e);
            n = null != n ? "" + e4(n) : "", t = null != t ? "" + e4(t) : n, i || t === e.value || (e.value = t), e.defaultValue = t
        }
        r = "function" != typeof(r = null != r ? r : a) && "symbol" != typeof r && !!r, e.checked = i ? e.checked : !!r, e.defaultChecked = !!r, null != o && "function" != typeof o && "symbol" != typeof o && "boolean" != typeof o && (e.name = o), e8(e)
    }

    function tr(e, t, n) {
        "number" === t && e9(e.ownerDocument) === e || e.defaultValue === "" + n || (e.defaultValue = "" + n)
    }

    function ta(e, t, n, r) {
        if (e = e.options, t) {
            t = {};
            for (var a = 0; a < n.length; a++) t["$" + n[a]] = !0;
            for (n = 0; n < e.length; n++) a = t.hasOwnProperty("$" + e[n].value), e[n].selected !== a && (e[n].selected = a), a && r && (e[n].defaultSelected = !0)
        } else {
            for (n = "" + e4(n), t = null, a = 0; a < e.length; a++) {
                if (e[a].value === n) {
                    e[a].selected = !0, r && (e[a].defaultSelected = !0);
                    return
                }
                null !== t || e[a].disabled || (t = e[a])
            }
            null !== t && (t.selected = !0)
        }
    }

    function tl(e, t, n) {
        if (null != t && ((t = "" + e4(t)) !== e.value && (e.value = t), null == n)) {
            e.defaultValue !== t && (e.defaultValue = t);
            return
        }
        e.defaultValue = null != n ? "" + e4(n) : ""
    }

    function to(e, t, n, r) {
        if (null == t) {
            if (null != r) {
                if (null != n) throw Error(u(92));
                if (O(r)) {
                    if (1 < r.length) throw Error(u(93));
                    r = r[0]
                }
                n = r
            }
            null == n && (n = ""), t = n
        }
        e.defaultValue = n = e4(t), (r = e.textContent) === n && "" !== r && null !== r && (e.value = r), e8(e)
    }

    function ti(e, t) {
        if (t) {
            var n = e.firstChild;
            if (n && n === e.lastChild && 3 === n.nodeType) {
                n.nodeValue = t;
                return
            }
        }
        e.textContent = t
    }
    var tu = new Set("animationIterationCount aspectRatio borderImageOutset borderImageSlice borderImageWidth boxFlex boxFlexGroup boxOrdinalGroup columnCount columns flex flexGrow flexPositive flexShrink flexNegative flexOrder gridArea gridRow gridRowEnd gridRowSpan gridRowStart gridColumn gridColumnEnd gridColumnSpan gridColumnStart fontWeight lineClamp lineHeight opacity order orphans scale tabSize widows zIndex zoom fillOpacity floodOpacity stopOpacity strokeDasharray strokeDashoffset strokeMiterlimit strokeOpacity strokeWidth MozAnimationIterationCount MozBoxFlex MozBoxFlexGroup MozLineClamp msAnimationIterationCount msFlex msZoom msFlexGrow msFlexNegative msFlexOrder msFlexPositive msFlexShrink msGridColumn msGridColumnSpan msGridRow msGridRowSpan WebkitAnimationIterationCount WebkitBoxFlex WebKitBoxFlexGroup WebkitBoxOrdinalGroup WebkitColumnCount WebkitColumns WebkitFlex WebkitFlexGrow WebkitFlexPositive WebkitFlexShrink WebkitLineClamp".split(" "));

    function ts(e, t, n) {
        var r = 0 === t.indexOf("--");
        null == n || "boolean" == typeof n || "" === n ? r ? e.setProperty(t, "") : "float" === t ? e.cssFloat = "" : e[t] = "" : r ? e.setProperty(t, n) : "number" != typeof n || 0 === n || tu.has(t) ? "float" === t ? e.cssFloat = n : e[t] = ("" + n).trim() : e[t] = n + "px"
    }

    function tc(e, t, n) {
        if (null != t && "object" != typeof t) throw Error(u(62));
        if (e = e.style, null != n) {
            for (var r in n) !n.hasOwnProperty(r) || null != t && t.hasOwnProperty(r) || (0 === r.indexOf("--") ? e.setProperty(r, "") : "float" === r ? e.cssFloat = "" : e[r] = "");
            for (var a in t) r = t[a], t.hasOwnProperty(a) && n[a] !== r && ts(e, a, r)
        } else
            for (var l in t) t.hasOwnProperty(l) && ts(e, l, t[l])
    }

    function td(e) {
        if (-1 === e.indexOf("-")) return !1;
        switch (e) {
            case "annotation-xml":
            case "color-profile":
            case "font-face":
            case "font-face-src":
            case "font-face-uri":
            case "font-face-format":
            case "font-face-name":
            case "missing-glyph":
                return !1;
            default:
                return !0
        }
    }
    var tf = new Map([
            ["acceptCharset", "accept-charset"],
            ["htmlFor", "for"],
            ["httpEquiv", "http-equiv"],
            ["crossOrigin", "crossorigin"],
            ["accentHeight", "accent-height"],
            ["alignmentBaseline", "alignment-baseline"],
            ["arabicForm", "arabic-form"],
            ["baselineShift", "baseline-shift"],
            ["capHeight", "cap-height"],
            ["clipPath", "clip-path"],
            ["clipRule", "clip-rule"],
            ["colorInterpolation", "color-interpolation"],
            ["colorInterpolationFilters", "color-interpolation-filters"],
            ["colorProfile", "color-profile"],
            ["colorRendering", "color-rendering"],
            ["dominantBaseline", "dominant-baseline"],
            ["enableBackground", "enable-background"],
            ["fillOpacity", "fill-opacity"],
            ["fillRule", "fill-rule"],
            ["floodColor", "flood-color"],
            ["floodOpacity", "flood-opacity"],
            ["fontFamily", "font-family"],
            ["fontSize", "font-size"],
            ["fontSizeAdjust", "font-size-adjust"],
            ["fontStretch", "font-stretch"],
            ["fontStyle", "font-style"],
            ["fontVariant", "font-variant"],
            ["fontWeight", "font-weight"],
            ["glyphName", "glyph-name"],
            ["glyphOrientationHorizontal", "glyph-orientation-horizontal"],
            ["glyphOrientationVertical", "glyph-orientation-vertical"],
            ["horizAdvX", "horiz-adv-x"],
            ["horizOriginX", "horiz-origin-x"],
            ["imageRendering", "image-rendering"],
            ["letterSpacing", "letter-spacing"],
            ["lightingColor", "lighting-color"],
            ["markerEnd", "marker-end"],
            ["markerMid", "marker-mid"],
            ["markerStart", "marker-start"],
            ["overlinePosition", "overline-position"],
            ["overlineThickness", "overline-thickness"],
            ["paintOrder", "paint-order"],
            ["panose-1", "panose-1"],
            ["pointerEvents", "pointer-events"],
            ["renderingIntent", "rendering-intent"],
            ["shapeRendering", "shape-rendering"],
            ["stopColor", "stop-color"],
            ["stopOpacity", "stop-opacity"],
            ["strikethroughPosition", "strikethrough-position"],
            ["strikethroughThickness", "strikethrough-thickness"],
            ["strokeDasharray", "stroke-dasharray"],
            ["strokeDashoffset", "stroke-dashoffset"],
            ["strokeLinecap", "stroke-linecap"],
            ["strokeLinejoin", "stroke-linejoin"],
            ["strokeMiterlimit", "stroke-miterlimit"],
            ["strokeOpacity", "stroke-opacity"],
            ["strokeWidth", "stroke-width"],
            ["textAnchor", "text-anchor"],
            ["textDecoration", "text-decoration"],
            ["textRendering", "text-rendering"],
            ["transformOrigin", "transform-origin"],
            ["underlinePosition", "underline-position"],
            ["underlineThickness", "underline-thickness"],
            ["unicodeBidi", "unicode-bidi"],
            ["unicodeRange", "unicode-range"],
            ["unitsPerEm", "units-per-em"],
            ["vAlphabetic", "v-alphabetic"],
            ["vHanging", "v-hanging"],
            ["vIdeographic", "v-ideographic"],
            ["vMathematical", "v-mathematical"],
            ["vectorEffect", "vector-effect"],
            ["vertAdvY", "vert-adv-y"],
            ["vertOriginX", "vert-origin-x"],
            ["vertOriginY", "vert-origin-y"],
            ["wordSpacing", "word-spacing"],
            ["writingMode", "writing-mode"],
            ["xmlnsXlink", "xmlns:xlink"],
            ["xHeight", "x-height"]
        ]),
        tp = /^[\u0000-\u001F ]*j[\r\n\t]*a[\r\n\t]*v[\r\n\t]*a[\r\n\t]*s[\r\n\t]*c[\r\n\t]*r[\r\n\t]*i[\r\n\t]*p[\r\n\t]*t[\r\n\t]*:/i;

    function th(e) {
        return tp.test("" + e) ? "javascript:throw new Error('React has blocked a javascript: URL as a security precaution.')" : e
    }

    function tm() {}
    var tg = null;

    function tv(e) {
        return (e = e.target || e.srcElement || window).correspondingUseElement && (e = e.correspondingUseElement), 3 === e.nodeType ? e.parentNode : e
    }
    var ty = null,
        tb = null;

    function t_(e) {
        var t = eW(e);
        if (t && (e = t.stateNode)) {
            var n = e[eD] || null;
            switch (e = t.stateNode, t.type) {
                case "input":
                    if (tt(e, n.value, n.defaultValue, n.defaultValue, n.checked, n.defaultChecked, n.type, n.name), t = n.name, "radio" === n.type && null != t) {
                        for (n = e; n.parentNode;) n = n.parentNode;
                        for (n = n.querySelectorAll('input[name="' + te("" + t) + '"][type="radio"]'), t = 0; t < n.length; t++) {
                            var r = n[t];
                            if (r !== e && r.form === e.form) {
                                var a = r[eD] || null;
                                if (!a) throw Error(u(90));
                                tt(r, a.value, a.defaultValue, a.defaultValue, a.checked, a.defaultChecked, a.type, a.name)
                            }
                        }
                        for (t = 0; t < n.length; t++)(r = n[t]).form === e.form && e5(r)
                    }
                    break;
                case "textarea":
                    tl(e, n.value, n.defaultValue);
                    break;
                case "select":
                    null != (t = n.value) && ta(e, !!n.multiple, t, !1)
            }
        }
    }
    var tS = !1;

    function tw(e, t, n) {
        if (tS) return e(t, n);
        tS = !0;
        try {
            return e(t)
        } finally {
            if (tS = !1, (null !== ty || null !== tb) && (uc(), ty && (t = ty, e = tb, tb = ty = null, t_(t), e)))
                for (t = 0; t < e.length; t++) t_(e[t])
        }
    }

    function tE(e, t) {
        var n = e.stateNode;
        if (null === n) return null;
        var r = n[eD] || null;
        if (null === r) return null;
        switch (n = r[t], t) {
            case "onClick":
            case "onClickCapture":
            case "onDoubleClick":
            case "onDoubleClickCapture":
            case "onMouseDown":
            case "onMouseDownCapture":
            case "onMouseMove":
            case "onMouseMoveCapture":
            case "onMouseUp":
            case "onMouseUpCapture":
            case "onMouseEnter":
                (r = !r.disabled) || (r = "button" !== (e = e.type) && "input" !== e && "select" !== e && "textarea" !== e), e = !r;
                break;
            default:
                e = !1
        }
        if (e) return null;
        if (n && "function" != typeof n) throw Error(u(231, t, typeof n));
        return n
    }
    var tk = "u" > typeof window && void 0 !== window.document && void 0 !== window.document.createElement,
        tx = !1;
    if (tk) try {
        var tT = {};
        Object.defineProperty(tT, "passive", {
            get: function() {
                tx = !0
            }
        }), window.addEventListener("test", tT, tT), window.removeEventListener("test", tT, tT)
    } catch (e) {
        tx = !1
    }
    var tP = null,
        tC = null,
        tN = null;

    function tR() {
        if (tN) return tN;
        var e, t, n = tC,
            r = n.length,
            a = "value" in tP ? tP.value : tP.textContent,
            l = a.length;
        for (e = 0; e < r && n[e] === a[e]; e++);
        var o = r - e;
        for (t = 1; t <= o && n[r - t] === a[l - t]; t++);
        return tN = a.slice(e, 1 < t ? 1 - t : void 0)
    }

    function tA(e) {
        var t = e.keyCode;
        return "charCode" in e ? 0 === (e = e.charCode) && 13 === t && (e = 13) : e = t, 10 === e && (e = 13), 32 <= e || 13 === e ? e : 0
    }

    function tL() {
        return !0
    }

    function tO() {
        return !1
    }

    function tI(e) {
        function t(t, n, r, a, l) {
            for (var o in this._reactName = t, this._targetInst = r, this.type = n, this.nativeEvent = a, this.target = l, this.currentTarget = null, e) e.hasOwnProperty(o) && (t = e[o], this[o] = t ? t(a) : a[o]);
            return this.isDefaultPrevented = (null != a.defaultPrevented ? a.defaultPrevented : !1 === a.returnValue) ? tL : tO, this.isPropagationStopped = tO, this
        }
        return h(t.prototype, {
            preventDefault: function() {
                this.defaultPrevented = !0;
                var e = this.nativeEvent;
                e && (e.preventDefault ? e.preventDefault() : "unknown" != typeof e.returnValue && (e.returnValue = !1), this.isDefaultPrevented = tL)
            },
            stopPropagation: function() {
                var e = this.nativeEvent;
                e && (e.stopPropagation ? e.stopPropagation() : "unknown" != typeof e.cancelBubble && (e.cancelBubble = !0), this.isPropagationStopped = tL)
            },
            persist: function() {},
            isPersistent: tL
        }), t
    }
    var tD, tM, tz, tF, tj, tU = {
            eventPhase: 0,
            bubbles: 0,
            cancelable: 0,
            timeStamp: function(e) {
                return e.timeStamp || Date.now()
            },
            defaultPrevented: 0,
            isTrusted: 0
        },
        tB = tI(tU),
        tH = h({}, tU, {
            view: 0,
            detail: 0
        }),
        tq = tI(tH),
        tW = h({}, tH, {
            screenX: 0,
            screenY: 0,
            clientX: 0,
            clientY: 0,
            pageX: 0,
            pageY: 0,
            ctrlKey: 0,
            shiftKey: 0,
            altKey: 0,
            metaKey: 0,
            getModifierState: t1,
            button: 0,
            buttons: 0,
            relatedTarget: function(e) {
                return void 0 === e.relatedTarget ? e.fromElement === e.srcElement ? e.toElement : e.fromElement : e.relatedTarget
            },
            movementX: function(e) {
                return "movementX" in e ? e.movementX : (e !== tj && (tj && "mousemove" === e.type ? (tz = e.screenX - tj.screenX, tF = e.screenY - tj.screenY) : tF = tz = 0, tj = e), tz)
            },
            movementY: function(e) {
                return "movementY" in e ? e.movementY : tF
            }
        }),
        t$ = tI(tW),
        tV = tI(h({}, tW, {
            dataTransfer: 0
        })),
        tQ = tI(h({}, tH, {
            relatedTarget: 0
        })),
        tG = tI(h({}, tU, {
            animationName: 0,
            elapsedTime: 0,
            pseudoElement: 0
        })),
        tY = tI(h({}, tU, {
            clipboardData: function(e) {
                return "clipboardData" in e ? e.clipboardData : window.clipboardData
            }
        })),
        tX = tI(h({}, tU, {
            data: 0
        })),
        tK = {
            Esc: "Escape",
            Spacebar: " ",
            Left: "ArrowLeft",
            Up: "ArrowUp",
            Right: "ArrowRight",
            Down: "ArrowDown",
            Del: "Delete",
            Win: "OS",
            Menu: "ContextMenu",
            Apps: "ContextMenu",
            Scroll: "ScrollLock",
            MozPrintableKey: "Unidentified"
        },
        tJ = {
            8: "Backspace",
            9: "Tab",
            12: "Clear",
            13: "Enter",
            16: "Shift",
            17: "Control",
            18: "Alt",
            19: "Pause",
            20: "CapsLock",
            27: "Escape",
            32: " ",
            33: "PageUp",
            34: "PageDown",
            35: "End",
            36: "Home",
            37: "ArrowLeft",
            38: "ArrowUp",
            39: "ArrowRight",
            40: "ArrowDown",
            45: "Insert",
            46: "Delete",
            112: "F1",
            113: "F2",
            114: "F3",
            115: "F4",
            116: "F5",
            117: "F6",
            118: "F7",
            119: "F8",
            120: "F9",
            121: "F10",
            122: "F11",
            123: "F12",
            144: "NumLock",
            145: "ScrollLock",
            224: "Meta"
        },
        tZ = {
            Alt: "altKey",
            Control: "ctrlKey",
            Meta: "metaKey",
            Shift: "shiftKey"
        };

    function t0(e) {
        var t = this.nativeEvent;
        return t.getModifierState ? t.getModifierState(e) : !!(e = tZ[e]) && !!t[e]
    }

    function t1() {
        return t0
    }
    var t2 = tI(h({}, tH, {
            key: function(e) {
                if (e.key) {
                    var t = tK[e.key] || e.key;
                    if ("Unidentified" !== t) return t
                }
                return "keypress" === e.type ? 13 === (e = tA(e)) ? "Enter" : String.fromCharCode(e) : "keydown" === e.type || "keyup" === e.type ? tJ[e.keyCode] || "Unidentified" : ""
            },
            code: 0,
            location: 0,
            ctrlKey: 0,
            shiftKey: 0,
            altKey: 0,
            metaKey: 0,
            repeat: 0,
            locale: 0,
            getModifierState: t1,
            charCode: function(e) {
                return "keypress" === e.type ? tA(e) : 0
            },
            keyCode: function(e) {
                return "keydown" === e.type || "keyup" === e.type ? e.keyCode : 0
            },
            which: function(e) {
                return "keypress" === e.type ? tA(e) : "keydown" === e.type || "keyup" === e.type ? e.keyCode : 0
            }
        })),
        t3 = tI(h({}, tW, {
            pointerId: 0,
            width: 0,
            height: 0,
            pressure: 0,
            tangentialPressure: 0,
            tiltX: 0,
            tiltY: 0,
            twist: 0,
            pointerType: 0,
            isPrimary: 0
        })),
        t4 = tI(h({}, tH, {
            touches: 0,
            targetTouches: 0,
            changedTouches: 0,
            altKey: 0,
            metaKey: 0,
            ctrlKey: 0,
            shiftKey: 0,
            getModifierState: t1
        })),
        t6 = tI(h({}, tU, {
            propertyName: 0,
            elapsedTime: 0,
            pseudoElement: 0
        })),
        t8 = tI(h({}, tW, {
            deltaX: function(e) {
                return "deltaX" in e ? e.deltaX : "wheelDeltaX" in e ? -e.wheelDeltaX : 0
            },
            deltaY: function(e) {
                return "deltaY" in e ? e.deltaY : "wheelDeltaY" in e ? -e.wheelDeltaY : "wheelDelta" in e ? -e.wheelDelta : 0
            },
            deltaZ: 0,
            deltaMode: 0
        })),
        t5 = tI(h({}, tU, {
            newState: 0,
            oldState: 0
        })),
        t9 = [9, 13, 27, 32],
        t7 = tk && "CompositionEvent" in window,
        ne = null;
    tk && "documentMode" in document && (ne = document.documentMode);
    var nt = tk && "TextEvent" in window && !ne,
        nn = tk && (!t7 || ne && 8 < ne && 11 >= ne),
        nr = !1;

    function na(e, t) {
        switch (e) {
            case "keyup":
                return -1 !== t9.indexOf(t.keyCode);
            case "keydown":
                return 229 !== t.keyCode;
            case "keypress":
            case "mousedown":
            case "focusout":
                return !0;
            default:
                return !1
        }
    }

    function nl(e) {
        return "object" == typeof(e = e.detail) && "data" in e ? e.data : null
    }
    var no = !1,
        ni = {
            color: !0,
            date: !0,
            datetime: !0,
            "datetime-local": !0,
            email: !0,
            month: !0,
            number: !0,
            password: !0,
            range: !0,
            search: !0,
            tel: !0,
            text: !0,
            time: !0,
            url: !0,
            week: !0
        };

    function nu(e) {
        var t = e && e.nodeName && e.nodeName.toLowerCase();
        return "input" === t ? !!ni[e.type] : "textarea" === t
    }

    function ns(e, t, n, r) {
        ty ? tb ? tb.push(r) : tb = [r] : ty = r, 0 < (t = sn(t, "onChange")).length && (n = new tB("onChange", "change", null, n, r), e.push({
            event: n,
            listeners: t
        }))
    }
    var nc = null,
        nd = null;

    function nf(e) {
        u4(e, 0)
    }

    function np(e) {
        if (e5(e$(e))) return e
    }

    function nh(e, t) {
        if ("change" === e) return t
    }
    var nm = !1;
    if (tk) {
        if (tk) {
            var ng = "oninput" in document;
            if (!ng) {
                var nv = document.createElement("div");
                nv.setAttribute("oninput", "return;"), ng = "function" == typeof nv.oninput
            }
            r = ng
        } else r = !1;
        nm = r && (!document.documentMode || 9 < document.documentMode)
    }

    function ny() {
        nc && (nc.detachEvent("onpropertychange", nb), nd = nc = null)
    }

    function nb(e) {
        if ("value" === e.propertyName && np(nd)) {
            var t = [];
            ns(t, nd, e, tv(e)), tw(nf, t)
        }
    }

    function n_(e, t, n) {
        "focusin" === e ? (ny(), nc = t, nd = n, nc.attachEvent("onpropertychange", nb)) : "focusout" === e && ny()
    }

    function nS(e) {
        if ("selectionchange" === e || "keyup" === e || "keydown" === e) return np(nd)
    }

    function nw(e, t) {
        if ("click" === e) return np(t)
    }

    function nE(e, t) {
        if ("input" === e || "change" === e) return np(t)
    }
    var nk = "function" == typeof Object.is ? Object.is : function(e, t) {
        return e === t && (0 !== e || 1 / e == 1 / t) || e != e && t != t
    };

    function nx(e, t) {
        if (nk(e, t)) return !0;
        if ("object" != typeof e || null === e || "object" != typeof t || null === t) return !1;
        var n = Object.keys(e),
            r = Object.keys(t);
        if (n.length !== r.length) return !1;
        for (r = 0; r < n.length; r++) {
            var a = n[r];
            if (!ee.call(t, a) || !nk(e[a], t[a])) return !1
        }
        return !0
    }

    function nT(e) {
        for (; e && e.firstChild;) e = e.firstChild;
        return e
    }

    function nP(e, t) {
        var n, r = nT(e);
        for (e = 0; r;) {
            if (3 === r.nodeType) {
                if (n = e + r.textContent.length, e <= t && n >= t) return {
                    node: r,
                    offset: t - e
                };
                e = n
            }
            e: {
                for (; r;) {
                    if (r.nextSibling) {
                        r = r.nextSibling;
                        break e
                    }
                    r = r.parentNode
                }
                r = void 0
            }
            r = nT(r)
        }
    }

    function nC(e) {
        e = null != e && null != e.ownerDocument && null != e.ownerDocument.defaultView ? e.ownerDocument.defaultView : window;
        for (var t = e9(e.document); t instanceof e.HTMLIFrameElement;) {
            try {
                var n = "string" == typeof t.contentWindow.location.href
            } catch (e) {
                n = !1
            }
            if (n) e = t.contentWindow;
            else break;
            t = e9(e.document)
        }
        return t
    }

    function nN(e) {
        var t = e && e.nodeName && e.nodeName.toLowerCase();
        return t && ("input" === t && ("text" === e.type || "search" === e.type || "tel" === e.type || "url" === e.type || "password" === e.type) || "textarea" === t || "true" === e.contentEditable)
    }
    var nR = tk && "documentMode" in document && 11 >= document.documentMode,
        nA = null,
        nL = null,
        nO = null,
        nI = !1;

    function nD(e, t, n) {
        var r = n.window === n ? n.document : 9 === n.nodeType ? n : n.ownerDocument;
        nI || null == nA || nA !== e9(r) || (r = "selectionStart" in (r = nA) && nN(r) ? {
            start: r.selectionStart,
            end: r.selectionEnd
        } : {
            anchorNode: (r = (r.ownerDocument && r.ownerDocument.defaultView || window).getSelection()).anchorNode,
            anchorOffset: r.anchorOffset,
            focusNode: r.focusNode,
            focusOffset: r.focusOffset
        }, nO && nx(nO, r) || (nO = r, 0 < (r = sn(nL, "onSelect")).length && (t = new tB("onSelect", "select", null, t, n), e.push({
            event: t,
            listeners: r
        }), t.target = nA)))
    }

    function nM(e, t) {
        var n = {};
        return n[e.toLowerCase()] = t.toLowerCase(), n["Webkit" + e] = "webkit" + t, n["Moz" + e] = "moz" + t, n
    }
    var nz = {
            animationend: nM("Animation", "AnimationEnd"),
            animationiteration: nM("Animation", "AnimationIteration"),
            animationstart: nM("Animation", "AnimationStart"),
            transitionrun: nM("Transition", "TransitionRun"),
            transitionstart: nM("Transition", "TransitionStart"),
            transitioncancel: nM("Transition", "TransitionCancel"),
            transitionend: nM("Transition", "TransitionEnd")
        },
        nF = {},
        nj = {};

    function nU(e) {
        if (nF[e]) return nF[e];
        if (!nz[e]) return e;
        var t, n = nz[e];
        for (t in n)
            if (n.hasOwnProperty(t) && t in nj) return nF[e] = n[t];
        return e
    }
    tk && (nj = document.createElement("div").style, "AnimationEvent" in window || (delete nz.animationend.animation, delete nz.animationiteration.animation, delete nz.animationstart.animation), "TransitionEvent" in window || delete nz.transitionend.transition);
    var nB = nU("animationend"),
        nH = nU("animationiteration"),
        nq = nU("animationstart"),
        nW = nU("transitionrun"),
        n$ = nU("transitionstart"),
        nV = nU("transitioncancel"),
        nQ = nU("transitionend"),
        nG = new Map,
        nY = "abort auxClick beforeToggle cancel canPlay canPlayThrough click close contextMenu copy cut drag dragEnd dragEnter dragExit dragLeave dragOver dragStart drop durationChange emptied encrypted ended error gotPointerCapture input invalid keyDown keyPress keyUp load loadedData loadedMetadata loadStart lostPointerCapture mouseDown mouseMove mouseOut mouseOver mouseUp paste pause play playing pointerCancel pointerDown pointerMove pointerOut pointerOver pointerUp progress rateChange reset resize seeked seeking stalled submit suspend timeUpdate touchCancel touchEnd touchStart volumeChange scroll toggle touchMove waiting wheel".split(" ");

    function nX(e, t) {
        nG.set(e, t), eX(t, [e])
    }
    nY.push("scrollEnd");
    var nK = "function" == typeof reportError ? reportError : function(e) {
            if ("object" == typeof window && "function" == typeof window.ErrorEvent) {
                var t = new window.ErrorEvent("error", {
                    bubbles: !0,
                    cancelable: !0,
                    message: "object" == typeof e && null !== e && "string" == typeof e.message ? String(e.message) : String(e),
                    error: e
                });
                if (!window.dispatchEvent(t)) return
            } else if ("object" == typeof a.default && "function" == typeof a.default.emit) return void a.default.emit("uncaughtException", e);
            console.error(e)
        },
        nJ = [],
        nZ = 0,
        n0 = 0;

    function n1() {
        for (var e = nZ, t = n0 = nZ = 0; t < e;) {
            var n = nJ[t];
            nJ[t++] = null;
            var r = nJ[t];
            nJ[t++] = null;
            var a = nJ[t];
            nJ[t++] = null;
            var l = nJ[t];
            if (nJ[t++] = null, null !== r && null !== a) {
                var o = r.pending;
                null === o ? a.next = a : (a.next = o.next, o.next = a), r.pending = a
            }
            0 !== l && n6(n, a, l)
        }
    }

    function n2(e, t, n, r) {
        nJ[nZ++] = e, nJ[nZ++] = t, nJ[nZ++] = n, nJ[nZ++] = r, n0 |= r, e.lanes |= r, null !== (e = e.alternate) && (e.lanes |= r)
    }

    function n3(e, t, n, r) {
        return n2(e, t, n, r), n8(e)
    }

    function n4(e, t) {
        return n2(e, null, null, t), n8(e)
    }

    function n6(e, t, n) {
        e.lanes |= n;
        var r = e.alternate;
        null !== r && (r.lanes |= n);
        for (var a = !1, l = e.return; null !== l;) l.childLanes |= n, null !== (r = l.alternate) && (r.childLanes |= n), 22 === l.tag && (null === (e = l.stateNode) || 1 & e._visibility || (a = !0)), e = l, l = l.return;
        return 3 === e.tag ? (l = e.stateNode, a && null !== t && (a = 31 - eh(n), null === (r = (e = l.hiddenUpdates)[a]) ? e[a] = [t] : r.push(t), t.lane = 0x20000000 | n), l) : null
    }

    function n8(e) {
        if (50 < un) throw un = 0, ur = null, Error(u(185));
        for (var t = e.return; null !== t;) t = (e = t).return;
        return 3 === e.tag ? e.stateNode : null
    }
    var n5 = {};

    function n9(e, t, n, r) {
        this.tag = e, this.key = n, this.sibling = this.child = this.return = this.stateNode = this.type = this.elementType = null, this.index = 0, this.refCleanup = this.ref = null, this.pendingProps = t, this.dependencies = this.memoizedState = this.updateQueue = this.memoizedProps = null, this.mode = r, this.subtreeFlags = this.flags = 0, this.deletions = null, this.childLanes = this.lanes = 0, this.alternate = null
    }

    function n7(e, t, n, r) {
        return new n9(e, t, n, r)
    }

    function re(e) {
        return !(!(e = e.prototype) || !e.isReactComponent)
    }

    function rt(e, t) {
        var n = e.alternate;
        return null === n ? ((n = n7(e.tag, t, e.key, e.mode)).elementType = e.elementType, n.type = e.type, n.stateNode = e.stateNode, n.alternate = e, e.alternate = n) : (n.pendingProps = t, n.type = e.type, n.flags = 0, n.subtreeFlags = 0, n.deletions = null), n.flags = 0x3e00000 & e.flags, n.childLanes = e.childLanes, n.lanes = e.lanes, n.child = e.child, n.memoizedProps = e.memoizedProps, n.memoizedState = e.memoizedState, n.updateQueue = e.updateQueue, t = e.dependencies, n.dependencies = null === t ? null : {
            lanes: t.lanes,
            firstContext: t.firstContext
        }, n.sibling = e.sibling, n.index = e.index, n.ref = e.ref, n.refCleanup = e.refCleanup, n
    }

    function rn(e, t) {
        e.flags &= 0x3e00002;
        var n = e.alternate;
        return null === n ? (e.childLanes = 0, e.lanes = t, e.child = null, e.subtreeFlags = 0, e.memoizedProps = null, e.memoizedState = null, e.updateQueue = null, e.dependencies = null, e.stateNode = null) : (e.childLanes = n.childLanes, e.lanes = n.lanes, e.child = n.child, e.subtreeFlags = 0, e.deletions = null, e.memoizedProps = n.memoizedProps, e.memoizedState = n.memoizedState, e.updateQueue = n.updateQueue, e.type = n.type, e.dependencies = null === (t = n.dependencies) ? null : {
            lanes: t.lanes,
            firstContext: t.firstContext
        }), e
    }

    function rr(e, t, n, r, a, l) {
        var o = 0;
        if (r = e, "function" == typeof e) re(e) && (o = 1);
        else if ("string" == typeof e) o = ! function(e, t, n) {
            if (1 === n || null != t.itemProp) return !1;
            switch (e) {
                case "meta":
                case "title":
                    return !0;
                case "style":
                    if ("string" != typeof t.precedence || "string" != typeof t.href || "" === t.href) break;
                    return !0;
                case "link":
                    if ("string" != typeof t.rel || "string" != typeof t.href || "" === t.href || t.onLoad || t.onError) break;
                    if ("stylesheet" === t.rel) return e = t.disabled, "string" == typeof t.precedence && null == e;
                    return !0;
                case "script":
                    if (t.async && "function" != typeof t.async && "symbol" != typeof t.async && !t.onLoad && !t.onError && t.src && "string" == typeof t.src) return !0
            }
            return !1
        }(e, n, H.current) ? "html" === e || "head" === e || "body" === e ? 27 : 5 : 26;
        else e: switch (e) {
            case C:
                return (e = n7(31, n, t, a)).elementType = C, e.lanes = l, e;
            case y:
                return ra(n.children, a, l, t);
            case b:
                o = 8, a |= 24;
                break;
            case _:
                return (e = n7(12, n, t, 2 | a)).elementType = _, e.lanes = l, e;
            case k:
                return (e = n7(13, n, t, a)).elementType = k, e.lanes = l, e;
            case x:
                return (e = n7(19, n, t, a)).elementType = x, e.lanes = l, e;
            default:
                if ("object" == typeof e && null !== e) switch (e.$$typeof) {
                    case w:
                        o = 10;
                        break e;
                    case S:
                        o = 9;
                        break e;
                    case E:
                        o = 11;
                        break e;
                    case T:
                        o = 14;
                        break e;
                    case P:
                        o = 16, r = null;
                        break e
                }
                o = 29, n = Error(u(130, null === e ? "null" : typeof e, "")), r = null
        }
        return (t = n7(o, n, t, a)).elementType = e, t.type = r, t.lanes = l, t
    }

    function ra(e, t, n, r) {
        return (e = n7(7, e, r, t)).lanes = n, e
    }

    function rl(e, t, n) {
        return (e = n7(6, e, null, t)).lanes = n, e
    }

    function ro(e) {
        var t = n7(18, null, null, 0);
        return t.stateNode = e, t
    }

    function ri(e, t, n) {
        return (t = n7(4, null !== e.children ? e.children : [], e.key, t)).lanes = n, t.stateNode = {
            containerInfo: e.containerInfo,
            pendingChildren: null,
            implementation: e.implementation
        }, t
    }
    var ru = new WeakMap;

    function rs(e, t) {
        if ("object" == typeof e && null !== e) {
            var n = ru.get(e);
            return void 0 !== n ? n : (t = {
                value: e,
                source: t,
                stack: Z(t)
            }, ru.set(e, t), t)
        }
        return {
            value: e,
            source: t,
            stack: Z(t)
        }
    }
    var rc = [],
        rd = 0,
        rf = null,
        rp = 0,
        rh = [],
        rm = 0,
        rg = null,
        rv = 1,
        ry = "";

    function rb(e, t) {
        rc[rd++] = rp, rc[rd++] = rf, rf = e, rp = t
    }

    function r_(e, t, n) {
        rh[rm++] = rv, rh[rm++] = ry, rh[rm++] = rg, rg = e;
        var r = rv;
        e = ry;
        var a = 32 - eh(r) - 1;
        r &= ~(1 << a), n += 1;
        var l = 32 - eh(t) + a;
        if (30 < l) {
            var o = a - a % 5;
            l = (r & (1 << o) - 1).toString(32), r >>= o, a -= o, rv = 1 << 32 - eh(t) + a | n << a | r, ry = l + e
        } else rv = 1 << l | n << a | r, ry = e
    }

    function rS(e) {
        null !== e.return && (rb(e, 1), r_(e, 1, 0))
    }

    function rw(e) {
        for (; e === rf;) rf = rc[--rd], rc[rd] = null, rp = rc[--rd], rc[rd] = null;
        for (; e === rg;) rg = rh[--rm], rh[rm] = null, ry = rh[--rm], rh[rm] = null, rv = rh[--rm], rh[rm] = null
    }

    function rE(e, t) {
        rh[rm++] = rv, rh[rm++] = ry, rh[rm++] = rg, rv = t.id, ry = t.overflow, rg = e
    }
    var rk = null,
        rx = null,
        rT = !1,
        rP = null,
        rC = !1,
        rN = Error(u(519));

    function rR(e) {
        var t = Error(u(418, 1 < arguments.length && void 0 !== arguments[1] && arguments[1] ? "text" : "HTML", ""));
        throw rM(rs(t, e)), rN
    }

    function rA(e) {
        var t = e.stateNode,
            n = e.type,
            r = e.memoizedProps;
        switch (t[eI] = e, t[eD] = r, n) {
            case "dialog":
                u6("cancel", t), u6("close", t);
                break;
            case "iframe":
            case "object":
            case "embed":
                u6("load", t);
                break;
            case "video":
            case "audio":
                for (n = 0; n < u2.length; n++) u6(u2[n], t);
                break;
            case "source":
                u6("error", t);
                break;
            case "img":
            case "image":
            case "link":
                u6("error", t), u6("load", t);
                break;
            case "details":
                u6("toggle", t);
                break;
            case "input":
                u6("invalid", t), tn(t, r.value, r.defaultValue, r.checked, r.defaultChecked, r.type, r.name, !0);
                break;
            case "select":
                u6("invalid", t);
                break;
            case "textarea":
                u6("invalid", t), to(t, r.value, r.defaultValue, r.children)
        }
        "string" != typeof(n = r.children) && "number" != typeof n && "bigint" != typeof n || t.textContent === "" + n || !0 === r.suppressHydrationWarning || su(t.textContent, n) ? (null != r.popover && (u6("beforetoggle", t), u6("toggle", t)), null != r.onScroll && u6("scroll", t), null != r.onScrollEnd && u6("scrollend", t), null != r.onClick && (t.onclick = tm), t = !0) : t = !1, t || rR(e, !0)
    }

    function rL(e) {
        for (rk = e.return; rk;) switch (rk.tag) {
            case 5:
            case 31:
            case 13:
                rC = !1;
                return;
            case 27:
            case 3:
                rC = !0;
                return;
            default:
                rk = rk.return
        }
    }

    function rO(e) {
        if (e !== rk) return !1;
        if (!rT) return rL(e), rT = !0, !1;
        var t, n = e.tag;
        if ((t = 3 !== n && 27 !== n) && ((t = 5 === n) && (t = "form" === (t = e.type) || "button" === t || sy(e.type, e.memoizedProps)), t = !t), t && rx && rR(e), rL(e), 13 === n) {
            if (!(e = null !== (e = e.memoizedState) ? e.dehydrated : null)) throw Error(u(317));
            rx = sI(e)
        } else if (31 === n) {
            if (!(e = null !== (e = e.memoizedState) ? e.dehydrated : null)) throw Error(u(317));
            rx = sI(e)
        } else 27 === n ? (n = rx, sx(e.type) ? (e = sO, sO = null, rx = e) : rx = n) : rx = rk ? sL(e.stateNode.nextSibling) : null;
        return !0
    }

    function rI() {
        rx = rk = null, rT = !1
    }

    function rD() {
        var e = rP;
        return null !== e && (null === iJ ? iJ = e : iJ.push.apply(iJ, e), rP = null), e
    }

    function rM(e) {
        null === rP ? rP = [e] : rP.push(e)
    }
    var rz = j(null),
        rF = null,
        rj = null;

    function rU(e, t, n) {
        B(rz, t._currentValue), t._currentValue = n
    }

    function rB(e) {
        e._currentValue = rz.current, U(rz)
    }

    function rH(e, t, n) {
        for (; null !== e;) {
            var r = e.alternate;
            if ((e.childLanes & t) !== t ? (e.childLanes |= t, null !== r && (r.childLanes |= t)) : null !== r && (r.childLanes & t) !== t && (r.childLanes |= t), e === n) break;
            e = e.return
        }
    }

    function rq(e, t, n, r) {
        var a = e.child;
        for (null !== a && (a.return = e); null !== a;) {
            var l = a.dependencies;
            if (null !== l) {
                var o = a.child;
                l = l.firstContext;
                e: for (; null !== l;) {
                    var i = l;
                    l = a;
                    for (var s = 0; s < t.length; s++)
                        if (i.context === t[s]) {
                            l.lanes |= n, null !== (i = l.alternate) && (i.lanes |= n), rH(l.return, n, e), r || (o = null);
                            break e
                        } l = i.next
                }
            } else if (18 === a.tag) {
                if (null === (o = a.return)) throw Error(u(341));
                o.lanes |= n, null !== (l = o.alternate) && (l.lanes |= n), rH(o, n, e), o = null
            } else o = a.child;
            if (null !== o) o.return = a;
            else
                for (o = a; null !== o;) {
                    if (o === e) {
                        o = null;
                        break
                    }
                    if (null !== (a = o.sibling)) {
                        a.return = o.return, o = a;
                        break
                    }
                    o = o.return
                }
            a = o
        }
    }

    function rW(e, t, n, r) {
        e = null;
        for (var a = t, l = !1; null !== a;) {
            if (!l) {
                if (0 != (524288 & a.flags)) l = !0;
                else if (0 != (262144 & a.flags)) break
            }
            if (10 === a.tag) {
                var o = a.alternate;
                if (null === o) throw Error(u(387));
                if (null !== (o = o.memoizedProps)) {
                    var i = a.type;
                    nk(a.pendingProps.value, o.value) || (null !== e ? e.push(i) : e = [i])
                }
            } else if (a === $.current) {
                if (null === (o = a.alternate)) throw Error(u(387));
                o.memoizedState.memoizedState !== a.memoizedState.memoizedState && (null !== e ? e.push(s7) : e = [s7])
            }
            a = a.return
        }
        null !== e && rq(t, e, n, r), t.flags |= 262144
    }

    function r$(e) {
        for (e = e.firstContext; null !== e;) {
            if (!nk(e.context._currentValue, e.memoizedValue)) return !0;
            e = e.next
        }
        return !1
    }

    function rV(e) {
        rF = e, rj = null, null !== (e = e.dependencies) && (e.firstContext = null)
    }

    function rQ(e) {
        return rY(rF, e)
    }

    function rG(e, t) {
        return null === rF && rV(e), rY(e, t)
    }

    function rY(e, t) {
        var n = t._currentValue;
        if (t = {
                context: t,
                memoizedValue: n,
                next: null
            }, null === rj) {
            if (null === e) throw Error(u(308));
            rj = t, e.dependencies = {
                lanes: 0,
                firstContext: t
            }, e.flags |= 524288
        } else rj = rj.next = t;
        return n
    }
    var rX = "u" > typeof AbortController ? AbortController : function() {
            var e = [],
                t = this.signal = {
                    aborted: !1,
                    addEventListener: function(t, n) {
                        e.push(n)
                    }
                };
            this.abort = function() {
                t.aborted = !0, e.forEach(function(e) {
                    return e()
                })
            }
        },
        rK = l.unstable_scheduleCallback,
        rJ = l.unstable_NormalPriority,
        rZ = {
            $$typeof: w,
            Consumer: null,
            Provider: null,
            _currentValue: null,
            _currentValue2: null,
            _threadCount: 0
        };

    function r0() {
        return {
            controller: new rX,
            data: new Map,
            refCount: 0
        }
    }

    function r1(e) {
        e.refCount--, 0 === e.refCount && rK(rJ, function() {
            e.controller.abort()
        })
    }
    var r2 = null,
        r3 = 0,
        r4 = 0,
        r6 = null;

    function r8() {
        if (0 == --r3 && null !== r2) {
            null !== r6 && (r6.status = "fulfilled");
            var e = r2;
            r2 = null, r4 = 0, r6 = null;
            for (var t = 0; t < e.length; t++)(0, e[t])()
        }
    }
    var r5 = I.S;
    I.S = function(e, t) {
        i1 = el(), "object" == typeof t && null !== t && "function" == typeof t.then && function(e) {
            if (null === r2) {
                var t = r2 = [];
                r3 = 0, r4 = uK(), r6 = {
                    status: "pending",
                    value: void 0,
                    then: function(e) {
                        t.push(e)
                    }
                }
            }
            r3++, e.then(r8, r8)
        }(t), null !== r5 && r5(e, t)
    };
    var r9 = j(null);

    function r7() {
        var e = r9.current;
        return null !== e ? e : iM.pooledCache
    }

    function ae(e, t) {
        null === t ? B(r9, r9.current) : B(r9, t.pool)
    }

    function at() {
        var e = r7();
        return null === e ? null : {
            parent: rZ._currentValue,
            pool: e
        }
    }
    var an = Error(u(460)),
        ar = Error(u(474)),
        aa = Error(u(542)),
        al = {
            then: function() {}
        };

    function ao(e) {
        return "fulfilled" === (e = e.status) || "rejected" === e
    }

    function ai(e, t, n) {
        switch (void 0 === (n = e[n]) ? e.push(t) : n !== t && (t.then(tm, tm), t = n), t.status) {
            case "fulfilled":
                return t.value;
            case "rejected":
                throw ad(e = t.reason), e;
            default:
                if ("string" == typeof t.status) t.then(tm, tm);
                else {
                    if (null !== (e = iM) && 100 < e.shellSuspendCounter) throw Error(u(482));
                    (e = t).status = "pending", e.then(function(e) {
                        if ("pending" === t.status) {
                            var n = t;
                            n.status = "fulfilled", n.value = e
                        }
                    }, function(e) {
                        if ("pending" === t.status) {
                            var n = t;
                            n.status = "rejected", n.reason = e
                        }
                    })
                }
                switch (t.status) {
                    case "fulfilled":
                        return t.value;
                    case "rejected":
                        throw ad(e = t.reason), e
                }
                throw as = t, an
        }
    }

    function au(e) {
        try {
            return (0, e._init)(e._payload)
        } catch (e) {
            if (null !== e && "object" == typeof e && "function" == typeof e.then) throw as = e, an;
            throw e
        }
    }
    var as = null;

    function ac() {
        if (null === as) throw Error(u(459));
        var e = as;
        return as = null, e
    }

    function ad(e) {
        if (e === an || e === aa) throw Error(u(483))
    }
    var af = null,
        ap = 0;

    function ah(e) {
        var t = ap;
        return ap += 1, null === af && (af = []), ai(af, e, t)
    }

    function am(e, t) {
        e.ref = void 0 !== (t = t.props.ref) ? t : null
    }

    function ag(e, t) {
        if (t.$$typeof === m) throw Error(u(525));
        throw Error(u(31, "[object Object]" === (e = Object.prototype.toString.call(t)) ? "object with keys {" + Object.keys(t).join(", ") + "}" : e))
    }

    function av(e) {
        function t(t, n) {
            if (e) {
                var r = t.deletions;
                null === r ? (t.deletions = [n], t.flags |= 16) : r.push(n)
            }
        }

        function n(n, r) {
            if (!e) return null;
            for (; null !== r;) t(n, r), r = r.sibling;
            return null
        }

        function r(e) {
            for (var t = new Map; null !== e;) null !== e.key ? t.set(e.key, e) : t.set(e.index, e), e = e.sibling;
            return t
        }

        function a(e, t) {
            return (e = rt(e, t)).index = 0, e.sibling = null, e
        }

        function l(t, n, r) {
            return (t.index = r, e) ? null !== (r = t.alternate) ? (r = r.index) < n ? (t.flags |= 0x4000002, n) : r : (t.flags |= 0x4000002, n) : (t.flags |= 1048576, n)
        }

        function o(t) {
            return e && null === t.alternate && (t.flags |= 0x4000002), t
        }

        function i(e, t, n, r) {
            return null === t || 6 !== t.tag ? (t = rl(n, e.mode, r)).return = e : (t = a(t, n)).return = e, t
        }

        function s(e, t, n, r) {
            var l = n.type;
            return l === y ? d(e, t, n.props.children, r, n.key) : (null !== t && (t.elementType === l || "object" == typeof l && null !== l && l.$$typeof === P && au(l) === t.type) ? am(t = a(t, n.props), n) : am(t = rr(n.type, n.key, n.props, null, e.mode, r), n), t.return = e, t)
        }

        function c(e, t, n, r) {
            return null === t || 4 !== t.tag || t.stateNode.containerInfo !== n.containerInfo || t.stateNode.implementation !== n.implementation ? (t = ri(n, e.mode, r)).return = e : (t = a(t, n.children || [])).return = e, t
        }

        function d(e, t, n, r, l) {
            return null === t || 7 !== t.tag ? (t = ra(n, e.mode, r, l)).return = e : (t = a(t, n)).return = e, t
        }

        function f(e, t, n) {
            if ("string" == typeof t && "" !== t || "number" == typeof t || "bigint" == typeof t) return (t = rl("" + t, e.mode, n)).return = e, t;
            if ("object" == typeof t && null !== t) {
                switch (t.$$typeof) {
                    case g:
                        return am(n = rr(t.type, t.key, t.props, null, e.mode, n), t), n.return = e, n;
                    case v:
                        return (t = ri(t, e.mode, n)).return = e, t;
                    case P:
                        return f(e, t = au(t), n)
                }
                if (O(t) || A(t)) return (t = ra(t, e.mode, n, null)).return = e, t;
                if ("function" == typeof t.then) return f(e, ah(t), n);
                if (t.$$typeof === w) return f(e, rG(e, t), n);
                ag(e, t)
            }
            return null
        }

        function p(e, t, n, r) {
            var a = null !== t ? t.key : null;
            if ("string" == typeof n && "" !== n || "number" == typeof n || "bigint" == typeof n) return null !== a ? null : i(e, t, "" + n, r);
            if ("object" == typeof n && null !== n) {
                switch (n.$$typeof) {
                    case g:
                        return n.key === a ? s(e, t, n, r) : null;
                    case v:
                        return n.key === a ? c(e, t, n, r) : null;
                    case P:
                        return p(e, t, n = au(n), r)
                }
                if (O(n) || A(n)) return null !== a ? null : d(e, t, n, r, null);
                if ("function" == typeof n.then) return p(e, t, ah(n), r);
                if (n.$$typeof === w) return p(e, t, rG(e, n), r);
                ag(e, n)
            }
            return null
        }

        function h(e, t, n, r, a) {
            if ("string" == typeof r && "" !== r || "number" == typeof r || "bigint" == typeof r) return i(t, e = e.get(n) || null, "" + r, a);
            if ("object" == typeof r && null !== r) {
                switch (r.$$typeof) {
                    case g:
                        return s(t, e = e.get(null === r.key ? n : r.key) || null, r, a);
                    case v:
                        return c(t, e = e.get(null === r.key ? n : r.key) || null, r, a);
                    case P:
                        return h(e, t, n, r = au(r), a)
                }
                if (O(r) || A(r)) return d(t, e = e.get(n) || null, r, a, null);
                if ("function" == typeof r.then) return h(e, t, n, ah(r), a);
                if (r.$$typeof === w) return h(e, t, n, rG(t, r), a);
                ag(t, r)
            }
            return null
        }
        return function(i, s, c, d) {
            try {
                ap = 0;
                var m = function i(s, c, d, m) {
                    if ("object" == typeof d && null !== d && d.type === y && null === d.key && (d = d.props.children), "object" == typeof d && null !== d) {
                        switch (d.$$typeof) {
                            case g:
                                e: {
                                    for (var b = d.key; null !== c;) {
                                        if (c.key === b) {
                                            if ((b = d.type) === y) {
                                                if (7 === c.tag) {
                                                    n(s, c.sibling), (m = a(c, d.props.children)).return = s, s = m;
                                                    break e
                                                }
                                            } else if (c.elementType === b || "object" == typeof b && null !== b && b.$$typeof === P && au(b) === c.type) {
                                                n(s, c.sibling), am(m = a(c, d.props), d), m.return = s, s = m;
                                                break e
                                            }
                                            n(s, c);
                                            break
                                        }
                                        t(s, c), c = c.sibling
                                    }
                                    d.type === y ? (m = ra(d.props.children, s.mode, m, d.key)).return = s : (am(m = rr(d.type, d.key, d.props, null, s.mode, m), d), m.return = s),
                                    s = m
                                }
                                return o(s);
                            case v:
                                e: {
                                    for (b = d.key; null !== c;) {
                                        if (c.key === b)
                                            if (4 === c.tag && c.stateNode.containerInfo === d.containerInfo && c.stateNode.implementation === d.implementation) {
                                                n(s, c.sibling), (m = a(c, d.children || [])).return = s, s = m;
                                                break e
                                            } else {
                                                n(s, c);
                                                break
                                            } t(s, c), c = c.sibling
                                    }(m = ri(d, s.mode, m)).return = s,
                                    s = m
                                }
                                return o(s);
                            case P:
                                return i(s, c, d = au(d), m)
                        }
                        if (O(d)) return function(a, o, i, u) {
                            for (var s = null, c = null, d = o, m = o = 0, g = null; null !== d && m < i.length; m++) {
                                d.index > m ? (g = d, d = null) : g = d.sibling;
                                var v = p(a, d, i[m], u);
                                if (null === v) {
                                    null === d && (d = g);
                                    break
                                }
                                e && d && null === v.alternate && t(a, d), o = l(v, o, m), null === c ? s = v : c.sibling = v, c = v, d = g
                            }
                            if (m === i.length) return n(a, d), rT && rb(a, m), s;
                            if (null === d) {
                                for (; m < i.length; m++) null !== (d = f(a, i[m], u)) && (o = l(d, o, m), null === c ? s = d : c.sibling = d, c = d);
                                return rT && rb(a, m), s
                            }
                            for (d = r(d); m < i.length; m++) null !== (g = h(d, a, m, i[m], u)) && (e && null !== g.alternate && d.delete(null === g.key ? m : g.key), o = l(g, o, m), null === c ? s = g : c.sibling = g, c = g);
                            return e && d.forEach(function(e) {
                                return t(a, e)
                            }), rT && rb(a, m), s
                        }(s, c, d, m);
                        if (A(d)) {
                            if ("function" != typeof(b = A(d))) throw Error(u(150));
                            return function(a, o, i, s) {
                                if (null == i) throw Error(u(151));
                                for (var c = null, d = null, m = o, g = o = 0, v = null, y = i.next(); null !== m && !y.done; g++, y = i.next()) {
                                    m.index > g ? (v = m, m = null) : v = m.sibling;
                                    var b = p(a, m, y.value, s);
                                    if (null === b) {
                                        null === m && (m = v);
                                        break
                                    }
                                    e && m && null === b.alternate && t(a, m), o = l(b, o, g), null === d ? c = b : d.sibling = b, d = b, m = v
                                }
                                if (y.done) return n(a, m), rT && rb(a, g), c;
                                if (null === m) {
                                    for (; !y.done; g++, y = i.next()) null !== (y = f(a, y.value, s)) && (o = l(y, o, g), null === d ? c = y : d.sibling = y, d = y);
                                    return rT && rb(a, g), c
                                }
                                for (m = r(m); !y.done; g++, y = i.next()) null !== (y = h(m, a, g, y.value, s)) && (e && null !== y.alternate && m.delete(null === y.key ? g : y.key), o = l(y, o, g), null === d ? c = y : d.sibling = y, d = y);
                                return e && m.forEach(function(e) {
                                    return t(a, e)
                                }), rT && rb(a, g), c
                            }(s, c, d = b.call(d), m)
                        }
                        if ("function" == typeof d.then) return i(s, c, ah(d), m);
                        if (d.$$typeof === w) return i(s, c, rG(s, d), m);
                        ag(s, d)
                    }
                    return "string" == typeof d && "" !== d || "number" == typeof d || "bigint" == typeof d ? (d = "" + d, null !== c && 6 === c.tag ? (n(s, c.sibling), (m = a(c, d)).return = s) : (n(s, c), (m = rl(d, s.mode, m)).return = s), o(s = m)) : n(s, c)
                }(i, s, c, d);
                return af = null, m
            } catch (e) {
                if (e === an || e === aa) throw e;
                var b = n7(29, e, null, i.mode);
                return b.lanes = d, b.return = i, b
            } finally {}
        }
    }
    var ay = av(!0),
        ab = av(!1),
        a_ = !1;

    function aS(e) {
        e.updateQueue = {
            baseState: e.memoizedState,
            firstBaseUpdate: null,
            lastBaseUpdate: null,
            shared: {
                pending: null,
                lanes: 0,
                hiddenCallbacks: null
            },
            callbacks: null
        }
    }

    function aw(e, t) {
        e = e.updateQueue, t.updateQueue === e && (t.updateQueue = {
            baseState: e.baseState,
            firstBaseUpdate: e.firstBaseUpdate,
            lastBaseUpdate: e.lastBaseUpdate,
            shared: e.shared,
            callbacks: null
        })
    }

    function aE(e) {
        return {
            lane: e,
            tag: 0,
            payload: null,
            callback: null,
            next: null
        }
    }

    function ak(e, t, n) {
        var r = e.updateQueue;
        if (null === r) return null;
        if (r = r.shared, 0 != (2 & iD)) {
            var a = r.pending;
            return null === a ? t.next = t : (t.next = a.next, a.next = t), r.pending = t, t = n8(e), n6(e, null, n), t
        }
        return n2(e, r, t, n), n8(e)
    }

    function ax(e, t, n) {
        if (null !== (t = t.updateQueue) && (t = t.shared, 0 != (4194048 & n))) {
            var r = t.lanes;
            r &= e.pendingLanes, n |= r, t.lanes = n, eP(e, n)
        }
    }

    function aT(e, t) {
        var n = e.updateQueue,
            r = e.alternate;
        if (null !== r && n === (r = r.updateQueue)) {
            var a = null,
                l = null;
            if (null !== (n = n.firstBaseUpdate)) {
                do {
                    var o = {
                        lane: n.lane,
                        tag: n.tag,
                        payload: n.payload,
                        callback: null,
                        next: null
                    };
                    null === l ? a = l = o : l = l.next = o, n = n.next
                } while (null !== n) null === l ? a = l = t : l = l.next = t
            } else a = l = t;
            n = {
                baseState: r.baseState,
                firstBaseUpdate: a,
                lastBaseUpdate: l,
                shared: r.shared,
                callbacks: r.callbacks
            }, e.updateQueue = n;
            return
        }
        null === (e = n.lastBaseUpdate) ? n.firstBaseUpdate = t : e.next = t, n.lastBaseUpdate = t
    }
    var aP = !1;

    function aC() {
        if (aP) {
            var e = r6;
            if (null !== e) throw e
        }
    }

    function aN(e, t, n, r) {
        aP = !1;
        var a = e.updateQueue;
        a_ = !1;
        var l = a.firstBaseUpdate,
            o = a.lastBaseUpdate,
            i = a.shared.pending;
        if (null !== i) {
            a.shared.pending = null;
            var u = i,
                s = u.next;
            u.next = null, null === o ? l = s : o.next = s, o = u;
            var c = e.alternate;
            null !== c && (i = (c = c.updateQueue).lastBaseUpdate) !== o && (null === i ? c.firstBaseUpdate = s : i.next = s, c.lastBaseUpdate = u)
        }
        if (null !== l) {
            var d = a.baseState;
            for (o = 0, c = s = u = null, i = l;;) {
                var f = -0x20000001 & i.lane,
                    p = f !== i.lane;
                if (p ? (iF & f) === f : (r & f) === f) {
                    0 !== f && f === r4 && (aP = !0), null !== c && (c = c.next = {
                        lane: 0,
                        tag: i.tag,
                        payload: i.payload,
                        callback: null,
                        next: null
                    });
                    e: {
                        var m = e,
                            g = i;
                        switch (f = t, g.tag) {
                            case 1:
                                if ("function" == typeof(m = g.payload)) {
                                    d = m.call(n, d, f);
                                    break e
                                }
                                d = m;
                                break e;
                            case 3:
                                m.flags = -65537 & m.flags | 128;
                            case 0:
                                if (null == (f = "function" == typeof(m = g.payload) ? m.call(n, d, f) : m)) break e;
                                d = h({}, d, f);
                                break e;
                            case 2:
                                a_ = !0
                        }
                    }
                    null !== (f = i.callback) && (e.flags |= 64, p && (e.flags |= 8192), null === (p = a.callbacks) ? a.callbacks = [f] : p.push(f))
                } else p = {
                    lane: f,
                    tag: i.tag,
                    payload: i.payload,
                    callback: i.callback,
                    next: null
                }, null === c ? (s = c = p, u = d) : c = c.next = p, o |= f;
                if (null === (i = i.next))
                    if (null === (i = a.shared.pending)) break;
                    else i = (p = i).next, p.next = null, a.lastBaseUpdate = p, a.shared.pending = null
            }
            null === c && (u = d), a.baseState = u, a.firstBaseUpdate = s, a.lastBaseUpdate = c, null === l && (a.shared.lanes = 0), iV |= o, e.lanes = o, e.memoizedState = d
        }
    }

    function aR(e, t) {
        if ("function" != typeof e) throw Error(u(191, e));
        e.call(t)
    }

    function aA(e, t) {
        var n = e.callbacks;
        if (null !== n)
            for (e.callbacks = null, e = 0; e < n.length; e++) aR(n[e], t)
    }
    var aL = j(null),
        aO = j(0);

    function aI(e, t) {
        B(aO, e = iW), B(aL, t), iW = e | t.baseLanes
    }

    function aD() {
        B(aO, iW), B(aL, aL.current)
    }

    function aM() {
        iW = aO.current, U(aL), U(aO)
    }
    var az = j(null),
        aF = null;

    function aj(e) {
        var t = e.alternate;
        B(aW, 1 & aW.current), B(az, e), null === aF && (null === t || null !== aL.current ? aF = e : null !== t.memoizedState && (aF = e))
    }

    function aU(e) {
        B(aW, aW.current), B(az, e), null === aF && (aF = e)
    }

    function aB(e) {
        22 === e.tag ? (B(aW, aW.current), B(az, e), null === aF && (aF = e)) : aH()
    }

    function aH() {
        B(aW, aW.current), B(az, az.current)
    }

    function aq(e) {
        U(az), aF === e && (aF = null), U(aW)
    }
    var aW = j(0);

    function a$(e) {
        for (var t = e; null !== t;) {
            if (13 === t.tag) {
                var n = t.memoizedState;
                if (null !== n && (null === (n = n.dehydrated) || sR(n) || sA(n))) return t
            } else if (19 === t.tag && ("forwards" === t.memoizedProps.revealOrder || "backwards" === t.memoizedProps.revealOrder || "unstable_legacy-backwards" === t.memoizedProps.revealOrder || "together" === t.memoizedProps.revealOrder)) {
                if (0 != (128 & t.flags)) return t
            } else if (null !== t.child) {
                t.child.return = t, t = t.child;
                continue
            }
            if (t === e) break;
            for (; null === t.sibling;) {
                if (null === t.return || t.return === e) return null;
                t = t.return
            }
            t.sibling.return = t.return, t = t.sibling
        }
        return null
    }
    var aV = 0,
        aQ = null,
        aG = null,
        aY = null,
        aX = !1,
        aK = !1,
        aJ = !1,
        aZ = 0,
        a0 = 0,
        a1 = null,
        a2 = 0;

    function a3() {
        throw Error(u(321))
    }

    function a4(e, t) {
        if (null === t) return !1;
        for (var n = 0; n < t.length && n < e.length; n++)
            if (!nk(e[n], t[n])) return !1;
        return !0
    }

    function a6(e, t, n, r, a, l) {
        return aV = l, aQ = t, t.memoizedState = null, t.updateQueue = null, t.lanes = 0, I.H = null === e || null === e.memoizedState ? ot : on, aJ = !1, l = n(r, a), aJ = !1, aK && (l = a5(t, n, r, a)), a8(e), l
    }

    function a8(e) {
        I.H = oe;
        var t = null !== aG && null !== aG.next;
        if (aV = 0, aY = aG = aQ = null, aX = !1, a0 = 0, a1 = null, t) throw Error(u(300));
        null === e || oy || null !== (e = e.dependencies) && r$(e) && (oy = !0)
    }

    function a5(e, t, n, r) {
        aQ = e;
        var a = 0;
        do {
            if (aK && (a1 = null), a0 = 0, aK = !1, 25 <= a) throw Error(u(301));
            if (a += 1, aY = aG = null, null != e.updateQueue) {
                var l = e.updateQueue;
                l.lastEffect = null, l.events = null, l.stores = null, null != l.memoCache && (l.memoCache.index = 0)
            }
            I.H = or, l = t(n, r)
        } while (aK) return l
    }

    function a9() {
        var e = I.H,
            t = e.useState()[0];
        return t = "function" == typeof t.then ? ll(t) : t, e = e.useState()[0], (null !== aG ? aG.memoizedState : null) !== e && (aQ.flags |= 1024), t
    }

    function a7() {
        var e = 0 !== aZ;
        return aZ = 0, e
    }

    function le(e, t, n) {
        t.updateQueue = e.updateQueue, t.flags &= -2053, e.lanes &= ~n
    }

    function lt(e) {
        if (aX) {
            for (e = e.memoizedState; null !== e;) {
                var t = e.queue;
                null !== t && (t.pending = null), e = e.next
            }
            aX = !1
        }
        aV = 0, aY = aG = aQ = null, aK = !1, a0 = aZ = 0, a1 = null
    }

    function ln() {
        var e = {
            memoizedState: null,
            baseState: null,
            baseQueue: null,
            queue: null,
            next: null
        };
        return null === aY ? aQ.memoizedState = aY = e : aY = aY.next = e, aY
    }

    function lr() {
        if (null === aG) {
            var e = aQ.alternate;
            e = null !== e ? e.memoizedState : null
        } else e = aG.next;
        var t = null === aY ? aQ.memoizedState : aY.next;
        if (null !== t) aY = t, aG = e;
        else {
            if (null === e) {
                if (null === aQ.alternate) throw Error(u(467));
                throw Error(u(310))
            }
            e = {
                memoizedState: (aG = e).memoizedState,
                baseState: aG.baseState,
                baseQueue: aG.baseQueue,
                queue: aG.queue,
                next: null
            }, null === aY ? aQ.memoizedState = aY = e : aY = aY.next = e
        }
        return aY
    }

    function la() {
        return {
            lastEffect: null,
            events: null,
            stores: null,
            memoCache: null
        }
    }

    function ll(e) {
        var t = a0;
        return a0 += 1, null === a1 && (a1 = []), e = ai(a1, e, t), t = aQ, null === (null === aY ? t.memoizedState : aY.next) && (I.H = null === (t = t.alternate) || null === t.memoizedState ? ot : on), e
    }

    function lo(e) {
        if (null !== e && "object" == typeof e) {
            if ("function" == typeof e.then) return ll(e);
            if (e.$$typeof === w) return rQ(e)
        }
        throw Error(u(438, String(e)))
    }

    function li(e) {
        var t = null,
            n = aQ.updateQueue;
        if (null !== n && (t = n.memoCache), null == t) {
            var r = aQ.alternate;
            null !== r && null !== (r = r.updateQueue) && null != (r = r.memoCache) && (t = {
                data: r.data.map(function(e) {
                    return e.slice()
                }),
                index: 0
            })
        }
        if (null == t && (t = {
                data: [],
                index: 0
            }), null === n && (n = la(), aQ.updateQueue = n), n.memoCache = t, void 0 === (n = t.data[t.index]))
            for (n = t.data[t.index] = Array(e), r = 0; r < e; r++) n[r] = N;
        return t.index++, n
    }

    function lu(e, t) {
        return "function" == typeof t ? t(e) : t
    }

    function ls(e) {
        return lc(lr(), aG, e)
    }

    function lc(e, t, n) {
        var r = e.queue;
        if (null === r) throw Error(u(311));
        r.lastRenderedReducer = n;
        var a = e.baseQueue,
            l = r.pending;
        if (null !== l) {
            if (null !== a) {
                var o = a.next;
                a.next = l.next, l.next = o
            }
            t.baseQueue = a = l, r.pending = null
        }
        if (l = e.baseState, null === a) e.memoizedState = l;
        else {
            t = a.next;
            var i = o = null,
                s = null,
                c = t,
                d = !1;
            do {
                var f = -0x20000001 & c.lane;
                if (f !== c.lane ? (iF & f) === f : (aV & f) === f) {
                    var p = c.revertLane;
                    if (0 === p) null !== s && (s = s.next = {
                        lane: 0,
                        revertLane: 0,
                        gesture: null,
                        action: c.action,
                        hasEagerState: c.hasEagerState,
                        eagerState: c.eagerState,
                        next: null
                    }), f === r4 && (d = !0);
                    else if ((aV & p) === p) {
                        c = c.next, p === r4 && (d = !0);
                        continue
                    } else f = {
                        lane: 0,
                        revertLane: c.revertLane,
                        gesture: null,
                        action: c.action,
                        hasEagerState: c.hasEagerState,
                        eagerState: c.eagerState,
                        next: null
                    }, null === s ? (i = s = f, o = l) : s = s.next = f, aQ.lanes |= p, iV |= p;
                    f = c.action, aJ && n(l, f), l = c.hasEagerState ? c.eagerState : n(l, f)
                } else p = {
                    lane: f,
                    revertLane: c.revertLane,
                    gesture: c.gesture,
                    action: c.action,
                    hasEagerState: c.hasEagerState,
                    eagerState: c.eagerState,
                    next: null
                }, null === s ? (i = s = p, o = l) : s = s.next = p, aQ.lanes |= f, iV |= f;
                c = c.next
            } while (null !== c && c !== t) if (null === s ? o = l : s.next = i, !nk(l, e.memoizedState) && (oy = !0, d && null !== (n = r6))) throw n;
            e.memoizedState = l, e.baseState = o, e.baseQueue = s, r.lastRenderedState = l
        }
        return null === a && (r.lanes = 0), [e.memoizedState, r.dispatch]
    }

    function ld(e) {
        var t = lr(),
            n = t.queue;
        if (null === n) throw Error(u(311));
        n.lastRenderedReducer = e;
        var r = n.dispatch,
            a = n.pending,
            l = t.memoizedState;
        if (null !== a) {
            n.pending = null;
            var o = a = a.next;
            do l = e(l, o.action), o = o.next; while (o !== a) nk(l, t.memoizedState) || (oy = !0), t.memoizedState = l, null === t.baseQueue && (t.baseState = l), n.lastRenderedState = l
        }
        return [l, r]
    }

    function lf(e, t, n) {
        var r = aQ,
            a = lr(),
            l = rT;
        if (l) {
            if (void 0 === n) throw Error(u(407));
            n = n()
        } else n = t();
        var o = !nk((aG || a).memoizedState, n);
        if (o && (a.memoizedState = n, oy = !0), a = a.queue, lz(lm.bind(null, r, a, e), [e]), a.getSnapshot !== t || o || null !== aY && 1 & aY.memoizedState.tag) {
            if (r.flags |= 2048, lL(9, {
                    destroy: void 0
                }, lh.bind(null, r, a, n, t), null), null === iM) throw Error(u(349));
            l || 0 != (127 & aV) || lp(r, t, n)
        }
        return n
    }

    function lp(e, t, n) {
        e.flags |= 16384, e = {
            getSnapshot: t,
            value: n
        }, null === (t = aQ.updateQueue) ? (t = la(), aQ.updateQueue = t, t.stores = [e]) : null === (n = t.stores) ? t.stores = [e] : n.push(e)
    }

    function lh(e, t, n, r) {
        t.value = n, t.getSnapshot = r, lg(t) && lv(e)
    }

    function lm(e, t, n) {
        return n(function() {
            lg(t) && lv(e)
        })
    }

    function lg(e) {
        var t = e.getSnapshot;
        e = e.value;
        try {
            var n = t();
            return !nk(e, n)
        } catch (e) {
            return !0
        }
    }

    function lv(e) {
        var t = n4(e, 2);
        null !== t && uo(t, e, 2)
    }

    function ly(e) {
        var t = ln();
        return "function" == typeof e && (e = e()), t.memoizedState = t.baseState = e, t.queue = {
            pending: null,
            lanes: 0,
            dispatch: null,
            lastRenderedReducer: lu,
            lastRenderedState: e
        }, t
    }

    function lb(e, t, n, r) {
        return e.baseState = n, lc(e, aG, "function" == typeof r ? r : lu)
    }

    function l_(e, t, n, r, a) {
        if (l5(e)) throw Error(u(485));
        if (null !== (e = t.action)) {
            var l = {
                payload: a,
                action: e,
                next: null,
                isTransition: !0,
                status: "pending",
                value: null,
                reason: null,
                listeners: [],
                then: function(e) {
                    l.listeners.push(e)
                }
            };
            null !== I.T ? n(!0) : l.isTransition = !1, r(l), null === (n = t.pending) ? (l.next = t.pending = l, lS(t, l)) : (l.next = n.next, t.pending = n.next = l)
        }
    }

    function lS(e, t) {
        var n = t.action,
            r = t.payload,
            a = e.state;
        if (t.isTransition) {
            var l = I.T,
                o = {};
            I.T = o;
            try {
                var i = n(a, r),
                    u = I.S;
                null !== u && u(o, i), lw(e, t, i)
            } catch (n) {
                lk(e, t, n)
            } finally {
                null !== l && null !== o.types && (l.types = o.types), I.T = l
            }
        } else try {
            l = n(a, r), lw(e, t, l)
        } catch (n) {
            lk(e, t, n)
        }
    }

    function lw(e, t, n) {
        null !== n && "object" == typeof n && "function" == typeof n.then ? n.then(function(n) {
            lE(e, t, n)
        }, function(n) {
            return lk(e, t, n)
        }) : lE(e, t, n)
    }

    function lE(e, t, n) {
        t.status = "fulfilled", t.value = n, lx(t), e.state = n, null !== (t = e.pending) && ((n = t.next) === t ? e.pending = null : (n = n.next, t.next = n, lS(e, n)))
    }

    function lk(e, t, n) {
        var r = e.pending;
        if (e.pending = null, null !== r) {
            r = r.next;
            do t.status = "rejected", t.reason = n, lx(t), t = t.next; while (t !== r)
        }
        e.action = null
    }

    function lx(e) {
        e = e.listeners;
        for (var t = 0; t < e.length; t++)(0, e[t])()
    }

    function lT(e, t) {
        return t
    }

    function lP(e, t) {
        if (rT) {
            var n = iM.formState;
            if (null !== n) {
                e: {
                    var r = aQ;
                    if (rT) {
                        if (rx) {
                            t: {
                                for (var a = rx, l = rC; 8 !== a.nodeType;)
                                    if (!l || null === (a = sL(a.nextSibling))) {
                                        a = null;
                                        break t
                                    } a = "F!" === (l = a.data) || "F" === l ? a : null
                            }
                            if (a) {
                                rx = sL(a.nextSibling), r = "F!" === a.data;
                                break e
                            }
                        }
                        rR(r)
                    }
                    r = !1
                }
                r && (t = n[0])
            }
        }
        return (n = ln()).memoizedState = n.baseState = t, r = {
            pending: null,
            lanes: 0,
            dispatch: null,
            lastRenderedReducer: lT,
            lastRenderedState: t
        }, n.queue = r, n = l4.bind(null, aQ, r), r.dispatch = n, r = ly(!1), l = l8.bind(null, aQ, !1, r.queue), r = ln(), a = {
            state: t,
            dispatch: null,
            action: e,
            pending: null
        }, r.queue = a, n = l_.bind(null, aQ, a, l, n), a.dispatch = n, r.memoizedState = e, [t, n, !1]
    }

    function lC(e) {
        return lN(lr(), aG, e)
    }

    function lN(e, t, n) {
        if (t = lc(e, t, lT)[0], e = ls(lu)[0], "object" == typeof t && null !== t && "function" == typeof t.then) try {
            var r = ll(t)
        } catch (e) {
            if (e === an) throw aa;
            throw e
        } else r = t;
        var a = (t = lr()).queue,
            l = a.dispatch;
        return n !== t.memoizedState && (aQ.flags |= 2048, lL(9, {
            destroy: void 0
        }, lR.bind(null, a, n), null)), [r, l, e]
    }

    function lR(e, t) {
        e.action = t
    }

    function lA(e) {
        var t = lr(),
            n = aG;
        if (null !== n) return lN(t, n, e);
        lr(), t = t.memoizedState;
        var r = (n = lr()).queue.dispatch;
        return n.memoizedState = e, [t, r, !1]
    }

    function lL(e, t, n, r) {
        return e = {
            tag: e,
            create: n,
            deps: r,
            inst: t,
            next: null
        }, null === (t = aQ.updateQueue) && (t = la(), aQ.updateQueue = t), null === (n = t.lastEffect) ? t.lastEffect = e.next = e : (r = n.next, n.next = e, e.next = r, t.lastEffect = e), e
    }

    function lO() {
        return lr().memoizedState
    }

    function lI(e, t, n, r) {
        var a = ln();
        aQ.flags |= e, a.memoizedState = lL(1 | t, {
            destroy: void 0
        }, n, void 0 === r ? null : r)
    }

    function lD(e, t, n, r) {
        var a = lr();
        r = void 0 === r ? null : r;
        var l = a.memoizedState.inst;
        null !== aG && null !== r && a4(r, aG.memoizedState.deps) ? a.memoizedState = lL(t, l, n, r) : (aQ.flags |= e, a.memoizedState = lL(1 | t, l, n, r))
    }

    function lM(e, t) {
        lI(8390656, 8, e, t)
    }

    function lz(e, t) {
        lD(2048, 8, e, t)
    }

    function lF(e) {
        var t = lr().memoizedState,
            n = {
                ref: t,
                nextImpl: e
            };
        aQ.flags |= 4;
        var r = aQ.updateQueue;
        if (null === r) r = la(), aQ.updateQueue = r, r.events = [n];
        else {
            var a = r.events;
            null === a ? r.events = [n] : a.push(n)
        }
        return function() {
            if (0 != (2 & iD)) throw Error(u(440));
            return t.impl.apply(void 0, arguments)
        }
    }

    function lj(e, t) {
        return lD(4, 2, e, t)
    }

    function lU(e, t) {
        return lD(4, 4, e, t)
    }

    function lB(e, t) {
        if ("function" == typeof t) {
            var n = t(e = e());
            return function() {
                "function" == typeof n ? n() : t(null)
            }
        }
        if (null != t) return t.current = e = e(),
            function() {
                t.current = null
            }
    }

    function lH(e, t, n) {
        n = null != n ? n.concat([e]) : null, lD(4, 4, lB.bind(null, t, e), n)
    }

    function lq() {}

    function lW(e, t) {
        var n = lr();
        t = void 0 === t ? null : t;
        var r = n.memoizedState;
        return null !== t && a4(t, r[1]) ? r[0] : (n.memoizedState = [e, t], e)
    }

    function l$(e, t) {
        var n = lr();
        t = void 0 === t ? null : t;
        var r = n.memoizedState;
        return null !== t && a4(t, r[1]) ? r[0] : (n.memoizedState = [r = e(), t], r)
    }

    function lV(e, t, n) {
        return void 0 === n || 0 != (0x40000000 & aV) && 0 == (261930 & iF) ? e.memoizedState = t : (e.memoizedState = n, e = ul(), aQ.lanes |= e, iV |= e, n)
    }

    function lQ(e, t, n, r) {
        return nk(n, t) ? n : null !== aL.current ? (nk(e = lV(e, n, r), t) || (oy = !0), e) : 0 == (42 & aV) || 0 != (0x40000000 & aV) && 0 == (261930 & iF) ? (oy = !0, e.memoizedState = n) : (e = ul(), aQ.lanes |= e, iV |= e, t)
    }

    function lG(e, t, n, r, a) {
        var l = D.p;
        D.p = 0 !== l && 8 > l ? l : 8;
        var o = I.T,
            i = {};
        I.T = i, l8(e, !1, t, n);
        try {
            var u = a(),
                s = I.S;
            if (null !== s && s(i, u), null !== u && "object" == typeof u && "function" == typeof u.then) {
                var c, d, f = (c = [], d = {
                    status: "pending",
                    value: null,
                    reason: null,
                    then: function(e) {
                        c.push(e)
                    }
                }, u.then(function() {
                    d.status = "fulfilled", d.value = r;
                    for (var e = 0; e < c.length; e++)(0, c[e])(r)
                }, function(e) {
                    for (d.status = "rejected", d.reason = e, e = 0; e < c.length; e++)(0, c[e])(void 0)
                }), d);
                l6(e, t, f, ua())
            } else l6(e, t, r, ua())
        } catch (n) {
            l6(e, t, {
                then: function() {},
                status: "rejected",
                reason: n
            }, ua())
        } finally {
            D.p = l, null !== o && null !== i.types && (o.types = i.types), I.T = o
        }
    }

    function lY() {}

    function lX(e, t, n, r) {
        if (5 !== e.tag) throw Error(u(476));
        var a = lK(e).queue;
        lG(e, a, t, M, null === n ? lY : function() {
            return lJ(e), n(r)
        })
    }

    function lK(e) {
        var t = e.memoizedState;
        if (null !== t) return t;
        var n = {};
        return (t = {
            memoizedState: M,
            baseState: M,
            baseQueue: null,
            queue: {
                pending: null,
                lanes: 0,
                dispatch: null,
                lastRenderedReducer: lu,
                lastRenderedState: M
            },
            next: null
        }).next = {
            memoizedState: n,
            baseState: n,
            baseQueue: null,
            queue: {
                pending: null,
                lanes: 0,
                dispatch: null,
                lastRenderedReducer: lu,
                lastRenderedState: n
            },
            next: null
        }, e.memoizedState = t, null !== (e = e.alternate) && (e.memoizedState = t), t
    }

    function lJ(e) {
        var t = lK(e);
        null === t.next && (t = e.alternate.memoizedState), l6(e, t.next.queue, {}, ua())
    }

    function lZ() {
        return rQ(s7)
    }

    function l0() {
        return lr().memoizedState
    }

    function l1() {
        return lr().memoizedState
    }

    function l2(e) {
        for (var t = e.return; null !== t;) {
            switch (t.tag) {
                case 24:
                case 3:
                    var n = ua(),
                        r = ak(t, e = aE(n), n);
                    null !== r && (uo(r, t, n), ax(r, t, n)), t = {
                        cache: r0()
                    }, e.payload = t;
                    return
            }
            t = t.return
        }
    }

    function l3(e, t, n) {
        var r = ua();
        n = {
            lane: r,
            revertLane: 0,
            gesture: null,
            action: n,
            hasEagerState: !1,
            eagerState: null,
            next: null
        }, l5(e) ? l9(t, n) : null !== (n = n3(e, t, n, r)) && (uo(n, e, r), l7(n, t, r))
    }

    function l4(e, t, n) {
        l6(e, t, n, ua())
    }

    function l6(e, t, n, r) {
        var a = {
            lane: r,
            revertLane: 0,
            gesture: null,
            action: n,
            hasEagerState: !1,
            eagerState: null,
            next: null
        };
        if (l5(e)) l9(t, a);
        else {
            var l = e.alternate;
            if (0 === e.lanes && (null === l || 0 === l.lanes) && null !== (l = t.lastRenderedReducer)) try {
                var o = t.lastRenderedState,
                    i = l(o, n);
                if (a.hasEagerState = !0, a.eagerState = i, nk(i, o)) return n2(e, t, a, 0), null === iM && n1(), !1
            } catch (e) {} finally {}
            if (null !== (n = n3(e, t, a, r))) return uo(n, e, r), l7(n, t, r), !0
        }
        return !1
    }

    function l8(e, t, n, r) {
        if (r = {
                lane: 2,
                revertLane: uK(),
                gesture: null,
                action: r,
                hasEagerState: !1,
                eagerState: null,
                next: null
            }, l5(e)) {
            if (t) throw Error(u(479))
        } else null !== (t = n3(e, n, r, 2)) && uo(t, e, 2)
    }

    function l5(e) {
        var t = e.alternate;
        return e === aQ || null !== t && t === aQ
    }

    function l9(e, t) {
        aK = aX = !0;
        var n = e.pending;
        null === n ? t.next = t : (t.next = n.next, n.next = t), e.pending = t
    }

    function l7(e, t, n) {
        if (0 != (4194048 & n)) {
            var r = t.lanes;
            r &= e.pendingLanes, t.lanes = n |= r, eP(e, n)
        }
    }
    var oe = {
        readContext: rQ,
        use: lo,
        useCallback: a3,
        useContext: a3,
        useEffect: a3,
        useImperativeHandle: a3,
        useLayoutEffect: a3,
        useInsertionEffect: a3,
        useMemo: a3,
        useReducer: a3,
        useRef: a3,
        useState: a3,
        useDebugValue: a3,
        useDeferredValue: a3,
        useTransition: a3,
        useSyncExternalStore: a3,
        useId: a3,
        useHostTransitionStatus: a3,
        useFormState: a3,
        useActionState: a3,
        useOptimistic: a3,
        useMemoCache: a3,
        useCacheRefresh: a3
    };
    oe.useEffectEvent = a3;
    var ot = {
            readContext: rQ,
            use: lo,
            useCallback: function(e, t) {
                return ln().memoizedState = [e, void 0 === t ? null : t], e
            },
            useContext: rQ,
            useEffect: lM,
            useImperativeHandle: function(e, t, n) {
                n = null != n ? n.concat([e]) : null, lI(4194308, 4, lB.bind(null, t, e), n)
            },
            useLayoutEffect: function(e, t) {
                return lI(4194308, 4, e, t)
            },
            useInsertionEffect: function(e, t) {
                lI(4, 2, e, t)
            },
            useMemo: function(e, t) {
                var n = ln();
                t = void 0 === t ? null : t;
                var r = e();
                return n.memoizedState = [r, t], r
            },
            useReducer: function(e, t, n) {
                var r = ln();
                if (void 0 !== n) var a = n(t);
                else a = t;
                return r.memoizedState = r.baseState = a, r.queue = e = {
                    pending: null,
                    lanes: 0,
                    dispatch: null,
                    lastRenderedReducer: e,
                    lastRenderedState: a
                }, e = e.dispatch = l3.bind(null, aQ, e), [r.memoizedState, e]
            },
            useRef: function(e) {
                return ln().memoizedState = {
                    current: e
                }
            },
            useState: function(e) {
                var t = (e = ly(e)).queue,
                    n = l4.bind(null, aQ, t);
                return t.dispatch = n, [e.memoizedState, n]
            },
            useDebugValue: lq,
            useDeferredValue: function(e, t) {
                return lV(ln(), e, t)
            },
            useTransition: function() {
                var e = ly(!1);
                return e = lG.bind(null, aQ, e.queue, !0, !1), ln().memoizedState = e, [!1, e]
            },
            useSyncExternalStore: function(e, t, n) {
                var r = aQ,
                    a = ln();
                if (rT) {
                    if (void 0 === n) throw Error(u(407));
                    n = n()
                } else {
                    if (n = t(), null === iM) throw Error(u(349));
                    0 != (127 & iF) || lp(r, t, n)
                }
                a.memoizedState = n;
                var l = {
                    value: n,
                    getSnapshot: t
                };
                return a.queue = l, lM(lm.bind(null, r, l, e), [e]), r.flags |= 2048, lL(9, {
                    destroy: void 0
                }, lh.bind(null, r, l, n, t), null), n
            },
            useId: function() {
                var e = ln(),
                    t = iM.identifierPrefix;
                if (rT) {
                    var n = ry,
                        r = rv;
                    t = "_" + t + "R_" + (n = (r & ~(1 << 32 - eh(r) - 1)).toString(32) + n), 0 < (n = aZ++) && (t += "H" + n.toString(32)), t += "_"
                } else t = "_" + t + "r_" + (n = a2++).toString(32) + "_";
                return e.memoizedState = t
            },
            useHostTransitionStatus: lZ,
            useFormState: lP,
            useActionState: lP,
            useOptimistic: function(e) {
                var t = ln();
                t.memoizedState = t.baseState = e;
                var n = {
                    pending: null,
                    lanes: 0,
                    dispatch: null,
                    lastRenderedReducer: null,
                    lastRenderedState: null
                };
                return t.queue = n, t = l8.bind(null, aQ, !0, n), n.dispatch = t, [e, t]
            },
            useMemoCache: li,
            useCacheRefresh: function() {
                return ln().memoizedState = l2.bind(null, aQ)
            },
            useEffectEvent: function(e) {
                var t = ln(),
                    n = {
                        impl: e
                    };
                return t.memoizedState = n,
                    function() {
                        if (0 != (2 & iD)) throw Error(u(440));
                        return n.impl.apply(void 0, arguments)
                    }
            }
        },
        on = {
            readContext: rQ,
            use: lo,
            useCallback: lW,
            useContext: rQ,
            useEffect: lz,
            useImperativeHandle: lH,
            useInsertionEffect: lj,
            useLayoutEffect: lU,
            useMemo: l$,
            useReducer: ls,
            useRef: lO,
            useState: function() {
                return ls(lu)
            },
            useDebugValue: lq,
            useDeferredValue: function(e, t) {
                return lQ(lr(), aG.memoizedState, e, t)
            },
            useTransition: function() {
                var e = ls(lu)[0],
                    t = lr().memoizedState;
                return ["boolean" == typeof e ? e : ll(e), t]
            },
            useSyncExternalStore: lf,
            useId: l0,
            useHostTransitionStatus: lZ,
            useFormState: lC,
            useActionState: lC,
            useOptimistic: function(e, t) {
                return lb(lr(), aG, e, t)
            },
            useMemoCache: li,
            useCacheRefresh: l1
        };
    on.useEffectEvent = lF;
    var or = {
        readContext: rQ,
        use: lo,
        useCallback: lW,
        useContext: rQ,
        useEffect: lz,
        useImperativeHandle: lH,
        useInsertionEffect: lj,
        useLayoutEffect: lU,
        useMemo: l$,
        useReducer: ld,
        useRef: lO,
        useState: function() {
            return ld(lu)
        },
        useDebugValue: lq,
        useDeferredValue: function(e, t) {
            var n = lr();
            return null === aG ? lV(n, e, t) : lQ(n, aG.memoizedState, e, t)
        },
        useTransition: function() {
            var e = ld(lu)[0],
                t = lr().memoizedState;
            return ["boolean" == typeof e ? e : ll(e), t]
        },
        useSyncExternalStore: lf,
        useId: l0,
        useHostTransitionStatus: lZ,
        useFormState: lA,
        useActionState: lA,
        useOptimistic: function(e, t) {
            var n = lr();
            return null !== aG ? lb(n, aG, e, t) : (n.baseState = e, [e, n.queue.dispatch])
        },
        useMemoCache: li,
        useCacheRefresh: l1
    };

    function oa(e, t, n, r) {
        n = null == (n = n(r, t = e.memoizedState)) ? t : h({}, t, n), e.memoizedState = n, 0 === e.lanes && (e.updateQueue.baseState = n)
    }
    or.useEffectEvent = lF;
    var ol = {
        enqueueSetState: function(e, t, n) {
            e = e._reactInternals;
            var r = ua(),
                a = aE(r);
            a.payload = t, null != n && (a.callback = n), null !== (t = ak(e, a, r)) && (uo(t, e, r), ax(t, e, r))
        },
        enqueueReplaceState: function(e, t, n) {
            e = e._reactInternals;
            var r = ua(),
                a = aE(r);
            a.tag = 1, a.payload = t, null != n && (a.callback = n), null !== (t = ak(e, a, r)) && (uo(t, e, r), ax(t, e, r))
        },
        enqueueForceUpdate: function(e, t) {
            e = e._reactInternals;
            var n = ua(),
                r = aE(n);
            r.tag = 2, null != t && (r.callback = t), null !== (t = ak(e, r, n)) && (uo(t, e, n), ax(t, e, n))
        }
    };

    function oo(e, t, n, r, a, l, o) {
        return "function" == typeof(e = e.stateNode).shouldComponentUpdate ? e.shouldComponentUpdate(r, l, o) : !t.prototype || !t.prototype.isPureReactComponent || !nx(n, r) || !nx(a, l)
    }

    function oi(e, t, n, r) {
        e = t.state, "function" == typeof t.componentWillReceiveProps && t.componentWillReceiveProps(n, r), "function" == typeof t.UNSAFE_componentWillReceiveProps && t.UNSAFE_componentWillReceiveProps(n, r), t.state !== e && ol.enqueueReplaceState(t, t.state, null)
    }

    function ou(e, t) {
        var n = t;
        if ("ref" in t)
            for (var r in n = {}, t) "ref" !== r && (n[r] = t[r]);
        if (e = e.defaultProps)
            for (var a in n === t && (n = h({}, n)), e) void 0 === n[a] && (n[a] = e[a]);
        return n
    }

    function os(e) {
        nK(e)
    }

    function oc(e) {
        console.error(e)
    }

    function od(e) {
        nK(e)
    }

    function of(e, t) {
        try {
            (0, e.onUncaughtError)(t.value, {
                componentStack: t.stack
            })
        } catch (e) {
            setTimeout(function() {
                throw e
            })
        }
    }

    function op(e, t, n) {
        try {
            (0, e.onCaughtError)(n.value, {
                componentStack: n.stack,
                errorBoundary: 1 === t.tag ? t.stateNode : null
            })
        } catch (e) {
            setTimeout(function() {
                throw e
            })
        }
    }

    function oh(e, t, n) {
        return (n = aE(n)).tag = 3, n.payload = {
            element: null
        }, n.callback = function() {
            of(e, t)
        }, n
    }

    function om(e) {
        return (e = aE(e)).tag = 3, e
    }

    function og(e, t, n, r) {
        var a = n.type.getDerivedStateFromError;
        if ("function" == typeof a) {
            var l = r.value;
            e.payload = function() {
                return a(l)
            }, e.callback = function() {
                op(t, n, r)
            }
        }
        var o = n.stateNode;
        null !== o && "function" == typeof o.componentDidCatch && (e.callback = function() {
            op(t, n, r), "function" != typeof a && (null === i4 ? i4 = new Set([this]) : i4.add(this));
            var e = r.stack;
            this.componentDidCatch(r.value, {
                componentStack: null !== e ? e : ""
            })
        })
    }
    var ov = Error(u(461)),
        oy = !1;

    function ob(e, t, n, r) {
        t.child = null === e ? ab(t, null, n, r) : ay(t, e.child, n, r)
    }

    function o_(e, t, n, r, a) {
        n = n.render;
        var l = t.ref;
        if ("ref" in r) {
            var o = {};
            for (var i in r) "ref" !== i && (o[i] = r[i])
        } else o = r;
        return (rV(t), r = a6(e, t, n, o, l, a), i = a7(), null === e || oy) ? (rT && i && rS(t), t.flags |= 1, ob(e, t, r, a), t.child) : (le(e, t, a), oq(e, t, a))
    }

    function oS(e, t, n, r, a) {
        if (null === e) {
            var l = n.type;
            return "function" != typeof l || re(l) || void 0 !== l.defaultProps || null !== n.compare ? ((e = rr(n.type, null, r, t, t.mode, a)).ref = t.ref, e.return = t, t.child = e) : (t.tag = 15, t.type = l, ow(e, t, l, r, a))
        }
        if (l = e.child, !oW(e, a)) {
            var o = l.memoizedProps;
            if ((n = null !== (n = n.compare) ? n : nx)(o, r) && e.ref === t.ref) return oq(e, t, a)
        }
        return t.flags |= 1, (e = rt(l, r)).ref = t.ref, e.return = t, t.child = e
    }

    function ow(e, t, n, r, a) {
        if (null !== e) {
            var l = e.memoizedProps;
            if (nx(l, r) && e.ref === t.ref)
                if (oy = !1, t.pendingProps = r = l, !oW(e, a)) return t.lanes = e.lanes, oq(e, t, a);
                else 0 != (131072 & e.flags) && (oy = !0)
        }
        return oN(e, t, n, r, a)
    }

    function oE(e, t, n, r) {
        var a = r.children,
            l = null !== e ? e.memoizedState : null;
        if (null === e && null === t.stateNode && (t.stateNode = {
                _visibility: 1,
                _pendingMarkers: null,
                _retryCache: null,
                _transitions: null
            }), "hidden" === r.mode) {
            if (0 != (128 & t.flags)) {
                if (l = null !== l ? l.baseLanes | n : n, null !== e) {
                    for (r = t.child = e.child, a = 0; null !== r;) a = a | r.lanes | r.childLanes, r = r.sibling;
                    r = a & ~l
                } else r = 0, t.child = null;
                return ox(e, t, l, n, r)
            }
            if (0 == (0x20000000 & n)) return r = t.lanes = 0x20000000, ox(e, t, null !== l ? l.baseLanes | n : n, n, r);
            t.memoizedState = {
                baseLanes: 0,
                cachePool: null
            }, null !== e && ae(t, null !== l ? l.cachePool : null), null !== l ? aI(t, l) : aD(), aB(t)
        } else null !== l ? (ae(t, l.cachePool), aI(t, l), aH(), t.memoizedState = null) : (null !== e && ae(t, null), aD(), aH());
        return ob(e, t, a, n), t.child
    }

    function ok(e, t) {
        return null !== e && 22 === e.tag || null !== t.stateNode || (t.stateNode = {
            _visibility: 1,
            _pendingMarkers: null,
            _retryCache: null,
            _transitions: null
        }), t.sibling
    }

    function ox(e, t, n, r, a) {
        var l = r7();
        return t.memoizedState = {
            baseLanes: n,
            cachePool: l = null === l ? null : {
                parent: rZ._currentValue,
                pool: l
            }
        }, null !== e && ae(t, null), aD(), aB(t), null !== e && rW(e, t, r, !0), t.childLanes = a, null
    }

    function oT(e, t) {
        return (t = oF({
            mode: t.mode,
            children: t.children
        }, e.mode)).ref = e.ref, e.child = t, t.return = e, t
    }

    function oP(e, t, n) {
        return ay(t, e.child, null, n), e = oT(t, t.pendingProps), e.flags |= 2, aq(t), t.memoizedState = null, e
    }

    function oC(e, t) {
        var n = t.ref;
        if (null === n) null !== e && null !== e.ref && (t.flags |= 4194816);
        else {
            if ("function" != typeof n && "object" != typeof n) throw Error(u(284));
            (null === e || e.ref !== n) && (t.flags |= 4194816)
        }
    }

    function oN(e, t, n, r, a) {
        return (rV(t), n = a6(e, t, n, r, void 0, a), r = a7(), null === e || oy) ? (rT && r && rS(t), t.flags |= 1, ob(e, t, n, a), t.child) : (le(e, t, a), oq(e, t, a))
    }

    function oR(e, t, n, r, a, l) {
        return (rV(t), t.updateQueue = null, n = a5(t, r, n, a), a8(e), r = a7(), null === e || oy) ? (rT && r && rS(t), t.flags |= 1, ob(e, t, n, l), t.child) : (le(e, t, l), oq(e, t, l))
    }

    function oA(e, t, n, r, a) {
        if (rV(t), null === t.stateNode) {
            var l = n5,
                o = n.contextType;
            "object" == typeof o && null !== o && (l = rQ(o)), t.memoizedState = null !== (l = new n(r, l)).state && void 0 !== l.state ? l.state : null, l.updater = ol, t.stateNode = l, l._reactInternals = t, (l = t.stateNode).props = r, l.state = t.memoizedState, l.refs = {}, aS(t), o = n.contextType, l.context = "object" == typeof o && null !== o ? rQ(o) : n5, l.state = t.memoizedState, "function" == typeof(o = n.getDerivedStateFromProps) && (oa(t, n, o, r), l.state = t.memoizedState), "function" == typeof n.getDerivedStateFromProps || "function" == typeof l.getSnapshotBeforeUpdate || "function" != typeof l.UNSAFE_componentWillMount && "function" != typeof l.componentWillMount || (o = l.state, "function" == typeof l.componentWillMount && l.componentWillMount(), "function" == typeof l.UNSAFE_componentWillMount && l.UNSAFE_componentWillMount(), o !== l.state && ol.enqueueReplaceState(l, l.state, null), aN(t, r, l, a), aC(), l.state = t.memoizedState), "function" == typeof l.componentDidMount && (t.flags |= 4194308), r = !0
        } else if (null === e) {
            l = t.stateNode;
            var i = t.memoizedProps,
                u = ou(n, i);
            l.props = u;
            var s = l.context,
                c = n.contextType;
            o = n5, "object" == typeof c && null !== c && (o = rQ(c));
            var d = n.getDerivedStateFromProps;
            c = "function" == typeof d || "function" == typeof l.getSnapshotBeforeUpdate, i = t.pendingProps !== i, c || "function" != typeof l.UNSAFE_componentWillReceiveProps && "function" != typeof l.componentWillReceiveProps || (i || s !== o) && oi(t, l, r, o), a_ = !1;
            var f = t.memoizedState;
            l.state = f, aN(t, r, l, a), aC(), s = t.memoizedState, i || f !== s || a_ ? ("function" == typeof d && (oa(t, n, d, r), s = t.memoizedState), (u = a_ || oo(t, n, u, r, f, s, o)) ? (c || "function" != typeof l.UNSAFE_componentWillMount && "function" != typeof l.componentWillMount || ("function" == typeof l.componentWillMount && l.componentWillMount(), "function" == typeof l.UNSAFE_componentWillMount && l.UNSAFE_componentWillMount()), "function" == typeof l.componentDidMount && (t.flags |= 4194308)) : ("function" == typeof l.componentDidMount && (t.flags |= 4194308), t.memoizedProps = r, t.memoizedState = s), l.props = r, l.state = s, l.context = o, r = u) : ("function" == typeof l.componentDidMount && (t.flags |= 4194308), r = !1)
        } else {
            l = t.stateNode, aw(e, t), c = ou(n, o = t.memoizedProps), l.props = c, d = t.pendingProps, f = l.context, s = n.contextType, u = n5, "object" == typeof s && null !== s && (u = rQ(s)), (s = "function" == typeof(i = n.getDerivedStateFromProps) || "function" == typeof l.getSnapshotBeforeUpdate) || "function" != typeof l.UNSAFE_componentWillReceiveProps && "function" != typeof l.componentWillReceiveProps || (o !== d || f !== u) && oi(t, l, r, u), a_ = !1, f = t.memoizedState, l.state = f, aN(t, r, l, a), aC();
            var p = t.memoizedState;
            o !== d || f !== p || a_ || null !== e && null !== e.dependencies && r$(e.dependencies) ? ("function" == typeof i && (oa(t, n, i, r), p = t.memoizedState), (c = a_ || oo(t, n, c, r, f, p, u) || null !== e && null !== e.dependencies && r$(e.dependencies)) ? (s || "function" != typeof l.UNSAFE_componentWillUpdate && "function" != typeof l.componentWillUpdate || ("function" == typeof l.componentWillUpdate && l.componentWillUpdate(r, p, u), "function" == typeof l.UNSAFE_componentWillUpdate && l.UNSAFE_componentWillUpdate(r, p, u)), "function" == typeof l.componentDidUpdate && (t.flags |= 4), "function" == typeof l.getSnapshotBeforeUpdate && (t.flags |= 1024)) : ("function" != typeof l.componentDidUpdate || o === e.memoizedProps && f === e.memoizedState || (t.flags |= 4), "function" != typeof l.getSnapshotBeforeUpdate || o === e.memoizedProps && f === e.memoizedState || (t.flags |= 1024), t.memoizedProps = r, t.memoizedState = p), l.props = r, l.state = p, l.context = u, r = c) : ("function" != typeof l.componentDidUpdate || o === e.memoizedProps && f === e.memoizedState || (t.flags |= 4), "function" != typeof l.getSnapshotBeforeUpdate || o === e.memoizedProps && f === e.memoizedState || (t.flags |= 1024), r = !1)
        }
        return l = r, oC(e, t), r = 0 != (128 & t.flags), l || r ? (l = t.stateNode, n = r && "function" != typeof n.getDerivedStateFromError ? null : l.render(), t.flags |= 1, null !== e && r ? (t.child = ay(t, e.child, null, a), t.child = ay(t, null, n, a)) : ob(e, t, n, a), t.memoizedState = l.state, e = t.child) : e = oq(e, t, a), e
    }

    function oL(e, t, n, r) {
        return rI(), t.flags |= 256, ob(e, t, n, r), t.child
    }
    var oO = {
        dehydrated: null,
        treeContext: null,
        retryLane: 0,
        hydrationErrors: null
    };

    function oI(e) {
        return {
            baseLanes: e,
            cachePool: at()
        }
    }

    function oD(e, t, n) {
        return e = null !== e ? e.childLanes & ~n : 0, t && (e |= iY), e
    }

    function oM(e, t, n) {
        var r, a = t.pendingProps,
            l = !1,
            o = 0 != (128 & t.flags);
        if ((r = o) || (r = (null === e || null !== e.memoizedState) && 0 != (2 & aW.current)), r && (l = !0, t.flags &= -129), r = 0 != (32 & t.flags), t.flags &= -33, null === e) {
            if (rT) {
                if (l ? aj(t) : aH(), (e = rx) ? null !== (e = null !== (e = sN(e, rC)) && "&" !== e.data ? e : null) && (t.memoizedState = {
                        dehydrated: e,
                        treeContext: null !== rg ? {
                            id: rv,
                            overflow: ry
                        } : null,
                        retryLane: 0x20000000,
                        hydrationErrors: null
                    }, (n = ro(e)).return = t, t.child = n, rk = t, rx = null) : e = null, null === e) throw rR(t);
                return sA(e) ? t.lanes = 32 : t.lanes = 0x20000000, null
            }
            var i = a.children;
            return (a = a.fallback, l) ? (aH(), i = oF({
                mode: "hidden",
                children: i
            }, l = t.mode), a = ra(a, l, n, null), i.return = t, a.return = t, i.sibling = a, t.child = i, (a = t.child).memoizedState = oI(n), a.childLanes = oD(e, r, n), t.memoizedState = oO, ok(null, a)) : (aj(t), oz(t, i))
        }
        var s = e.memoizedState;
        if (null !== s && null !== (i = s.dehydrated)) {
            if (o) 256 & t.flags ? (aj(t), t.flags &= -257, t = oj(e, t, n)) : null !== t.memoizedState ? (aH(), t.child = e.child, t.flags |= 128, t = null) : (aH(), i = a.fallback, l = t.mode, a = oF({
                mode: "visible",
                children: a.children
            }, l), i = ra(i, l, n, null), i.flags |= 2, a.return = t, i.return = t, a.sibling = i, t.child = a, ay(t, e.child, null, n), (a = t.child).memoizedState = oI(n), a.childLanes = oD(e, r, n), t.memoizedState = oO, t = ok(null, a));
            else if (aj(t), sA(i)) {
                if (r = i.nextSibling && i.nextSibling.dataset) var c = r.dgst;
                r = c, (a = Error(u(419))).stack = "", a.digest = r, rM({
                    value: a,
                    source: null,
                    stack: null
                }), t = oj(e, t, n)
            } else if (oy || rW(e, t, n, !1), r = 0 != (n & e.childLanes), oy || r) {
                if (null !== (r = iM) && 0 !== (a = eC(r, n)) && a !== s.retryLane) throw s.retryLane = a, n4(e, a), uo(r, e, a), ov;
                sR(i) || uv(), t = oj(e, t, n)
            } else sR(i) ? (t.flags |= 192, t.child = e.child, t = null) : (e = s.treeContext, rx = sL(i.nextSibling), rk = t, rT = !0, rP = null, rC = !1, null !== e && rE(t, e), t = oz(t, a.children), t.flags |= 4096);
            return t
        }
        return l ? (aH(), i = a.fallback, l = t.mode, c = (s = e.child).sibling, (a = rt(s, {
            mode: "hidden",
            children: a.children
        })).subtreeFlags = 0x3e00000 & s.subtreeFlags, null !== c ? i = rt(c, i) : (i = ra(i, l, n, null), i.flags |= 2), i.return = t, a.return = t, a.sibling = i, t.child = a, ok(null, a), a = t.child, null === (i = e.child.memoizedState) ? i = oI(n) : (null !== (l = i.cachePool) ? (s = rZ._currentValue, l = l.parent !== s ? {
            parent: s,
            pool: s
        } : l) : l = at(), i = {
            baseLanes: i.baseLanes | n,
            cachePool: l
        }), a.memoizedState = i, a.childLanes = oD(e, r, n), t.memoizedState = oO, ok(e.child, a)) : (aj(t), e = (n = e.child).sibling, (n = rt(n, {
            mode: "visible",
            children: a.children
        })).return = t, n.sibling = null, null !== e && (null === (r = t.deletions) ? (t.deletions = [e], t.flags |= 16) : r.push(e)), t.child = n, t.memoizedState = null, n)
    }

    function oz(e, t) {
        return (t = oF({
            mode: "visible",
            children: t
        }, e.mode)).return = e, e.child = t
    }

    function oF(e, t) {
        return (e = n7(22, e, null, t)).lanes = 0, e
    }

    function oj(e, t, n) {
        return ay(t, e.child, null, n), e = oz(t, t.pendingProps.children), e.flags |= 2, t.memoizedState = null, e
    }

    function oU(e, t, n) {
        e.lanes |= t;
        var r = e.alternate;
        null !== r && (r.lanes |= t), rH(e.return, t, n)
    }

    function oB(e, t, n, r, a, l) {
        var o = e.memoizedState;
        null === o ? e.memoizedState = {
            isBackwards: t,
            rendering: null,
            renderingStartTime: 0,
            last: r,
            tail: n,
            tailMode: a,
            treeForkCount: l
        } : (o.isBackwards = t, o.rendering = null, o.renderingStartTime = 0, o.last = r, o.tail = n, o.tailMode = a, o.treeForkCount = l)
    }

    function oH(e, t, n) {
        var r = t.pendingProps,
            a = r.revealOrder,
            l = r.tail;
        r = r.children;
        var o = aW.current,
            i = 0 != (2 & o);
        if (i ? (o = 1 & o | 2, t.flags |= 128) : o &= 1, B(aW, o), ob(e, t, r, n), r = rT ? rp : 0, !i && null !== e && 0 != (128 & e.flags)) e: for (e = t.child; null !== e;) {
            if (13 === e.tag) null !== e.memoizedState && oU(e, n, t);
            else if (19 === e.tag) oU(e, n, t);
            else if (null !== e.child) {
                e.child.return = e, e = e.child;
                continue
            }
            if (e === t) break;
            for (; null === e.sibling;) {
                if (null === e.return || e.return === t) break e;
                e = e.return
            }
            e.sibling.return = e.return, e = e.sibling
        }
        switch (a) {
            case "forwards":
                for (n = t.child, a = null; null !== n;) null !== (e = n.alternate) && null === a$(e) && (a = n), n = n.sibling;
                null === (n = a) ? (a = t.child, t.child = null) : (a = n.sibling, n.sibling = null), oB(t, !1, a, n, l, r);
                break;
            case "backwards":
            case "unstable_legacy-backwards":
                for (n = null, a = t.child, t.child = null; null !== a;) {
                    if (null !== (e = a.alternate) && null === a$(e)) {
                        t.child = a;
                        break
                    }
                    e = a.sibling, a.sibling = n, n = a, a = e
                }
                oB(t, !0, n, null, l, r);
                break;
            case "together":
                oB(t, !1, null, null, void 0, r);
                break;
            default:
                t.memoizedState = null
        }
        return t.child
    }

    function oq(e, t, n) {
        if (null !== e && (t.dependencies = e.dependencies), iV |= t.lanes, 0 == (n & t.childLanes)) {
            if (null === e) return null;
            else if (rW(e, t, n, !1), 0 == (n & t.childLanes)) return null
        }
        if (null !== e && t.child !== e.child) throw Error(u(153));
        if (null !== t.child) {
            for (n = rt(e = t.child, e.pendingProps), t.child = n, n.return = t; null !== e.sibling;) e = e.sibling, (n = n.sibling = rt(e, e.pendingProps)).return = t;
            n.sibling = null
        }
        return t.child
    }

    function oW(e, t) {
        return 0 != (e.lanes & t) || !!(null !== (e = e.dependencies) && r$(e))
    }

    function o$(e, t, n) {
        if (null !== e)
            if (e.memoizedProps !== t.pendingProps) oy = !0;
            else {
                if (!oW(e, n) && 0 == (128 & t.flags)) return oy = !1,
                    function(e, t, n) {
                        switch (t.tag) {
                            case 3:
                                V(t, t.stateNode.containerInfo), rU(t, rZ, e.memoizedState.cache), rI();
                                break;
                            case 27:
                            case 5:
                                G(t);
                                break;
                            case 4:
                                V(t, t.stateNode.containerInfo);
                                break;
                            case 10:
                                rU(t, t.type, t.memoizedProps.value);
                                break;
                            case 31:
                                if (null !== t.memoizedState) return t.flags |= 128, aU(t), null;
                                break;
                            case 13:
                                var r = t.memoizedState;
                                if (null !== r) {
                                    if (null !== r.dehydrated) return aj(t), t.flags |= 128, null;
                                    if (0 != (n & t.child.childLanes)) return oM(e, t, n);
                                    return aj(t), null !== (e = oq(e, t, n)) ? e.sibling : null
                                }
                                aj(t);
                                break;
                            case 19:
                                var a = 0 != (128 & e.flags);
                                if ((r = 0 != (n & t.childLanes)) || (rW(e, t, n, !1), r = 0 != (n & t.childLanes)), a) {
                                    if (r) return oH(e, t, n);
                                    t.flags |= 128
                                }
                                if (null !== (a = t.memoizedState) && (a.rendering = null, a.tail = null, a.lastEffect = null), B(aW, aW.current), !r) return null;
                                break;
                            case 22:
                                return t.lanes = 0, oE(e, t, n, t.pendingProps);
                            case 24:
                                rU(t, rZ, e.memoizedState.cache)
                        }
                        return oq(e, t, n)
                    }(e, t, n);
                oy = 0 != (131072 & e.flags)
            }
        else oy = !1, rT && 0 != (1048576 & t.flags) && r_(t, rp, t.index);
        switch (t.lanes = 0, t.tag) {
            case 16:
                e: {
                    var r = t.pendingProps;
                    if (e = au(t.elementType), t.type = e, "function" == typeof e) re(e) ? (r = ou(e, r), t.tag = 1, t = oA(null, t, e, r, n)) : (t.tag = 0, t = oN(null, t, e, r, n));
                    else {
                        if (null != e) {
                            var a = e.$$typeof;
                            if (a === E) {
                                t.tag = 11, t = o_(null, t, e, r, n);
                                break e
                            }
                            if (a === T) {
                                t.tag = 14, t = oS(null, t, e, r, n);
                                break e
                            }
                        }
                        throw Error(u(306, t = function e(t) {
                            if (null == t) return null;
                            if ("function" == typeof t) return t.$$typeof === L ? null : t.displayName || t.name || null;
                            if ("string" == typeof t) return t;
                            switch (t) {
                                case y:
                                    return "Fragment";
                                case _:
                                    return "Profiler";
                                case b:
                                    return "StrictMode";
                                case k:
                                    return "Suspense";
                                case x:
                                    return "SuspenseList";
                                case C:
                                    return "Activity"
                            }
                            if ("object" == typeof t) switch (t.$$typeof) {
                                case v:
                                    return "Portal";
                                case w:
                                    return t.displayName || "Context";
                                case S:
                                    return (t._context.displayName || "Context") + ".Consumer";
                                case E:
                                    var n = t.render;
                                    return (t = t.displayName) || (t = "" !== (t = n.displayName || n.name || "") ? "ForwardRef(" + t + ")" : "ForwardRef"), t;
                                case T:
                                    return null !== (n = t.displayName || null) ? n : e(t.type) || "Memo";
                                case P:
                                    n = t._payload, t = t._init;
                                    try {
                                        return e(t(n))
                                    } catch (e) {}
                            }
                            return null
                        }(e) || e, ""))
                    }
                }
                return t;
            case 0:
                return oN(e, t, t.type, t.pendingProps, n);
            case 1:
                return a = ou(r = t.type, t.pendingProps), oA(e, t, r, a, n);
            case 3:
                e: {
                    if (V(t, t.stateNode.containerInfo), null === e) throw Error(u(387));r = t.pendingProps;
                    var l = t.memoizedState;a = l.element,
                    aw(e, t),
                    aN(t, r, null, n);
                    var o = t.memoizedState;
                    if (rU(t, rZ, r = o.cache), r !== l.cache && rq(t, [rZ], n, !0), aC(), r = o.element, l.isDehydrated)
                        if (l = {
                                element: r,
                                isDehydrated: !1,
                                cache: o.cache
                            }, t.updateQueue.baseState = l, t.memoizedState = l, 256 & t.flags) {
                            t = oL(e, t, r, n);
                            break e
                        } else if (r !== a) {
                        rM(a = rs(Error(u(424)), t)), t = oL(e, t, r, n);
                        break e
                    } else
                        for (rx = sL((e = 9 === (e = t.stateNode.containerInfo).nodeType ? e.body : "HTML" === e.nodeName ? e.ownerDocument.body : e).firstChild), rk = t, rT = !0, rP = null, rC = !0, n = ab(t, null, r, n), t.child = n; n;) n.flags = -3 & n.flags | 4096, n = n.sibling;
                    else {
                        if (rI(), r === a) {
                            t = oq(e, t, n);
                            break e
                        }
                        ob(e, t, r, n)
                    }
                    t = t.child
                }
                return t;
            case 26:
                return oC(e, t), null === e ? (n = sW(t.type, null, t.pendingProps, null)) ? t.memoizedState = n : rT || (n = t.type, e = t.pendingProps, (r = sm(W.current).createElement(n))[eI] = t, r[eD] = e, sd(r, n, e), eQ(r), t.stateNode = r) : t.memoizedState = sW(t.type, e.memoizedProps, t.pendingProps, e.memoizedState), null;
            case 27:
                return G(t), null === e && rT && (r = t.stateNode = sM(t.type, t.pendingProps, W.current), rk = t, rC = !0, a = rx, sx(t.type) ? (sO = a, rx = sL(r.firstChild)) : rx = a), ob(e, t, t.pendingProps.children, n), oC(e, t), null === e && (t.flags |= 4194304), t.child;
            case 5:
                return null === e && rT && ((a = r = rx) && (null !== (r = function(e, t, n, r) {
                    for (; 1 === e.nodeType;) {
                        if (e.nodeName.toLowerCase() !== t.toLowerCase()) {
                            if (!r && ("INPUT" !== e.nodeName || "hidden" !== e.type)) break
                        } else if (r) {
                            if (!e[eB]) switch (t) {
                                case "meta":
                                    if (!e.hasAttribute("itemprop")) break;
                                    return e;
                                case "link":
                                    if ("stylesheet" === (a = e.getAttribute("rel")) && e.hasAttribute("data-precedence") || a !== n.rel || e.getAttribute("href") !== (null == n.href || "" === n.href ? null : n.href) || e.getAttribute("crossorigin") !== (null == n.crossOrigin ? null : n.crossOrigin) || e.getAttribute("title") !== (null == n.title ? null : n.title)) break;
                                    return e;
                                case "style":
                                    if (e.hasAttribute("data-precedence")) break;
                                    return e;
                                case "script":
                                    if (((a = e.getAttribute("src")) !== (null == n.src ? null : n.src) || e.getAttribute("type") !== (null == n.type ? null : n.type) || e.getAttribute("crossorigin") !== (null == n.crossOrigin ? null : n.crossOrigin)) && a && e.hasAttribute("async") && !e.hasAttribute("itemprop")) break;
                                    return e;
                                default:
                                    return e
                            }
                        } else {
                            if ("input" !== t || "hidden" !== e.type) return e;
                            var a = null == n.name ? null : "" + n.name;
                            if ("hidden" === n.type && e.getAttribute("name") === a) return e
                        }
                        if (null === (e = sL(e.nextSibling))) break
                    }
                    return null
                }(r, t.type, t.pendingProps, rC)) ? (t.stateNode = r, rk = t, rx = sL(r.firstChild), rC = !1, a = !0) : a = !1), a || rR(t)), G(t), a = t.type, l = t.pendingProps, o = null !== e ? e.memoizedProps : null, r = l.children, sy(a, l) ? r = null : null !== o && sy(a, o) && (t.flags |= 32), null !== t.memoizedState && (s7._currentValue = a = a6(e, t, a9, null, null, n)), oC(e, t), ob(e, t, r, n), t.child;
            case 6:
                return null === e && rT && ((e = n = rx) && (null !== (n = function(e, t, n) {
                    if ("" === t) return null;
                    for (; 3 !== e.nodeType;)
                        if ((1 !== e.nodeType || "INPUT" !== e.nodeName || "hidden" !== e.type) && !n || null === (e = sL(e.nextSibling))) return null;
                    return e
                }(n, t.pendingProps, rC)) ? (t.stateNode = n, rk = t, rx = null, e = !0) : e = !1), e || rR(t)), null;
            case 13:
                return oM(e, t, n);
            case 4:
                return V(t, t.stateNode.containerInfo), r = t.pendingProps, null === e ? t.child = ay(t, null, r, n) : ob(e, t, r, n), t.child;
            case 11:
                return o_(e, t, t.type, t.pendingProps, n);
            case 7:
                return ob(e, t, t.pendingProps, n), t.child;
            case 8:
            case 12:
                return ob(e, t, t.pendingProps.children, n), t.child;
            case 10:
                return r = t.pendingProps, rU(t, t.type, r.value), ob(e, t, r.children, n), t.child;
            case 9:
                return a = t.type._context, r = t.pendingProps.children, rV(t), r = r(a = rQ(a)), t.flags |= 1, ob(e, t, r, n), t.child;
            case 14:
                return oS(e, t, t.type, t.pendingProps, n);
            case 15:
                return ow(e, t, t.type, t.pendingProps, n);
            case 19:
                return oH(e, t, n);
            case 31:
                var i = e,
                    s = t,
                    c = n,
                    d = s.pendingProps,
                    f = 0 != (128 & s.flags);
                if (s.flags &= -129, null === i) {
                    if (rT) {
                        if ("hidden" === d.mode) return i = oT(s, d), s.lanes = 0x20000000, ok(null, i);
                        if (aU(s), (i = rx) ? null !== (i = null !== (i = sN(i, rC)) && "&" === i.data ? i : null) && (s.memoizedState = {
                                dehydrated: i,
                                treeContext: null !== rg ? {
                                    id: rv,
                                    overflow: ry
                                } : null,
                                retryLane: 0x20000000,
                                hydrationErrors: null
                            }, (c = ro(i)).return = s, s.child = c, rk = s, rx = null) : i = null, null === i) throw rR(s);
                        return s.lanes = 0x20000000, null
                    }
                    return oT(s, d)
                }
                var p = i.memoizedState;
                if (null !== p) {
                    var h = p.dehydrated;
                    if (aU(s), f)
                        if (256 & s.flags) s.flags &= -257, s = oP(i, s, c);
                        else if (null !== s.memoizedState) s.child = i.child, s.flags |= 128, s = null;
                    else throw Error(u(558));
                    else if (oy || rW(i, s, c, !1), f = 0 != (c & i.childLanes), oy || f) {
                        if (null !== (d = iM) && 0 !== (h = eC(d, c)) && h !== p.retryLane) throw p.retryLane = h, n4(i, h), uo(d, i, h), ov;
                        uv(), s = oP(i, s, c)
                    } else i = p.treeContext, rx = sL(h.nextSibling), rk = s, rT = !0, rP = null, rC = !1, null !== i && rE(s, i), s = oT(s, d), s.flags |= 4096;
                    return s
                }
                return (i = rt(i.child, {
                    mode: d.mode,
                    children: d.children
                })).ref = s.ref, s.child = i, i.return = s, i;
            case 22:
                return oE(e, t, n, t.pendingProps);
            case 24:
                return rV(t), r = rQ(rZ), null === e ? (null === (a = r7()) && (a = iM, l = r0(), a.pooledCache = l, l.refCount++, null !== l && (a.pooledCacheLanes |= n), a = l), t.memoizedState = {
                    parent: r,
                    cache: a
                }, aS(t), rU(t, rZ, a)) : (0 != (e.lanes & n) && (aw(e, t), aN(t, null, null, n), aC()), a = e.memoizedState, l = t.memoizedState, a.parent !== r ? (a = {
                    parent: r,
                    cache: r
                }, t.memoizedState = a, 0 === t.lanes && (t.memoizedState = t.updateQueue.baseState = a), rU(t, rZ, r)) : (rU(t, rZ, r = l.cache), r !== a.cache && rq(t, [rZ], n, !0))), ob(e, t, t.pendingProps.children, n), t.child;
            case 29:
                throw t.pendingProps
        }
        throw Error(u(156, t.tag))
    }

    function oV(e) {
        e.flags |= 4
    }

    function oQ(e, t, n, r, a) {
        if ((t = 0 != (32 & e.mode)) && (t = !1), t) {
            if (e.flags |= 0x1000000, (0x13ffff40 & a) === a)
                if (e.stateNode.complete) e.flags |= 8192;
                else if (uh()) e.flags |= 8192;
            else throw as = al, ar
        } else e.flags &= -0x1000001
    }

    function oG(e, t) {
        if ("stylesheet" !== t.type || 0 != (4 & t.state.loading)) e.flags &= -0x1000001;
        else if (e.flags |= 0x1000000, !s3(t))
            if (uh()) e.flags |= 8192;
            else throw as = al, ar
    }

    function oY(e, t) {
        null !== t && (e.flags |= 4), 16384 & e.flags && (t = 22 !== e.tag ? eE() : 0x20000000, e.lanes |= t, iX |= t)
    }

    function oX(e, t) {
        if (!rT) switch (e.tailMode) {
            case "hidden":
                t = e.tail;
                for (var n = null; null !== t;) null !== t.alternate && (n = t), t = t.sibling;
                null === n ? e.tail = null : n.sibling = null;
                break;
            case "collapsed":
                n = e.tail;
                for (var r = null; null !== n;) null !== n.alternate && (r = n), n = n.sibling;
                null === r ? t || null === e.tail ? e.tail = null : e.tail.sibling = null : r.sibling = null
        }
    }

    function oK(e) {
        var t = null !== e.alternate && e.alternate.child === e.child,
            n = 0,
            r = 0;
        if (t)
            for (var a = e.child; null !== a;) n |= a.lanes | a.childLanes, r |= 0x3e00000 & a.subtreeFlags, r |= 0x3e00000 & a.flags, a.return = e, a = a.sibling;
        else
            for (a = e.child; null !== a;) n |= a.lanes | a.childLanes, r |= a.subtreeFlags, r |= a.flags, a.return = e, a = a.sibling;
        return e.subtreeFlags |= r, e.childLanes = n, t
    }

    function oJ(e, t) {
        switch (rw(t), t.tag) {
            case 3:
                rB(rZ), Q();
                break;
            case 26:
            case 27:
            case 5:
                Y(t);
                break;
            case 4:
                Q();
                break;
            case 31:
                null !== t.memoizedState && aq(t);
                break;
            case 13:
                aq(t);
                break;
            case 19:
                U(aW);
                break;
            case 10:
                rB(t.type);
                break;
            case 22:
            case 23:
                aq(t), aM(), null !== e && U(r9);
                break;
            case 24:
                rB(rZ)
        }
    }

    function oZ(e, t) {
        try {
            var n = t.updateQueue,
                r = null !== n ? n.lastEffect : null;
            if (null !== r) {
                var a = r.next;
                n = a;
                do {
                    if ((n.tag & e) === e) {
                        r = void 0;
                        var l = n.create;
                        n.inst.destroy = r = l()
                    }
                    n = n.next
                } while (n !== a)
            }
        } catch (e) {
            uL(t, t.return, e)
        }
    }

    function o0(e, t, n) {
        try {
            var r = t.updateQueue,
                a = null !== r ? r.lastEffect : null;
            if (null !== a) {
                var l = a.next;
                r = l;
                do {
                    if ((r.tag & e) === e) {
                        var o = r.inst,
                            i = o.destroy;
                        if (void 0 !== i) {
                            o.destroy = void 0, a = t;
                            try {
                                i()
                            } catch (e) {
                                uL(a, n, e)
                            }
                        }
                    }
                    r = r.next
                } while (r !== l)
            }
        } catch (e) {
            uL(t, t.return, e)
        }
    }

    function o1(e) {
        var t = e.updateQueue;
        if (null !== t) {
            var n = e.stateNode;
            try {
                aA(t, n)
            } catch (t) {
                uL(e, e.return, t)
            }
        }
    }

    function o2(e, t, n) {
        n.props = ou(e.type, e.memoizedProps), n.state = e.memoizedState;
        try {
            n.componentWillUnmount()
        } catch (n) {
            uL(e, t, n)
        }
    }

    function o3(e, t) {
        try {
            var n = e.ref;
            if (null !== n) {
                switch (e.tag) {
                    case 26:
                    case 27:
                    case 5:
                        var r = e.stateNode;
                        break;
                    default:
                        r = e.stateNode
                }
                "function" == typeof n ? e.refCleanup = n(r) : n.current = r
            }
        } catch (n) {
            uL(e, t, n)
        }
    }

    function o4(e, t) {
        var n = e.ref,
            r = e.refCleanup;
        if (null !== n)
            if ("function" == typeof r) try {
                r()
            } catch (n) {
                uL(e, t, n)
            } finally {
                e.refCleanup = null, null != (e = e.alternate) && (e.refCleanup = null)
            } else if ("function" == typeof n) try {
                n(null)
            } catch (n) {
                uL(e, t, n)
            } else n.current = null
    }

    function o6(e) {
        var t = e.type,
            n = e.memoizedProps,
            r = e.stateNode;
        try {
            switch (t) {
                case "button":
                case "input":
                case "select":
                case "textarea":
                    n.autoFocus && r.focus();
                    break;
                case "img":
                    n.src ? r.src = n.src : n.srcSet && (r.srcset = n.srcSet)
            }
        } catch (t) {
            uL(e, e.return, t)
        }
    }

    function o8(e, t, n) {
        try {
            var r = e.stateNode;
            (function(e, t, n, r) {
                switch (t) {
                    case "div":
                    case "span":
                    case "svg":
                    case "path":
                    case "a":
                    case "g":
                    case "p":
                    case "li":
                        break;
                    case "input":
                        var a = null,
                            l = null,
                            o = null,
                            i = null,
                            s = null,
                            c = null,
                            d = null;
                        for (h in n) {
                            var f = n[h];
                            if (n.hasOwnProperty(h) && null != f) switch (h) {
                                case "checked":
                                case "value":
                                    break;
                                case "defaultValue":
                                    s = f;
                                default:
                                    r.hasOwnProperty(h) || ss(e, t, h, null, r, f)
                            }
                        }
                        for (var p in r) {
                            var h = r[p];
                            if (f = n[p], r.hasOwnProperty(p) && (null != h || null != f)) switch (p) {
                                case "type":
                                    l = h;
                                    break;
                                case "name":
                                    a = h;
                                    break;
                                case "checked":
                                    c = h;
                                    break;
                                case "defaultChecked":
                                    d = h;
                                    break;
                                case "value":
                                    o = h;
                                    break;
                                case "defaultValue":
                                    i = h;
                                    break;
                                case "children":
                                case "dangerouslySetInnerHTML":
                                    if (null != h) throw Error(u(137, t));
                                    break;
                                default:
                                    h !== f && ss(e, t, p, h, r, f)
                            }
                        }
                        tt(e, o, i, s, c, d, l, a);
                        return;
                    case "select":
                        for (l in h = o = i = p = null, n)
                            if (s = n[l], n.hasOwnProperty(l) && null != s) switch (l) {
                                case "value":
                                    break;
                                case "multiple":
                                    h = s;
                                default:
                                    r.hasOwnProperty(l) || ss(e, t, l, null, r, s)
                            }
                        for (a in r)
                            if (l = r[a], s = n[a], r.hasOwnProperty(a) && (null != l || null != s)) switch (a) {
                                case "value":
                                    p = l;
                                    break;
                                case "defaultValue":
                                    i = l;
                                    break;
                                case "multiple":
                                    o = l;
                                default:
                                    l !== s && ss(e, t, a, l, r, s)
                            }
                        t = i, n = o, r = h, null != p ? ta(e, !!n, p, !1) : !!r != !!n && (null != t ? ta(e, !!n, t, !0) : ta(e, !!n, n ? [] : "", !1));
                        return;
                    case "textarea":
                        for (i in h = p = null, n)
                            if (a = n[i], n.hasOwnProperty(i) && null != a && !r.hasOwnProperty(i)) switch (i) {
                                case "value":
                                case "children":
                                    break;
                                default:
                                    ss(e, t, i, null, r, a)
                            }
                        for (o in r)
                            if (a = r[o], l = n[o], r.hasOwnProperty(o) && (null != a || null != l)) switch (o) {
                                case "value":
                                    p = a;
                                    break;
                                case "defaultValue":
                                    h = a;
                                    break;
                                case "children":
                                    break;
                                case "dangerouslySetInnerHTML":
                                    if (null != a) throw Error(u(91));
                                    break;
                                default:
                                    a !== l && ss(e, t, o, a, r, l)
                            }
                        tl(e, p, h);
                        return;
                    case "option":
                        for (var m in n) p = n[m], n.hasOwnProperty(m) && null != p && !r.hasOwnProperty(m) && ("selected" === m ? e.selected = !1 : ss(e, t, m, null, r, p));
                        for (s in r) p = r[s], h = n[s], r.hasOwnProperty(s) && p !== h && (null != p || null != h) && ("selected" === s ? e.selected = p && "function" != typeof p && "symbol" != typeof p : ss(e, t, s, p, r, h));
                        return;
                    case "img":
                    case "link":
                    case "area":
                    case "base":
                    case "br":
                    case "col":
                    case "embed":
                    case "hr":
                    case "keygen":
                    case "meta":
                    case "param":
                    case "source":
                    case "track":
                    case "wbr":
                    case "menuitem":
                        for (var g in n) p = n[g], n.hasOwnProperty(g) && null != p && !r.hasOwnProperty(g) && ss(e, t, g, null, r, p);
                        for (c in r)
                            if (p = r[c], h = n[c], r.hasOwnProperty(c) && p !== h && (null != p || null != h)) switch (c) {
                                case "children":
                                case "dangerouslySetInnerHTML":
                                    if (null != p) throw Error(u(137, t));
                                    break;
                                default:
                                    ss(e, t, c, p, r, h)
                            }
                        return;
                    default:
                        if (td(t)) {
                            for (var v in n) p = n[v], n.hasOwnProperty(v) && void 0 !== p && !r.hasOwnProperty(v) && sc(e, t, v, void 0, r, p);
                            for (d in r) p = r[d], h = n[d], r.hasOwnProperty(d) && p !== h && (void 0 !== p || void 0 !== h) && sc(e, t, d, p, r, h);
                            return
                        }
                }
                for (var y in n) p = n[y], n.hasOwnProperty(y) && null != p && !r.hasOwnProperty(y) && ss(e, t, y, null, r, p);
                for (f in r) p = r[f], h = n[f], r.hasOwnProperty(f) && p !== h && (null != p || null != h) && ss(e, t, f, p, r, h)
            })(r, e.type, n, t), r[eD] = t
        } catch (t) {
            uL(e, e.return, t)
        }
    }

    function o5(e) {
        return 5 === e.tag || 3 === e.tag || 26 === e.tag || 27 === e.tag && sx(e.type) || 4 === e.tag
    }

    function o9(e) {
        e: for (;;) {
            for (; null === e.sibling;) {
                if (null === e.return || o5(e.return)) return null;
                e = e.return
            }
            for (e.sibling.return = e.return, e = e.sibling; 5 !== e.tag && 6 !== e.tag && 18 !== e.tag;) {
                if (27 === e.tag && sx(e.type) || 2 & e.flags || null === e.child || 4 === e.tag) continue e;
                e.child.return = e, e = e.child
            }
            if (!(2 & e.flags)) return e.stateNode
        }
    }

    function o7(e, t, n) {
        var r = e.tag;
        if (5 === r || 6 === r) e = e.stateNode, t ? n.insertBefore(e, t) : n.appendChild(e);
        else if (4 !== r && (27 === r && sx(e.type) && (n = e.stateNode), null !== (e = e.child)))
            for (o7(e, t, n), e = e.sibling; null !== e;) o7(e, t, n), e = e.sibling
    }

    function ie(e) {
        var t = e.stateNode,
            n = e.memoizedProps;
        try {
            for (var r = e.type, a = t.attributes; a.length;) t.removeAttributeNode(a[0]);
            sd(t, r, n), t[eI] = e, t[eD] = n
        } catch (t) {
            uL(e, e.return, t)
        }
    }
    var it = !1,
        ir = !1,
        ia = !1,
        il = "function" == typeof WeakSet ? WeakSet : Set,
        io = null;

    function ii(e, t, n) {
        var r = n.flags;
        switch (n.tag) {
            case 0:
            case 11:
            case 15:
                i_(e, n), 4 & r && oZ(5, n);
                break;
            case 1:
                if (i_(e, n), 4 & r)
                    if (e = n.stateNode, null === t) try {
                        e.componentDidMount()
                    } catch (e) {
                        uL(n, n.return, e)
                    } else {
                        var a = ou(n.type, t.memoizedProps);
                        t = t.memoizedState;
                        try {
                            e.componentDidUpdate(a, t, e.__reactInternalSnapshotBeforeUpdate)
                        } catch (e) {
                            uL(n, n.return, e)
                        }
                    }
                64 & r && o1(n), 512 & r && o3(n, n.return);
                break;
            case 3:
                if (i_(e, n), 64 & r && null !== (e = n.updateQueue)) {
                    if (t = null, null !== n.child) switch (n.child.tag) {
                        case 27:
                        case 5:
                        case 1:
                            t = n.child.stateNode
                    }
                    try {
                        aA(e, t)
                    } catch (e) {
                        uL(n, n.return, e)
                    }
                }
                break;
            case 27:
                null === t && 4 & r && ie(n);
            case 26:
            case 5:
                i_(e, n), null === t && 4 & r && o6(n), 512 & r && o3(n, n.return);
                break;
            case 12:
            default:
                i_(e, n);
                break;
            case 31:
                i_(e, n), 4 & r && ip(e, n);
                break;
            case 13:
                i_(e, n), 4 & r && ih(e, n), 64 & r && null !== (e = n.memoizedState) && null !== (e = e.dehydrated) && function(e, t) {
                    var n = e.ownerDocument;
                    if ("$~" === e.data) e._reactRetry = t;
                    else if ("$?" !== e.data || "loading" !== n.readyState) t();
                    else {
                        var r = function() {
                            t(), n.removeEventListener("DOMContentLoaded", r)
                        };
                        n.addEventListener("DOMContentLoaded", r), e._reactRetry = r
                    }
                }(e, n = uM.bind(null, n));
                break;
            case 22:
                if (!(r = null !== n.memoizedState || it)) {
                    t = null !== t && null !== t.memoizedState || ir, a = it;
                    var l = ir;
                    it = r, (ir = t) && !l ? function e(t, n, r) {
                        for (r = r && 0 != (8772 & n.subtreeFlags), n = n.child; null !== n;) {
                            var a = n.alternate,
                                l = t,
                                o = n,
                                i = o.flags;
                            switch (o.tag) {
                                case 0:
                                case 11:
                                case 15:
                                    e(l, o, r), oZ(4, o);
                                    break;
                                case 1:
                                    if (e(l, o, r), "function" == typeof(l = (a = o).stateNode).componentDidMount) try {
                                        l.componentDidMount()
                                    } catch (e) {
                                        uL(a, a.return, e)
                                    }
                                    if (null !== (l = (a = o).updateQueue)) {
                                        var u = a.stateNode;
                                        try {
                                            var s = l.shared.hiddenCallbacks;
                                            if (null !== s)
                                                for (l.shared.hiddenCallbacks = null, l = 0; l < s.length; l++) aR(s[l], u)
                                        } catch (e) {
                                            uL(a, a.return, e)
                                        }
                                    }
                                    r && 64 & i && o1(o), o3(o, o.return);
                                    break;
                                case 27:
                                    ie(o);
                                case 26:
                                case 5:
                                    e(l, o, r), r && null === a && 4 & i && o6(o), o3(o, o.return);
                                    break;
                                case 12:
                                default:
                                    e(l, o, r);
                                    break;
                                case 31:
                                    e(l, o, r), r && 4 & i && ip(l, o);
                                    break;
                                case 13:
                                    e(l, o, r), r && 4 & i && ih(l, o);
                                    break;
                                case 22:
                                    null === o.memoizedState && e(l, o, r), o3(o, o.return);
                                case 30:
                            }
                            n = n.sibling
                        }
                    }(e, n, 0 != (8772 & n.subtreeFlags)) : i_(e, n), it = a, ir = l
                }
            case 30:
        }
    }
    var iu = null,
        is = !1;

    function ic(e, t, n) {
        for (n = n.child; null !== n;) id(e, t, n), n = n.sibling
    }

    function id(e, t, n) {
        if (ep && "function" == typeof ep.onCommitFiberUnmount) try {
            ep.onCommitFiberUnmount(ef, n)
        } catch (e) {}
        switch (n.tag) {
            case 26:
                ir || o4(n, t), ic(e, t, n), n.memoizedState ? n.memoizedState.count-- : n.stateNode && (n = n.stateNode).parentNode.removeChild(n);
                break;
            case 27:
                ir || o4(n, t);
                var r = iu,
                    a = is;
                sx(n.type) && (iu = n.stateNode, is = !1), ic(e, t, n), sz(n.stateNode), iu = r, is = a;
                break;
            case 5:
                ir || o4(n, t);
            case 6:
                if (r = iu, a = is, iu = null, ic(e, t, n), iu = r, is = a, null !== iu)
                    if (is) try {
                        (9 === iu.nodeType ? iu.body : "HTML" === iu.nodeName ? iu.ownerDocument.body : iu).removeChild(n.stateNode)
                    } catch (e) {
                        uL(n, t, e)
                    } else try {
                        iu.removeChild(n.stateNode)
                    } catch (e) {
                        uL(n, t, e)
                    }
                break;
            case 18:
                null !== iu && (is ? (sT(9 === (e = iu).nodeType ? e.body : "HTML" === e.nodeName ? e.ownerDocument.body : e, n.stateNode), cL(e)) : sT(iu, n.stateNode));
                break;
            case 4:
                r = iu, a = is, iu = n.stateNode.containerInfo, is = !0, ic(e, t, n), iu = r, is = a;
                break;
            case 0:
            case 11:
            case 14:
            case 15:
                o0(2, n, t), ir || o0(4, n, t), ic(e, t, n);
                break;
            case 1:
                ir || (o4(n, t), "function" == typeof(r = n.stateNode).componentWillUnmount && o2(n, t, r)), ic(e, t, n);
                break;
            case 21:
            default:
                ic(e, t, n);
                break;
            case 22:
                ir = (r = ir) || null !== n.memoizedState, ic(e, t, n), ir = r
        }
    }

    function ip(e, t) {
        if (null === t.memoizedState && null !== (e = t.alternate) && null !== (e = e.memoizedState)) {
            e = e.dehydrated;
            try {
                cL(e)
            } catch (e) {
                uL(t, t.return, e)
            }
        }
    }

    function ih(e, t) {
        if (null === t.memoizedState && null !== (e = t.alternate) && null !== (e = e.memoizedState) && null !== (e = e.dehydrated)) try {
            cL(e)
        } catch (e) {
            uL(t, t.return, e)
        }
    }

    function im(e, t) {
        var n = function(e) {
            switch (e.tag) {
                case 31:
                case 13:
                case 19:
                    var t = e.stateNode;
                    return null === t && (t = e.stateNode = new il), t;
                case 22:
                    return null === (t = (e = e.stateNode)._retryCache) && (t = e._retryCache = new il), t;
                default:
                    throw Error(u(435, e.tag))
            }
        }(e);
        t.forEach(function(t) {
            if (!n.has(t)) {
                n.add(t);
                var r = uz.bind(null, e, t);
                t.then(r, r)
            }
        })
    }

    function ig(e, t) {
        var n = t.deletions;
        if (null !== n)
            for (var r = 0; r < n.length; r++) {
                var a = n[r],
                    l = e,
                    o = t,
                    i = o;
                e: for (; null !== i;) {
                    switch (i.tag) {
                        case 27:
                            if (sx(i.type)) {
                                iu = i.stateNode, is = !1;
                                break e
                            }
                            break;
                        case 5:
                            iu = i.stateNode, is = !1;
                            break e;
                        case 3:
                        case 4:
                            iu = i.stateNode.containerInfo, is = !0;
                            break e
                    }
                    i = i.return
                }
                if (null === iu) throw Error(u(160));
                id(l, o, a), iu = null, is = !1, null !== (l = a.alternate) && (l.return = null), a.return = null
            }
        if (13886 & t.subtreeFlags)
            for (t = t.child; null !== t;) iy(t, e), t = t.sibling
    }
    var iv = null;

    function iy(e, t) {
        var n = e.alternate,
            r = e.flags;
        switch (e.tag) {
            case 0:
            case 11:
            case 14:
            case 15:
                ig(t, e), ib(e), 4 & r && (o0(3, e, e.return), oZ(3, e), o0(5, e, e.return));
                break;
            case 1:
                ig(t, e), ib(e), 512 & r && (ir || null === n || o4(n, n.return)), 64 & r && it && null !== (e = e.updateQueue) && null !== (r = e.callbacks) && (n = e.shared.hiddenCallbacks, e.shared.hiddenCallbacks = null === n ? r : n.concat(r));
                break;
            case 26:
                var a = iv;
                if (ig(t, e), ib(e), 512 & r && (ir || null === n || o4(n, n.return)), 4 & r) {
                    var l = null !== n ? n.memoizedState : null;
                    if (r = e.memoizedState, null === n)
                        if (null === r)
                            if (null === e.stateNode) {
                                e: {
                                    r = e.type,
                                    n = e.memoizedProps,
                                    a = a.ownerDocument || a;t: switch (r) {
                                        case "title":
                                            (!(l = a.getElementsByTagName("title")[0]) || l[eB] || l[eI] || "http://www.w3.org/2000/svg" === l.namespaceURI || l.hasAttribute("itemprop")) && (l = a.createElement(r), a.head.insertBefore(l, a.querySelector("head > title"))), sd(l, r, n), l[eI] = e, eQ(l), r = l;
                                            break e;
                                        case "link":
                                            var o = s1("link", "href", a).get(r + (n.href || ""));
                                            if (o) {
                                                for (var i = 0; i < o.length; i++)
                                                    if ((l = o[i]).getAttribute("href") === (null == n.href || "" === n.href ? null : n.href) && l.getAttribute("rel") === (null == n.rel ? null : n.rel) && l.getAttribute("title") === (null == n.title ? null : n.title) && l.getAttribute("crossorigin") === (null == n.crossOrigin ? null : n.crossOrigin)) {
                                                        o.splice(i, 1);
                                                        break t
                                                    }
                                            }
                                            sd(l = a.createElement(r), r, n), a.head.appendChild(l);
                                            break;
                                        case "meta":
                                            if (o = s1("meta", "content", a).get(r + (n.content || ""))) {
                                                for (i = 0; i < o.length; i++)
                                                    if ((l = o[i]).getAttribute("content") === (null == n.content ? null : "" + n.content) && l.getAttribute("name") === (null == n.name ? null : n.name) && l.getAttribute("property") === (null == n.property ? null : n.property) && l.getAttribute("http-equiv") === (null == n.httpEquiv ? null : n.httpEquiv) && l.getAttribute("charset") === (null == n.charSet ? null : n.charSet)) {
                                                        o.splice(i, 1);
                                                        break t
                                                    }
                                            }
                                            sd(l = a.createElement(r), r, n), a.head.appendChild(l);
                                            break;
                                        default:
                                            throw Error(u(468, r))
                                    }
                                    l[eI] = e,
                                    eQ(l),
                                    r = l
                                }
                                e.stateNode = r
                            }
                    else s2(a, e.type, e.stateNode);
                    else e.stateNode = sX(a, r, e.memoizedProps);
                    else l !== r ? (null === l ? null !== n.stateNode && (n = n.stateNode).parentNode.removeChild(n) : l.count--, null === r ? s2(a, e.type, e.stateNode) : sX(a, r, e.memoizedProps)) : null === r && null !== e.stateNode && o8(e, e.memoizedProps, n.memoizedProps)
                }
                break;
            case 27:
                ig(t, e), ib(e), 512 & r && (ir || null === n || o4(n, n.return)), null !== n && 4 & r && o8(e, e.memoizedProps, n.memoizedProps);
                break;
            case 5:
                if (ig(t, e), ib(e), 512 & r && (ir || null === n || o4(n, n.return)), 32 & e.flags) {
                    a = e.stateNode;
                    try {
                        ti(a, "")
                    } catch (t) {
                        uL(e, e.return, t)
                    }
                }
                4 & r && null != e.stateNode && (a = e.memoizedProps, o8(e, a, null !== n ? n.memoizedProps : a)), 1024 & r && (ia = !0);
                break;
            case 6:
                if (ig(t, e), ib(e), 4 & r) {
                    if (null === e.stateNode) throw Error(u(162));
                    r = e.memoizedProps, n = e.stateNode;
                    try {
                        n.nodeValue = r
                    } catch (t) {
                        uL(e, e.return, t)
                    }
                }
                break;
            case 3:
                if (s0 = null, a = iv, iv = sU(t.containerInfo), ig(t, e), iv = a, ib(e), 4 & r && null !== n && n.memoizedState.isDehydrated) try {
                    cL(t.containerInfo)
                } catch (t) {
                    uL(e, e.return, t)
                }
                ia && (ia = !1, function e(t) {
                    if (1024 & t.subtreeFlags)
                        for (t = t.child; null !== t;) {
                            var n = t;
                            e(n), 5 === n.tag && 1024 & n.flags && n.stateNode.reset(), t = t.sibling
                        }
                }(e));
                break;
            case 4:
                r = iv, iv = sU(e.stateNode.containerInfo), ig(t, e), ib(e), iv = r;
                break;
            case 12:
            default:
                ig(t, e), ib(e);
                break;
            case 31:
            case 19:
                ig(t, e), ib(e), 4 & r && null !== (r = e.updateQueue) && (e.updateQueue = null, im(e, r));
                break;
            case 13:
                ig(t, e), ib(e), 8192 & e.child.flags && null !== e.memoizedState != (null !== n && null !== n.memoizedState) && (i0 = el()), 4 & r && null !== (r = e.updateQueue) && (e.updateQueue = null, im(e, r));
                break;
            case 22:
                a = null !== e.memoizedState;
                var s = null !== n && null !== n.memoizedState,
                    c = it,
                    d = ir;
                if (it = c || a, ir = d || s, ig(t, e), ir = d, it = c, ib(e), 8192 & r) e: for ((t = e.stateNode)._visibility = a ? -2 & t._visibility : 1 | t._visibility, a && (null === n || s || it || ir || function e(t) {
                        for (t = t.child; null !== t;) {
                            var n = t;
                            switch (n.tag) {
                                case 0:
                                case 11:
                                case 14:
                                case 15:
                                    o0(4, n, n.return), e(n);
                                    break;
                                case 1:
                                    o4(n, n.return);
                                    var r = n.stateNode;
                                    "function" == typeof r.componentWillUnmount && o2(n, n.return, r), e(n);
                                    break;
                                case 27:
                                    sz(n.stateNode);
                                case 26:
                                case 5:
                                    o4(n, n.return), e(n);
                                    break;
                                case 22:
                                    null === n.memoizedState && e(n);
                                    break;
                                default:
                                    e(n)
                            }
                            t = t.sibling
                        }
                    }(e)), n = null, t = e;;) {
                    if (5 === t.tag || 26 === t.tag) {
                        if (null === n) {
                            s = n = t;
                            try {
                                if (l = s.stateNode, a) o = l.style, "function" == typeof o.setProperty ? o.setProperty("display", "none", "important") : o.display = "none";
                                else {
                                    i = s.stateNode;
                                    var f = s.memoizedProps.style,
                                        p = null != f && f.hasOwnProperty("display") ? f.display : null;
                                    i.style.display = null == p || "boolean" == typeof p ? "" : ("" + p).trim()
                                }
                            } catch (e) {
                                uL(s, s.return, e)
                            }
                        }
                    } else if (6 === t.tag) {
                        if (null === n) {
                            s = t;
                            try {
                                s.stateNode.nodeValue = a ? "" : s.memoizedProps
                            } catch (e) {
                                uL(s, s.return, e)
                            }
                        }
                    } else if (18 === t.tag) {
                        if (null === n) {
                            s = t;
                            try {
                                var h = s.stateNode;
                                a ? sP(h, !0) : sP(s.stateNode, !1)
                            } catch (e) {
                                uL(s, s.return, e)
                            }
                        }
                    } else if ((22 !== t.tag && 23 !== t.tag || null === t.memoizedState || t === e) && null !== t.child) {
                        t.child.return = t, t = t.child;
                        continue
                    }
                    if (t === e) break;
                    for (; null === t.sibling;) {
                        if (null === t.return || t.return === e) break e;
                        n === t && (n = null), t = t.return
                    }
                    n === t && (n = null), t.sibling.return = t.return, t = t.sibling
                }
                4 & r && null !== (r = e.updateQueue) && null !== (n = r.retryQueue) && (r.retryQueue = null, im(e, n));
            case 30:
            case 21:
        }
    }

    function ib(e) {
        var t = e.flags;
        if (2 & t) {
            try {
                for (var n, r = e.return; null !== r;) {
                    if (o5(r)) {
                        n = r;
                        break
                    }
                    r = r.return
                }
                if (null == n) throw Error(u(160));
                switch (n.tag) {
                    case 27:
                        var a = n.stateNode,
                            l = o9(e);
                        o7(e, l, a);
                        break;
                    case 5:
                        var o = n.stateNode;
                        32 & n.flags && (ti(o, ""), n.flags &= -33);
                        var i = o9(e);
                        o7(e, i, o);
                        break;
                    case 3:
                    case 4:
                        var s = n.stateNode.containerInfo,
                            c = o9(e);
                        ! function e(t, n, r) {
                            var a = t.tag;
                            if (5 === a || 6 === a) t = t.stateNode, n ? (9 === r.nodeType ? r.body : "HTML" === r.nodeName ? r.ownerDocument.body : r).insertBefore(t, n) : ((n = 9 === r.nodeType ? r.body : "HTML" === r.nodeName ? r.ownerDocument.body : r).appendChild(t), null != (r = r._reactRootContainer) || null !== n.onclick || (n.onclick = tm));
                            else if (4 !== a && (27 === a && sx(t.type) && (r = t.stateNode, n = null), null !== (t = t.child)))
                                for (e(t, n, r), t = t.sibling; null !== t;) e(t, n, r), t = t.sibling
                        }(e, c, s);
                        break;
                    default:
                        throw Error(u(161))
                }
            } catch (t) {
                uL(e, e.return, t)
            }
            e.flags &= -3
        }
        4096 & t && (e.flags &= -4097)
    }

    function i_(e, t) {
        if (8772 & t.subtreeFlags)
            for (t = t.child; null !== t;) ii(e, t.alternate, t), t = t.sibling
    }

    function iS(e, t) {
        var n = null;
        null !== e && null !== e.memoizedState && null !== e.memoizedState.cachePool && (n = e.memoizedState.cachePool.pool), e = null, null !== t.memoizedState && null !== t.memoizedState.cachePool && (e = t.memoizedState.cachePool.pool), e !== n && (null != e && e.refCount++, null != n && r1(n))
    }

    function iw(e, t) {
        e = null, null !== t.alternate && (e = t.alternate.memoizedState.cache), (t = t.memoizedState.cache) !== e && (t.refCount++, null != e && r1(e))
    }

    function iE(e, t, n, r) {
        if (10256 & t.subtreeFlags)
            for (t = t.child; null !== t;) ik(e, t, n, r), t = t.sibling
    }

    function ik(e, t, n, r) {
        var a = t.flags;
        switch (t.tag) {
            case 0:
            case 11:
            case 15:
                iE(e, t, n, r), 2048 & a && oZ(9, t);
                break;
            case 1:
            case 31:
            case 13:
            default:
                iE(e, t, n, r);
                break;
            case 3:
                iE(e, t, n, r), 2048 & a && (e = null, null !== t.alternate && (e = t.alternate.memoizedState.cache), (t = t.memoizedState.cache) !== e && (t.refCount++, null != e && r1(e)));
                break;
            case 12:
                if (2048 & a) {
                    iE(e, t, n, r), e = t.stateNode;
                    try {
                        var l = t.memoizedProps,
                            o = l.id,
                            i = l.onPostCommit;
                        "function" == typeof i && i(o, null === t.alternate ? "mount" : "update", e.passiveEffectDuration, -0)
                    } catch (e) {
                        uL(t, t.return, e)
                    }
                } else iE(e, t, n, r);
                break;
            case 23:
                break;
            case 22:
                l = t.stateNode, o = t.alternate, null !== t.memoizedState ? 2 & l._visibility ? iE(e, t, n, r) : ix(e, t) : 2 & l._visibility ? iE(e, t, n, r) : (l._visibility |= 2, function e(t, n, r, a, l) {
                    for (l = l && 0 != (10256 & n.subtreeFlags), n = n.child; null !== n;) {
                        var o = n,
                            i = o.flags;
                        switch (o.tag) {
                            case 0:
                            case 11:
                            case 15:
                                e(t, o, r, a, l), oZ(8, o);
                                break;
                            case 23:
                                break;
                            case 22:
                                var u = o.stateNode;
                                null !== o.memoizedState ? 2 & u._visibility ? e(t, o, r, a, l) : ix(t, o) : (u._visibility |= 2, e(t, o, r, a, l)), l && 2048 & i && iS(o.alternate, o);
                                break;
                            case 24:
                                e(t, o, r, a, l), l && 2048 & i && iw(o.alternate, o);
                                break;
                            default:
                                e(t, o, r, a, l)
                        }
                        n = n.sibling
                    }
                }(e, t, n, r, 0 != (10256 & t.subtreeFlags))), 2048 & a && iS(o, t);
                break;
            case 24:
                iE(e, t, n, r), 2048 & a && iw(t.alternate, t)
        }
    }

    function ix(e, t) {
        if (10256 & t.subtreeFlags)
            for (t = t.child; null !== t;) {
                var n = t,
                    r = n.flags;
                switch (n.tag) {
                    case 22:
                        ix(e, n), 2048 & r && iS(n.alternate, n);
                        break;
                    case 24:
                        ix(e, n), 2048 & r && iw(n.alternate, n);
                        break;
                    default:
                        ix(e, n)
                }
                t = t.sibling
            }
    }
    var iT = 8192;

    function iP(e, t, n) {
        if (e.subtreeFlags & iT)
            for (e = e.child; null !== e;) iC(e, t, n), e = e.sibling
    }

    function iC(e, t, n) {
        switch (e.tag) {
            case 26:
                iP(e, t, n), e.flags & iT && null !== e.memoizedState && function(e, t, n, r) {
                    if ("stylesheet" === n.type && ("string" != typeof r.media || !1 !== matchMedia(r.media).matches) && 0 == (4 & n.state.loading)) {
                        if (null === n.instance) {
                            var a = s$(r.href),
                                l = t.querySelector(sV(a));
                            if (l) {
                                null !== (t = l._p) && "object" == typeof t && "function" == typeof t.then && (e.count++, e = s6.bind(e), t.then(e, e)), n.state.loading |= 4, n.instance = l, eQ(l);
                                return
                            }
                            l = t.ownerDocument || t, r = sQ(r), (a = sF.get(a)) && sJ(r, a), eQ(l = l.createElement("link"));
                            var o = l;
                            o._p = new Promise(function(e, t) {
                                o.onload = e, o.onerror = t
                            }), sd(l, "link", r), n.instance = l
                        }
                        null === e.stylesheets && (e.stylesheets = new Map), e.stylesheets.set(n, t), (t = n.state.preload) && 0 == (3 & n.state.loading) && (e.count++, n = s6.bind(e), t.addEventListener("load", n), t.addEventListener("error", n))
                    }
                }(n, iv, e.memoizedState, e.memoizedProps);
                break;
            case 5:
            default:
                iP(e, t, n);
                break;
            case 3:
            case 4:
                var r = iv;
                iv = sU(e.stateNode.containerInfo), iP(e, t, n), iv = r;
                break;
            case 22:
                null === e.memoizedState && (null !== (r = e.alternate) && null !== r.memoizedState ? (r = iT, iT = 0x1000000, iP(e, t, n), iT = r) : iP(e, t, n))
        }
    }

    function iN(e) {
        var t = e.alternate;
        if (null !== t && null !== (e = t.child)) {
            t.child = null;
            do t = e.sibling, e.sibling = null, e = t; while (null !== e)
        }
    }

    function iR(e) {
        var t = e.deletions;
        if (0 != (16 & e.flags)) {
            if (null !== t)
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    io = r, iL(r, e)
                }
            iN(e)
        }
        if (10256 & e.subtreeFlags)
            for (e = e.child; null !== e;) iA(e), e = e.sibling
    }

    function iA(e) {
        switch (e.tag) {
            case 0:
            case 11:
            case 15:
                iR(e), 2048 & e.flags && o0(9, e, e.return);
                break;
            case 3:
            case 12:
            default:
                iR(e);
                break;
            case 22:
                var t = e.stateNode;
                null !== e.memoizedState && 2 & t._visibility && (null === e.return || 13 !== e.return.tag) ? (t._visibility &= -3, function e(t) {
                    var n = t.deletions;
                    if (0 != (16 & t.flags)) {
                        if (null !== n)
                            for (var r = 0; r < n.length; r++) {
                                var a = n[r];
                                io = a, iL(a, t)
                            }
                        iN(t)
                    }
                    for (t = t.child; null !== t;) {
                        switch ((n = t).tag) {
                            case 0:
                            case 11:
                            case 15:
                                o0(8, n, n.return), e(n);
                                break;
                            case 22:
                                2 & (r = n.stateNode)._visibility && (r._visibility &= -3, e(n));
                                break;
                            default:
                                e(n)
                        }
                        t = t.sibling
                    }
                }(e)) : iR(e)
        }
    }

    function iL(e, t) {
        for (; null !== io;) {
            var n = io;
            switch (n.tag) {
                case 0:
                case 11:
                case 15:
                    o0(8, n, t);
                    break;
                case 23:
                case 22:
                    if (null !== n.memoizedState && null !== n.memoizedState.cachePool) {
                        var r = n.memoizedState.cachePool.pool;
                        null != r && r.refCount++
                    }
                    break;
                case 24:
                    r1(n.memoizedState.cache)
            }
            if (null !== (r = n.child)) r.return = n, io = r;
            else
                for (n = e; null !== io;) {
                    var a = (r = io).sibling,
                        l = r.return;
                    if (! function e(t) {
                            var n = t.alternate;
                            null !== n && (t.alternate = null, e(n)), t.child = null, t.deletions = null, t.sibling = null, 5 === t.tag && null !== (n = t.stateNode) && eH(n), t.stateNode = null, t.return = null, t.dependencies = null, t.memoizedProps = null, t.memoizedState = null, t.pendingProps = null, t.stateNode = null, t.updateQueue = null
                        }(r), r === n) {
                        io = null;
                        break
                    }
                    if (null !== a) {
                        a.return = l, io = a;
                        break
                    }
                    io = l
                }
        }
    }
    var iO = {
            getCacheForType: function(e) {
                var t = rQ(rZ),
                    n = t.data.get(e);
                return void 0 === n && (n = e(), t.data.set(e, n)), n
            },
            cacheSignal: function() {
                return rQ(rZ).controller.signal
            }
        },
        iI = "function" == typeof WeakMap ? WeakMap : Map,
        iD = 0,
        iM = null,
        iz = null,
        iF = 0,
        ij = 0,
        iU = null,
        iB = !1,
        iH = !1,
        iq = !1,
        iW = 0,
        i$ = 0,
        iV = 0,
        iQ = 0,
        iG = 0,
        iY = 0,
        iX = 0,
        iK = null,
        iJ = null,
        iZ = !1,
        i0 = 0,
        i1 = 0,
        i2 = 1 / 0,
        i3 = null,
        i4 = null,
        i6 = 0,
        i8 = null,
        i5 = null,
        i9 = 0,
        i7 = 0,
        ue = null,
        ut = null,
        un = 0,
        ur = null;

    function ua() {
        return 0 != (2 & iD) && 0 !== iF ? iF & -iF : null !== I.T ? uK() : eA()
    }

    function ul() {
        if (0 === iY)
            if (0 == (0x20000000 & iF) || rT) {
                var e = ey;
                0 == (3932160 & (ey <<= 1)) && (ey = 262144), iY = e
            } else iY = 0x20000000;
        return null !== (e = az.current) && (e.flags |= 32), iY
    }

    function uo(e, t, n) {
        (e === iM && (2 === ij || 9 === ij) || null !== e.cancelPendingCommit) && (uf(e, 0), us(e, iF, iY, !1)), ex(e, n), (0 == (2 & iD) || e !== iM) && (e === iM && (0 == (2 & iD) && (iQ |= n), 4 === i$ && us(e, iF, iY, !1)), uW(e))
    }

    function ui(e, t, n) {
        if (0 != (6 & iD)) throw Error(u(327));
        for (var r = !n && 0 == (127 & t) && 0 == (t & e.expiredLanes) || ew(e, t), a = r ? function(e, t) {
                var n = iD;
                iD |= 2;
                var r = um(),
                    a = ug();
                iM !== e || iF !== t ? (i3 = null, i2 = el() + 500, uf(e, t)) : iH = ew(e, t);
                e: for (;;) try {
                    if (0 !== ij && null !== iz) {
                        t = iz;
                        var l = iU;
                        t: switch (ij) {
                            case 1:
                                ij = 0, iU = null, uS(e, t, l, 1);
                                break;
                            case 2:
                            case 9:
                                if (ao(l)) {
                                    ij = 0, iU = null, u_(t);
                                    break
                                }
                                t = function() {
                                    2 !== ij && 9 !== ij || iM !== e || (ij = 7), uW(e)
                                }, l.then(t, t);
                                break e;
                            case 3:
                                ij = 7;
                                break e;
                            case 4:
                                ij = 5;
                                break e;
                            case 7:
                                ao(l) ? (ij = 0, iU = null, u_(t)) : (ij = 0, iU = null, uS(e, t, l, 7));
                                break;
                            case 5:
                                var o = null;
                                switch (iz.tag) {
                                    case 26:
                                        o = iz.memoizedState;
                                    case 5:
                                    case 27:
                                        var i = iz;
                                        if (o ? s3(o) : i.stateNode.complete) {
                                            ij = 0, iU = null;
                                            var s = i.sibling;
                                            if (null !== s) iz = s;
                                            else {
                                                var c = i.return;
                                                null !== c ? (iz = c, uw(c)) : iz = null
                                            }
                                            break t
                                        }
                                }
                                ij = 0, iU = null, uS(e, t, l, 5);
                                break;
                            case 6:
                                ij = 0, iU = null, uS(e, t, l, 6);
                                break;
                            case 8:
                                ud(), i$ = 6;
                                break e;
                            default:
                                throw Error(u(462))
                        }
                    }
                    for (; null !== iz && !er();) ub(iz);
                    break
                } catch (t) {
                    up(e, t)
                }
                return (rj = rF = null, I.H = r, I.A = a, iD = n, null !== iz) ? 0 : (iM = null, iF = 0, n1(), i$)
            }(e, t) : uy(e, t, !0), l = r;;) {
            if (0 === a) iH && !r && us(e, t, 0, !1);
            else {
                if (n = e.current.alternate, l && ! function(e) {
                        for (var t = e;;) {
                            var n = t.tag;
                            if ((0 === n || 11 === n || 15 === n) && 16384 & t.flags && null !== (n = t.updateQueue) && null !== (n = n.stores))
                                for (var r = 0; r < n.length; r++) {
                                    var a = n[r],
                                        l = a.getSnapshot;
                                    a = a.value;
                                    try {
                                        if (!nk(l(), a)) return !1
                                    } catch (e) {
                                        return !1
                                    }
                                }
                            if (n = t.child, 16384 & t.subtreeFlags && null !== n) n.return = t, t = n;
                            else {
                                if (t === e) break;
                                for (; null === t.sibling;) {
                                    if (null === t.return || t.return === e) return !0;
                                    t = t.return
                                }
                                t.sibling.return = t.return, t = t.sibling
                            }
                        }
                        return !0
                    }(n)) {
                    a = uy(e, t, !1), l = !1;
                    continue
                }
                if (2 === a) {
                    if (l = t, e.errorRecoveryDisabledLanes & l) var o = 0;
                    else o = 0 != (o = -0x20000001 & e.pendingLanes) ? o : 0x20000000 & o ? 0x20000000 : 0;
                    if (0 !== o) {
                        t = o;
                        e: {
                            a = iK;
                            var i = e.current.memoizedState.isDehydrated;
                            if (i && (uf(e, o).flags |= 256), 2 !== (o = uy(e, o, !1))) {
                                if (iq && !i) {
                                    e.errorRecoveryDisabledLanes |= l, iQ |= l, a = 4;
                                    break e
                                }
                                l = iJ, iJ = a, null !== l && (null === iJ ? iJ = l : iJ.push.apply(iJ, l))
                            }
                            a = o
                        }
                        if (l = !1, 2 !== a) continue
                    }
                }
                if (1 === a) {
                    uf(e, 0), us(e, t, 0, !0);
                    break
                }
                e: {
                    switch (r = e, l = a) {
                        case 0:
                        case 1:
                            throw Error(u(345));
                        case 4:
                            if ((4194048 & t) !== t) break;
                        case 6:
                            us(r, t, iY, !iB);
                            break e;
                        case 2:
                            iJ = null;
                            break;
                        case 3:
                        case 5:
                            break;
                        default:
                            throw Error(u(329))
                    }
                    if ((0x3c00000 & t) === t && 10 < (a = i0 + 300 - el())) {
                        if (us(r, t, iY, !iB), 0 !== eS(r, 0, !0)) break e;
                        i9 = t, r.timeoutHandle = s_(uu.bind(null, r, n, iJ, i3, iZ, t, iY, iQ, iX, iB, l, "Throttled", -0, 0), a);
                        break e
                    }
                    uu(r, n, iJ, i3, iZ, t, iY, iQ, iX, iB, l, null, -0, 0)
                }
            }
            break
        }
        uW(e)
    }

    function uu(e, t, n, r, a, l, o, i, u, s, c, d, f, p) {
        if (e.timeoutHandle = -1, 8192 & (d = t.subtreeFlags) || 0x1002000 == (0x1002000 & d)) {
            iC(t, l, d = {
                stylesheets: null,
                count: 0,
                imgCount: 0,
                imgBytes: 0,
                suspenseyImages: [],
                waitingForImages: !0,
                waitingForViewTransition: !1,
                unsuspend: tm
            });
            var h, m, g = (0x3c00000 & l) === l ? i0 - el() : (4194048 & l) === l ? i1 - el() : 0;
            if (null !== (h = d, m = g, h.stylesheets && 0 === h.count && s5(h, h.stylesheets), g = 0 < h.count || 0 < h.imgCount ? function(e) {
                    var t = setTimeout(function() {
                        if (h.stylesheets && s5(h, h.stylesheets), h.unsuspend) {
                            var e = h.unsuspend;
                            h.unsuspend = null, e()
                        }
                    }, 6e4 + m);
                    0 < h.imgBytes && 0 === s4 && (s4 = 62500 * function() {
                        if ("function" == typeof performance.getEntriesByType) {
                            for (var e = 0, t = 0, n = performance.getEntriesByType("resource"), r = 0; r < n.length; r++) {
                                var a = n[r],
                                    l = a.transferSize,
                                    o = a.initiatorType,
                                    i = a.duration;
                                if (l && i && sf(o)) {
                                    for (o = 0, i = a.responseEnd, r += 1; r < n.length; r++) {
                                        var u = n[r],
                                            s = u.startTime;
                                        if (s > i) break;
                                        var c = u.transferSize,
                                            d = u.initiatorType;
                                        c && sf(d) && (o += c * ((u = u.responseEnd) < i ? 1 : (i - s) / (u - s)))
                                    }
                                    if (--r, t += 8 * (l + o) / (a.duration / 1e3), 10 < ++e) break
                                }
                            }
                            if (0 < e) return t / e / 1e6
                        }
                        return navigator.connection && "number" == typeof(e = navigator.connection.downlink) ? e : 5
                    }());
                    var n = setTimeout(function() {
                        if (h.waitingForImages = !1, 0 === h.count && (h.stylesheets && s5(h, h.stylesheets), h.unsuspend)) {
                            var e = h.unsuspend;
                            h.unsuspend = null, e()
                        }
                    }, (h.imgBytes > s4 ? 50 : 800) + m);
                    return h.unsuspend = e,
                        function() {
                            h.unsuspend = null, clearTimeout(t), clearTimeout(n)
                        }
                } : null)) {
                i9 = l, e.cancelPendingCommit = g(uk.bind(null, e, t, l, n, r, a, o, i, u, c, d, null, f, p)), us(e, l, o, !s);
                return
            }
        }
        uk(e, t, l, n, r, a, o, i, u)
    }

    function us(e, t, n, r) {
        t &= ~iG, t &= ~iQ, e.suspendedLanes |= t, e.pingedLanes &= ~t, r && (e.warmLanes |= t), r = e.expirationTimes;
        for (var a = t; 0 < a;) {
            var l = 31 - eh(a),
                o = 1 << l;
            r[l] = -1, a &= ~o
        }
        0 !== n && eT(e, n, t)
    }

    function uc() {
        return 0 != (6 & iD) || (u$(0, !1), !1)
    }

    function ud() {
        if (null !== iz) {
            if (0 === ij) var e = iz.return;
            else e = iz, rj = rF = null, lt(e), af = null, ap = 0, e = iz;
            for (; null !== e;) oJ(e.alternate, e), e = e.return;
            iz = null
        }
    }

    function uf(e, t) {
        var n = e.timeoutHandle; - 1 !== n && (e.timeoutHandle = -1, sS(n)), null !== (n = e.cancelPendingCommit) && (e.cancelPendingCommit = null, n()), i9 = 0, ud(), iM = e, iz = n = rt(e.current, null), iF = t, ij = 0, iU = null, iB = !1, iH = ew(e, t), iq = !1, iX = iY = iG = iQ = iV = i$ = 0, iJ = iK = null, iZ = !1, 0 != (8 & t) && (t |= 32 & t);
        var r = e.entangledLanes;
        if (0 !== r)
            for (e = e.entanglements, r &= t; 0 < r;) {
                var a = 31 - eh(r),
                    l = 1 << a;
                t |= e[a], r &= ~l
            }
        return iW = t, n1(), n
    }

    function up(e, t) {
        aQ = null, I.H = oe, t === an || t === aa ? (t = ac(), ij = 3) : t === ar ? (t = ac(), ij = 4) : ij = t === ov ? 8 : null !== t && "object" == typeof t && "function" == typeof t.then ? 6 : 1, iU = t, null === iz && (i$ = 1, of(e, rs(t, e.current)))
    }

    function uh() {
        var e = az.current;
        return null === e || ((4194048 & iF) === iF ? null === aF : ((0x3c00000 & iF) === iF || 0 != (0x20000000 & iF)) && e === aF)
    }

    function um() {
        var e = I.H;
        return I.H = oe, null === e ? oe : e
    }

    function ug() {
        var e = I.A;
        return I.A = iO, e
    }

    function uv() {
        i$ = 4, iB || (4194048 & iF) !== iF && null !== az.current || (iH = !0), 0 == (0x7ffffff & iV) && 0 == (0x7ffffff & iQ) || null === iM || us(iM, iF, iY, !1)
    }

    function uy(e, t, n) {
        var r = iD;
        iD |= 2;
        var a = um(),
            l = ug();
        (iM !== e || iF !== t) && (i3 = null, uf(e, t)), t = !1;
        var o = i$;
        e: for (;;) try {
            if (0 !== ij && null !== iz) {
                var i = iz,
                    u = iU;
                switch (ij) {
                    case 8:
                        ud(), o = 6;
                        break e;
                    case 3:
                    case 2:
                    case 9:
                    case 6:
                        null === az.current && (t = !0);
                        var s = ij;
                        if (ij = 0, iU = null, uS(e, i, u, s), n && iH) {
                            o = 0;
                            break e
                        }
                        break;
                    default:
                        s = ij, ij = 0, iU = null, uS(e, i, u, s)
                }
            }(function() {
                for (; null !== iz;) ub(iz)
            })(), o = i$;
            break
        } catch (t) {
            up(e, t)
        }
        return t && e.shellSuspendCounter++, rj = rF = null, iD = r, I.H = a, I.A = l, null === iz && (iM = null, iF = 0, n1()), o
    }

    function ub(e) {
        var t = o$(e.alternate, e, iW);
        e.memoizedProps = e.pendingProps, null === t ? uw(e) : iz = t
    }

    function u_(e) {
        var t = e,
            n = t.alternate;
        switch (t.tag) {
            case 15:
            case 0:
                t = oR(n, t, t.pendingProps, t.type, void 0, iF);
                break;
            case 11:
                t = oR(n, t, t.pendingProps, t.type.render, t.ref, iF);
                break;
            case 5:
                lt(t);
            default:
                oJ(n, t), t = o$(n, t = iz = rn(t, iW), iW)
        }
        e.memoizedProps = e.pendingProps, null === t ? uw(e) : iz = t
    }

    function uS(e, t, n, r) {
        rj = rF = null, lt(t), af = null, ap = 0;
        var a = t.return;
        try {
            if (function(e, t, n, r, a) {
                    if (n.flags |= 32768, null !== r && "object" == typeof r && "function" == typeof r.then) {
                        if (null !== (t = n.alternate) && rW(t, n, a, !0), null !== (n = az.current)) {
                            switch (n.tag) {
                                case 31:
                                case 13:
                                    return null === aF ? uv() : null === n.alternate && 0 === i$ && (i$ = 3), n.flags &= -257, n.flags |= 65536, n.lanes = a, r === al ? n.flags |= 16384 : (null === (t = n.updateQueue) ? n.updateQueue = new Set([r]) : t.add(r), uO(e, r, a)), !1;
                                case 22:
                                    return n.flags |= 65536, r === al ? n.flags |= 16384 : (null === (t = n.updateQueue) ? (t = {
                                        transitions: null,
                                        markerInstances: null,
                                        retryQueue: new Set([r])
                                    }, n.updateQueue = t) : null === (n = t.retryQueue) ? t.retryQueue = new Set([r]) : n.add(r), uO(e, r, a)), !1
                            }
                            throw Error(u(435, n.tag))
                        }
                        return uO(e, r, a), uv(), !1
                    }
                    if (rT) return null !== (t = az.current) ? (0 == (65536 & t.flags) && (t.flags |= 256), t.flags |= 65536, t.lanes = a, r !== rN && rM(rs(e = Error(u(422), {
                        cause: r
                    }), n))) : (r !== rN && rM(rs(t = Error(u(423), {
                        cause: r
                    }), n)), e = e.current.alternate, e.flags |= 65536, a &= -a, e.lanes |= a, r = rs(r, n), a = oh(e.stateNode, r, a), aT(e, a), 4 !== i$ && (i$ = 2)), !1;
                    var l = Error(u(520), {
                        cause: r
                    });
                    if (l = rs(l, n), null === iK ? iK = [l] : iK.push(l), 4 !== i$ && (i$ = 2), null === t) return !0;
                    r = rs(r, n), n = t;
                    do {
                        switch (n.tag) {
                            case 3:
                                return n.flags |= 65536, e = a & -a, n.lanes |= e, e = oh(n.stateNode, r, e), aT(n, e), !1;
                            case 1:
                                if (t = n.type, l = n.stateNode, 0 == (128 & n.flags) && ("function" == typeof t.getDerivedStateFromError || null !== l && "function" == typeof l.componentDidCatch && (null === i4 || !i4.has(l)))) return n.flags |= 65536, a &= -a, n.lanes |= a, og(a = om(a), e, n, r), aT(n, a), !1
                        }
                        n = n.return
                    } while (null !== n) return !1
                }(e, a, t, n, iF)) {
                i$ = 1, of(e, rs(n, e.current)), iz = null;
                return
            }
        } catch (t) {
            if (null !== a) throw iz = a, t;
            i$ = 1, of(e, rs(n, e.current)), iz = null;
            return
        }
        32768 & t.flags ? (rT || 1 === r ? e = !0 : iH || 0 != (0x20000000 & iF) ? e = !1 : (iB = e = !0, (2 === r || 9 === r || 3 === r || 6 === r) && null !== (r = az.current) && 13 === r.tag && (r.flags |= 16384)), uE(t, e)) : uw(t)
    }

    function uw(e) {
        var t = e;
        do {
            if (0 != (32768 & t.flags)) return void uE(t, iB);
            e = t.return;
            var n = function(e, t, n) {
                var r = t.pendingProps;
                switch (rw(t), t.tag) {
                    case 16:
                    case 15:
                    case 0:
                    case 11:
                    case 7:
                    case 8:
                    case 12:
                    case 9:
                    case 14:
                    case 1:
                        return oK(t), null;
                    case 3:
                        return n = t.stateNode, r = null, null !== e && (r = e.memoizedState.cache), t.memoizedState.cache !== r && (t.flags |= 2048), rB(rZ), Q(), n.pendingContext && (n.context = n.pendingContext, n.pendingContext = null), (null === e || null === e.child) && (rO(t) ? oV(t) : null === e || e.memoizedState.isDehydrated && 0 == (256 & t.flags) || (t.flags |= 1024, rD())), oK(t), null;
                    case 26:
                        var a = t.type,
                            l = t.memoizedState;
                        return null === e ? (oV(t), null !== l ? (oK(t), oG(t, l)) : (oK(t), oQ(t, a, null, r, n))) : l ? l !== e.memoizedState ? (oV(t), oK(t), oG(t, l)) : (oK(t), t.flags &= -0x1000001) : ((e = e.memoizedProps) !== r && oV(t), oK(t), oQ(t, a, e, r, n)), null;
                    case 27:
                        if (Y(t), n = W.current, a = t.type, null !== e && null != t.stateNode) e.memoizedProps !== r && oV(t);
                        else {
                            if (!r) {
                                if (null === t.stateNode) throw Error(u(166));
                                return oK(t), null
                            }
                            e = H.current, rO(t) ? rA(t) : (t.stateNode = e = sM(a, r, n), oV(t))
                        }
                        return oK(t), null;
                    case 5:
                        if (Y(t), a = t.type, null !== e && null != t.stateNode) e.memoizedProps !== r && oV(t);
                        else {
                            if (!r) {
                                if (null === t.stateNode) throw Error(u(166));
                                return oK(t), null
                            }
                            if (l = H.current, rO(t)) rA(t);
                            else {
                                var o = sm(W.current);
                                switch (l) {
                                    case 1:
                                        l = o.createElementNS("http://www.w3.org/2000/svg", a);
                                        break;
                                    case 2:
                                        l = o.createElementNS("http://www.w3.org/1998/Math/MathML", a);
                                        break;
                                    default:
                                        switch (a) {
                                            case "svg":
                                                l = o.createElementNS("http://www.w3.org/2000/svg", a);
                                                break;
                                            case "math":
                                                l = o.createElementNS("http://www.w3.org/1998/Math/MathML", a);
                                                break;
                                            case "script":
                                                (l = o.createElement("div")).innerHTML = "<script></script>", l = l.removeChild(l.firstChild);
                                                break;
                                            case "select":
                                                l = "string" == typeof r.is ? o.createElement("select", {
                                                    is: r.is
                                                }) : o.createElement("select"), r.multiple ? l.multiple = !0 : r.size && (l.size = r.size);
                                                break;
                                            default:
                                                l = "string" == typeof r.is ? o.createElement(a, {
                                                    is: r.is
                                                }) : o.createElement(a)
                                        }
                                }
                                l[eI] = t, l[eD] = r;
                                e: for (o = t.child; null !== o;) {
                                    if (5 === o.tag || 6 === o.tag) l.appendChild(o.stateNode);
                                    else if (4 !== o.tag && 27 !== o.tag && null !== o.child) {
                                        o.child.return = o, o = o.child;
                                        continue
                                    }
                                    if (o === t) break;
                                    for (; null === o.sibling;) {
                                        if (null === o.return || o.return === t) break e;
                                        o = o.return
                                    }
                                    o.sibling.return = o.return, o = o.sibling
                                }
                                switch (t.stateNode = l, sd(l, a, r), a) {
                                    case "button":
                                    case "input":
                                    case "select":
                                    case "textarea":
                                        r = !!r.autoFocus;
                                        break;
                                    case "img":
                                        r = !0;
                                        break;
                                    default:
                                        r = !1
                                }
                                r && oV(t)
                            }
                        }
                        return oK(t), oQ(t, t.type, null === e ? null : e.memoizedProps, t.pendingProps, n), null;
                    case 6:
                        if (e && null != t.stateNode) e.memoizedProps !== r && oV(t);
                        else {
                            if ("string" != typeof r && null === t.stateNode) throw Error(u(166));
                            if (e = W.current, rO(t)) {
                                if (e = t.stateNode, n = t.memoizedProps, r = null, null !== (a = rk)) switch (a.tag) {
                                    case 27:
                                    case 5:
                                        r = a.memoizedProps
                                }
                                e[eI] = t, (e = !!(e.nodeValue === n || null !== r && !0 === r.suppressHydrationWarning || su(e.nodeValue, n))) || rR(t, !0)
                            } else(e = sm(e).createTextNode(r))[eI] = t, t.stateNode = e
                        }
                        return oK(t), null;
                    case 31:
                        if (n = t.memoizedState, null === e || null !== e.memoizedState) {
                            if (r = rO(t), null !== n) {
                                if (null === e) {
                                    if (!r) throw Error(u(318));
                                    if (!(e = null !== (e = t.memoizedState) ? e.dehydrated : null)) throw Error(u(557));
                                    e[eI] = t
                                } else rI(), 0 == (128 & t.flags) && (t.memoizedState = null), t.flags |= 4;
                                oK(t), e = !1
                            } else n = rD(), null !== e && null !== e.memoizedState && (e.memoizedState.hydrationErrors = n), e = !0;
                            if (!e) {
                                if (256 & t.flags) return aq(t), t;
                                return aq(t), null
                            }
                            if (0 != (128 & t.flags)) throw Error(u(558))
                        }
                        return oK(t), null;
                    case 13:
                        if (r = t.memoizedState, null === e || null !== e.memoizedState && null !== e.memoizedState.dehydrated) {
                            if (a = rO(t), null !== r && null !== r.dehydrated) {
                                if (null === e) {
                                    if (!a) throw Error(u(318));
                                    if (!(a = null !== (a = t.memoizedState) ? a.dehydrated : null)) throw Error(u(317));
                                    a[eI] = t
                                } else rI(), 0 == (128 & t.flags) && (t.memoizedState = null), t.flags |= 4;
                                oK(t), a = !1
                            } else a = rD(), null !== e && null !== e.memoizedState && (e.memoizedState.hydrationErrors = a), a = !0;
                            if (!a) {
                                if (256 & t.flags) return aq(t), t;
                                return aq(t), null
                            }
                        }
                        if (aq(t), 0 != (128 & t.flags)) return t.lanes = n, t;
                        return n = null !== r, e = null !== e && null !== e.memoizedState, n && (r = t.child, a = null, null !== r.alternate && null !== r.alternate.memoizedState && null !== r.alternate.memoizedState.cachePool && (a = r.alternate.memoizedState.cachePool.pool), l = null, null !== r.memoizedState && null !== r.memoizedState.cachePool && (l = r.memoizedState.cachePool.pool), l !== a && (r.flags |= 2048)), n !== e && n && (t.child.flags |= 8192), oY(t, t.updateQueue), oK(t), null;
                    case 4:
                        return Q(), null === e && u9(t.stateNode.containerInfo), oK(t), null;
                    case 10:
                        return rB(t.type), oK(t), null;
                    case 19:
                        if (U(aW), null === (r = t.memoizedState)) return oK(t), null;
                        if (a = 0 != (128 & t.flags), null === (l = r.rendering))
                            if (a) oX(r, !1);
                            else {
                                if (0 !== i$ || null !== e && 0 != (128 & e.flags))
                                    for (e = t.child; null !== e;) {
                                        if (null !== (l = a$(e))) {
                                            for (t.flags |= 128, oX(r, !1), t.updateQueue = e = l.updateQueue, oY(t, e), t.subtreeFlags = 0, e = n, n = t.child; null !== n;) rn(n, e), n = n.sibling;
                                            return B(aW, 1 & aW.current | 2), rT && rb(t, r.treeForkCount), t.child
                                        }
                                        e = e.sibling
                                    }
                                null !== r.tail && el() > i2 && (t.flags |= 128, a = !0, oX(r, !1), t.lanes = 4194304)
                            }
                        else {
                            if (!a)
                                if (null !== (e = a$(l))) {
                                    if (t.flags |= 128, a = !0, t.updateQueue = e = e.updateQueue, oY(t, e), oX(r, !0), null === r.tail && "hidden" === r.tailMode && !l.alternate && !rT) return oK(t), null
                                } else 2 * el() - r.renderingStartTime > i2 && 0x20000000 !== n && (t.flags |= 128, a = !0, oX(r, !1), t.lanes = 4194304);
                            r.isBackwards ? (l.sibling = t.child, t.child = l) : (null !== (e = r.last) ? e.sibling = l : t.child = l, r.last = l)
                        }
                        if (null !== r.tail) return e = r.tail, r.rendering = e, r.tail = e.sibling, r.renderingStartTime = el(), e.sibling = null, n = aW.current, B(aW, a ? 1 & n | 2 : 1 & n), rT && rb(t, r.treeForkCount), e;
                        return oK(t), null;
                    case 22:
                    case 23:
                        return aq(t), aM(), r = null !== t.memoizedState, null !== e ? null !== e.memoizedState !== r && (t.flags |= 8192) : r && (t.flags |= 8192), r ? 0 != (0x20000000 & n) && 0 == (128 & t.flags) && (oK(t), 6 & t.subtreeFlags && (t.flags |= 8192)) : oK(t), null !== (n = t.updateQueue) && oY(t, n.retryQueue), n = null, null !== e && null !== e.memoizedState && null !== e.memoizedState.cachePool && (n = e.memoizedState.cachePool.pool), r = null, null !== t.memoizedState && null !== t.memoizedState.cachePool && (r = t.memoizedState.cachePool.pool), r !== n && (t.flags |= 2048), null !== e && U(r9), null;
                    case 24:
                        return n = null, null !== e && (n = e.memoizedState.cache), t.memoizedState.cache !== n && (t.flags |= 2048), rB(rZ), oK(t), null;
                    case 25:
                    case 30:
                        return null
                }
                throw Error(u(156, t.tag))
            }(t.alternate, t, iW);
            if (null !== n) {
                iz = n;
                return
            }
            if (null !== (t = t.sibling)) {
                iz = t;
                return
            }
            iz = t = e
        } while (null !== t) 0 === i$ && (i$ = 5)
    }

    function uE(e, t) {
        do {
            var n = function(e, t) {
                switch (rw(t), t.tag) {
                    case 1:
                        return 65536 & (e = t.flags) ? (t.flags = -65537 & e | 128, t) : null;
                    case 3:
                        return rB(rZ), Q(), 0 != (65536 & (e = t.flags)) && 0 == (128 & e) ? (t.flags = -65537 & e | 128, t) : null;
                    case 26:
                    case 27:
                    case 5:
                        return Y(t), null;
                    case 31:
                        if (null !== t.memoizedState) {
                            if (aq(t), null === t.alternate) throw Error(u(340));
                            rI()
                        }
                        return 65536 & (e = t.flags) ? (t.flags = -65537 & e | 128, t) : null;
                    case 13:
                        if (aq(t), null !== (e = t.memoizedState) && null !== e.dehydrated) {
                            if (null === t.alternate) throw Error(u(340));
                            rI()
                        }
                        return 65536 & (e = t.flags) ? (t.flags = -65537 & e | 128, t) : null;
                    case 19:
                        return U(aW), null;
                    case 4:
                        return Q(), null;
                    case 10:
                        return rB(t.type), null;
                    case 22:
                    case 23:
                        return aq(t), aM(), null !== e && U(r9), 65536 & (e = t.flags) ? (t.flags = -65537 & e | 128, t) : null;
                    case 24:
                        return rB(rZ), null;
                    default:
                        return null
                }
            }(e.alternate, e);
            if (null !== n) {
                n.flags &= 32767, iz = n;
                return
            }
            if (null !== (n = e.return) && (n.flags |= 32768, n.subtreeFlags = 0, n.deletions = null), !t && null !== (e = e.sibling)) {
                iz = e;
                return
            }
            iz = e = n
        } while (null !== e) i$ = 6, iz = null
    }

    function uk(e, t, n, r, a, l, o, i, s) {
        e.cancelPendingCommit = null;
        do uN(); while (0 !== i6) if (0 != (6 & iD)) throw Error(u(327));
        if (null !== t) {
            if (t === e.current) throw Error(u(177));
            if (! function(e, t, n, r, a, l) {
                    var o = e.pendingLanes;
                    e.pendingLanes = n, e.suspendedLanes = 0, e.pingedLanes = 0, e.warmLanes = 0, e.expiredLanes &= n, e.entangledLanes &= n, e.errorRecoveryDisabledLanes &= n, e.shellSuspendCounter = 0;
                    var i = e.entanglements,
                        u = e.expirationTimes,
                        s = e.hiddenUpdates;
                    for (n = o & ~n; 0 < n;) {
                        var c = 31 - eh(n),
                            d = 1 << c;
                        i[c] = 0, u[c] = -1;
                        var f = s[c];
                        if (null !== f)
                            for (s[c] = null, c = 0; c < f.length; c++) {
                                var p = f[c];
                                null !== p && (p.lane &= -0x20000001)
                            }
                        n &= ~d
                    }
                    0 !== r && eT(e, r, 0), 0 !== l && 0 === a && 0 !== e.tag && (e.suspendedLanes |= l & ~(o & ~t))
                }(e, n, l = t.lanes | t.childLanes | n0, o, i, s), e === iM && (iz = iM = null, iF = 0), i5 = t, i8 = e, i9 = n, i7 = l, ue = a, ut = r, 0 != (10256 & t.subtreeFlags) || 0 != (10256 & t.flags) ? (e.callbackNode = null, e.callbackPriority = 0, et(es, function() {
                    return uR(), null
                })) : (e.callbackNode = null, e.callbackPriority = 0), r = 0 != (13878 & t.flags), 0 != (13878 & t.subtreeFlags) || r) {
                r = I.T, I.T = null, a = D.p, D.p = 2, o = iD, iD |= 4;
                try {
                    ! function(e, t) {
                        if (e = e.containerInfo, sp = ci, nN(e = nC(e))) {
                            if ("selectionStart" in e) var n = {
                                start: e.selectionStart,
                                end: e.selectionEnd
                            };
                            else e: {
                                var r = (n = (n = e.ownerDocument) && n.defaultView || window).getSelection && n.getSelection();
                                if (r && 0 !== r.rangeCount) {
                                    n = r.anchorNode;
                                    var a, l = r.anchorOffset,
                                        o = r.focusNode;
                                    r = r.focusOffset;
                                    try {
                                        n.nodeType, o.nodeType
                                    } catch (e) {
                                        n = null;
                                        break e
                                    }
                                    var i = 0,
                                        s = -1,
                                        c = -1,
                                        d = 0,
                                        f = 0,
                                        p = e,
                                        h = null;
                                    t: for (;;) {
                                        for (; p !== n || 0 !== l && 3 !== p.nodeType || (s = i + l), p !== o || 0 !== r && 3 !== p.nodeType || (c = i + r), 3 === p.nodeType && (i += p.nodeValue.length), null !== (a = p.firstChild);) h = p, p = a;
                                        for (;;) {
                                            if (p === e) break t;
                                            if (h === n && ++d === l && (s = i), h === o && ++f === r && (c = i), null !== (a = p.nextSibling)) break;
                                            h = (p = h).parentNode
                                        }
                                        p = a
                                    }
                                    n = -1 === s || -1 === c ? null : {
                                        start: s,
                                        end: c
                                    }
                                } else n = null
                            }
                            n = n || {
                                start: 0,
                                end: 0
                            }
                        } else n = null;
                        for (sh = {
                                focusedElem: e,
                                selectionRange: n
                            }, ci = !1, io = t; null !== io;)
                            if (e = (t = io).child, 0 != (1028 & t.subtreeFlags) && null !== e) e.return = t, io = e;
                            else
                                for (; null !== io;) {
                                    switch (o = (t = io).alternate, e = t.flags, t.tag) {
                                        case 0:
                                            if (0 != (4 & e) && null !== (e = null !== (e = t.updateQueue) ? e.events : null))
                                                for (n = 0; n < e.length; n++)(l = e[n]).ref.impl = l.nextImpl;
                                            break;
                                        case 11:
                                        case 15:
                                        case 5:
                                        case 26:
                                        case 27:
                                        case 6:
                                        case 4:
                                        case 17:
                                            break;
                                        case 1:
                                            if (0 != (1024 & e) && null !== o) {
                                                e = void 0, n = t, l = o.memoizedProps, o = o.memoizedState, r = n.stateNode;
                                                try {
                                                    var m = ou(n.type, l);
                                                    e = r.getSnapshotBeforeUpdate(m, o), r.__reactInternalSnapshotBeforeUpdate = e
                                                } catch (e) {
                                                    uL(n, n.return, e)
                                                }
                                            }
                                            break;
                                        case 3:
                                            if (0 != (1024 & e)) {
                                                if (9 === (n = (e = t.stateNode.containerInfo).nodeType)) sC(e);
                                                else if (1 === n) switch (e.nodeName) {
                                                    case "HEAD":
                                                    case "HTML":
                                                    case "BODY":
                                                        sC(e);
                                                        break;
                                                    default:
                                                        e.textContent = ""
                                                }
                                            }
                                            break;
                                        default:
                                            if (0 != (1024 & e)) throw Error(u(163))
                                    }
                                    if (null !== (e = t.sibling)) {
                                        e.return = t.return, io = e;
                                        break
                                    }
                                    io = t.return
                                }
                    }(e, t)
                } finally {
                    iD = o, D.p = a, I.T = r
                }
            }
            i6 = 1, ux(), uT(), uP()
        }
    }

    function ux() {
        if (1 === i6) {
            i6 = 0;
            var e = i8,
                t = i5,
                n = 0 != (13878 & t.flags);
            if (0 != (13878 & t.subtreeFlags) || n) {
                n = I.T, I.T = null;
                var r = D.p;
                D.p = 2;
                var a = iD;
                iD |= 4;
                try {
                    iy(t, e);
                    var l = sh,
                        o = nC(e.containerInfo),
                        i = l.focusedElem,
                        u = l.selectionRange;
                    if (o !== i && i && i.ownerDocument && function e(t, n) {
                            return !!t && !!n && (t === n || (!t || 3 !== t.nodeType) && (n && 3 === n.nodeType ? e(t, n.parentNode) : "contains" in t ? t.contains(n) : !!t.compareDocumentPosition && !!(16 & t.compareDocumentPosition(n))))
                        }(i.ownerDocument.documentElement, i)) {
                        if (null !== u && nN(i)) {
                            var s = u.start,
                                c = u.end;
                            if (void 0 === c && (c = s), "selectionStart" in i) i.selectionStart = s, i.selectionEnd = Math.min(c, i.value.length);
                            else {
                                var d = i.ownerDocument || document,
                                    f = d && d.defaultView || window;
                                if (f.getSelection) {
                                    var p = f.getSelection(),
                                        h = i.textContent.length,
                                        m = Math.min(u.start, h),
                                        g = void 0 === u.end ? m : Math.min(u.end, h);
                                    !p.extend && m > g && (o = g, g = m, m = o);
                                    var v = nP(i, m),
                                        y = nP(i, g);
                                    if (v && y && (1 !== p.rangeCount || p.anchorNode !== v.node || p.anchorOffset !== v.offset || p.focusNode !== y.node || p.focusOffset !== y.offset)) {
                                        var b = d.createRange();
                                        b.setStart(v.node, v.offset), p.removeAllRanges(), m > g ? (p.addRange(b), p.extend(y.node, y.offset)) : (b.setEnd(y.node, y.offset), p.addRange(b))
                                    }
                                }
                            }
                        }
                        for (d = [], p = i; p = p.parentNode;) 1 === p.nodeType && d.push({
                            element: p,
                            left: p.scrollLeft,
                            top: p.scrollTop
                        });
                        for ("function" == typeof i.focus && i.focus(), i = 0; i < d.length; i++) {
                            var _ = d[i];
                            _.element.scrollLeft = _.left, _.element.scrollTop = _.top
                        }
                    }
                    ci = !!sp, sh = sp = null
                } finally {
                    iD = a, D.p = r, I.T = n
                }
            }
            e.current = t, i6 = 2
        }
    }

    function uT() {
        if (2 === i6) {
            i6 = 0;
            var e = i8,
                t = i5,
                n = 0 != (8772 & t.flags);
            if (0 != (8772 & t.subtreeFlags) || n) {
                n = I.T, I.T = null;
                var r = D.p;
                D.p = 2;
                var a = iD;
                iD |= 4;
                try {
                    ii(e, t.alternate, t)
                } finally {
                    iD = a, D.p = r, I.T = n
                }
            }
            i6 = 3
        }
    }

    function uP() {
        if (4 === i6 || 3 === i6) {
            i6 = 0, ea();
            var e = i8,
                t = i5,
                n = i9,
                r = ut;
            0 != (10256 & t.subtreeFlags) || 0 != (10256 & t.flags) ? i6 = 5 : (i6 = 0, i5 = i8 = null, uC(e, e.pendingLanes));
            var a = e.pendingLanes;
            if (0 === a && (i4 = null), eR(n), t = t.stateNode, ep && "function" == typeof ep.onCommitFiberRoot) try {
                ep.onCommitFiberRoot(ef, t, void 0, 128 == (128 & t.current.flags))
            } catch (e) {}
            if (null !== r) {
                t = I.T, a = D.p, D.p = 2, I.T = null;
                try {
                    for (var l = e.onRecoverableError, o = 0; o < r.length; o++) {
                        var i = r[o];
                        l(i.value, {
                            componentStack: i.stack
                        })
                    }
                } finally {
                    I.T = t, D.p = a
                }
            }
            0 != (3 & i9) && uN(), uW(e), a = e.pendingLanes, 0 != (261930 & n) && 0 != (42 & a) ? e === ur ? un++ : (un = 0, ur = e) : un = 0, u$(0, !1)
        }
    }

    function uC(e, t) {
        0 == (e.pooledCacheLanes &= t) && null != (t = e.pooledCache) && (e.pooledCache = null, r1(t))
    }

    function uN() {
        return ux(), uT(), uP(), uR()
    }

    function uR() {
        if (5 !== i6) return !1;
        var e = i8,
            t = i7;
        i7 = 0;
        var n = eR(i9),
            r = I.T,
            a = D.p;
        try {
            D.p = 32 > n ? 32 : n, I.T = null, n = ue, ue = null;
            var l = i8,
                o = i9;
            if (i6 = 0, i5 = i8 = null, i9 = 0, 0 != (6 & iD)) throw Error(u(331));
            var i = iD;
            if (iD |= 4, iA(l.current), ik(l, l.current, o, n), iD = i, u$(0, !1), ep && "function" == typeof ep.onPostCommitFiberRoot) try {
                ep.onPostCommitFiberRoot(ef, l)
            } catch (e) {}
            return !0
        } finally {
            D.p = a, I.T = r, uC(e, t)
        }
    }

    function uA(e, t, n) {
        t = rs(n, t), t = oh(e.stateNode, t, 2), null !== (e = ak(e, t, 2)) && (ex(e, 2), uW(e))
    }

    function uL(e, t, n) {
        if (3 === e.tag) uA(e, e, n);
        else
            for (; null !== t;) {
                if (3 === t.tag) {
                    uA(t, e, n);
                    break
                }
                if (1 === t.tag) {
                    var r = t.stateNode;
                    if ("function" == typeof t.type.getDerivedStateFromError || "function" == typeof r.componentDidCatch && (null === i4 || !i4.has(r))) {
                        e = rs(n, e), null !== (r = ak(t, n = om(2), 2)) && (og(n, r, t, e), ex(r, 2), uW(r));
                        break
                    }
                }
                t = t.return
            }
    }

    function uO(e, t, n) {
        var r = e.pingCache;
        if (null === r) {
            r = e.pingCache = new iI;
            var a = new Set;
            r.set(t, a)
        } else void 0 === (a = r.get(t)) && (a = new Set, r.set(t, a));
        a.has(n) || (iq = !0, a.add(n), e = uI.bind(null, e, t, n), t.then(e, e))
    }

    function uI(e, t, n) {
        var r = e.pingCache;
        null !== r && r.delete(t), e.pingedLanes |= e.suspendedLanes & n, e.warmLanes &= ~n, iM === e && (iF & n) === n && (4 === i$ || 3 === i$ && (0x3c00000 & iF) === iF && 300 > el() - i0 ? 0 == (2 & iD) && uf(e, 0) : iG |= n, iX === iF && (iX = 0)), uW(e)
    }

    function uD(e, t) {
        0 === t && (t = eE()), null !== (e = n4(e, t)) && (ex(e, t), uW(e))
    }

    function uM(e) {
        var t = e.memoizedState,
            n = 0;
        null !== t && (n = t.retryLane), uD(e, n)
    }

    function uz(e, t) {
        var n = 0;
        switch (e.tag) {
            case 31:
            case 13:
                var r = e.stateNode,
                    a = e.memoizedState;
                null !== a && (n = a.retryLane);
                break;
            case 19:
                r = e.stateNode;
                break;
            case 22:
                r = e.stateNode._retryCache;
                break;
            default:
                throw Error(u(314))
        }
        null !== r && r.delete(t), uD(e, n)
    }
    var uF = null,
        uj = null,
        uU = !1,
        uB = !1,
        uH = !1,
        uq = 0;

    function uW(e) {
        e !== uj && null === e.next && (null === uj ? uF = uj = e : uj = uj.next = e), uB = !0, uU || (uU = !0, sE(function() {
            0 != (6 & iD) ? et(ei, uV) : uQ()
        }))
    }

    function u$(e, t) {
        if (!uH && uB) {
            uH = !0;
            do
                for (var n = !1, r = uF; null !== r;) {
                    if (!t)
                        if (0 !== e) {
                            var a = r.pendingLanes;
                            if (0 === a) var l = 0;
                            else {
                                var o = r.suspendedLanes,
                                    i = r.pingedLanes;
                                l = 0xc000095 & (l = (1 << 31 - eh(42 | e) + 1) - 1 & (a & ~(o & ~i))) ? 0xc000095 & l | 1 : l ? 2 | l : 0
                            }
                            0 !== l && (n = !0, uX(r, l))
                        } else l = iF, 0 == (3 & (l = eS(r, r === iM ? l : 0, null !== r.cancelPendingCommit || -1 !== r.timeoutHandle))) || ew(r, l) || (n = !0, uX(r, l));
                    r = r.next
                }
            while (n) uH = !1
        }
    }

    function uV() {
        uQ()
    }

    function uQ() {
        uB = uU = !1;
        var e, t = 0;
        0 === uq || ((e = window.event) && "popstate" === e.type ? e === sb || (sb = e, 0) : (sb = null, 1)) || (t = uq);
        for (var n = el(), r = null, a = uF; null !== a;) {
            var l = a.next,
                o = uG(a, n);
            0 === o ? (a.next = null, null === r ? uF = l : r.next = l, null === l && (uj = r)) : (r = a, (0 !== t || 0 != (3 & o)) && (uB = !0)), a = l
        }
        0 !== i6 && 5 !== i6 || u$(t, !1), 0 !== uq && (uq = 0)
    }

    function uG(e, t) {
        for (var n = e.suspendedLanes, r = e.pingedLanes, a = e.expirationTimes, l = -0x3c00001 & e.pendingLanes; 0 < l;) {
            var o = 31 - eh(l),
                i = 1 << o,
                u = a[o]; - 1 === u ? (0 == (i & n) || 0 != (i & r)) && (a[o] = function(e, t) {
                switch (e) {
                    case 1:
                    case 2:
                    case 4:
                    case 8:
                    case 64:
                        return t + 250;
                    case 16:
                    case 32:
                    case 128:
                    case 256:
                    case 512:
                    case 1024:
                    case 2048:
                    case 4096:
                    case 8192:
                    case 16384:
                    case 32768:
                    case 65536:
                    case 131072:
                    case 262144:
                    case 524288:
                    case 1048576:
                    case 2097152:
                        return t + 5e3;
                    default:
                        return -1
                }
            }(i, t)) : u <= t && (e.expiredLanes |= i), l &= ~i
        }
        if (t = iM, n = iF, n = eS(e, e === t ? n : 0, null !== e.cancelPendingCommit || -1 !== e.timeoutHandle), r = e.callbackNode, 0 === n || e === t && (2 === ij || 9 === ij) || null !== e.cancelPendingCommit) return null !== r && null !== r && en(r), e.callbackNode = null, e.callbackPriority = 0;
        if (0 == (3 & n) || ew(e, n)) {
            if ((t = n & -n) === e.callbackPriority) return t;
            switch (null !== r && en(r), eR(n)) {
                case 2:
                case 8:
                    n = eu;
                    break;
                case 32:
                default:
                    n = es;
                    break;
                case 0x10000000:
                    n = ed
            }
            return n = et(n, r = uY.bind(null, e)), e.callbackPriority = t, e.callbackNode = n, t
        }
        return null !== r && null !== r && en(r), e.callbackPriority = 2, e.callbackNode = null, 2
    }

    function uY(e, t) {
        if (0 !== i6 && 5 !== i6) return e.callbackNode = null, e.callbackPriority = 0, null;
        var n = e.callbackNode;
        if (uN() && e.callbackNode !== n) return null;
        var r = iF;
        return 0 === (r = eS(e, e === iM ? r : 0, null !== e.cancelPendingCommit || -1 !== e.timeoutHandle)) ? null : (ui(e, r, t), uG(e, el()), null != e.callbackNode && e.callbackNode === n ? uY.bind(null, e) : null)
    }

    function uX(e, t) {
        if (uN()) return null;
        ui(e, t, !0)
    }

    function uK() {
        if (0 === uq) {
            var e = r4;
            0 === e && (e = ev, 0 == (261888 & (ev <<= 1)) && (ev = 256)), uq = e
        }
        return uq
    }

    function uJ(e) {
        return null == e || "symbol" == typeof e || "boolean" == typeof e ? null : "function" == typeof e ? e : th("" + e)
    }

    function uZ(e, t) {
        var n = t.ownerDocument.createElement("input");
        return n.name = t.name, n.value = t.value, e.id && n.setAttribute("form", e.id), t.parentNode.insertBefore(n, t), e = new FormData(e), n.parentNode.removeChild(n), e
    }
    for (var u0 = 0; u0 < nY.length; u0++) {
        var u1 = nY[u0];
        nX(u1.toLowerCase(), "on" + (u1[0].toUpperCase() + u1.slice(1)))
    }
    nX(nB, "onAnimationEnd"), nX(nH, "onAnimationIteration"), nX(nq, "onAnimationStart"), nX("dblclick", "onDoubleClick"), nX("focusin", "onFocus"), nX("focusout", "onBlur"), nX(nW, "onTransitionRun"), nX(n$, "onTransitionStart"), nX(nV, "onTransitionCancel"), nX(nQ, "onTransitionEnd"), eK("onMouseEnter", ["mouseout", "mouseover"]), eK("onMouseLeave", ["mouseout", "mouseover"]), eK("onPointerEnter", ["pointerout", "pointerover"]), eK("onPointerLeave", ["pointerout", "pointerover"]), eX("onChange", "change click focusin focusout input keydown keyup selectionchange".split(" ")), eX("onSelect", "focusout contextmenu dragend focusin keydown keyup mousedown mouseup selectionchange".split(" ")), eX("onBeforeInput", ["compositionend", "keypress", "textInput", "paste"]), eX("onCompositionEnd", "compositionend focusout keydown keypress keyup mousedown".split(" ")), eX("onCompositionStart", "compositionstart focusout keydown keypress keyup mousedown".split(" ")), eX("onCompositionUpdate", "compositionupdate focusout keydown keypress keyup mousedown".split(" "));
    var u2 = "abort canplay canplaythrough durationchange emptied encrypted ended error loadeddata loadedmetadata loadstart pause play playing progress ratechange resize seeked seeking stalled suspend timeupdate volumechange waiting".split(" "),
        u3 = new Set("beforetoggle cancel close invalid load scroll scrollend toggle".split(" ").concat(u2));

    function u4(e, t) {
        t = 0 != (4 & t);
        for (var n = 0; n < e.length; n++) {
            var r = e[n],
                a = r.event;
            r = r.listeners;
            e: {
                var l = void 0;
                if (t)
                    for (var o = r.length - 1; 0 <= o; o--) {
                        var i = r[o],
                            u = i.instance,
                            s = i.currentTarget;
                        if (i = i.listener, u !== l && a.isPropagationStopped()) break e;
                        l = i, a.currentTarget = s;
                        try {
                            l(a)
                        } catch (e) {
                            nK(e)
                        }
                        a.currentTarget = null, l = u
                    } else
                        for (o = 0; o < r.length; o++) {
                            if (u = (i = r[o]).instance, s = i.currentTarget, i = i.listener, u !== l && a.isPropagationStopped()) break e;
                            l = i, a.currentTarget = s;
                            try {
                                l(a)
                            } catch (e) {
                                nK(e)
                            }
                            a.currentTarget = null, l = u
                        }
            }
        }
    }

    function u6(e, t) {
        var n = t[ez];
        void 0 === n && (n = t[ez] = new Set);
        var r = e + "__bubble";
        n.has(r) || (u7(t, e, 2, !1), n.add(r))
    }

    function u8(e, t, n) {
        var r = 0;
        t && (r |= 4), u7(n, e, r, t)
    }
    var u5 = "_reactListening" + Math.random().toString(36).slice(2);

    function u9(e) {
        if (!e[u5]) {
            e[u5] = !0, eG.forEach(function(t) {
                "selectionchange" !== t && (u3.has(t) || u8(t, !1, e), u8(t, !0, e))
            });
            var t = 9 === e.nodeType ? e : e.ownerDocument;
            null === t || t[u5] || (t[u5] = !0, u8("selectionchange", !1, t))
        }
    }

    function u7(e, t, n, r) {
        switch (ch(t)) {
            case 2:
                var a = cu;
                break;
            case 8:
                a = cs;
                break;
            default:
                a = cc
        }
        n = a.bind(null, t, n, e), a = void 0, tx && ("touchstart" === t || "touchmove" === t || "wheel" === t) && (a = !0), r ? void 0 !== a ? e.addEventListener(t, n, {
            capture: !0,
            passive: a
        }) : e.addEventListener(t, n, !0) : void 0 !== a ? e.addEventListener(t, n, {
            passive: a
        }) : e.addEventListener(t, n, !1)
    }

    function se(e, t, n, r, a) {
        var l = r;
        if (0 == (1 & t) && 0 == (2 & t) && null !== r) e: for (;;) {
            if (null === r) return;
            var o = r.tag;
            if (3 === o || 4 === o) {
                var i = r.stateNode.containerInfo;
                if (i === a) break;
                if (4 === o)
                    for (o = r.return; null !== o;) {
                        var u = o.tag;
                        if ((3 === u || 4 === u) && o.stateNode.containerInfo === a) return;
                        o = o.return
                    }
                for (; null !== i;) {
                    if (null === (o = eq(i))) return;
                    if (5 === (u = o.tag) || 6 === u || 26 === u || 27 === u) {
                        r = l = o;
                        continue e
                    }
                    i = i.parentNode
                }
            }
            r = r.return
        }
        tw(function() {
            var r = l,
                a = tv(n),
                o = [];
            e: {
                var i = nG.get(e);
                if (void 0 !== i) {
                    var u = tB,
                        s = e;
                    switch (e) {
                        case "keypress":
                            if (0 === tA(n)) break e;
                        case "keydown":
                        case "keyup":
                            u = t2;
                            break;
                        case "focusin":
                            s = "focus", u = tQ;
                            break;
                        case "focusout":
                            s = "blur", u = tQ;
                            break;
                        case "beforeblur":
                        case "afterblur":
                            u = tQ;
                            break;
                        case "click":
                            if (2 === n.button) break e;
                        case "auxclick":
                        case "dblclick":
                        case "mousedown":
                        case "mousemove":
                        case "mouseup":
                        case "mouseout":
                        case "mouseover":
                        case "contextmenu":
                            u = t$;
                            break;
                        case "drag":
                        case "dragend":
                        case "dragenter":
                        case "dragexit":
                        case "dragleave":
                        case "dragover":
                        case "dragstart":
                        case "drop":
                            u = tV;
                            break;
                        case "touchcancel":
                        case "touchend":
                        case "touchmove":
                        case "touchstart":
                            u = t4;
                            break;
                        case nB:
                        case nH:
                        case nq:
                            u = tG;
                            break;
                        case nQ:
                            u = t6;
                            break;
                        case "scroll":
                        case "scrollend":
                            u = tq;
                            break;
                        case "wheel":
                            u = t8;
                            break;
                        case "copy":
                        case "cut":
                        case "paste":
                            u = tY;
                            break;
                        case "gotpointercapture":
                        case "lostpointercapture":
                        case "pointercancel":
                        case "pointerdown":
                        case "pointermove":
                        case "pointerout":
                        case "pointerover":
                        case "pointerup":
                            u = t3;
                            break;
                        case "toggle":
                        case "beforetoggle":
                            u = t5
                    }
                    var d = 0 != (4 & t),
                        f = !d && ("scroll" === e || "scrollend" === e),
                        p = d ? null !== i ? i + "Capture" : null : i;
                    d = [];
                    for (var h, m = r; null !== m;) {
                        var g = m;
                        if (h = g.stateNode, 5 !== (g = g.tag) && 26 !== g && 27 !== g || null === h || null === p || null != (g = tE(m, p)) && d.push(st(m, g, h)), f) break;
                        m = m.return
                    }
                    0 < d.length && (i = new u(i, s, null, n, a), o.push({
                        event: i,
                        listeners: d
                    }))
                }
            }
            if (0 == (7 & t)) {
                if ((i = "mouseover" === e || "pointerover" === e, u = "mouseout" === e || "pointerout" === e, !(i && n !== tg && (s = n.relatedTarget || n.fromElement) && (eq(s) || s[eM]))) && (u || i) && (i = a.window === a ? a : (i = a.ownerDocument) ? i.defaultView || i.parentWindow : window, u ? (s = n.relatedTarget || n.toElement, u = r, null !== (s = s ? eq(s) : null) && (f = c(s), d = s.tag, s !== f || 5 !== d && 27 !== d && 6 !== d) && (s = null)) : (u = null, s = r), u !== s)) {
                    if (d = t$, g = "onMouseLeave", p = "onMouseEnter", m = "mouse", ("pointerout" === e || "pointerover" === e) && (d = t3, g = "onPointerLeave", p = "onPointerEnter", m = "pointer"), f = null == u ? i : e$(u), h = null == s ? i : e$(s), (i = new d(g, m + "leave", u, n, a)).target = f, i.relatedTarget = h, g = null, eq(a) === r && ((d = new d(p, m + "enter", s, n, a)).target = h, d.relatedTarget = f, g = d), f = g, u && s) t: {
                        for (d = sr, p = u, m = s, h = 0, g = p; g; g = d(g)) h++;g = 0;
                        for (var v, y = m; y; y = d(y)) g++;
                        for (; 0 < h - g;) p = d(p),
                        h--;
                        for (; 0 < g - h;) m = d(m),
                        g--;
                        for (; h--;) {
                            if (p === m || null !== m && p === m.alternate) {
                                d = p;
                                break t
                            }
                            p = d(p), m = d(m)
                        }
                        d = null
                    }
                    else d = null;
                    null !== u && sa(o, i, u, d, !1), null !== s && null !== f && sa(o, f, s, d, !0)
                }
                e: {
                    if ("select" === (u = (i = r ? e$(r) : window).nodeName && i.nodeName.toLowerCase()) || "input" === u && "file" === i.type) var b = nh;
                    else if (nu(i))
                        if (nm) b = nE;
                        else {
                            b = nS;
                            var _ = n_
                        }
                    else(u = i.nodeName) && "input" === u.toLowerCase() && ("checkbox" === i.type || "radio" === i.type) ? b = nw : r && td(r.elementType) && (b = nh);
                    if (b && (b = b(e, r))) {
                        ns(o, b, n, a);
                        break e
                    }
                    _ && _(e, i, r),
                    "focusout" === e && r && "number" === i.type && null != r.memoizedProps.value && tr(i, "number", i.value)
                }
                switch (_ = r ? e$(r) : window, e) {
                    case "focusin":
                        (nu(_) || "true" === _.contentEditable) && (nA = _, nL = r, nO = null);
                        break;
                    case "focusout":
                        nO = nL = nA = null;
                        break;
                    case "mousedown":
                        nI = !0;
                        break;
                    case "contextmenu":
                    case "mouseup":
                    case "dragend":
                        nI = !1, nD(o, n, a);
                        break;
                    case "selectionchange":
                        if (nR) break;
                    case "keydown":
                    case "keyup":
                        nD(o, n, a)
                }
                if (t7) t: {
                    switch (e) {
                        case "compositionstart":
                            var S = "onCompositionStart";
                            break t;
                        case "compositionend":
                            S = "onCompositionEnd";
                            break t;
                        case "compositionupdate":
                            S = "onCompositionUpdate";
                            break t
                    }
                    S = void 0
                }
                else no ? na(e, n) && (S = "onCompositionEnd") : "keydown" === e && 229 === n.keyCode && (S = "onCompositionStart");
                S && (nn && "ko" !== n.locale && (no || "onCompositionStart" !== S ? "onCompositionEnd" === S && no && (v = tR()) : (tC = "value" in (tP = a) ? tP.value : tP.textContent, no = !0)), 0 < (_ = sn(r, S)).length && (S = new tX(S, e, null, n, a), o.push({
                    event: S,
                    listeners: _
                }), v ? S.data = v : null !== (v = nl(n)) && (S.data = v))), (v = nt ? function(e, t) {
                    switch (e) {
                        case "compositionend":
                            return nl(t);
                        case "keypress":
                            if (32 !== t.which) return null;
                            return nr = !0, " ";
                        case "textInput":
                            return " " === (e = t.data) && nr ? null : e;
                        default:
                            return null
                    }
                }(e, n) : function(e, t) {
                    if (no) return "compositionend" === e || !t7 && na(e, t) ? (e = tR(), tN = tC = tP = null, no = !1, e) : null;
                    switch (e) {
                        case "paste":
                        default:
                            return null;
                        case "keypress":
                            if (!(t.ctrlKey || t.altKey || t.metaKey) || t.ctrlKey && t.altKey) {
                                if (t.char && 1 < t.char.length) return t.char;
                                if (t.which) return String.fromCharCode(t.which)
                            }
                            return null;
                        case "compositionend":
                            return nn && "ko" !== t.locale ? null : t.data
                    }
                }(e, n)) && 0 < (S = sn(r, "onBeforeInput")).length && (_ = new tX("onBeforeInput", "beforeinput", null, n, a), o.push({
                    event: _,
                    listeners: S
                }), _.data = v);
                var w = e;
                if ("submit" === w && r && r.stateNode === a) {
                    var E = uJ((a[eD] || null).action),
                        k = n.submitter;
                    k && null !== (w = (w = k[eD] || null) ? uJ(w.formAction) : k.getAttribute("formAction")) && (E = w, k = null);
                    var x = new tB("action", "action", null, n, a);
                    o.push({
                        event: x,
                        listeners: [{
                            instance: null,
                            listener: function() {
                                if (n.defaultPrevented) {
                                    if (0 !== uq) {
                                        var e = k ? uZ(a, k) : new FormData(a);
                                        lX(r, {
                                            pending: !0,
                                            data: e,
                                            method: a.method,
                                            action: E
                                        }, null, e)
                                    }
                                } else "function" == typeof E && (x.preventDefault(), lX(r, {
                                    pending: !0,
                                    data: e = k ? uZ(a, k) : new FormData(a),
                                    method: a.method,
                                    action: E
                                }, E, e))
                            },
                            currentTarget: a
                        }]
                    })
                }
            }
            u4(o, t)
        })
    }

    function st(e, t, n) {
        return {
            instance: e,
            listener: t,
            currentTarget: n
        }
    }

    function sn(e, t) {
        for (var n = t + "Capture", r = []; null !== e;) {
            var a = e,
                l = a.stateNode;
            if (5 !== (a = a.tag) && 26 !== a && 27 !== a || null === l || (null != (a = tE(e, n)) && r.unshift(st(e, a, l)), null != (a = tE(e, t)) && r.push(st(e, a, l))), 3 === e.tag) return r;
            e = e.return
        }
        return []
    }

    function sr(e) {
        if (null === e) return null;
        do e = e.return; while (e && 5 !== e.tag && 27 !== e.tag) return e || null
    }

    function sa(e, t, n, r, a) {
        for (var l = t._reactName, o = []; null !== n && n !== r;) {
            var i = n,
                u = i.alternate,
                s = i.stateNode;
            if (i = i.tag, null !== u && u === r) break;
            5 !== i && 26 !== i && 27 !== i || null === s || (u = s, a ? null != (s = tE(n, l)) && o.unshift(st(n, s, u)) : a || null != (s = tE(n, l)) && o.push(st(n, s, u))), n = n.return
        }
        0 !== o.length && e.push({
            event: t,
            listeners: o
        })
    }
    var sl = /\r\n?/g,
        so = /\u0000|\uFFFD/g;

    function si(e) {
        return ("string" == typeof e ? e : "" + e).replace(sl, "\n").replace(so, "")
    }

    function su(e, t) {
        return t = si(t), si(e) === t
    }

    function ss(e, t, n, r, a, l) {
        switch (n) {
            case "children":
                "string" == typeof r ? "body" === t || "textarea" === t && "" === r || ti(e, r) : ("number" == typeof r || "bigint" == typeof r) && "body" !== t && ti(e, "" + r);
                break;
            case "className":
                e2(e, "class", r);
                break;
            case "tabIndex":
                e2(e, "tabindex", r);
                break;
            case "dir":
            case "role":
            case "viewBox":
            case "width":
            case "height":
                e2(e, n, r);
                break;
            case "style":
                tc(e, r, l);
                break;
            case "data":
                if ("object" !== t) {
                    e2(e, "data", r);
                    break
                }
            case "src":
            case "href":
                if ("" === r && ("a" !== t || "href" !== n) || null == r || "function" == typeof r || "symbol" == typeof r || "boolean" == typeof r) {
                    e.removeAttribute(n);
                    break
                }
                r = th("" + r), e.setAttribute(n, r);
                break;
            case "action":
            case "formAction":
                if ("function" == typeof r) {
                    e.setAttribute(n, "javascript:throw new Error('A React form was unexpectedly submitted. If you called form.submit() manually, consider using form.requestSubmit() instead. If you\\'re trying to use event.stopPropagation() in a submit event handler, consider also calling event.preventDefault().')");
                    break
                }
                if ("function" == typeof l && ("formAction" === n ? ("input" !== t && ss(e, t, "name", a.name, a, null), ss(e, t, "formEncType", a.formEncType, a, null), ss(e, t, "formMethod", a.formMethod, a, null), ss(e, t, "formTarget", a.formTarget, a, null)) : (ss(e, t, "encType", a.encType, a, null), ss(e, t, "method", a.method, a, null), ss(e, t, "target", a.target, a, null))), null == r || "symbol" == typeof r || "boolean" == typeof r) {
                    e.removeAttribute(n);
                    break
                }
                r = th("" + r), e.setAttribute(n, r);
                break;
            case "onClick":
                null != r && (e.onclick = tm);
                break;
            case "onScroll":
                null != r && u6("scroll", e);
                break;
            case "onScrollEnd":
                null != r && u6("scrollend", e);
                break;
            case "dangerouslySetInnerHTML":
                if (null != r) {
                    if ("object" != typeof r || !("__html" in r)) throw Error(u(61));
                    if (null != (n = r.__html)) {
                        if (null != a.children) throw Error(u(60));
                        e.innerHTML = n
                    }
                }
                break;
            case "multiple":
                e.multiple = r && "function" != typeof r && "symbol" != typeof r;
                break;
            case "muted":
                e.muted = r && "function" != typeof r && "symbol" != typeof r;
                break;
            case "suppressContentEditableWarning":
            case "suppressHydrationWarning":
            case "defaultValue":
            case "defaultChecked":
            case "innerHTML":
            case "ref":
            case "autoFocus":
            case "innerText":
            case "textContent":
                break;
            case "xlinkHref":
                if (null == r || "function" == typeof r || "boolean" == typeof r || "symbol" == typeof r) {
                    e.removeAttribute("xlink:href");
                    break
                }
                n = th("" + r), e.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", n);
                break;
            case "contentEditable":
            case "spellCheck":
            case "draggable":
            case "value":
            case "autoReverse":
            case "externalResourcesRequired":
            case "focusable":
            case "preserveAlpha":
                null != r && "function" != typeof r && "symbol" != typeof r ? e.setAttribute(n, "" + r) : e.removeAttribute(n);
                break;
            case "inert":
            case "allowFullScreen":
            case "async":
            case "autoPlay":
            case "controls":
            case "default":
            case "defer":
            case "disabled":
            case "disablePictureInPicture":
            case "disableRemotePlayback":
            case "formNoValidate":
            case "hidden":
            case "loop":
            case "noModule":
            case "noValidate":
            case "open":
            case "playsInline":
            case "readOnly":
            case "required":
            case "reversed":
            case "scoped":
            case "seamless":
            case "itemScope":
                r && "function" != typeof r && "symbol" != typeof r ? e.setAttribute(n, "") : e.removeAttribute(n);
                break;
            case "capture":
            case "download":
                !0 === r ? e.setAttribute(n, "") : !1 !== r && null != r && "function" != typeof r && "symbol" != typeof r ? e.setAttribute(n, r) : e.removeAttribute(n);
                break;
            case "cols":
            case "rows":
            case "size":
            case "span":
                null != r && "function" != typeof r && "symbol" != typeof r && !isNaN(r) && 1 <= r ? e.setAttribute(n, r) : e.removeAttribute(n);
                break;
            case "rowSpan":
            case "start":
                null == r || "function" == typeof r || "symbol" == typeof r || isNaN(r) ? e.removeAttribute(n) : e.setAttribute(n, r);
                break;
            case "popover":
                u6("beforetoggle", e), u6("toggle", e), e1(e, "popover", r);
                break;
            case "xlinkActuate":
                e3(e, "http://www.w3.org/1999/xlink", "xlink:actuate", r);
                break;
            case "xlinkArcrole":
                e3(e, "http://www.w3.org/1999/xlink", "xlink:arcrole", r);
                break;
            case "xlinkRole":
                e3(e, "http://www.w3.org/1999/xlink", "xlink:role", r);
                break;
            case "xlinkShow":
                e3(e, "http://www.w3.org/1999/xlink", "xlink:show", r);
                break;
            case "xlinkTitle":
                e3(e, "http://www.w3.org/1999/xlink", "xlink:title", r);
                break;
            case "xlinkType":
                e3(e, "http://www.w3.org/1999/xlink", "xlink:type", r);
                break;
            case "xmlBase":
                e3(e, "http://www.w3.org/XML/1998/namespace", "xml:base", r);
                break;
            case "xmlLang":
                e3(e, "http://www.w3.org/XML/1998/namespace", "xml:lang", r);
                break;
            case "xmlSpace":
                e3(e, "http://www.w3.org/XML/1998/namespace", "xml:space", r);
                break;
            case "is":
                e1(e, "is", r);
                break;
            default:
                2 < n.length && ("o" === n[0] || "O" === n[0]) && ("n" === n[1] || "N" === n[1]) || e1(e, n = tf.get(n) || n, r)
        }
    }

    function sc(e, t, n, r, a, l) {
        switch (n) {
            case "style":
                tc(e, r, l);
                break;
            case "dangerouslySetInnerHTML":
                if (null != r) {
                    if ("object" != typeof r || !("__html" in r)) throw Error(u(61));
                    if (null != (n = r.__html)) {
                        if (null != a.children) throw Error(u(60));
                        e.innerHTML = n
                    }
                }
                break;
            case "children":
                "string" == typeof r ? ti(e, r) : ("number" == typeof r || "bigint" == typeof r) && ti(e, "" + r);
                break;
            case "onScroll":
                null != r && u6("scroll", e);
                break;
            case "onScrollEnd":
                null != r && u6("scrollend", e);
                break;
            case "onClick":
                null != r && (e.onclick = tm);
                break;
            case "suppressContentEditableWarning":
            case "suppressHydrationWarning":
            case "innerHTML":
            case "ref":
            case "innerText":
            case "textContent":
                break;
            default:
                if (!eY.hasOwnProperty(n)) e: {
                    if ("o" === n[0] && "n" === n[1] && (a = n.endsWith("Capture"), t = n.slice(2, a ? n.length - 7 : void 0), "function" == typeof(l = null != (l = e[eD] || null) ? l[n] : null) && e.removeEventListener(t, l, a), "function" == typeof r)) {
                        "function" != typeof l && null !== l && (n in e ? e[n] = null : e.hasAttribute(n) && e.removeAttribute(n)), e.addEventListener(t, r, a);
                        break e
                    }
                    n in e ? e[n] = r : !0 === r ? e.setAttribute(n, "") : e1(e, n, r)
                }
        }
    }

    function sd(e, t, n) {
        switch (t) {
            case "div":
            case "span":
            case "svg":
            case "path":
            case "a":
            case "g":
            case "p":
            case "li":
                break;
            case "img":
                u6("error", e), u6("load", e);
                var r, a = !1,
                    l = !1;
                for (r in n)
                    if (n.hasOwnProperty(r)) {
                        var o = n[r];
                        if (null != o) switch (r) {
                            case "src":
                                a = !0;
                                break;
                            case "srcSet":
                                l = !0;
                                break;
                            case "children":
                            case "dangerouslySetInnerHTML":
                                throw Error(u(137, t));
                            default:
                                ss(e, t, r, o, n, null)
                        }
                    } l && ss(e, t, "srcSet", n.srcSet, n, null), a && ss(e, t, "src", n.src, n, null);
                return;
            case "input":
                u6("invalid", e);
                var i = r = o = l = null,
                    s = null,
                    c = null;
                for (a in n)
                    if (n.hasOwnProperty(a)) {
                        var d = n[a];
                        if (null != d) switch (a) {
                            case "name":
                                l = d;
                                break;
                            case "type":
                                o = d;
                                break;
                            case "checked":
                                s = d;
                                break;
                            case "defaultChecked":
                                c = d;
                                break;
                            case "value":
                                r = d;
                                break;
                            case "defaultValue":
                                i = d;
                                break;
                            case "children":
                            case "dangerouslySetInnerHTML":
                                if (null != d) throw Error(u(137, t));
                                break;
                            default:
                                ss(e, t, a, d, n, null)
                        }
                    } tn(e, r, i, s, c, o, l, !1);
                return;
            case "select":
                for (l in u6("invalid", e), a = o = r = null, n)
                    if (n.hasOwnProperty(l) && null != (i = n[l])) switch (l) {
                        case "value":
                            r = i;
                            break;
                        case "defaultValue":
                            o = i;
                            break;
                        case "multiple":
                            a = i;
                        default:
                            ss(e, t, l, i, n, null)
                    }
                t = r, n = o, e.multiple = !!a, null != t ? ta(e, !!a, t, !1) : null != n && ta(e, !!a, n, !0);
                return;
            case "textarea":
                for (o in u6("invalid", e), r = l = a = null, n)
                    if (n.hasOwnProperty(o) && null != (i = n[o])) switch (o) {
                        case "value":
                            a = i;
                            break;
                        case "defaultValue":
                            l = i;
                            break;
                        case "children":
                            r = i;
                            break;
                        case "dangerouslySetInnerHTML":
                            if (null != i) throw Error(u(91));
                            break;
                        default:
                            ss(e, t, o, i, n, null)
                    }
                to(e, a, l, r);
                return;
            case "option":
                for (s in n) n.hasOwnProperty(s) && null != (a = n[s]) && ("selected" === s ? e.selected = a && "function" != typeof a && "symbol" != typeof a : ss(e, t, s, a, n, null));
                return;
            case "dialog":
                u6("beforetoggle", e), u6("toggle", e), u6("cancel", e), u6("close", e);
                break;
            case "iframe":
            case "object":
                u6("load", e);
                break;
            case "video":
            case "audio":
                for (a = 0; a < u2.length; a++) u6(u2[a], e);
                break;
            case "image":
                u6("error", e), u6("load", e);
                break;
            case "details":
                u6("toggle", e);
                break;
            case "embed":
            case "source":
            case "link":
                u6("error", e), u6("load", e);
            case "area":
            case "base":
            case "br":
            case "col":
            case "hr":
            case "keygen":
            case "meta":
            case "param":
            case "track":
            case "wbr":
            case "menuitem":
                for (c in n)
                    if (n.hasOwnProperty(c) && null != (a = n[c])) switch (c) {
                        case "children":
                        case "dangerouslySetInnerHTML":
                            throw Error(u(137, t));
                        default:
                            ss(e, t, c, a, n, null)
                    }
                return;
            default:
                if (td(t)) {
                    for (d in n) n.hasOwnProperty(d) && void 0 !== (a = n[d]) && sc(e, t, d, a, n, void 0);
                    return
                }
        }
        for (i in n) n.hasOwnProperty(i) && null != (a = n[i]) && ss(e, t, i, a, n, null)
    }

    function sf(e) {
        switch (e) {
            case "css":
            case "script":
            case "font":
            case "img":
            case "image":
            case "input":
            case "link":
                return !0;
            default:
                return !1
        }
    }
    var sp = null,
        sh = null;

    function sm(e) {
        return 9 === e.nodeType ? e : e.ownerDocument
    }

    function sg(e) {
        switch (e) {
            case "http://www.w3.org/2000/svg":
                return 1;
            case "http://www.w3.org/1998/Math/MathML":
                return 2;
            default:
                return 0
        }
    }

    function sv(e, t) {
        if (0 === e) switch (t) {
            case "svg":
                return 1;
            case "math":
                return 2;
            default:
                return 0
        }
        return 1 === e && "foreignObject" === t ? 0 : e
    }

    function sy(e, t) {
        return "textarea" === e || "noscript" === e || "string" == typeof t.children || "number" == typeof t.children || "bigint" == typeof t.children || "object" == typeof t.dangerouslySetInnerHTML && null !== t.dangerouslySetInnerHTML && null != t.dangerouslySetInnerHTML.__html
    }
    var sb = null,
        s_ = "function" == typeof setTimeout ? setTimeout : void 0,
        sS = "function" == typeof clearTimeout ? clearTimeout : void 0,
        sw = "function" == typeof Promise ? Promise : void 0,
        sE = "function" == typeof queueMicrotask ? queueMicrotask : void 0 !== sw ? function(e) {
            return sw.resolve(null).then(e).catch(sk)
        } : s_;

    function sk(e) {
        setTimeout(function() {
            throw e
        })
    }

    function sx(e) {
        return "head" === e
    }

    function sT(e, t) {
        var n = t,
            r = 0;
        do {
            var a = n.nextSibling;
            if (e.removeChild(n), a && 8 === a.nodeType)
                if ("/$" === (n = a.data) || "/&" === n) {
                    if (0 === r) {
                        e.removeChild(a), cL(t);
                        return
                    }
                    r--
                } else if ("$" === n || "$?" === n || "$~" === n || "$!" === n || "&" === n) r++;
            else if ("html" === n) sz(e.ownerDocument.documentElement);
            else if ("head" === n) {
                sz(n = e.ownerDocument.head);
                for (var l = n.firstChild; l;) {
                    var o = l.nextSibling,
                        i = l.nodeName;
                    l[eB] || "SCRIPT" === i || "STYLE" === i || "LINK" === i && "stylesheet" === l.rel.toLowerCase() || n.removeChild(l), l = o
                }
            } else "body" === n && sz(e.ownerDocument.body);
            n = a
        } while (n) cL(t)
    }

    function sP(e, t) {
        var n = e;
        e = 0;
        do {
            var r = n.nextSibling;
            if (1 === n.nodeType ? t ? (n._stashedDisplay = n.style.display, n.style.display = "none") : (n.style.display = n._stashedDisplay || "", "" === n.getAttribute("style") && n.removeAttribute("style")) : 3 === n.nodeType && (t ? (n._stashedText = n.nodeValue, n.nodeValue = "") : n.nodeValue = n._stashedText || ""), r && 8 === r.nodeType)
                if ("/$" === (n = r.data))
                    if (0 === e) break;
                    else e--;
            else "$" !== n && "$?" !== n && "$~" !== n && "$!" !== n || e++;
            n = r
        } while (n)
    }

    function sC(e) {
        var t = e.firstChild;
        for (t && 10 === t.nodeType && (t = t.nextSibling); t;) {
            var n = t;
            switch (t = t.nextSibling, n.nodeName) {
                case "HTML":
                case "HEAD":
                case "BODY":
                    sC(n), eH(n);
                    continue;
                case "SCRIPT":
                case "STYLE":
                    continue;
                case "LINK":
                    if ("stylesheet" === n.rel.toLowerCase()) continue
            }
            e.removeChild(n)
        }
    }

    function sN(e, t) {
        for (; 8 !== e.nodeType;)
            if ((1 !== e.nodeType || "INPUT" !== e.nodeName || "hidden" !== e.type) && !t || null === (e = sL(e.nextSibling))) return null;
        return e
    }

    function sR(e) {
        return "$?" === e.data || "$~" === e.data
    }

    function sA(e) {
        return "$!" === e.data || "$?" === e.data && "loading" !== e.ownerDocument.readyState
    }

    function sL(e) {
        for (; null != e; e = e.nextSibling) {
            var t = e.nodeType;
            if (1 === t || 3 === t) break;
            if (8 === t) {
                if ("$" === (t = e.data) || "$!" === t || "$?" === t || "$~" === t || "&" === t || "F!" === t || "F" === t) break;
                if ("/$" === t || "/&" === t) return null
            }
        }
        return e
    }
    var sO = null;

    function sI(e) {
        e = e.nextSibling;
        for (var t = 0; e;) {
            if (8 === e.nodeType) {
                var n = e.data;
                if ("/$" === n || "/&" === n) {
                    if (0 === t) return sL(e.nextSibling);
                    t--
                } else "$" !== n && "$!" !== n && "$?" !== n && "$~" !== n && "&" !== n || t++
            }
            e = e.nextSibling
        }
        return null
    }

    function sD(e) {
        e = e.previousSibling;
        for (var t = 0; e;) {
            if (8 === e.nodeType) {
                var n = e.data;
                if ("$" === n || "$!" === n || "$?" === n || "$~" === n || "&" === n) {
                    if (0 === t) return e;
                    t--
                } else "/$" !== n && "/&" !== n || t++
            }
            e = e.previousSibling
        }
        return null
    }

    function sM(e, t, n) {
        switch (t = sm(n), e) {
            case "html":
                if (!(e = t.documentElement)) throw Error(u(452));
                return e;
            case "head":
                if (!(e = t.head)) throw Error(u(453));
                return e;
            case "body":
                if (!(e = t.body)) throw Error(u(454));
                return e;
            default:
                throw Error(u(451))
        }
    }

    function sz(e) {
        for (var t = e.attributes; t.length;) e.removeAttributeNode(t[0]);
        eH(e)
    }
    var sF = new Map,
        sj = new Set;

    function sU(e) {
        return "function" == typeof e.getRootNode ? e.getRootNode() : 9 === e.nodeType ? e : e.ownerDocument
    }
    var sB = D.d;
    D.d = {
        f: function() {
            var e = sB.f(),
                t = uc();
            return e || t
        },
        r: function(e) {
            var t = eW(e);
            null !== t && 5 === t.tag && "form" === t.type ? lJ(t) : sB.r(e)
        },
        D: function(e) {
            sB.D(e), sq("dns-prefetch", e, null)
        },
        C: function(e, t) {
            sB.C(e, t), sq("preconnect", e, t)
        },
        L: function(e, t, n) {
            if (sB.L(e, t, n), sH && e && t) {
                var r = 'link[rel="preload"][as="' + te(t) + '"]';
                "image" === t && n && n.imageSrcSet ? (r += '[imagesrcset="' + te(n.imageSrcSet) + '"]', "string" == typeof n.imageSizes && (r += '[imagesizes="' + te(n.imageSizes) + '"]')) : r += '[href="' + te(e) + '"]';
                var a = r;
                switch (t) {
                    case "style":
                        a = s$(e);
                        break;
                    case "script":
                        a = sG(e)
                }
                sF.has(a) || (e = h({
                    rel: "preload",
                    href: "image" === t && n && n.imageSrcSet ? void 0 : e,
                    as: t
                }, n), sF.set(a, e), null !== sH.querySelector(r) || "style" === t && sH.querySelector(sV(a)) || "script" === t && sH.querySelector(sY(a)) || (sd(t = sH.createElement("link"), "link", e), eQ(t), sH.head.appendChild(t)))
            }
        },
        m: function(e, t) {
            if (sB.m(e, t), sH && e) {
                var n = t && "string" == typeof t.as ? t.as : "script",
                    r = 'link[rel="modulepreload"][as="' + te(n) + '"][href="' + te(e) + '"]',
                    a = r;
                switch (n) {
                    case "audioworklet":
                    case "paintworklet":
                    case "serviceworker":
                    case "sharedworker":
                    case "worker":
                    case "script":
                        a = sG(e)
                }
                if (!sF.has(a) && (e = h({
                        rel: "modulepreload",
                        href: e
                    }, t), sF.set(a, e), null === sH.querySelector(r))) {
                    switch (n) {
                        case "audioworklet":
                        case "paintworklet":
                        case "serviceworker":
                        case "sharedworker":
                        case "worker":
                        case "script":
                            if (sH.querySelector(sY(a))) return
                    }
                    sd(n = sH.createElement("link"), "link", e), eQ(n), sH.head.appendChild(n)
                }
            }
        },
        X: function(e, t) {
            if (sB.X(e, t), sH && e) {
                var n = eV(sH).hoistableScripts,
                    r = sG(e),
                    a = n.get(r);
                a || ((a = sH.querySelector(sY(r))) || (e = h({
                    src: e,
                    async: !0
                }, t), (t = sF.get(r)) && sZ(e, t), eQ(a = sH.createElement("script")), sd(a, "link", e), sH.head.appendChild(a)), a = {
                    type: "script",
                    instance: a,
                    count: 1,
                    state: null
                }, n.set(r, a))
            }
        },
        S: function(e, t, n) {
            if (sB.S(e, t, n), sH && e) {
                var r = eV(sH).hoistableStyles,
                    a = s$(e);
                t = t || "default";
                var l = r.get(a);
                if (!l) {
                    var o = {
                        loading: 0,
                        preload: null
                    };
                    if (l = sH.querySelector(sV(a))) o.loading = 5;
                    else {
                        e = h({
                            rel: "stylesheet",
                            href: e,
                            "data-precedence": t
                        }, n), (n = sF.get(a)) && sJ(e, n);
                        var i = l = sH.createElement("link");
                        eQ(i), sd(i, "link", e), i._p = new Promise(function(e, t) {
                            i.onload = e, i.onerror = t
                        }), i.addEventListener("load", function() {
                            o.loading |= 1
                        }), i.addEventListener("error", function() {
                            o.loading |= 2
                        }), o.loading |= 4, sK(l, t, sH)
                    }
                    l = {
                        type: "stylesheet",
                        instance: l,
                        count: 1,
                        state: o
                    }, r.set(a, l)
                }
            }
        },
        M: function(e, t) {
            if (sB.M(e, t), sH && e) {
                var n = eV(sH).hoistableScripts,
                    r = sG(e),
                    a = n.get(r);
                a || ((a = sH.querySelector(sY(r))) || (e = h({
                    src: e,
                    async: !0,
                    type: "module"
                }, t), (t = sF.get(r)) && sZ(e, t), eQ(a = sH.createElement("script")), sd(a, "link", e), sH.head.appendChild(a)), a = {
                    type: "script",
                    instance: a,
                    count: 1,
                    state: null
                }, n.set(r, a))
            }
        }
    };
    var sH = "u" < typeof document ? null : document;

    function sq(e, t, n) {
        if (sH && "string" == typeof t && t) {
            var r = te(t);
            r = 'link[rel="' + e + '"][href="' + r + '"]', "string" == typeof n && (r += '[crossorigin="' + n + '"]'), sj.has(r) || (sj.add(r), e = {
                rel: e,
                crossOrigin: n,
                href: t
            }, null === sH.querySelector(r) && (sd(t = sH.createElement("link"), "link", e), eQ(t), sH.head.appendChild(t)))
        }
    }

    function sW(e, t, n, r) {
        var a = (a = W.current) ? sU(a) : null;
        if (!a) throw Error(u(446));
        switch (e) {
            case "meta":
            case "title":
                return null;
            case "style":
                return "string" == typeof n.precedence && "string" == typeof n.href ? (t = s$(n.href), (r = (n = eV(a).hoistableStyles).get(t)) || (r = {
                    type: "style",
                    instance: null,
                    count: 0,
                    state: null
                }, n.set(t, r)), r) : {
                    type: "void",
                    instance: null,
                    count: 0,
                    state: null
                };
            case "link":
                if ("stylesheet" === n.rel && "string" == typeof n.href && "string" == typeof n.precedence) {
                    e = s$(n.href);
                    var l, o, i, s, c = eV(a).hoistableStyles,
                        d = c.get(e);
                    if (d || (a = a.ownerDocument || a, d = {
                            type: "stylesheet",
                            instance: null,
                            count: 0,
                            state: {
                                loading: 0,
                                preload: null
                            }
                        }, c.set(e, d), (c = a.querySelector(sV(e))) && !c._p && (d.instance = c, d.state.loading = 5), sF.has(e) || (n = {
                            rel: "preload",
                            as: "style",
                            href: n.href,
                            crossOrigin: n.crossOrigin,
                            integrity: n.integrity,
                            media: n.media,
                            hrefLang: n.hrefLang,
                            referrerPolicy: n.referrerPolicy
                        }, sF.set(e, n), c || (l = a, o = e, i = n, s = d.state, l.querySelector('link[rel="preload"][as="style"][' + o + "]") ? s.loading = 1 : (s.preload = o = l.createElement("link"), o.addEventListener("load", function() {
                            return s.loading |= 1
                        }), o.addEventListener("error", function() {
                            return s.loading |= 2
                        }), sd(o, "link", i), eQ(o), l.head.appendChild(o))))), t && null === r) throw Error(u(528, ""));
                    return d
                }
                if (t && null !== r) throw Error(u(529, ""));
                return null;
            case "script":
                return t = n.async, "string" == typeof(n = n.src) && t && "function" != typeof t && "symbol" != typeof t ? (t = sG(n), (r = (n = eV(a).hoistableScripts).get(t)) || (r = {
                    type: "script",
                    instance: null,
                    count: 0,
                    state: null
                }, n.set(t, r)), r) : {
                    type: "void",
                    instance: null,
                    count: 0,
                    state: null
                };
            default:
                throw Error(u(444, e))
        }
    }

    function s$(e) {
        return 'href="' + te(e) + '"'
    }

    function sV(e) {
        return 'link[rel="stylesheet"][' + e + "]"
    }

    function sQ(e) {
        return h({}, e, {
            "data-precedence": e.precedence,
            precedence: null
        })
    }

    function sG(e) {
        return '[src="' + te(e) + '"]'
    }

    function sY(e) {
        return "script[async]" + e
    }

    function sX(e, t, n) {
        if (t.count++, null === t.instance) switch (t.type) {
            case "style":
                var r = e.querySelector('style[data-href~="' + te(n.href) + '"]');
                if (r) return t.instance = r, eQ(r), r;
                var a = h({}, n, {
                    "data-href": n.href,
                    "data-precedence": n.precedence,
                    href: null,
                    precedence: null
                });
                return eQ(r = (e.ownerDocument || e).createElement("style")), sd(r, "style", a), sK(r, n.precedence, e), t.instance = r;
            case "stylesheet":
                a = s$(n.href);
                var l = e.querySelector(sV(a));
                if (l) return t.state.loading |= 4, t.instance = l, eQ(l), l;
                r = sQ(n), (a = sF.get(a)) && sJ(r, a), eQ(l = (e.ownerDocument || e).createElement("link"));
                var o = l;
                return o._p = new Promise(function(e, t) {
                    o.onload = e, o.onerror = t
                }), sd(l, "link", r), t.state.loading |= 4, sK(l, n.precedence, e), t.instance = l;
            case "script":
                if (l = sG(n.src), a = e.querySelector(sY(l))) return t.instance = a, eQ(a), a;
                return r = n, (a = sF.get(l)) && sZ(r = h({}, n), a), eQ(a = (e = e.ownerDocument || e).createElement("script")), sd(a, "link", r), e.head.appendChild(a), t.instance = a;
            case "void":
                return null;
            default:
                throw Error(u(443, t.type))
        }
        return "stylesheet" === t.type && 0 == (4 & t.state.loading) && (r = t.instance, t.state.loading |= 4, sK(r, n.precedence, e)), t.instance
    }

    function sK(e, t, n) {
        for (var r = n.querySelectorAll('link[rel="stylesheet"][data-precedence],style[data-precedence]'), a = r.length ? r[r.length - 1] : null, l = a, o = 0; o < r.length; o++) {
            var i = r[o];
            if (i.dataset.precedence === t) l = i;
            else if (l !== a) break
        }
        l ? l.parentNode.insertBefore(e, l.nextSibling) : (t = 9 === n.nodeType ? n.head : n).insertBefore(e, t.firstChild)
    }

    function sJ(e, t) {
        null == e.crossOrigin && (e.crossOrigin = t.crossOrigin), null == e.referrerPolicy && (e.referrerPolicy = t.referrerPolicy), null == e.title && (e.title = t.title)
    }

    function sZ(e, t) {
        null == e.crossOrigin && (e.crossOrigin = t.crossOrigin), null == e.referrerPolicy && (e.referrerPolicy = t.referrerPolicy), null == e.integrity && (e.integrity = t.integrity)
    }
    var s0 = null;

    function s1(e, t, n) {
        if (null === s0) {
            var r = new Map,
                a = s0 = new Map;
            a.set(n, r)
        } else(r = (a = s0).get(n)) || (r = new Map, a.set(n, r));
        if (r.has(e)) return r;
        for (r.set(e, null), n = n.getElementsByTagName(e), a = 0; a < n.length; a++) {
            var l = n[a];
            if (!(l[eB] || l[eI] || "link" === e && "stylesheet" === l.getAttribute("rel")) && "http://www.w3.org/2000/svg" !== l.namespaceURI) {
                var o = l.getAttribute(t) || "";
                o = e + o;
                var i = r.get(o);
                i ? i.push(l) : r.set(o, [l])
            }
        }
        return r
    }

    function s2(e, t, n) {
        (e = e.ownerDocument || e).head.insertBefore(n, "title" === t ? e.querySelector("head > title") : null)
    }

    function s3(e) {
        return "stylesheet" !== e.type || 0 != (3 & e.state.loading)
    }
    var s4 = 0;

    function s6() {
        if (this.count--, 0 === this.count && (0 === this.imgCount || !this.waitingForImages)) {
            if (this.stylesheets) s5(this, this.stylesheets);
            else if (this.unsuspend) {
                var e = this.unsuspend;
                this.unsuspend = null, e()
            }
        }
    }
    var s8 = null;

    function s5(e, t) {
        e.stylesheets = null, null !== e.unsuspend && (e.count++, s8 = new Map, t.forEach(s9, e), s8 = null, s6.call(e))
    }

    function s9(e, t) {
        if (!(4 & t.state.loading)) {
            var n = s8.get(e);
            if (n) var r = n.get(null);
            else {
                n = new Map, s8.set(e, n);
                for (var a = e.querySelectorAll("link[data-precedence],style[data-precedence]"), l = 0; l < a.length; l++) {
                    var o = a[l];
                    ("LINK" === o.nodeName || "not all" !== o.getAttribute("media")) && (n.set(o.dataset.precedence, o), r = o)
                }
                r && n.set(null, r)
            }
            o = (a = t.instance).getAttribute("data-precedence"), (l = n.get(o) || r) === r && n.set(null, a), n.set(o, a), this.count++, r = s6.bind(this), a.addEventListener("load", r), a.addEventListener("error", r), l ? l.parentNode.insertBefore(a, l.nextSibling) : (e = 9 === e.nodeType ? e.head : e).insertBefore(a, e.firstChild), t.state.loading |= 4
        }
    }
    var s7 = {
        $$typeof: w,
        Provider: null,
        Consumer: null,
        _currentValue: M,
        _currentValue2: M,
        _threadCount: 0
    };

    function ce(e, t, n, r, a, l, o, i, u) {
        this.tag = 1, this.containerInfo = e, this.pingCache = this.current = this.pendingChildren = null, this.timeoutHandle = -1, this.callbackNode = this.next = this.pendingContext = this.context = this.cancelPendingCommit = null, this.callbackPriority = 0, this.expirationTimes = ek(-1), this.entangledLanes = this.shellSuspendCounter = this.errorRecoveryDisabledLanes = this.expiredLanes = this.warmLanes = this.pingedLanes = this.suspendedLanes = this.pendingLanes = 0, this.entanglements = ek(0), this.hiddenUpdates = ek(null), this.identifierPrefix = r, this.onUncaughtError = a, this.onCaughtError = l, this.onRecoverableError = o, this.pooledCache = null, this.pooledCacheLanes = 0, this.formState = u, this.incompleteTransitions = new Map
    }

    function ct(e, t, n, r, a, l, o, i, u, s, c, d) {
        return e = new ce(e, t, n, o, u, s, c, d, i), t = 1, !0 === l && (t |= 24), l = n7(3, null, null, t), e.current = l, l.stateNode = e, t = r0(), t.refCount++, e.pooledCache = t, t.refCount++, l.memoizedState = {
            element: r,
            isDehydrated: n,
            cache: t
        }, aS(l), e
    }

    function cn(e, t, n, r, a, l) {
        a = a ? n5 : n5, null === r.context ? r.context = a : r.pendingContext = a, (r = aE(t)).payload = {
            element: n
        }, null !== (l = void 0 === l ? null : l) && (r.callback = l), null !== (n = ak(e, r, t)) && (uo(n, e, t), ax(n, e, t))
    }

    function cr(e, t) {
        if (null !== (e = e.memoizedState) && null !== e.dehydrated) {
            var n = e.retryLane;
            e.retryLane = 0 !== n && n < t ? n : t
        }
    }

    function ca(e, t) {
        cr(e, t), (e = e.alternate) && cr(e, t)
    }

    function cl(e) {
        if (13 === e.tag || 31 === e.tag) {
            var t = n4(e, 0x4000000);
            null !== t && uo(t, e, 0x4000000), ca(e, 0x4000000)
        }
    }

    function co(e) {
        if (13 === e.tag || 31 === e.tag) {
            var t = ua(),
                n = n4(e, t = eN(t));
            null !== n && uo(n, e, t), ca(e, t)
        }
    }
    var ci = !0;

    function cu(e, t, n, r) {
        var a = I.T;
        I.T = null;
        var l = D.p;
        try {
            D.p = 2, cc(e, t, n, r)
        } finally {
            D.p = l, I.T = a
        }
    }

    function cs(e, t, n, r) {
        var a = I.T;
        I.T = null;
        var l = D.p;
        try {
            D.p = 8, cc(e, t, n, r)
        } finally {
            D.p = l, I.T = a
        }
    }

    function cc(e, t, n, r) {
        if (ci) {
            var a = cd(r);
            if (null === a) se(e, t, r, cf, n), cE(e, r);
            else if (function(e, t, n, r, a) {
                    switch (t) {
                        case "focusin":
                            return cg = ck(cg, e, t, n, r, a), !0;
                        case "dragenter":
                            return cv = ck(cv, e, t, n, r, a), !0;
                        case "mouseover":
                            return cy = ck(cy, e, t, n, r, a), !0;
                        case "pointerover":
                            var l = a.pointerId;
                            return cb.set(l, ck(cb.get(l) || null, e, t, n, r, a)), !0;
                        case "gotpointercapture":
                            return l = a.pointerId, c_.set(l, ck(c_.get(l) || null, e, t, n, r, a)), !0
                    }
                    return !1
                }(a, e, t, n, r)) r.stopPropagation();
            else if (cE(e, r), 4 & t && -1 < cw.indexOf(e)) {
                for (; null !== a;) {
                    var l = eW(a);
                    if (null !== l) switch (l.tag) {
                        case 3:
                            if ((l = l.stateNode).current.memoizedState.isDehydrated) {
                                var o = e_(l.pendingLanes);
                                if (0 !== o) {
                                    var i = l;
                                    for (i.pendingLanes |= 2, i.entangledLanes |= 2; o;) {
                                        var u = 1 << 31 - eh(o);
                                        i.entanglements[1] |= u, o &= ~u
                                    }
                                    uW(l), 0 == (6 & iD) && (i2 = el() + 500, u$(0, !1))
                                }
                            }
                            break;
                        case 31:
                        case 13:
                            null !== (i = n4(l, 2)) && uo(i, l, 2), uc(), ca(l, 2)
                    }
                    if (null === (l = cd(r)) && se(e, t, r, cf, n), l === a) break;
                    a = l
                }
                null !== a && r.stopPropagation()
            } else se(e, t, r, null, n)
        }
    }

    function cd(e) {
        return cp(e = tv(e))
    }
    var cf = null;

    function cp(e) {
        if (cf = null, null !== (e = eq(e))) {
            var t = c(e);
            if (null === t) e = null;
            else {
                var n = t.tag;
                if (13 === n) {
                    if (null !== (e = d(t))) return e;
                    e = null
                } else if (31 === n) {
                    if (null !== (e = f(t))) return e;
                    e = null
                } else if (3 === n) {
                    if (t.stateNode.current.memoizedState.isDehydrated) return 3 === t.tag ? t.stateNode.containerInfo : null;
                    e = null
                } else t !== e && (e = null)
            }
        }
        return cf = e, null
    }

    function ch(e) {
        switch (e) {
            case "beforetoggle":
            case "cancel":
            case "click":
            case "close":
            case "contextmenu":
            case "copy":
            case "cut":
            case "auxclick":
            case "dblclick":
            case "dragend":
            case "dragstart":
            case "drop":
            case "focusin":
            case "focusout":
            case "input":
            case "invalid":
            case "keydown":
            case "keypress":
            case "keyup":
            case "mousedown":
            case "mouseup":
            case "paste":
            case "pause":
            case "play":
            case "pointercancel":
            case "pointerdown":
            case "pointerup":
            case "ratechange":
            case "reset":
            case "resize":
            case "seeked":
            case "submit":
            case "toggle":
            case "touchcancel":
            case "touchend":
            case "touchstart":
            case "volumechange":
            case "change":
            case "selectionchange":
            case "textInput":
            case "compositionstart":
            case "compositionend":
            case "compositionupdate":
            case "beforeblur":
            case "afterblur":
            case "beforeinput":
            case "blur":
            case "fullscreenchange":
            case "focus":
            case "hashchange":
            case "popstate":
            case "select":
            case "selectstart":
                return 2;
            case "drag":
            case "dragenter":
            case "dragexit":
            case "dragleave":
            case "dragover":
            case "mousemove":
            case "mouseout":
            case "mouseover":
            case "pointermove":
            case "pointerout":
            case "pointerover":
            case "scroll":
            case "touchmove":
            case "wheel":
            case "mouseenter":
            case "mouseleave":
            case "pointerenter":
            case "pointerleave":
                return 8;
            case "message":
                switch (eo()) {
                    case ei:
                        return 2;
                    case eu:
                        return 8;
                    case es:
                    case ec:
                        return 32;
                    case ed:
                        return 0x10000000;
                    default:
                        return 32
                }
            default:
                return 32
        }
    }
    var cm = !1,
        cg = null,
        cv = null,
        cy = null,
        cb = new Map,
        c_ = new Map,
        cS = [],
        cw = "mousedown mouseup touchcancel touchend touchstart auxclick dblclick pointercancel pointerdown pointerup dragend dragstart drop compositionend compositionstart keydown keypress keyup input textInput copy cut paste click change contextmenu reset".split(" ");

    function cE(e, t) {
        switch (e) {
            case "focusin":
            case "focusout":
                cg = null;
                break;
            case "dragenter":
            case "dragleave":
                cv = null;
                break;
            case "mouseover":
            case "mouseout":
                cy = null;
                break;
            case "pointerover":
            case "pointerout":
                cb.delete(t.pointerId);
                break;
            case "gotpointercapture":
            case "lostpointercapture":
                c_.delete(t.pointerId)
        }
    }

    function ck(e, t, n, r, a, l) {
        return null === e || e.nativeEvent !== l ? (e = {
            blockedOn: t,
            domEventName: n,
            eventSystemFlags: r,
            nativeEvent: l,
            targetContainers: [a]
        }, null !== t && null !== (t = eW(t)) && cl(t)) : (e.eventSystemFlags |= r, t = e.targetContainers, null !== a && -1 === t.indexOf(a) && t.push(a)), e
    }

    function cx(e) {
        var t = eq(e.target);
        if (null !== t) {
            var n = c(t);
            if (null !== n) {
                if (13 === (t = n.tag)) {
                    if (null !== (t = d(n))) {
                        e.blockedOn = t, eL(e.priority, function() {
                            co(n)
                        });
                        return
                    }
                } else if (31 === t) {
                    if (null !== (t = f(n))) {
                        e.blockedOn = t, eL(e.priority, function() {
                            co(n)
                        });
                        return
                    }
                } else if (3 === t && n.stateNode.current.memoizedState.isDehydrated) {
                    e.blockedOn = 3 === n.tag ? n.stateNode.containerInfo : null;
                    return
                }
            }
        }
        e.blockedOn = null
    }

    function cT(e) {
        if (null !== e.blockedOn) return !1;
        for (var t = e.targetContainers; 0 < t.length;) {
            var n = cd(e.nativeEvent);
            if (null !== n) return null !== (t = eW(n)) && cl(t), e.blockedOn = n, !1;
            var r = new(n = e.nativeEvent).constructor(n.type, n);
            tg = r, n.target.dispatchEvent(r), tg = null, t.shift()
        }
        return !0
    }

    function cP(e, t, n) {
        cT(e) && n.delete(t)
    }

    function cC() {
        cm = !1, null !== cg && cT(cg) && (cg = null), null !== cv && cT(cv) && (cv = null), null !== cy && cT(cy) && (cy = null), cb.forEach(cP), c_.forEach(cP)
    }

    function cN(e, t) {
        e.blockedOn === t && (e.blockedOn = null, cm || (cm = !0, l.unstable_scheduleCallback(l.unstable_NormalPriority, cC)))
    }
    var cR = null;

    function cA(e) {
        cR !== e && (cR = e, l.unstable_scheduleCallback(l.unstable_NormalPriority, function() {
            cR === e && (cR = null);
            for (var t = 0; t < e.length; t += 3) {
                var n = e[t],
                    r = e[t + 1],
                    a = e[t + 2];
                if ("function" != typeof r)
                    if (null === cp(r || n)) continue;
                    else break;
                var l = eW(n);
                null !== l && (e.splice(t, 3), t -= 3, lX(l, {
                    pending: !0,
                    data: a,
                    method: n.method,
                    action: r
                }, r, a))
            }
        }))
    }

    function cL(e) {
        function t(t) {
            return cN(t, e)
        }
        null !== cg && cN(cg, e), null !== cv && cN(cv, e), null !== cy && cN(cy, e), cb.forEach(t), c_.forEach(t);
        for (var n = 0; n < cS.length; n++) {
            var r = cS[n];
            r.blockedOn === e && (r.blockedOn = null)
        }
        for (; 0 < cS.length && null === (n = cS[0]).blockedOn;) cx(n), null === n.blockedOn && cS.shift();
        if (null != (n = (e.ownerDocument || e).$$reactFormReplay))
            for (r = 0; r < n.length; r += 3) {
                var a = n[r],
                    l = n[r + 1],
                    o = a[eD] || null;
                if ("function" == typeof l) o || cA(n);
                else if (o) {
                    var i = null;
                    if (l && l.hasAttribute("formAction")) {
                        if (a = l, o = l[eD] || null) i = o.formAction;
                        else if (null !== cp(a)) continue
                    } else i = o.action;
                    "function" == typeof i ? n[r + 1] = i : (n.splice(r, 3), r -= 3), cA(n)
                }
            }
    }

    function cO() {
        function e(e) {
            e.canIntercept && "react-transition" === e.info && e.intercept({
                handler: function() {
                    return new Promise(function(e) {
                        return a = e
                    })
                },
                focusReset: "manual",
                scroll: "manual"
            })
        }

        function t() {
            null !== a && (a(), a = null), r || setTimeout(n, 20)
        }

        function n() {
            if (!r && !navigation.transition) {
                var e = navigation.currentEntry;
                e && null != e.url && navigation.navigate(e.url, {
                    state: e.getState(),
                    info: "react-transition",
                    history: "replace"
                })
            }
        }
        if ("object" == typeof navigation) {
            var r = !1,
                a = null;
            return navigation.addEventListener("navigate", e), navigation.addEventListener("navigatesuccess", t), navigation.addEventListener("navigateerror", t), setTimeout(n, 100),
                function() {
                    r = !0, navigation.removeEventListener("navigate", e), navigation.removeEventListener("navigatesuccess", t), navigation.removeEventListener("navigateerror", t), null !== a && (a(), a = null)
                }
        }
    }

    function cI(e) {
        this._internalRoot = e
    }

    function cD(e) {
        this._internalRoot = e
    }
    cD.prototype.render = cI.prototype.render = function(e) {
        var t = this._internalRoot;
        if (null === t) throw Error(u(409));
        cn(t.current, ua(), e, t, null, null)
    }, cD.prototype.unmount = cI.prototype.unmount = function() {
        var e = this._internalRoot;
        if (null !== e) {
            this._internalRoot = null;
            var t = e.containerInfo;
            cn(e.current, 2, null, e, null, null), uc(), t[eM] = null
        }
    }, cD.prototype.unstable_scheduleHydration = function(e) {
        if (e) {
            var t = eA();
            e = {
                blockedOn: null,
                target: e,
                priority: t
            };
            for (var n = 0; n < cS.length && 0 !== t && t < cS[n].priority; n++);
            cS.splice(n, 0, e), 0 === n && cx(e)
        }
    };
    var cM = o.version;
    if ("19.2.6" !== cM) throw Error(u(527, cM, "19.2.6"));
    if (D.findDOMNode = function(e) {
            var t = e._reactInternals;
            if (void 0 === t) {
                if ("function" == typeof e.render) throw Error(u(188));
                throw Error(u(268, e = Object.keys(e).join(",")))
            }
            return null === (e = null !== (e = function(e) {
                var t = e.alternate;
                if (!t) {
                    if (null === (t = c(e))) throw Error(u(188));
                    return t !== e ? null : e
                }
                for (var n = e, r = t;;) {
                    var a = n.return;
                    if (null === a) break;
                    var l = a.alternate;
                    if (null === l) {
                        if (null !== (r = a.return)) {
                            n = r;
                            continue
                        }
                        break
                    }
                    if (a.child === l.child) {
                        for (l = a.child; l;) {
                            if (l === n) return p(a), e;
                            if (l === r) return p(a), t;
                            l = l.sibling
                        }
                        throw Error(u(188))
                    }
                    if (n.return !== r.return) n = a, r = l;
                    else {
                        for (var o = !1, i = a.child; i;) {
                            if (i === n) {
                                o = !0, n = a, r = l;
                                break
                            }
                            if (i === r) {
                                o = !0, r = a, n = l;
                                break
                            }
                            i = i.sibling
                        }
                        if (!o) {
                            for (i = l.child; i;) {
                                if (i === n) {
                                    o = !0, n = l, r = a;
                                    break
                                }
                                if (i === r) {
                                    o = !0, r = l, n = a;
                                    break
                                }
                                i = i.sibling
                            }
                            if (!o) throw Error(u(189))
                        }
                    }
                    if (n.alternate !== r) throw Error(u(190))
                }
                if (3 !== n.tag) throw Error(u(188));
                return n.stateNode.current === n ? e : t
            }(t)) ? function e(t) {
                var n = t.tag;
                if (5 === n || 26 === n || 27 === n || 6 === n) return t;
                for (t = t.child; null !== t;) {
                    if (null !== (n = e(t))) return n;
                    t = t.sibling
                }
                return null
            }(e) : null) ? null : e.stateNode
        }, "u" > typeof __REACT_DEVTOOLS_GLOBAL_HOOK__) {
        var cz = __REACT_DEVTOOLS_GLOBAL_HOOK__;
        if (!cz.isDisabled && cz.supportsFiber) try {
            ef = cz.inject({
                bundleType: 0,
                version: "19.2.6",
                rendererPackageName: "react-dom",
                currentDispatcherRef: I,
                reconcilerVersion: "19.2.6"
            }), ep = cz
        } catch (e) {}
    }
    n.createRoot = function(e, t) {
        if (!s(e)) throw Error(u(299));
        var n = !1,
            r = "",
            a = os,
            l = oc,
            o = od;
        return null != t && (!0 === t.unstable_strictMode && (n = !0), void 0 !== t.identifierPrefix && (r = t.identifierPrefix), void 0 !== t.onUncaughtError && (a = t.onUncaughtError), void 0 !== t.onCaughtError && (l = t.onCaughtError), void 0 !== t.onRecoverableError && (o = t.onRecoverableError)), t = ct(e, 1, !1, null, null, n, r, null, a, l, o, cO), e[eM] = t.current, u9(e), new cI(t)
    }, n.hydrateRoot = function(e, t, n) {
        if (!s(e)) throw Error(u(299));
        var r, a = !1,
            l = "",
            o = os,
            i = oc,
            c = od,
            d = null;
        return null != n && (!0 === n.unstable_strictMode && (a = !0), void 0 !== n.identifierPrefix && (l = n.identifierPrefix), void 0 !== n.onUncaughtError && (o = n.onUncaughtError), void 0 !== n.onCaughtError && (i = n.onCaughtError), void 0 !== n.onRecoverableError && (c = n.onRecoverableError), void 0 !== n.formState && (d = n.formState)), (t = ct(e, 1, !0, t, null != n ? n : null, a, l, d, o, i, c, cO)).context = (r = null, n5), n = t.current, (l = aE(a = eN(a = ua()))).callback = null, ak(n, l, a), n = a, t.current.lanes = n, ex(t, n), uW(t), e[eM] = t.current, u9(e), new cD(t)
    }, n.version = "19.2.6"
}, 312122, (e, t, n) => {
    "use strict";
    ! function e() {
        if ("u" > typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ && "function" == typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE) try {
            __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(e)
        } catch (e) {
            console.error(e)
        }
    }(), t.exports = e.r(521366)
}, 237947, (e, t, n) => {
    "use strict";

    function r(e, t) {
        var n = e.length;
        for (e.push(t); 0 < n;) {
            var r = n - 1 >>> 1,
                a = e[r];
            if (0 < o(a, t)) e[r] = t, e[n] = a, n = r;
            else break
        }
    }

    function a(e) {
        return 0 === e.length ? null : e[0]
    }

    function l(e) {
        if (0 === e.length) return null;
        var t = e[0],
            n = e.pop();
        if (n !== t) {
            e[0] = n;
            for (var r = 0, a = e.length, l = a >>> 1; r < l;) {
                var i = 2 * (r + 1) - 1,
                    u = e[i],
                    s = i + 1,
                    c = e[s];
                if (0 > o(u, n)) s < a && 0 > o(c, u) ? (e[r] = c, e[s] = n, r = s) : (e[r] = u, e[i] = n, r = i);
                else if (s < a && 0 > o(c, n)) e[r] = c, e[s] = n, r = s;
                else break
            }
        }
        return t
    }

    function o(e, t) {
        var n = e.sortIndex - t.sortIndex;
        return 0 !== n ? n : e.id - t.id
    }
    if (n.unstable_now = void 0, "object" == typeof performance && "function" == typeof performance.now) {
        var i, u = performance;
        n.unstable_now = function() {
            return u.now()
        }
    } else {
        var s = Date,
            c = s.now();
        n.unstable_now = function() {
            return s.now() - c
        }
    }
    var d = [],
        f = [],
        p = 1,
        h = null,
        m = 3,
        g = !1,
        v = !1,
        y = !1,
        b = !1,
        _ = "function" == typeof setTimeout ? setTimeout : null,
        S = "function" == typeof clearTimeout ? clearTimeout : null,
        w = "u" > typeof setImmediate ? setImmediate : null;

    function E(e) {
        for (var t = a(f); null !== t;) {
            if (null === t.callback) l(f);
            else if (t.startTime <= e) l(f), t.sortIndex = t.expirationTime, r(d, t);
            else break;
            t = a(f)
        }
    }

    function k(e) {
        if (y = !1, E(e), !v)
            if (null !== a(d)) v = !0, x || (x = !0, i());
            else {
                var t = a(f);
                null !== t && O(k, t.startTime - e)
            }
    }
    var x = !1,
        T = -1,
        P = 5,
        C = -1;

    function N() {
        return !!b || !(n.unstable_now() - C < P)
    }

    function R() {
        if (b = !1, x) {
            var e = n.unstable_now();
            C = e;
            var t = !0;
            try {
                e: {
                    v = !1,
                    y && (y = !1, S(T), T = -1),
                    g = !0;
                    var r = m;
                    try {
                        t: {
                            for (E(e), h = a(d); null !== h && !(h.expirationTime > e && N());) {
                                var o = h.callback;
                                if ("function" == typeof o) {
                                    h.callback = null, m = h.priorityLevel;
                                    var u = o(h.expirationTime <= e);
                                    if (e = n.unstable_now(), "function" == typeof u) {
                                        h.callback = u, E(e), t = !0;
                                        break t
                                    }
                                    h === a(d) && l(d), E(e)
                                } else l(d);
                                h = a(d)
                            }
                            if (null !== h) t = !0;
                            else {
                                var s = a(f);
                                null !== s && O(k, s.startTime - e), t = !1
                            }
                        }
                        break e
                    }
                    finally {
                        h = null, m = r, g = !1
                    }
                }
            }
            finally {
                t ? i() : x = !1
            }
        }
    }
    if ("function" == typeof w) i = function() {
        w(R)
    };
    else if ("u" > typeof MessageChannel) {
        var A = new MessageChannel,
            L = A.port2;
        A.port1.onmessage = R, i = function() {
            L.postMessage(null)
        }
    } else i = function() {
        _(R, 0)
    };

    function O(e, t) {
        T = _(function() {
            e(n.unstable_now())
        }, t)
    }
    n.unstable_IdlePriority = 5, n.unstable_ImmediatePriority = 1, n.unstable_LowPriority = 4, n.unstable_NormalPriority = 3, n.unstable_Profiling = null, n.unstable_UserBlockingPriority = 2, n.unstable_cancelCallback = function(e) {
        e.callback = null
    }, n.unstable_forceFrameRate = function(e) {
        0 > e || 125 < e ? console.error("forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported") : P = 0 < e ? Math.floor(1e3 / e) : 5
    }, n.unstable_getCurrentPriorityLevel = function() {
        return m
    }, n.unstable_next = function(e) {
        switch (m) {
            case 1:
            case 2:
            case 3:
                var t = 3;
                break;
            default:
                t = m
        }
        var n = m;
        m = t;
        try {
            return e()
        } finally {
            m = n
        }
    }, n.unstable_requestPaint = function() {
        b = !0
    }, n.unstable_runWithPriority = function(e, t) {
        switch (e) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                break;
            default:
                e = 3
        }
        var n = m;
        m = e;
        try {
            return t()
        } finally {
            m = n
        }
    }, n.unstable_scheduleCallback = function(e, t, l) {
        var o = n.unstable_now();
        switch (l = "object" == typeof l && null !== l && "number" == typeof(l = l.delay) && 0 < l ? o + l : o, e) {
            case 1:
                var u = -1;
                break;
            case 2:
                u = 250;
                break;
            case 5:
                u = 0x3fffffff;
                break;
            case 4:
                u = 1e4;
                break;
            default:
                u = 5e3
        }
        return u = l + u, e = {
            id: p++,
            callback: t,
            priorityLevel: e,
            startTime: l,
            expirationTime: u,
            sortIndex: -1
        }, l > o ? (e.sortIndex = l, r(f, e), null === a(d) && e === a(f) && (y ? (S(T), T = -1) : y = !0, O(k, l - o))) : (e.sortIndex = u, r(d, e), v || g || (v = !0, x || (x = !0, i()))), e
    }, n.unstable_shouldYield = N, n.unstable_wrapCallback = function(e) {
        var t = m;
        return function() {
            var n = m;
            m = t;
            try {
                return e.apply(this, arguments)
            } finally {
                m = n
            }
        }
    }
}, 787371, (e, t, n) => {
    "use strict";
    t.exports = e.r(237947)
}, 171908, e => {
    "use strict";
    let t, n, r, a, l, o, i, u, s, c, d, f, p;
    var h = e.i(163021),
        m = e.i(505099),
        g = e.i(33098),
        v = e.i(750672),
        y = e.i(973716),
        b = e.i(191329),
        _ = e.i(334006),
        S = e.i(46870),
        w = e.i(706854),
        E = e.i(825142),
        k = e.i(439470),
        x = e.i(774959),
        T = e.i(882086),
        P = e.i(27472),
        C = e.i(929559);
    let N = {
        idleTimeout: 1e3,
        finalTimeout: 3e4,
        childSpanTimeout: 15e3
    };

    function R(e) {
        var t;
        let n, r, a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            l = new Map,
            o = !1,
            i = "externalFinish",
            u = !a.disableAutoFinish,
            s = [],
            {
                idleTimeout: c = N.idleTimeout,
                finalTimeout: d = N.finalTimeout,
                childSpanTimeout: f = N.childSpanTimeout,
                beforeSpanEnd: p,
                trimIdleSpanEndTimestamp: h = !0
            } = a,
            R = (0, m.l)();
        if (!R || !(0, b.f)()) {
            let e = new x.f,
                t = {
                    sample_rate: "0",
                    sampled: "false",
                    ...(0, k.O)(e)
                };
            return (0, k.m)(e, t), e
        }
        let A = (0, m.d)(),
            L = (0, w.j)(),
            O = (t = e, n = (0, C.e)(t), (0, S._)((0, m.d)(), n), g.f && y.h.log("[Tracing] Started span is an idle span"), n);

        function I() {
            r && (clearTimeout(r), r = void 0)
        }

        function D(e) {
            I(), r = setTimeout(() => {
                !o && 0 === l.size && u && (i = "idleTimeout", O.end(e))
            }, c)
        }

        function M(e) {
            r = setTimeout(() => {
                !o && u && (i = "heartbeatFailed", O.end(e))
            }, f)
        }

        function z(e) {
            o = !0, l.clear(), s.forEach(e => e()), (0, S._)(A, L);
            let t = (0, w.l)(O),
                {
                    start_timestamp: n
                } = t;
            if (!n) return;
            t.data[v.i] || O.setAttribute(v.i, i);
            let r = t.status;
            r && "unknown" !== r || O.setStatus({
                code: P.b
            }), y.h.log('[Tracing] Idle span "'.concat(t.op, '" finished'));
            let a = (0, w.D)(O).filter(e => e !== O),
                u = 0;
            a.forEach(t => {
                t.isRecording() && (t.setStatus({
                    code: P.r,
                    message: "cancelled"
                }), t.end(e), g.f && y.h.log("[Tracing] Cancelling span since span ended early", JSON.stringify(t, void 0, 2)));
                let {
                    timestamp: n = 0,
                    start_timestamp: r = 0
                } = (0, w.l)(t), a = r <= e, l = n - r <= (d + c) / 1e3;
                if (g.f) {
                    let e = JSON.stringify(t, void 0, 2);
                    a ? l || y.h.log("[Tracing] Discarding span since it finished after idle span final timeout", e) : y.h.log("[Tracing] Discarding span since it happened after idle span was finished", e)
                }(!l || !a) && ((0, w.V)(O, t), u++)
            }), u > 0 && O.setAttribute("sentry.idle_span_discarded_spans", u)
        }
        return O.end = new Proxy(O.end, {
            apply(e, t, n) {
                if (p && p(O), t instanceof x.f) return;
                let [r, ...a] = n, l = r || (0, E.R)(), o = (0, w.k)(l), i = (0, w.D)(O).filter(e => e !== O), u = (0, w.l)(O);
                if (!i.length || !h) return z(o), Reflect.apply(e, t, [o, ...a]);
                let s = R.getOptions().ignoreSpans,
                    c = null == i ? void 0 : i.reduce((e, t) => {
                        let n = (0, w.l)(t);
                        return !n.timestamp || s && (0, _.s)({
                            description: n.description,
                            op: n.op,
                            attributes: n.data
                        }, s) ? e : e ? Math.max(e, n.timestamp) : n.timestamp
                    }, void 0),
                    f = u.start_timestamp,
                    m = Math.min(f ? f + d / 1e3 : 1 / 0, Math.max(f || -1 / 0, Math.min(o, c || 1 / 0)));
                return z(m), Reflect.apply(e, t, [m, ...a])
            }
        }), s.push(R.on("spanStart", e => {
            var t;
            !(o || e === O || (0, w.l)(e).timestamp || e instanceof T.f && e.isStandaloneSpan()) && (0, w.D)(O).includes(e) && (t = e.spanContext().spanId, I(), l.set(t, !0), M((0, E.R)() + f / 1e3))
        })), s.push(R.on("spanEnd", e => {
            if (!o) {
                var t;
                t = e.spanContext().spanId, l.has(t) && l.delete(t), 0 === l.size && D((0, E.R)() + c / 1e3)
            }
        })), s.push(R.on("idleSpanEnableAutoFinish", e => {
            e === O && (u = !0, D(), l.size && M())
        })), a.disableAutoFinish || D(), setTimeout(() => {
            o || (O.setStatus({
                code: P.r,
                message: "deadline_exceeded"
            }), i = "finalTimeout", O.end())
        }, d), O
    }
    var A = e.i(981676);

    function L(e) {
        return "isRelative" in e
    }

    function O(e, t) {
        let n = 0 >= e.indexOf("://") && 0 !== e.indexOf("//"),
            r = null != t ? t : n ? "thismessage:/" : void 0;
        try {
            if ("canParse" in URL && !URL.canParse(e, r)) return;
            let t = new URL(e, r);
            if (n) return {
                isRelative: n,
                pathname: t.pathname,
                search: t.search,
                hash: t.hash
            };
            return t
        } catch (e) {}
    }

    function I(e) {
        if (!e) return {};
        let t = e.match(/^(([^:/?#]+):)?(\/\/([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?$/);
        if (!t) return {};
        let n = t[6] || "",
            r = t[8] || "";
        return {
            host: t[4],
            path: t[5],
            protocol: t[2],
            search: n,
            hash: r,
            relative: t[5] + n + r
        }
    }

    function D(e) {
        return e.split(/[?#]/, 1)[0]
    }

    function M(e) {
        let t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
        if (e.startsWith("data:")) {
            let n = e.match(/^data:([^;,]+)/),
                r = n ? n[1] : "text/plain",
                a = e.includes(";base64,"),
                l = e.indexOf(","),
                o = "";
            if (t && -1 !== l) {
                let t = e.slice(l + 1);
                o = t.length > 10 ? "".concat(t.slice(0, 10), "... [truncated]") : t
            }
            return "data:".concat(r).concat(a ? ",base64" : "").concat(o ? ",".concat(o) : "")
        }
        return e
    }
    var z = e.i(242734),
        F = e.i(900403);
    let j = {},
        U = {};

    function B(e, t) {
        return j[e] = j[e] || [], j[e].push(t), () => {
            let n = j[e];
            if (n) {
                let e = n.indexOf(t); - 1 !== e && n.splice(e, 1)
            }
        }
    }

    function H(e, t) {
        if (!U[e]) {
            U[e] = !0;
            try {
                t()
            } catch (t) {
                g.f && y.h.error("Error while instrumenting ".concat(e), t)
            }
        }
    }

    function q(e, t) {
        let n = e && j[e];
        if (n)
            for (let r of n) try {
                r(t)
            } catch (t) {
                g.f && y.h.error("Error while triggering instrumentation handler.\nType: ".concat(e, "\nName: ").concat((0, F.n)(r), "\nError:"), t)
            }
    }
    let W = null;

    function $(e) {
        let t = "error";
        B(t, e), H(t, V)
    }

    function V() {
        W = z.f.onerror, z.f.onerror = function(e, t, n, r, a) {
            return q("error", {
                column: r,
                error: a,
                line: n,
                msg: e,
                url: t
            }), !!W && W.apply(this, arguments)
        }, z.f.onerror.__SENTRY_INSTRUMENTED__ = !0
    }
    let Q = null;

    function G(e) {
        let t = "unhandledrejection";
        B(t, e), H(t, Y)
    }

    function Y() {
        Q = z.f.onunhandledrejection, z.f.onunhandledrejection = function(e) {
            return q("unhandledrejection", e), !Q || Q.apply(this, arguments)
        }, z.f.onunhandledrejection.__SENTRY_INSTRUMENTED__ = !0
    }
    let X = !1;
    var K = e.i(603820),
        J = e.i(329282),
        Z = e.i(445809),
        ee = e.i(506929);
    let et = z.f;

    function en(e) {
        return e && /^function\s+\w+\(\)\s+\{\s+\[native code\]\s+\}$/.test(e.toString())
    }
    let er = z.f;

    function ea(e) {
        let t = "history";
        B(t, e), H(t, el)
    }

    function el() {
        function e(e) {
            return function() {
                for (var n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                let l = r.length > 2 ? r[2] : void 0;
                if (l) {
                    let n = t,
                        a = function(e) {
                            try {
                                return new URL(e, er.location.origin).toString()
                            } catch (t) {
                                return e
                            }
                        }(String(l));
                    if (t = a, n === a) return e.apply(this, r);
                    q("history", {
                        from: n,
                        to: a
                    })
                }
                return e.apply(this, r)
            }
        }
        er.addEventListener("popstate", () => {
            let e = er.location.href,
                n = t;
            t = e, n === e || q("history", {
                from: n,
                to: e
            })
        }), "history" in et && et.history && ((0, ee.Q)(er.history, "pushState", e), (0, ee.Q)(er.history, "replaceState", e))
    }

    function eo() {
        let e;
        return "u" > typeof window && (!(!("u" > typeof __SENTRY_BROWSER_BUNDLE__ && __SENTRY_BROWSER_BUNDLE__) && "[object process]" === Object.prototype.toString.call(void 0 !== h.default ? h.default : 0)) || (null == (e = z.f.process) ? void 0 : e.type) === "renderer")
    }
    let ei = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__,
        eu = (e, t, n, r) => {
            let a, l;
            return o => {
                if (t.value >= 0 && (o || r) && ((l = t.value - (null != a ? a : 0)) || void 0 === a)) {
                    var i;
                    a = t.value, t.delta = l, i = t.value, t.rating = i > n[1] ? "poor" : i > n[0] ? "needs-improvement" : "good", e(t)
                }
            }
        },
        es = function() {
            var e, t;
            let n = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
                r = null == (t = er.performance) || null == (e = t.getEntriesByType) ? void 0 : e.call(t, "navigation")[0];
            if (!n || r && r.responseStart > 0 && r.responseStart < performance.now()) return r
        },
        ec = () => {
            var e;
            let t = es();
            return null != (e = null == t ? void 0 : t.activationStart) ? e : 0
        };

    function ed(e, t, n) {
        er.document && er.addEventListener(e, t, n)
    }

    function ef(e, t, n) {
        er.document && er.removeEventListener(e, t, n)
    }
    let ep = -1,
        eh = new Set,
        em = e => {
            var t;
            if (("pagehide" === e.type || (null == (t = er.document) ? void 0 : t.visibilityState) === "hidden") && ep > -1) {
                if ("visibilitychange" === e.type || "pagehide" === e.type)
                    for (let e of eh) e();
                isFinite(ep) || (ep = "visibilitychange" === e.type ? e.timeStamp : 0, ef("prerenderingchange", em, !0))
            }
        },
        eg = () => {
            if (er.document && ep < 0) {
                var e, t, n;
                let r = ec(),
                    a = er.document.prerendering || null == (e = globalThis.performance.getEntriesByType("visibility-state").filter(e => "hidden" === e.name && e.startTime > r)[0]) ? void 0 : e.startTime;
                ep = null != a ? a : (null == (t = er.document) ? void 0 : t.visibilityState) !== "hidden" || (null == (n = er.document) ? void 0 : n.prerendering) ? 1 / 0 : 0, ed("visibilitychange", em, !0), ed("pagehide", em, !0), ed("prerenderingchange", em, !0)
            }
            return {
                get firstHiddenTime() {
                    return ep
                },
                onHidden(e) {
                    eh.add(e)
                }
            }
        },
        ev = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : -1,
                n = es(),
                r = "navigate";
            if (n) {
                var a, l;
                (null == (a = er.document) ? void 0 : a.prerendering) || ec() > 0 ? r = "prerender" : (null == (l = er.document) ? void 0 : l.wasDiscarded) ? r = "restore" : n.type && (r = n.type.replace(/_/g, "-"))
            }
            return {
                name: e,
                value: t,
                rating: "good",
                delta: 0,
                entries: [],
                id: "v5-".concat(Date.now(), "-").concat(Math.floor(Math.random() * (9e12 - 1)) + 1e12),
                navigationType: r
            }
        },
        ey = new WeakMap;

    function eb(e, t) {
        try {
            return ey.get(e) || ey.set(e, new t), ey.get(e)
        } catch (e) {
            return new t
        }
    }
    class e_ {
        __init() {
            this._sessionValue = 0
        }
        __init2() {
            this._sessionEntries = []
        }
        _processEntry(e) {
            var t;
            if (e.hadRecentInput) return;
            let n = this._sessionEntries[0],
                r = this._sessionEntries[this._sessionEntries.length - 1];
            this._sessionValue && n && r && e.startTime - r.startTime < 1e3 && e.startTime - n.startTime < 5e3 ? (this._sessionValue += e.value, this._sessionEntries.push(e)) : (this._sessionValue = e.value, this._sessionEntries = [e]), null == (t = this._onAfterProcessingUnexpectedShift) || t.call(this, e)
        }
        constructor() {
            e_.prototype.__init.call(this), e_.prototype.__init2.call(this)
        }
    }
    let eS = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            try {
                if (PerformanceObserver.supportedEntryTypes.includes(e)) {
                    let r = new PerformanceObserver(e => {
                        Promise.resolve().then(() => {
                            t(e.getEntries())
                        })
                    });
                    return r.observe({
                        type: e,
                        buffered: !0,
                        ...n
                    }), r
                }
            } catch (e) {}
        },
        ew = e => {
            let t = !1;
            return () => {
                t || (e(), t = !0)
            }
        },
        eE = e => {
            var t;
            (null == (t = er.document) ? void 0 : t.prerendering) ? addEventListener("prerenderingchange", () => e(), !0): e()
        },
        ek = [1800, 3e3],
        ex = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            eE(() => {
                let n, r = eg(),
                    a = ev("FCP"),
                    l = eS("paint", e => {
                        for (let t of e) "first-contentful-paint" === t.name && (l.disconnect(), t.startTime < r.firstHiddenTime && (a.value = Math.max(t.startTime - ec(), 0), a.entries.push(t), n(!0)))
                    });
                l && (n = eu(e, a, ek, t.reportAllChanges))
            })
        },
        eT = [.1, .25],
        eP = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            ex(ew(() => {
                let n, r = ev("CLS", 0),
                    a = eg(),
                    l = eb(t, e_),
                    o = e => {
                        for (let t of e) l._processEntry(t);
                        l._sessionValue > r.value && (r.value = l._sessionValue, r.entries = l._sessionEntries, n())
                    },
                    i = eS("layout-shift", o);
                if (i) {
                    var u;
                    n = eu(e, r, eT, t.reportAllChanges), a.onHidden(() => {
                        o(i.takeRecords()), n(!0)
                    }), null == er || null == (u = er.setTimeout) || u.call(er, n)
                }
            }))
        },
        eC = 0,
        eN = 1 / 0,
        eR = 0,
        eA = e => {
            e.forEach(e => {
                e.interactionId && (eN = Math.min(eN, e.interactionId), eC = (eR = Math.max(eR, e.interactionId)) ? (eR - eN) / 7 + 1 : 0)
            })
        },
        eL = () => n ? eC : performance.interactionCount || 0,
        eO = 0;
    class eI {
        __init() {
            this._longestInteractionList = []
        }
        __init2() {
            this._longestInteractionMap = new Map
        }
        _resetInteractions() {
            eO = eL(), this._longestInteractionList.length = 0, this._longestInteractionMap.clear()
        }
        _estimateP98LongestInteraction() {
            let e = Math.min(this._longestInteractionList.length - 1, Math.floor((eL() - eO) / 50));
            return this._longestInteractionList[e]
        }
        _processEntry(e) {
            var t, n;
            if (null == (t = this._onBeforeProcessingEntry) || t.call(this, e), !(e.interactionId || "first-input" === e.entryType)) return;
            let r = this._longestInteractionList.at(-1),
                a = this._longestInteractionMap.get(e.interactionId);
            if (a || this._longestInteractionList.length < 10 || e.duration > r._latency) {
                if (a ? e.duration > a._latency ? (a.entries = [e], a._latency = e.duration) : e.duration === a._latency && e.startTime === a.entries[0].startTime && a.entries.push(e) : (a = {
                        id: e.interactionId,
                        entries: [e],
                        _latency: e.duration
                    }, this._longestInteractionMap.set(a.id, a), this._longestInteractionList.push(a)), this._longestInteractionList.sort((e, t) => t._latency - e._latency), this._longestInteractionList.length > 10)
                    for (let e of this._longestInteractionList.splice(10)) this._longestInteractionMap.delete(e.id);
                null == (n = this._onAfterProcessingINPCandidate) || n.call(this, a)
            }
        }
        constructor() {
            eI.prototype.__init.call(this), eI.prototype.__init2.call(this)
        }
    }
    let eD = e => {
            var t;
            let n = er.requestIdleCallback || er.setTimeout;
            (null == (t = er.document) ? void 0 : t.visibilityState) === "hidden" ? e(): (ed("visibilitychange", e = ew(e), {
                once: !0,
                capture: !0
            }), ed("pagehide", e, {
                once: !0,
                capture: !0
            }), n(() => {
                e(), ef("visibilitychange", e, {
                    capture: !0
                }), ef("pagehide", e, {
                    capture: !0
                })
            }))
        },
        eM = [200, 500],
        ez = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            if (!(globalThis.PerformanceEventTiming && "interactionId" in PerformanceEventTiming.prototype)) return;
            let r = eg();
            eE(() => {
                var a;
                let l;
                "interactionCount" in performance || n || (n = eS("event", eA, {
                    type: "event",
                    buffered: !0,
                    durationThreshold: 0
                }));
                let o = ev("INP"),
                    i = eb(t, eI),
                    u = e => {
                        eD(() => {
                            for (let t of e) i._processEntry(t);
                            let t = i._estimateP98LongestInteraction();
                            t && t._latency !== o.value && (o.value = t._latency, o.entries = t.entries, l())
                        })
                    },
                    s = eS("event", u, {
                        durationThreshold: null != (a = t.durationThreshold) ? a : 40
                    });
                l = eu(e, o, eM, t.reportAllChanges), s && (s.observe({
                    type: "first-input",
                    buffered: !0
                }), r.onHidden(() => {
                    u(s.takeRecords()), l(!0)
                }))
            })
        };
    class eF {
        _processEntry(e) {
            var t;
            null == (t = this._onBeforeProcessingEntry) || t.call(this, e)
        }
    }
    let ej = [2500, 4e3],
        eU = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            eE(() => {
                let n, r = eg(),
                    a = ev("LCP"),
                    l = eb(t, eF),
                    o = e => {
                        for (let o of (t.reportAllChanges || (e = e.slice(-1)), e)) l._processEntry(o), o.startTime < r.firstHiddenTime && (a.value = Math.max(o.startTime - ec(), 0), a.entries = [o], n())
                    },
                    i = eS("largest-contentful-paint", o);
                if (i) {
                    n = eu(e, a, ej, t.reportAllChanges);
                    let r = ew(() => {
                            o(i.takeRecords()), i.disconnect(), n(!0)
                        }),
                        l = e => {
                            e.isTrusted && (eD(r), ef(e.type, l, {
                                capture: !0
                            }))
                        };
                    for (let e of ["keydown", "click", "visibilitychange"]) ed(e, l, {
                        capture: !0
                    })
                }
            })
        },
        eB = [800, 1800],
        eH = e => {
            var t, n;
            (null == (t = er.document) ? void 0 : t.prerendering) ? eE(() => eH(e)): (null == (n = er.document) ? void 0 : n.readyState) !== "complete" ? addEventListener("load", () => eH(e), !0) : setTimeout(e)
        },
        eq = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = ev("TTFB"),
                r = eu(e, n, eB, t.reportAllChanges);
            eH(() => {
                let e = es();
                e && (n.value = Math.max(e.responseStart - ec(), 0), n.entries = [e], r(!0))
            })
        },
        eW = {},
        e$ = {};

    function eV(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        return e1("cls", e, eK, r, t)
    }

    function eQ(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        return e1("lcp", e, eJ, a, t)
    }

    function eG(e) {
        return e1("inp", e, e0, o)
    }

    function eY(e, t) {
        var n;
        let r;
        return e2(e, t), e$[e] || (r = {}, "event" === (n = e) && (r.durationThreshold = 0), eS(n, e => {
            eX(n, {
                entries: e
            })
        }, r), e$[e] = !0), e3(e, t)
    }

    function eX(e, t) {
        let n = eW[e];
        if (null == n ? void 0 : n.length)
            for (let r of n) try {
                r(t)
            } catch (t) {
                ei && y.h.error("Error while triggering instrumentation handler.\nType: ".concat(e, "\nName: ").concat((0, F.n)(r), "\nError:"), t)
            }
    }

    function eK() {
        return eP(e => {
            eX("cls", {
                metric: e
            }), r = e
        }, {
            reportAllChanges: !0
        })
    }

    function eJ() {
        return eU(e => {
            eX("lcp", {
                metric: e
            }), a = e
        }, {
            reportAllChanges: !0
        })
    }

    function eZ() {
        return eq(e => {
            eX("ttfb", {
                metric: e
            }), l = e
        })
    }

    function e0() {
        return ez(e => {
            eX("inp", {
                metric: e
            }), o = e
        })
    }

    function e1(e, t, n, r) {
        let a, l = arguments.length > 4 && void 0 !== arguments[4] && arguments[4];
        return e2(e, t), e$[e] || (a = n(), e$[e] = !0), r && t({
            metric: r
        }), e3(e, t, l ? a : void 0)
    }

    function e2(e, t) {
        eW[e] = eW[e] || [], eW[e].push(t)
    }

    function e3(e, t, n) {
        return () => {
            n && n();
            let r = eW[e];
            if (!r) return;
            let a = r.indexOf(t); - 1 !== a && r.splice(a, 1)
        }
    }

    function e4(e) {
        return "number" == typeof e && isFinite(e)
    }

    function e6(e, t, n, r) {
        let {
            ...a
        } = r, l = (0, w.l)(e).start_timestamp;
        return l && l > t && "function" == typeof e.updateStartTime && e.updateStartTime(t), (0, C.D)(e, () => {
            let e = (0, C.e)({
                startTime: t,
                ...a
            });
            return e && e.end(n), e
        })
    }

    function e8(e) {
        var t;
        let n, r = (0, m.l)();
        if (!r) return;
        let {
            name: a,
            transaction: l,
            attributes: o,
            startTime: i
        } = e, {
            release: u,
            environment: s,
            sendDefaultPii: c
        } = r.getOptions(), d = r.getIntegrationByName("Replay"), f = null == d ? void 0 : d.getReplayId(), p = (0, m.d)(), h = p.getUser(), g = void 0 !== h ? h.email || h.id || h.ip_address : void 0;
        try {
            n = p.getScopeData().contexts.profile.profile_id
        } catch (e) {}
        let v = {
            release: u,
            environment: s,
            user: g || void 0,
            profile_id: n || void 0,
            replay_id: f || void 0,
            transaction: l,
            "user_agent.original": null == (t = er.navigator) ? void 0 : t.userAgent,
            "client.address": c ? "{{auto}}" : void 0,
            ...o
        };
        return (0, C.e)({
            name: a,
            attributes: v,
            startTime: i,
            experimental: {
                standalone: !0
            }
        })
    }

    function e5() {
        return er.addEventListener && er.performance
    }

    function e9(e) {
        return e / 1e3
    }

    function e7(e) {
        try {
            return PerformanceObserver.supportedEntryTypes.includes(e)
        } catch (e) {
            return !1
        }
    }

    function te(e, t) {
        let n, r, a = !1;

        function l(e) {
            !a && r && t(e, r.spanContext().spanId, r), a = !0
        }
        ed("visibilitychange", n = e => {
            var t;
            ("pagehide" === e.type || (null == (t = er.document) ? void 0 : t.visibilityState) === "hidden") && (() => {
                l("pagehide")
            })()
        }, {
            capture: !0,
            once: !0
        }), ed("pagehide", n, {
            capture: !0,
            once: !0
        });
        let o = e.on("beforeStartNavigationSpan", (e, t) => {
                (null == t ? void 0 : t.isRedirect) || (l("navigation"), o(), i())
            }),
            i = e.on("afterStartPageLoadSpan", e => {
                r = e, i()
            })
    }
    let tt = [],
        tn = new Map,
        tr = new Map,
        ta = {
            click: "click",
            pointerdown: "click",
            pointerup: "click",
            mousedown: "click",
            mouseup: "click",
            touchstart: "click",
            touchend: "click",
            mouseover: "hover",
            mouseout: "hover",
            mouseenter: "hover",
            mouseleave: "hover",
            pointerover: "hover",
            pointerout: "hover",
            pointerenter: "hover",
            pointerleave: "hover",
            dragstart: "drag",
            dragend: "drag",
            drag: "drag",
            dragenter: "drag",
            dragleave: "drag",
            dragover: "drag",
            drop: "drag",
            keydown: "press",
            keyup: "press",
            keypress: "press",
            input: "press"
        },
        tl = e => {
            let {
                metric: t
            } = e;
            if (void 0 == t.value) return;
            let n = e9(t.value);
            if (n > 60) return;
            let r = t.entries.find(e => e.duration === t.value && ta[e.name]);
            if (!r) return;
            let {
                interactionId: a
            } = r, l = ta[r.name], o = e9((0, E.D)() + r.startTime), i = (0, w.j)(), u = i ? (0, w.e)(i) : void 0, s = null != a ? tn.get(a) : void 0, c = (null == s ? void 0 : s.span) || u, d = c ? (0, w.l)(c).description : (0, m.d)().getScopeData().transactionName, f = e8({
                name: (null == s ? void 0 : s.elementName) || (0, A.I)(r.target),
                transaction: d,
                attributes: {
                    [v.u]: "auto.http.browser.inp",
                    [v.o]: "ui.interaction.".concat(l),
                    [v._]: r.duration
                },
                startTime: o
            });
            f && (f.addEvent("inp", {
                [v.B]: "millisecond",
                [v.x]: t.value
            }), f.end(o + n))
        };
    var to = e.i(624695),
        ti = e.i(182133),
        tu = e.i(53341);

    function ts(e) {
        return null != e && e > 0 && e <= 6e4
    }

    function tc(e) {
        return e ? (((0, E.D)() || performance.timeOrigin) + e) / 1e3 : e
    }

    function td(e) {
        var t;
        let n = {};
        if (void 0 != e.nextHopProtocol) {
            let {
                name: t,
                version: r
            } = function(e) {
                let t = "unknown",
                    n = "unknown",
                    r = "";
                for (let a of e) {
                    if ("/" === a) {
                        [t, n] = e.split("/");
                        break
                    }
                    if (!isNaN(Number(a))) {
                        t = "h" === r ? "http" : r, n = e.split(r)[1];
                        break
                    }
                    r += a
                }
                return r === e && (t = r), {
                    name: t,
                    version: n
                }
            }(e.nextHopProtocol);
            n["network.protocol.version"] = r, n["network.protocol.name"] = t
        }
        return (0, E.D)() || (null == (t = e5()) ? void 0 : t.timeOrigin) ? Object.fromEntries(Object.entries({
            ...n,
            "http.request.redirect_start": tc(e.redirectStart),
            "http.request.redirect_end": tc(e.redirectEnd),
            "http.request.worker_start": tc(e.workerStart),
            "http.request.fetch_start": tc(e.fetchStart),
            "http.request.domain_lookup_start": tc(e.domainLookupStart),
            "http.request.domain_lookup_end": tc(e.domainLookupEnd),
            "http.request.connect_start": tc(e.connectStart),
            "http.request.secure_connection_start": tc(e.secureConnectionStart),
            "http.request.connection_end": tc(e.connectEnd),
            "http.request.request_start": tc(e.requestStart),
            "http.request.response_start": tc(e.responseStart),
            "http.request.response_end": tc(e.responseEnd),
            "http.request.time_to_first_byte": null != e.responseStart ? e.responseStart / 1e3 : void 0
        }).filter(e => {
            let [, t] = e;
            return null != t
        })) : n
    }
    let tf = 0,
        tp = {};

    function th(e, t, n, r) {
        var a;
        let l = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : n,
            o = t["secureConnection" === (a = n) ? "connectEnd" : "fetch" === a ? "domainLookupStart" : "".concat(a, "End")],
            i = t["".concat(n, "Start")];
        i && o && e6(e, r + e9(i), r + e9(o), {
            op: "browser.".concat(l),
            name: t.name,
            attributes: {
                [v.u]: "auto.ui.browser.metrics",
                ..."redirect" === n && null != t.redirectCount ? {
                    "http.redirect_count": t.redirectCount
                } : {}
            }
        })
    }

    function tm(e) {
        var t, n;
        let {
            name: r,
            op: a,
            origin: l,
            metricName: o,
            value: i,
            attributes: u,
            parentSpan: s,
            reportEvent: c,
            startTime: d,
            endTime: f
        } = e, p = (0, m.d)().getScopeData().transactionName, h = {
            [v.u]: l,
            [v.o]: a,
            [v._]: 0,
            ["browser.web_vital.".concat(o, ".value")]: i,
            "sentry.transaction": p,
            "user_agent.original": null == (t = er.navigator) ? void 0 : t.userAgent,
            ...u
        };
        s && (null == (n = (0, w.Z)(s).attributes) ? void 0 : n[v.o]) === "pageload" && (h["sentry.pageload.span_id"] = s.spanContext().spanId), c && (h["browser.web_vital.".concat(o, ".report_event")] = c);
        let g = (0, C.e)({
            name: r,
            attributes: h,
            startTime: d,
            parentSpan: s
        });
        g && g.end(null != f ? f : d)
    }
    var tg = e.i(571582),
        tv = e.i(377563);
    let ty = "sentry_previous_trace";

    function tb(e) {
        return 1 === e.traceFlags
    }

    function t_(e, t) {
        let n = "fetch",
            r = B(n, e);
        return H(n, () => tS(void 0, t)), r
    }

    function tS(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        (!t || function() {
            if ("string" == typeof EdgeRuntime) return !0;
            if (! function() {
                    if (!("fetch" in et)) return !1;
                    try {
                        return new Headers, new Request("data:,"), new Response, !0
                    } catch (e) {
                        return !1
                    }
                }()) return !1;
            if (en(et.fetch)) return !0;
            let e = !1,
                t = et.document;
            if (t && "function" == typeof t.createElement) try {
                var n;
                let r = t.createElement("iframe");
                r.hidden = !0, t.head.appendChild(r), (null == (n = r.contentWindow) ? void 0 : n.fetch) && (e = en(r.contentWindow.fetch)), t.head.removeChild(r)
            } catch (e) {
                g.f && y.h.warn("Could not create sandbox iframe for pure fetch check, bailing to window.fetch: ", e)
            }
            return e
        }()) && (0, ee.Q)(z.f, "fetch", function(t) {
            return function() {
                for (var n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                let l = Error(),
                    {
                        method: o,
                        url: i
                    } = function(e) {
                        if (0 === e.length) return {
                            method: "GET",
                            url: ""
                        };
                        if (2 === e.length) {
                            let [t, n] = e;
                            return {
                                url: tx(t),
                                method: tk(n, "method") ? String(n.method).toUpperCase() : (0, tu.G)(t) && tk(t, "method") ? String(t.method).toUpperCase() : "GET"
                            }
                        }
                        let t = e[0];
                        return {
                            url: tx(t),
                            method: tk(t, "method") ? String(t.method).toUpperCase() : "GET"
                        }
                    }(r),
                    u = {
                        args: r,
                        fetchData: {
                            method: o,
                            url: i
                        },
                        startTimestamp: 1e3 * (0, E.R)(),
                        virtualError: l,
                        headers: function(e) {
                            let [t, n] = e;
                            try {
                                if ("object" == typeof n && null !== n && "headers" in n && n.headers) return new Headers(n.headers);
                                if ((0, tu.G)(t)) return new Headers(t.headers)
                            } catch (e) {}
                        }(r)
                    };
                return e || q("fetch", {
                    ...u
                }), t.apply(z.f, r).then(async t => (e ? e(t) : q("fetch", {
                    ...u,
                    endTimestamp: 1e3 * (0, E.R)(),
                    response: t
                }), t), e => {
                    var t;
                    q("fetch", {
                        ...u,
                        endTimestamp: 1e3 * (0, E.R)(),
                        error: e
                    }), (0, tu.b)(e) && void 0 === e.stack && (e.stack = l.stack, (0, ee.O)(e, "framesToPop", 1));
                    let n = (0, m.l)(),
                        r = null != (t = null == n ? void 0 : n.getOptions().enhanceFetchErrorMessages) ? t : "always";
                    if (!1 !== r && e instanceof TypeError && ("Failed to fetch" === e.message || "Load failed" === e.message || "NetworkError when attempting to fetch resource." === e.message)) try {
                        let t = new URL(u.fetchData.url).host;
                        "always" === r ? e.message = "".concat(e.message, " (").concat(t, ")") : (0, ee.O)(e, "__sentry_fetch_url_host__", t)
                    } catch (e) {}
                    throw e
                })
            }
        })
    }
    async function tw(e, t) {
        if (null == e ? void 0 : e.body) {
            let n = e.body,
                r = n.getReader(),
                a = setTimeout(() => {
                    n.cancel().then(null, () => {})
                }, 9e4),
                l = !0;
            for (; l;) {
                let e;
                try {
                    e = setTimeout(() => {
                        n.cancel().then(null, () => {})
                    }, 5e3);
                    let {
                        done: a
                    } = await r.read();
                    clearTimeout(e), a && (t(), l = !1)
                } catch (e) {
                    l = !1
                } finally {
                    clearTimeout(e)
                }
            }
            clearTimeout(a), r.releaseLock(), n.cancel().then(null, () => {})
        }
    }

    function tE(e) {
        let t;
        try {
            t = e.clone()
        } catch (e) {
            return
        }
        tw(t, () => {
            q("fetch-body-resolved", {
                endTimestamp: 1e3 * (0, E.R)(),
                response: e
            })
        })
    }

    function tk(e, t) {
        return !!e && "object" == typeof e && !!e[t]
    }

    function tx(e) {
        return "string" == typeof e ? e : e ? tk(e, "url") ? e.url : e.toString ? e.toString() : "" : ""
    }
    var tT = e.i(179423),
        tP = e.i(754177),
        tC = e.i(813705),
        tN = e.i(209754);

    function tR() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            t = e.client || (0, m.l)();
        if (!(0, tN.B)() || !t) return {};
        let n = (0, tC.t)(),
            r = (0, tP.f)(n);
        if (r.getTraceData) return r.getTraceData(e);
        let a = e.scope || (0, m.d)(),
            l = e.span || (0, w.j)();
        if (!l && (0, m.K)()) return {};
        let o = l ? (0, w.N)(l) : function(e) {
                let {
                    traceId: t,
                    sampled: n,
                    propagationSpanId: r
                } = e.getPropagationContext();
                return (0, Z.J)(t, r, n)
            }(a),
            i = l ? (0, k.O)(l) : (0, k.H)(t, a),
            u = (0, tT.N)(i);
        if (!Z.v.test(o)) return y.h.warn("Invalid sentry-trace data. Cannot generate trace data"), {};
        let s = {
            "sentry-trace": o,
            baggage: u
        };
        return e.propagateTraceparent && (s.traceparent = l ? (0, w.o)(l) : function(e) {
            let {
                traceId: t,
                sampled: n,
                propagationSpanId: r
            } = e.getPropagationContext();
            return (0, Z.z)(t, r, n)
        }(a)), s
    }

    function tA(e) {
        return "string" == typeof e && e.split(",").some(e => e.trim().startsWith(tT.p))
    }

    function tL(e, t, n, r) {
        let a = {
            url: M(e),
            type: "fetch",
            "http.method": n,
            [v.u]: r,
            [v.o]: "http.client"
        };
        return t && (L(t) || (a["http.url"] = M(t.href), a["server.address"] = t.host), t.search && (a["http.query"] = t.search), t.hash && (a["http.fragment"] = t.hash)), a
    }
    let tO = "__sentry_xhr_v3__";

    function tI(e) {
        B("xhr", e), H("xhr", tD)
    }

    function tD() {
        if (!er.XMLHttpRequest) return;
        let e = XMLHttpRequest.prototype;
        e.open = new Proxy(e.open, {
            apply(e, t, n) {
                let r = Error(),
                    a = 1e3 * (0, E.R)(),
                    l = (0, tu.Z)(n[0]) ? n[0].toUpperCase() : void 0,
                    o = function(e) {
                        if ((0, tu.Z)(e)) return e;
                        try {
                            return e.toString()
                        } catch (e) {}
                    }(n[1]);
                if (!l || !o) return e.apply(t, n);
                t[tO] = {
                    method: l,
                    url: o,
                    request_headers: {}
                }, "POST" === l && o.match(/sentry_key/) && (t.__sentry_own_request__ = !0);
                let i = () => {
                    let e = t[tO];
                    if (e && 4 === t.readyState) {
                        try {
                            e.status_code = t.status
                        } catch (e) {}
                        q("xhr", {
                            endTimestamp: 1e3 * (0, E.R)(),
                            startTimestamp: a,
                            xhr: t,
                            virtualError: r
                        })
                    }
                };
                return "onreadystatechange" in t && "function" == typeof t.onreadystatechange ? t.onreadystatechange = new Proxy(t.onreadystatechange, {
                    apply: (e, t, n) => (i(), e.apply(t, n))
                }) : t.addEventListener("readystatechange", i), t.setRequestHeader = new Proxy(t.setRequestHeader, {
                    apply(e, t, n) {
                        let [r, a] = n, l = t[tO];
                        return l && (0, tu.Z)(r) && (0, tu.Z)(a) && (l.request_headers[r.toLowerCase()] = a), e.apply(t, n)
                    }
                }), e.apply(t, n)
            }
        }), e.send = new Proxy(e.send, {
            apply(e, t, n) {
                let r = t[tO];
                return r && (void 0 !== n[0] && (r.body = n[0]), q("xhr", {
                    startTimestamp: 1e3 * (0, E.R)(),
                    xhr: t
                })), e.apply(t, n)
            }
        })
    }

    function tM(e) {
        try {
            return new URL(e, tv.b.location.origin).href
        } catch (e) {
            return
        }
    }

    function tz(e) {
        try {
            return new Headers(e)
        } catch (e) {
            return
        }
    }
    Symbol.for("sentry__originalRequestBody");
    let tF = new WeakMap,
        tj = new Map,
        tU = {
            traceFetch: !0,
            traceXHR: !0,
            enableHTTPTimings: !0,
            trackFetchStreamPerformance: !1
        };

    function tB(e, t) {
        let {
            url: n
        } = (0, w.l)(e).data;
        if (!n || "string" != typeof n) return;
        let r = () => void setTimeout(a);
        if ((0, K.f)(t)) {
            let t = e.end.bind(e);
            e.end = e => {
                let n = null != e ? e : (0, E.R)(),
                    l = !1,
                    o = () => {
                        l || (l = !0, setTimeout(a), t(n), clearTimeout(i))
                    };
                r = o;
                let i = setTimeout(o, 300)
            }
        }
        let a = eY("resource", t => {
            let {
                entries: a
            } = t;
            a.forEach(t => {
                "resource" === t.entryType && "initiatorType" in t && "string" == typeof t.nextHopProtocol && ("fetch" === t.initiatorType || "xmlhttprequest" === t.initiatorType) && t.name.endsWith(n) && (e.setAttributes(td(t)), r())
            })
        })
    }
    let tH = /Googlebot|Google-InspectionTool|Storebot-Google|Bingbot|Slurp|DuckDuckBot|Baiduspider|YandexBot|Facebot|facebookexternalhit|LinkedInBot|Twitterbot|Applebot/i;

    function tq() {
        let e = tv.b.navigator;
        return !!(null == e ? void 0 : e.userAgent) && tH.test(e.userAgent)
    }
    let tW = {
            ...N,
            instrumentNavigation: !0,
            instrumentPageLoad: !0,
            markBackgroundSpan: !0,
            enableLongTask: !0,
            enableLongAnimationFrame: !0,
            enableInp: !0,
            ignoreResourceSpans: [],
            ignorePerformanceApiSpans: [],
            detectRedirects: !0,
            linkPreviousTrace: "in-memory",
            consistentTraceSampling: !1,
            enableReportPageLoaded: !1,
            _experiments: {},
            ...tU
        },
        t$ = function() {
            let e, t, n, r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
            "enableElementTiming" in r && (0, y.D)(() => {
                console.warn("[Sentry] `enableElementTiming` is deprecated and no longer has any effect. Use the standalone `elementTimingIntegration` instead.")
            });
            let a = {
                    name: void 0,
                    source: void 0
                },
                o = tv.b.document,
                {
                    enableInp: s,
                    enableLongTask: c,
                    enableLongAnimationFrame: d,
                    _experiments: {
                        enableInteractions: f,
                        enableStandaloneClsSpans: p,
                        enableStandaloneLcpSpans: h
                    },
                    beforeStartSpan: _,
                    idleTimeout: S,
                    finalTimeout: T,
                    childSpanTimeout: N,
                    markBackgroundSpan: F,
                    traceFetch: j,
                    traceXHR: U,
                    trackFetchStreamPerformance: q,
                    shouldCreateSpanForRequest: W,
                    enableHTTPTimings: V,
                    ignoreResourceSpans: Q,
                    ignorePerformanceApiSpans: Y,
                    instrumentPageLoad: et,
                    instrumentNavigation: en,
                    detectRedirects: el,
                    linkPreviousTrace: eu,
                    consistentTraceSampling: ed,
                    enableReportPageLoaded: ef,
                    onRequestSpanStart: ep,
                    onRequestSpanEnd: eh
                } = {
                    ...tW,
                    ...r
                },
                em = tq();

            function ev(t, r) {
                var l, s;
                let c = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2],
                    d = "pageload" === r.op,
                    f = r.name,
                    g = _ ? _(r) : r,
                    b = g.attributes || {};
                if (f !== g.name && (b[v.U] = "custom", g.attributes = b), !c) {
                    let e = (0, E.i)();
                    (0, C.e)({
                        ...g,
                        startTime: e
                    }).end(e);
                    return
                }
                a.name = g.name, a.source = b[v.U];
                let x = R(g, {
                    idleTimeout: S,
                    finalTimeout: T,
                    childSpanTimeout: N,
                    disableAutoFinish: d,
                    beforeSpanEnd: r => {
                        var a, l;
                        null == e || e();
                        let o = (0, K.f)(t);
                        ! function(e, t) {
                            let n = e5(),
                                r = (0, E.D)();
                            if (!(null == n ? void 0 : n.getEntries) || !r) return;
                            let {
                                spanStreamingEnabled: a,
                                ignorePerformanceApiSpans: l,
                                ignoreResourceSpans: o,
                                recordClsOnPageloadSpan: s,
                                recordLcpOnPageloadSpan: c
                            } = t, d = e9(r), f = n.getEntries(), {
                                op: p,
                                start_timestamp: h
                            } = (0, w.l)(e);
                            if (f.slice(tf).forEach(t => {
                                    let n = e9(t.startTime),
                                        r = e9(Math.max(0, t.duration));
                                    if ("navigation" !== p || !h || !(d + n < h)) switch (t.entryType) {
                                        case "navigation":
                                            var a, i, u, s, c, f;
                                            let m, g, y;
                                            a = e, i = t, u = d, ["unloadEvent", "redirect", "domContentLoadedEvent", "loadEvent", "connect"].forEach(e => {
                                                th(a, i, e, u)
                                            }), th(a, i, "secureConnection", u, "TLS/SSL"), th(a, i, "fetch", u, "cache"), th(a, i, "domainLookup", u, "DNS"), s = a, c = i, m = (f = u) + e9(c.requestStart), g = f + e9(c.responseEnd), y = f + e9(c.responseStart), c.responseEnd && (e6(s, m, g, {
                                                op: "browser.request",
                                                name: c.name,
                                                attributes: {
                                                    [v.u]: "auto.ui.browser.metrics"
                                                }
                                            }), e6(s, y, g, {
                                                op: "browser.response",
                                                name: c.name,
                                                attributes: {
                                                    [v.u]: "auto.ui.browser.metrics"
                                                }
                                            }));
                                            break;
                                        case "mark":
                                        case "paint":
                                        case "measure": {
                                            ! function(e, t, n, r, a, l) {
                                                if (function(e) {
                                                        if ((null == e ? void 0 : e.entryType) === "measure") try {
                                                            return "Components ⚛" === e.detail.devtools.track
                                                        } catch (e) {
                                                            return
                                                        }
                                                    }(t) || ["mark", "measure"].includes(t.entryType) && (0, ti.$)(t.name, l)) return;
                                                let o = es(!1),
                                                    i = a + Math.max(n, e9(o ? o.requestStart : 0)),
                                                    u = a + n,
                                                    s = u + r,
                                                    c = {
                                                        [v.u]: "auto.resource.browser.metrics"
                                                    };
                                                i !== u && (c["sentry.browser.measure_happened_before_request"] = !0, c["sentry.browser.measure_start_time"] = i),
                                                    function(e, t) {
                                                        try {
                                                            let n = t.detail;
                                                            if (!n) return;
                                                            if ("object" == typeof n) {
                                                                for (let [t, r] of Object.entries(n))
                                                                    if (r && (0, tu.n)(r)) e["sentry.browser.measure.detail.".concat(t)] = r;
                                                                    else if (void 0 !== r) try {
                                                                    e["sentry.browser.measure.detail.".concat(t)] = JSON.stringify(r)
                                                                } catch (e) {}
                                                                return
                                                            }
                                                            if ((0, tu.n)(n)) {
                                                                e["sentry.browser.measure.detail"] = n;
                                                                return
                                                            }
                                                            try {
                                                                e["sentry.browser.measure.detail"] = JSON.stringify(n)
                                                            } catch (e) {}
                                                        } catch (e) {}
                                                    }(c, t), i <= s && e6(e, i, s, {
                                                        name: t.name,
                                                        op: t.entryType,
                                                        attributes: c
                                                    })
                                            }(e, t, n, r, d, l);
                                            let a = eg(),
                                                o = t.startTime < a.firstHiddenTime;
                                            "first-paint" === t.name && o && (tp.fp = {
                                                value: t.startTime,
                                                unit: "millisecond"
                                            }), "first-contentful-paint" === t.name && o && (tp.fcp = {
                                                value: t.startTime,
                                                unit: "millisecond"
                                            });
                                            break
                                        }
                                        case "resource":
                                            ! function(e, t, n, r, a, l, o) {
                                                var i, u;
                                                if ("xmlhttprequest" === t.initiatorType || "fetch" === t.initiatorType) return;
                                                let s = t.initiatorType ? "resource.".concat(t.initiatorType) : "resource.other";
                                                if (null == o ? void 0 : o.includes(s)) return;
                                                let c = {
                                                        [v.u]: "auto.resource.browser.metrics"
                                                    },
                                                    d = I(n);
                                                d.protocol && (c["url.scheme"] = d.protocol.split(":").pop()), d.host && (c["server.address"] = d.host), c["url.same_origin"] = n.includes(er.location.origin), i = t, u = c, [
                                                    ["responseStatus", "http.response.status_code"],
                                                    ["transferSize", "http.response_transfer_size"],
                                                    ["encodedBodySize", "http.response_content_length"],
                                                    ["decodedBodySize", "http.decoded_response_content_length"],
                                                    ["renderBlockingStatus", "resource.render_blocking_status"],
                                                    ["deliveryType", "http.response_delivery_type"]
                                                ].forEach(e => {
                                                    let [t, n] = e, r = i[t];
                                                    null != r && ("number" == typeof r && r < 0x7fffffff || "string" == typeof r) && (u[n] = r)
                                                });
                                                let f = {
                                                        ...c,
                                                        ...td(t)
                                                    },
                                                    p = l + r;
                                                e6(e, p, p + a, {
                                                    name: n.replace(er.location.origin, ""),
                                                    op: s,
                                                    attributes: f
                                                })
                                            }(e, t, t.name, n, r, d, o)
                                    }
                                }), tf = Math.max(f.length - 1, 0), function(e, t) {
                                    let n = er.navigator;
                                    if (!n) return;
                                    let r = n.connection;
                                    r && (r.effectiveType && e.setAttribute(t ? "network.connection.effective_type" : "effectiveConnectionType", r.effectiveType), r.type && e.setAttribute(t ? "network.connection.type" : "connectionType", r.type), e4(r.rtt) && (tp["connection.rtt"] = {
                                        value: r.rtt,
                                        unit: "millisecond"
                                    }, t && e.setAttribute("network.connection.rtt", r.rtt))), e4(n.deviceMemory) && (t ? e.setAttribute("device.memory.estimated_capacity", n.deviceMemory) : e.setAttribute("deviceMemory", "".concat(n.deviceMemory, " GB"))), e4(n.hardwareConcurrency) && (t ? e.setAttribute("device.processor_count", n.hardwareConcurrency) : e.setAttribute("hardwareConcurrency", String(n.hardwareConcurrency)))
                                }(e, a), "pageload" === p) {
                                if (function(e) {
                                        let t = es(!1);
                                        if (!t) return;
                                        let {
                                            responseStart: n,
                                            requestStart: r
                                        } = t;
                                        r <= n && (e["ttfb.requestTime"] = {
                                            value: n - r,
                                            unit: "millisecond"
                                        })
                                    }(tp), a) {
                                    let t = (t, n, r) => {
                                        let a = null != r ? r : "browser.web_vital.".concat(t, ".value");
                                        e.setAttribute(a, n), ei && y.h.log("Setting web vital attribute", {
                                            [a]: n
                                        }, "on pageload span")
                                    };
                                    ["ttfb", "fp", "fcp"].forEach(e => {
                                        tp[e] && t(e, tp[e].value)
                                    }), tp["ttfb.requestTime"] && t("ttfb.requestTime", tp["ttfb.requestTime"].value, "browser.web_vital.ttfb.request_time")
                                } else {
                                    var m, g;
                                    s || delete tp.cls, c || delete tp.lcp, Object.entries(tp).forEach(e => {
                                        let [t, n] = e;
                                        (0, to.Y)(t, n.value, n.unit)
                                    }), m = e, g = t, i && g.recordLcpOnPageloadSpan && (i.element && m.setAttribute("lcp.element", (0, A.I)(i.element)), i.id && m.setAttribute("lcp.id", i.id), i.url && m.setAttribute("lcp.url", i.url.trim().slice(0, 200)), null != i.loadTime && m.setAttribute("lcp.loadTime", i.loadTime), null != i.renderTime && m.setAttribute("lcp.renderTime", i.renderTime), m.setAttribute("lcp.size", i.size)), (null == u ? void 0 : u.sources) && g.recordClsOnPageloadSpan && u.sources.forEach((e, t) => m.setAttribute("cls.source.".concat(t + 1), (0, A.I)(e.node)))
                                }
                                e.setAttribute(a ? "browser.performance.time_origin" : "performance.timeOrigin", d), e.setAttribute(a ? "browser.performance.navigation.activation_start" : "performance.activationStart", ec())
                            }
                            i = void 0, u = void 0, tp = {}
                        }(r, {
                            recordClsOnPageloadSpan: !o && !p,
                            recordLcpOnPageloadSpan: !o && !h,
                            ignoreResourceSpans: Q,
                            ignorePerformanceApiSpans: Y,
                            spanStreamingEnabled: o
                        }), a = t, l = void 0, (0, ee.O)(a, tX, l);
                        let s = (0, m.d)(),
                            c = s.getPropagationContext();
                        s.setPropagationContext({
                            ...c,
                            traceId: x.spanContext().traceId,
                            sampled: (0, w.S)(x),
                            dsc: (0, k.O)(r)
                        }), d && (n = void 0)
                    },
                    trimIdleSpanEndTimestamp: !ef
                });

                function P() {
                    o && ["interactive", "complete"].includes(o.readyState) && t.emit("idleSpanEnableAutoFinish", x)
                }
                d && ef && (n = x), l = t, s = x, (0, ee.O)(l, tX, s), d && !ef && o && (o.addEventListener("readystatechange", () => {
                    P()
                }), P())
            }
            return {
                name: "BrowserTracing",
                setup(r) {
                    var a;
                    if (em) {
                        tg.f && y.h.log("[Tracing] Skipping browserTracingIntegration setup for bot user agent.");
                        return
                    }

                    function _() {
                        let e = (0, w.j)(),
                            t = e && (0, w.e)(e);
                        if (t) {
                            let e = "internal_error";
                            g.f && y.h.log("[Tracing] Root span: ".concat(e, " -> Global error occurred")), t.setStatus({
                                code: P.r,
                                message: e
                            })
                        }
                    }
                    X || (_.tag = "sentry_tracingErrorCallback", X = !0, $(_), G(_));
                    let S = (0, K.f)(r);
                    if (e = function(e) {
                            let {
                                recordClsStandaloneSpans: t,
                                recordLcpStandaloneSpans: n,
                                client: r
                            } = e, a = e5();
                            if (a && (0, E.D)()) {
                                a.mark && er.performance.mark("sentry-tracing-init");
                                let e = n ? function(e) {
                                        let t, n = 0;
                                        if (!e7("largest-contentful-paint")) return;
                                        let r = eQ(e => {
                                            let {
                                                metric: r
                                            } = e, a = r.entries[r.entries.length - 1];
                                            a && ts(r.value) && (n = r.value, t = a)
                                        }, !0);
                                        te(e, (e, a) => {
                                            (function(e, t, n, r) {
                                                if (!ts(e)) return;
                                                ei && y.h.log("Sending LCP span (".concat(e, ")"));
                                                let a = e9(((0, E.D)() || 0) + ((null == t ? void 0 : t.startTime) || 0)),
                                                    l = (0, m.d)().getScopeData().transactionName,
                                                    o = t ? (0, A.I)(t.element) : "Largest contentful paint",
                                                    i = {
                                                        [v.u]: "auto.http.browser.lcp",
                                                        [v.o]: "ui.webvital.lcp",
                                                        [v._]: 0,
                                                        "sentry.pageload.span_id": n,
                                                        "sentry.report_event": r
                                                    };
                                                t && (t.element && (i["lcp.element"] = (0, A.I)(t.element)), t.id && (i["lcp.id"] = t.id), t.url && (i["lcp.url"] = t.url), null != t.loadTime && (i["lcp.loadTime"] = t.loadTime), null != t.renderTime && (i["lcp.renderTime"] = t.renderTime), null != t.size && (i["lcp.size"] = t.size));
                                                let u = e8({
                                                    name: o,
                                                    transaction: l,
                                                    attributes: i,
                                                    startTime: a
                                                });
                                                u && (u.addEvent("lcp", {
                                                    [v.B]: "millisecond",
                                                    [v.x]: e
                                                }), u.end(a))
                                            })(n, t, a, e), r()
                                        })
                                    }(r) : !1 === n ? eQ(e => {
                                        let {
                                            metric: t
                                        } = e, n = t.entries[t.entries.length - 1];
                                        n && ts(t.value) && (tp.lcp = {
                                            value: t.value,
                                            unit: "millisecond"
                                        }, i = n)
                                    }, !0) : void 0,
                                    o = t ? function(e) {
                                        let t, n = 0;
                                        if (!e7("layout-shift")) return;
                                        let r = eV(e => {
                                            let {
                                                metric: r
                                            } = e, a = r.entries[r.entries.length - 1];
                                            a && (n = r.value, t = a)
                                        }, !0);
                                        te(e, (e, a) => {
                                            var l, o, i, u, s;
                                            let c, d, f, p, h;
                                            l = n, o = t, i = a, u = e, ei && y.h.log("Sending CLS span (".concat(l, ")")), c = o ? e9(((0, E.D)() || 0) + o.startTime) : (0, E.R)(), d = (0, m.d)().getScopeData().transactionName, f = o ? (0, A.I)(null == (s = o.sources[0]) ? void 0 : s.node) : "Layout shift", p = {
                                                [v.u]: "auto.http.browser.cls",
                                                [v.o]: "ui.webvital.cls",
                                                [v._]: 0,
                                                "sentry.pageload.span_id": i,
                                                "sentry.report_event": u
                                            }, (null == o ? void 0 : o.sources) && o.sources.forEach((e, t) => {
                                                p["cls.source.".concat(t + 1)] = (0, A.I)(e.node)
                                            }), (h = e8({
                                                name: f,
                                                transaction: d,
                                                attributes: p,
                                                startTime: c
                                            })) && (h.addEvent("cls", {
                                                [v.B]: "",
                                                [v.x]: l
                                            }), h.end(c)), r()
                                        })
                                    }(r) : !1 === t ? eV(e => {
                                        let {
                                            metric: t
                                        } = e, n = t.entries[t.entries.length - 1];
                                        n && (tp.cls = {
                                            value: t.value,
                                            unit: ""
                                        }, u = n)
                                    }, !0) : void 0,
                                    s = e1("ttfb", e => {
                                        let {
                                            metric: t
                                        } = e;
                                        t.entries[t.entries.length - 1] && (tp.ttfb = {
                                            value: t.value,
                                            unit: "millisecond"
                                        })
                                    }, eZ, l);
                                return () => {
                                    s(), null == e || e(), null == o || o()
                                }
                            }
                            return () => void 0
                        }({
                            recordClsStandaloneSpans: S ? void 0 : p || !1,
                            recordLcpStandaloneSpans: S ? void 0 : h || !1,
                            client: r
                        }), S ? (! function(e) {
                            let t, n = 0;
                            if (!e7("largest-contentful-paint")) return;
                            let r = eQ(e => {
                                let {
                                    metric: r
                                } = e, a = r.entries[r.entries.length - 1];
                                a && ts(r.value) && (n = r.value, t = a)
                            }, !0);
                            te(e, (e, a, l) => {
                                (function(e, t, n, r) {
                                    if (!ts(e)) return;
                                    ei && y.h.log("Sending LCP span (".concat(e, ")"));
                                    let a = (0, E.D)() || 0,
                                        l = e9(a),
                                        o = e9(a + ((null == t ? void 0 : t.startTime) || 0)),
                                        i = t ? (0, A.I)(t.element) : "Largest contentful paint",
                                        u = {};
                                    (null == t ? void 0 : t.element) && (u["browser.web_vital.lcp.element"] = (0, A.I)(t.element)), (null == t ? void 0 : t.id) && (u["browser.web_vital.lcp.id"] = t.id), (null == t ? void 0 : t.url) && (u["browser.web_vital.lcp.url"] = t.url), (null == t ? void 0 : t.loadTime) != null && (u["browser.web_vital.lcp.load_time"] = t.loadTime), (null == t ? void 0 : t.renderTime) != null && (u["browser.web_vital.lcp.render_time"] = t.renderTime), (null == t ? void 0 : t.size) != null && (u["browser.web_vital.lcp.size"] = t.size), tm({
                                        name: i,
                                        op: "ui.webvital.lcp",
                                        origin: "auto.http.browser.lcp",
                                        metricName: "lcp",
                                        value: e,
                                        attributes: u,
                                        parentSpan: n,
                                        reportEvent: r,
                                        startTime: l,
                                        endTime: o
                                    })
                                })(n, t, l, e), r()
                            })
                        }(r), ! function(e) {
                            let t, n = 0;
                            if (!e7("layout-shift")) return;
                            let r = eV(e => {
                                let {
                                    metric: r
                                } = e, a = r.entries[r.entries.length - 1];
                                a && (n = r.value, t = a)
                            }, !0);
                            te(e, (e, a, l) => {
                                var o, i, u, s, c;
                                let d, f, p;
                                o = n, i = t, u = l, s = e, ei && y.h.log("Sending CLS span (".concat(o, ")")), d = i ? e9(((0, E.D)() || 0) + i.startTime) : (0, E.R)(), f = i ? (0, A.I)(null == (c = i.sources[0]) ? void 0 : c.node) : "Layout shift", p = {}, (null == i ? void 0 : i.sources) && i.sources.forEach((e, t) => {
                                    p["browser.web_vital.cls.source.".concat(t + 1)] = (0, A.I)(e.node)
                                }), tm({
                                    name: f,
                                    op: "ui.webvital.cls",
                                    origin: "auto.http.browser.cls",
                                    metricName: "cls",
                                    value: o,
                                    attributes: p,
                                    parentSpan: u,
                                    reportEvent: s,
                                    startTime: d
                                }), r()
                            })
                        }(r), s && e5() && (0, E.D)() && eG(e => {
                            var t, n, r;
                            let a, l, o, i, u, s, c, d, {
                                metric: f
                            } = e;
                            if (null == f.value || e9(f.value) > 60) return;
                            let p = f.entries.find(e => e.duration === f.value && ta[e.name]);
                            p && (t = f.value, n = p, ei && y.h.log("Sending INP span (".concat(t, ")")), a = e9((0, E.D)() + n.startTime), l = e9(t), o = ta[n.name], i = null != (r = n.interactionId) ? tn.get(r) : void 0, s = (u = (0, w.j)()) ? (0, w.e)(u) : void 0, d = (c = (null == i ? void 0 : i.span) || s) ? (0, w.Z)(c).name : (0, m.d)().getScopeData().transactionName, tm({
                                name: (null == i ? void 0 : i.elementName) || (0, A.I)(n.target),
                                op: "ui.interaction.".concat(o),
                                origin: "auto.http.browser.inp",
                                metricName: "inp",
                                value: t,
                                attributes: {
                                    [v._]: n.duration,
                                    "sentry.transaction": d
                                },
                                startTime: a,
                                endTime: a + l,
                                parentSpan: c
                            }))
                        })) : s && function() {
                            if (e5() && (0, E.D)()) {
                                let e = eG(tl);
                                () => {
                                    e()
                                }
                            }
                        }(), d && z.f.PerformanceObserver && (null == (a = PerformanceObserver.supportedEntryTypes) ? void 0 : a.includes("long-animation-frame")) ? new PerformanceObserver(e => {
                            let t = (0, w.j)();
                            if (t)
                                for (let n of e.getEntries()) {
                                    if (!n.scripts[0]) continue;
                                    let e = e9((0, E.D)() + n.startTime),
                                        {
                                            start_timestamp: r,
                                            op: a
                                        } = (0, w.l)(t);
                                    if ("navigation" === a && r && e < r) continue;
                                    let l = e9(n.duration),
                                        o = {
                                            [v.u]: "auto.ui.browser.metrics"
                                        },
                                        {
                                            invoker: i,
                                            invokerType: u,
                                            sourceURL: s,
                                            sourceFunctionName: c,
                                            sourceCharPosition: d
                                        } = n.scripts[0];
                                    o["browser.script.invoker"] = i, o["browser.script.invoker_type"] = u, s && (o["code.filepath"] = s), c && (o["code.function"] = c), -1 !== d && (o["browser.script.source_char_position"] = d), e6(t, e, e + l, {
                                        name: "Main UI thread blocked",
                                        op: "ui.long-animation-frame",
                                        attributes: o
                                    })
                                }
                        }).observe({
                            type: "long-animation-frame",
                            buffered: !0
                        }) : c && eY("longtask", e => {
                            let {
                                entries: t
                            } = e, n = (0, w.j)();
                            if (!n) return;
                            let {
                                op: r,
                                start_timestamp: a
                            } = (0, w.l)(n);
                            for (let e of t) {
                                let t = e9((0, E.D)() + e.startTime),
                                    l = e9(e.duration);
                                "navigation" === r && a && t < a || e6(n, t, t + l, {
                                    name: "Main UI thread blocked",
                                    op: "ui.long-task",
                                    attributes: {
                                        [v.u]: "auto.ui.browser.metrics"
                                    }
                                })
                            }
                        }), f && eY("event", e => {
                            let {
                                entries: t
                            } = e, n = (0, w.j)();
                            if (n) {
                                for (let e of t)
                                    if ("click" === e.name) {
                                        let t = e9((0, E.D)() + e.startTime),
                                            r = e9(e.duration),
                                            a = {
                                                name: (0, A.I)(e.target),
                                                op: "ui.interaction.".concat(e.name),
                                                startTime: t,
                                                attributes: {
                                                    [v.u]: "auto.ui.browser.metrics"
                                                }
                                            },
                                            l = (0, A.w)(e.target);
                                        l && (a.attributes["ui.component_name"] = l), e6(n, t, t + r, a)
                                    }
                            }
                        }), el && o) {
                        let e = () => {
                            t = (0, E.R)()
                        };
                        addEventListener("click", e, {
                            capture: !0
                        }), addEventListener("keydown", e, {
                            capture: !0,
                            passive: !0
                        })
                    }

                    function k() {
                        let e = r[tX];
                        e && !(0, w.l)(e).timestamp && (tg.f && y.h.log("[Tracing] Finishing current active span with op: ".concat((0, w.l)(e).op)), e.setAttribute(v.i, "cancelled"), e.end())
                    }
                    r.on("startNavigationSpan", (e, n) => {
                        if ((0, m.l)() !== r) return;
                        if (null == n ? void 0 : n.isRedirect) {
                            tg.f && y.h.warn("[Tracing] Detected redirect, navigation span will not be the root span, but a child span."), ev(r, {
                                op: "navigation.redirect",
                                ...e
                            }, !1);
                            return
                        }
                        t = void 0, k(), (0, m.V)().setPropagationContext({
                            traceId: (0, J.u)(),
                            sampleRand: Math.random(),
                            propagationSpanId: (0, b.f)() ? void 0 : (0, J.d)()
                        });
                        let a = (0, m.d)();
                        a.setPropagationContext({
                            traceId: (0, J.u)(),
                            sampleRand: Math.random(),
                            propagationSpanId: (0, b.f)() ? void 0 : (0, J.d)()
                        }), a.setSDKProcessingMetadata({
                            normalizedRequest: void 0
                        }), ev(r, {
                            op: "navigation",
                            ...e,
                            parentSpan: null,
                            forceTransaction: !0
                        })
                    }), r.on("startPageLoadSpan", function(e) {
                        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                        if ((0, m.l)() !== r) return;
                        k();
                        let n = t.sentryTrace || tG("sentry-trace") || tY("sentry-trace"),
                            a = t.baggage || tG("baggage") || tY("baggage"),
                            l = (0, Z.C)(n, a),
                            o = (0, m.d)();
                        o.setPropagationContext(l), (0, b.f)() || (o.getPropagationContext().propagationSpanId = (0, J.d)()), o.setSDKProcessingMetadata({
                            normalizedRequest: (0, tv.J)()
                        }), ev(r, {
                            op: "pageload",
                            ...e
                        })
                    }), r.on("endPageloadSpan", () => {
                        ef && n && (n.setAttribute(v.i, "reportPageLoaded"), n.end())
                    })
                },
                afterAllSetup(e) {
                    var n, r, l, o, i;
                    let u;
                    if (em) return;
                    let c = (0, A.s)();
                    if ("off" !== eu && function(e, t) {
                            let {
                                linkPreviousTrace: n,
                                consistentTraceSampling: r
                            } = t, a = "session-storage" === n, l = a ? function() {
                                try {
                                    var e;
                                    let t = null == (e = tv.b.sessionStorage) ? void 0 : e.getItem(ty);
                                    return JSON.parse(t)
                                } catch (e) {
                                    return
                                }
                            }() : void 0;
                            e.on("spanStart", e => {
                                if ((0, w.e)(e) !== e) return;
                                let t = (0, m.d)().getPropagationContext();
                                l = function(e, t, n) {
                                    let r = (0, w.l)(t),
                                        a = {
                                            spanContext: t.spanContext(),
                                            startTimestamp: r.start_timestamp,
                                            sampleRate: function() {
                                                try {
                                                    var e, t, a;
                                                    return null != (e = Number(null == (t = n.dsc) ? void 0 : t.sample_rate)) ? e : Number(null == (a = r.data) ? void 0 : a[v.s])
                                                } catch (e) {
                                                    return 0
                                                }
                                            }(),
                                            sampleRand: n.sampleRand
                                        };
                                    if (!e) return a;
                                    let l = e.spanContext;
                                    return l.traceId === r.trace_id ? e : (Date.now() / 1e3 - e.startTimestamp <= 3600 && (tg.f && y.h.log("Adding previous_trace `".concat(JSON.stringify(l), "` link to span `").concat(JSON.stringify({
                                        op: r.op,
                                        ...t.spanContext()
                                    }), "`")), t.addLink({
                                        context: l,
                                        attributes: {
                                            [v.S]: "previous_trace"
                                        }
                                    }), t.setAttribute("sentry.previous_trace", "".concat(l.traceId, "-").concat(l.spanId, "-").concat(+!!tb(l)))), a)
                                }(l, e, t), a && function(e) {
                                    try {
                                        tv.b.sessionStorage.setItem(ty, JSON.stringify(e))
                                    } catch (e) {
                                        tg.f && y.h.warn("Could not store previous trace in sessionStorage", e)
                                    }
                                }(l)
                            });
                            let o = !0;
                            r && e.on("beforeSampling", e => {
                                if (!l) return;
                                let t = (0, m.d)(),
                                    n = t.getPropagationContext();
                                if (o && n.parentSpanId) {
                                    o = !1;
                                    return
                                }
                                t.setPropagationContext({
                                    ...n,
                                    dsc: {
                                        ...n.dsc,
                                        sample_rate: String(l.sampleRate),
                                        sampled: String(tb(l.spanContext))
                                    },
                                    sampleRand: l.sampleRand
                                }), e.parentSampled = tb(l.spanContext), e.parentSampleRate = l.sampleRate, e.spanAttributes = {
                                    ...e.spanAttributes,
                                    [v.t]: l.sampleRate
                                }
                            })
                        }(e, {
                            linkPreviousTrace: eu,
                            consistentTraceSampling: ed
                        }), tv.b.location) {
                        if (et) {
                            let t = (0, E.D)();
                            tV(e, {
                                name: tv.b.location.pathname,
                                startTime: t ? t / 1e3 : void 0,
                                attributes: {
                                    [v.U]: "url",
                                    [v.u]: "auto.pageload.browser"
                                }
                            })
                        }
                        en && ea(n => {
                            var r, a;
                            let l, o, {
                                to: i,
                                from: u
                            } = n;
                            if (void 0 === u && (null == c ? void 0 : c.indexOf(i)) !== -1) {
                                c = void 0;
                                return
                            }
                            c = void 0;
                            let s = O(i),
                                d = e[tX],
                                f = d && el && (r = d, a = t, l = (0, w.l)(r), !((o = (0, E.i)()) - l.start_timestamp > 1.5) && (!a || !(o - a <= 1.5)));
                            tQ(e, {
                                name: (null == s ? void 0 : s.pathname) || tv.b.location.pathname,
                                attributes: {
                                    [v.U]: "url",
                                    [v.u]: "auto.navigation.browser"
                                }
                            }, {
                                url: i,
                                isRedirect: f
                            })
                        })
                    }
                    F && (tv.b.document ? tv.b.document.addEventListener("visibilitychange", () => {
                            let e = (0, w.j)();
                            if (!e) return;
                            let t = (0, w.e)(e);
                            if (tv.b.document.hidden && t) {
                                let e = "cancelled",
                                    {
                                        op: n,
                                        status: r
                                    } = (0, w.l)(t);
                                tg.f && y.h.log("[Tracing] Transaction: ".concat(e, " -> since tab moved to the background, op: ").concat(n)), r || t.setStatus({
                                    code: P.r,
                                    message: e
                                }), t.setAttribute("sentry.cancellation_reason", "document.hidden"), t.end()
                            }
                        }) : tg.f && y.h.warn("[Tracing] Could not set up background tab detection due to lack of global document")), f && (n = e, r = S, l = T, o = N, i = a, tv.b.document && addEventListener("click", () => {
                            let e = "ui.action.click",
                                t = function(e) {
                                    return e[tX]
                                }(n);
                            if (t && ["navigation", "pageload"].includes((0, w.l)(t).op)) {
                                tg.f && y.h.warn("[Tracing] Did not create ".concat(e, " span because a pageload or navigation span is in progress."));
                                return
                            }
                            if (u && (u.setAttribute(v.i, "interactionInterrupted"), u.end(), u = void 0), !i.name) {
                                tg.f && y.h.warn("[Tracing] Did not create ".concat(e, " transaction because _latestRouteName is missing."));
                                return
                            }
                            u = R({
                                name: i.name,
                                op: e,
                                attributes: {
                                    [v.U]: i.source || "url"
                                }
                            }, {
                                idleTimeout: r,
                                finalTimeout: l,
                                childSpanTimeout: o
                            })
                        }, {
                            capture: !0
                        })), s && function() {
                            let e = Object.keys(ta);

                            function t(e) {
                                let t = e.target;
                                if (!t) return;
                                let n = (0, A.I)(t),
                                    r = Math.round(e.timeStamp);
                                if (tr.set(r, n), tr.size > 50) {
                                    let e = tr.keys().next().value;
                                    void 0 !== e && tr.delete(e)
                                }
                            }
                            eo() && e.forEach(e => {
                                er.addEventListener(e, t, {
                                    capture: !0,
                                    passive: !0
                                })
                            });
                            let n = e => {
                                let {
                                    entries: t
                                } = e, n = (0, w.j)(), r = n && (0, w.e)(n);
                                t.forEach(e => {
                                    if (!("duration" in e)) return;
                                    let t = e.interactionId;
                                    if (null == t || tn.has(t)) return;
                                    let n = e.target ? (0, A.I)(e.target) : function(e) {
                                        let t = Math.round(e.startTime),
                                            n = tr.get(t);
                                        if (!n)
                                            for (let e = -5; e <= 5; e++) {
                                                let r = tr.get(t + e);
                                                if (r) {
                                                    n = r;
                                                    break
                                                }
                                            }
                                        return n || "<unknown>"
                                    }(e);
                                    if (tt.length > 10) {
                                        let e = tt.shift();
                                        tn.delete(e)
                                    }
                                    tt.push(t), tn.set(t, {
                                        span: r,
                                        elementName: n
                                    })
                                })
                            };
                            eY("event", n), eY("first-input", n)
                        }(),
                        function(e, t) {
                            let {
                                traceFetch: n,
                                traceXHR: r,
                                trackFetchStreamPerformance: a,
                                shouldCreateSpanForRequest: l,
                                enableHTTPTimings: o,
                                tracePropagationTargets: i,
                                onRequestSpanStart: u,
                                onRequestSpanEnd: s
                            } = {
                                ...tU,
                                ...t
                            }, c = "function" == typeof l ? l : e => !0, d = e => (function(e, t) {
                                let n = (0, A.s)();
                                if (n) {
                                    let r, a;
                                    try {
                                        r = new URL(e, n), a = new URL(n).origin
                                    } catch (e) {
                                        return !1
                                    }
                                    let l = r.origin === a;
                                    return t ? (0, ti.$)(r.toString(), t) || l && (0, ti.$)(r.pathname, t) : l
                                } {
                                    let n = !!e.match(/^\/(?!\/)/);
                                    return t ? (0, ti.$)(e, t) : n
                                }
                            })(e, i), f = {}, p = e.getOptions().propagateTraceparent;
                            if (n) {
                                let t;
                                e.addEventProcessor(e => ("transaction" === e.type && e.spans && e.spans.forEach(e => {
                                    if ("http.client" === e.op) {
                                        let t = tj.get(e.span_id);
                                        t && (e.timestamp = t / 1e3, tj.delete(e.span_id))
                                    }
                                }), e)), a && (B(t = "fetch-body-resolved", e => {
                                    if (e.response) {
                                        let t = tF.get(e.response);
                                        t && e.endTimestamp && tj.set(t, e.endTimestamp)
                                    }
                                }), H(t, () => tS(tE))), t_(t => {
                                    let n = function(e, t, n, r, a) {
                                        if (!e.fetchData) return;
                                        let {
                                            method: l,
                                            url: o
                                        } = e.fetchData, i = (0, b.f)() && t(o);
                                        if (e.endTimestamp) {
                                            var u, s, c, d;
                                            let t, n = e.fetchData.__span;
                                            if (!n) return;
                                            let l = r[n];
                                            l && (i && (function(e, t) {
                                                if (t.response) {
                                                    var n, r;
                                                    (0, P.x)(e, t.response.status);
                                                    let a = null == (r = t.response) || null == (n = r.headers) ? void 0 : n.get("content-length");
                                                    if (a) {
                                                        let t = parseInt(a);
                                                        t > 0 && e.setAttribute("http.response_content_length", t)
                                                    }
                                                } else t.error && e.setStatus({
                                                    code: P.r,
                                                    message: "internal_error"
                                                });
                                                e.end()
                                            }(l, e), u = l, s = e, null == (t = "object" == typeof(c = a) && null !== c ? c.onRequestSpanEnd : void 0) || t(u, {
                                                headers: null == (d = s.response) ? void 0 : d.headers,
                                                error: s.error
                                            })), delete r[n]);
                                            return
                                        }
                                        let {
                                            spanOrigin: f = "auto.http.browser",
                                            propagateTraceparent: p = !1
                                        } = "object" == typeof a ? a : {
                                            spanOrigin: a
                                        }, h = (0, m.l)(), g = !!(0, w.j)() || !!h && (0, K.f)(h), v = i && g ? (0, C.e)(function(e, t, n) {
                                            if (e.startsWith("data:")) {
                                                let r = M(e);
                                                return {
                                                    name: "".concat(t, " ").concat(r),
                                                    attributes: tL(e, void 0, t, n)
                                                }
                                            }
                                            let r = O(e),
                                                a = r ? function(e) {
                                                    if (L(e)) return e.pathname;
                                                    let t = new URL(e);
                                                    return t.search = "", t.hash = "", ["80", "443"].includes(t.port) && (t.port = ""), t.password && (t.password = "%filtered%"), t.username && (t.username = "%filtered%"), t.toString()
                                                }(r) : e;
                                            return {
                                                name: "".concat(t, " ").concat(a),
                                                attributes: tL(e, r, t, n)
                                            }
                                        }(o, l, f)) : new x.f;
                                        if (i && !g && (null == h || h.recordDroppedEvent("no_parent_span", "span")), e.fetchData.__span = v.spanContext().spanId, r[v.spanContext().spanId] = v, n(e.fetchData.url)) {
                                            let t = e.args[0],
                                                n = {
                                                    ...e.args[1] || {}
                                                },
                                                r = function(e, t, n, r) {
                                                    var a, l;
                                                    let o = tR({
                                                            span: n,
                                                            propagateTraceparent: r
                                                        }),
                                                        i = o["sentry-trace"],
                                                        u = o.baggage,
                                                        s = o.traceparent;
                                                    if (!i) return;
                                                    let c = t.headers || ((0, tu.G)(e) ? e.headers : void 0);
                                                    if (!c) return {
                                                        ...o
                                                    };
                                                    if (a = c, "u" > typeof Headers && (0, tu.v)(a, Headers)) {
                                                        let e = new Headers(c);
                                                        if (e.get("sentry-trace") || e.set("sentry-trace", i), r && s && !e.get("traceparent") && e.set("traceparent", s), u) {
                                                            let t = e.get("baggage");
                                                            t ? tA(t) || e.set("baggage", "".concat(t, ",").concat(u)) : e.set("baggage", u)
                                                        }
                                                        return e
                                                    }
                                                    if (Array.isArray(l = c) && l.every(e => Array.isArray(e) && 2 === e.length && "string" == typeof e[0])) {
                                                        let e = [...c];
                                                        e.find(e => "sentry-trace" === e[0]) || e.push(["sentry-trace", i]), r && s && !e.find(e => "traceparent" === e[0]) && e.push(["traceparent", s]);
                                                        let t = c.find(e => "baggage" === e[0] && "string" == typeof e[1] && tA(e[1]));
                                                        return u && !t && e.push(["baggage", u]), e
                                                    } {
                                                        let e = "sentry-trace" in c ? c["sentry-trace"] : void 0,
                                                            t = "traceparent" in c ? c.traceparent : void 0,
                                                            n = "baggage" in c ? c.baggage : void 0,
                                                            a = n ? Array.isArray(n) ? [...n] : [n] : [],
                                                            l = n && (Array.isArray(n) ? n.find(e => tA(e)) : tA(n));
                                                        u && !l && a.push(u);
                                                        let o = Object.assign({}, c, {
                                                            "sentry-trace": null != e ? e : i,
                                                            baggage: a.length > 0 ? a.join(",") : void 0
                                                        });
                                                        return r && s && !t && (o.traceparent = s), o
                                                    }
                                                }(t, n, (0, b.f)() && g ? v : void 0, p);
                                            r && (e.args[1] = n, n.headers = r)
                                        }
                                        if (h) {
                                            let t = {
                                                input: e.args,
                                                response: e.response,
                                                startTimestamp: e.startTimestamp,
                                                endTimestamp: e.endTimestamp
                                            };
                                            h.emit("beforeOutgoingRequestSpan", v, t)
                                        }
                                        return v
                                    }(t, c, d, f, {
                                        propagateTraceparent: p,
                                        onRequestSpanEnd: s
                                    });
                                    if (t.response && t.fetchData.__span && tF.set(t.response, t.fetchData.__span), n) {
                                        let r = tM(t.fetchData.url),
                                            a = r ? I(r).host : void 0;
                                        n.setAttributes({
                                            "http.url": r ? M(r) : void 0,
                                            "server.address": a
                                        }), o && tB(n, e), null == u || u(n, {
                                            headers: t.headers
                                        })
                                    }
                                })
                            }
                            r && tI(t => {
                                let n = function(e, t, n, r, a, l) {
                                    let o = e.xhr,
                                        i = null == o ? void 0 : o[tO];
                                    if (!o || o.__sentry_own_request__ || !i) return;
                                    let {
                                        url: u,
                                        method: s
                                    } = i, c = (0, b.f)() && t(u);
                                    if (e.endTimestamp) {
                                        let t = o.__sentry_xhr_span_id__;
                                        if (!t) return;
                                        let n = r[t];
                                        n && (c && void 0 !== i.status_code && ((0, P.x)(n, i.status_code), n.end(), null == l || l(n, {
                                            headers: tz(function(e) {
                                                let t;
                                                try {
                                                    t = e.getAllResponseHeaders()
                                                } catch (t) {
                                                    return ei && y.h.error(t, "Failed to get xhr response headers", e), {}
                                                }
                                                return t ? t.split("\r\n").reduce((e, t) => {
                                                    let [n, r] = t.split(": ");
                                                    return r && (e[n.toLowerCase()] = r), e
                                                }, {}) : {}
                                            }(o)),
                                            error: e.error
                                        })), delete r[t]);
                                        return
                                    }
                                    let d = tM(u),
                                        f = d ? I(d) : I(u),
                                        p = M(D(u)),
                                        h = (0, m.l)(),
                                        g = !!(0, w.j)() || !!h && (0, K.f)(h),
                                        _ = c && g ? (0, C.e)({
                                            name: "".concat(s, " ").concat(p),
                                            attributes: {
                                                url: M(u),
                                                type: "xhr",
                                                "http.method": s,
                                                "http.url": d ? M(d) : void 0,
                                                "server.address": null == f ? void 0 : f.host,
                                                [v.u]: "auto.http.browser",
                                                [v.o]: "http.client",
                                                ...(null == f ? void 0 : f.search) && {
                                                    "http.query": null == f ? void 0 : f.search
                                                },
                                                ...(null == f ? void 0 : f.hash) && {
                                                    "http.fragment": null == f ? void 0 : f.hash
                                                }
                                            }
                                        }) : new x.f;
                                    return c && !g && (null == h || h.recordDroppedEvent("no_parent_span", "span")), o.__sentry_xhr_span_id__ = _.spanContext().spanId, r[o.__sentry_xhr_span_id__] = _, n(u) && function(e, t, n) {
                                        let {
                                            "sentry-trace": r,
                                            baggage: a,
                                            traceparent: l
                                        } = tR({
                                            span: t,
                                            propagateTraceparent: n
                                        });
                                        r && function(e, t, n, r) {
                                            var a;
                                            let l = null == (a = e.__sentry_xhr_v3__) ? void 0 : a.request_headers;
                                            if ((null == l || !l["sentry-trace"]) && e.setRequestHeader) try {
                                                if (e.setRequestHeader("sentry-trace", t), !r || (null == l ? void 0 : l.traceparent) || e.setRequestHeader("traceparent", r), n) {
                                                    let t = null == l ? void 0 : l.baggage;
                                                    t && t.split(",").some(e => e.trim().startsWith("sentry-")) || e.setRequestHeader("baggage", n)
                                                }
                                            } catch (e) {}
                                        }(e, r, a, l)
                                    }(o, (0, b.f)() && g ? _ : void 0, a), h && h.emit("beforeOutgoingRequestSpan", _, e), _
                                }(t, c, d, f, p, s);
                                if (n) {
                                    var r;
                                    o && tB(n, e), null == u || u(n, {
                                        headers: tz(null == (r = t.xhr.__sentry_xhr_v3__) ? void 0 : r.request_headers)
                                    })
                                }
                            })
                        }(e, {
                            traceFetch: j,
                            traceXHR: U,
                            trackFetchStreamPerformance: q,
                            tracePropagationTargets: e.getOptions().tracePropagationTargets,
                            shouldCreateSpanForRequest: W,
                            enableHTTPTimings: V,
                            onRequestSpanStart: ep,
                            onRequestSpanEnd: eh
                        })
                }
            }
        };

    function tV(e, t, n) {
        e.emit("startPageLoadSpan", t, n), (0, m.d)().setTransactionName(t.name);
        let r = e[tX];
        return r && e.emit("afterStartPageLoadSpan", r), r
    }

    function tQ(e, t, n) {
        let {
            url: r,
            isRedirect: a
        } = n || {};
        e.emit("beforeStartNavigationSpan", t, {
            isRedirect: a
        }), e.emit("startNavigationSpan", t, {
            isRedirect: a
        });
        let l = (0, m.d)();
        return l.setTransactionName(t.name), r && !a && l.setSDKProcessingMetadata({
            normalizedRequest: {
                ...(0, tv.J)(),
                url: r
            }
        }), e[tX]
    }

    function tG(e) {
        let t = tv.b.document,
            n = null == t ? void 0 : t.querySelector("meta[name=".concat(e, "]"));
        return (null == n ? void 0 : n.getAttribute("content")) || void 0
    }

    function tY(e) {
        var t, n, r;
        let a = null == (n = tv.b.performance) || null == (t = n.getEntriesByType) ? void 0 : t.call(n, "navigation")[0],
            l = null == a || null == (r = a.serverTiming) ? void 0 : r.find(t => t.name === e);
        return null == l ? void 0 : l.description
    }
    let tX = "_sentry_idleSpan",
        tK = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__,
        tJ = z.f,
        tZ = null,
        t0 = new Map,
        t1 = new Map;

    function t2(e) {
        let t = e.split("/").filter(Boolean),
            n = 0;
        for (let e of t)
            if (e.startsWith(":")) {
                let t = e.substring(1);
                t.endsWith("*?") ? n += 1e3 : t.endsWith("*") ? n += 100 : n += 10
            } return t.length > 0 && (n += 1 / t.length), n
    }

    function t3(e) {
        if (t0.has(e)) {
            var t;
            return null != (t = t0.get(e)) ? t : null
        }
        try {
            let t = new RegExp(e);
            return t0.set(e, t), t
        } catch (t) {
            return tK && y.h.warn("Could not compile regex", {
                regexString: e,
                error: t
            }), null
        }
    }

    function t4() {
        if (!(null == tJ ? void 0 : tJ._sentryRouteManifest) || "string" != typeof tJ._sentryRouteManifest) return null;
        let e = tJ._sentryRouteManifest;
        if (tZ && p === e) return tZ;
        t0.clear(), t1.clear();
        let t = {
            staticRoutes: [],
            dynamicRoutes: [],
            isrRoutes: []
        };
        try {
            if (t = JSON.parse(e), !Array.isArray(t.staticRoutes) || !Array.isArray(t.dynamicRoutes)) return null;
            return tZ = t, p = e, t
        } catch (e) {
            return tK && y.h.warn("Could not extract route manifest"), null
        }
    }
    let t6 = e => {
        let t = t4();
        if (!t) return;
        let n = e.length > 1 && e.endsWith("/") ? e.slice(0, -1) : e;
        if (t1.has(n)) return t1.get(n);
        let {
            staticRoutes: r,
            dynamicRoutes: a
        } = t;
        if (!Array.isArray(r) || !Array.isArray(a)) return;
        let l = (function(e, t, n) {
            let r = [];
            if (t.some(t => t.path === e)) return r;
            for (let t of n)
                if (t.regex) {
                    let n = t3(t.regex);
                    (null == n ? void 0 : n.test(e)) && r.push(t.path)
                } if (!e.startsWith("/:")) {
                for (let t of n)
                    if (t.hasOptionalPrefix && t.regex) {
                        let n = "/" === e ? "/SENTRY_OPTIONAL_PREFIX" : "/SENTRY_OPTIONAL_PREFIX".concat(e),
                            a = t3(t.regex);
                        (null == a ? void 0 : a.test(n)) && r.push(t.path)
                    }
            }
            return r
        })(n, r, a).sort((e, t) => t2(e) - t2(t))[0];
        return t1.set(n, l), l
    };

    function t8(e) {
        return e.length > 1 && e.endsWith("/") ? e.slice(0, -1) : e
    }
    let t5 = "incomplete-app-router-transaction",
        t9 = {
            current: void 0
        },
        t7 = z.f,
        ne = z.f;

    function nt(e) {
        try {
            return new URL(e, "http://example.com/").pathname
        } catch (e) {
            return "/"
        }
    }
    let nn = new WeakSet;

    function nr(e, t, n) {
        nn.has(t) || (nn.add(t), ["back", "forward", "push", "replace"].forEach(r => {
            (null == t ? void 0 : t[r]) && (t[r] = new Proxy(t[r], {
                apply(t, a, l) {
                    var o;
                    !1;
                    let i = t5,
                        u = {
                            [v.o]: "navigation",
                            [v.u]: "auto.navigation.nextjs.app_router_instrumentation",
                            [v.U]: "url"
                        },
                        s = l[0],
                        c = null != (o = h.default.env._sentryBasePath) ? o : ne._sentryBasePath,
                        d = c && "string" == typeof s && !s.startsWith(c) ? "".concat(c).concat(s) : s;
                    "push" === r ? (i = t8(nt(d)), u["navigation.type"] = "router.push") : "replace" === r ? (i = t8(nt(d)), u["navigation.type"] = "router.replace") : "back" === r ? u["navigation.type"] = "router.back" : "forward" === r && (u["navigation.type"] = "router.forward");
                    let f = t6(i);
                    return n.current = tQ(e, {
                        name: null != f ? f : i,
                        attributes: {
                            ...u,
                            [v.U]: f ? "route" : "url"
                        }
                    }), t.apply(a, l)
                }
            }))
        }))
    }
    var na = e.i(341260);
    let nl = na.default.events ? na.default : na.default.default,
        no = tv.b;

    function ni() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            t = t$({
                ...e,
                instrumentNavigation: !1,
                instrumentPageLoad: !1,
                onRequestSpanStart() {
                    for (var t, n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                    let [l, {
                        headers: o
                    }] = r;
                    return (null == o ? void 0 : o.get("next-router-prefetch")) && (null == l || l.setAttribute("http.request.prefetch", !0)), null == (t = e.onRequestSpanStart) ? void 0 : t.call(e, ...r)
                }
            }),
            {
                instrumentPageLoad: n = !0,
                instrumentNavigation: r = !0
            } = e;
        return {
            ...t,
            afterAllSetup(e) {
                !tq() && (r && function(e) {
                    if (tv.b.document.getElementById("__NEXT_DATA__")) nl.events.on("routeChangeStart", t => {
                        let n, r, a = D(t),
                            l = function(e) {
                                var t;
                                let n = null == (t = no.__BUILD_MANIFEST) ? void 0 : t.sortedPages;
                                if (n) return n.find(t => {
                                    var n;
                                    let r, a, l, o = (r = t.split("/"), a = "", (null == (n = r[r.length - 1]) ? void 0 : n.match(/^\[\[\.\.\..+\]\]$/)) && (r.pop(), a = "(?:/(.+?))?"), l = r.map(e => e.replace(/^\[\.\.\..+\]$/, "(.+?)").replace(/^\[.*\]$/, "([^/]+?)")).join("/"), new RegExp("^".concat(l).concat(a, "(?:/)?$")));
                                    return e.match(o)
                                })
                            }(a);
                        l ? (n = l, r = "route") : (n = a, r = "url"), tQ(e, {
                            name: n,
                            attributes: {
                                [v.o]: "navigation",
                                [v.u]: "auto.navigation.nextjs.pages_router_instrumentation",
                                [v.U]: r
                            }
                        })
                    });
                    else {
                        let t, n, r;
                        tv.b.addEventListener("popstate", () => {
                            var t;
                            let n = t8(tv.b.location.pathname),
                                r = t6(n);
                            (null == (t = t9.current) ? void 0 : t.isRecording()) ? (t9.current.updateName(null != r ? r : n), t9.current.setAttribute(v.U, r ? "route" : "url")) : t9.current = tQ(e, {
                                name: null != r ? r : n,
                                attributes: {
                                    [v.u]: "auto.navigation.nextjs.app_router_instrumentation",
                                    [v.U]: r ? "route" : "url",
                                    "navigation.type": "browser.popstate"
                                }
                            })
                        }), t = !1, n = 0, r = setInterval(() => {
                            var a, l, o;
                            n++;
                            let i = null != (a = null == t7 || null == (l = t7.next) ? void 0 : l.router) ? a : null == t7 || null == (o = t7.nd) ? void 0 : o.router;
                            t || n > 500 ? clearInterval(r) : i && (clearInterval(r), t = !0, nr(e, i, t9), ["nd", "next"].forEach(t => {
                                let n = t7[t];
                                n && (t7[t] = new Proxy(n, {
                                    set: (t, n, r) => ("router" === n && "object" == typeof r && null !== r && nr(e, r, t9), t[n] = r, !0)
                                }))
                            }))
                        }, 20)
                    }
                }(e), t.afterAllSetup(e), n && function(e) {
                    if (tv.b.document.getElementById("__NEXT_DATA__")) ! function(e) {
                        let {
                            route: t,
                            params: n,
                            sentryTrace: r,
                            baggage: a
                        } = function() {
                            let e, t = no.document.getElementById("__NEXT_DATA__");
                            if (null == t ? void 0 : t.innerHTML) try {
                                e = JSON.parse(t.innerHTML)
                            } catch (e) {
                                tK && y.h.warn("Could not extract __NEXT_DATA__")
                            }
                            if (!e) return {};
                            let n = {},
                                {
                                    page: r,
                                    query: a,
                                    props: l
                                } = e;
                            return n.route = r, n.params = a, (null == l ? void 0 : l.pageProps) && (n.sentryTrace = l.pageProps._sentryTraceData, n.baggage = l.pageProps._sentryBaggage), n
                        }(), l = (0, tT.O)(a), o = t || no.location.pathname;
                        (null == l ? void 0 : l["sentry-transaction"]) && "/_error" === o && (o = (o = l["sentry-transaction"]).replace(/^(GET|POST|PUT|DELETE|PATCH|HEAD|OPTIONS|TRACE|CONNECT)\s+/i, ""));
                        let i = (0, E.D)();
                        tV(e, {
                            name: o,
                            startTime: i ? i / 1e3 : void 0,
                            attributes: {
                                [v.o]: "pageload",
                                [v.u]: "auto.pageload.nextjs.pages_router_instrumentation",
                                [v.U]: t ? "route" : "url",
                                ...n && e.getOptions().sendDefaultPii && {
                                    ...n
                                }
                            }
                        }, {
                            sentryTrace: r,
                            baggage: a
                        })
                    }(e);
                    else {
                        let t, n, r;
                        n = t6(t = t8(tv.b.location.pathname)), tV(e, {
                            name: null != n ? n : t,
                            startTime: (r = (0, E.D)()) ? r / 1e3 : void 0,
                            attributes: {
                                [v.o]: "pageload",
                                [v.u]: "auto.pageload.nextjs.app_router_instrumentation",
                                [v.U]: n ? "route" : "url"
                            }
                        })
                    }
                }(e))
            }
        }
    }
    let nu = new Set([]);

    function ns(e) {
        let t = "console",
            n = B(t, e);
        return H(t, nc), n
    }

    function nc() {
        "console" in z.f && y.u.forEach(function(e) {
            e in z.f.console && (0, ee.Q)(z.f.console, e, function(t) {
                return y.r[e] = t,
                    function() {
                        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                        let a = n[0],
                            l = y.r[e],
                            o = nu.size && "string" == typeof a && (0, ti.$)(a, nu);
                        o || q("console", {
                            args: n,
                            level: e
                        }), (!o || g.f && y.h.isEnabled()) && (null == l || l.apply(z.f.console, n))
                    }
            })
        })
    }
    let nd = [];

    function nf(e, t) {
        for (let n of t)(null == n ? void 0 : n.afterAllSetup) && n.afterAllSetup(e)
    }

    function np(e, t, n) {
        if (n[t.name]) {
            g.f && y.h.log("Integration skipped because it was already installed: ".concat(t.name));
            return
        }
        if (n[t.name] = t, nd.includes(t.name) || "function" != typeof t.setupOnce || (t.setupOnce(), nd.push(t.name)), t.setup && "function" == typeof t.setup && t.setup(e), "function" == typeof t.preprocessEvent) {
            let n = t.preprocessEvent.bind(t);
            e.on("preprocessEvent", (t, r) => n(t, r, e))
        }
        if ("function" == typeof t.processEvent) {
            let n = t.processEvent.bind(t),
                r = Object.assign((t, r) => n(t, r, e), {
                    id: t.name
                });
            e.addEventProcessor(r)
        } ["processSpan", "processSegmentSpan"].forEach(n => {
            let r = t[n];
            "function" == typeof r && e.on(n, n => r.call(t, n, e))
        }), g.f && y.h.log("Integration installed: ".concat(t.name))
    }
    var nh = e.i(669043);

    function nm(e) {
        return "warn" === e ? "warning" : ["fatal", "error", "warning", "log", "info", "debug"].includes(e) ? e : "log"
    }
    var ng = e.i(106408);

    function nv(e, t) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : [t],
            r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : "npm",
            a = (e._metadata = e._metadata || {}).sdk = e._metadata.sdk || {};
        a.name || (a.name = "sentry.javascript.".concat(t), a.packages = n.map(e => ({
            name: "".concat(r, ":@sentry/").concat(e),
            version: ng.f
        })), a.version = ng.f)
    }

    function ny(e) {
        let t = [];
        e.message && t.push(e.message);
        try {
            let n = e.exception.values[e.exception.values.length - 1];
            (null == n ? void 0 : n.value) && (t.push(n.value), n.type && t.push("".concat(n.type, ": ").concat(n.value)))
        } catch (e) {}
        return t
    }
    let nb = [/^Script error\.?$/, /^Javascript error: Script error\.? on line 0$/, /^ResizeObserver loop completed with undelivered notifications.$/, /^Cannot redefine property: googletag$/, /^Can't find variable: gmo$/, /^undefined is not an object \(evaluating 'a\.[A-Z]'\)$/, /can't redefine non-configurable property "solana"/, /vv\(\)\.getRestrictions is not a function/, /Can't find variable: _AutofillCallbackHandler/, /Object Not Found Matching Id:\d+, MethodName:simulateEvent/, /^Java exception was raised during method invocation$/],
        n_ = function() {
            let e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
            return {
                name: "EventFilters",
                setup(n) {
                    e = nw(t, n.getOptions())
                },
                processEvent: (n, r, a) => (e || (e = nw(t, a.getOptions())), ! function(e, t) {
                    if (e.type) {
                        if ("transaction" === e.type && function(e, t) {
                                if (!(null == t ? void 0 : t.length)) return !1;
                                let n = e.transaction;
                                return !!n && (0, ti.$)(n, t)
                            }(e, t.ignoreTransactions)) return g.f && y.h.warn("Event dropped due to being matched by `ignoreTransactions` option.\nEvent: ".concat((0, nh.N)(e))), !0
                    } else {
                        var n, r, a, l, o;
                        if (n = e, (null == (r = t.ignoreErrors) ? void 0 : r.length) && ny(n).some(e => (0, ti.$)(e, r))) return g.f && y.h.warn("Event dropped due to being matched by `ignoreErrors` option.\nEvent: ".concat((0, nh.N)(e))), !0;
                        if ((null == (o = (a = e).exception) || null == (l = o.values) ? void 0 : l.length) && !a.message && !a.exception.values.some(e => e.stacktrace || e.type && "Error" !== e.type || e.value)) return g.f && y.h.warn("Event dropped due to not having an error message, error type or stacktrace.\nEvent: ".concat((0, nh.N)(e))), !0;
                        if (function(e, t) {
                                if (!(null == t ? void 0 : t.length)) return !1;
                                let n = nE(e);
                                return !!n && (0, ti.$)(n, t)
                            }(e, t.denyUrls)) return g.f && y.h.warn("Event dropped due to being matched by `denyUrls` option.\nEvent: ".concat((0, nh.N)(e), ".\nUrl: ").concat(nE(e))), !0;
                        if (! function(e, t) {
                                if (!(null == t ? void 0 : t.length)) return !0;
                                let n = nE(e);
                                return !n || (0, ti.$)(n, t)
                            }(e, t.allowUrls)) return g.f && y.h.warn("Event dropped due to not being matched by `allowUrls` option.\nEvent: ".concat((0, nh.N)(e), ".\nUrl: ").concat(nE(e))), !0
                    }
                    return !1
                }(n, e) ? n : null)
            }
        },
        nS = function() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
            return {
                ...n_(e),
                name: "InboundFilters"
            }
        };

    function nw() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return {
            allowUrls: [...e.allowUrls || [], ...t.allowUrls || []],
            denyUrls: [...e.denyUrls || [], ...t.denyUrls || []],
            ignoreErrors: [...e.ignoreErrors || [], ...t.ignoreErrors || [], ...e.disableErrorDefaults ? [] : nb],
            ignoreTransactions: [...e.ignoreTransactions || [], ...t.ignoreTransactions || []]
        }
    }

    function nE(e) {
        try {
            var t, n, r;
            let a = [...null != (t = null == (n = e.exception) ? void 0 : n.values) ? t : []].reverse().find(e => {
                    var t, n, r;
                    return (null == (t = e.mechanism) ? void 0 : t.parent_id) === void 0 && (null == (r = e.stacktrace) || null == (n = r.frames) ? void 0 : n.length)
                }),
                l = null == a || null == (r = a.stacktrace) ? void 0 : r.frames;
            return l ? function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
                for (let t = e.length - 1; t >= 0; t--) {
                    let n = e[t];
                    if (n && "<anonymous>" !== n.filename && "[native code]" !== n.filename) return n.filename || null
                }
                return null
            }(l) : null
        } catch (t) {
            return g.f && y.h.error("Cannot extract url for event ".concat((0, nh.N)(e))), null
        }
    }
    let nk = new WeakMap;

    function nx(e, t) {
        let n = (0, F.s)(e),
            r = (0, F.s)(t);
        if (!n && !r) return !0;
        if (n && !r || !n && r || r.length !== n.length) return !1;
        for (let e = 0; e < r.length; e++) {
            let t = r[e],
                a = n[e];
            if (t.filename !== a.filename || t.lineno !== a.lineno || t.colno !== a.colno || t.function !== a.function) return !1
        }
        return !0
    }

    function nT(e, t) {
        let n = e.fingerprint,
            r = t.fingerprint;
        if (!n && !r) return !0;
        if (n && !r || !n && r) return !1;
        try {
            return n.join("") === r.join("")
        } catch (e) {
            return !1
        }
    }

    function nP(e) {
        var t, n;
        return null == (n = e.exception) || null == (t = n.values) ? void 0 : t[0]
    }
    var nC = e.i(168741),
        nN = e.i(284207),
        nR = e.i(284612);
    e.i(531428), e.i(310586);
    var nA = e.i(589699),
        nL = e.i(322375);

    function nO(e, t) {
        var n, r, a, l, o, i;
        let u, s, c = null != (n = null != t ? t : (i = e, nI().get(i))) ? n : [];
        if (0 === c.length) return;
        let d = e.getOptions(),
            f = (r = d._metadata, a = d.tunnel, l = e.getDsn(), o = d.sendDefaultPii, u = {}, (null == r ? void 0 : r.sdk) && (u.sdk = {
                name: r.sdk.name,
                version: r.sdk.version
            }), a && l && (u.dsn = (0, nA._)(l)), (0, nL.H)(u, [(s = o ? "auto" : "never", [{
                type: "log",
                item_count: c.length,
                content_type: "application/vnd.sentry.items.log+json"
            }, {
                version: 2,
                ...eo() && {
                    ingest_settings: {
                        infer_ip: s,
                        infer_user_agent: s
                    }
                },
                items: c
            }])]));
        nI().set(e, []), e.emit("flushLogs"), e.sendEnvelope(f)
    }

    function nI() {
        return (0, tC.u)("clientToLogBufferMap", () => new WeakMap)
    }

    function nD(e, t) {
        var n, r, a, l, o, i;
        let u, s, c = null != (n = null != t ? t : (i = e, nM().get(i))) ? n : [];
        if (0 === c.length) return;
        let d = e.getOptions(),
            f = (r = d._metadata, a = d.tunnel, l = e.getDsn(), o = d.sendDefaultPii, u = {}, (null == r ? void 0 : r.sdk) && (u.sdk = {
                name: r.sdk.name,
                version: r.sdk.version
            }), a && l && (u.dsn = (0, nA._)(l)), (0, nL.H)(u, [(s = o ? "auto" : "never", [{
                type: "trace_metric",
                item_count: c.length,
                content_type: "application/vnd.sentry.items.trace-metric+json"
            }, {
                version: 2,
                ...eo() && {
                    ingest_settings: {
                        infer_ip: s,
                        infer_user_agent: s
                    }
                },
                items: c
            }])]));
        nM().set(e, []), e.emit("flushMetrics"), e.sendEnvelope(f)
    }

    function nM() {
        return (0, tC.u)("clientToMetricBufferMap", () => new WeakMap)
    }
    var nz = e.i(812268),
        nF = e.i(633015),
        nj = e.i(147540);

    function nU(e) {
        return "object" == typeof e && "function" == typeof e.unref && e.unref(), e
    }
    let nB = Symbol.for("SentryBufferFullError");

    function nH() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 100,
            t = new Set;
        return {
            get $() {
                return Array.from(t)
            },
            add: function(n) {
                if (!(t.size < e)) return (0, nj.K)(nB);
                let r = n();
                return t.add(r), r.then(() => {
                    t.delete(r)
                }, () => {
                    t.delete(r)
                }), r
            },
            drain: function(e) {
                if (!t.size) return (0, nj.Y)(!0);
                let n = Promise.allSettled(Array.from(t)).then(() => !0);
                return e ? Promise.race([n, new Promise(t => nU(setTimeout(() => t(!1), e)))]) : n
            }
        }
    }
    var nq = e.i(167178),
        nW = e.i(445228),
        n$ = e.i(236716),
        nV = e.i(351591);
    let nQ = "Not capturing exception because it's already been captured.",
        nG = "Discarded session because of missing or non-string release",
        nY = Symbol.for("SentryInternalError"),
        nX = Symbol.for("SentryDoNotSendEventError");

    function nK(e) {
        return {
            message: e,
            [nY]: !0
        }
    }

    function nJ(e) {
        return {
            message: e,
            [nX]: !0
        }
    }

    function nZ(e) {
        return !!e && "object" == typeof e && nY in e
    }

    function n0(e) {
        return !!e && "object" == typeof e && nX in e
    }

    function n1(e, t, n, r, a) {
        let l, o = 0,
            i = !1;
        e.on(n, () => {
            o = 0, clearTimeout(l), i = !1
        }), e.on(t, t => {
            (o += r(t)) >= 8e5 ? a(e) : i || (i = !0, l = nU(setTimeout(() => {
                a(e)
            }, 5e3)))
        }), e.on("flush", () => {
            a(e)
        })
    }
    class n2 {
        captureException(e, t, n) {
            let r = (0, nh.c)();
            if ((0, nh.n)(e)) return g.f && y.h.log(nQ), r;
            let a = {
                event_id: r,
                ...t
            };
            return this._process(() => this.eventFromException(e, a).then(e => this._captureEvent(e, a, n)).then(e => e), "error"), a.event_id
        }
        captureMessage(e, t, n, r) {
            let a = {
                    event_id: (0, nh.c)(),
                    ...n
                },
                l = (0, tu.S)(e) ? e : String(e),
                o = (0, tu.n)(e),
                i = o ? this.eventFromMessage(l, t, a) : this.eventFromException(e, a);
            return this._process(() => i.then(e => this._captureEvent(e, a, r)), o ? "unknown" : "error"), a.event_id
        }
        captureEvent(e, t, n) {
            let r = (0, nh.c)();
            if ((null == t ? void 0 : t.originalException) && (0, nh.n)(t.originalException)) return g.f && y.h.log(nQ), r;
            let a = {
                    event_id: r,
                    ...t
                },
                l = e.sdkProcessingMetadata || {},
                o = l.capturedSpanScope,
                i = l.capturedSpanIsolationScope,
                u = n3(e.type);
            return this._process(() => this._captureEvent(e, a, o || n, i), u), a.event_id
        }
        captureSession(e) {
            this.sendSession(e), (0, nz.d)(e, {
                init: !1
            })
        }
        getDsn() {
            return this._dsn
        }
        getOptions() {
            return this._options
        }
        getSdkMetadata() {
            return this._options._metadata
        }
        getTransport() {
            return this._transport
        }
        async flush(e) {
            let t = this._transport;
            if (this.emit("flush"), !t) return !0;
            let n = await this._isClientDoneProcessing(e),
                r = await t.flush(e);
            return n && r
        }
        async close(e) {
            nO(this);
            let t = await this.flush(e);
            return this.getOptions().enabled = !1, this.emit("close"), t
        }
        getEventProcessors() {
            return this._eventProcessors
        }
        addEventProcessor(e) {
            this._eventProcessors.push(e)
        }
        init() {
            (this._isEnabled() || this._options.integrations.some(e => {
                let {
                    name: t
                } = e;
                return t.startsWith("Spotlight")
            })) && this._setupIntegrations()
        }
        getIntegrationByName(e) {
            return this._integrations[e]
        }
        addIntegration(e) {
            let t = this._integrations[e.name];
            !t && e.beforeSetup && e.beforeSetup(this), np(this, e, this._integrations), t || nf(this, [e])
        }
        sendEvent(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            this.emit("beforeSendEvent", e, t);
            let n = function(e, t) {
                    var n, r, a;
                    if ("transaction" !== e.type || !(null == (n = e.spans) ? void 0 : n.length) || !(null == (r = e.sdkProcessingMetadata) ? void 0 : r.hasGenAiSpans) || !t.getOptions().streamGenAiSpans || (0, K.f)(t)) return;
                    let l = [],
                        o = [];
                    for (let t of e.spans)(null == (a = t.op) ? void 0 : a.startsWith("gen_ai.")) ? l.push(function(e) {
                        let t = {
                            trace_id: e.trace_id,
                            span_id: e.span_id,
                            parent_span_id: e.parent_span_id,
                            name: e.description || "",
                            start_timestamp: e.start_timestamp,
                            end_timestamp: e.timestamp || e.start_timestamp,
                            status: e.status && "ok" !== e.status && "cancelled" !== e.status ? "error" : "ok",
                            is_segment: !1,
                            attributes: {
                                ...e.data
                            },
                            links: e.links
                        };
                        return (0, w.g)(t)
                    }(t)) : o.push(t);
                    if (0 === l.length) return;
                    e.spans = o;
                    let i = t.getOptions().sendDefaultPii ? "auto" : "never";
                    return [{
                        type: "span",
                        item_count: l.length,
                        content_type: "application/vnd.sentry.items.span.v2+json"
                    }, {
                        version: 2,
                        ...eo() && {
                            ingest_settings: {
                                infer_ip: i,
                                infer_user_agent: i
                            }
                        },
                        items: l
                    }]
                }(e, this),
                r = (0, nR.D)(e, this._dsn, this._options._metadata, this._options.tunnel);
            for (let e of t.attachments || []) r = (0, nL.S)(r, (0, nL.i)(e));
            n && (r = (0, nL.S)(r, n)), this.sendEnvelope(r).then(t => this.emit("afterSendEvent", e, t))
        }
        sendSession(e) {
            let {
                release: t,
                environment: n = nN.f
            } = this._options;
            if ("aggregates" in e) {
                let r = e.attrs || {};
                if (!r.release && !t) {
                    g.f && y.h.warn(nG);
                    return
                }
                r.release = r.release || t, r.environment = r.environment || n, e.attrs = r
            } else {
                if (!e.release && !t) {
                    g.f && y.h.warn(nG);
                    return
                }
                e.release = e.release || t, e.environment = e.environment || n
            }
            this.emit("beforeSendSession", e);
            let r = (0, nR.E)(e, this._dsn, this._options._metadata, this._options.tunnel);
            this.sendEnvelope(r)
        }
        recordDroppedEvent(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1;
            if (this._options.sendClientReports) {
                let r = "".concat(e, ":").concat(t);
                g.f && y.h.log('Recording outcome: "'.concat(r, '"').concat(n > 1 ? " (".concat(n, " times)") : "")), this._outcomes[r] = (this._outcomes[r] || 0) + n
            }
        }
        on(e, t) {
            let n = this._hooks[e] = this._hooks[e] || new Set,
                r = function() {
                    for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                    return t(...n)
                };
            return n.add(r), () => {
                n.delete(r)
            }
        }
        emit(e) {
            for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
            let a = this._hooks[e];
            a && a.forEach(e => e(...n))
        }
        async sendEnvelope(e) {
            if (this.emit("beforeEnvelope", e), this._isEnabled() && this._transport) try {
                return await this._transport.send(e)
            } catch (e) {
                return g.f && y.h.error("Error while sending envelope:", e), {}
            }
            return g.f && y.h.error("Transport disabled"), {}
        }
        registerCleanup(e) {}
        dispose() {}
        _setupIntegrations() {
            var e;
            let t, {
                integrations: n
            } = this._options;
            this._integrations = (e = this, t = {}, n.forEach(t => {
                (null == t ? void 0 : t.beforeSetup) && t.beforeSetup(e)
            }), n.forEach(n => {
                n && np(e, n, t)
            }), t), nf(this, n)
        }
        _updateSessionFromEvent(e, t) {
            var n, r;
            let a = "fatal" === t.level,
                l = !1,
                o = null == (n = t.exception) ? void 0 : n.values;
            if (o) {
                for (let e of (l = !0, a = !1, o))
                    if ((null == (r = e.mechanism) ? void 0 : r.handled) === !1) {
                        a = !0;
                        break
                    }
            }
            let i = "ok" === e.status;
            (i && 0 === e.errors || i && a) && ((0, nz.d)(e, {
                ...a && {
                    status: "crashed"
                },
                errors: e.errors || Number(l || a)
            }), this.captureSession(e))
        }
        async _isClientDoneProcessing(e) {
            let t = 0;
            for (; !e || t < e;) {
                if (await new Promise(e => setTimeout(e, 1)), !this._numProcessing) return !0;
                t++
            }
            return !1
        }
        _isEnabled() {
            return !1 !== this.getOptions().enabled && void 0 !== this._transport
        }
        _prepareEvent(e, t, n, r) {
            let a = this.getOptions(),
                l = Object.keys(this._integrations);
            return !t.integrations && (null == l ? void 0 : l.length) && (t.integrations = l), this.emit("preprocessEvent", e, t), e.type || r.setLastEventId(e.event_id || t.event_id), (0, nV.H)(a, e, t, n, this, r).then(e => {
                var r;
                return null === e || (this.emit("postprocessEvent", e, t), e.contexts = {
                    trace: {
                        ...null == (r = e.contexts) ? void 0 : r.trace,
                        ...(0, m.i)(n)
                    },
                    ...e.contexts
                }, e.sdkProcessingMetadata = {
                    dynamicSamplingContext: (0, k.H)(this, n),
                    ...e.sdkProcessingMetadata
                }), e
            })
        }
        _captureEvent(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : (0, m.d)(),
                r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : (0, m.V)();
            return g.f && n4(e) && y.h.log("Captured error event `".concat(ny(e)[0] || "<unknown>", "`")), this._processEvent(e, t, n, r).then(e => e.event_id, e => {
                g.f && (n0(e) ? y.h.log(e.message) : nZ(e) ? y.h.warn(e.message) : y.h.warn(e))
            })
        }
        _processEvent(e, t, n, r) {
            let a = this.getOptions(),
                {
                    sampleRate: l
                } = a,
                o = n6(e),
                i = n4(e),
                u = e.type || "error",
                s = "before send for type `".concat(u, "`"),
                c = void 0 === l ? void 0 : (0, n$.f)(l);
            if (i && "number" == typeof c && (0, nq.T)() > c) return this.recordDroppedEvent("sample_rate", "error"), (0, nj.K)(nJ("Discarding event because it's not included in the random sample (sampling rate = ".concat(l, ")")));
            let d = n3(e.type);
            return this._prepareEvent(e, t, n, r).then(e => {
                var n;
                if (null === e) throw this.recordDroppedEvent("event_processor", d), nJ("An event processor returned `null`, will not send event.");
                return (null == (n = t.data) ? void 0 : n.__sentry__) === !0 ? e : function(e, t) {
                    let n = "".concat(t, " must return `null` or a valid event.");
                    if ((0, tu.l)(e)) return e.then(e => {
                        if (!(0, tu.d)(e) && null !== e) throw nK(n);
                        return e
                    }, e => {
                        throw nK("".concat(t, " rejected with ").concat(e))
                    });
                    if (!(0, tu.d)(e) && null !== e) throw nK(n);
                    return e
                }(function(e, t, n, r) {
                    let {
                        beforeSend: a,
                        beforeSendTransaction: l,
                        ignoreSpans: o
                    } = t, i = !(0, nF.f)(t.beforeSendSpan) && t.beforeSendSpan, u = n;
                    if (n4(u) && a) return a(u, r);
                    if (n6(u)) {
                        if (i || o) {
                            let t = function(e) {
                                var t, n, r;
                                let {
                                    trace_id: a,
                                    parent_span_id: l,
                                    span_id: o,
                                    status: i,
                                    origin: u,
                                    data: s,
                                    op: c
                                } = null != (t = null == (r = e.contexts) ? void 0 : r.trace) ? t : {};
                                return {
                                    data: null != s ? s : {},
                                    description: e.transaction,
                                    op: c,
                                    parent_span_id: l,
                                    span_id: null != o ? o : "",
                                    start_timestamp: null != (n = e.start_timestamp) ? n : 0,
                                    status: i,
                                    timestamp: e.timestamp,
                                    trace_id: null != a ? a : "",
                                    origin: u,
                                    profile_id: null == s ? void 0 : s[v.q],
                                    exclusive_time: null == s ? void 0 : s[v._],
                                    measurements: e.measurements,
                                    is_segment: !0
                                }
                            }(u);
                            if ((null == o ? void 0 : o.length) && (0, _.s)({
                                    description: t.description,
                                    op: t.op,
                                    attributes: t.data
                                }, o)) return null;
                            if (i) {
                                let e = i(t);
                                if (e) u = (0, nW.f)(n, {
                                    type: "transaction",
                                    timestamp: e.timestamp,
                                    start_timestamp: e.start_timestamp,
                                    transaction: e.description,
                                    contexts: {
                                        trace: {
                                            trace_id: e.trace_id,
                                            span_id: e.span_id,
                                            parent_span_id: e.parent_span_id,
                                            op: e.op,
                                            status: e.status,
                                            origin: e.origin,
                                            data: {
                                                ...e.data,
                                                ...e.profile_id && {
                                                    [v.q]: e.profile_id
                                                },
                                                ...e.exclusive_time && {
                                                    [v._]: e.exclusive_time
                                                }
                                            }
                                        }
                                    },
                                    measurements: e.measurements
                                });
                                else(0, w.x)()
                            }
                            if (u.spans) {
                                let t = [],
                                    n = u.spans;
                                for (let e of n) {
                                    if ((null == o ? void 0 : o.length) && (0, _.s)({
                                            description: e.description,
                                            op: e.op,
                                            attributes: e.data
                                        }, o)) {
                                        (0, _.v)(n, e);
                                        continue
                                    }
                                    if (i) {
                                        let n = i(e);
                                        n ? t.push(n) : ((0, w.x)(), t.push(e))
                                    } else t.push(e)
                                }
                                let r = u.spans.length - t.length;
                                r && e.recordDroppedEvent("before_send", "span", r), u.spans = t
                            }
                        }
                        if (l) {
                            if (u.spans) {
                                let e = u.spans.length;
                                u.sdkProcessingMetadata = {
                                    ...n.sdkProcessingMetadata,
                                    spanCountBeforeProcessing: e
                                }
                            }
                            return l(u, r)
                        }
                    }
                    return u
                }(this, a, e, t), s)
            }).then(a => {
                if (null === a) {
                    if (this.recordDroppedEvent("before_send", d), o) {
                        let t = 1 + (e.spans || []).length;
                        this.recordDroppedEvent("before_send", "span", t)
                    }
                    throw nJ("".concat(s, " returned `null`, will not send event."))
                }
                let l = n.getSession() || r.getSession();
                if (i && l && this._updateSessionFromEvent(l, a), o) {
                    var u;
                    let e = ((null == (u = a.sdkProcessingMetadata) ? void 0 : u.spanCountBeforeProcessing) || 0) - (a.spans ? a.spans.length : 0);
                    e > 0 && this.recordDroppedEvent("before_send", "span", e)
                }
                let c = a.transaction_info;
                return o && c && a.transaction !== e.transaction && (a.transaction_info = {
                    ...c,
                    source: "custom"
                }), this.sendEvent(a, t), a
            }).then(null, e => {
                if (n0(e) || nZ(e)) throw e;
                throw this.captureException(e, {
                    mechanism: {
                        handled: !1,
                        type: "internal"
                    },
                    data: {
                        __sentry__: !0
                    },
                    originalException: e
                }), nK("Event processing pipeline threw an error, original event will not be sent. Details have been sent as a new event.\nReason: ".concat(e))
            })
        }
        _process(e, t) {
            this._numProcessing++, this._promiseBuffer.add(e).then(e => (this._numProcessing--, e), e => (this._numProcessing--, e === nB && this.recordDroppedEvent("queue_overflow", t), e))
        }
        _clearOutcomes() {
            let e = this._outcomes;
            return this._outcomes = {}, Object.entries(e).map(e => {
                let [t, n] = e, [r, a] = t.split(":");
                return {
                    reason: r,
                    category: a,
                    quantity: n
                }
            })
        }
        _flushOutcomes() {
            var e;
            let t;
            g.f && y.h.log("Flushing outcomes...");
            let n = this._clearOutcomes();
            if (0 === n.length) {
                g.f && y.h.log("No outcomes to send");
                return
            }
            if (!this._dsn) {
                g.f && y.h.log("No dsn provided, will not send outcomes");
                return
            }
            g.f && y.h.log("Sending outcomes:", n);
            let r = (e = this._options.tunnel && (0, nA._)(this._dsn), t = [{
                type: "client_report"
            }, {
                timestamp: (0, E.i)(),
                discarded_events: n
            }], (0, nL.H)(e ? {
                dsn: e
            } : {}, [t]));
            this.sendEnvelope(r)
        }
        constructor(e) {
            var t, n, r, a, l, o, i;
            if (this._options = e, this._integrations = {}, this._numProcessing = 0, this._outcomes = {}, this._hooks = {}, this._eventProcessors = [], this._promiseBuffer = nH(null != (t = null == (l = e.transportOptions) ? void 0 : l.bufferSize) ? t : 64), e.dsn ? this._dsn = (0, nA.p)(e.dsn) : g.f && y.h.warn("No DSN provided, client will not send events."), this._dsn) {
                let t = (0, nC.y)(this._dsn, e.tunnel, e._metadata ? e._metadata.sdk : void 0);
                this._transport = e.transport({
                    tunnel: this._options.tunnel,
                    recordDroppedEvent: this.recordDroppedEvent.bind(this),
                    ...e.transportOptions,
                    url: t
                })
            }
            this._options.enableLogs = null != (n = this._options.enableLogs) ? n : null == (o = this._options._experiments) ? void 0 : o.enableLogs, this._options.enableLogs && n1(this, "afterCaptureLog", "flushLogs", n5, nO), (null == (r = null != (a = this._options.enableMetrics) ? a : null == (i = this._options._experiments) ? void 0 : i.enableMetrics) || r) && n1(this, "afterCaptureMetric", "flushMetrics", n8, nD)
        }
    }

    function n3(e) {
        return "replay_event" === e ? "replay" : e || "error"
    }

    function n4(e) {
        return void 0 === e.type
    }

    function n6(e) {
        return "transaction" === e.type
    }

    function n8(e) {
        let t = 0;
        return e.name && (t += 2 * e.name.length), (t += 8) + n9(e.attributes)
    }

    function n5(e) {
        let t = 0;
        return e.message && (t += 2 * e.message.length), t + n9(e.attributes)
    }

    function n9(e) {
        if (!e) return 0;
        let t = 0;
        return Object.values(e).forEach(e => {
            Array.isArray(e) ? t += e.length * n7(e[0]) : (0, tu.n)(e) ? t += n7(e) : t += 100
        }), t
    }

    function n7(e) {
        return "string" == typeof e ? 2 * e.length : "number" == typeof e ? 8 : 4 * ("boolean" == typeof e)
    }

    function re(e) {
        if ("aggregates" in e) {
            var t;
            (null == (t = e.attrs) ? void 0 : t.ip_address) === void 0 && (e.attrs = {
                ...e.attrs,
                ip_address: "{{auto}}"
            })
        } else void 0 === e.ipAddress && (e.ipAddress = "{{auto}}")
    }
    var rt = e.i(521196);

    function rn(e) {
        return (0, tu.b)(e) && "__sentry_fetch_url_host__" in e && "string" == typeof e.__sentry_fetch_url_host__ ? "".concat(e.message, " (").concat(e.__sentry_fetch_url_host__, ")") : e.message
    }

    function rr(e, t) {
        var n, r;
        let a, l, o = rl(e, t),
            i = {
                type: !(a = null == (n = t) ? void 0 : n.name) && ri(n) ? n.message && Array.isArray(n.message) && 2 == n.message.length ? n.message[0] : "WebAssembly.Exception" : a,
                value: (l = null == (r = t) ? void 0 : r.message, ri(r) ? Array.isArray(r.message) && 2 == r.message.length ? r.message[1] : "wasm exception" : l ? l.error && "string" == typeof l.error.message ? rn(l.error) : rn(r) : "No error message")
            };
        return o.length && (i.stacktrace = {
            frames: o
        }), void 0 === i.type && "" === i.value && (i.value = "Unrecoverable error caught"), i
    }

    function ra(e, t) {
        return {
            exception: {
                values: [rr(e, t)]
            }
        }
    }

    function rl(e, t) {
        var n, r;
        let a = t.stacktrace || t.stack || "",
            l = (n = t) && ro.test(n.message) ? 1 : 0,
            o = "number" == typeof(r = t).framesToPop ? r.framesToPop : 0;
        try {
            return e(a, l, o)
        } catch (e) {}
        return []
    }
    let ro = /Minified React error #\d+;/i;

    function ri(e) {
        return "u" > typeof WebAssembly && void 0 !== WebAssembly.Exception && e instanceof WebAssembly.Exception
    }

    function ru(e, t, n, r, a) {
        let l;
        if ((0, tu.u)(t) && t.error) return ra(e, t.error);
        if ((0, tu.U)(t) || (0, tu.a)(t)) {
            if ("stack" in t) l = ra(e, t);
            else {
                let a = t.name || ((0, tu.U)(t) ? "DOMError" : "DOMException"),
                    o = t.message ? "".concat(a, ": ").concat(t.message) : a;
                l = rs(e, o, n, r), (0, nh.T)(l, o)
            }
            return "code" in t && (l.tags = {
                ...l.tags,
                "DOMException.code": "".concat(t.code)
            }), l
        }
        return (0, tu.b)(t) ? ra(e, t) : ((0, tu.d)(t) || (0, tu.z)(t) ? l = function(e, t, n, r) {
            let a = (0, m.l)(),
                l = null == a ? void 0 : a.getOptions().normalizeDepth,
                o = Object.values(t).find(e => e instanceof Error),
                i = {
                    __serialized__: (0, rt.B)(t, l)
                };
            if (o) return {
                exception: {
                    values: [rr(e, o)]
                },
                extra: i
            };
            let u = {
                exception: {
                    values: [{
                        type: (0, tu.z)(t) ? t.constructor.name : r ? "UnhandledRejection" : "Error",
                        value: function(e, t) {
                            let {
                                isUnhandledRejection: n
                            } = t, r = (0, ee.v)(e), a = n ? "promise rejection" : "exception";
                            if ((0, tu.u)(e)) return "Event `ErrorEvent` captured as ".concat(a, " with message `").concat(e.message, "`");
                            if ((0, tu.z)(e)) {
                                let t = function(e) {
                                    try {
                                        let t = Object.getPrototypeOf(e);
                                        return t ? t.constructor.name : void 0
                                    } catch (e) {}
                                }(e);
                                return "Event `".concat(t, "` (type=").concat(e.type, ") captured as ").concat(a)
                            }
                            return "Object captured as ".concat(a, " with keys: ").concat(r)
                        }(t, {
                            isUnhandledRejection: r
                        })
                    }]
                },
                extra: i
            };
            if (n) {
                let t = rl(e, n);
                t.length && (u.exception.values[0].stacktrace = {
                    frames: t
                })
            }
            return u
        }(e, t, n, a) : (l = rs(e, t, n, r), (0, nh.T)(l, "".concat(t), void 0)), (0, nh.o)(l, {
            synthetic: !0
        }), l)
    }

    function rs(e, t, n, r) {
        let a = {};
        if (r && n) {
            let r = rl(e, n);
            r.length && (a.exception = {
                values: [{
                    value: t,
                    stacktrace: {
                        frames: r
                    }
                }]
            }), (0, nh.o)(a, {
                synthetic: !0
            })
        }
        if ((0, tu.S)(t)) {
            let {
                __sentry_template_string__: e,
                __sentry_template_values__: n
            } = t;
            return a.logentry = {
                message: e,
                params: n
            }, a
        }
        return a.message = t, a
    }
    class rc extends n2 {
        eventFromException(e, t) {
            var n, r;
            let a;
            return n = this._options.stackParser, r = this._options.attachStacktrace, a = ru(n, e, (null == t ? void 0 : t.syntheticException) || void 0, r), (0, nh.o)(a), a.level = "error", (null == t ? void 0 : t.event_id) && (a.event_id = t.event_id), (0, nj.Y)(a)
        }
        eventFromMessage(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "info",
                n = arguments.length > 2 ? arguments[2] : void 0;
            return function(e, t) {
                let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "info",
                    r = arguments.length > 3 ? arguments[3] : void 0,
                    a = arguments.length > 4 ? arguments[4] : void 0,
                    l = rs(e, t, (null == r ? void 0 : r.syntheticException) || void 0, a);
                return l.level = n, (null == r ? void 0 : r.event_id) && (l.event_id = r.event_id), (0, nj.Y)(l)
            }(this._options.stackParser, e, t, n, this._options.attachStacktrace)
        }
        _prepareEvent(e, t, n, r) {
            return e.platform = e.platform || "javascript", super._prepareEvent(e, t, n, r)
        }
        constructor(e) {
            var t, n, r, a;
            let l = (r = e, {
                release: "string" == typeof __SENTRY_RELEASE__ ? __SENTRY_RELEASE__ : null == (a = tv.b.SENTRY_RELEASE) ? void 0 : a.id,
                sendClientReports: !0,
                parentSpanIsAlwaysRootSpan: !0,
                ...r
            });
            nv(l, "browser", ["browser"], tv.b.SENTRY_SDK_SOURCE || "npm"), (null == (n = l._metadata) ? void 0 : n.sdk) && (l._metadata.sdk.settings = {
                infer_ip: l.sendDefaultPii ? "auto" : "never",
                ...l._metadata.sdk.settings
            }), super(l);
            let {
                sendDefaultPii: o,
                sendClientReports: i,
                enableLogs: u,
                _experiments: s,
                enableMetrics: c
            } = this._options, d = null == (t = null != c ? c : null == s ? void 0 : s.enableMetrics) || t;
            tv.b.document && (i || u || d) && tv.b.document.addEventListener("visibilitychange", () => {
                "hidden" === tv.b.document.visibilityState && (i && this._flushOutcomes(), u && nO(this), d && nD(this))
            }), o && this.on("beforeSendSession", re)
        }
    }

    function rd(e, t) {
        let n = (0, m.l)(),
            r = (0, m.V)();
        if (!n) return;
        let {
            beforeBreadcrumb: a = null,
            maxBreadcrumbs: l = 100
        } = n.getOptions();
        if (l <= 0) return;
        let o = {
                timestamp: (0, E.i)(),
                ...e
            },
            i = a ? (0, y.D)(() => a(o, t)) : o;
        null !== i && (n.emit && n.emit("beforeAddBreadcrumb", i, t), r.addBreadcrumb(i, l))
    }

    function rf(e) {
        if (void 0 !== e) return e >= 400 && e < 500 ? "warning" : e >= 500 ? "error" : void 0
    }

    function rp() {
        if (!er.document) return;
        let e = q.bind(null, "dom"),
            t = rh(e, !0);
        er.document.addEventListener("click", t, !1), er.document.addEventListener("keypress", t, !1), ["EventTarget", "Node"].forEach(t => {
            var n, r;
            let a = null == (n = er[t]) ? void 0 : n.prototype;
            (null == a || null == (r = a.hasOwnProperty) ? void 0 : r.call(a, "addEventListener")) && ((0, ee.Q)(a, "addEventListener", function(t) {
                return function(n, r, a) {
                    if ("click" === n || "keypress" == n) try {
                        let r = this.__sentry_instrumentation_handlers__ = this.__sentry_instrumentation_handlers__ || {},
                            l = r[n] = r[n] || {
                                refCount: 0
                            };
                        if (!l.handler) {
                            let r = rh(e);
                            l.handler = r, t.call(this, n, r, a)
                        }
                        l.refCount++
                    } catch (e) {}
                    return t.call(this, n, r, a)
                }
            }), (0, ee.Q)(a, "removeEventListener", function(e) {
                return function(t, n, r) {
                    if ("click" === t || "keypress" == t) try {
                        let n = this.__sentry_instrumentation_handlers__ || {},
                            a = n[t];
                        a && (a.refCount--, a.refCount <= 0 && (e.call(this, t, a.handler, r), a.handler = void 0, delete n[t]), 0 === Object.keys(n).length && delete this.__sentry_instrumentation_handlers__)
                    } catch (e) {}
                    return e.call(this, t, n, r)
                }
            }))
        })
    }

    function rh(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        return n => {
            var r;
            if (!n || n._sentryCaptured) return;
            let a = function(e) {
                try {
                    return e.target
                } catch (e) {
                    return null
                }
            }(n);
            if (r = n.type, "keypress" === r && (null == a || !a.tagName || "INPUT" !== a.tagName && "TEXTAREA" !== a.tagName && !a.isContentEditable && 1)) return;
            (0, ee.O)(n, "_sentryCaptured", !0), a && !a._sentryId && (0, ee.O)(a, "_sentryId", (0, nh.c)());
            let l = "keypress" === n.type ? "input" : n.type;
            ! function(e) {
                if (e.type !== d) return !1;
                try {
                    if (!e.target || e.target._sentryId !== f) return !1
                } catch (e) {}
                return !0
            }(n) && (e({
                event: n,
                name: l,
                global: t
            }), d = n.type, f = a ? a._sentryId : void 0), clearTimeout(c), c = er.setTimeout(() => {
                f = void 0, d = void 0
            }, 1e3)
        }
    }
    let rm = function() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                t = {
                    console: !0,
                    dom: !0,
                    fetch: !0,
                    history: !0,
                    sentry: !0,
                    xhr: !0,
                    ...e
                };
            return {
                name: "Breadcrumbs",
                setup(e) {
                    var n, r, a, l, o, i, u;
                    t.console && ns((n = e, function(e) {
                        if ((0, m.l)() !== n) return;
                        let t = {
                            category: "console",
                            data: {
                                arguments: e.args,
                                logger: "console"
                            },
                            level: nm(e.level),
                            message: (0, ti.c)(e.args, " ")
                        };
                        if ("assert" === e.level)
                            if (!1 !== e.args[0]) return;
                            else t.message = "Assertion failed: ".concat((0, ti.c)(e.args.slice(1), " ") || "console.assert"), t.data.arguments = e.args.slice(1);
                        rd(t, {
                            input: e.args,
                            level: e.level
                        })
                    })), t.dom && (B("dom", (r = e, a = t.dom, function(e) {
                        let t, n;
                        if ((0, m.l)() !== r) return;
                        let l = "object" == typeof a ? a.serializeAttribute : void 0,
                            o = "object" == typeof a && "number" == typeof a.maxStringLength ? a.maxStringLength : void 0;
                        o && o > 1024 && (tg.f && y.h.warn("`dom.maxStringLength` cannot exceed ".concat(1024, ", but a value of ").concat(o, " was configured. Sentry will use ").concat(1024, " instead.")), o = 1024), "string" == typeof l && (l = [l]);
                        try {
                            var i;
                            let r = e.event,
                                a = (i = r) && i.target ? r.target : r;
                            t = (0, A.I)(a, {
                                keyAttrs: l,
                                maxStringLength: o
                            }), n = (0, A.w)(a)
                        } catch (e) {
                            t = "<unknown>"
                        }
                        if (0 === t.length) return;
                        let u = {
                            category: "ui.".concat(e.name),
                            message: t
                        };
                        n && (u.data = {
                            "ui.component_name": n
                        }), rd(u, {
                            event: e.event,
                            name: e.name,
                            global: e.global
                        })
                    })), H("dom", rp)), t.xhr && tI((l = e, function(e) {
                        if ((0, m.l)() !== l) return;
                        let {
                            startTimestamp: t,
                            endTimestamp: n
                        } = e, r = e.xhr[tO];
                        if (!t || !n || !r) return;
                        let {
                            method: a,
                            url: o,
                            status_code: i,
                            body: u
                        } = r, s = {
                            xhr: e.xhr,
                            input: u,
                            startTimestamp: t,
                            endTimestamp: n
                        }, c = {
                            category: "xhr",
                            data: {
                                method: a,
                                url: o,
                                status_code: i
                            },
                            type: "http",
                            level: rf(i)
                        };
                        l.emit("beforeOutgoingRequestBreadcrumb", c, s), rd(c, s)
                    })), t.fetch && t_((o = e, function(e) {
                        if ((0, m.l)() !== o) return;
                        let {
                            startTimestamp: t,
                            endTimestamp: n
                        } = e;
                        if (n && (!e.fetchData.url.match(/sentry_key/) || "POST" !== e.fetchData.method))
                            if (e.error) {
                                let r = {
                                        data: e.error,
                                        input: e.args,
                                        startTimestamp: t,
                                        endTimestamp: n
                                    },
                                    a = {
                                        category: "fetch",
                                        data: e.fetchData,
                                        level: "error",
                                        type: "http"
                                    };
                                o.emit("beforeOutgoingRequestBreadcrumb", a, r), rd(a, r)
                            } else {
                                let r = e.response,
                                    a = {
                                        ...e.fetchData,
                                        status_code: null == r ? void 0 : r.status
                                    },
                                    l = {
                                        input: e.args,
                                        response: r,
                                        startTimestamp: t,
                                        endTimestamp: n
                                    },
                                    i = {
                                        category: "fetch",
                                        data: a,
                                        type: "http",
                                        level: rf(a.status_code)
                                    };
                                o.emit("beforeOutgoingRequestBreadcrumb", i, l), rd(i, l)
                            }
                    })), t.history && ea((i = e, function(e) {
                        if ((0, m.l)() !== i) return;
                        let t = e.from,
                            n = e.to,
                            r = I(tv.b.location.href),
                            a = t ? I(t) : void 0,
                            l = I(n);
                        (null == a ? void 0 : a.path) || (a = r), r.protocol === l.protocol && r.host === l.host && (n = l.relative), r.protocol === a.protocol && r.host === a.host && (t = a.relative), rd({
                            category: "navigation",
                            data: {
                                from: t,
                                to: n
                            }
                        })
                    })), t.sentry && e.on("beforeSendEvent", (u = e, function(e) {
                        (0, m.l)() === u && rd({
                            category: "sentry.".concat("transaction" === e.type ? "transaction" : "event"),
                            event_id: e.event_id,
                            level: e.level,
                            message: (0, nh.N)(e)
                        }, {
                            event: e
                        })
                    }))
                }
            }
        },
        rg = "EventTarget,Window,Node,ApplicationCache,AudioTrackList,BroadcastChannel,ChannelMergerNode,CryptoOperation,EventSource,FileReader,HTMLUnknownElement,IDBDatabase,IDBRequest,IDBTransaction,KeyOperation,MediaController,MessagePort,ModalWindow,Notification,SVGElementInstance,Screen,SharedWorker,TextTrack,TextTrackCue,TextTrackList,WebSocket,WebSocketWorker,Worker,XMLHttpRequest,XMLHttpRequestEventTarget,XMLHttpRequestUpload".split(","),
        rv = function() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                t = {
                    XMLHttpRequest: !0,
                    eventTarget: !0,
                    requestAnimationFrame: !0,
                    setInterval: !0,
                    setTimeout: !0,
                    unregisterOriginalCallbacks: !1,
                    ...e
                };
            return {
                name: "BrowserApiErrors",
                setupOnce() {
                    t.setTimeout && (0, ee.Q)(tv.b, "setTimeout", ry), t.setInterval && (0, ee.Q)(tv.b, "setInterval", ry), t.requestAnimationFrame && (0, ee.Q)(tv.b, "requestAnimationFrame", rb), t.XMLHttpRequest && "XMLHttpRequest" in tv.b && (0, ee.Q)(XMLHttpRequest.prototype, "send", r_);
                    let e = t.eventTarget;
                    e && (Array.isArray(e) ? e : rg).forEach(e => {
                        var n, r, a, l;
                        let o;
                        return n = e, r = t, void((null == (o = null == (a = tv.b[n]) ? void 0 : a.prototype) || null == (l = o.hasOwnProperty) ? void 0 : l.call(o, "addEventListener")) && ((0, ee.Q)(o, "addEventListener", function(e) {
                            return function(t, a, l) {
                                var o, i, u, s;
                                try {
                                    o = a, "function" == typeof o.handleEvent && (a.handleEvent = (0, tv.$)(a.handleEvent, {
                                        mechanism: {
                                            data: {
                                                handler: (0, F.n)(a),
                                                target: n
                                            },
                                            handled: !1,
                                            type: "auto.browser.browserapierrors.handleEvent"
                                        }
                                    }))
                                } catch (e) {}
                                return r.unregisterOriginalCallbacks && (i = this, u = t, s = a, i && "object" == typeof i && "removeEventListener" in i && "function" == typeof i.removeEventListener && i.removeEventListener(u, s)), e.apply(this, [t, (0, tv.$)(a, {
                                    mechanism: {
                                        data: {
                                            handler: (0, F.n)(a),
                                            target: n
                                        },
                                        handled: !1,
                                        type: "auto.browser.browserapierrors.addEventListener"
                                    }
                                }), l])
                            }
                        }), (0, ee.Q)(o, "removeEventListener", function(e) {
                            return function(t, n, r) {
                                try {
                                    let a = n.__sentry_wrapped__;
                                    a && e.call(this, t, a, r)
                                } catch (e) {}
                                return e.call(this, t, n, r)
                            }
                        })))
                    })
                }
            }
        };

    function ry(e) {
        return function() {
            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
            let a = n[0];
            return n[0] = (0, tv.$)(a, {
                mechanism: {
                    handled: !1,
                    type: "auto.browser.browserapierrors.".concat((0, F.n)(e))
                }
            }), e.apply(this, n)
        }
    }

    function rb(e) {
        return function(t) {
            return e.apply(this, [(0, tv.$)(t, {
                mechanism: {
                    data: {
                        handler: (0, F.n)(e)
                    },
                    handled: !1,
                    type: "auto.browser.browserapierrors.requestAnimationFrame"
                }
            })])
        }
    }

    function r_(e) {
        return function() {
            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
            let a = this;
            return ["onload", "onerror", "onprogress", "onreadystatechange"].forEach(e => {
                e in a && "function" == typeof a[e] && (0, ee.Q)(a, e, function(t) {
                    let n = {
                            mechanism: {
                                data: {
                                    handler: (0, F.n)(t)
                                },
                                handled: !1,
                                type: "auto.browser.browserapierrors.xhr.".concat(e)
                            }
                        },
                        r = (0, ee.R)(t);
                    return r && (n.mechanism.data.handler = (0, F.n)(r)), (0, tv.$)(t, n)
                })
            }), e.apply(this, n)
        }
    }
    let rS = function() {
        var e;
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            n = null != (e = t.lifecycle) ? e : "route";
        return {
            name: "BrowserSession",
            setupOnce() {
                if (void 0 === tv.b.document) {
                    tg.f && y.h.warn("Using the `browserSessionIntegration` in non-browser environments is not supported.");
                    return
                }(0, tN.M)({
                    ignoreDuration: !0
                }), (0, tN.L)();
                let e = (0, m.V)(),
                    t = e.getUser();
                e.addScopeListener(e => {
                    let n = e.getUser();
                    ((null == t ? void 0 : t.id) !== (null == n ? void 0 : n.id) || (null == t ? void 0 : t.ip_address) !== (null == n ? void 0 : n.ip_address)) && ((0, tN.L)(), t = n)
                }), "route" === n && ea(e => {
                    let {
                        from: t,
                        to: n
                    } = e;
                    t !== n && ((0, tN.M)({
                        ignoreDuration: !0
                    }), (0, tN.L)())
                })
            }
        }
    };

    function rw(e, t) {
        var n;
        let r = null != (n = e.attributes) ? n : e.attributes = {};
        Object.entries(t).forEach(e => {
            let [t, n] = e;
            null == n || t in r || (r[t] = n)
        })
    }

    function rE() {
        try {
            let e = tv.b.Intl;
            if (!e) return;
            let t = e.DateTimeFormat().resolvedOptions();
            return {
                locale: t.locale,
                timezone: t.timeZone,
                calendar: t.calendar
            }
        } catch (e) {
            return
        }
    }
    e.i(650220);
    let rk = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            t = {
                onerror: !0,
                onunhandledrejection: !0,
                ...e
            };
        return {
            name: "GlobalHandlers",
            setupOnce() {
                Error.stackTraceLimit = 50
            },
            setup(e) {
                var n, r;
                t.onerror && (n = e, $(e => {
                    let {
                        stackParser: t,
                        attachStacktrace: r
                    } = rT();
                    if ((0, m.l)() !== n || (0, tv.d)()) return;
                    let {
                        msg: a,
                        url: l,
                        line: o,
                        column: i,
                        error: u
                    } = e, s = function(e, t, n, r) {
                        let a = e.exception = e.exception || {},
                            l = a.values = a.values || [],
                            o = l[0] = l[0] || {},
                            i = o.stacktrace = o.stacktrace || {},
                            u = i.frames = i.frames || [];
                        if (0 === u.length) {
                            var s;
                            u.push({
                                colno: r,
                                lineno: n,
                                filename: null != (s = function(e) {
                                    if ((0, tu.Z)(e) && 0 !== e.length) return e.startsWith("data:") ? "<".concat(M(e, !1), ">") : e
                                }(t)) ? s : (0, A.s)(),
                                function: F.z,
                                in_app: !0
                            })
                        }
                        return e
                    }(ru(t, u || a, void 0, r, !1), l, o, i);
                    s.level = "error", (0, tN.f)(s, {
                        originalException: u,
                        mechanism: {
                            handled: !1,
                            type: "auto.browser.global_handlers.onerror"
                        }
                    })
                }), rx("onerror")), t.onunhandledrejection && (r = e, G(e => {
                    var t;
                    let {
                        stackParser: n,
                        attachStacktrace: a
                    } = rT();
                    if ((0, m.l)() !== r || (0, tv.d)()) return;
                    let l = function(e) {
                            if ((0, tu.n)(e)) return e;
                            try {
                                if ("reason" in e) return e.reason;
                                if ("detail" in e && "reason" in e.detail) return e.detail.reason
                            } catch (e) {}
                            return e
                        }(e),
                        o = (0, tu.n)(l) ? (t = l, {
                            exception: {
                                values: [{
                                    type: "UnhandledRejection",
                                    value: "Non-Error promise rejection captured with value: ".concat(String(t))
                                }]
                            }
                        }) : ru(n, l, void 0, a, !0);
                    o.level = "error", (0, tN.f)(o, {
                        originalException: l,
                        mechanism: {
                            handled: !1,
                            type: "auto.browser.global_handlers.onunhandledrejection"
                        }
                    })
                }), rx("onunhandledrejection"))
            }
        }
    };

    function rx(e) {
        tg.f && y.h.log("Global Handler attached: ".concat(e))
    }

    function rT() {
        let e = (0, m.l)();
        return (null == e ? void 0 : e.getOptions()) || {
            stackParser: () => [],
            attachStacktrace: !1
        }
    }

    function rP(e) {
        return Array.isArray(e.errors)
    }

    function rC(e, t, n) {
        e.mechanism = {
            handled: !0,
            type: "auto.core.linked_errors",
            ...rP(n) && {
                is_exception_group: !0
            },
            ...e.mechanism,
            exception_id: t
        }
    }

    function rN(e, t, n, r) {
        e.mechanism = {
            handled: !0,
            ...e.mechanism,
            type: "chained",
            source: t,
            exception_id: n,
            parent_id: r
        }
    }
    let rR = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            t = e.limit || 5,
            n = e.key || "cause";
        return {
            name: "LinkedErrors",
            preprocessEvent(e, r, a) {
                ! function(e, t, n, r, a, l) {
                    var o;
                    if (!(null == (o = a.exception) ? void 0 : o.values) || !l || !(0, tu.v)(l.originalException, Error)) return;
                    let i = a.exception.values.length > 0 ? a.exception.values[a.exception.values.length - 1] : void 0;
                    i && (a.exception.values = function e(t, n, r, a, l, o, i, u) {
                        if (o.length >= r + 1) return o;
                        let s = [...o];
                        if ((0, tu.v)(a[l], Error)) {
                            rC(i, u, a);
                            let o = t(n, a[l]),
                                c = s.length;
                            rN(o, l, c, u), s = e(t, n, r, a[l], l, [o, ...s], o, c)
                        }
                        return rP(a) && a.errors.forEach((o, c) => {
                            if ((0, tu.v)(o, Error)) {
                                rC(i, u, a);
                                let d = t(n, o),
                                    f = s.length;
                                rN(d, "errors[".concat(c, "]"), f, u), s = e(t, n, r, o, l, [d, ...s], d, f)
                            }
                        }), s
                    }(e, t, r, l.originalException, n, a.exception.values, i, 0))
                }(rr, a.getOptions().stackParser, n, t, e, r)
            }
        }
    };

    function rA(e, t, n, r) {
        let a = {
            filename: e,
            function: "<anonymous>" === t ? F.z : t,
            in_app: !0
        };
        return void 0 !== n && (a.lineno = n), void 0 !== r && (a.colno = r), a
    }
    let rL = /^\s*at (\S+?)(?::(\d+))(?::(\d+))\s*$/i,
        rO = /^\s*at (?:(.+?\)(?: \[.+\])?|.*?) ?\((?:address at )?)?(?:async )?((?:<anonymous>|[-a-z]+:|.*bundle|\/)?.*?)(?::(\d+))?(?::(\d+))?\)?\s*$/i,
        rI = /\((\S*)(?::(\d+))(?::(\d+))\)/,
        rD = /at (.+?) ?\(data:(.+?),/,
        rM = [30, e => {
            let t = e.match(rD);
            if (t) return {
                filename: "<data:".concat(t[2], ">"),
                function: t[1]
            };
            let n = rL.exec(e);
            if (n) {
                let [, e, t, r] = n;
                return rA(e, F.z, +t, +r)
            }
            let r = rO.exec(e);
            if (r) {
                var a;
                if ((null == (a = r[2]) ? void 0 : a.indexOf("eval")) === 0) {
                    let e = rI.exec(r[2]);
                    e && (r[2] = e[1], r[3] = e[2], r[4] = e[3])
                }
                let [e, t] = rB(r[1] || F.z, r[2]);
                return rA(t, e, r[3] ? +r[3] : void 0, r[4] ? +r[4] : void 0)
            }
        }],
        rz = /^\s*(.*?)(?:\((.*?)\))?(?:^|@)?((?:[-a-z]+)?:\/.*?|\[native code\]|[^@]*(?:bundle|\d+\.js)|\/[\w\-. /=]+)(?::(\d+))?(?::(\d+))?\s*$/i,
        rF = /(\S+) line (\d+)(?: > eval line \d+)* > eval/i,
        rj = [50, e => {
            let t = rz.exec(e);
            if (t) {
                if (t[3] && t[3].indexOf(" > eval") > -1) {
                    let e = rF.exec(t[3]);
                    e && (t[1] = t[1] || "eval", t[3] = e[1], t[4] = e[2], t[5] = "")
                }
                let e = t[3],
                    n = t[1] || F.z;
                return [n, e] = rB(n, e), rA(e, n, t[4] ? +t[4] : void 0, t[5] ? +t[5] : void 0)
            }
        }],
        rU = (0, F.O)(rM, rj),
        rB = (e, t) => {
            let n = -1 !== e.indexOf("safari-extension"),
                r = -1 !== e.indexOf("safari-web-extension");
            return n || r ? [-1 !== e.indexOf("@") ? e.split("@")[0] : F.z, n ? "safari-extension:".concat(t) : "safari-web-extension:".concat(t)] : [e, t]
        },
        rH = {};

    function rq(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : function(e) {
                let t = rH[e];
                if (t) return t;
                let n = er[e];
                if (en(n)) return rH[e] = n.bind(er);
                let r = er.document;
                if (r && "function" == typeof r.createElement) try {
                    let t = r.createElement("iframe");
                    t.hidden = !0, r.head.appendChild(t);
                    let a = t.contentWindow;
                    (null == a ? void 0 : a[e]) && (n = a[e]), r.head.removeChild(t)
                } catch (t) {
                    ei && y.h.warn("Could not create sandbox iframe for ".concat(e, " check, bailing to window.").concat(e, ": "), t)
                }
                return n ? rH[e] = n.bind(er) : n
            }("fetch"),
            n = 0,
            r = 0;
        async function a(a) {
            let l = a.body.length;
            n += l, r++;
            let o = {
                body: a.body,
                method: "POST",
                referrerPolicy: "strict-origin",
                headers: e.headers,
                keepalive: n <= 6e4 && r < 15,
                ...e.fetchOptions
            };
            try {
                let n = await t(e.url, o);
                return {
                    statusCode: n.status,
                    headers: {
                        "x-sentry-rate-limits": n.headers.get("X-Sentry-Rate-Limits"),
                        "retry-after": n.headers.get("Retry-After")
                    }
                }
            } catch (e) {
                throw rH.fetch = void 0, e
            } finally {
                n -= l, r--
            }
        }
        return function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : nH(e.bufferSize || 64),
                r = {};
            return {
                send: function(a) {
                    let l = [];
                    if ((0, nL.E)(a, (t, n) => {
                            let a = (0, nL.h)(n);
                            ! function(e, t) {
                                let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : (0, nq.D)();
                                return (e[t] || e.all || 0) > n
                            }(r, a) ? l.push(t): e.recordDroppedEvent("ratelimit_backoff", a)
                        }), 0 === l.length) return Promise.resolve({});
                    let o = (0, nL.H)(a[0], l),
                        i = t => {
                            if ((0, nL.Q)(o, ["client_report"])) {
                                g.f && y.h.warn("Dropping client report. Will not send outcomes (reason: ".concat(t, ")."));
                                return
                            }(0, nL.E)(o, (n, r) => {
                                e.recordDroppedEvent(t, (0, nL.h)(r))
                            })
                        };
                    return n.add(() => t({
                        body: (0, nL.k)(o)
                    }).then(e => (413 === e.statusCode ? (g.f && y.h.error("Sentry responded with status code 413. Envelope was discarded due to exceeding size limits."), i("send_error")) : (g.f && void 0 !== e.statusCode && (e.statusCode < 200 || e.statusCode >= 300) && y.h.warn("Sentry responded with status code ".concat(e.statusCode, " to sent event.")), r = function(e, t) {
                        let {
                            statusCode: n,
                            headers: r
                        } = t, a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : (0, nq.D)(), l = {
                            ...e
                        }, o = null == r ? void 0 : r["x-sentry-rate-limits"], i = null == r ? void 0 : r["retry-after"];
                        if (o)
                            for (let e of o.trim().split(",")) {
                                let [t, n, , , r] = e.split(":", 5), o = parseInt(t, 10), i = (isNaN(o) ? 60 : o) * 1e3;
                                if (n)
                                    for (let e of n.split(";")) "metric_bucket" === e ? (!r || r.split(";").includes("custom")) && (l[e] = a + i) : l[e] = a + i;
                                else l.all = a + i
                            } else i ? l.all = a + function(e) {
                                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : (0, nq.D)(),
                                    n = parseInt("".concat(e), 10);
                                if (!isNaN(n)) return 1e3 * n;
                                let r = Date.parse("".concat(e));
                                return isNaN(r) ? 6e4 : r - t
                            }(i, a) : 429 === n && (l.all = a + 6e4);
                        return l
                    }(r, e)), e), e => {
                        throw i("network_error"), g.f && y.h.error("Encountered error running transport request:", e), e
                    })).then(e => e, e => {
                        if (e === nB) return g.f && y.h.error("Skipped sending event because buffer is full."), i("queue_overflow"), Promise.resolve({});
                        throw e
                    })
                },
                flush: e => n.drain(e)
            }
        }(e, a, nH(e.bufferSize || 40))
    }

    function rW(e) {
        let t;
        return [nS(), {
            name: "FunctionToString",
            setupOnce() {
                s = Function.prototype.toString;
                try {
                    Function.prototype.toString = function() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        let r = (0, ee.R)(this),
                            a = nk.has((0, m.l)()) && void 0 !== r ? r : this;
                        return s.apply(a, t)
                    }
                } catch (e) {}
            },
            setup(e) {
                nk.set(e, !0)
            }
        }, {
            name: "ConversationId",
            setup(e) {
                e.on("spanStart", e => {
                    let t = (0, m.d)().getScopeData(),
                        n = (0, m.V)().getScopeData(),
                        r = t.conversationId || n.conversationId;
                    if (r) {
                        let {
                            op: t,
                            data: n,
                            description: a
                        } = (0, w.l)(e);
                        if (!(null == t ? void 0 : t.startsWith("gen_ai.")) && !n["ai.operationId"] && !(null == a ? void 0 : a.startsWith("ai."))) return;
                        e.setAttribute(v.E, r)
                    }
                })
            }
        }, rv(), rm(), rk(), rR(), {
            name: "Dedupe",
            processEvent(e) {
                if (e.type) return e;
                try {
                    var n, r, a, l, o, i;
                    let u, s, c, d;
                    if (n = e, (r = t) && (a = n, l = r, u = a.message, s = l.message, (u || s) && (!u || s) && (u || !s) && u === s && nT(a, l) && nx(a, l) && 1 || (o = n, c = nP(i = r), d = nP(o), c && d && c.type === d.type && c.value === d.value && nT(o, i) && nx(o, i)))) return g.f && y.h.warn("Event dropped due to being a duplicate of previously captured event."), null
                } catch (e) {}
                return t = e
            }
        }, {
            name: "HttpContext",
            preprocessEvent(e) {
                var t;
                if (!tv.b.navigator && !tv.b.location && !tv.b.document) return;
                let n = (0, tv.J)(),
                    r = {
                        ...n.headers,
                        ...null == (t = e.request) ? void 0 : t.headers
                    };
                e.request = {
                    ...n,
                    ...e.request,
                    headers: r
                }
            },
            processSegmentSpan(e) {
                if (!tv.b.navigator && !tv.b.location && !tv.b.document) return;
                let t = (0, tv.J)();
                rw(e, {
                    "url.full": t.url || void 0,
                    "http.request.header.user_agent": t.headers["User-Agent"],
                    "http.request.header.referer": t.headers.Referer
                })
            }
        }, {
            name: "CultureContext",
            preprocessEvent(e) {
                let t = rE();
                if (t) {
                    var n;
                    e.contexts = {
                        ...e.contexts,
                        culture: {
                            ...t,
                            ...null == (n = e.contexts) ? void 0 : n.culture
                        }
                    }
                }
            },
            processSegmentSpan(e) {
                let t = rE();
                t && rw(e, {
                    "culture.locale": t.locale,
                    "culture.timezone": t.timezone,
                    "culture.calendar": t.calendar
                })
            }
        }, rS()]
    }
    var r$ = e.i(643766);
    let rV = /^(\S+:\\|\/?)([\s\S]*?)((?:\.{1,2}|[^/\\]+?|)(\.[^./\\]*|))(?:[/\\]*)$/;

    function rQ() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        let r = "",
            a = !1;
        for (let e = t.length - 1; e >= -1 && !a; e--) {
            let n = e >= 0 ? t[e] : "/";
            n && (r = "".concat(n, "/").concat(r), a = "/" === n.charAt(0))
        }
        return r = (function(e, t) {
            let n = 0;
            for (let t = e.length - 1; t >= 0; t--) {
                let r = e[t];
                "." === r ? e.splice(t, 1) : ".." === r ? (e.splice(t, 1), n++) : n && (e.splice(t, 1), n--)
            }
            if (t)
                for (; n--;) e.unshift("..");
            return e
        })(r.split("/").filter(e => !!e), !a).join("/"), (a ? "/" : "") + r || "."
    }

    function rG(e) {
        let t = 0;
        for (; t < e.length && "" === e[t]; t++);
        let n = e.length - 1;
        for (; n >= 0 && "" === e[n]; n--);
        return t > n ? [] : e.slice(t, n - t + 1)
    }
    let rY = function() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                t = e.root,
                n = e.prefix || "app:///",
                r = "window" in z.f && !!z.f.window,
                a = e.iteratee || function(e) {
                    let {
                        isBrowser: t,
                        root: n,
                        prefix: r
                    } = e;
                    return e => {
                        if (!e.filename) return e;
                        let a = /^[a-zA-Z]:\\/.test(e.filename) || e.filename.includes("\\") && !e.filename.includes("/"),
                            l = /^\//.test(e.filename);
                        if (t) {
                            if (n) {
                                let t = e.filename;
                                0 === t.indexOf(n) && (e.filename = t.replace(n, r))
                            }
                        } else if (a || l) {
                            let t, l, o = a ? e.filename.replace(/^[a-zA-Z]:/, "").replace(/\\/g, "/") : e.filename,
                                i = n ? function(e, t) {
                                    e = rQ(e).slice(1), t = rQ(t).slice(1);
                                    let n = rG(e.split("/")),
                                        r = rG(t.split("/")),
                                        a = Math.min(n.length, r.length),
                                        l = a;
                                    for (let e = 0; e < a; e++)
                                        if (n[e] !== r[e]) {
                                            l = e;
                                            break
                                        } let o = [];
                                    for (let e = l; e < n.length; e++) o.push("..");
                                    return (o = o.concat(r.slice(l))).join("/")
                                }(n, o) : (t = o.length > 1024 ? "<truncated>".concat(o.slice(-1024)) : o, (l = rV.exec(t)) ? l.slice(1) : [])[2] || "";
                            e.filename = "".concat(r).concat(i)
                        }
                        return e
                    }
                }({
                    isBrowser: r,
                    root: t,
                    prefix: n
                });
            return {
                name: "RewriteFrames",
                processEvent(e) {
                    let t = e;
                    return e.exception && Array.isArray(e.exception.values) && (t = function(e) {
                        try {
                            return {
                                ...e,
                                exception: {
                                    ...e.exception,
                                    values: e.exception.values.map(e => {
                                        var t, n;
                                        return {
                                            ...e,
                                            ...e.stacktrace && {
                                                stacktrace: {
                                                    ...t = e.stacktrace,
                                                    frames: null == t || null == (n = t.frames) ? void 0 : n.map(e => a(e))
                                                }
                                            }
                                        }
                                    })
                                }
                            }
                        } catch (t) {
                            return e
                        }
                    }(t)), t
                }
            }
        },
        rX = new class {
            get size() {
                return this._cache.size
            }
            get(e) {
                let t = this._cache.get(e);
                if (void 0 !== t) return this._cache.delete(e), this._cache.set(e, t), t
            }
            set(e, t) {
                if (this._cache.size >= this._maxSize) {
                    let e = this._cache.keys().next().value;
                    this._cache.delete(e)
                }
                this._cache.set(e, t)
            }
            remove(e) {
                let t = this._cache.get(e);
                return t && this._cache.delete(e), t
            }
            clear() {
                this._cache.clear()
            }
            keys() {
                return Array.from(this._cache.keys())
            }
            values() {
                let e = [];
                return this._cache.forEach(t => e.push(t)), e
            }
            constructor(e) {
                this._maxSize = e, this._cache = new Map
            }
        }(100),
        rK = z.f,
        rJ = !1,
        rZ = z.f,
        r0 = "flag.evaluation.",
        r1 = () => ({
            name: "FeatureFlags",
            processEvent: (e, t, n) => (function(e) {
                if (e.type) return e;
                let t = (0, m.d)().getScopeData().contexts.flags,
                    n = t ? t.values : [];
                return n.length && (void 0 === e.contexts && (e.contexts = {}), e.contexts.flags = {
                    values: [...n]
                }), e
            })(e),
            addFeatureFlag(e, t) {
                ! function(e, t) {
                    let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 100,
                        r = (0, m.d)().getScopeData().contexts;
                    r.flags || (r.flags = {
                            values: []
                        }),
                        function(e, t, n, r) {
                            if ("boolean" != typeof n) return;
                            if (e.length > r) {
                                g.f && y.h.error("[Feature Flags] insertToFlagBuffer called on a buffer larger than maxSize=".concat(r));
                                return
                            }
                            let a = e.findIndex(e => e.flag === t); - 1 !== a && e.splice(a, 1), e.length === r && e.shift(), e.push({
                                flag: t,
                                result: n
                            })
                        }(r.flags.values, e, t, n)
                }(e, t),
                function(e, t) {
                    let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 10;
                    if ("boolean" != typeof t) return;
                    let r = (0, w.j)();
                    if (!r) return;
                    let a = (0, w.l)(r).data;
                    "".concat(r0).concat(e) in a ? r.setAttribute("".concat(r0).concat(e), t) : Object.keys(a).filter(e => e.startsWith(r0)).length < n && r.setAttribute("".concat(r0).concat(e), t)
                }(e, t)
            }
        }),
        r2 = ["roblox.com", "sitetest1.robloxlabs.com", "sitetest2.robloxlabs.com", "sitetest3.robloxlabs.com", "robloxdev.cn"];
    globalThis._sentryRouteManifest = '{"isrRoutes":[],"dynamicRoutes":[],"staticRoutes":[]}', globalThis._sentryNextJsVersion = "16.4.5",
        function(e) {
            let {
                ignoreErrors: t = [],
                integrations: n = [],
                ...r
            } = e;
            ! function(e) {
                let t, n, r, a, l;
                rJ && (0, y.D)(() => {
                    console.warn("[@sentry/nextjs] You are calling `Sentry.init()` more than once on the client. This can happen if you have both a `sentry.client.config.ts` and a `instrumentation-client.ts` file with `Sentry.init()` calls. It is recommended to call `Sentry.init()` once in `instrumentation-client.ts`.")
                }), rJ = !0, !tK && e.debug && (0, y.D)(() => {
                    console.warn("[@sentry/nextjs] You have enabled `debug: true`, but Sentry debug logging was removed from your bundle (likely via `withSentryConfig({ disableLogger: true })` / `webpack.treeshake.removeDebugLogging: true`). Set that option to `false` to see Sentry debug output.")
                }), ("u" < typeof __SENTRY_TRACING__ || __SENTRY_TRACING__) && function() {
                    tv.b.document && function(e) {
                        let t = t6(e) || e,
                            n = rX.get(t);
                        if (void 0 !== n) return n;
                        let r = t4();
                        if (!(null == r ? void 0 : r.isrRoutes) || !Array.isArray(r.isrRoutes) || 0 === r.isrRoutes.length) return rX.set(t, !1), !1;
                        let a = r.isrRoutes.includes(t);
                        return rX.set(t, a), a
                    }(tv.b.location.pathname) && (e("sentry-trace"), e("baggage"));

                    function e(e) {
                        try {
                            let t = tv.b.document.querySelector('meta[name="'.concat(e, '"]'));
                            t && t.remove()
                        } catch (e) {}
                    }
                }();
                let o = {
                    environment: e.environment || h.default.env.SENTRY_ENVIRONMENT || ((t = h.default.env.NEXT_PUBLIC_VERCEL_ENV) ? "vercel-".concat(t) : void 0) || "production",
                    defaultIntegrations: (r = rW(e), ("u" < typeof __SENTRY_TRACING__ || __SENTRY_TRACING__) && r.push(ni()), a = h.default.env._sentryBasePath || rZ._sentryBasePath, l = "true" === h.default.env._experimentalThirdPartyOriginStackFrames || "true" === rZ._experimentalThirdPartyOriginStackFrames, r.push((e => {
                        let {
                            assetPrefix: t,
                            basePath: n,
                            rewriteFramesAssetPrefixPath: r,
                            experimentalThirdPartyOriginStackFrames: a
                        } = e;
                        return {
                            ...rY({
                                iteratee: e => {
                                    var l, o, i, u, s, c, d, f;
                                    if (a) {
                                        let r = "u" > typeof window && window.location ? window.location.origin : "";
                                        if ((null == (l = e.filename) ? void 0 : l.startsWith(r)) && !e.filename.endsWith(".js")) return e;
                                        if (t)(null == (o = e.filename) ? void 0 : o.startsWith(t)) && (e.filename = e.filename.replace(t, "app://"));
                                        else if (n) try {
                                            let {
                                                origin: t
                                            } = new URL(e.filename);
                                            t === r && (e.filename = null == (i = e.filename) ? void 0 : i.replace(t, "app://").replace(n, ""))
                                        } catch (e) {}
                                    } else try {
                                        let {
                                            origin: t
                                        } = new URL(e.filename);
                                        e.filename = null == (u = e.filename) ? void 0 : u.replace(t, "app://").replace(r, "")
                                    } catch (e) {}
                                    return a ? ((null == (s = e.filename) ? void 0 : s.includes("/_next")) && (e.filename = decodeURI(e.filename)), (null == (c = e.filename) ? void 0 : c.match(/\/_next\/static\/chunks\/(main-|main-app-|polyfills-|webpack-|framework-|framework\.)[0-9a-f]+\.js$/)) && (e.in_app = !1)) : ((null == (d = e.filename) ? void 0 : d.startsWith("app:///_next")) && (e.filename = decodeURI(e.filename)), (null == (f = e.filename) ? void 0 : f.match(/^app:\/\/\/_next\/static\/chunks\/(main-|main-app-|polyfills-|webpack-|framework-|framework\.)[0-9a-f]+\.js$/)) && (e.in_app = !1)), e
                                }
                            }),
                            name: "NextjsClientStackFrameNormalization"
                        }
                    })({
                        assetPrefix: "https://assets.create.roblox.com/dea85e59b76ad172160a6753a6bf9008dac07d11",
                        basePath: a,
                        rewriteFramesAssetPrefixPath: "/dea85e59b76ad172160a6753a6bf9008dac07d11",
                        experimentalThirdPartyOriginStackFrames: l
                    })), r),
                    release: "Hub-dea85e59b76ad172160a6753a6bf9008dac07d11",
                    ...e
                };
                ! function(e) {
                    let t = h.default.env._sentryRewritesTunnelPath || rK._sentryRewritesTunnelPath;
                    if (t && e.dsn) {
                        let n = (0, nA.o)(e.dsn);
                        if (!n) return;
                        let r = n.host.match(/^o(\d+)\.ingest(?:\.([a-z]{2}))?\.sentry\.io$/);
                        if (r) {
                            let a = r[1],
                                l = r[2],
                                o = "".concat(t, "?o=").concat(a, "&p=").concat(n.projectId);
                            l && (o += "&r=".concat(l)), e.tunnel = o, tK && y.h.log('Tunneling events to "'.concat(o, '"'))
                        } else tK && y.h.warn("Provided DSN is not a Sentry SaaS DSN. Will not tunnel events.")
                    }
                }(o), nv(o, "nextjs", ["nextjs", "react"]), o.ignoreSpans = [...o.ignoreSpans || [], /^\/404$/, new RegExp("^".concat(t5, "$"))], nv(n = {
                        ...o
                    }, "react"), (0, tN.g)("react", {
                        version: r$.version
                    }),
                    function() {
                        var e;
                        let t, n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                            r = !n.skipBrowserExtensionCheck && !! function() {
                                var e;
                                if (void 0 === tv.b.window) return !1;
                                let t = tv.b;
                                if (t.nw) return !1;
                                let n = t.chrome || t.browser;
                                if (!(null == n || null == (e = n.runtime) ? void 0 : e.id)) return !1;
                                let r = (0, A.s)();
                                return !(tv.b === tv.b.top && /^(?:chrome-extension|moz-extension|ms-browser-extension|safari-web-extension):\/\//.test(r))
                            }() && (tg.f && (0, y.D)(() => {
                                console.error("[Sentry] You cannot use Sentry.init() in a browser extension, see: https://docs.sentry.io/platforms/javascript/best-practices/browser-extensions/")
                            }), !0),
                            a = null == n.defaultIntegrations ? rW() : n.defaultIntegrations,
                            l = {
                                ...n,
                                enabled: !r && n.enabled,
                                stackParser: (0, F.E)(n.stackParser || rU),
                                integrations: function(e) {
                                    let t, n, r = e.defaultIntegrations || [],
                                        a = e.integrations;
                                    if (r.forEach(e => {
                                            e.isDefaultInstance = !0
                                        }), Array.isArray(a)) t = [...r, ...a];
                                    else if ("function" == typeof a) {
                                        let e = a(r);
                                        t = Array.isArray(e) ? e : [e]
                                    } else t = r;
                                    return n = {}, t.forEach(e => {
                                        let {
                                            name: t
                                        } = e, r = n[t];
                                        r && !r.isDefaultInstance && e.isDefaultInstance || (n[t] = e)
                                    }), Object.values(n)
                                }({
                                    integrations: n.integrations,
                                    defaultIntegrations: a
                                }),
                                transport: n.transport || rq
                            };
                        !0 === l.debug && (g.f ? y.h.enable() : (0, y.D)(() => {
                            console.warn("[Sentry] Cannot initialize SDK with `debug` option using a non-debug bundle.")
                        })), (0, m.d)().update(l.initialScope), e = t = new rc(l), (0, m.d)().setClient(e), t.init()
                    }(n);
                let i = (e, t) => {
                    var n, r, a, l;
                    return (l = null == t ? void 0 : t.originalException, (0, tu.b)(l) && "string" == typeof l.digest && l.digest.startsWith("NEXT_REDIRECT;") || (null == (a = e.exception) || null == (r = a.values) || null == (n = r[0]) ? void 0 : n.value) === "NEXT_REDIRECT") ? null : e
                };
                i.id = "NextRedirectErrorFilter", (0, tN.A)(i);
                try {
                    (0, m.J)().setTag("turbopack", !0)
                } catch (e) {}
            }({
                sampleRate: .5,
                sendDefaultPii: !0,
                ...r,
                integrations: Array.isArray(n) ? [...n, r1()] : e => [...n(e), r1()],
                denyUrls: [/extensions\//i, /^chrome(-extensions?)?:\/\//i],
                ignoreErrors: [...t, "window.Roblox.Hybrid", "route change was aborted", "Refused to evaluate a string as JavaScript because 'unsafe-eval' is not an allowed source of script in the following Content Security Policy directive:", "Blocking route change for unsaved changes", "Failed to execute 'querySelectorAll' on 'Document': 'div:has(> iframe[id='198230182308109283091823098102938908128390'])' is not a valid selector.", "Failed to execute 'send' on 'XMLHttpRequest': Failed to load 'https://searchaggr-dra.dt.dbankcloud.com/search/api/v1/webtranslation_detect'.", "Invariant: attempted to hard navigate to the same URL", "Failed to fetch", "Load failed", "انتهت مهلة الطلب", "cancelado", "cancelled", "مُلغى", "Can't find variable: msDiscoverChatAvailable", /Refused to create a WebAssembly object/, /^\[object \w+\]$/],
                beforeSend: (e, t) => {
                    var n, r, a, l, o;
                    let [i] = null != (n = null == (a = e.exception) ? void 0 : a.values) ? n : [], {
                        frames: u
                    } = null != (r = null == i ? void 0 : i.stacktrace) ? r : {};
                    if ((null == u ? void 0 : u.every(e => !e.filename || "<anonymous>" === e.filename || "[native code]" === e.filename)) || (null == u ? void 0 : u.every(e => !e.filename || !e.filename.endsWith(".js") || e.filename.startsWith("./node_modules/@sentry/browser")))) return null;
                    let s = t.originalException;
                    if ("u" > typeof HTMLScriptElement && s instanceof Event && "error" === s.type && s.target instanceof HTMLScriptElement && s.target.getAttribute("src")) try {
                        let t = new URL(s.target.src);
                        ("https:" === t.protocol || "http:" === t.protocol) && (e.contexts = {
                            ...e.contexts,
                            script_load_error: {
                                ...null == (l = e.contexts) ? void 0 : l.script_load_error,
                                src: "".concat(t.origin).concat(t.pathname)
                            }
                        })
                    } catch (e) {}
                    if (function(e) {
                            if ("object" != typeof e || null === e || !("name" in e) || "ResponseError" !== e.name || !("response" in e)) return !1;
                            let {
                                response: t
                            } = e;
                            return "object" == typeof t && null !== t && "url" in t && "string" == typeof t.url
                        }(s)) {
                        let t = null == (o = s.response) ? void 0 : o.status;
                        if (401 === t || 403 === t || 404 === t) return null;
                        let n = function(e) {
                            let t;
                            try {
                                t = new URL(e)
                            } catch (e) {
                                return null
                            }
                            let {
                                hostname: n,
                                pathname: r
                            } = t;
                            if (!r2.some(e => n === e || n.endsWith(".".concat(e)))) return null;
                            if (n.startsWith("apis.")) return r.split("/")[1] || null;
                            let a = r2.find(e => n.endsWith(".".concat(e)));
                            return a && n.slice(0, -(a.length + 1)).split(".")[0] || null
                        }(s.response.url);
                        null !== n && (e.fingerprint = ["{{ default }}", n])
                    }
                    return e
                }
            })
        }({
            environment: "production",
            enabled: !0,
            release: "Hub-dea85e59b76ad172160a6753a6bf9008dac07d11",
            dsn: "https://2c039001a72b4824851c1b3f71ce1f8f@o293668.ingest.sentry.io/5337301",
            allowUrls: [/https?:\/\/create\.roblox\.com/, /https?:\/\/create\.sitetest1\.robloxlabs\.com/, /https?:\/\/assets\.create\.roblox\.com/, /https?:\/\/assets\.create\.sitetest1\.robloxlabs\.com/],
            ...{
                integrations: [ni({
                    instrumentNavigation: !0,
                    instrumentPageLoad: !0
                }), function() {
                    var e;
                    let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        n = t.levels || y.u,
                        r = null == (e = t.handled) || e;
                    return {
                        name: "CaptureConsole",
                        setup(e) {
                            "console" in z.f && ns(t => {
                                var a, l, o;
                                let i, u, s, {
                                    args: c,
                                    level: d
                                } = t;
                                (0, m.l)() === e && n.includes(d) && (a = c, l = d, o = r, i = nm(l), u = Error(), s = {
                                    level: nm(l),
                                    extra: {
                                        arguments: a
                                    }
                                }, (0, m.h)(e => {
                                    if (e.addEventProcessor(e => (e.logger = "console", (0, nh.o)(e, {
                                            handled: o,
                                            type: "auto.core.capture_console"
                                        }), e)), "assert" === l) {
                                        if (!a[0]) {
                                            let t = "Assertion failed: ".concat((0, ti.c)(a.slice(1), " ") || "console.assert");
                                            e.setExtra("arguments", a.slice(1)), e.captureMessage(t, i, {
                                                captureContext: s,
                                                syntheticException: u
                                            })
                                        }
                                        return
                                    }
                                    let t = a.find(e => e instanceof Error);
                                    if (t) return void(0, tN.y)(t, s);
                                    let n = (0, ti.c)(a, " ");
                                    e.captureMessage(n, i, {
                                        captureContext: s,
                                        syntheticException: u
                                    })
                                }))
                            })
                        }
                    }
                }({
                    levels: ["error"]
                })],
                tracesSampler: e => {
                    var t;
                    return void 0 !== e.parentSampled ? e.parentSampled : +(null != (t = e.attributes) && !!t.sentryTracingEnabled)
                }
            }
        }), e.s([], 171908)
}]);

//# debugId=a6538fca-a235-d0fa-4407-60e44b4746bf
//# sourceMappingURL=33ckrm6otk4hm.js.map
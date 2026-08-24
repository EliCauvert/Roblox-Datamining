;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "c5f09c5e-f0ee-1a7c-2511-05200cb17331")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 793236, (e, t, r) => {
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
        return this.then(function(r) {
            return t.resolve(e()).then(function() {
                return r
            })
        }, function(r) {
            return t.resolve(e()).then(function() {
                throw r
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
}, 447551, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        default: function() {
            return u
        },
        isEqualNode: function() {
            return i
        }
    };
    for (var o in n) Object.defineProperty(r, o, {
        enumerable: !0,
        get: n[o]
    });
    let a = e.r(304371);

    function i(e, t) {
        if (e instanceof HTMLElement && t instanceof HTMLElement) {
            let r = t.getAttribute("nonce");
            if (r && !e.getAttribute("nonce")) {
                let n = t.cloneNode(!0);
                return n.setAttribute("nonce", ""), n.nonce = r, r === e.nonce && e.isEqualNode(n)
            }
        }
        return e.isEqualNode(t)
    }

    function u() {
        return {
            mountedInstances: new Set,
            updateHead: e => {
                let t = {};
                e.forEach(e => {
                    if ("link" === e.type && e.props["data-optimized-fonts"])
                        if (document.querySelector('style[data-href="'.concat(e.props["data-href"], '"]'))) return;
                        else e.props.href = e.props["data-href"], e.props["data-href"] = void 0;
                    let r = t[e.type] || [];
                    r.push(e), t[e.type] = r
                });
                let r = t.title ? t.title[0] : null,
                    n = "";
                if (r) {
                    let {
                        children: e
                    } = r.props;
                    n = "string" == typeof e ? e : Array.isArray(e) ? e.join("") : ""
                }
                n !== document.title && (document.title = n), ["meta", "base", "link", "style", "script"].forEach(e => {
                    ! function(e, t) {
                        let r = document.querySelector("head");
                        if (!r) return;
                        let n = new Set(r.querySelectorAll("".concat(e, "[data-next-head]")));
                        if ("meta" === e) {
                            let e = r.querySelector("meta[charset]");
                            null !== e && n.add(e)
                        }
                        let o = [];
                        for (let e = 0; e < t.length; e++) {
                            let r = function(e) {
                                let {
                                    type: t,
                                    props: r
                                } = e, n = document.createElement(t);
                                (0, a.setAttributesFromProps)(n, r);
                                let {
                                    children: o,
                                    dangerouslySetInnerHTML: i
                                } = r;
                                return i ? n.innerHTML = i.__html || "" : o && (n.textContent = "string" == typeof o ? o : Array.isArray(o) ? o.join("") : ""), n
                            }(t[e]);
                            r.setAttribute("data-next-head", "");
                            let u = !0;
                            for (let e of n)
                                if (i(e, r)) {
                                    n.delete(e), u = !1;
                                    break
                                } u && o.push(r)
                        }
                        for (let e of n) {
                            var u;
                            null == (u = e.parentNode) || u.removeChild(e)
                        }
                        for (let e of o) "meta" === e.tagName.toLowerCase() && null !== e.getAttribute("charset") && r.prepend(e), r.appendChild(e)
                    }(e, t[e] || [])
                })
            }
        }
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 343690, (e, t, r) => {
    "use strict";
    let n, o, a, i, u, l, s, c, f, d, _, p;
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var E = {
        emitter: function() {
            return G
        },
        hydrate: function() {
            return ed
        },
        initialize: function() {
            return q
        },
        router: function() {
            return n
        },
        version: function() {
            return H
        }
    };
    for (var m in E) Object.defineProperty(r, m, {
        enumerable: !0,
        get: E[m]
    });
    let h = e.r(2879),
        R = e.r(221628);
    e.r(793236);
    let T = h._(e.r(416340)),
        S = h._(e.r(851670)),
        P = e.r(4063),
        A = h._(e.r(570613)),
        y = e.r(35391),
        b = e.r(868795),
        O = e.r(990761),
        I = e.r(788081),
        g = e.r(396326),
        N = e.r(272845),
        v = h._(e.r(447551)),
        M = h._(e.r(70274)),
        C = e.r(598424),
        L = e.r(761438),
        D = e.r(641322),
        j = e.r(424204),
        w = e.r(295753),
        x = e.r(704278),
        U = e.r(419810),
        F = e.r(845290),
        B = e.r(956959),
        k = e.r(701485);
    e.r(604029), e.r(248643);
    let H = "16.3.0",
        G = (0, A.default)(),
        W = !1;
    class X extends T.default.Component {
        componentDidCatch(e, t) {
            this.props.fn(e, t)
        }
        componentDidMount() {
            this.scrollToHash(), n.isSsr && (o.isFallback || o.nextExport && ((0, O.isDynamicRoute)(n.pathname) || location.search || 1) || o.props && o.props.__N_SSG && (location.search || 1)) && n.replace(n.pathname + "?" + String((0, I.assign)((0, I.urlQueryToSearchParams)(n.query), new URLSearchParams(location.search))), a, {
                _h: 1,
                shallow: !o.isFallback && !W
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
    async function q() {
        arguments.length > 0 && void 0 !== arguments[0] && arguments[0], o = JSON.parse(document.getElementById("__NEXT_DATA__").textContent), window.__NEXT_DATA__ = o, p = o.defaultLocale;
        let t = o.assetPrefix || "";
        if (self.__next_set_public_path__("".concat(t, "/_next/")), a = (0, g.getURL)(), (0, x.hasBasePath)(a) && (a = (0, w.removeBasePath)(a)), o.scriptLoader) {
            let {
                initScriptLoader: t
            } = e.r(596517);
            t(o.scriptLoader)
        }
        i = new M.default(o.buildId, t);
        let r = e => {
            let [t, r] = e;
            return i.routeLoader.onEntrypoint(t, r)
        };
        return window.__NEXT_P && window.__NEXT_P.map(e => setTimeout(() => r(e), 0)), window.__NEXT_P = [], window.__NEXT_P.push = r, (l = (0, v.default)()).getIsSsr = () => n.isSsr, u = document.getElementById("__next"), {
            assetPrefix: t
        }
    }

    function Y(e, t) {
        return (0, R.jsx)(e, {
            ...t
        })
    }

    function V(e) {
        var t;
        let {
            children: r
        } = e, o = T.default.useMemo(() => (0, F.adaptForAppRouterInstance)(n), []);
        return (0, R.jsx)(X, {
            fn: e => K({
                App: f,
                err: e
            }).catch(e => console.error("Error rendering page: ", e)),
            children: (0, R.jsx)(U.AppRouterContext.Provider, {
                value: o,
                children: (0, R.jsx)(B.SearchParamsContext.Provider, {
                    value: (0, F.adaptForSearchParams)(n),
                    children: (0, R.jsx)(F.PathnameContextProviderAdapter, {
                        router: n,
                        isAutoExport: null != (t = self.__NEXT_DATA__.autoExport) && t,
                        children: (0, R.jsx)(B.PathParamsContext.Provider, {
                            value: (0, F.adaptForPathParams)(n),
                            children: (0, R.jsx)(y.RouterContext.Provider, {
                                value: (0, L.makePublicRouterInstance)(n),
                                children: (0, R.jsx)(P.HeadManagerContext.Provider, {
                                    value: l,
                                    children: (0, R.jsx)(j.ImageConfigContext.Provider, {
                                        value: {
                                            deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
                                            imageSizes: [32, 48, 64, 96, 128, 256, 384],
                                            qualities: [75],
                                            path: "/_next/image",
                                            loader: "default",
                                            dangerouslyAllowSVG: !1,
                                            unoptimized: !1
                                        },
                                        children: r
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })
    }
    let z = e => t => {
        let r = {
            ...t,
            Component: _,
            err: o.err,
            router: n
        };
        return (0, R.jsx)(V, {
            children: Y(e, r)
        })
    };

    function K(t) {
        let {
            App: r,
            err: u
        } = t;
        return console.error(u), console.error("A client-side exception has occurred, see here for more info: https://nextjs.org/docs/messages/client-side-exception-occurred"), i.loadPage("/_error").then(n => {
            let {
                page: o,
                styleSheets: a
            } = n;
            return (null == s ? void 0 : s.Component) === o ? e.A(378337).then(n => e.A(320375).then(e => (t.App = r = e.default, n))).then(e => ({
                ErrorComponent: e.default,
                styleSheets: []
            })) : {
                ErrorComponent: o,
                styleSheets: a
            }
        }).then(e => {
            var i;
            let {
                ErrorComponent: l,
                styleSheets: s
            } = e, c = z(r), f = {
                Component: l,
                AppTree: c,
                router: n,
                ctx: {
                    err: u,
                    pathname: o.page,
                    query: o.query,
                    asPath: a,
                    AppTree: c
                }
            };
            return Promise.resolve((null == (i = t.props) ? void 0 : i.err) ? t.props : (0, g.loadGetInitialProps)(r, f)).then(e => ec({
                ...t,
                err: u,
                Component: l,
                styleSheets: s,
                props: e
            }))
        })
    }

    function Q(e) {
        let {
            callback: t
        } = e;
        return T.default.useLayoutEffect(() => t(), [t]), null
    }
    let Z = "beforeRender",
        J = "afterRender",
        $ = "afterHydrate",
        ee = "routeChange",
        et = "Next.js-hydration",
        er = "Next.js-route-change-to-render",
        en = "Next.js-render",
        eo = null,
        ea = !0;

    function ei() {
        [Z, $, J, ee].forEach(e => performance.clearMarks(e))
    }

    function eu() {
        g.ST && (performance.mark($), performance.getEntriesByName(Z, "mark").length && (performance.measure("Next.js-before-hydration", "navigationStart", Z), performance.measure(et, Z, $)), d && performance.getEntriesByName(et).forEach(d), ei())
    }

    function el() {
        if (!g.ST) return;
        performance.mark(J);
        let e = performance.getEntriesByName(ee, "mark");
        e.length && (performance.getEntriesByName(Z, "mark").length && (performance.measure(er, e[0].name, Z), performance.measure(en, Z, J), d && (performance.getEntriesByName(en).forEach(d), performance.getEntriesByName(er).forEach(d))), ei(), [er, en].forEach(e => performance.clearMeasures(e)))
    }

    function es(e) {
        let {
            callbacks: t,
            children: r
        } = e;
        return T.default.useLayoutEffect(() => t.forEach(e => e()), [t]), r
    }

    function ec(e) {
        var t, r;
        let o, a, {
                App: i,
                Component: l,
                props: f,
                err: d
            } = e,
            _ = "initial" in e ? void 0 : e.styleSheets;
        l = l || s.Component;
        let p = {
            ...f = f || s.props,
            Component: l,
            err: d,
            router: n
        };
        s = p;
        let E = new Promise((e, t) => {
            c && c(), a = () => {
                c = null, e()
            }, c = () => {
                c = null;
                let e = Object.defineProperty(Error("Cancel rendering route"), "__NEXT_ERROR_CODE", {
                    value: "E503",
                    enumerable: !1,
                    configurable: !0
                });
                e.cancelled = !0, t(e)
            }
        });

        function m() {
            a()
        }! function() {
            let e;
            if (!_) return;
            let t = new Set((e = document.querySelectorAll("style[data-n-href]"), [].slice.call(e)).map(e => e.getAttribute("data-n-href"))),
                r = document.querySelector("noscript[data-n-css]"),
                n = null == r ? void 0 : r.getAttribute("data-n-css");
            _.forEach(e => {
                let {
                    href: r,
                    text: o
                } = e;
                if (!t.has(r)) {
                    let e = document.createElement("style");
                    e.setAttribute("data-n-href", r), e.setAttribute("media", "x"), n && e.setAttribute("nonce", n), document.head.appendChild(e), e.appendChild(document.createTextNode(o))
                }
            })
        }();
        let h = (0, R.jsxs)(R.Fragment, {
            children: [(0, R.jsx)(Q, {
                callback: function() {
                    if (e.scroll) {
                        let {
                            x: t,
                            y: r
                        } = e.scroll;
                        (0, b.disableSmoothScrollDuringRouteTransition)(() => {
                            window.scrollTo(t, r)
                        })
                    }
                }
            }), (0, R.jsxs)(V, {
                children: [Y(i, p), (0, R.jsx)(N.Portal, {
                    type: "next-route-announcer",
                    children: (0, R.jsx)(C.RouteAnnouncer, {})
                })]
            })]
        });
        return t = u, r = e => (0, R.jsx)(es, {
            callbacks: [e, m],
            children: h
        }), g.ST && performance.mark(Z), o = r(ea ? eu : el), eo ? (0, T.default.startTransition)(() => {
            eo.render(o)
        }) : (eo = S.default.hydrateRoot(t, o, {
            onRecoverableError: k.onRecoverableError
        }), ea = !1), E
    }
    async function ef(e) {
        if (e.err && (void 0 === e.Component || !e.isHydratePass)) return void await K(e);
        try {
            await ec(e)
        } catch (r) {
            let t = (0, D.getProperError)(r);
            if (t.cancelled) throw t;
            await K({
                ...e,
                err: t
            })
        }
    }
    async function ed(e) {
        let t = o.err;
        try {
            let e = await i.routeLoader.whenEntrypoint("/_app");
            if ("error" in e) throw e.error;
            let {
                component: t,
                exports: r
            } = e;
            f = t, r && r.reportWebVitals && (d = e => {
                let t, {
                        id: n,
                        name: o,
                        startTime: a,
                        value: i,
                        duration: u,
                        entryType: l,
                        entries: s,
                        attribution: c
                    } = e,
                    f = "".concat(Date.now(), "-").concat(Math.floor(Math.random() * (9e12 - 1)) + 1e12);
                s && s.length && (t = s[0].startTime);
                let d = {
                    id: n || f,
                    name: o,
                    startTime: a || t,
                    value: null == i ? u : i,
                    label: "mark" === l || "measure" === l ? "custom" : "web-vital"
                };
                c && (d.attribution = c), r.reportWebVitals(d)
            });
            let n = await i.routeLoader.whenEntrypoint(o.page);
            if ("error" in n) throw n.error;
            _ = n.component
        } catch (e) {
            t = (0, D.getProperError)(e)
        }
        window.__NEXT_PRELOADREADY && await window.__NEXT_PRELOADREADY(o.dynamicIds), n = (0, L.createRouter)(o.page, o.query, a, {
            initialProps: o.props,
            pageLoader: i,
            App: f,
            Component: _,
            wrapApp: z,
            err: t,
            isFallback: !!o.isFallback,
            subscription: (e, t, r) => ef(Object.assign({}, e, {
                App: t,
                scroll: r
            })),
            locale: o.locale,
            locales: o.locales,
            defaultLocale: p,
            domainLocales: o.domainLocales,
            isPreview: o.isPreview
        }), W = await n._initialMatchesMiddlewarePromise;
        let r = {
            App: f,
            initial: !0,
            Component: _,
            props: o.props,
            err: t,
            isHydratePass: !0
        };
        (null == e ? void 0 : e.beforeRender) && await e.beforeRender(), ef(r)
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 9607, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), e.r(381855), e.r(821001);
    let n = e.r(343690);
    window.next = {
        version: n.version,
        turbopack: !0,
        get router() {
            return n.router
        },
        emitter: n.emitter
    }, self.__next_set_public_path__ = () => {}, self.__webpack_hash__ = "", (0, n.initialize)({}).then(() => (self.__turbopack_load_page_chunks__ = (t, r) => {
        Promise.all(r.map(t => e.l(t))).catch(e => console.error("failed to load chunks for page " + t, e))
    }, (0, n.hydrate)())).catch(e => {
        console.error("Error was not caught", e)
    }), ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 70274, (e, t, r) => {
    "use strict";
    var n = e.i(2226);
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return p
        }
    });
    let o = e.r(2879),
        a = e.r(333626),
        i = e.r(339555),
        u = o._(e.r(940470)),
        l = e.r(875052),
        s = e.r(990761),
        c = e.r(221565),
        f = e.r(578905),
        d = e.r(530169);
    e.r(178390);
    let _ = e.r(160899);
    class p {
        getPageList() {
            return (0, d.getClientBuildManifest)().then(e => e.sortedPages)
        }
        getMiddleware() {
            if (n.default.env.__NEXT_MIDDLEWARE_MATCHERS) {
                let e = n.default.env.__NEXT_MIDDLEWARE_MATCHERS;
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
                return (0, _.resolvePromiseWithTimeout)(e, (0, d.markAssetError)(Object.defineProperty(Error("Failed to load client middleware manifest"), "__NEXT_ERROR_CODE", {
                    value: "E980",
                    enumerable: !1,
                    configurable: !0
                })), void 0)
            }
        }
        getDataHref(e) {
            var t;
            let r, {
                    asPath: n,
                    href: o,
                    locale: d
                } = e,
                {
                    pathname: _,
                    query: p,
                    search: E
                } = (0, c.parseRelativeUrl)(o),
                {
                    pathname: m
                } = (0, c.parseRelativeUrl)(n),
                h = (0, f.removeTrailingSlash)(_);
            if ("/" !== h[0]) throw Object.defineProperty(Error('Route name should start with a "/", got "'.concat(h, '"')), "__NEXT_ERROR_CODE", {
                value: "E303",
                enumerable: !1,
                configurable: !0
            });
            return t = e.skipInterpolation ? m : (0, s.isDynamicRoute)(h) ? (0, i.interpolateAs)(_, m, p).result : h, r = (0, u.default)((0, f.removeTrailingSlash)((0, l.addLocale)(t, d)), ".json"), (0, a.addBasePath)("/_next/data/".concat(this.buildId).concat(r).concat(E), !0)
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
            this.routeLoader = (0, d.createRouteLoader)(t), this.buildId = e, this.assetPrefix = t, this.promisedSsgManifest = new Promise(e => {
                window.__SSG_MANIFEST ? e(window.__SSG_MANIFEST) : window.__SSG_MANIFEST_CB = () => {
                    e(window.__SSG_MANIFEST)
                }
            })
        }
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 272845, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "Portal", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    let n = e.r(416340),
        o = e.r(149285),
        a = e => {
            let {
                children: t,
                type: r
            } = e, [a, i] = (0, n.useState)(null);
            return (0, n.useEffect)(() => {
                let e = document.createElement(r);
                return document.body.appendChild(e), i(e), () => {
                    document.body.removeChild(e)
                }
            }, [r]), a ? (0, o.createPortal)(t, a) : null
        };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 177195, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "reportGlobalError", {
        enumerable: !0,
        get: function() {
            return n
        }
    });
    let n = "function" == typeof reportError ? reportError : e => {
        globalThis.console.error(e)
    };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 701485, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        isRecoverableError: function() {
            return c
        },
        onRecoverableError: function() {
            return f
        }
    };
    for (var o in n) Object.defineProperty(r, o, {
        enumerable: !0,
        get: n[o]
    });
    let a = e.r(2879),
        i = e.r(450392),
        u = a._(e.r(641322)),
        l = e.r(177195),
        s = new WeakSet;

    function c(e) {
        return s.has(e)
    }
    let f = e => {
        let t = (0, u.default)(e) && "cause" in e ? e.cause : e;
        (0, i.isBailoutToCSRError)(t) || (0, l.reportGlobalError)(t)
    };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 604029, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    let n = e.r(2879)._(e.r(570613));
    class o {
        end(e) {
            if ("ended" === this.state.state) throw Object.defineProperty(Error("Span has already ended"), "__NEXT_ERROR_CODE", {
                value: "E17",
                enumerable: !1,
                configurable: !0
            });
            this.state = {
                state: "ended",
                endTime: null != e ? e : Date.now()
            }, this.onSpanEnd(this)
        }
        constructor(e, t, r) {
            var n, o;
            this.name = e, this.attributes = null != (n = t.attributes) ? n : {}, this.startTime = null != (o = t.startTime) ? o : Date.now(), this.onSpanEnd = r, this.state = {
                state: "inprogress"
            }
        }
    }
    let a = new class {
        startSpan(e, t) {
            return new o(e, t, this.handleSpanEnd)
        }
        onSpanEnd(e) {
            return this._emitter.on("spanend", e), () => {
                this._emitter.off("spanend", e)
            }
        }
        constructor() {
            this._emitter = (0, n.default)(), this.handleSpanEnd = e => {
                this._emitter.emit("spanend", e)
            }
        }
    };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 381855, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    let n = (0, e.r(306077).getDeploymentId)();
    globalThis.NEXT_DEPLOYMENT_ID = n, ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 598424, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        RouteAnnouncer: function() {
            return c
        },
        default: function() {
            return f
        }
    };
    for (var o in n) Object.defineProperty(r, o, {
        enumerable: !0,
        get: n[o]
    });
    let a = e.r(2879),
        i = e.r(221628),
        u = a._(e.r(416340)),
        l = e.r(761438),
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
            } = (0, l.useRouter)(), [t, r] = u.default.useState(""), n = u.default.useRef(e);
            return u.default.useEffect(() => {
                if (n.current !== e)
                    if (n.current = e, document.title) r(document.title);
                    else {
                        var t;
                        let n = document.querySelector("h1");
                        r((null != (t = null == n ? void 0 : n.innerText) ? t : null == n ? void 0 : n.textContent) || e)
                    }
            }, [e]), (0, i.jsx)("p", {
                "aria-live": "assertive",
                id: "__next-route-announcer__",
                role: "alert",
                style: s,
                children: t
            })
        },
        f = c;
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 821001, (e, t, r) => {
    "use strict";
    {
        let e = {};
        t.exports = Array.isArray(e) ? e : [e]
    }
}, 512958, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        VALID_LOADERS: function() {
            return a
        },
        imageConfigDefault: function() {
            return i
        }
    };
    for (var o in n) Object.defineProperty(r, o, {
        enumerable: !0,
        get: n[o]
    });
    let a = ["default", "imgix", "cloudinary", "akamai", "custom"],
        i = {
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
}, 424204, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "ImageConfigContext", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    let n = e.r(2879)._(e.r(416340)),
        o = e.r(512958),
        a = n.default.createContext(o.imageConfigDefault)
}, 781227, (e, t, r) => {
    "use strict";
    t.exports = ["chrome 111", "edge 111", "firefox 111", "safari 16.4"]
}, 194538, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        UNDERSCORE_GLOBAL_ERROR_ROUTE: function() {
            return u
        },
        UNDERSCORE_GLOBAL_ERROR_ROUTE_ENTRY: function() {
            return l
        },
        UNDERSCORE_NOT_FOUND_ROUTE: function() {
            return a
        },
        UNDERSCORE_NOT_FOUND_ROUTE_ENTRY: function() {
            return i
        }
    };
    for (var o in n) Object.defineProperty(r, o, {
        enumerable: !0,
        get: n[o]
    });
    let a = "/_not-found",
        i = "".concat(a, "/page"),
        u = "/_global-error",
        l = "".concat(u, "/page")
}, 178390, (e, t, r) => {
    "use strict";
    var n, o, a, i = e.i(2226);
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var u = {
        APP_CLIENT_INTERNALS: function() {
            return ea
        },
        APP_PATHS_MANIFEST: function() {
            return A
        },
        APP_PATH_ROUTES_MANIFEST: function() {
            return y
        },
        AdapterOutputType: function() {
            return _
        },
        BARREL_OPTIMIZATION_PREFIX: function() {
            return Q
        },
        BLOCKED_PAGES: function() {
            return q
        },
        BUILD_ID_FILE: function() {
            return X
        },
        BUILD_MANIFEST: function() {
            return b
        },
        CLIENT_PUBLIC_FILES_PATH: function() {
            return Y
        },
        CLIENT_REFERENCE_MANIFEST: function() {
            return Z
        },
        CLIENT_STATIC_FILES_PATH: function() {
            return V
        },
        CLIENT_STATIC_FILES_RUNTIME_MAIN: function() {
            return en
        },
        CLIENT_STATIC_FILES_RUNTIME_MAIN_APP: function() {
            return eo
        },
        CLIENT_STATIC_FILES_RUNTIME_POLYFILLS: function() {
            return el
        },
        CLIENT_STATIC_FILES_RUNTIME_POLYFILLS_SYMBOL: function() {
            return es
        },
        CLIENT_STATIC_FILES_RUNTIME_REACT_REFRESH: function() {
            return ei
        },
        CLIENT_STATIC_FILES_RUNTIME_WEBPACK: function() {
            return eu
        },
        COMPILER_INDEXES: function() {
            return d
        },
        COMPILER_NAMES: function() {
            return f
        },
        CONFIG_FILES: function() {
            return W
        },
        DEFAULT_RUNTIME_WEBPACK: function() {
            return ec
        },
        DEFAULT_SANS_SERIF_FONT: function() {
            return eE
        },
        DEFAULT_SERIF_FONT: function() {
            return ep
        },
        DEV_CLIENT_MIDDLEWARE_MANIFEST: function() {
            return k
        },
        DEV_CLIENT_PAGES_MANIFEST: function() {
            return w
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
            return v
        },
        EXPORT_MARKER: function() {
            return N
        },
        FUNCTIONS_CONFIG_MANIFEST: function() {
            return O
        },
        IMAGES_MANIFEST: function() {
            return D
        },
        INTERCEPTION_ROUTE_REWRITE_MANIFEST: function() {
            return et
        },
        MIDDLEWARE_BUILD_MANIFEST: function() {
            return $
        },
        MIDDLEWARE_MANIFEST: function() {
            return U
        },
        MIDDLEWARE_REACT_LOADABLE_MANIFEST: function() {
            return ee
        },
        MODERN_BROWSERSLIST_TARGET: function() {
            return s.default
        },
        NEXT_BUILTIN_DOCUMENT: function() {
            return K
        },
        NEXT_FONT_MANIFEST: function() {
            return g
        },
        PAGES_MANIFEST: function() {
            return P
        },
        PHASE_ANALYZE: function() {
            return E
        },
        PHASE_DEVELOPMENT_SERVER: function() {
            return R
        },
        PHASE_EXPORT: function() {
            return p
        },
        PHASE_INFO: function() {
            return S
        },
        PHASE_PRODUCTION_BUILD: function() {
            return m
        },
        PHASE_PRODUCTION_SERVER: function() {
            return h
        },
        PHASE_TEST: function() {
            return T
        },
        PREFETCH_HINTS: function() {
            return C
        },
        PRERENDER_MANIFEST: function() {
            return M
        },
        REACT_LOADABLE_MANIFEST: function() {
            return H
        },
        REQUEST_INSIGHTS_DEV_ENDPOINT: function() {
            return x
        },
        ROUTES_MANIFEST: function() {
            return L
        },
        RSC_MODULE_TYPES: function() {
            return eT
        },
        SERVER_DIRECTORY: function() {
            return G
        },
        SERVER_FILES_MANIFEST: function() {
            return j
        },
        SERVER_PROPS_ID: function() {
            return e_
        },
        SERVER_REFERENCE_MANIFEST: function() {
            return J
        },
        STATIC_PROPS_ID: function() {
            return ed
        },
        STATIC_STATUS_PAGES: function() {
            return em
        },
        STRING_LITERAL_DROP_BUNDLE: function() {
            return z
        },
        SUBRESOURCE_INTEGRITY_MANIFEST: function() {
            return I
        },
        SYSTEM_ENTRYPOINTS: function() {
            return eP
        },
        TRACE_OUTPUT_VERSION: function() {
            return eh
        },
        TURBOPACK_CLIENT_BUILD_MANIFEST: function() {
            return B
        },
        TURBOPACK_CLIENT_MIDDLEWARE_MANIFEST: function() {
            return F
        },
        TURBO_TRACE_DEFAULT_MEMORY_LIMIT: function() {
            return eR
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
    for (var l in u) Object.defineProperty(r, l, {
        enumerable: !0,
        get: u[l]
    });
    let s = e.r(2879)._(e.r(781227)),
        c = e.r(194538),
        f = {
            client: "client",
            server: "server",
            edgeServer: "edge-server"
        },
        d = {
            [f.client]: 0,
            [f.server]: 1,
            [f.edgeServer]: 2
        };
    var _ = ((n = {}).PAGES = "PAGES", n.PAGES_API = "PAGES_API", n.APP_PAGE = "APP_PAGE", n.APP_ROUTE = "APP_ROUTE", n.PRERENDER = "PRERENDER", n.STATIC_FILE = "STATIC_FILE", n.MIDDLEWARE = "MIDDLEWARE", n);
    let p = "phase-export",
        E = "phase-analyze",
        m = "phase-production-build",
        h = "phase-production-server",
        R = "phase-development-server",
        T = "phase-test",
        S = "phase-info",
        P = "pages-manifest.json",
        A = "app-paths-manifest.json",
        y = "app-path-routes-manifest.json",
        b = "build-manifest.json",
        O = "functions-config-manifest.json",
        I = "subresource-integrity-manifest",
        g = "next-font-manifest",
        N = "export-marker.json",
        v = "export-detail.json",
        M = "prerender-manifest.json",
        C = "prefetch-hints.json",
        L = "routes-manifest.json",
        D = "images-manifest.json",
        j = "required-server-files",
        w = "_devPagesManifest.json",
        x = "/_next/development/request-insights",
        U = "middleware-manifest.json",
        F = "_clientMiddlewareManifest.js",
        B = "client-build-manifest.json",
        k = "_devMiddlewareManifest.json",
        H = "react-loadable-manifest.json",
        G = "server",
        W = ["next.config.js", "next.config.mjs", "next.config.ts", ...(null == (a = i.default) || null == (o = a.features) ? void 0 : o.typescript) ? ["next.config.mts"] : []],
        X = "BUILD_ID",
        q = ["/_document", "/_app", "/_error"],
        Y = "public",
        V = "static",
        z = "__NEXT_DROP_CLIENT_FILE__",
        K = "__NEXT_BUILTIN_DOCUMENT__",
        Q = "__barrel_optimize__",
        Z = "client-reference-manifest",
        J = "server-reference-manifest",
        $ = "middleware-build-manifest",
        ee = "middleware-react-loadable-manifest",
        et = "interception-route-rewrite-manifest",
        er = "dynamic-css-manifest",
        en = "main",
        eo = "".concat(en, "-app"),
        ea = "app-pages-internals",
        ei = "react-refresh",
        eu = "webpack",
        el = "polyfills",
        es = Symbol(el),
        ec = "webpack-runtime",
        ef = "edge-runtime-webpack",
        ed = "__N_SSG",
        e_ = "__N_SSP",
        ep = {
            name: "Times New Roman",
            xAvgCharWidth: 821,
            azAvgWidth: 854.3953488372093,
            unitsPerEm: 2048
        },
        eE = {
            name: "Arial",
            xAvgCharWidth: 904,
            azAvgWidth: 934.5116279069767,
            unitsPerEm: 2048
        },
        em = ["/500"],
        eh = 1,
        eR = 6e3,
        eT = {
            client: "client",
            server: "server"
        },
        eS = ["clearImmediate", "setImmediate", "BroadcastChannel", "ByteLengthQueuingStrategy", "CompressionStream", "CountQueuingStrategy", "DecompressionStream", "DomException", "MessageChannel", "MessageEvent", "MessagePort", "ReadableByteStreamController", "ReadableStreamBYOBRequest", "ReadableStreamDefaultController", "TransformStreamDefaultController", "WritableStreamDefaultController"],
        eP = new Set([en, ei, eo]);
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 845290, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        PathnameContextProviderAdapter: function() {
            return E
        },
        adaptForAppRouterInstance: function() {
            return d
        },
        adaptForPathParams: function() {
            return p
        },
        adaptForSearchParams: function() {
            return _
        }
    };
    for (var o in n) Object.defineProperty(r, o, {
        enumerable: !0,
        get: n[o]
    });
    let a = e.r(887602),
        i = e.r(221628),
        u = a._(e.r(416340)),
        l = e.r(956959),
        s = e.r(144689),
        c = e.r(154313),
        f = e.r(668484);

    function d(e) {
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
                    scroll: r
                } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                e.push(t, void 0, {
                    scroll: r
                })
            },
            replace(t) {
                let {
                    scroll: r
                } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                e.replace(t, void 0, {
                    scroll: r
                })
            },
            prefetch(t) {
                e.prefetch(t)
            },
            bfcacheId: "0"
        }
    }

    function _(e) {
        return e.isReady && e.query ? (0, c.asPathToSearchParams)(e.asPath) : new URLSearchParams
    }

    function p(e) {
        if (!e.isReady || !e.query) return null;
        let t = {};
        for (let r of Object.keys((0, f.getRouteRegex)(e.pathname).groups)) t[r] = e.query[r];
        return t
    }

    function E(e) {
        let {
            children: t,
            router: r,
            ...n
        } = e, o = (0, u.useRef)(n.isAutoExport), a = (0, u.useMemo)(() => {
            let e, t = o.current;
            if (t && (o.current = !1), (0, s.isDynamicRoute)(r.pathname) && (r.isFallback || t && !r.isReady)) return null;
            try {
                e = new URL(r.asPath, "http://f")
            } catch (e) {
                return "/"
            }
            return e.pathname
        }, [r.asPath, r.isFallback, r.isReady, r.pathname]);
        return (0, i.jsx)(l.PathnameContext.Provider, {
            value: a,
            children: t
        })
    }
}, 154313, (e, t, r) => {
    "use strict";

    function n(e) {
        return new URL(e, "http://n").searchParams
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "asPathToSearchParams", {
        enumerable: !0,
        get: function() {
            return n
        }
    })
}]);

//# debugId=c5f09c5e-f0ee-1a7c-2511-05200cb17331
//# sourceMappingURL=2yvqkct4-t0bq.js.map
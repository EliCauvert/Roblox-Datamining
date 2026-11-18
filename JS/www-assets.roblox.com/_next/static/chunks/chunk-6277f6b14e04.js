;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "7d22a313-83af-d636-cd48-14df6c27bf96")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 434468, (e, l, t) => {
    "use strict";
    Object.defineProperty(t, "__esModule", {
        value: !0
    }), Object.defineProperty(t, "BailoutToCSR", {
        enumerable: !0,
        get: function() {
            return r
        }
    });
    let n = e.r(504791);

    function r(e) {
        let {
            reason: l,
            children: t
        } = e;
        if ("u" < typeof window) throw Object.defineProperty(new n.BailoutToCSRError(l), "__NEXT_ERROR_CODE", {
            value: "E394",
            enumerable: !1,
            configurable: !0
        });
        return t
    }
}, 815952, (e, l, t) => {
    "use strict";
    Object.defineProperty(t, "__esModule", {
        value: !0
    }), Object.defineProperty(t, "PreloadChunks", {
        enumerable: !0,
        get: function() {
            return c
        }
    });
    let n = e.r(809804),
        r = e.r(652447),
        o = e.r(371431),
        a = e.r(482729),
        d = e.r(61509);

    function c(e) {
        let {
            moduleIds: l
        } = e;
        if ("u" > typeof window) return null;
        let t = o.workAsyncStorage.getStore();
        if (void 0 === t) return null;
        let c = [];
        if (t.reactLoadableManifest && l) {
            let e = t.reactLoadableManifest;
            for (let t of l) {
                if (!e[t]) continue;
                let l = e[t].files;
                c.push(...l)
            }
        }
        if (0 === c.length) return null;
        let i = (0, d.getAssetTokenQuery)();
        return (0, n.jsx)(n.Fragment, {
            children: c.map(e => {
                let l = `${t.assetPrefix}/_next/${(0,a.encodeURIPath)(e)}${i}`;
                return e.endsWith(".css") ? (0, n.jsx)("link", {
                    precedence: "dynamic",
                    href: l,
                    rel: "stylesheet",
                    as: "style",
                    nonce: t.nonce
                }, e) : ((0, r.preload)(l, {
                    as: "script",
                    fetchPriority: "low",
                    nonce: t.nonce
                }), null)
            })
        })
    }
}, 147181, (e, l, t) => {
    "use strict";
    Object.defineProperty(t, "__esModule", {
        value: !0
    }), Object.defineProperty(t, "default", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let n = e.r(809804),
        r = e.r(371847),
        o = e.r(434468),
        a = e.r(815952);

    function d(e) {
        return {
            default: e && "default" in e ? e.default : e
        }
    }
    let c = {
            loader: () => Promise.resolve(d(() => null)),
            loading: null,
            ssr: !0
        },
        i = function(e) {
            let l = {
                    ...c,
                    ...e
                },
                t = (0, r.lazy)(() => l.loader().then(d)),
                i = l.loading;

            function u(e) {
                let d = i ? (0, n.jsx)(i, {
                        isLoading: !0,
                        pastDelay: !0,
                        error: null
                    }) : null,
                    c = !l.ssr || !!l.loading,
                    u = c ? r.Suspense : r.Fragment,
                    b = l.ssr ? (0, n.jsxs)(n.Fragment, {
                        children: ["u" < typeof window ? (0, n.jsx)(a.PreloadChunks, {
                            moduleIds: l.modules
                        }) : null, (0, n.jsx)(t, {
                            ...e
                        })]
                    }) : (0, n.jsx)(o.BailoutToCSR, {
                        reason: "next/dynamic",
                        children: (0, n.jsx)(t, {
                            ...e
                        })
                    });
                return (0, n.jsx)(u, {
                    ...c ? {
                        fallback: d
                    } : {},
                    children: b
                })
            }
            return u.displayName = "LoadableComponent", u
        }
}, 865581, (e, l, t) => {
    "use strict";
    Object.defineProperty(t, "__esModule", {
        value: !0
    }), Object.defineProperty(t, "default", {
        enumerable: !0,
        get: function() {
            return r
        }
    });
    let n = e.r(481258)._(e.r(147181));

    function r(e, l) {
        let t = {};
        "function" == typeof e && (t.loader = e);
        let r = {
            ...t,
            ...l
        };
        return (0, n.default)({
            ...r,
            modules: r.loadableGenerated?.modules
        })
    }("function" == typeof t.default || "object" == typeof t.default && null !== t.default) && void 0 === t.default.__esModule && (Object.defineProperty(t.default, "__esModule", {
        value: !0
    }), Object.assign(t.default, t), l.exports = t.default)
}, 763426, (e, l, t) => {
    "use strict";
    Object.defineProperty(t, "__esModule", {
        value: !0
    }), Object.defineProperty(t, "useMergedRef", {
        enumerable: !0,
        get: function() {
            return r
        }
    });
    let n = e.r(371847);

    function r(e, l) {
        let t = (0, n.useRef)(null),
            r = (0, n.useRef)(null);
        return (0, n.useCallback)(n => {
            if (null === n) {
                let e = t.current;
                e && (t.current = null, e());
                let l = r.current;
                l && (r.current = null, l())
            } else e && (t.current = o(e, n)), l && (r.current = o(l, n))
        }, [e, l])
    }

    function o(e, l) {
        if ("function" != typeof e) return e.current = l, () => {
            e.current = null
        };
        {
            let t = e(l);
            return "function" == typeof t ? t : () => e(null)
        }
    }("function" == typeof t.default || "object" == typeof t.default && null !== t.default) && void 0 === t.default.__esModule && (Object.defineProperty(t.default, "__esModule", {
        value: !0
    }), Object.assign(t.default, t), l.exports = t.default)
}, 875380, (e, l, t) => {
    "use strict";
    Object.defineProperty(t, "__esModule", {
        value: !0
    }), Object.defineProperty(t, "errorOnce", {
        enumerable: !0,
        get: function() {
            return n
        }
    });
    let n = e => {}
}, 336235, (e, l, t) => {
    "use strict";
    Object.defineProperty(t, "__esModule", {
        value: !0
    });
    var n = {
        default: function() {
            return m
        },
        useLinkStatus: function() {
            return A
        }
    };
    for (var r in n) Object.defineProperty(t, r, {
        enumerable: !0,
        get: n[r]
    });
    let o = e.r(744066),
        a = e.r(809804),
        d = o._(e.r(371847)),
        c = e.r(414035),
        i = e.r(684397),
        u = e.r(763426),
        b = e.r(378201),
        s = e.r(393806);
    e.r(324668);
    let V = e.r(873533),
        Z = e.r(883100),
        W = e.r(686429),
        R = e.r(669714);

    function m(l) {
        var t, n;
        let r, o, m, [A, p] = (0, d.useOptimistic)(Z.IDLE_LINK_STATUS),
            G = (0, d.useRef)(null),
            {
                href: h,
                as: f,
                children: y,
                prefetch: X = null,
                passHref: E,
                replace: S,
                shallow: I,
                scroll: F,
                onClick: Y,
                onMouseEnter: v,
                onTouchStart: B,
                legacyBehavior: C = !1,
                onNavigate: J,
                transitionTypes: H,
                ref: k,
                unstable_dynamicOnHover: N,
                ...x
            } = l;
        r = y, C && ("string" == typeof r || "number" == typeof r) && (r = (0, a.jsx)("a", {
            children: r
        }));
        let U = d.default.useContext(i.AppRouterContext),
            z = !1 !== X,
            K = !1 !== X ? null === (n = X) || "auto" === n ? R.FetchStrategy.PPR : R.FetchStrategy.Full : R.FetchStrategy.PPR,
            L = "string" == typeof(t = f || h) ? t : (0, c.formatUrl)(t);
        if (C) {
            if (r?.$$typeof === Symbol.for("react.lazy")) throw Object.defineProperty(Error("`<Link legacyBehavior>` received a direct child that is either a Server Component, or JSX that was loaded with React.lazy(). This is not supported. Either remove legacyBehavior, or make the direct child a Client Component that renders the Link's `<a>` tag."), "__NEXT_ERROR_CODE", {
                value: "E863",
                enumerable: !1,
                configurable: !0
            });
            o = d.default.Children.only(r)
        }
        let Q = C ? o && "object" == typeof o && o.ref : k,
            w = d.default.useCallback(e => (null !== U && (G.current = (0, Z.mountLinkInstance)(e, L, U, K, z, p)), () => {
                G.current && ((0, Z.unmountLinkForCurrentNavigation)(G.current), G.current = null), (0, Z.unmountPrefetchableInstance)(e)
            }), [z, L, U, K, p]),
            j = {
                ref: (0, u.useMergedRef)(w, Q),
                onClick(l) {
                    C || "function" != typeof Y || Y(l), C && o.props && "function" == typeof o.props.onClick && o.props.onClick(l), !U || l.defaultPrevented || function(l, t, n, r, o, a, c) {
                        if ("u" > typeof window) {
                            let i, {
                                nodeName: u
                            } = l.currentTarget;
                            if ("A" === u.toUpperCase() && ((i = l.currentTarget.getAttribute("target")) && "_self" !== i || l.metaKey || l.ctrlKey || l.shiftKey || l.altKey || l.nativeEvent && 2 === l.nativeEvent.which) || l.currentTarget.hasAttribute("download")) return;
                            if (!(0, W.isLocalURL)(t)) {
                                r && (l.preventDefault(), location.replace(t));
                                return
                            }
                            if (l.preventDefault(), a) {
                                let e = !1;
                                if (a({
                                        preventDefault: () => {
                                            e = !0
                                        }
                                    }), e) return
                            }
                            let {
                                dispatchNavigateAction: b
                            } = e.r(265936);
                            d.default.startTransition(() => {
                                b(t, r ? "replace" : "push", !1 === o ? V.ScrollBehavior.NoScroll : V.ScrollBehavior.Default, n.current, c)
                            })
                        }
                    }(l, L, G, S, F, J, H)
                },
                onMouseEnter(e) {
                    C || "function" != typeof v || v(e), C && o.props && "function" == typeof o.props.onMouseEnter && o.props.onMouseEnter(e), U && z && (0, Z.onNavigationIntent)(e.currentTarget, !0 === N)
                },
                onTouchStart: function(e) {
                    C || "function" != typeof B || B(e), C && o.props && "function" == typeof o.props.onTouchStart && o.props.onTouchStart(e), U && z && (0, Z.onNavigationIntent)(e.currentTarget, !0 === N)
                }
            };
        return (0, b.isAbsoluteUrl)(L) ? j.href = L : C && !E && ("a" !== o.type || "href" in o.props) || (j.href = (0, s.addBasePath)(L)), m = C ? d.default.cloneElement(o, j) : (0, a.jsx)("a", {
            ...x,
            ...j,
            children: r
        }), (0, a.jsx)(g.Provider, {
            value: A,
            children: m
        })
    }
    e.r(875380);
    let g = (0, d.createContext)(Z.IDLE_LINK_STATUS),
        A = () => (0, d.useContext)(g);
    ("function" == typeof t.default || "object" == typeof t.default && null !== t.default) && void 0 === t.default.__esModule && (Object.defineProperty(t.default, "__esModule", {
        value: !0
    }), Object.assign(t.default, t), l.exports = t.default)
}, 744420, (e, l, t) => {
    l.exports = e.r(664213)
}, 730828, 254351, 484912, 674123, e => {
    "use strict";
    var l = e.i(336235),
        t = e.i(744420),
        n = e.i(371847),
        r = e.i(745911),
        o = e.i(912035);

    function a(e) {
        let l;
        return ("object" == typeof e ? null == e.host && null == e.hostname : !/^[a-z]+:/i.test(e)) && (null == (l = "object" == typeof e ? e.pathname : e) || !!l.startsWith("/"))
    }

    function d(e, l) {
        let t = e;
        return /^\/(\?.*)?$/.test(l) && (l = l.slice(1)), t += l
    }

    function c(e, l, t) {
        return "string" == typeof e ? e : e[l] || t
    }

    function i(e) {
        let l = function() {
                try {
                    return "true" === o.default.env._next_intl_trailing_slash
                } catch {
                    return !1
                }
            }(),
            [t, ...n] = e.split("#"),
            r = n.join("#"),
            a = t;
        if ("/" !== a) {
            let e = a.endsWith("/");
            l && !e ? a += "/" : !l && e && (a = a.slice(0, -1))
        }
        return r && (a += "#" + r), a
    }

    function u(e, l) {
        let t, n = i(e),
            r = i(l);
        return (t = n.replace(/\/\[\[(\.\.\.[^\]]+)\]\]/g, "(?:/(.*))?").replace(/\[\[(\.\.\.[^\]]+)\]\]/g, "(?:/(.*))?").replace(/\[(\.\.\.[^\]]+)\]/g, "(.+)").replace(/\[([^\]]+)\]/g, "([^/]+)"), RegExp(`^${t}$`)).test(r)
    }

    function b(e, l) {
        return "never" !== l.mode && l.prefixes?.[e] || s(e)
    }

    function s(e) {
        return "/" + e
    }

    function V(e) {
        return e.includes("[[...")
    }

    function Z(e) {
        return e.includes("[...")
    }

    function W(e) {
        return e.includes("[")
    }

    function R(e, l) {
        let t = e.split("/"),
            n = l.split("/"),
            r = Math.max(t.length, n.length);
        for (let e = 0; e < r; e++) {
            let l = t[e],
                r = n[e];
            if (!l && r) return -1;
            if (l && !r) return 1;
            if (l || r) {
                if (!W(l) && W(r)) return -1;
                if (W(l) && !W(r)) return 1;
                if (!Z(l) && Z(r)) return -1;
                if (Z(l) && !Z(r)) return 1;
                if (!V(l) && V(r)) return -1;
                if (V(l) && !V(r)) return 1
            }
        }
        return 0
    }

    function m(e) {
        return e.sort(R)
    }

    function g(e) {
        let l = new URLSearchParams;
        for (let [t, n] of Object.entries(e)) Array.isArray(n) ? n.forEach(e => {
            l.append(t, String(e))
        }) : l.set(t, String(n));
        return "?" + l.toString()
    }

    function A(e) {
        let l = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : window.location.pathname;
        return "/" === e ? l : l.replace(e, "")
    }

    function p(e, l, t, n) {
        if (!e || n === t || null == n || !l) return;
        let r = A(l),
            {
                name: o,
                ...a
            } = e;
        a.path || (a.path = "" !== r ? r : "/");
        let d = `${o}=${n};`;
        for (let [e, l] of Object.entries(a)) d += `${"maxAge"===e?"max-age":e}`, "boolean" != typeof l && (d += "=" + l), d += ";";
        document.cookie = d
    }
    e.s(["getLocaleAsPrefix", 0, s, "getLocalePrefix", 0, b, "getLocalizedTemplate", 0, c, "getSortedPathnames", 0, m, "hasPathnamePrefixed", 0, function(e, l) {
        return l === e || l.startsWith(`${e}/`)
    }, "isLocalizableHref", 0, a, "isPromise", 0, function(e) {
        return "function" == typeof e.then
    }, "matchesPathname", 0, u, "normalizeTrailingSlash", 0, i, "prefixPathname", 0, d, "unprefixPathname", 0, function(e, l) {
        return e.replace(RegExp(`^${l}`), "") || "/"
    }], 254351), e.s(["applyPathnamePrefix", 0, function(e, l, t, n) {
        let r, {
            mode: o
        } = t.localePrefix;
        if (void 0 !== n) r = n;
        else if (a(e)) {
            let e = t.domains?.find(e => e.locales.includes(l)),
                n = e?.localePrefix || o;
            "always" === n ? r = !0 : "as-needed" === n && (r = e ? l !== e.defaultLocale : l !== t.defaultLocale)
        }
        return r ? d(b(l, t.localePrefix), e) : e
    }, "compileLocalizedPathname", 0, function(e) {
        let {
            pathname: l,
            locale: t,
            params: n,
            pathnames: r,
            query: o
        } = e;

        function a(e) {
            let l, a = r[e];
            return a ? (l = c(a, t, e), n && Object.entries(n).forEach(e => {
                let t, n, [r, o] = e;
                Array.isArray(o) ? (t = `(\\[)?\\[...${r}\\](\\])?`, n = o.map(e => String(e)).join("/")) : (t = `\\[${r}\\]`, n = String(o)), l = l.replace(RegExp(t, "g"), n)
            }), l = new URL(l = l.replace(/\[\[\.\.\..+\]\]/g, ""), "http://l").pathname) : l = e, l = i(l), o && (l += g(o)), l
        }
        if ("string" == typeof l) return a(l);
        {
            let {
                pathname: e,
                ...t
            } = l;
            return {
                ...t,
                pathname: a(e)
            }
        }
    }, "getBasePath", 0, A, "getRoute", 0, function(e, l, t) {
        let n = m(Object.keys(t)),
            r = decodeURI(l);
        for (let l of n) {
            let n = t[l];
            if ("string" == typeof n) {
                if (u(n, r)) return l
            } else if (u(c(n, e, l), r)) return l
        }
        return l
    }, "normalizeNameOrNameWithParams", 0, function(e) {
        return "string" == typeof e ? {
            pathname: e
        } : e
    }, "serializeSearchParams", 0, g], 484912), e.s(["default", 0, p], 674123);
    var G = e.i(809804),
        h = (0, n.forwardRef)(function(e, n) {
            let {
                href: o,
                locale: a,
                localeCookie: d,
                onClick: c,
                prefetch: i,
                ...u
            } = e, b = (0, r.useLocale)(), s = null != a && a !== b, V = (0, t.usePathname)();
            return s && (i = !1), (0, G.jsx)(l.default, {
                ref: n,
                href: o,
                hrefLang: s ? a : void 0,
                onClick: function(e) {
                    p(d, V, b, a), c && c(e)
                },
                prefetch: i,
                ...u
            })
        });
    e.s(["default", 0, h], 730828)
}, 757986, e => {
    "use strict";
    var l = e.i(745911),
        t = e.i(809804);
    e.s(["default", 0, function(e) {
        let {
            locale: n,
            ...r
        } = e;
        if (!n) throw Error(void 0);
        return (0, t.jsx)(l.IntlProvider, {
            locale: n,
            ...r
        })
    }])
}, 883355, e => {
    "use strict";
    var l = e.i(868275),
        t = e.i(360702),
        n = e.i(723941);
    let r = e => {
            try {
                localStorage.removeItem(e)
            } catch {}
        },
        o = e => {
            let l = null;
            try {
                l = localStorage.getItem(e)
            } catch {}
            return null == l ? null : (0, n.deserializeUntyped)(l).getOrNull()
        };
    class a extends Error {
        constructor(e) {
            super(e.code, {
                cause: e
            }), (0, l._)(this, "cause", void 0), this.cause = e
        }
    }
    let d = (e, l) => {
            let r = (0, n.serialize)(l);
            if (r.isErr()) return (0, t.err)(new a({
                code: "JsonSerialization",
                error: r.error
            }));
            try {
                return localStorage.setItem(e, r.value), (0, t.ok)(null)
            } catch (e) {
                return (0, t.err)(new a({
                    code: "Unknown",
                    error: e
                }))
            }
        },
        c = 0,
        i = e => {
            c = Number.MAX_SAFE_INTEGER;
            let l = o("expiryList");
            if (null != l && 0 !== l.version) return (0, t.err)(new a({
                code: "PageRefreshNeeded"
            }));
            let n = Date.now(),
                i = {};
            for (let [t, o] of Object.entries(l?.data ?? {}))
                if (t === e?.key) {
                    let {
                        maxAge: l
                    } = e.options;
                    if (null != l) {
                        let e = n + l;
                        c = Math.min(c, e), i[t] = e
                    }
                } else n >= o ? r(t) : (c = Math.min(c, o), i[t] = o);
            return d("expiryList", {
                version: 0,
                data: i
            })
        };
    e.s(["LocalStorageWriteError", 0, a, "getItem", 0, e => (Date.now() >= c && i(), o(e)), "hasItem", 0, e => {
        try {
            return null != localStorage.getItem(e)
        } catch {
            return !1
        }
    }, "removeItem", 0, r, "setItem", 0, function(e, l) {
        let t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return i({
            key: e,
            options: t
        }).andThen(() => d(e, l))
    }])
}, 10224, e => {
    "use strict";
    var l, t, n = e.i(868275),
        r = e.i(357355),
        o = e.i(646424),
        a = e.i(849735),
        d = e.i(552566),
        c = e.i(723941),
        i = e.i(587541),
        u = e.i(519003),
        b = ((l = {})[l.ok = 200] = "ok", l[l.accepted = 202] = "accepted", l[l.movedPermanently = 301] = "movedPermanently", l[l.badRequest = 400] = "badRequest", l[l.unauthorized = 401] = "unauthorized", l[l.forbidden = 403] = "forbidden", l[l.notFound = 404] = "notFound", l[l.methodNotAllowed = 405] = "methodNotAllowed", l[l.conflict = 409] = "conflict", l[l.payloadTooLarge = 413] = "payloadTooLarge", l[l.tooManyAttempts = 429] = "tooManyAttempts", l[l.serverError = 500] = "serverError", l[l.serviceUnavailable = 503] = "serviceUnavailable", l),
        s = ((t = {}).GET = "get", t.HEAD = "head", t.POST = "post", t.PUT = "put", t.DELETE = "delete", t.OPTIONS = "options", t.PATCH = "patch", t);
    class V extends Error {
        constructor(e, l, t, r) {
            super(e), (0, n._)(this, "config", void 0), (0, n._)(this, "response", void 0), (0, n._)(this, "code", void 0), (0, n._)(this, "isAxiosError", void 0), this.config = l, this.response = t, this.code = r, this.isAxiosError = !0, this.name = "AxiosError"
        }
    }
    let Z = [...i.defaultUrlOptions.domainAllowlist, ".rbxcdn.com"],
        W = e => "string" == typeof e || "number" == typeof e || "boolean" == typeof e ? String(e) : (0, c.serialize)(e).getOrThrow(),
        R = (e, l, t, n, r) => {
            let o;
            return {
                data: (e => {
                    if (0 === e.length) return "";
                    let l = (0, c.deserializeUntyped)(e);
                    return l.isErr() ? e : l.value
                })(r),
                status: l,
                statusText: t,
                headers: (o = {}, n.forEach((e, l) => {
                    o[l] = e
                }), o),
                config: e
            }
        },
        m = async (e, l, t, n) => {
            let d, b = (d = new Headers, l.noCache && (d.set("Cache-Control", "no-cache, no-store, must-revalidate"), d.set("Pragma", "no-cache"), d.set("Expires", "0")), Object.entries(l.headers ?? {}).forEach(e => {
                    let [l, t] = e;
                    null != t && d.set(l, String(t))
                }), l.noPragma && d.delete("Pragma"), null != l.authBearerToken && d.set("X-Auth-Bearer-Token", l.authBearerToken), {
                    headers: d,
                    includeBodyOnError: !0,
                    ...l.withCredentials ? {
                        credentials: "include"
                    } : {},
                    ...null != l.timeout && l.timeout > 0 ? {
                        signal: AbortSignal.timeout(l.timeout)
                    } : {}
                }),
                s = new Headers(b.headers),
                m = "GET" === e || "DELETE" === e ? void 0 : ((e, l) => {
                    if (null != e) return "string" == typeof e || e instanceof ArrayBuffer || ArrayBuffer.isView(e) ? e : null != r.window && e instanceof r.window.Document ? (l.set("Content-Type", "application/xml"), new r.window.XMLSerializer().serializeToString(e)) : Array.isArray(e) || Object.getPrototypeOf(e) === Object.prototype ? (l.has("Content-Type") || l.set("Content-Type", "application/json"), (0, c.serialize)(e).getOrThrow()) : e
                })(t, s),
                g = void 0 === n ? l : {
                    ...l,
                    params: n
                };
            try {
                let t = await o.fetch(((e, l) => {
                    var t;
                    let n, o = (t = e.url, n = /^([a-z]+:\/\/|\/\/)/i.test(t) ? t.startsWith("//") ? `https:${t}` : t : new URL(t, (0, u.getPageBaseUrls)().wwwRoblox.href).href, i.Url.parseWithOptions(n, {
                        domainAllowlist: Z
                    }).getOrThrow());
                    if (null == l) return o;
                    let a = null != r.window && l instanceof r.window.URLSearchParams ? [...l.entries()] : Object.entries(l).flatMap(e => {
                        let [l, t] = e;
                        return null == t ? [] : Array.isArray(t) ? t.map(e => [`${l}[]`, W(e)]) : [
                            [l, W(t)]
                        ]
                    });
                    return o.withSearchParamsAppended(a)
                })(l, n), {
                    ...b,
                    method: e,
                    headers: s,
                    body: m
                }).getOrThrow();
                return R(g, t.status, t.statusText, t.headers, await t.text())
            } catch (t) {
                if (!(t instanceof a.HttpError)) throw t;
                let e = R(g, t.response.status, t.response.statusText, t.response.headers, t.response.body ?? "");
                if (l.fullError) return Promise.reject(new V(t.message, l, e));
                return Promise.reject(e)
            }
        }, g = e => {
            let l = [];
            if (!e || "object" != typeof e) return [];
            let {
                errors: t
            } = e;
            return t instanceof Array ? (t.forEach(e => {
                if (!e || "object" != typeof e) return;
                let {
                    code: t
                } = e;
                "number" == typeof t && l.push(t)
            }), l) : []
        };
    e.s(["AxiosError", 0, V, "HttpRequestMethods", () => s, "HttpResponseCodes", () => b, "delete", 0, (e, l) => m("DELETE", e, void 0, l ?? e.params), "get", 0, (e, l) => m("GET", e, void 0, l ?? e.params), "getApiErrorCodes", 0, g, "isCancelled", 0, e => e instanceof d.AbortError || e instanceof Error && "AbortError" === e.name, "parseErrorCode", 0, e => {
        let l = g(e);
        return "object" == typeof e && null != e && g(e.data).forEach(e => {
            l.push(e)
        }), l[0] ?? null
    }, "patch", 0, (e, l) => m("PATCH", e, l, e.params), "post", 0, (e, l) => m("POST", e, l, e.params), "put", 0, (e, l) => m("PUT", e, l, e.params)])
}, 496283, e => {
    "use strict";
    e.s(["getInternalPageName", 0, () => {
        if ("u" < typeof document) return;
        let e = document.querySelector('meta[name="page-meta"]');
        return e?.dataset.internalPageName
    }])
}, 341332, e => {
    "use strict";
    var l = e.i(357355),
        t = e.i(358239);
    e.s(["DeviceTypes", 0, {
        computer: "computer",
        tablet: "tablet",
        phone: "phone",
        console: "console"
    }, "getDeviceMeta", 0, () => (0, t.getDeviceClient)(), "isIos13Ipad", 0, () => l.navigator?.platform === "MacIntel" && l.navigator.maxTouchPoints > 1, "isMac", 0, () => "osx" === (0, t.getDeviceClient)().operatingSystem, "isWindows", 0, () => "windows" === (0, t.getDeviceClient)().operatingSystem])
}, 679025, e => {
    "use strict";
    var l = e.i(695524),
        t = e.i(420546),
        n = e.i(285586),
        r = e.i(828873),
        o = e.i(563969),
        a = e.i(865607);
    e.s(["showReportDialog", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            d = a.WINDOW.document,
            c = d?.head || d?.body;
        if (!c) {
            o.DEBUG_BUILD && l.debug.error("[showReportDialog] Global document not defined");
            return
        }
        let i = (0, t.getCurrentScope)(),
            u = (0, t.getClient)(),
            b = u?.getDsn();
        if (!b) {
            o.DEBUG_BUILD && l.debug.error("[showReportDialog] DSN not configured");
            return
        }
        let s = {
                ...e,
                user: {
                    ...i.getUser(),
                    ...e.user
                },
                eventId: e.eventId || (0, n.lastEventId)()
            },
            V = a.WINDOW.document.createElement("script");
        V.async = !0, V.crossOrigin = "anonymous", V.src = (0, r.getReportDialogEndpoint)(b, s);
        let {
            onLoad: Z,
            onClose: W
        } = s;
        if (Z && (V.onload = Z), W) {
            let e = l => {
                if ("__sentry_reportdialog_closed__" === l.data) try {
                    W()
                } finally {
                    a.WINDOW.removeEventListener("message", e)
                }
            };
            a.WINDOW.addEventListener("message", e)
        }
        c.appendChild(V)
    }])
}, 302952, e => {
    "use strict";
    let l = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    e.s(["DEBUG_BUILD", 0, l])
}, 468512, 793502, e => {
    "use strict";
    var l = e.i(420546),
        t = e.i(285586),
        n = e.i(59172),
        r = e.i(371847);

    function o(e, o, a) {
        let d, {
            componentStack: c
        } = o;
        if (null !== (d = r.version.match(/^([^.]+)/)) && parseInt(d[0]) >= 17 && (0, n.isError)(e) && c) {
            let l, t = Error(e.message);
            t.name = `React ErrorBoundary ${e.name}`, t.stack = c, l = new WeakSet,
                function e(t, n) {
                    if (!l.has(t)) {
                        if (t.cause) return l.add(t), e(t.cause, n);
                        t.cause = n
                    }
                }(e, t)
        }
        return (0, l.withScope)(l => (l.setContext("react", {
            componentStack: c
        }), (0, t.captureException)(e, a)))
    }
    e.s(["captureReactException", 0, o, "reactErrorHandler", 0, function(e) {
        return (l, t) => {
            let n = !!e,
                r = o(l, t, {
                    mechanism: {
                        handled: n,
                        type: "auto.function.react.error_handler"
                    }
                });
            n && e(l, t, r)
        }
    }], 468512);
    let a = {
            childContextTypes: !0,
            contextType: !0,
            contextTypes: !0,
            defaultProps: !0,
            displayName: !0,
            getDefaultProps: !0,
            getDerivedStateFromError: !0,
            getDerivedStateFromProps: !0,
            mixins: !0,
            propTypes: !0,
            type: !0
        },
        d = {
            name: !0,
            length: !0,
            prototype: !0,
            caller: !0,
            callee: !0,
            arguments: !0,
            arity: !0
        },
        c = {
            $$typeof: !0,
            compare: !0,
            defaultProps: !0,
            displayName: !0,
            propTypes: !0,
            type: !0
        },
        i = Symbol.for("react.forward_ref"),
        u = Symbol.for("react.memo"),
        b = {};

    function s(e) {
        if ("object" == typeof e && null !== e && e.$$typeof === u) return c;
        let l = e.$$typeof;
        return l && b[l] || a
    }
    b[i] = {
        $$typeof: !0,
        render: !0,
        defaultProps: !0,
        displayName: !0,
        propTypes: !0
    }, b[u] = c;
    let V = Object.defineProperty.bind(Object),
        Z = Object.getOwnPropertyNames.bind(Object),
        W = Object.getOwnPropertySymbols?.bind(Object),
        R = Object.getOwnPropertyDescriptor.bind(Object),
        m = Object.getPrototypeOf.bind(Object),
        g = Object.prototype;
    e.s(["hoistNonReactStatics", 0, function e(l, t, n) {
        if ("string" != typeof t) {
            if (g) {
                let n = m(t);
                n && n !== g && e(l, n)
            }
            let n = Z(t);
            W && (n = n.concat(W(t)));
            let r = s(l),
                o = s(t);
            for (let e of n)
                if (!d[e] && !o?.[e] && !r?.[e] && !R(l, e)) {
                    let n = R(t, e);
                    if (n) try {
                        V(l, e, n)
                    } catch (e) {}
                }
        }
        return l
    }], 793502)
}, 432464, e => {
    "use strict";
    var l = e.i(420546),
        t = e.i(679025),
        n = e.i(695524),
        r = e.i(371847),
        o = e.i(302952),
        a = e.i(468512),
        d = e.i(793502);
    let c = {
        componentStack: null,
        error: null,
        eventId: null
    };
    class i extends r.Component {
        componentDidCatch(e, n) {
            let {
                componentStack: r
            } = n, {
                beforeCapture: o,
                onError: d,
                showDialog: c,
                dialogOptions: i
            } = this.props;
            (0, l.withScope)(l => {
                o && o(l, e, r);
                let u = null != this.props.handled ? this.props.handled : !!this.props.fallback,
                    b = (0, a.captureReactException)(e, n, {
                        mechanism: {
                            handled: u,
                            type: "auto.function.react.error_boundary"
                        }
                    });
                d && d(e, r, b), c && (this._lastEventId = b, this._openFallbackReportDialog && (0, t.showReportDialog)({
                    ...i,
                    eventId: b
                })), this.setState({
                    error: e,
                    componentStack: r,
                    eventId: b
                })
            })
        }
        componentDidMount() {
            let {
                onMount: e
            } = this.props;
            e && e()
        }
        componentWillUnmount() {
            let {
                error: e,
                componentStack: l,
                eventId: t
            } = this.state, {
                onUnmount: n
            } = this.props;
            n && (this.state === c ? n(null, null, null) : n(e, l, t)), this._cleanupHook && (this._cleanupHook(), this._cleanupHook = void 0)
        }
        resetErrorBoundary() {
            let {
                onReset: e
            } = this.props, {
                error: l,
                componentStack: t,
                eventId: n
            } = this.state;
            e && e(l, t, n), this.setState(c)
        }
        render() {
            let {
                fallback: e,
                children: l
            } = this.props, t = this.state;
            if (null === t.componentStack) return "function" == typeof l ? l() : l;
            let a = "function" == typeof e ? r.createElement(e, {
                error: t.error,
                componentStack: t.componentStack,
                resetError: () => this.resetErrorBoundary(),
                eventId: t.eventId
            }) : e;
            return r.isValidElement(a) ? a : (e && o.DEBUG_BUILD && n.debug.warn("fallback did not produce a valid ReactElement"), null)
        }
        constructor(e) {
            super(e), this.state = c, this._openFallbackReportDialog = !0;
            const n = (0, l.getClient)();
            n && e.showDialog && (this._openFallbackReportDialog = !1, this._cleanupHook = n.on("afterSendEvent", l => {
                !l.type && this._lastEventId && l.event_id === this._lastEventId && (0, t.showReportDialog)({
                    ...e.dialogOptions,
                    eventId: this._lastEventId
                })
            }))
        }
    }
    e.s(["ErrorBoundary", 0, i, "withErrorBoundary", 0, function(e, l) {
        let t = e.displayName || e.name || "unknown",
            n = r.memo(t => r.createElement(i, {
                ...l
            }, r.createElement(e, {
                ...t
            })));
        return n.displayName = `errorBoundary(${t})`, (0, d.hoistNonReactStatics)(n, e), n
    }])
}, 26853, e => {
    "use strict";
    var l = e.i(809804),
        t = e.i(371847),
        n = e.i(577896);
    let r = (0, t.createContext)(n.defaultRootDomain);
    e.s(["DomainProvider", 0, function(e) {
        let {
            domain: t,
            children: n
        } = e;
        return (0, l.jsx)(r.Provider, {
            value: t,
            children: n
        })
    }, "usePageDomain", 0, () => (0, t.useContext)(r)])
}, 288014, 861856, 674094, e => {
    "use strict";
    e.i(778365);
    var l = e.i(860430),
        t = (e.i(84523), e.i(675618));
    let n = (0, l.fileDesc)("Ch9ldmVudC9ldmVudF9maWVsZF9vcHRpb25zLnByb3RvEgVldmVudCIlCgtKc29uT3B0aW9ucxIWCg5wYXJhbWV0ZXJfbmFtZRgBIAEoCSI6CgxGcm9zdE9wdGlvbnMSFAoMaXNfdHRsX2ZpZWxkGAEgASgIEhQKDGlzX3RpbWVzdGFtcBgCIAEoCCIjCgtTaW5rT3B0aW9ucxIUCgxpc19rZXlfZmllbGQYASABKAgiKQoQRXZlbnRNZXRhT3B0aW9ucxIVCg1pc19ldmVudF90aW1lGAEgASgIIskFCg5BdWdtZW50T3B0aW9ucxIcChRkZXJpdmVfdXNlcl9rZXlfZnJvbRgBIAEoCRIhChhhZGRfYWNjb3VudF9jb3VudHJ5X2NvZGUY7wcgASgIEhgKD2FkZF9hZ2VfYnJhY2tldBjrByABKAgSIAoXYWRkX2FwcGxpY2FibGVfcG9saWNpZXMY8QcgASgIEh0KFGFkZF9hcHBsaWNhdGlvbl9uYW1lGPcHIAEoCBIcChNhZGRfYXV0aF9zZXNzaW9uX2lkGPgHIAEoCBIiChlhZGRfYXV0aGVudGljYXRlZF91c2VyX2lkGOwHIAEoCBIjChphZGRfYXV0aGVudGljYXRlZF91c2VyX2tleRj1ByABKAgSHwoWYWRkX2Jyb3dzZXJfdHJhY2tlcl9pZBjqByABKAgSJQocYWRkX2Vudmlyb25tZW50X2FiYnJldmlhdGlvbhjwByABKAgSGQoQYWRkX2V2ZW50X3RhcmdldBjRDyABKAgSFwoOYWRkX2V2ZW50X3R5cGUY0g8gASgIEh0KFGFkZF9odHRwX2ZpbmdlcnByaW50GPkHIAEoCBIaChFhZGRfcGxhdGZvcm1fdHlwZRjpByABKAgSHQoUYWRkX3BsYXRmb3JtX3R5cGVfaWQY/AcgASgIEhAKB2FkZF9yY2MY9gcgASgIEiEKGGFkZF9yZXF1ZXN0X2NvdW50cnlfY29kZRjuByABKAgSFwoOYWRkX3JlcXVlc3RfaXAY7QcgASgIEiEKGGFkZF90ZW5jZW50X2FjY2Vzc190b2tlbhjzByABKAgSHAoTYWRkX3RlbmNlbnRfb3Blbl9pZBjyByABKAgSHAoTYWRkX3Rsc19maW5nZXJwcmludBj6ByABKAgSFwoOYWRkX3VzZXJfYWdlbnQY9AcgASgIEhgKD2FkZF91c2VyX29yaWdpbhj7ByABKAgiSgoKUElJT3B0aW9ucxISCgppc191c2VyX2lkGAEgASgIEhMKC2lzX3VzZXJfa2V5GAMgASgIEhMKC3BvbGljeV90YWdzGAIgAygJIkYKFENvbXBhdGliaWxpdHlPcHRpb25zEhcKD2lzX2V2ZW50X3RhcmdldBgBIAEoCBIVCg1pc19ldmVudF90eXBlGAIgASgIIk4KGkZyb3N0RmVhdHVyZUxvZ2dpbmdPcHRpb25zEhcKD3JlZ2lzdGVyZWRfbmFtZRgBIAEoCRIXCg9mZWF0dXJlX3NlcnZpY2UYAiABKAkiSAoaRnJvc3RGZWF0dXJlU2VydmljZU9wdGlvbnMSFAoMZmVhdHVyZV92aWV3GAEgASgJEhQKDGZlYXR1cmVfbmFtZRgCIAEoCTpMCgRtZXRhEh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjhpxIgASgLMhcuZXZlbnQuRXZlbnRNZXRhT3B0aW9uc1IEbWV0YTpQCgdhdWdtZW50Eh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjipxIgASgLMhUuZXZlbnQuQXVnbWVudE9wdGlvbnNSB2F1Z21lbnQ6RAoDcGlpEh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjjpxIgASgLMhEuZXZlbnQuUElJT3B0aW9uc1IDcGlpOkcKBGpzb24SHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOSnEiABKAsyEi5ldmVudC5Kc29uT3B0aW9uc1IEanNvbjpHCgRzaW5rEh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjlpxIgASgLMhIuZXZlbnQuU2lua09wdGlvbnNSBHNpbms6SgoFZnJvc3QSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOanEiABKAsyEy5ldmVudC5Gcm9zdE9wdGlvbnNSBWZyb3N0OmIKDWNvbXBhdGliaWxpdHkSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOenEiABKAsyGy5ldmVudC5Db21wYXRpYmlsaXR5T3B0aW9uc1INY29tcGF0aWJpbGl0eTp2ChVmcm9zdF9mZWF0dXJlX2xvZ2dpbmcSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOinEiABKAsyIS5ldmVudC5Gcm9zdEZlYXR1cmVMb2dnaW5nT3B0aW9uc1ITZnJvc3RGZWF0dXJlTG9nZ2luZzp2ChVmcm9zdF9mZWF0dXJlX3NlcnZpY2USHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOmnEiABKAsyIS5ldmVudC5Gcm9zdEZlYXR1cmVTZXJ2aWNlT3B0aW9uc1ITZnJvc3RGZWF0dXJlU2VydmljZUI9Wi5naXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50ogIKTk9UX0lOX1VTRWIGcHJvdG8z", [t.file_google_protobuf_descriptor]);
    e.s(["file_event_event_field_options", 0, n], 288014), e.i(649464);
    let r = (0, l.fileDesc)("CjFldmVudHN0cmVhbS9jb3JlL2hpdmVfdGFibGVfbWVzc2FnZV9vcHRpb25zLnByb3RvEhBldmVudHN0cmVhbS5jb3JlIuoBChBIaXZlVGFibGVPcHRpb25zEg4KBnNjaGVtYRgBIAEoCRIMCgRuYW1lGAIgASgJEjEKBHR5cGUYAyABKA4yHy5ldmVudHN0cmVhbS5jb3JlLkhpdmVUYWJsZVR5cGVCAhgBEhcKD3BhcnRpdGlvbl9vcmRlchgEIAEoCRIpCiFyZXRlbnRpb25fb2Zfd2FybV9zdG9yYWdlX2luX2RheXMYBSABKAMSKQohcmV0ZW50aW9uX29mX2NvbGRfc3RvcmFnZV9pbl9kYXlzGAYgASgDEhYKDmRhdGFfbGFrZV9uYW1lGAcgASgJIo4CCgxLYWZrYU9wdGlvbnMSFgoObnVtX3BhcnRpdGlvbnMYASABKAUSHgoWbnVtX3BhcnRpdGlvbnNfc3RhZ2luZxgCIAEoBRIcChRwYXJ0aXRpb25fa2V5X2ZpZWxkcxgDIAMoCRIfChdvbWl0X3NjaGVtYV9yZWdpc3RyeV9pZBgEIAEoCBIyCgtjb21wcmVzc2lvbhgFIAEoDjIdLmV2ZW50c3RyZWFtLmNvcmUuQ29tcHJlc3Npb24SFgoOcWFhc19uYW1lc3BhY2UYBiABKAkSHQoVYWxsb3dfdW5zYWZlX2RlbGl2ZXJ5GAcgASgIEhwKFGFsbG93ZWRfaW5fdHJheV9tb2RlGAggASgIInsKEURhdGFWb2x1bWVPcHRpb25zEiQKHGV4cGVjdGVkX3BlYWtfZXZlbnRzX3Blcl9zZWMYASABKAMSKwojZXhwZWN0ZWRfbWF4X3NpemVfb2ZfZXZlbnRfaW5fYnl0ZXMYAiABKAMSEwoLc2FtcGxlX3JhdGUYAyABKAIizAIKEERhdGFNb2RlbE9wdGlvbnMSLQoJZGF0YV90aWVyGAEgASgOMhouZXZlbnRzdHJlYW0uY29yZS5EYXRhVGllchISCgZvd25lcnMYAiADKAlCAhgBEhgKDG9uY2FsbF90ZWFtcxgDIAMoCUICGAESGgoScHJvZHVjZXJfYXBwX25hbWVzGAQgAygJEhoKEmNvbnN1bWVyX2FwcF9uYW1lcxgFIAMoCRIcChRhZ2dyZWdhdGVfZGltZW5zaW9ucxgGIAMoCRImCgVvd25lchgHIAEoCzIXLmV2ZW50c3RyZWFtLmNvcmUuT3duZXISFgoOc2xhY2tfY2hhbm5lbHMYCCADKAkSGgoScGFnZXJkdXR5X3NlcnZpY2VzGAkgAygJEg4KBmVtYWlscxgKIAMoCRIZChFwb2ludHNfb2ZfY29udGFjdBgLIAMoCSKvBAoLRXZlbnRTY2hlbWESEwoLc2NoZW1hX25hbWUYASABKAkSMAoLZXZlbnRfdHlwZXMYAiADKAsyGy5ldmVudHN0cmVhbS5jb3JlLkV2ZW50VHlwZRIzCg1lYWFzX2VudGl0aWVzGAcgAygLMhwuZXZlbnRzdHJlYW0uY29yZS5FYWFzRW50aXR5EjgKD2RhdGFiYXNlX3RhYmxlcxgIIAMoCzIfLmV2ZW50c3RyZWFtLmNvcmUuRGF0YWJhc2VUYWJsZRJHChBzaW5rX2Rlc3RpbmF0aW9uGAMgASgOMi0uZXZlbnRzdHJlYW0uY29yZS5FdmVudFNjaGVtYS5TaW5rRGVzdGluYXRpb24SMQoJZGF0YV90aWVyGAQgASgOMhouZXZlbnRzdHJlYW0uY29yZS5EYXRhVGllckICGAESEQoFb3duZXIYBSABKAlCAhgBEhMKC2thZmthX3RvcGljGAYgASgJIsUBCg9TaW5rRGVzdGluYXRpb24SCAoETk9ORRAAEhUKDUZJUkVIT1NFX09OTFkQARoCCAESEgoKS0FGS0FfT05MWRACGgIIARIaChJGSVJFSE9TRV9BTkRfS0FGS0EQAxoCCAESIwobRklSRUhPU0VfQU5EX0tBRktBX0FORF9RQUFTEAQaAggBEhYKDktBRktBX0FORF9RQUFTEAUaAggBEg0KCVFBQVNfT05MWRAGEhUKEUZJUkVIT1NFX0FORF9RQUFTEAcisQIKCUV2ZW50VHlwZRIOCgZ0YXJnZXQYASABKAkSDAoEbmFtZRgCIAEoCRJLChBmaWVsZFJlZ2V4RmlsdGVyGAMgAygLMjEuZXZlbnRzdHJlYW0uY29yZS5FdmVudFR5cGUuRmllbGRSZWdleEZpbHRlckVudHJ5EkAKDWNvbXBhdGliaWxpdHkYBCABKA4yKS5ldmVudHN0cmVhbS5jb3JlLkV2ZW50VHlwZS5Db21wYXRpYmlsaXR5GjcKFUZpZWxkUmVnZXhGaWx0ZXJFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAk6AjgBIj4KDUNvbXBhdGliaWxpdHkSCwoHREVGQVVMVBAAEiAKHERVQUxfV1JJVEVfVE9fRVZFTlRTX1BBUlFVRVQQASI8CgpFYWFzRW50aXR5EhgKEGZ1bGxfZW50aXR5X25hbWUYASABKAkSFAoMZW50aXR5X2dyb3VwGAIgASgJIlEKDURhdGFiYXNlVGFibGUSFQoNZGF0YWJhc2VfbmFtZRgBIAEoCRISCgp0YWJsZV9uYW1lGAIgASgJEhUKDWRhdGFiYXNlX3R5cGUYAyABKAkijAEKBU93bmVyEgsKA29yZxgBIAEoCRIMCgR0ZWFtGAIgASgJEhAKA3BvZBgDIAEoCUgAiAEBEhMKBnJvc19pZBgEIAEoA0gBiAEBEhsKDmJ1c2luZXNzX2dyb3VwGAUgASgJSAKIAQFCBgoEX3BvZEIJCgdfcm9zX2lkQhEKD19idXNpbmVzc19ncm91cCKkAQoLQXV0aE9wdGlvbnMSPgoMYXV0aF9tZXRob2RzGAEgAygOMiguZXZlbnRzdHJlYW0uY29yZS5BdXRoT3B0aW9ucy5BdXRoTWV0aG9kIlUKCkF1dGhNZXRob2QSCwoHTk9fQVVUSBAAEgwKCElOVEVSTkFMEAESBwoDUkNDEAISFgoSQVVUSEVOVElDQVRFRF9VU0VSEAMSCwoHQVBJX0tFWRAEIpwCCgtHZHByT3B0aW9ucxI5CgNwaWkYASABKA4yJy5ldmVudHN0cmVhbS5jb3JlLkdkcHJPcHRpb25zLlBpaU1ldGhvZEgAiAEBEiEKFGNkY19hcmNoaXZlcl9lbmFibGVkGAIgASgISAGIAQEijQEKCVBpaU1ldGhvZBIRCg1TRVRfVVNFUl9LRVlTEAASEAoMU0VUX1VTRVJfSURTEAESOAo0QlJFQUtfR0RQUl9DT01QTElBTkNFX0FORF9TRVRfQk9USF9VU0VSX0lEU19BTkRfS0VZUxACEiEKHVNFVF9ORUlUSEVSX1VTRVJfS0VZU19OT1JfSURTEANCBgoEX3BpaUIXChVfY2RjX2FyY2hpdmVyX2VuYWJsZWQqQAoNSGl2ZVRhYmxlVHlwZRILCgdVTktOT1dOEAASDgoKV1dXX0xFR0FDWRABEhIKDkVWRU5UU1RSRUFNX1YxEAIqIwoLQ29tcHJlc3Npb24SCAoETk9ORRAAEgoKBlNOQVBQWRABKlcKCERhdGFUaWVyEhAKDFRJRVJfREVGQVVMVBAAEg0KCVRJRVJfWkVSTxABEgwKCFRJRVJfT05FEAISDAoIVElFUl9UV08QAxIOCgpUSUVSX1RIUkVFEAQ6WwoFdGFibGUSHy5nb29nbGUucHJvdG9idWYuTWVzc2FnZU9wdGlvbnMYya8SIAEoCzIiLmV2ZW50c3RyZWFtLmNvcmUuSGl2ZVRhYmxlT3B0aW9uc1IFdGFibGU6VwoFa2Fma2ESHy5nb29nbGUucHJvdG9idWYuTWVzc2FnZU9wdGlvbnMYyq8SIAEoCzIeLmV2ZW50c3RyZWFtLmNvcmUuS2Fma2FPcHRpb25zUgVrYWZrYTpnCgtkYXRhX3ZvbHVtZRIfLmdvb2dsZS5wcm90b2J1Zi5NZXNzYWdlT3B0aW9ucxjLrxIgASgLMiMuZXZlbnRzdHJlYW0uY29yZS5EYXRhVm9sdW1lT3B0aW9uc1IKZGF0YVZvbHVtZTpkCgpkYXRhX21vZGVsEh8uZ29vZ2xlLnByb3RvYnVmLk1lc3NhZ2VPcHRpb25zGMyvEiABKAsyIi5ldmVudHN0cmVhbS5jb3JlLkRhdGFNb2RlbE9wdGlvbnNSCWRhdGFNb2RlbDpnCg5zY2hlbWFfbWFwcGluZxIfLmdvb2dsZS5wcm90b2J1Zi5NZXNzYWdlT3B0aW9ucxjNrxIgASgLMh0uZXZlbnRzdHJlYW0uY29yZS5FdmVudFNjaGVtYVINc2NoZW1hTWFwcGluZzpUCgRhdXRoEh8uZ29vZ2xlLnByb3RvYnVmLk1lc3NhZ2VPcHRpb25zGM6vEiABKAsyHS5ldmVudHN0cmVhbS5jb3JlLkF1dGhPcHRpb25zUgRhdXRoOlQKBGdkcHISHy5nb29nbGUucHJvdG9idWYuTWVzc2FnZU9wdGlvbnMYz68SIAEoCzIdLmV2ZW50c3RyZWFtLmNvcmUuR2Rwck9wdGlvbnNSBGdkcHJCO1o5Z2l0aHViLnJieC5jb20vcm9ibG94L3NjaGVtYS1wcm90b2dlbi9nby9ldmVudHN0cmVhbS9jb3JlYgZwcm90bzM", [t.file_google_protobuf_descriptor]);
    e.s(["file_eventstream_core_hive_table_message_options", 0, r], 861856);
    var o = e.i(868275),
        a = e.i(400661),
        d = e.i(343549),
        c = e.i(950814),
        i = e.i(800510),
        u = class {
            async sendEvent(e, l) {
                try {
                    let t = (0, a.toBinary)(e, (0, d.create)(e, l), {
                            writeUnknownFields: !1
                        }),
                        n = (0, d.create)(i.SendEventRequestSchema, {
                            event: {
                                source: e.typeName,
                                payload: t
                            }
                        }),
                        r = await fetch(`${this.baseUrl}/v1/events/single`, {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/x-protobuf",
                                "Content-Encoding": "gzip"
                            },
                            body: (0, c.gzipSync)((0, a.toBinary)(i.SendEventRequestSchema, n, {
                                writeUnknownFields: !1
                            })),
                            credentials: "include",
                            keepalive: !0
                        });
                    if (!r.ok) throw Error(`status ${r.status}`)
                } catch (e) {
                    console.error("EventStream failed to send event:", e)
                }
            }
            async sendBatch(e) {
                try {
                    let l = new Map;
                    for (let t of e) {
                        let e = t.schema.typeName;
                        l.has(e) || l.set(e, []), l.get(e).push(t)
                    }
                    let t = Array.from(l.entries()).map(e => {
                            let [l, t] = e, n = t.map(e => {
                                let {
                                    schema: l,
                                    msg: t
                                } = e;
                                return (0, a.toBinary)(l, (0, d.create)(l, t), {
                                    writeUnknownFields: !1
                                })
                            });
                            return (0, d.create)(i.SendOptimizedBatchRequest_SubBatchSchema, {
                                source: l,
                                payloads: n
                            })
                        }),
                        n = (0, d.create)(i.SendOptimizedBatchRequestSchema, {
                            subBatches: t
                        }),
                        r = await fetch(`${this.baseUrl}/v1/events/optimized`, {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/x-protobuf",
                                "Content-Encoding": "gzip"
                            },
                            body: (0, c.gzipSync)((0, a.toBinary)(i.SendOptimizedBatchRequestSchema, n, {
                                writeUnknownFields: !1
                            })),
                            credentials: "include",
                            keepalive: !0
                        });
                    if (!r.ok) throw Error(`status ${r.status}`)
                } catch (e) {
                    console.error("EventStream failed to send batch events:", e)
                }
            }
            constructor({
                baseUrl: e = "https://apis.roblox.com"
            } = {}) {
                (0, o._)(this, "baseUrl", void 0), this.baseUrl = e.replace(/\/$/, "") + "/experience-signals-ingest/public"
            }
        };
    e.s(["EventStreamClient", 0, u], 674094)
}, 942060, e => {
    "use strict";
    var l = e.i(343549),
        t = e.i(683740),
        n = e.i(734899),
        r = e.i(860430),
        o = e.i(84523),
        a = e.i(288014);
    let d = (0, r.fileDesc)("Cj1ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvZW5naW5lX3RlbGVtZXRyeV9hdHRyaWJ1dGVzLnByb3RvEhtldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnki4wsKGUVuZ2luZVRlbGVtZXRyeUF0dHJpYnV0ZXMSfQoQaW50MzJfYXR0cmlidXRlcxgBIAMoCzJLLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlBdHRyaWJ1dGVzLkludDMyQXR0cmlidXRlc0VudHJ5QhaivpIBEQoPaW50MzJBdHRyaWJ1dGVzEn0KEGludDY0X2F0dHJpYnV0ZXMYAiADKAsySy5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkuRW5naW5lVGVsZW1ldHJ5QXR0cmlidXRlcy5JbnQ2NEF0dHJpYnV0ZXNFbnRyeUIWor6SAREKD2ludDY0QXR0cmlidXRlcxKAAQoRdWludDMyX2F0dHJpYnV0ZXMYAyADKAsyTC5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkuRW5naW5lVGVsZW1ldHJ5QXR0cmlidXRlcy5VaW50MzJBdHRyaWJ1dGVzRW50cnlCF6K+kgESChB1aW50MzJBdHRyaWJ1dGVzEoABChF1aW50NjRfYXR0cmlidXRlcxgEIAMoCzJMLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlBdHRyaWJ1dGVzLlVpbnQ2NEF0dHJpYnV0ZXNFbnRyeUIXor6SARIKEHVpbnQ2NEF0dHJpYnV0ZXMSgAEKEXN0cmluZ19hdHRyaWJ1dGVzGAUgAygLMkwuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeUF0dHJpYnV0ZXMuU3RyaW5nQXR0cmlidXRlc0VudHJ5QheivpIBEgoQc3RyaW5nQXR0cmlidXRlcxJ6Cg9ib29sX2F0dHJpYnV0ZXMYBiADKAsySi5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkuRW5naW5lVGVsZW1ldHJ5QXR0cmlidXRlcy5Cb29sQXR0cmlidXRlc0VudHJ5QhWivpIBEAoOYm9vbEF0dHJpYnV0ZXMSfQoQZmxvYXRfYXR0cmlidXRlcxgHIAMoCzJLLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlBdHRyaWJ1dGVzLkZsb2F0QXR0cmlidXRlc0VudHJ5QhaivpIBEQoPZmxvYXRBdHRyaWJ1dGVzEoABChFkb3VibGVfYXR0cmlidXRlcxgIIAMoCzJMLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlBdHRyaWJ1dGVzLkRvdWJsZUF0dHJpYnV0ZXNFbnRyeUIXor6SARIKEGRvdWJsZUF0dHJpYnV0ZXMaNgoUSW50MzJBdHRyaWJ1dGVzRW50cnkSCwoDa2V5GAEgASgJEg0KBXZhbHVlGAIgASgFOgI4ARo2ChRJbnQ2NEF0dHJpYnV0ZXNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAM6AjgBGjcKFVVpbnQzMkF0dHJpYnV0ZXNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKA06AjgBGjcKFVVpbnQ2NEF0dHJpYnV0ZXNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAQ6AjgBGjcKFVN0cmluZ0F0dHJpYnV0ZXNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAk6AjgBGjUKE0Jvb2xBdHRyaWJ1dGVzRW50cnkSCwoDa2V5GAEgASgJEg0KBXZhbHVlGAIgASgIOgI4ARo2ChRGbG9hdEF0dHJpYnV0ZXNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAI6AjgBGjcKFURvdWJsZUF0dHJpYnV0ZXNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAE6AjgBQkZaRGdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRzdHJlYW0vZW5naW5ldGVsZW1ldHJ5YgZwcm90bzM", [a.file_event_event_field_options]),
        c = (0, o.messageDesc)(d, 0);
    var i = e.i(861856);
    let u = (0, r.fileDesc)("Ck5ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvbWV0YWRhdGEvZW5naW5lX3RlbGVtZXRyeV9yZXBsYXlfaW5mb3JtYXRpb24ucHJvdG8SJGV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5tZXRhZGF0YSKcAQogRW5naW5lVGVsZW1ldHJ5UmVwbGF5SW5mb3JtYXRpb24SJwoJaXNfcmVwbGF5GAEgASgIQg+ivpIBCgoIaXNSZXBsYXlIAIgBARIvCg1wcm9kdWNlcl9uYW1lGAIgASgJQhOivpIBDgoMcHJvZHVjZXJOYW1lSAGIAQFCDAoKX2lzX3JlcGxheUIQCg5fcHJvZHVjZXJfbmFtZUJPWk1naXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50c3RyZWFtL2VuZ2luZXRlbGVtZXRyeS9tZXRhZGF0YWIGcHJvdG8z", [a.file_event_event_field_options]),
        b = (0, r.fileDesc)("CkxldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvbWV0YWRhdGEvZW5naW5lX3RlbGVtZXRyeV91c2VyX2luZm9ybWF0aW9uLnByb3RvEiRldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkubWV0YWRhdGEi0AEKHkVuZ2luZVRlbGVtZXRyeVVzZXJJbmZvcm1hdGlvbhIvCgd1c2VyX2lkGAEgASgDQhmSvpIBA+A+AZq+kgECCAGivpIBBQoDdWlkSACIAQESJgoIdXNlcl9rZXkYAiABKAlCD5K+kgEDqD8Bmr6SAQIYAUgBiAEBEicKEHBsYXRmb3JtX3R5cGVfaWQYAyABKANCCJK+kgED4D8BSAKIAQFCCgoIX3VzZXJfaWRCCwoJX3VzZXJfa2V5QhMKEV9wbGF0Zm9ybV90eXBlX2lkQk9aTWdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRzdHJlYW0vZW5naW5ldGVsZW1ldHJ5L21ldGFkYXRhYgZwcm90bzM", [a.file_event_event_field_options]),
        s = (0, r.fileDesc)("Ck9ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvbWV0YWRhdGEvZW5naW5lX3RlbGVtZXRyeV9yZWxlYXNlX2luZm9ybWF0aW9uLnByb3RvEiRldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkubWV0YWRhdGEixwIKIUVuZ2luZVRlbGVtZXRyeVJlbGVhc2VJbmZvcm1hdGlvbhIcCg90YWdfYXBwbGljYXRpb24YASABKAlIAIgBARIYCgt0YWdfb3NfdHlwZRgCIAEoCUgBiAEBEhgKC3RhZ19vc19uYW1lGAMgASgJSAKIAQESHAoPdGFnX2FwcF92ZXJzaW9uGAQgASgJSAOIAQESGAoLdGFnX2NoYW5uZWwYBSABKAlIBIgBARIkChd0YWdfZGV2aWNlX21lbW9yeV9pbl9tYhgGIAEoA0gFiAEBQhIKEF90YWdfYXBwbGljYXRpb25CDgoMX3RhZ19vc190eXBlQg4KDF90YWdfb3NfbmFtZUISChBfdGFnX2FwcF92ZXJzaW9uQg4KDF90YWdfY2hhbm5lbEIaChhfdGFnX2RldmljZV9tZW1vcnlfaW5fbWJCT1pNZ2l0aHViLnJieC5jb20vcm9ibG94L3NjaGVtYS1wcm90b2dlbi9nby9ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvbWV0YWRhdGFiBnByb3RvMw"),
        V = (0, r.fileDesc)("ClVldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvbWV0YWRhdGEvZW5naW5lX3RlbGVtZXRyeV9yb2xsb3V0X2ZsYWdzX2luZm9ybWF0aW9uLnByb3RvEiRldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkubWV0YWRhdGEibAomRW5naW5lVGVsZW1ldHJ5Um9sbG91dEZsYWdzSW5mb3JtYXRpb24SIAoYcm9sbG91dF9mbGFnc19pbl92YXJpYW50GAEgAygJEiAKGHJvbGxvdXRfZmxhZ3NfaW5fY29udHJvbBgCIAMoCUJPWk1naXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50c3RyZWFtL2VuZ2luZXRlbGVtZXRyeS9tZXRhZGF0YWIGcHJvdG8z"),
        Z = (0, r.fileDesc)("CkpldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvbWV0YWRhdGEvZW5naW5lX3RlbGVtZXRyeV9iYXRjaF9jaGVja3N1bS5wcm90bxIkZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5Lm1ldGFkYXRhIl4KHEVuZ2luZVRlbGVtZXRyeUJhdGNoQ2hlY2tzdW0SFAoHdmVyc2lvbhgBIAEoA0gAiAEBEhIKBXZhbHVlGAIgASgESAGIAQFCCgoIX3ZlcnNpb25CCAoGX3ZhbHVlQk9aTWdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRzdHJlYW0vZW5naW5ldGVsZW1ldHJ5L21ldGFkYXRhYgZwcm90bzM"),
        W = (0, r.fileDesc)("CkRldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvbWV0YWRhdGEvZW5naW5lX3RlbGVtZXRyeV9tZXRhZGF0YS5wcm90bxIkZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5Lm1ldGFkYXRhIp4FChdFbmdpbmVUZWxlbWV0cnlNZXRhZGF0YRJnChJyZXBsYXlfaW5mb3JtYXRpb24YASABKAsyRi5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkubWV0YWRhdGEuRW5naW5lVGVsZW1ldHJ5UmVwbGF5SW5mb3JtYXRpb25IAIgBARJjChB1c2VyX2luZm9ybWF0aW9uGAIgASgLMkQuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5Lm1ldGFkYXRhLkVuZ2luZVRlbGVtZXRyeVVzZXJJbmZvcm1hdGlvbkgBiAEBEmkKE3JlbGVhc2VfaW5mb3JtYXRpb24YAyABKAsyRy5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkubWV0YWRhdGEuRW5naW5lVGVsZW1ldHJ5UmVsZWFzZUluZm9ybWF0aW9uSAKIAQESdAoZcm9sbG91dF9mbGFnc19pbmZvcm1hdGlvbhgEIAEoCzJMLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5tZXRhZGF0YS5FbmdpbmVUZWxlbWV0cnlSb2xsb3V0RmxhZ3NJbmZvcm1hdGlvbkgDiAEBEl8KDmJhdGNoX2NoZWNrc3VtGAUgASgLMkIuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5Lm1ldGFkYXRhLkVuZ2luZVRlbGVtZXRyeUJhdGNoQ2hlY2tzdW1IBIgBAUIVChNfcmVwbGF5X2luZm9ybWF0aW9uQhMKEV91c2VyX2luZm9ybWF0aW9uQhYKFF9yZWxlYXNlX2luZm9ybWF0aW9uQhwKGl9yb2xsb3V0X2ZsYWdzX2luZm9ybWF0aW9uQhEKD19iYXRjaF9jaGVja3N1bUJPWk1naXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50c3RyZWFtL2VuZ2luZXRlbGVtZXRyeS9tZXRhZGF0YWIGcHJvdG8z", [a.file_event_event_field_options, u, b, s, V, Z]),
        R = (0, r.fileDesc)("Cj1ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvZW5naW5lX3RlbGVtZXRyeV9wb2ludF90YWdzLnByb3RvEhtldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkilgoKGEVuZ2luZVRlbGVtZXRyeVBvaW50VGFncxJqCgppbnQzMl90YWdzGAEgAygLMkQuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50VGFncy5JbnQzMlRhZ3NFbnRyeUIQor6SAQsKCWludDMyVGFncxJqCgppbnQ2NF90YWdzGAIgAygLMkQuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50VGFncy5JbnQ2NFRhZ3NFbnRyeUIQor6SAQsKCWludDY0VGFncxJtCgt1aW50MzJfdGFncxgDIAMoCzJFLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlQb2ludFRhZ3MuVWludDMyVGFnc0VudHJ5QhGivpIBDAoKdWludDMyVGFncxJtCgt1aW50NjRfdGFncxgEIAMoCzJFLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlQb2ludFRhZ3MuVWludDY0VGFnc0VudHJ5QhGivpIBDAoKdWludDY0VGFncxJtCgtzdHJpbmdfdGFncxgFIAMoCzJFLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlQb2ludFRhZ3MuU3RyaW5nVGFnc0VudHJ5QhGivpIBDAoKc3RyaW5nVGFncxJnCglib29sX3RhZ3MYBiADKAsyQy5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkuRW5naW5lVGVsZW1ldHJ5UG9pbnRUYWdzLkJvb2xUYWdzRW50cnlCD6K+kgEKCghib29sVGFncxJqCgpmbG9hdF90YWdzGAcgAygLMkQuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50VGFncy5GbG9hdFRhZ3NFbnRyeUIQor6SAQsKCWZsb2F0VGFncxJtCgtkb3VibGVfdGFncxgIIAMoCzJFLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlQb2ludFRhZ3MuRG91YmxlVGFnc0VudHJ5QhGivpIBDAoKZG91YmxlVGFncxowCg5JbnQzMlRhZ3NFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAU6AjgBGjAKDkludDY0VGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoAzoCOAEaMQoPVWludDMyVGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoDToCOAEaMQoPVWludDY0VGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoBDoCOAEaMQoPU3RyaW5nVGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoCToCOAEaLwoNQm9vbFRhZ3NFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAg6AjgBGjAKDkZsb2F0VGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoAjoCOAEaMQoPRG91YmxlVGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoAToCOAFCRlpEZ2l0aHViLnJieC5jb20vcm9ibG94L3NjaGVtYS1wcm90b2dlbi9nby9ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnliBnByb3RvMw", [a.file_event_event_field_options]),
        m = (0, r.fileDesc)("Cj9ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvZW5naW5lX3RlbGVtZXRyeV9wb2ludF9maWVsZHMucHJvdG8SG2V2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeSLoCgoaRW5naW5lVGVsZW1ldHJ5UG9pbnRGaWVsZHMScgoMaW50MzJfZmllbGRzGAEgAygLMkguZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50RmllbGRzLkludDMyRmllbGRzRW50cnlCEqK+kgENCgtpbnQzMkZpZWxkcxJyCgxpbnQ2NF9maWVsZHMYAiADKAsySC5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkuRW5naW5lVGVsZW1ldHJ5UG9pbnRGaWVsZHMuSW50NjRGaWVsZHNFbnRyeUISor6SAQ0KC2ludDY0RmllbGRzEnUKDXVpbnQzMl9maWVsZHMYAyADKAsySS5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkuRW5naW5lVGVsZW1ldHJ5UG9pbnRGaWVsZHMuVWludDMyRmllbGRzRW50cnlCE6K+kgEOCgx1aW50MzJGaWVsZHMSdQoNdWludDY0X2ZpZWxkcxgEIAMoCzJJLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlQb2ludEZpZWxkcy5VaW50NjRGaWVsZHNFbnRyeUITor6SAQ4KDHVpbnQ2NEZpZWxkcxJ1Cg1zdHJpbmdfZmllbGRzGAUgAygLMkkuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50RmllbGRzLlN0cmluZ0ZpZWxkc0VudHJ5QhOivpIBDgoMc3RyaW5nRmllbGRzEm8KC2Jvb2xfZmllbGRzGAYgAygLMkcuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50RmllbGRzLkJvb2xGaWVsZHNFbnRyeUIRor6SAQwKCmJvb2xGaWVsZHMScgoMZmxvYXRfZmllbGRzGAcgAygLMkguZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50RmllbGRzLkZsb2F0RmllbGRzRW50cnlCEqK+kgENCgtmbG9hdEZpZWxkcxJ1Cg1kb3VibGVfZmllbGRzGAggAygLMkkuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50RmllbGRzLkRvdWJsZUZpZWxkc0VudHJ5QhOivpIBDgoMZG91YmxlRmllbGRzGjIKEEludDMyRmllbGRzRW50cnkSCwoDa2V5GAEgASgJEg0KBXZhbHVlGAIgASgFOgI4ARoyChBJbnQ2NEZpZWxkc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoAzoCOAEaMwoRVWludDMyRmllbGRzRW50cnkSCwoDa2V5GAEgASgJEg0KBXZhbHVlGAIgASgNOgI4ARozChFVaW50NjRGaWVsZHNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAQ6AjgBGjMKEVN0cmluZ0ZpZWxkc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoCToCOAEaMQoPQm9vbEZpZWxkc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoCDoCOAEaMgoQRmxvYXRGaWVsZHNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAI6AjgBGjMKEURvdWJsZUZpZWxkc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoAToCOAFCRlpEZ2l0aHViLnJieC5jb20vcm9ibG94L3NjaGVtYS1wcm90b2dlbi9nby9ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnliBnByb3RvMw", [a.file_event_event_field_options]),
        g = (0, r.fileDesc)("Cj5ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvZW5naW5lX3RlbGVtZXRyeV9wb2ludF9ldmVudC5wcm90bxIbZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5IusHChlFbmdpbmVUZWxlbWV0cnlQb2ludEV2ZW50Eh4KBG5hbWUYASABKAlCC6K+kgEGCgRuYW1lSACIAQESHgoEbXVsdBgCIAEoAUILor6SAQYKBG11bHRIAYgBARJKChtldmVudF90aW1lc3RhbXBfbWlsbGlzZWNvbmQYAyABKANCIKK+kgEbChlldmVudFRpbWVzdGFtcE1pbGxpc2Vjb25kSAKIAQESMwodaW5nZXN0X3RpbWVzdGFtcF9taWxsaXNlY29uZHMYBCABKANCB4q+kgECCAFIA4gBARJQCgR0YWdzGAUgASgLMjUuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50VGFnc0ILor6SAQYKBHRhZ3MSVgoGZmllbGRzGAYgASgLMjcuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50RmllbGRzQg2ivpIBCAoGZmllbGRzEmAKCG1ldGFkYXRhGAcgASgLMj0uZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5Lm1ldGFkYXRhLkVuZ2luZVRlbGVtZXRyeU1ldGFkYXRhQg+ivpIBCgoIbWV0YWRhdGE6rAPS/JIBFQj0AzIQZW5naW5lLXRlbGVtZXRyedr8kgEHCIgnENCGA+L8kgGQAQgDGhBlbmdpbmUtdGVsZW1ldHJ5IgtnYW1lLWVuZ2luZSogZW5naW5lLXRlbGVtZXRyeS1wb2ludC1wcm9jZXNzb3I6OAoOSW5mcmFzdHJ1Y3R1cmUSGEVuZ2luZWVyaW5nIEFjY2VsZXJhdGlvbhoJVGVsZW1ldHJ5IJ8QQhEjZW5naW5lLXRlbGVtZXRyeer8kgHqARIsCg9lbmdpbmV0ZWxlbWV0cnkSGUVuZ2luZVRlbGVtZXRyeVBvaW50RXZlbnQSIAoDUkNDEhlFbmdpbmVUZWxlbWV0cnlQb2ludEV2ZW50EiMKBmNsaWVudBIZRW5naW5lVGVsZW1ldHJ5UG9pbnRFdmVudBIjCgZzdHVkaW8SGUVuZ2luZVRlbGVtZXRyeVBvaW50RXZlbnQSIgoFb3RoZXISGUVuZ2luZVRlbGVtZXRyeVBvaW50RXZlbnQYBiooZW5naW5lID4gc3lzdGVtcyA+IGVuZ2luZSBpbmZyYXN0cnVjdHVyZUIHCgVfbmFtZUIHCgVfbXVsdEIeChxfZXZlbnRfdGltZXN0YW1wX21pbGxpc2Vjb25kQiAKHl9pbmdlc3RfdGltZXN0YW1wX21pbGxpc2Vjb25kc0JGWkRnaXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50c3RyZWFtL2VuZ2luZXRlbGVtZXRyeWIGcHJvdG8z", [a.file_event_event_field_options, i.file_eventstream_core_hive_table_message_options, R, m, W]),
        A = (0, r.fileDesc)("CkdldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvZW5naW5lX3RlbGVtZXRyeV9jb3VudGVyX21ldHJpY19ldmVudC5wcm90bxIbZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5IpcICiFFbmdpbmVUZWxlbWV0cnlDb3VudGVyTWV0cmljRXZlbnQSHgoEbmFtZRgBIAEoCUILor6SAQYKBG5hbWVIAIgBARIgCgV2YWx1ZRgCIAEoAUIMor6SAQcKBXZhbHVlSAGIAQESSgobZXZlbnRfdGltZXN0YW1wX21pbGxpc2Vjb25kGAMgASgDQiCivpIBGwoZZXZlbnRUaW1lc3RhbXBNaWxsaXNlY29uZEgCiAEBEjMKHWluZ2VzdF90aW1lc3RhbXBfbWlsbGlzZWNvbmRzGAQgASgDQgeKvpIBAggBSAOIAQESXQoKYXR0cmlidXRlcxgFIAEoCzI2LmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlBdHRyaWJ1dGVzQhGivpIBDAoKYXR0cmlidXRlcxJgCghtZXRhZGF0YRgGIAEoCzI9LmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5tZXRhZGF0YS5FbmdpbmVUZWxlbWV0cnlNZXRhZGF0YUIPor6SAQoKCG1ldGFkYXRhEiwKC3NhbXBsZV9yYXRlGAcgASgBQhKivpIBDQoLc2FtcGxlX3JhdGVIBIgBATraA9L8kgEXCPQDEAQyEGVuZ2luZS10ZWxlbWV0cnna/JIBBwjQhgMQ6Afi/JIBlAEIAxoQZW5naW5lLXRlbGVtZXRyeSILZ2FtZS1lbmdpbmUqJGVuZ2luZS10ZWxlbWV0cnktaGlzdG9ncmFtLXByb2Nlc3Nvcjo4Cg5JbmZyYXN0cnVjdHVyZRIYRW5naW5lZXJpbmcgQWNjZWxlcmF0aW9uGglUZWxlbWV0cnkgnxBCESNlbmdpbmUtdGVsZW1ldHJ56vySAZICEjQKD2VuZ2luZXRlbGVtZXRyeRIhRW5naW5lVGVsZW1ldHJ5Q291bnRlck1ldHJpY0V2ZW50EigKA1JDQxIhRW5naW5lVGVsZW1ldHJ5Q291bnRlck1ldHJpY0V2ZW50EisKBmNsaWVudBIhRW5naW5lVGVsZW1ldHJ5Q291bnRlck1ldHJpY0V2ZW50EisKBnN0dWRpbxIhRW5naW5lVGVsZW1ldHJ5Q291bnRlck1ldHJpY0V2ZW50EioKBW90aGVyEiFFbmdpbmVUZWxlbWV0cnlDb3VudGVyTWV0cmljRXZlbnQYBiooZW5naW5lID4gc3lzdGVtcyA+IGVuZ2luZSBpbmZyYXN0cnVjdHVyZUIHCgVfbmFtZUIICgZfdmFsdWVCHgocX2V2ZW50X3RpbWVzdGFtcF9taWxsaXNlY29uZEIgCh5faW5nZXN0X3RpbWVzdGFtcF9taWxsaXNlY29uZHNCDgoMX3NhbXBsZV9yYXRlQkZaRGdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRzdHJlYW0vZW5naW5ldGVsZW1ldHJ5YgZwcm90bzM", [a.file_event_event_field_options, i.file_eventstream_core_hive_table_message_options, d, W]),
        p = (0, o.messageDesc)(A, 0),
        G = (0, r.fileDesc)("CklldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvZW5naW5lX3RlbGVtZXRyeV9oaXN0b2dyYW1fbWV0cmljX2V2ZW50LnByb3RvEhtldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkiqgkKI0VuZ2luZVRlbGVtZXRyeUhpc3RvZ3JhbU1ldHJpY0V2ZW50Eh4KBG5hbWUYASABKAlCC6K+kgEGCgRuYW1lSACIAQESHAoDc3VtGAIgASgBQgqivpIBBQoDc3VtSAGIAQESIAoFY291bnQYAyABKARCDKK+kgEHCgVjb3VudEgCiAEBEjEKEWNvdW50c19pbl9idWNrZXRzGAQgAygEQhaivpIBEQoPY291bnRzSW5CdWNrZXRzEiwKDmJ1Y2tldF9pbmRpY2VzGAUgAygFQhSivpIBDwoNYnVja2V0SW5kaWNlcxJKChtldmVudF90aW1lc3RhbXBfbWlsbGlzZWNvbmQYBiABKANCIKK+kgEbChlldmVudFRpbWVzdGFtcE1pbGxpc2Vjb25kSAOIAQESMwodaW5nZXN0X3RpbWVzdGFtcF9taWxsaXNlY29uZHMYByABKANCB4q+kgECCAFIBIgBARJdCgphdHRyaWJ1dGVzGAggASgLMjYuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeUF0dHJpYnV0ZXNCEaK+kgEMCgphdHRyaWJ1dGVzEmAKCG1ldGFkYXRhGAkgASgLMj0uZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5Lm1ldGFkYXRhLkVuZ2luZVRlbGVtZXRyeU1ldGFkYXRhQg+ivpIBCgoIbWV0YWRhdGESLAoLc2FtcGxlX3JhdGUYCiABKAFCEqK+kgENCgtzYW1wbGVfcmF0ZUgFiAEBOuQD0vySARcI4gkQBDIQZW5naW5lLXRlbGVtZXRyedr8kgEHCNCGAxDQD+L8kgGUAQgDGhBlbmdpbmUtdGVsZW1ldHJ5IgtnYW1lLWVuZ2luZSokZW5naW5lLXRlbGVtZXRyeS1oaXN0b2dyYW0tcHJvY2Vzc29yOjgKDkluZnJhc3RydWN0dXJlEhhFbmdpbmVlcmluZyBBY2NlbGVyYXRpb24aCVRlbGVtZXRyeSCfEEIRI2VuZ2luZS10ZWxlbWV0cnnq/JIBnAISNgoPZW5naW5ldGVsZW1ldHJ5EiNFbmdpbmVUZWxlbWV0cnlIaXN0b2dyYW1NZXRyaWNFdmVudBIqCgNSQ0MSI0VuZ2luZVRlbGVtZXRyeUhpc3RvZ3JhbU1ldHJpY0V2ZW50Ei0KBmNsaWVudBIjRW5naW5lVGVsZW1ldHJ5SGlzdG9ncmFtTWV0cmljRXZlbnQSLQoGc3R1ZGlvEiNFbmdpbmVUZWxlbWV0cnlIaXN0b2dyYW1NZXRyaWNFdmVudBIsCgVvdGhlchIjRW5naW5lVGVsZW1ldHJ5SGlzdG9ncmFtTWV0cmljRXZlbnQYBiooZW5naW5lID4gc3lzdGVtcyA+IGVuZ2luZSBpbmZyYXN0cnVjdHVyZUIHCgVfbmFtZUIGCgRfc3VtQggKBl9jb3VudEIeChxfZXZlbnRfdGltZXN0YW1wX21pbGxpc2Vjb25kQiAKHl9pbmdlc3RfdGltZXN0YW1wX21pbGxpc2Vjb25kc0IOCgxfc2FtcGxlX3JhdGVCRlpEZ2l0aHViLnJieC5jb20vcm9ibG94L3NjaGVtYS1wcm90b2dlbi9nby9ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnliBnByb3RvMw", [a.file_event_event_field_options, i.file_eventstream_core_hive_table_message_options, d, W]),
        h = (0, r.fileDesc)("Cj5ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvZW5naW5lX3RlbGVtZXRyeV9iYXRjaF9ldmVudC5wcm90bxIbZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5Ip8HChlFbmdpbmVUZWxlbWV0cnlCYXRjaEV2ZW50EhQKB3ZlcnNpb24YASABKANIAIgBARIRCgR1dWlkGAIgASgJSAGIAQESVAoIbWV0YWRhdGEYAyABKAsyPS5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkubWV0YWRhdGEuRW5naW5lVGVsZW1ldHJ5TWV0YWRhdGFIAogBARIpChxiYXRjaF90aW1lc3RhbXBfbWlsbGlzZWNvbmRzGAQgASgDSAOIAQESMwodaW5nZXN0X3RpbWVzdGFtcF9taWxsaXNlY29uZHMYBSABKANCB4q+kgECCAFIBIgBARJQCghjb3VudGVycxgGIAMoCzI+LmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlDb3VudGVyTWV0cmljRXZlbnQSTwoFc3RhdHMYByADKAsyQC5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkuRW5naW5lVGVsZW1ldHJ5SGlzdG9ncmFtTWV0cmljRXZlbnQSRgoGcG9pbnRzGAggAygLMjYuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50RXZlbnQSIQoKcmVxdWVzdF9pcBgJIAEoCUIIkr6SAQPoPgFIBYgBARIkCg1zb3VyY2VfaXNfcmNjGAogASgIQgiSvpIBA7A/AUgGiAEBOugByvySATUKDGluZ2VzdF9wcm90bxIcZW5naW5lX3RlbGVtZXRyeV9iYXRjaF9ldmVudCIHZHMsaG91ctL8kgEXCOIJEAQyEGVuZ2luZS10ZWxlbWV0cnni/JIBhQEIAyILZ2FtZS1lbmdpbmUqH2VuZ2luZS10ZWxlbWV0cnktYmF0Y2gtY29uc3VtZXI6OAoOSW5mcmFzdHJ1Y3R1cmUSGEVuZ2luZWVyaW5nIEFjY2VsZXJhdGlvbhoJVGVsZW1ldHJ5IJ8QQhBlbmdpbmUtdGVsZW1ldHJ5SgdQMjdLOVZS+vySAQIIAUIKCghfdmVyc2lvbkIHCgVfdXVpZEILCglfbWV0YWRhdGFCHwodX2JhdGNoX3RpbWVzdGFtcF9taWxsaXNlY29uZHNCIAoeX2luZ2VzdF90aW1lc3RhbXBfbWlsbGlzZWNvbmRzQg0KC19yZXF1ZXN0X2lwQhAKDl9zb3VyY2VfaXNfcmNjQkZaRGdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRzdHJlYW0vZW5naW5ldGVsZW1ldHJ5YgZwcm90bzM", [a.file_event_event_field_options, i.file_eventstream_core_hive_table_message_options, W, g, A, G]),
        f = (0, o.messageDesc)(h, 0);
    var y = e.i(674094),
        X = e.i(519003);
    let E = /^[a-zA-Z_][a-zA-Z0-9_]*$/,
        S = 0x80000000 - 1;

    function I(e) {
        return E.test(e)
    }
    e.s(["createNextJSFireTelemetryCounter", 0, function(e, r) {
        function o(e, l) {
            r?.onError ? r.onError(e, l) : console.error(e, l)
        }
        if (!I(e)) return o(`@rbx/www-nextjs/fire-telemetry: invalid featureName "${e}"`, {
            name: e
        }), () => {};
        let a = r?.batchSize ?? 10,
            d = r?.batchIntervalMs ?? 250,
            i = new y.EventStreamClient({
                baseUrl: (0, X.getPageBaseUrls)().apiGateway.href
            }),
            u = (0, n.batch)({
                delay: d,
                maxSize: a
            }, e => {
                let n = e.map(e => (0, l.create)(p, {
                    name: e.name,
                    value: e.value,
                    eventTimestampMillisecond: (0, t.bigIntFromNumber)(e.timestampMs) ?? 0n,
                    attributes: e.attributes ? function(e) {
                        let n = {},
                            r = {},
                            o = {},
                            a = {},
                            d = {};
                        for (let [l, c] of Object.entries(e))
                            if ("string" == typeof c) n[l] = c;
                            else if ("boolean" == typeof c) r[l] = c;
                        else if ("bigint" == typeof c) a[l] = c;
                        else if ("number" == typeof c)
                            if (Number.isFinite(c))
                                if (Number.isInteger(c) && c >= -0x80000000 && c <= S) o[l] = c;
                                else if (Number.isInteger(c)) {
                            let e = (0, t.bigIntFromNumber)(c);
                            null !== e && (a[l] = e)
                        } else d[l] = c;
                        else n[l] = String(c);
                        return (0, l.create)(c, {
                            stringAttributes: n,
                            boolAttributes: r,
                            int32Attributes: o,
                            int64Attributes: a,
                            doubleAttributes: d
                        })
                    }(e.attributes) : {}
                }));
                return i.sendEvent(f, {
                    counters: n,
                    batchTimestampMilliseconds: (0, t.bigIntFromNumber)(Date.now()) ?? 0n
                })
            });
        return function(l, t, n) {
            let r = `${e}_${l}`;
            if (! function(e, l) {
                    if (!I(e)) return !1;
                    if (l) {
                        for (let e of Object.keys(l))
                            if (!I(e)) return !1
                    }
                    return !0
                }(r, t)) return void o("@rbx/www-nextjs/fire-telemetry: invalid event name or attribute key", {
                name: l,
                attributes: t
            });
            let a = n ?? 1;
            Number.isFinite(a) ? u({
                name: r,
                attributes: t && Object.keys(t).length > 0 ? t : void 0,
                value: a,
                timestampMs: Date.now()
            }).catch(e => {
                console.error("@rbx/www-nextjs/fire-telemetry: sendEvent failed", e)
            }) : o("@rbx/www-nextjs/fire-telemetry: value must be a finite number", {
                name: l,
                attributes: t
            })
        }
    }], 942060)
}, 981498, e => {
    "use strict";
    let l = {
        featureName: "AppShell",
        team: "User > Consumer Apps > Platforms - Web & Backend",
        features: {
            page: {
                counters: [{
                    name: "ShellStart",
                    dimensions: ["host", "page", "appType", "auth_state"]
                }, {
                    name: "PageHeartbeat",
                    dimensions: ["host", "page", "appType", "beat"]
                }]
            },
            presence: {
                counters: [{
                    name: "PresenceHeartbeat",
                    dimensions: ["host", "page", "appType", "outcome"]
                }]
            },
            navigation: {
                counters: [{
                    name: "NavLoad",
                    dimensions: ["host", "page", "appType", "outcome"]
                }]
            },
            realtime: {
                counters: [{
                    name: "RealtimeStart",
                    dimensions: ["host", "page", "appType", "outcome"]
                }]
            },
            chat: {
                counters: [{
                    name: "ChatLoad",
                    dimensions: ["host", "page", "appType", "outcome"]
                }]
            },
            gameLaunch: {
                counters: [{
                    name: "GameLaunch",
                    dimensions: ["host", "page", "appType", "outcome"]
                }]
            }
        }
    };
    var t = e.i(357355),
        n = e.i(683898),
        r = e.i(496283);
    let o = ["Messages", "Avatar"],
        a = function(e, l, a) {
            let {
                appType: d = !1
            } = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {};
            return (c, i) => {
                let u, b = Object.values(e.features).some(e => e.counters?.some(e => "string" != typeof e && e.name === c && e.dimensions?.includes("page") === !0));
                l(c, {
                    ...b && null == i.page ? {
                        page: (u = (0, r.getInternalPageName)(), o.find(e => e === u) ?? "other")
                    } : {},
                    ...i,
                    host: a,
                    ...d ? {
                        appType: (0, n.toAppType)(t.document?.querySelector('meta[name="device-meta"]')?.dataset.appType)
                    } : {}
                })
            }
        }(l, (0, e.i(942060).createNextJSFireTelemetryCounter)(l.featureName), "nextjs", {
            appType: !0
        });
    e.s(["trackAppShellCounter", 0, a], 981498)
}, 217827, e => {
    "use strict";
    let l, t;
    var n = e.i(371847),
        r = e.i(285586);
    e.i(350223);
    var o = e.i(874296),
        a = e.i(245837),
        d = e.i(646424),
        c = e.i(587541);
    let i = "PresenceBulkNotifications",
        u = o.looseObject({
            Type: o.literal("PresenceChanged"),
            UserId: o.number(),
            SessionStarted: o.unknown(),
            PresenceReport: o.optional(o.unknown())
        }),
        b = o.object({
            userPresences: o.array(o.looseObject({
                userId: o.number()
            }))
        }),
        s = e => {
            document.dispatchEvent(new CustomEvent("Roblox.Presence.Update", {
                detail: e
            }))
        },
        V = async e => {
            let l = c.Url.parse(a.default.presenceApi).getOrThrow().withPath("/v1/presence/users");
            return (await d.post(l, {
                userIds: e
            }, b, {
                credentials: "include"
            })).getOrThrow().userPresences
        };
    var Z = e.i(126392),
        W = e.i(889375),
        R = e.i(981498),
        m = e.i(723941);
    let g = o.object({
            NotificationsEndpoint: o.string(),
            MaxConnectionTime: o.string(),
            IsEventPublishingEnabled: o.boolean(),
            IsDisconnectOnSlowConnectionDisabled: o.boolean(),
            IsSignalRClientTransportRestrictionEnabled: o.boolean(),
            IsLocalStorageInRealTimeEnabled: o.boolean(),
            IsDebuggerEnabled: o.string(),
            IsRealtimeWebAnalyticsEnabled: o.boolean(),
            IsRealtimeWebAnalyticsConnectionEventsEnabled: o.boolean(),
            IsRealtimeDurableReplayEnabled: o.boolean(),
            RealtimeMessageDedupeLruCacheSize: o.string(),
            IsRealtimeTailLossPollingEnabled: o.boolean(),
            IsRealtimeTailLossGapDetectionEnabled: o.boolean(),
            RealtimeTailLossPollingBaseIntervalMs: o.string(),
            RealtimeTailLossPollingMaxIntervalMs: o.string(),
            RealtimeTailLossPollingBackoffMultiplier: o.string(),
            RealtimeTailLossPollingRetryMaxAttempts: o.string()
        }),
        A = (e, l, t) => {
            W.eventStreamClientV1.sendEvent(e, l, t)
        },
        p = {
            SendEvent: A,
            SendEventWithTarget: A,
            TargetTypes: {
                WWW: "www"
            }
        },
        G = async () => {
            let t = (() => {
                    if ("u" < typeof document) return null;
                    if (null == l) {
                        let e = document.documentElement.dataset.realtimeSettings;
                        l = {
                            value: null == e ? null : m.deserialize(g, e).getOrNull()
                        }
                    }
                    return l.value
                })(),
                n = (0, Z.getCurrentUser)()?.id;
            if (null == t || null == n) return null;
            let {
                default: r
            } = await e.A(860834);
            return r.Init({
                RealTimeSettings: t,
                CurrentUser: {
                    userId: n
                },
                EventStream: p
            }), r.GetClient()
        }, h = () => t ??= G().then(e => (null != e && (0, R.trackAppShellCounter)("RealtimeStart", {
            outcome: "started"
        }), e), e => (t = void 0, (0, r.captureException)(e), (0, R.trackAppShellCounter)("RealtimeStart", {
            outcome: "failed"
        }), null));
    e.s(["getRealtimeClient", 0, h, "startRealtime", 0, () => {
        let e, l = !0;
        return h().then(t => {
            let n, r, o;
            l && null != t && (n = new Map, r = e => {
                let {
                    UserId: l,
                    SessionStarted: t
                } = e;
                if (!n.has(l)) return !0;
                let r = n.get(l);
                return "string" == typeof t && "string" == typeof r ? t > r : "number" == typeof t && "number" == typeof r && t > r
            }, o = e => {
                let l = new Map;
                for (let t of Array.isArray(e) ? e : []) {
                    let e = u.safeParse(t);
                    e.success && l.set(e.data.UserId, e.data)
                }
                let t = new Map,
                    o = [];
                for (let [e, a] of l) null != a.PresenceReport && r(a) ? (t.set(e, a.PresenceReport), n.set(e, a.SessionStarted)) : o.push(e);
                o.length > 0 && V(o).then(e => {
                    for (let l of e) t.set(l.userId, l)
                }).catch(e => {
                    console.error(e)
                }).finally(() => {
                    s(t)
                }), s(t)
            }, t.Subscribe(i, o), e = () => {
                t.Unsubscribe(i, o)
            })
        }), () => {
            l = !1, e?.()
        }
    }, "useRealtimeNamespace", 0, (e, l) => {
        let t = (0, n.useRef)(l);
        (0, n.useEffect)(() => {
            t.current = l
        }), (0, n.useEffect)(() => {
            let l, n = !0,
                r = e => {
                    t.current(e)
                };
            return h().then(t => {
                n && null != t && (t.Subscribe(e, r), l = () => {
                    t.Unsubscribe(e, r)
                })
            }), () => {
                n = !1, l?.()
            }
        }, [e])
    }], 217827)
}]);

//# debugId=7d22a313-83af-d636-cd48-14df6c27bf96
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0w~07wi9x-oyq.js.map
;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "e3155643-a38a-c027-61dc-30b52fc5ed22")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 74284, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "useMergedRef", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let n = e.r(420482);

    function o(e, t) {
        let r = (0, n.useRef)(null),
            o = (0, n.useRef)(null);
        return (0, n.useCallback)(n => {
            if (null === n) {
                let e = r.current;
                e && (r.current = null, e());
                let t = o.current;
                t && (o.current = null, t())
            } else e && (r.current = l(e, n)), t && (o.current = l(t, n))
        }, [e, t])
    }

    function l(e, t) {
        if ("function" != typeof e) return e.current = t, () => {
            e.current = null
        };
        {
            let r = e(t);
            return "function" == typeof r ? r : () => e(null)
        }
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 512718, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "errorOnce", {
        enumerable: !0,
        get: function() {
            return n
        }
    });
    let n = e => {}
}, 2097, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        default: function() {
            return m
        },
        useLinkStatus: function() {
            return P
        }
    };
    for (var o in n) Object.defineProperty(r, o, {
        enumerable: !0,
        get: n[o]
    });
    let l = e.r(744066),
        u = e.r(19836),
        a = l._(e.r(420482)),
        i = e.r(259234),
        f = e.r(466933),
        c = e.r(74284),
        s = e.r(7239),
        p = e.r(298419);
    e.r(239971);
    let d = e.r(708724),
        h = e.r(418776),
        g = e.r(697707),
        y = e.r(420587);

    function m(t) {
        var r, n;
        let o, l, m, [P, b] = (0, a.useOptimistic)(h.IDLE_LINK_STATUS),
            x = (0, a.useRef)(null),
            {
                href: S,
                as: _,
                children: j,
                prefetch: R = null,
                passHref: L,
                replace: O,
                shallow: T,
                scroll: C,
                onClick: E,
                onMouseEnter: k,
                onTouchStart: A,
                legacyBehavior: M = !1,
                onNavigate: w,
                transitionTypes: $,
                ref: U,
                unstable_dynamicOnHover: z,
                ...I
            } = t;
        o = j, M && ("string" == typeof o || "number" == typeof o) && (o = (0, u.jsx)("a", {
            children: o
        }));
        let N = a.default.useContext(f.AppRouterContext),
            B = !1 !== R,
            K = !1 !== R ? null === (n = R) || "auto" === n ? y.FetchStrategy.PPR : y.FetchStrategy.Full : y.FetchStrategy.PPR,
            D = "string" == typeof(r = _ || S) ? r : (0, i.formatUrl)(r);
        if (M) {
            if (o?.$$typeof === Symbol.for("react.lazy")) throw Object.defineProperty(Error("`<Link legacyBehavior>` received a direct child that is either a Server Component, or JSX that was loaded with React.lazy(). This is not supported. Either remove legacyBehavior, or make the direct child a Client Component that renders the Link's `<a>` tag."), "__NEXT_ERROR_CODE", {
                value: "E863",
                enumerable: !1,
                configurable: !0
            });
            l = a.default.Children.only(o)
        }
        let F = M ? l && "object" == typeof l && l.ref : U,
            W = a.default.useCallback(e => (null !== N && (x.current = (0, h.mountLinkInstance)(e, D, N, K, B, b)), () => {
                x.current && ((0, h.unmountLinkForCurrentNavigation)(x.current), x.current = null), (0, h.unmountPrefetchableInstance)(e)
            }), [B, D, N, K, b]),
            X = {
                ref: (0, c.useMergedRef)(W, F),
                onClick(t) {
                    M || "function" != typeof E || E(t), M && l.props && "function" == typeof l.props.onClick && l.props.onClick(t), !N || t.defaultPrevented || function(t, r, n, o, l, u, i) {
                        if ("u" > typeof window) {
                            let f, {
                                nodeName: c
                            } = t.currentTarget;
                            if ("A" === c.toUpperCase() && ((f = t.currentTarget.getAttribute("target")) && "_self" !== f || t.metaKey || t.ctrlKey || t.shiftKey || t.altKey || t.nativeEvent && 2 === t.nativeEvent.which) || t.currentTarget.hasAttribute("download")) return;
                            if (!(0, g.isLocalURL)(r)) {
                                o && (t.preventDefault(), location.replace(r));
                                return
                            }
                            if (t.preventDefault(), u) {
                                let e = !1;
                                if (u({
                                        preventDefault: () => {
                                            e = !0
                                        }
                                    }), e) return
                            }
                            let {
                                dispatchNavigateAction: s
                            } = e.r(511259);
                            a.default.startTransition(() => {
                                s(r, o ? "replace" : "push", !1 === l ? d.ScrollBehavior.NoScroll : d.ScrollBehavior.Default, n.current, i)
                            })
                        }
                    }(t, D, x, O, C, w, $)
                },
                onMouseEnter(e) {
                    M || "function" != typeof k || k(e), M && l.props && "function" == typeof l.props.onMouseEnter && l.props.onMouseEnter(e), N && B && (0, h.onNavigationIntent)(e.currentTarget, !0 === z)
                },
                onTouchStart: function(e) {
                    M || "function" != typeof A || A(e), M && l.props && "function" == typeof l.props.onTouchStart && l.props.onTouchStart(e), N && B && (0, h.onNavigationIntent)(e.currentTarget, !0 === z)
                }
            };
        return (0, s.isAbsoluteUrl)(D) ? X.href = D : M && !L && ("a" !== l.type || "href" in l.props) || (X.href = (0, p.addBasePath)(D)), m = M ? a.default.cloneElement(l, X) : (0, u.jsx)("a", {
            ...I,
            ...X,
            children: o
        }), (0, u.jsx)(v.Provider, {
            value: P,
            children: m
        })
    }
    e.r(512718);
    let v = (0, a.createContext)(h.IDLE_LINK_STATUS),
        P = () => (0, a.useContext)(v);
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 698947, (e, t, r) => {
    t.exports = e.r(364354)
}, 244447, 817558, 840154, 180549, e => {
    "use strict";
    var t = e.i(2097),
        r = e.i(698947),
        n = e.i(420482),
        o = e.i(745911),
        l = e.i(737344);

    function u(e) {
        let t;
        return ("object" == typeof e ? null == e.host && null == e.hostname : !/^[a-z]+:/i.test(e)) && (null == (t = "object" == typeof e ? e.pathname : e) || !!t.startsWith("/"))
    }

    function a(e, t) {
        let r = e;
        return /^\/(\?.*)?$/.test(t) && (t = t.slice(1)), r += t
    }

    function i(e, t, r) {
        return "string" == typeof e ? e : e[t] || r
    }

    function f(e) {
        let t = function() {
                try {
                    return "true" === l.default.env._next_intl_trailing_slash
                } catch {
                    return !1
                }
            }(),
            [r, ...n] = e.split("#"),
            o = n.join("#"),
            u = r;
        if ("/" !== u) {
            let e = u.endsWith("/");
            t && !e ? u += "/" : !t && e && (u = u.slice(0, -1))
        }
        return o && (u += "#" + o), u
    }

    function c(e, t) {
        let r, n = f(e),
            o = f(t);
        return (r = n.replace(/\/\[\[(\.\.\.[^\]]+)\]\]/g, "(?:/(.*))?").replace(/\[\[(\.\.\.[^\]]+)\]\]/g, "(?:/(.*))?").replace(/\[(\.\.\.[^\]]+)\]/g, "(.+)").replace(/\[([^\]]+)\]/g, "([^/]+)"), RegExp(`^${r}$`)).test(o)
    }

    function s(e, t) {
        return "never" !== t.mode && t.prefixes?.[e] || p(e)
    }

    function p(e) {
        return "/" + e
    }

    function d(e) {
        return e.includes("[[...")
    }

    function h(e) {
        return e.includes("[...")
    }

    function g(e) {
        return e.includes("[")
    }

    function y(e, t) {
        let r = e.split("/"),
            n = t.split("/"),
            o = Math.max(r.length, n.length);
        for (let e = 0; e < o; e++) {
            let t = r[e],
                o = n[e];
            if (!t && o) return -1;
            if (t && !o) return 1;
            if (t || o) {
                if (!g(t) && g(o)) return -1;
                if (g(t) && !g(o)) return 1;
                if (!h(t) && h(o)) return -1;
                if (h(t) && !h(o)) return 1;
                if (!d(t) && d(o)) return -1;
                if (d(t) && !d(o)) return 1
            }
        }
        return 0
    }

    function m(e) {
        return e.sort(y)
    }

    function v(e) {
        let t = new URLSearchParams;
        for (let [r, n] of Object.entries(e)) Array.isArray(n) ? n.forEach(e => {
            t.append(r, String(e))
        }) : t.set(r, String(n));
        return "?" + t.toString()
    }

    function P(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : window.location.pathname;
        return "/" === e ? t : t.replace(e, "")
    }

    function b(e, t, r, n) {
        if (!e || n === r || null == n || !t) return;
        let o = P(t),
            {
                name: l,
                ...u
            } = e;
        u.path || (u.path = "" !== o ? o : "/");
        let a = `${l}=${n};`;
        for (let [e, t] of Object.entries(u)) a += `${"maxAge"===e?"max-age":e}`, "boolean" != typeof t && (a += "=" + t), a += ";";
        document.cookie = a
    }
    e.s(["getLocaleAsPrefix", 0, p, "getLocalePrefix", 0, s, "getLocalizedTemplate", 0, i, "getSortedPathnames", 0, m, "hasPathnamePrefixed", 0, function(e, t) {
        return t === e || t.startsWith(`${e}/`)
    }, "isLocalizableHref", 0, u, "isPromise", 0, function(e) {
        return "function" == typeof e.then
    }, "matchesPathname", 0, c, "normalizeTrailingSlash", 0, f, "prefixPathname", 0, a, "unprefixPathname", 0, function(e, t) {
        return e.replace(RegExp(`^${t}`), "") || "/"
    }], 817558), e.s(["applyPathnamePrefix", 0, function(e, t, r, n) {
        let o, {
            mode: l
        } = r.localePrefix;
        if (void 0 !== n) o = n;
        else if (u(e)) {
            let e = r.domains?.find(e => e.locales.includes(t)),
                n = e?.localePrefix || l;
            "always" === n ? o = !0 : "as-needed" === n && (o = e ? t !== e.defaultLocale : t !== r.defaultLocale)
        }
        return o ? a(s(t, r.localePrefix), e) : e
    }, "compileLocalizedPathname", 0, function(e) {
        let {
            pathname: t,
            locale: r,
            params: n,
            pathnames: o,
            query: l
        } = e;

        function u(e) {
            let t, u = o[e];
            return u ? (t = i(u, r, e), n && Object.entries(n).forEach(e => {
                let r, n, [o, l] = e;
                Array.isArray(l) ? (r = `(\\[)?\\[...${o}\\](\\])?`, n = l.map(e => String(e)).join("/")) : (r = `\\[${o}\\]`, n = String(l)), t = t.replace(RegExp(r, "g"), n)
            }), t = new URL(t = t.replace(/\[\[\.\.\..+\]\]/g, ""), "http://l").pathname) : t = e, t = f(t), l && (t += v(l)), t
        }
        if ("string" == typeof t) return u(t);
        {
            let {
                pathname: e,
                ...r
            } = t;
            return {
                ...r,
                pathname: u(e)
            }
        }
    }, "getBasePath", 0, P, "getRoute", 0, function(e, t, r) {
        let n = m(Object.keys(r)),
            o = decodeURI(t);
        for (let t of n) {
            let n = r[t];
            if ("string" == typeof n) {
                if (c(n, o)) return t
            } else if (c(i(n, e, t), o)) return t
        }
        return t
    }, "normalizeNameOrNameWithParams", 0, function(e) {
        return "string" == typeof e ? {
            pathname: e
        } : e
    }, "serializeSearchParams", 0, v], 840154), e.s(["default", 0, b], 180549);
    var x = e.i(19836),
        S = (0, n.forwardRef)(function(e, n) {
            let {
                href: l,
                locale: u,
                localeCookie: a,
                onClick: i,
                prefetch: f,
                ...c
            } = e, s = (0, o.useLocale)(), p = null != u && u !== s, d = (0, r.usePathname)();
            return p && (f = !1), (0, x.jsx)(t.default, {
                ref: n,
                href: l,
                hrefLang: p ? u : void 0,
                onClick: function(e) {
                    b(a, d, s, u), i && i(e)
                },
                prefetch: f,
                ...c
            })
        });
    e.s(["default", 0, S], 244447)
}]);

//# debugId=e3155643-a38a-c027-61dc-30b52fc5ed22
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/00k2o7d7q4e08.js.map
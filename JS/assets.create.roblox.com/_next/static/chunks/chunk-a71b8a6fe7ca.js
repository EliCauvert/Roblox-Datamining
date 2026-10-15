;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "17e69e86-ff9a-24fa-e664-357abd93b013")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 836344, e => {
    "use strict";
    var t = e.i(140625),
        a = e.i(603955),
        i = e.i(75584),
        n = e.i(197649),
        r = e.i(416340);
    let l = {
            Small: "XSmall",
            Medium: "Small",
            Large: "Medium"
        },
        s = {
            Small: ["height-600", "text-label-small"],
            Medium: ["height-800", "text-label-medium"],
            Large: ["height-1000", "text-label-medium"]
        },
        o = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-large"
        },
        u = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-medium"
        },
        d = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-large"
        },
        c = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-medium"
        },
        f = {
            Small: "padding-left-xsmall",
            Medium: "padding-left-[var(--size-150)]",
            Large: "padding-left-small"
        },
        m = {
            Small: "padding-right-[var(--size-150)]",
            Medium: "padding-right-small",
            Large: "padding-right-[var(--size-250)]"
        },
        g = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        h = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        p = e => {
            let {
                iconName: t,
                node: a,
                size: s
            } = e;
            return null != t ? r.default.createElement(i.Icon, {
                name: t,
                size: l[s]
            }) : null != a ? r.default.createElement("span", {
                className: (0, n.default)("inline-flex items-center justify-center shrink-0", h[s])
            }, a) : null
        },
        v = (0, r.forwardRef)((e, i) => {
            let {
                className: l,
                style: h,
                text: v,
                isDisabled: b = !1,
                size: y = "Medium",
                variant: P = "Standard",
                leadingIconName: x,
                leadingIconNode: w,
                trailingIconName: E,
                trailingIconNode: S,
                ...M
            } = e, L = null != x || null != w, N = null != E || null != S, O = (0, n.default)(b ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", L ? u[y] : o[y], N ? c[y] : d[y], s[y], l), k = r.default.createElement(r.default.Fragment, null, r.default.createElement(t.StateLayer, null), r.default.createElement(p, {
                iconName: x,
                node: w,
                size: y
            }), r.default.createElement("span", {
                className: (0, n.default)("padding-y-xsmall text-no-wrap text-truncate-end", L && f[y], N && m[y])
            }, v), r.default.createElement(p, {
                iconName: E,
                node: S,
                size: y
            })), j = {
                textDecoration: "none",
                ...h
            };
            if ("a" === M.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = M;
                return r.default.createElement("a", {
                    ref: i,
                    ...a,
                    "aria-disabled": b,
                    href: b ? void 0 : t,
                    className: (0, n.default)(O, g[P], "content-action-utility"),
                    style: j
                }, k)
            }
            let {
                as: T,
                isChecked: z,
                onCheckedChange: R,
                ...Q
            } = M;
            return r.default.createElement("button", {
                ref: i,
                type: "button",
                ...Q,
                className: (0, n.default)(z ? "bg-inverse-surface-0" : g[P], z ? "content-inverse-emphasis" : "content-action-utility", O),
                style: j,
                "aria-pressed": z,
                disabled: b,
                onClick: null == R ? void 0 : () => R(!z)
            }, k)
        });
    e.s(["Chip", 0, v])
}, 607895, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        i = e.i(23342);
    let n = new Set(["_self", "_parent", "_top"]),
        r = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        l = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        s = (0, a.forwardRef)((e, s) => {
            var o, u, d;
            let {
                children: c,
                className: f,
                size: m,
                color: g = "Emphasis",
                variant: h = "Standalone",
                underline: p = "hover",
                isExternal: v,
                asChild: b,
                ...y
            } = e, P = (u = null != (o = y.as) ? o : "a", d = "button" === y.as ? void 0 : y.target, void 0 !== v ? v : "button" !== u && void 0 !== d && !n.has(d)), x = (0, t.default)("foundation-web-link", "button" === y.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === h || P) && "inline-flex items-center gap-xsmall", void 0 !== m && r[m], l[g], "always" === p ? "underline" : "no-underline", "hover" === p && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", f), w = P ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (b) {
                let {
                    as: e,
                    ...t
                } = y, n = a.default.Children.only(c);
                return a.default.isValidElement(n) ? a.default.createElement(i.Slot, {
                    ref: s,
                    ...t,
                    className: x
                }, a.default.cloneElement(n, {}, a.default.createElement(a.default.Fragment, null, n.props.children, w))) : null
            }
            if ("button" === y.as) {
                let {
                    as: e,
                    type: t,
                    ...i
                } = y;
                return a.default.createElement("button", {
                    ref: s,
                    type: null != t ? t : "button",
                    ...i,
                    className: x
                }, c, w)
            }
            let {
                as: E,
                ...S
            } = y;
            return a.default.createElement("a", {
                ref: s,
                ...S,
                className: x
            }, c, w)
        });
    s.displayName = "Link", e.s(["Link", 0, s])
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function a(e, t) {
        let {
            pages: a,
            pageParams: i
        } = t, n = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[n], a, i[n], i) : void 0
    }

    function i(e, t) {
        var a;
        let {
            pages: i,
            pageParams: n
        } = t;
        return i.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, i[0], i, n[0], n) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != i(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (n, r) => {
                var l, s, o, u, d;
                let c = n.options,
                    f = null == (o = n.fetchOptions) || null == (s = o.meta) || null == (l = s.fetchMore) ? void 0 : l.direction,
                    m = (null == (u = n.state.data) ? void 0 : u.pages) || [],
                    g = (null == (d = n.state.data) ? void 0 : d.pageParams) || [],
                    h = {
                        pages: [],
                        pageParams: []
                    },
                    p = 0,
                    v = async () => {
                        let r = !1,
                            l = (0, t.ensureQueryFn)(n.options, n.fetchOptions),
                            s = async (e, a, i) => {
                                let s;
                                if (r) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(s = {
                                        client: n.client,
                                        queryKey: n.queryKey,
                                        pageParam: a,
                                        direction: i ? "backward" : "forward",
                                        meta: n.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (n.signal.aborted ? r = !0 : n.signal.addEventListener("abort", () => {
                                            r = !0
                                        }), n.signal)
                                    }), s),
                                    u = await l(o),
                                    {
                                        maxPages: d
                                    } = n.options,
                                    c = i ? t.addToStart : t.addToEnd;
                                return {
                                    pages: c(e.pages, u, d),
                                    pageParams: c(e.pageParams, a, d)
                                }
                            };
                        if (f && m.length) {
                            let e = "backward" === f,
                                t = {
                                    pages: m,
                                    pageParams: g
                                },
                                n = (e ? i : a)(c, t);
                            h = await s(t, n, e)
                        } else {
                            let t = null != e ? e : m.length;
                            do {
                                var o;
                                let e = 0 === p ? null != (o = g[0]) ? o : c.initialPageParam : a(c, h);
                                if (p > 0 && null == e) break;
                                h = await s(h, e), p++
                            } while (p < t)
                        }
                        return h
                    };
                n.options.persister ? n.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = n.options).persister) ? void 0 : e.call(t, v, {
                        client: n.client,
                        queryKey: n.queryKey,
                        meta: n.options.meta,
                        signal: n.signal
                    }, r)
                } : n.fetchFn = v
            }
        }
    }])
}, 630986, e => {
    "use strict";
    var t = e.i(468612),
        a = e.i(117437),
        i = class extends t.QueryObserver {
            bindMethods() {
                super.bindMethods(), this.fetchNextPage = this.fetchNextPage.bind(this), this.fetchPreviousPage = this.fetchPreviousPage.bind(this)
            }
            setOptions(e) {
                super.setOptions({
                    ...e,
                    behavior: (0, a.infiniteQueryBehavior)()
                })
            }
            getOptimisticResult(e) {
                return e.behavior = (0, a.infiniteQueryBehavior)(), super.getOptimisticResult(e)
            }
            fetchNextPage(e) {
                return this.fetch({
                    ...e,
                    meta: {
                        fetchMore: {
                            direction: "forward"
                        }
                    }
                })
            }
            fetchPreviousPage(e) {
                return this.fetch({
                    ...e,
                    meta: {
                        fetchMore: {
                            direction: "backward"
                        }
                    }
                })
            }
            createResult(e, t) {
                var i, n;
                let {
                    state: r
                } = e, l = super.createResult(e, t), {
                    isFetching: s,
                    isRefetching: o,
                    isError: u,
                    isRefetchError: d
                } = l, c = null == (n = r.fetchMeta) || null == (i = n.fetchMore) ? void 0 : i.direction, f = u && "forward" === c, m = s && "forward" === c, g = u && "backward" === c, h = s && "backward" === c;
                return {
                    ...l,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, a.hasNextPage)(t, r.data),
                    hasPreviousPage: (0, a.hasPreviousPage)(t, r.data),
                    isFetchNextPageError: f,
                    isFetchingNextPage: m,
                    isFetchPreviousPageError: g,
                    isFetchingPreviousPage: h,
                    isRefetchError: d && !f && !g,
                    isRefetching: o && !m && !h
                }
            }
            constructor(e, t) {
                super(e, t)
            }
        },
        n = e.i(624083);
    e.s(["useInfiniteQuery", 0, function(e, t) {
        return (0, n.useBaseQuery)(e, i, t)
    }], 630986)
}, 223808, (e, t, a) => {
    var i = 0 / 0,
        n = /^\s+|\s+$/g,
        r = /^[-+]0x[0-9a-f]+$/i,
        l = /^0b[01]+$/i,
        s = /^0o[0-7]+$/i,
        o = parseInt,
        u = e.g && e.g.Object === Object && e.g,
        d = "object" == typeof self && self && self.Object === Object && self,
        c = u || d || Function("return this")(),
        f = Object.prototype.toString,
        m = Math.max,
        g = Math.min,
        h = function() {
            return c.Date.now()
        };

    function p(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function v(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == f.call(t)) return i;
        if (p(e)) {
            var t, a = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = p(a) ? a + "" : a
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(n, "");
        var u = l.test(e);
        return u || s.test(e) ? o(e.slice(2), u ? 2 : 8) : r.test(e) ? i : +e
    }
    t.exports = function(e, t, a) {
        var i, n, r, l, s, o, u = 0,
            d = !1,
            c = !1,
            f = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function b(t) {
            var a = i,
                r = n;
            return i = n = void 0, u = t, l = e.apply(r, a)
        }

        function y(e) {
            var a = e - o,
                i = e - u;
            return void 0 === o || a >= t || a < 0 || c && i >= r
        }

        function P() {
            var e, a, i, n = h();
            if (y(n)) return x(n);
            s = setTimeout(P, (e = n - o, a = n - u, i = t - e, c ? g(i, r - a) : i))
        }

        function x(e) {
            return (s = void 0, f && i) ? b(e) : (i = n = void 0, l)
        }

        function w() {
            var e, a = h(),
                r = y(a);
            if (i = arguments, n = this, o = a, r) {
                if (void 0 === s) return u = e = o, s = setTimeout(P, t), d ? b(e) : l;
                if (c) return s = setTimeout(P, t), b(o)
            }
            return void 0 === s && (s = setTimeout(P, t)), l
        }
        return t = v(t) || 0, p(a) && (d = !!a.leading, r = (c = "maxWait" in a) ? m(v(a.maxWait) || 0, t) : r, f = "trailing" in a ? !!a.trailing : f), w.cancel = function() {
            void 0 !== s && clearTimeout(s), u = 0, i = o = n = s = void 0
        }, w.flush = function() {
            return void 0 === s ? l : x(h())
        }, w
    }
}, 167878, e => {
    "use strict";
    var t = e.i(416340);
    e.i(223808);
    var a = "u" > typeof window ? t.useLayoutEffect : t.useEffect,
        i = "u" < typeof window;
    e.s(["useMediaQuery", 0, function(e) {
        let {
            defaultValue: n = !1,
            initializeWithValue: r = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, l = e => i ? n : window.matchMedia(e).matches, [s, o] = (0, t.useState)(() => r ? l(e) : n);

        function u() {
            o(l(e))
        }
        return a(() => {
            let t = window.matchMedia(e);
            return u(), t.addListener ? t.addListener(u) : t.addEventListener("change", u), () => {
                t.removeListener ? t.removeListener(u) : t.removeEventListener("change", u)
            }
        }, [e]), s
    }])
}]);

//# debugId=17e69e86-ff9a-24fa-e664-357abd93b013
//# sourceMappingURL=32k-1by33hedi.js.map
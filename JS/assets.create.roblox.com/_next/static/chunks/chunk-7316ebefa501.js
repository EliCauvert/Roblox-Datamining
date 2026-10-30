;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "d7e2c1f2-8e11-a7f3-f810-5ac55b2b6ec2")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 169525, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        n = e.i(723570),
        i = e => {
            var i, l, s;
            let o, u, {
                    present: d,
                    children: c
                } = e,
                m = function(e) {
                    var a, i;
                    let [l, s] = t.useState(), o = t.useRef(null), u = t.useRef(e), d = t.useRef("none"), [c, m] = (a = e ? "mounted" : "unmounted", i = {
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
                    }, t.useReducer((e, t) => {
                        let a = i[e][t];
                        return null != a ? a : e
                    }, a));
                    return t.useEffect(() => {
                        let e = r(o.current);
                        d.current = "mounted" === c ? e : "none"
                    }, [c]), (0, n.useLayoutEffect)(() => {
                        let t = o.current,
                            a = u.current;
                        if (a !== e) {
                            let n = d.current,
                                i = r(t);
                            e ? m("MOUNT") : "none" === i || (null == t ? void 0 : t.display) === "none" ? m("UNMOUNT") : a && n !== i ? m("ANIMATION_OUT") : m("UNMOUNT"), u.current = e
                        }
                    }, [e, m]), (0, n.useLayoutEffect)(() => {
                        if (l) {
                            var e;
                            let t, a = null != (e = l.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = r(o.current).includes(CSS.escape(e.animationName));
                                    if (e.target === l && n && (m("ANIMATION_END"), !u.current)) {
                                        let e = l.style.animationFillMode;
                                        l.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === l.style.animationFillMode && (l.style.animationFillMode = e)
                                        })
                                    }
                                },
                                i = e => {
                                    e.target === l && (d.current = r(o.current))
                                };
                            return l.addEventListener("animationstart", i), l.addEventListener("animationcancel", n), l.addEventListener("animationend", n), () => {
                                a.clearTimeout(t), l.removeEventListener("animationstart", i), l.removeEventListener("animationcancel", n), l.removeEventListener("animationend", n)
                            }
                        }
                        m("ANIMATION_END")
                    }, [l, m]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(c),
                        ref: t.useCallback(e => {
                            o.current = e ? getComputedStyle(e) : null, s(e)
                        }, [])
                    }
                }(d),
                f = "function" == typeof c ? c({
                    present: m.isPresent
                }) : t.Children.only(c),
                g = (0, a.useComposedRefs)(m.ref, (u = (o = null == (l = Object.getOwnPropertyDescriptor((i = f).props, "ref")) ? void 0 : l.get) && "isReactWarning" in o && o.isReactWarning) ? i.ref : (u = (o = null == (s = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : s.get) && "isReactWarning" in o && o.isReactWarning) ? i.props.ref : i.props.ref || i.ref);
            return "function" == typeof c || m.isPresent ? t.cloneElement(f, {
                ref: g
            }) : null
        };

    function r(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    i.displayName = "Presence", e.s(["Presence", 0, i])
}, 420028, e => {
    "use strict";
    var t = e.i(737586),
        a = e.i(999544),
        n = e.i(880343),
        i = e.i(197649),
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
        m = {
            Small: "padding-left-xsmall",
            Medium: "padding-left-[var(--size-150)]",
            Large: "padding-left-small"
        },
        f = {
            Small: "padding-right-[var(--size-150)]",
            Medium: "padding-right-small",
            Large: "padding-right-[var(--size-250)]"
        },
        g = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        p = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        v = e => {
            let {
                iconName: t,
                node: a,
                size: s
            } = e;
            return null != t ? r.default.createElement(n.Icon, {
                name: t,
                size: l[s]
            }) : null != a ? r.default.createElement("span", {
                className: (0, i.default)("inline-flex items-center justify-center shrink-0", p[s])
            }, a) : null
        },
        h = (0, r.forwardRef)((e, n) => {
            let {
                className: l,
                style: p,
                text: h,
                isDisabled: b = !1,
                size: y = "Medium",
                variant: E = "Standard",
                leadingIconName: P,
                leadingIconNode: M,
                trailingIconName: N,
                trailingIconNode: S,
                ...w
            } = e, O = null != P || null != M, x = null != N || null != S, L = (0, i.default)(b ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", O ? u[y] : o[y], x ? c[y] : d[y], s[y], l), T = r.default.createElement(r.default.Fragment, null, r.default.createElement(t.StateLayer, null), r.default.createElement(v, {
                iconName: P,
                node: M,
                size: y
            }), r.default.createElement("span", {
                className: (0, i.default)("padding-y-xsmall text-no-wrap text-truncate-end", O && m[y], x && f[y])
            }, h), r.default.createElement(v, {
                iconName: N,
                node: S,
                size: y
            })), U = {
                textDecoration: "none",
                ...p
            };
            if ("a" === w.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = w;
                return r.default.createElement("a", {
                    ref: n,
                    ...a,
                    "aria-disabled": b,
                    href: b ? void 0 : t,
                    className: (0, i.default)(L, g[E], "content-action-utility"),
                    style: U
                }, T)
            }
            let {
                as: R,
                isChecked: k,
                onCheckedChange: z,
                ...A
            } = w;
            return r.default.createElement("button", {
                ref: n,
                type: "button",
                ...A,
                className: (0, i.default)(k ? "bg-inverse-surface-0" : g[E], k ? "content-inverse-emphasis" : "content-action-utility", L),
                style: U,
                "aria-pressed": k,
                disabled: b,
                onClick: null == z ? void 0 : () => z(!k)
            }, T)
        });
    e.s(["Chip", 0, h])
}, 494118, e => {
    "use strict";
    var t = e.i(737586),
        a = e.i(999544),
        n = e.i(197649),
        i = e.i(416340),
        r = e.i(23342);
    let l = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        s = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        o = {
            Large: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Medium: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Small: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            XSmall: {
                circular: "radius-circle",
                square: "radius-small"
            }
        },
        u = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-alert",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        d = {
            Emphasis: "bg-action-standard",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        c = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        m = {
            Default: {
                Emphasis: "content-action-emphasis",
                Standard: "content-action-standard",
                Alert: "content-action-alert",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-emphasis",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-alert",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        f = {
            Default: {
                Emphasis: "content-action-standard",
                Standard: "content-action-standard",
                Alert: "content-action-standard",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-standard",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-standard",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        g = (0, i.forwardRef)((e, g) => {
            let p, {
                className: v,
                icon: h,
                ariaLabel: b,
                isDisabled: y = !1,
                isCircular: E = !1,
                isSelected: P = !1,
                size: M = "Large",
                variant: N = "Emphasis",
                iconColor: S = "Default",
                asChild: w,
                children: O,
                ...x
            } = e;
            p = y ? d[N] : P ? c[N] : u[N];
            let L = (0, n.default)("foundation-web-icon-button", y ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", l[M], o[M][E ? "circular" : "square"], p, v),
                T = i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), i.default.createElement("span", {
                    className: (0, n.default)("icon", h, s[M], y ? f[S][N] : m[S][N])
                }));
            if (w) {
                let {
                    as: e,
                    ...t
                } = x, a = i.default.Children.only(O);
                return i.default.createElement(r.Slot, {
                    ref: g,
                    ...t,
                    className: L,
                    "aria-label": b,
                    "aria-disabled": y || void 0
                }, i.default.cloneElement(a, {}, T))
            }
            if ("a" === x.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = x;
                return i.default.createElement("a", {
                    ref: g,
                    ...a,
                    "aria-label": b,
                    "aria-disabled": y,
                    href: y ? void 0 : t,
                    className: L
                }, T)
            }
            let {
                as: U,
                ...R
            } = x;
            return i.default.createElement("button", {
                ref: g,
                type: "button",
                ...R,
                "aria-label": b,
                disabled: y,
                className: L
            }, T)
        });
    e.s(["IconButton", 0, g])
}, 24286, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        n = e.i(23342);
    let i = new Set(["_self", "_parent", "_top"]),
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
                className: m,
                size: f,
                color: g = "Emphasis",
                variant: p = "Standalone",
                underline: v = "hover",
                isExternal: h,
                asChild: b,
                ...y
            } = e, E = (u = null != (o = y.as) ? o : "a", d = "button" === y.as ? void 0 : y.target, void 0 !== h ? h : "button" !== u && void 0 !== d && !i.has(d)), P = (0, t.default)("foundation-web-link", "button" === y.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === p || E) && "inline-flex items-center gap-xsmall", void 0 !== f && r[f], l[g], "always" === v ? "underline" : "no-underline", "hover" === v && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", m), M = E ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (b) {
                let {
                    as: e,
                    ...t
                } = y, i = a.default.Children.only(c);
                return a.default.isValidElement(i) ? a.default.createElement(n.Slot, {
                    ref: s,
                    ...t,
                    className: P
                }, a.default.cloneElement(i, {}, a.default.createElement(a.default.Fragment, null, i.props.children, M))) : null
            }
            if ("button" === y.as) {
                let {
                    as: e,
                    type: t,
                    ...n
                } = y;
                return a.default.createElement("button", {
                    ref: s,
                    type: null != t ? t : "button",
                    ...n,
                    className: P
                }, c, M)
            }
            let {
                as: N,
                ...S
            } = y;
            return a.default.createElement("a", {
                ref: s,
                ...S,
                className: P
            }, c, M)
        });
    s.displayName = "Link", e.s(["Link", 0, s])
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function a(e, t) {
        let {
            pages: a,
            pageParams: n
        } = t, i = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[i], a, n[i], n) : void 0
    }

    function n(e, t) {
        var a;
        let {
            pages: n,
            pageParams: i
        } = t;
        return n.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, n[0], n, i[0], i) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != n(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (i, r) => {
                var l, s, o, u, d;
                let c = i.options,
                    m = null == (o = i.fetchOptions) || null == (s = o.meta) || null == (l = s.fetchMore) ? void 0 : l.direction,
                    f = (null == (u = i.state.data) ? void 0 : u.pages) || [],
                    g = (null == (d = i.state.data) ? void 0 : d.pageParams) || [],
                    p = {
                        pages: [],
                        pageParams: []
                    },
                    v = 0,
                    h = async () => {
                        let r = !1,
                            l = (0, t.ensureQueryFn)(i.options, i.fetchOptions),
                            s = async (e, a, n) => {
                                let s;
                                if (r) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(s = {
                                        client: i.client,
                                        queryKey: i.queryKey,
                                        pageParam: a,
                                        direction: n ? "backward" : "forward",
                                        meta: i.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (i.signal.aborted ? r = !0 : i.signal.addEventListener("abort", () => {
                                            r = !0
                                        }), i.signal)
                                    }), s),
                                    u = await l(o),
                                    {
                                        maxPages: d
                                    } = i.options,
                                    c = n ? t.addToStart : t.addToEnd;
                                return {
                                    pages: c(e.pages, u, d),
                                    pageParams: c(e.pageParams, a, d)
                                }
                            };
                        if (m && f.length) {
                            let e = "backward" === m,
                                t = {
                                    pages: f,
                                    pageParams: g
                                },
                                i = (e ? n : a)(c, t);
                            p = await s(t, i, e)
                        } else {
                            let t = null != e ? e : f.length;
                            do {
                                var o;
                                let e = 0 === v ? null != (o = g[0]) ? o : c.initialPageParam : a(c, p);
                                if (v > 0 && null == e) break;
                                p = await s(p, e), v++
                            } while (v < t)
                        }
                        return p
                    };
                i.options.persister ? i.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = i.options).persister) ? void 0 : e.call(t, h, {
                        client: i.client,
                        queryKey: i.queryKey,
                        meta: i.options.meta,
                        signal: i.signal
                    }, r)
                } : i.fetchFn = h
            }
        }
    }])
}, 630986, e => {
    "use strict";
    var t = e.i(468612),
        a = e.i(117437),
        n = class extends t.QueryObserver {
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
                var n, i;
                let {
                    state: r
                } = e, l = super.createResult(e, t), {
                    isFetching: s,
                    isRefetching: o,
                    isError: u,
                    isRefetchError: d
                } = l, c = null == (i = r.fetchMeta) || null == (n = i.fetchMore) ? void 0 : n.direction, m = u && "forward" === c, f = s && "forward" === c, g = u && "backward" === c, p = s && "backward" === c;
                return {
                    ...l,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, a.hasNextPage)(t, r.data),
                    hasPreviousPage: (0, a.hasPreviousPage)(t, r.data),
                    isFetchNextPageError: m,
                    isFetchingNextPage: f,
                    isFetchPreviousPageError: g,
                    isFetchingPreviousPage: p,
                    isRefetchError: d && !m && !g,
                    isRefetching: o && !f && !p
                }
            }
            constructor(e, t) {
                super(e, t)
            }
        },
        i = e.i(624083);
    e.s(["useInfiniteQuery", 0, function(e, t) {
        return (0, i.useBaseQuery)(e, n, t)
    }], 630986)
}, 223808, (e, t, a) => {
    var n = 0 / 0,
        i = /^\s+|\s+$/g,
        r = /^[-+]0x[0-9a-f]+$/i,
        l = /^0b[01]+$/i,
        s = /^0o[0-7]+$/i,
        o = parseInt,
        u = e.g && e.g.Object === Object && e.g,
        d = "object" == typeof self && self && self.Object === Object && self,
        c = u || d || Function("return this")(),
        m = Object.prototype.toString,
        f = Math.max,
        g = Math.min,
        p = function() {
            return c.Date.now()
        };

    function v(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function h(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == m.call(t)) return n;
        if (v(e)) {
            var t, a = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = v(a) ? a + "" : a
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(i, "");
        var u = l.test(e);
        return u || s.test(e) ? o(e.slice(2), u ? 2 : 8) : r.test(e) ? n : +e
    }
    t.exports = function(e, t, a) {
        var n, i, r, l, s, o, u = 0,
            d = !1,
            c = !1,
            m = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function b(t) {
            var a = n,
                r = i;
            return n = i = void 0, u = t, l = e.apply(r, a)
        }

        function y(e) {
            var a = e - o,
                n = e - u;
            return void 0 === o || a >= t || a < 0 || c && n >= r
        }

        function E() {
            var e, a, n, i = p();
            if (y(i)) return P(i);
            s = setTimeout(E, (e = i - o, a = i - u, n = t - e, c ? g(n, r - a) : n))
        }

        function P(e) {
            return (s = void 0, m && n) ? b(e) : (n = i = void 0, l)
        }

        function M() {
            var e, a = p(),
                r = y(a);
            if (n = arguments, i = this, o = a, r) {
                if (void 0 === s) return u = e = o, s = setTimeout(E, t), d ? b(e) : l;
                if (c) return s = setTimeout(E, t), b(o)
            }
            return void 0 === s && (s = setTimeout(E, t)), l
        }
        return t = h(t) || 0, v(a) && (d = !!a.leading, r = (c = "maxWait" in a) ? f(h(a.maxWait) || 0, t) : r, m = "trailing" in a ? !!a.trailing : m), M.cancel = function() {
            void 0 !== s && clearTimeout(s), u = 0, n = o = i = s = void 0
        }, M.flush = function() {
            return void 0 === s ? l : P(p())
        }, M
    }
}, 167878, e => {
    "use strict";
    var t = e.i(416340);
    e.i(223808);
    var a = "u" > typeof window ? t.useLayoutEffect : t.useEffect,
        n = "u" < typeof window;
    e.s(["useMediaQuery", 0, function(e) {
        let {
            defaultValue: i = !1,
            initializeWithValue: r = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, l = e => n ? i : window.matchMedia(e).matches, [s, o] = (0, t.useState)(() => r ? l(e) : i);

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

//# debugId=d7e2c1f2-8e11-a7f3-f810-5ac55b2b6ec2
//# sourceMappingURL=0j2y6wj5bh_gt.js.map
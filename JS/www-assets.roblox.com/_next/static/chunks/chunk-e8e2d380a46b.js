;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "0c7797d9-638a-cbcf-b27b-86a458296f9c")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 967715, e => {
    "use strict";
    var t = e.i(778935),
        r = e.i(7284),
        n = e.i(420482);
    let a = {
            Neutral: "bg-shift-200",
            Standard: "bg-shift-200",
            Contrast: "bg-system-contrast",
            Emphasis: "bg-system-emphasis",
            Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
            Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
            Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
            OverMediaLight: "bg-[var(--light-mode-over-media-0)]",
            OverMedia: "bg-over-media-0"
        },
        i = {
            Neutral: "content-emphasis",
            Standard: "content-emphasis",
            Contrast: "content-inverse-emphasis",
            Emphasis: "content-[var(--dark-mode-content-emphasis)]",
            Success: "content-emphasis",
            Warning: "content-emphasis",
            Alert: "content-emphasis",
            OverMediaLight: "content-[var(--light-mode-content-emphasis)]",
            OverMedia: "content-emphasis"
        },
        s = {
            Neutral: "content-emphasis",
            Standard: "content-emphasis",
            Contrast: "content-inverse-emphasis",
            Emphasis: "content-[var(--dark-mode-content-emphasis)]",
            Success: "content-system-success",
            Warning: "content-system-warning",
            Alert: "content-system-alert",
            OverMediaLight: "content-[var(--light-mode-content-emphasis)]",
            OverMedia: "content-emphasis"
        },
        l = {
            Neutral: "stroke-none",
            Standard: "stroke-none",
            Contrast: "stroke-none",
            Emphasis: "stroke-none",
            Success: "stroke-none",
            Warning: "stroke-none",
            Alert: "stroke-none",
            OverMediaLight: "stroke-none",
            OverMedia: "stroke-none"
        },
        o = {
            Small: "height-600",
            XSmall: "height-400"
        },
        u = {
            Small: "padding-x-small",
            XSmall: "padding-x-xsmall"
        },
        c = {
            Small: "width-600",
            XSmall: "width-400"
        },
        d = {
            Small: "text-label-small",
            XSmall: "text-caption-small"
        },
        f = {
            Small: "padding-y-xsmall",
            XSmall: "padding-y-none"
        },
        m = {
            Small: "XSmall",
            XSmall: "XSmall"
        },
        h = {
            Pill: "radius-circle",
            Box: "radius-small"
        },
        p = n.default.forwardRef((e, p) => {
            let {
                className: v,
                label: g,
                variant: y = "Standard",
                icon: b,
                iconPosition: x = "Leading",
                size: E = "Small",
                shape: S = "Pill",
                ...w
            } = e, M = b && !g, k = "padding-x-xxsmall";
            b && (k = "Leading" === x ? "padding-right-xxsmall" : "padding-left-xxsmall");
            let C = b && n.default.createElement(t.Icon, {
                name: b,
                size: m[E],
                className: s[y]
            });
            return n.default.createElement("div", {
                ref: p,
                ...w,
                className: (0, r.default)("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", h[S], o[E], M ? [c[E], "justify-center"] : ["width-[fit-content]", u[E]], a[y], i[y], l[y], v)
            }, "Leading" === x && C, g && n.default.createElement("span", {
                className: (0, r.default)("text-no-wrap text-truncate-split", d[E], f[E], k, i[y])
            }, g), "Trailing" === x && C)
        });
    p.displayName = "Badge", e.s(["Badge", 0, p])
}, 274879, e => {
    "use strict";
    var t = e.i(420482);
    e.i(19836);
    var r = t.createContext(void 0);
    e.s(["useDirection", 0, function(e) {
        let n = t.useContext(r);
        return e || n || "ltr"
    }])
}, 654784, e => {
    "use strict";
    var t, r = e.i(376054),
        n = e.i(136927),
        a = e.i(550475),
        i = e.i(420482),
        s = e.i(734988),
        l = e.i(539181),
        o = e.i(56144),
        u = e.i(19836),
        c = new WeakMap;

    function d(e, t) {
        var r, n;
        let a, i, s;
        if ("at" in Array.prototype) return Array.prototype.at.call(e, t);
        let l = (r = e, n = t, a = r.length, (s = (i = f(n)) >= 0 ? i : a + i) < 0 || s >= a ? -1 : s);
        return -1 === l ? void 0 : e[l]
    }

    function f(e) {
        return e != e || 0 === e ? 0 : Math.trunc(e)
    }
    t = new WeakMap, (class e extends Map {
        set(e, n) {
            return c.get(this) && (this.has(e) ? (0, r._)(this, t)[(0, r._)(this, t).indexOf(e)] = e : (0, r._)(this, t).push(e)), super.set(e, n), this
        }
        insert(e, n, a) {
            let i, s = this.has(n),
                l = (0, r._)(this, t).length,
                o = f(e),
                u = o >= 0 ? o : l + o,
                c = u < 0 || u >= l ? -1 : u;
            if (c === this.size || s && c === this.size - 1 || -1 === c) return this.set(n, a), this;
            let d = this.size + +!s;
            o < 0 && u++;
            let m = [...(0, r._)(this, t)],
                h = !1;
            for (let e = u; e < d; e++)
                if (u === e) {
                    let t = m[e];
                    m[e] === n && (t = m[e + 1]), s && this.delete(n), i = this.get(t), this.set(n, a)
                } else {
                    h || m[e - 1] !== n || (h = !0);
                    let t = m[h ? e : e - 1],
                        r = i;
                    i = this.get(t), this.delete(t), this.set(t, r)
                } return this
        }
        with(t, r, n) {
            let a = new e(this);
            return a.insert(t, r, n), a
        }
        before(e) {
            let n = (0, r._)(this, t).indexOf(e) - 1;
            if (!(n < 0)) return this.entryAt(n)
        }
        setBefore(e, n, a) {
            let i = (0, r._)(this, t).indexOf(e);
            return -1 === i ? this : this.insert(i, n, a)
        }
        after(e) {
            let n = (0, r._)(this, t).indexOf(e);
            if (-1 !== (n = -1 === n || n === this.size - 1 ? -1 : n + 1)) return this.entryAt(n)
        }
        setAfter(e, n, a) {
            let i = (0, r._)(this, t).indexOf(e);
            return -1 === i ? this : this.insert(i + 1, n, a)
        }
        first() {
            return this.entryAt(0)
        }
        last() {
            return this.entryAt(-1)
        }
        clear() {
            return (0, a._)(this, t, []), super.clear()
        }
        delete(e) {
            let n = super.delete(e);
            return n && (0, r._)(this, t).splice((0, r._)(this, t).indexOf(e), 1), n
        }
        deleteAt(e) {
            let t = this.keyAt(e);
            return void 0 !== t && this.delete(t)
        }
        at(e) {
            let n = d((0, r._)(this, t), e);
            if (void 0 !== n) return this.get(n)
        }
        entryAt(e) {
            let n = d((0, r._)(this, t), e);
            if (void 0 !== n) return [n, this.get(n)]
        }
        indexOf(e) {
            return (0, r._)(this, t).indexOf(e)
        }
        keyAt(e) {
            return d((0, r._)(this, t), e)
        }
        from(e, t) {
            let r = this.indexOf(e);
            if (-1 === r) return;
            let n = r + t;
            return n < 0 && (n = 0), n >= this.size && (n = this.size - 1), this.at(n)
        }
        keyFrom(e, t) {
            let r = this.indexOf(e);
            if (-1 === r) return;
            let n = r + t;
            return n < 0 && (n = 0), n >= this.size && (n = this.size - 1), this.keyAt(n)
        }
        find(e, t) {
            let r = 0;
            for (let n of this) {
                if (Reflect.apply(e, t, [n, r, this])) return n;
                r++
            }
        }
        findIndex(e, t) {
            let r = 0;
            for (let n of this) {
                if (Reflect.apply(e, t, [n, r, this])) return r;
                r++
            }
            return -1
        }
        filter(t, r) {
            let n = [],
                a = 0;
            for (let e of this) Reflect.apply(t, r, [e, a, this]) && n.push(e), a++;
            return new e(n)
        }
        map(t, r) {
            let n = [],
                a = 0;
            for (let e of this) n.push([e[0], Reflect.apply(t, r, [e, a, this])]), a++;
            return new e(n)
        }
        reduce() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            let [n, a] = t, i = 0, s = a ?? this.at(0);
            for (let e of this) s = 0 === i && 1 === t.length ? e : Reflect.apply(n, this, [s, e, i, this]), i++;
            return s
        }
        reduceRight() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            let [n, a] = t, i = a ?? this.at(-1);
            for (let e = this.size - 1; e >= 0; e--) {
                let r = this.at(e);
                i = e === this.size - 1 && 1 === t.length ? r : Reflect.apply(n, this, [i, r, e, this])
            }
            return i
        }
        toSorted(t) {
            return new e([...this.entries()].sort(t))
        }
        toReversed() {
            let t = new e;
            for (let e = this.size - 1; e >= 0; e--) {
                let r = this.keyAt(e),
                    n = this.get(r);
                t.set(r, n)
            }
            return t
        }
        toSpliced() {
            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
            let a = [...this.entries()];
            return a.splice(...r), new e(a)
        }
        slice(t, r) {
            let n = new e,
                a = this.size - 1;
            if (void 0 === t) return n;
            t < 0 && (t += this.size), void 0 !== r && r > 0 && (a = r - 1);
            for (let e = t; e <= a; e++) {
                let t = this.keyAt(e),
                    r = this.get(t);
                n.set(t, r)
            }
            return n
        }
        every(e, t) {
            let r = 0;
            for (let n of this) {
                if (!Reflect.apply(e, t, [n, r, this])) return !1;
                r++
            }
            return !0
        }
        some(e, t) {
            let r = 0;
            for (let n of this) {
                if (Reflect.apply(e, t, [n, r, this])) return !0;
                r++
            }
            return !1
        }
        constructor(e) {
            super(e), (0, n._)(this, t, {
                writable: !0,
                value: void 0
            }), (0, a._)(this, t, [...super.keys()]), c.set(this, !0)
        }
    }), e.s(["createCollection", 0, function(e) {
        let t = e + "CollectionProvider",
            [r, n] = (0, s.createContextScope)(t),
            [a, c] = r(t, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: t,
                    children: r
                } = e, n = i.default.useRef(null), s = i.default.useRef(new Map).current;
                return (0, u.jsx)(a, {
                    scope: t,
                    itemMap: s,
                    collectionRef: n,
                    children: r
                })
            };
        d.displayName = t;
        let f = e + "CollectionSlot",
            m = (0, o.createSlot)(f),
            h = i.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: n
                } = e, a = c(f, r), i = (0, l.useComposedRefs)(t, a.collectionRef);
                return (0, u.jsx)(m, {
                    ref: i,
                    children: n
                })
            });
        h.displayName = f;
        let p = e + "CollectionItemSlot",
            v = "data-radix-collection-item",
            g = (0, o.createSlot)(p),
            y = i.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: n,
                    ...a
                } = e, s = i.default.useRef(null), o = (0, l.useComposedRefs)(t, s), d = c(p, r);
                return i.default.useEffect(() => (d.itemMap.set(s, {
                    ref: s,
                    ...a
                }), () => void d.itemMap.delete(s))), (0, u.jsx)(g, {
                    ...{
                        [v]: ""
                    },
                    ref: o,
                    children: n
                })
            });
        return y.displayName = p, [{
            Provider: d,
            Slot: h,
            ItemSlot: y
        }, function(t) {
            let r = c(e + "CollectionConsumer", t);
            return i.default.useCallback(() => {
                let e = r.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll(`[${v}]`));
                return Array.from(r.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [r.collectionRef, r.itemMap])
        }, n]
    }])
}, 206983, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(291967),
        n = e.i(654784),
        a = e.i(539181),
        i = e.i(734988),
        s = e.i(481010),
        l = e.i(743682),
        o = e.i(823499),
        u = e.i(118747),
        c = e.i(274879),
        d = e.i(19836),
        f = "rovingFocusGroup.onEntryFocus",
        m = {
            bubbles: !1,
            cancelable: !0
        },
        h = "RovingFocusGroup",
        [p, v, g] = (0, n.createCollection)(h),
        [y, b] = (0, i.createContextScope)(h, [g]),
        [x, E] = y(h),
        S = t.forwardRef((e, t) => (0, d.jsx)(p.Provider, {
            scope: e.__scopeRovingFocusGroup,
            children: (0, d.jsx)(p.Slot, {
                scope: e.__scopeRovingFocusGroup,
                children: (0, d.jsx)(w, {
                    ...e,
                    ref: t
                })
            })
        }));
    S.displayName = h;
    var w = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: i,
                orientation: s,
                loop: p = !1,
                dir: g,
                currentTabStopId: y,
                defaultCurrentTabStopId: b,
                onCurrentTabStopIdChange: E,
                onEntryFocus: S,
                preventScrollOnEntryFocus: w = !1,
                ...M
            } = e, k = t.useRef(null), C = (0, a.useComposedRefs)(n, k), A = (0, c.useDirection)(g), [N, O] = (0, u.useControllableState)({
                prop: y,
                defaultProp: b ?? null,
                onChange: E,
                caller: h
            }), [_, L] = t.useState(!1), T = (0, o.useCallbackRef)(S), I = v(i), P = t.useRef(!1), [j, z] = t.useState(0);
            return t.useEffect(() => {
                let e = k.current;
                if (e) return e.addEventListener(f, T), () => e.removeEventListener(f, T)
            }, [T]), (0, d.jsx)(x, {
                scope: i,
                orientation: s,
                dir: A,
                loop: p,
                currentTabStopId: N,
                onItemFocus: t.useCallback(e => O(e), [O]),
                onItemShiftTab: t.useCallback(() => L(!0), []),
                onFocusableItemAdd: t.useCallback(() => z(e => e + 1), []),
                onFocusableItemRemove: t.useCallback(() => z(e => e - 1), []),
                children: (0, d.jsx)(l.Primitive.div, {
                    tabIndex: _ || 0 === j ? -1 : 0,
                    "data-orientation": s,
                    ...M,
                    ref: C,
                    style: {
                        outline: "none",
                        ...e.style
                    },
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, () => {
                        P.current = !0
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, e => {
                        let t = !P.current;
                        if (e.target === e.currentTarget && t && !_) {
                            let t = new CustomEvent(f, m);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = I().filter(e => e.focusable);
                                R([e.find(e => e.active), e.find(e => e.id === N), ...e].filter(Boolean).map(e => e.ref.current), w)
                            }
                        }
                        P.current = !1
                    }),
                    onBlur: (0, r.composeEventHandlers)(e.onBlur, () => L(!1))
                })
            })
        }),
        M = "RovingFocusGroupItem",
        k = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: a,
                focusable: i = !0,
                active: o = !1,
                tabStopId: u,
                children: c,
                ...f
            } = e, m = (0, s.useId)(), h = u || m, g = E(M, a), y = g.currentTabStopId === h, b = v(a), {
                onFocusableItemAdd: x,
                onFocusableItemRemove: S,
                currentTabStopId: w
            } = g;
            return t.useEffect(() => {
                if (i) return x(), () => S()
            }, [i, x, S]), (0, d.jsx)(p.ItemSlot, {
                scope: a,
                id: h,
                focusable: i,
                active: o,
                children: (0, d.jsx)(l.Primitive.span, {
                    tabIndex: y ? 0 : -1,
                    "data-orientation": g.orientation,
                    ...f,
                    ref: n,
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, e => {
                        i ? g.onItemFocus(h) : e.preventDefault()
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, () => g.onItemFocus(h)),
                    onKeyDown: (0, r.composeEventHandlers)(e.onKeyDown, e => {
                        if ("Tab" === e.key && e.shiftKey) return void g.onItemShiftTab();
                        if (e.target !== e.currentTarget) return;
                        let t = function(e, t, r) {
                            var n;
                            let a = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                            if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(a)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(a))) return C[a]
                        }(e, g.orientation, g.dir);
                        if (void 0 !== t) {
                            if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                            e.preventDefault();
                            let a = b().filter(e => e.focusable).map(e => e.ref.current);
                            if ("last" === t) a.reverse();
                            else if ("prev" === t || "next" === t) {
                                var r, n;
                                "prev" === t && a.reverse();
                                let i = a.indexOf(e.currentTarget);
                                a = g.loop ? (r = a, n = i + 1, r.map((e, t) => r[(n + t) % r.length])) : a.slice(i + 1)
                            }
                            setTimeout(() => R(a))
                        }
                    }),
                    children: "function" == typeof c ? c({
                        isCurrentTabStop: y,
                        hasTabStop: null != w
                    }) : c
                })
            })
        });
    k.displayName = M;
    var C = {
        ArrowLeft: "prev",
        ArrowUp: "prev",
        ArrowRight: "next",
        ArrowDown: "next",
        PageUp: "first",
        Home: "first",
        PageDown: "last",
        End: "last"
    };

    function R(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            r = document.activeElement;
        for (let n of e)
            if (n === r || (n.focus({
                    preventScroll: t
                }), document.activeElement !== r)) return
    }
    e.s(["Item", 0, k, "Root", 0, S, "createRovingFocusGroupScope", 0, b])
}, 527069, e => {
    "use strict";
    e.s(["clamp", 0, function(e, t) {
        let [r, n] = t;
        return Math.min(n, Math.max(r, e))
    }])
}, 155581, e => {
    "use strict";
    let t = (e, t, r, n) => {
        try {
            return new Intl.NumberFormat(t, {
                style: r,
                currency: n
            }).format(e)
        } catch {
            return e.toString()
        }
    };
    var r, n = ((r = {}).withPlus = "withPlus", r.withoutPlus = "withoutPlus", r);
    let a = {
        withPlus: ["", "K+", "M+", "B+", "T+"],
        withoutPlus: ["", "K", "M", "B", "T"]
    };
    e.s(["SuffixNames", () => n, "abbreviateNumber", 0, (e, r, n, i) => {
        let s = `${e}`;
        if (n && e < n) return i ? t(e) : s;
        let l = r ? a[r] : a.withoutPlus,
            o = Math.ceil(s.length / 3),
            u = Math.round(e / 1e3 ** o * 10) / 10,
            c = o - 1,
            d = Math.round(e / 1e3 ** c * 10) / 10;
        return d >= 1e3 ? u.toString() + l[o] : d.toString() + l[c]
    }, "formatNumber", 0, t, "suffixes", 0, a, "truncNumber", 0, (e, r, n, i) => {
        let s = `${e}`;
        if (e < (r ?? 1e4)) return t(e);
        let l = n ? a[n] : a.withPlus,
            o = 12,
            u = l[Math.min(Math.floor(Math.log(e) / Math.log(1e3)), l.length - 1)];
        e < 1e6 ? o = 3 : e < 1e9 ? o = 6 : e < 1e12 && (o = 9);
        let c = s.length - o,
            d = i ? `.${s.substring(c,c+i)}` : "";
        return s.substring(0, c) + d + u
    }])
}, 564035, e => {
    "use strict";
    e.s(["assetUrl", 0, e => "string" == typeof e ? e : e.src])
}, 291967, e => {
    "use strict";
    "u" > typeof window && window.document && window.document.createElement, e.s(["composeEventHandlers", 0, function(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(n) {
            if (e?.(n), !1 === r || !n.defaultPrevented) return t?.(n)
        }
    }])
}, 518250, e => {
    "use strict";
    e.s(["createTrackers", 0, function(e, t) {
        let {
            publish: r,
            captureException: n,
            featureName: a
        } = t;

        function i(e, t, r) {
            if (null != r) {
                let i = r instanceof Error ? r.name || "Error" : "UnknownError",
                    s = a ? `${a}_${e}` : e;
                return n?.(r, {
                    error_counter: s
                }), {
                    ...t,
                    errorType: i
                }
            }
            return t
        }
        return {
            trackCounter() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                let [a, i] = t;
                r(a, i)
            },
            trackError() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                let [a, s, l] = t, o = i(a, {
                    ...s ?? {},
                    severity: "error"
                }, l);
                r(a, o)
            },
            trackCriticalError() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                let [a, s, l] = t, o = i(a, {
                    ...s ?? {},
                    severity: "critical"
                }, l);
                r(a, o)
            }
        }
    }])
}, 118747, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(13522);
    t[" useEffectEvent ".trim().toString()], t[" useInsertionEffect ".trim().toString()];
    var n = t[" useInsertionEffect ".trim().toString()] || r.useLayoutEffect;
    Symbol("RADIX:SYNC_STATE"), e.s(["useControllableState", 0, function(e) {
        let {
            prop: r,
            defaultProp: a,
            onChange: i = () => {},
            caller: s
        } = e, [l, o, u] = function(e) {
            let {
                defaultProp: r,
                onChange: a
            } = e, [i, s] = t.useState(r), l = t.useRef(i), o = t.useRef(a);
            return n(() => {
                o.current = a
            }, [a]), t.useEffect(() => {
                l.current !== i && (o.current?.(i), l.current = i)
            }, [i, l]), [i, s, o]
        }({
            defaultProp: a,
            onChange: i
        }), c = void 0 !== r, d = c ? r : l;
        {
            let e = t.useRef(void 0 !== r);
            t.useEffect(() => {
                let t = e.current;
                if (t !== c) {
                    let e = c ? "controlled" : "uncontrolled";
                    console.warn(`${s} is changing from ${t?"controlled":"uncontrolled"} to ${e}. Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component.`)
                }
                e.current = c
            }, [c, s])
        }
        return [d, t.useCallback(e => {
            if (c) {
                let t = "function" == typeof e ? e(r) : e;
                t !== r && u.current?.(t)
            } else o(e)
        }, [c, r, o, u])]
    }], 118747)
}, 183901, e => {
    "use strict";
    var t = e.i(420482);
    e.s(["usePrevious", 0, function(e) {
        let r = t.useRef({
            value: e,
            previous: e
        });
        return t.useMemo(() => (r.current.value !== e && (r.current.previous = r.current.value, r.current.value = e), r.current.previous), [e])
    }])
}, 189192, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(13522);
    e.s(["useSize", 0, function(e) {
        let [n, a] = t.useState(void 0);
        return (0, r.useLayoutEffect)(() => {
            if (e) {
                a({
                    width: e.offsetWidth,
                    height: e.offsetHeight
                });
                let t = new ResizeObserver(t => {
                    let r, n;
                    if (!Array.isArray(t) || !t.length) return;
                    let i = t[0];
                    if ("borderBoxSize" in i) {
                        let e = i.borderBoxSize,
                            t = Array.isArray(e) ? e[0] : e;
                        r = t.inlineSize, n = t.blockSize
                    } else r = e.offsetWidth, n = e.offsetHeight;
                    a({
                        width: r,
                        height: n
                    })
                });
                return t.observe(e, {
                    box: "border-box"
                }), () => t.unobserve(e)
            }
            a(void 0)
        }, [e]), n
    }])
}, 264458, (e, t, r) => {
    ! function() {
        "use strict";
        var r = {}.hasOwnProperty;

        function n() {
            for (var e = "", t = 0; t < arguments.length; t++) {
                var i = arguments[t];
                i && (e = a(e, function(e) {
                    if ("string" == typeof e || "number" == typeof e) return e;
                    if ("object" != typeof e) return "";
                    if (Array.isArray(e)) return n.apply(null, e);
                    if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                    var t = "";
                    for (var i in e) r.call(e, i) && e[i] && (t = a(t, i));
                    return t
                }(i)))
            }
            return e
        }

        function a(e, t) {
            return t ? e ? e + " " + t : e + t : e
        }
        if (t.exports) n.default = n, t.exports = n;
        else if ("function" == typeof define && "object" == typeof define.amd && define.amd) void 0 !== n && e.v(n);
        else window.classNames = n
    }()
}, 424935, e => {
    "use strict";
    var t = e.i(941918),
        r = e.i(986592),
        n = e.i(7284),
        a = e.i(420482),
        i = e.i(919403);
    let s = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        l = {
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
        c = {
            Emphasis: "bg-action-standard",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        d = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        f = {
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
        m = {
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
        h = (0, a.forwardRef)((e, h) => {
            let p, {
                className: v,
                icon: g,
                ariaLabel: y,
                isDisabled: b = !1,
                isCircular: x = !1,
                isSelected: E = !1,
                size: S = "Large",
                variant: w = "Emphasis",
                iconColor: M = "Default",
                asChild: k,
                children: C,
                ...R
            } = e;
            p = b ? c[w] : E ? d[w] : u[w];
            let A = (0, n.default)("foundation-web-icon-button", b ? r.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", s[S], o[S][x ? "circular" : "square"], p, v),
                N = a.default.createElement(a.default.Fragment, null, a.default.createElement(t.StateLayer, null), a.default.createElement("span", {
                    className: (0, n.default)("icon", g, l[S], b ? m[M][w] : f[M][w])
                }));
            if (k) {
                let {
                    as: e,
                    ...t
                } = R, r = a.default.Children.only(C);
                return a.default.createElement(i.Slot, {
                    ref: h,
                    ...t,
                    className: A,
                    "aria-label": y,
                    "aria-disabled": b || void 0
                }, a.default.cloneElement(r, {}, N))
            }
            if ("a" === R.as) {
                let {
                    as: e,
                    href: t,
                    ...r
                } = R;
                return a.default.createElement("a", {
                    ref: h,
                    ...r,
                    "aria-label": y,
                    "aria-disabled": b,
                    href: b ? void 0 : t,
                    className: A
                }, N)
            }
            let {
                as: O,
                ..._
            } = R;
            return a.default.createElement("button", {
                ref: h,
                type: "button",
                ..._,
                "aria-label": y,
                disabled: b,
                className: A
            }, N)
        });
    e.s(["IconButton", 0, h])
}, 433424, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(420482);
    let n = {
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
        a = r.default.forwardRef((e, a) => {
            let {
                className: i,
                size: s = "Large",
                variant: l = "Determinate",
                value: o = 0,
                showValue: u = !1,
                ariaLabel: c,
                ...d
            } = e, {
                dimension: f,
                strokeWidth: m,
                textClass: h,
                valueContainerSize: p
            } = n[s], v = (f - m) / 2, g = 2 * Math.PI * v, y = f / 2, b = Math.min(100, Math.max(0, o)), x = u && void 0 !== p ? p : f, E = "Determinate" === l;
            return r.default.createElement("div", {
                ref: a,
                className: (0, t.default)("foundation-web-progress-circle inline-flex items-center justify-center", i),
                role: "progressbar",
                "aria-label": c,
                "aria-valuemin": E ? 0 : void 0,
                "aria-valuemax": E ? 100 : void 0,
                "aria-valuenow": E ? b : void 0,
                style: {
                    width: x,
                    height: x
                },
                ...d
            }, r.default.createElement("svg", {
                width: f,
                height: f,
                viewBox: `0 0 ${f} ${f}`,
                className: "relative"
            }, r.default.createElement("circle", {
                cx: y,
                cy: y,
                r: v,
                fill: "none",
                strokeWidth: m,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), r.default.createElement("circle", {
                cx: y,
                cy: y,
                r: v,
                fill: "none",
                strokeWidth: m,
                strokeDasharray: E ? g : `${.75*g} ${.25*g}`,
                strokeDashoffset: E ? g * (1 - b / 100) : 0,
                strokeLinecap: "round",
                className: (0, t.default)(!E && "foundation-web-progress-circle-indeterminate"),
                style: E ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), E && u && "Large" === s && r.default.createElement("div", {
                className: (0, t.default)("absolute content-emphasis flex items-center justify-center", h),
                "aria-hidden": "true"
            }, r.default.createElement("span", null, Math.round(b)), r.default.createElement("span", null, "%")))
        });
    a.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, a])
}, 830670, 260842, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(539181),
        n = e.i(734988),
        a = e.i(291967),
        i = e.i(118747),
        s = e.i(183901),
        l = e.i(189192),
        o = e.i(13522),
        u = e => {
            var n;
            let a, i, {
                    present: s,
                    children: l
                } = e,
                u = function(e) {
                    var r, n;
                    let [a, i] = t.useState(), s = t.useRef(null), l = t.useRef(e), u = t.useRef("none"), [d, f] = (r = e ? "mounted" : "unmounted", n = {
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
                    }, t.useReducer((e, t) => n[e][t] ?? e, r));
                    return t.useEffect(() => {
                        let e = c(s.current);
                        u.current = "mounted" === d ? e : "none"
                    }, [d]), (0, o.useLayoutEffect)(() => {
                        let t = s.current,
                            r = l.current;
                        if (r !== e) {
                            let n = u.current,
                                a = c(t);
                            e ? f("MOUNT") : "none" === a || t?.display === "none" ? f("UNMOUNT") : r && n !== a ? f("ANIMATION_OUT") : f("UNMOUNT"), l.current = e
                        }
                    }, [e, f]), (0, o.useLayoutEffect)(() => {
                        if (a) {
                            let e, t = a.ownerDocument.defaultView ?? window,
                                r = r => {
                                    let n = c(s.current).includes(CSS.escape(r.animationName));
                                    if (r.target === a && n && (f("ANIMATION_END"), !l.current)) {
                                        let r = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", e = t.setTimeout(() => {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = r)
                                        })
                                    }
                                },
                                n = e => {
                                    e.target === a && (u.current = c(s.current))
                                };
                            return a.addEventListener("animationstart", n), a.addEventListener("animationcancel", r), a.addEventListener("animationend", r), () => {
                                t.clearTimeout(e), a.removeEventListener("animationstart", n), a.removeEventListener("animationcancel", r), a.removeEventListener("animationend", r)
                            }
                        }
                        f("ANIMATION_END")
                    }, [a, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: t.useCallback(e => {
                            s.current = e ? getComputedStyle(e) : null, i(e)
                        }, [])
                    }
                }(s),
                d = "function" == typeof l ? l({
                    present: u.isPresent
                }) : t.Children.only(l),
                f = (0, r.useComposedRefs)(u.ref, (n = d, (i = (a = Object.getOwnPropertyDescriptor(n.props, "ref")?.get) && "isReactWarning" in a && a.isReactWarning) ? n.ref : (i = (a = Object.getOwnPropertyDescriptor(n, "ref")?.get) && "isReactWarning" in a && a.isReactWarning) ? n.props.ref : n.props.ref || n.ref));
            return "function" == typeof l || u.isPresent ? t.cloneElement(d, {
                ref: f
            }) : null
        };

    function c(e) {
        return e?.animationName || "none"
    }
    u.displayName = "Presence", e.s(["Presence", 0, u], 260842);
    var d = e.i(743682),
        f = e.i(19836),
        m = "Checkbox",
        [h, p] = (0, n.createContextScope)(m),
        [v, g] = h(m);

    function y(e) {
        let {
            __scopeCheckbox: r,
            checked: n,
            children: a,
            defaultChecked: s,
            disabled: l,
            form: o,
            name: u,
            onCheckedChange: c,
            required: d,
            value: h = "on",
            internal_do_not_use_render: p
        } = e, [g, y] = (0, i.useControllableState)({
            prop: n,
            defaultProp: s ?? !1,
            onChange: c,
            caller: m
        }), [b, x] = t.useState(null), [E, S] = t.useState(null), w = t.useRef(!1), M = !b || !!o || !!b.closest("form"), k = {
            checked: g,
            disabled: l,
            setChecked: y,
            control: b,
            setControl: x,
            name: u,
            form: o,
            value: h,
            hasConsumerStoppedPropagationRef: w,
            required: d,
            defaultChecked: !C(s) && s,
            isFormControl: M,
            bubbleInput: E,
            setBubbleInput: S
        };
        return (0, f.jsx)(v, {
            scope: r,
            ...k,
            children: "function" == typeof p ? p(k) : a
        })
    }
    var b = "CheckboxTrigger",
        x = t.forwardRef((e, n) => {
            let {
                __scopeCheckbox: i,
                onKeyDown: s,
                onClick: l,
                ...o
            } = e, {
                control: u,
                value: c,
                disabled: m,
                checked: h,
                required: p,
                setControl: v,
                setChecked: y,
                hasConsumerStoppedPropagationRef: x,
                isFormControl: E,
                bubbleInput: S
            } = g(b, i), w = (0, r.useComposedRefs)(n, v), M = t.useRef(h);
            return t.useEffect(() => {
                let e = u?.form;
                if (e) {
                    let t = () => y(M.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, y]), (0, f.jsx)(d.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": C(h) ? "mixed" : h,
                "aria-required": p,
                "data-state": R(h),
                "data-disabled": m ? "" : void 0,
                disabled: m,
                value: c,
                ...o,
                ref: w,
                onKeyDown: (0, a.composeEventHandlers)(s, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, a.composeEventHandlers)(l, e => {
                    y(e => !!C(e) || !e), S && E && (x.current = e.isPropagationStopped(), x.current || e.stopPropagation())
                })
            })
        });
    x.displayName = b;
    var E = t.forwardRef((e, t) => {
        let {
            __scopeCheckbox: r,
            name: n,
            checked: a,
            defaultChecked: i,
            required: s,
            disabled: l,
            value: o,
            onCheckedChange: u,
            form: c,
            ...d
        } = e;
        return (0, f.jsx)(y, {
            __scopeCheckbox: r,
            checked: a,
            defaultChecked: i,
            disabled: l,
            required: s,
            onCheckedChange: u,
            name: n,
            form: c,
            value: o,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, f.jsxs)(f.Fragment, {
                    children: [(0, f.jsx)(x, {
                        ...d,
                        ref: t,
                        __scopeCheckbox: r
                    }), n && (0, f.jsx)(k, {
                        __scopeCheckbox: r
                    })]
                })
            }
        })
    });
    E.displayName = m;
    var S = "CheckboxIndicator",
        w = t.forwardRef((e, t) => {
            let {
                __scopeCheckbox: r,
                forceMount: n,
                ...a
            } = e, i = g(S, r);
            return (0, f.jsx)(u, {
                present: n || C(i.checked) || !0 === i.checked,
                children: (0, f.jsx)(d.Primitive.span, {
                    "data-state": R(i.checked),
                    "data-disabled": i.disabled ? "" : void 0,
                    ...a,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    w.displayName = S;
    var M = "CheckboxBubbleInput",
        k = t.forwardRef((e, n) => {
            let {
                __scopeCheckbox: a,
                ...i
            } = e, {
                control: o,
                hasConsumerStoppedPropagationRef: u,
                checked: c,
                defaultChecked: m,
                required: h,
                disabled: p,
                name: v,
                value: y,
                form: b,
                bubbleInput: x,
                setBubbleInput: E
            } = g(M, a), S = (0, r.useComposedRefs)(n, E), w = (0, s.usePrevious)(c), k = (0, l.useSize)(o);
            t.useEffect(() => {
                if (!x) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !u.current;
                if (w !== c && e) {
                    let r = new Event("click", {
                        bubbles: t
                    });
                    x.indeterminate = C(c), e.call(x, !C(c) && c), x.dispatchEvent(r)
                }
            }, [x, w, c, u]);
            let R = t.useRef(!C(c) && c);
            return (0, f.jsx)(d.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: m ?? R.current,
                required: h,
                disabled: p,
                name: v,
                value: y,
                form: b,
                ...i,
                tabIndex: -1,
                ref: S,
                style: {
                    ...i.style,
                    ...k,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function C(e) {
        return "indeterminate" === e
    }

    function R(e) {
        return C(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    k.displayName = M, e.s(["Indicator", 0, w, "Root", 0, E], 830670)
}, 139047, e => {
    "use strict";
    var t = e.i(245837),
        r = e.i(10224);
    let n = async (e, n) => {
        let a = ((e, r) => {
            let {
                apiGatewayUrl: n
            } = t.default, a = "/guac-v2/v1/bundles/<behaviour-name>".replace("<behaviour-name>", e), i = r?.toString() ?? "";
            return `${n}${a}${""===i?"":`?${i}`}`
        })(e, n);
        return (await (0, r.get)({
            url: a,
            withCredentials: !0
        })).data
    };
    e.s(["callBehaviour", 0, n])
}, 217486, e => {
    "use strict";
    var t = e.i(420482);
    let r = (0, t.createContext)(null),
        n = (0, t.createContext)(null),
        a = (0, t.createContext)(null);
    e.s(["CheckboxGroupContext", 0, r, "ChipGroupContext", 0, a, "ToggleGroupContext", 0, n])
}, 698178, e => {
    "use strict";
    var t = e.i(941918),
        r = e.i(520250),
        n = e.i(217486),
        a = e.i(7284),
        i = e.i(420482),
        s = e.i(830670);
    let l = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        o = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        u = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        c = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: d,
            className: f,
            isChecked: m,
            isDisabled: h,
            size: p,
            hint: v,
            placement: g,
            onCheckedChange: y,
            id: b,
            "aria-describedby": x,
            ...E
        } = e, S = (0, i.useContext)(n.CheckboxGroupContext), w = S?.size ?? p ?? "Medium", M = S?.placement ?? g ?? "Start", k = h || S?.isDisabled, C = (0, r.default)(), R = b || C, A = S && d && v ? `${R}Hint` : void 0, N = d && i.default.createElement("label", {
            htmlFor: R,
            className: (0, a.default)("flex flex-col grow-1 gap-xsmall", !k && "cursor-pointer")
        }, i.default.createElement("span", {
            className: (0, a.default)(u[w], c[w], "content-emphasis")
        }, d), v && i.default.createElement("span", {
            id: A,
            className: (0, a.default)(S ? u[w] : "text-body-medium", "content-default")
        }, v));
        return i.default.createElement("div", {
            className: (0, a.default)("foundation-web-checkbox flex gap-medium", k && "opacity-[0.5]", !k && "cursor-pointer", f)
        }, "End" === M && N, i.default.createElement("div", {
            className: (0, a.default)(o[w])
        }, i.default.createElement(s.Root, {
            "data-slot": "checkbox",
            className: (0, a.default)(l[w], t.interactable, !k && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: R,
            checked: m,
            disabled: k,
            onCheckedChange: y,
            "aria-label": d,
            "aria-describedby": [x, A].filter(Boolean).join(" ") || void 0,
            ...E
        }, i.default.createElement(t.StateLayer, null), i.default.createElement(s.Indicator, {
            "data-slot": "checkbox-indicator",
            className: (0, a.default)(l[w], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === M && N)
    }])
}, 154286, e => {
    "use strict";
    var t = e.i(868275),
        r = e.i(270784),
        n = e.i(778579),
        a = e.i(309937),
        i = e.i(245837);
    e.i(737344);
    var s = e.i(646424),
        l = e.i(587541),
        o = e.i(423517),
        u = e.i(257771);
    class c {
        getAllValuesForLayer(e) {
            var t;
            let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : o.DEFAULT_ROBLOX_PROJECT,
                n = arguments.length > 2 ? arguments[2] : void 0,
                a = {
                    url: `${i.default.apiGatewayUrl}/product-experimentation-platform/v1/projects/${r}/values`,
                    withCredentials: !0
                };
            return (t = {
                layers: {
                    [e]: n ?? {}
                }
            }, Promise.resolve().then(() => s.postUntyped(l.Url.parse(a.url).getOrThrow(), t, a.withCredentials ? {
                credentials: "include"
            } : {}).getOrThrow()).then(e => ({
                data: e
            }))).then(t => {
                if (t?.data) {
                    let a = t.data,
                        i = n ? c.getInputMetadataKey(e, n) : e;
                    return this.registerLayerMetadataAndGetParameters(a, e, i, r, void 0 !== n)
                }
                return Promise.reject()
            })
        }
        logLayerExposure(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : o.DEFAULT_ROBLOX_PROJECT,
                r = arguments.length > 2 ? arguments[2] : void 0,
                n = r ? c.getInputMetadataKey(e, r) : e;
            this.logLayerExposureForMetadataKey(e, n, t)
        }
        static getInputMetadataKey(e, t) {
            let r = Object.entries(t).sort((e, t) => {
                let [r] = e, [n] = t;
                return r.localeCompare(n)
            });
            return `${e}:${JSON.stringify(r)}`
        }
        registerLayerMetadataAndGetParameters(e, t, r, n) {
            let a = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                i = this.projectLayerMetadataMaps[n] ?? new Map;
            this.projectLayerMetadataMaps[n] = i;
            let s = e.layers[t];
            return s.experimentName ? i.set(r, e) : a && i.delete(r), s.parameters
        }
        logLayerExposureForMetadataKey(e, t, i) {
            let s = this.projectLayerMetadataMaps[i]?.get(t);
            if (s) {
                let t = (0, u.buildLayerExposureEvent)(s, e, (0, a.userId)() ?? 0, (0, r.getBrowserTrackerId)() || "0");
                (0, n.sendEventWithTarget)(o.EXPOSED_EVENT_NAME, o.EXPERIMENTATION_TARGET_NAME, t, n.targetTypes.WWW)
            }
        }
        constructor() {
            (0, t._)(this, "projectLayerMetadataMaps", void 0), this.projectLayerMetadataMaps = []
        }
    }
    let d = new c;
    e.s(["default", 0, d], 154286)
}]);

//# debugId=0c7797d9-638a-cbcf-b27b-86a458296f9c
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0rd_-ucga_81~.js.map
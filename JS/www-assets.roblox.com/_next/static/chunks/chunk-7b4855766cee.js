;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "4fc9addc-e290-5391-7ef0-3cef333e3275")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 274879, e => {
    "use strict";
    var t = e.i(371847);
    e.i(809804);
    var r = t.createContext(void 0);
    e.s(["useDirection", 0, function(e) {
        let i = t.useContext(r);
        return e || i || "ltr"
    }])
}, 654784, e => {
    "use strict";
    var t, r = e.i(376054),
        i = e.i(136927),
        n = e.i(550475),
        s = e.i(371847),
        o = e.i(734988),
        a = e.i(539181),
        l = e.i(56144),
        u = e.i(809804),
        d = new WeakMap;

    function c(e, t) {
        var r, i;
        let n, s, o;
        if ("at" in Array.prototype) return Array.prototype.at.call(e, t);
        let a = (r = e, i = t, n = r.length, (o = (s = h(i)) >= 0 ? s : n + s) < 0 || o >= n ? -1 : o);
        return -1 === a ? void 0 : e[a]
    }

    function h(e) {
        return e != e || 0 === e ? 0 : Math.trunc(e)
    }
    t = new WeakMap, (class e extends Map {
        set(e, i) {
            return d.get(this) && (this.has(e) ? (0, r._)(this, t)[(0, r._)(this, t).indexOf(e)] = e : (0, r._)(this, t).push(e)), super.set(e, i), this
        }
        insert(e, i, n) {
            let s, o = this.has(i),
                a = (0, r._)(this, t).length,
                l = h(e),
                u = l >= 0 ? l : a + l,
                d = u < 0 || u >= a ? -1 : u;
            if (d === this.size || o && d === this.size - 1 || -1 === d) return this.set(i, n), this;
            let c = this.size + +!o;
            l < 0 && u++;
            let E = [...(0, r._)(this, t)],
                f = !1;
            for (let e = u; e < c; e++)
                if (u === e) {
                    let t = E[e];
                    E[e] === i && (t = E[e + 1]), o && this.delete(i), s = this.get(t), this.set(i, n)
                } else {
                    f || E[e - 1] !== i || (f = !0);
                    let t = E[f ? e : e - 1],
                        r = s;
                    s = this.get(t), this.delete(t), this.set(t, r)
                } return this
        }
        with(t, r, i) {
            let n = new e(this);
            return n.insert(t, r, i), n
        }
        before(e) {
            let i = (0, r._)(this, t).indexOf(e) - 1;
            if (!(i < 0)) return this.entryAt(i)
        }
        setBefore(e, i, n) {
            let s = (0, r._)(this, t).indexOf(e);
            return -1 === s ? this : this.insert(s, i, n)
        }
        after(e) {
            let i = (0, r._)(this, t).indexOf(e);
            if (-1 !== (i = -1 === i || i === this.size - 1 ? -1 : i + 1)) return this.entryAt(i)
        }
        setAfter(e, i, n) {
            let s = (0, r._)(this, t).indexOf(e);
            return -1 === s ? this : this.insert(s + 1, i, n)
        }
        first() {
            return this.entryAt(0)
        }
        last() {
            return this.entryAt(-1)
        }
        clear() {
            return (0, n._)(this, t, []), super.clear()
        }
        delete(e) {
            let i = super.delete(e);
            return i && (0, r._)(this, t).splice((0, r._)(this, t).indexOf(e), 1), i
        }
        deleteAt(e) {
            let t = this.keyAt(e);
            return void 0 !== t && this.delete(t)
        }
        at(e) {
            let i = c((0, r._)(this, t), e);
            if (void 0 !== i) return this.get(i)
        }
        entryAt(e) {
            let i = c((0, r._)(this, t), e);
            if (void 0 !== i) return [i, this.get(i)]
        }
        indexOf(e) {
            return (0, r._)(this, t).indexOf(e)
        }
        keyAt(e) {
            return c((0, r._)(this, t), e)
        }
        from(e, t) {
            let r = this.indexOf(e);
            if (-1 === r) return;
            let i = r + t;
            return i < 0 && (i = 0), i >= this.size && (i = this.size - 1), this.at(i)
        }
        keyFrom(e, t) {
            let r = this.indexOf(e);
            if (-1 === r) return;
            let i = r + t;
            return i < 0 && (i = 0), i >= this.size && (i = this.size - 1), this.keyAt(i)
        }
        find(e, t) {
            let r = 0;
            for (let i of this) {
                if (Reflect.apply(e, t, [i, r, this])) return i;
                r++
            }
        }
        findIndex(e, t) {
            let r = 0;
            for (let i of this) {
                if (Reflect.apply(e, t, [i, r, this])) return r;
                r++
            }
            return -1
        }
        filter(t, r) {
            let i = [],
                n = 0;
            for (let e of this) Reflect.apply(t, r, [e, n, this]) && i.push(e), n++;
            return new e(i)
        }
        map(t, r) {
            let i = [],
                n = 0;
            for (let e of this) i.push([e[0], Reflect.apply(t, r, [e, n, this])]), n++;
            return new e(i)
        }
        reduce() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            let [i, n] = t, s = 0, o = n ?? this.at(0);
            for (let e of this) o = 0 === s && 1 === t.length ? e : Reflect.apply(i, this, [o, e, s, this]), s++;
            return o
        }
        reduceRight() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            let [i, n] = t, s = n ?? this.at(-1);
            for (let e = this.size - 1; e >= 0; e--) {
                let r = this.at(e);
                s = e === this.size - 1 && 1 === t.length ? r : Reflect.apply(i, this, [s, r, e, this])
            }
            return s
        }
        toSorted(t) {
            return new e([...this.entries()].sort(t))
        }
        toReversed() {
            let t = new e;
            for (let e = this.size - 1; e >= 0; e--) {
                let r = this.keyAt(e),
                    i = this.get(r);
                t.set(r, i)
            }
            return t
        }
        toSpliced() {
            for (var t = arguments.length, r = Array(t), i = 0; i < t; i++) r[i] = arguments[i];
            let n = [...this.entries()];
            return n.splice(...r), new e(n)
        }
        slice(t, r) {
            let i = new e,
                n = this.size - 1;
            if (void 0 === t) return i;
            t < 0 && (t += this.size), void 0 !== r && r > 0 && (n = r - 1);
            for (let e = t; e <= n; e++) {
                let t = this.keyAt(e),
                    r = this.get(t);
                i.set(t, r)
            }
            return i
        }
        every(e, t) {
            let r = 0;
            for (let i of this) {
                if (!Reflect.apply(e, t, [i, r, this])) return !1;
                r++
            }
            return !0
        }
        some(e, t) {
            let r = 0;
            for (let i of this) {
                if (Reflect.apply(e, t, [i, r, this])) return !0;
                r++
            }
            return !1
        }
        constructor(e) {
            super(e), (0, i._)(this, t, {
                writable: !0,
                value: void 0
            }), (0, n._)(this, t, [...super.keys()]), d.set(this, !0)
        }
    }), e.s(["createCollection", 0, function(e) {
        let t = e + "CollectionProvider",
            [r, i] = (0, o.createContextScope)(t),
            [n, d] = r(t, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            c = e => {
                let {
                    scope: t,
                    children: r
                } = e, i = s.default.useRef(null), o = s.default.useRef(new Map).current;
                return (0, u.jsx)(n, {
                    scope: t,
                    itemMap: o,
                    collectionRef: i,
                    children: r
                })
            };
        c.displayName = t;
        let h = e + "CollectionSlot",
            E = (0, l.createSlot)(h),
            f = s.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: i
                } = e, n = d(h, r), s = (0, a.useComposedRefs)(t, n.collectionRef);
                return (0, u.jsx)(E, {
                    ref: s,
                    children: i
                })
            });
        f.displayName = h;
        let m = e + "CollectionItemSlot",
            p = "data-radix-collection-item",
            g = (0, l.createSlot)(m),
            _ = s.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: i,
                    ...n
                } = e, o = s.default.useRef(null), l = (0, a.useComposedRefs)(t, o), c = d(m, r);
                return s.default.useEffect(() => (c.itemMap.set(o, {
                    ref: o,
                    ...n
                }), () => void c.itemMap.delete(o))), (0, u.jsx)(g, {
                    ...{
                        [p]: ""
                    },
                    ref: l,
                    children: i
                })
            });
        return _.displayName = m, [{
            Provider: c,
            Slot: f,
            ItemSlot: _
        }, function(t) {
            let r = d(e + "CollectionConsumer", t);
            return s.default.useCallback(() => {
                let e = r.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll(`[${p}]`));
                return Array.from(r.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [r.collectionRef, r.itemMap])
        }, i]
    }])
}, 206983, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(291967),
        i = e.i(654784),
        n = e.i(539181),
        s = e.i(734988),
        o = e.i(481010),
        a = e.i(743682),
        l = e.i(823499),
        u = e.i(118747),
        d = e.i(274879),
        c = e.i(809804),
        h = "rovingFocusGroup.onEntryFocus",
        E = {
            bubbles: !1,
            cancelable: !0
        },
        f = "RovingFocusGroup",
        [m, p, g] = (0, i.createCollection)(f),
        [_, v] = (0, s.createContextScope)(f, [g]),
        [w, S] = _(f),
        T = t.forwardRef((e, t) => (0, c.jsx)(m.Provider, {
            scope: e.__scopeRovingFocusGroup,
            children: (0, c.jsx)(m.Slot, {
                scope: e.__scopeRovingFocusGroup,
                children: (0, c.jsx)(U, {
                    ...e,
                    ref: t
                })
            })
        }));
    T.displayName = f;
    var U = t.forwardRef((e, i) => {
            let {
                __scopeRovingFocusGroup: s,
                orientation: o,
                loop: m = !1,
                dir: g,
                currentTabStopId: _,
                defaultCurrentTabStopId: v,
                onCurrentTabStopIdChange: S,
                onEntryFocus: T,
                preventScrollOnEntryFocus: U = !1,
                ...C
            } = e, P = t.useRef(null), R = (0, n.useComposedRefs)(i, P), A = (0, d.useDirection)(g), [x, I] = (0, u.useControllableState)({
                prop: _,
                defaultProp: v ?? null,
                onChange: S,
                caller: f
            }), [N, F] = t.useState(!1), O = (0, l.useCallbackRef)(T), G = p(s), b = t.useRef(!1), [M, L] = t.useState(0);
            return t.useEffect(() => {
                let e = P.current;
                if (e) return e.addEventListener(h, O), () => e.removeEventListener(h, O)
            }, [O]), (0, c.jsx)(w, {
                scope: s,
                orientation: o,
                dir: A,
                loop: m,
                currentTabStopId: x,
                onItemFocus: t.useCallback(e => I(e), [I]),
                onItemShiftTab: t.useCallback(() => F(!0), []),
                onFocusableItemAdd: t.useCallback(() => L(e => e + 1), []),
                onFocusableItemRemove: t.useCallback(() => L(e => e - 1), []),
                children: (0, c.jsx)(a.Primitive.div, {
                    tabIndex: N || 0 === M ? -1 : 0,
                    "data-orientation": o,
                    ...C,
                    ref: R,
                    style: {
                        outline: "none",
                        ...e.style
                    },
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, () => {
                        b.current = !0
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, e => {
                        let t = !b.current;
                        if (e.target === e.currentTarget && t && !N) {
                            let t = new CustomEvent(h, E);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = G().filter(e => e.focusable);
                                y([e.find(e => e.active), e.find(e => e.id === x), ...e].filter(Boolean).map(e => e.ref.current), U)
                            }
                        }
                        b.current = !1
                    }),
                    onBlur: (0, r.composeEventHandlers)(e.onBlur, () => F(!1))
                })
            })
        }),
        C = "RovingFocusGroupItem",
        P = t.forwardRef((e, i) => {
            let {
                __scopeRovingFocusGroup: n,
                focusable: s = !0,
                active: l = !1,
                tabStopId: u,
                children: d,
                ...h
            } = e, E = (0, o.useId)(), f = u || E, g = S(C, n), _ = g.currentTabStopId === f, v = p(n), {
                onFocusableItemAdd: w,
                onFocusableItemRemove: T,
                currentTabStopId: U
            } = g;
            return t.useEffect(() => {
                if (s) return w(), () => T()
            }, [s, w, T]), (0, c.jsx)(m.ItemSlot, {
                scope: n,
                id: f,
                focusable: s,
                active: l,
                children: (0, c.jsx)(a.Primitive.span, {
                    tabIndex: _ ? 0 : -1,
                    "data-orientation": g.orientation,
                    ...h,
                    ref: i,
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, e => {
                        s ? g.onItemFocus(f) : e.preventDefault()
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, () => g.onItemFocus(f)),
                    onKeyDown: (0, r.composeEventHandlers)(e.onKeyDown, e => {
                        if ("Tab" === e.key && e.shiftKey) return void g.onItemShiftTab();
                        if (e.target !== e.currentTarget) return;
                        let t = function(e, t, r) {
                            var i;
                            let n = (i = e.key, "rtl" !== r ? i : "ArrowLeft" === i ? "ArrowRight" : "ArrowRight" === i ? "ArrowLeft" : i);
                            if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(n)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(n))) return R[n]
                        }(e, g.orientation, g.dir);
                        if (void 0 !== t) {
                            if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                            e.preventDefault();
                            let n = v().filter(e => e.focusable).map(e => e.ref.current);
                            if ("last" === t) n.reverse();
                            else if ("prev" === t || "next" === t) {
                                var r, i;
                                "prev" === t && n.reverse();
                                let s = n.indexOf(e.currentTarget);
                                n = g.loop ? (r = n, i = s + 1, r.map((e, t) => r[(i + t) % r.length])) : n.slice(s + 1)
                            }
                            setTimeout(() => y(n))
                        }
                    }),
                    children: "function" == typeof d ? d({
                        isCurrentTabStop: _,
                        hasTabStop: null != U
                    }) : d
                })
            })
        });
    P.displayName = C;
    var R = {
        ArrowLeft: "prev",
        ArrowUp: "prev",
        ArrowRight: "next",
        ArrowDown: "next",
        PageUp: "first",
        Home: "first",
        PageDown: "last",
        End: "last"
    };

    function y(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            r = document.activeElement;
        for (let i of e)
            if (i === r || (i.focus({
                    preventScroll: t
                }), document.activeElement !== r)) return
    }
    e.s(["Item", 0, P, "Root", 0, T, "createRovingFocusGroupScope", 0, v])
}, 564035, e => {
    "use strict";
    e.s(["assetUrl", 0, e => "string" == typeof e ? e : e.src])
}, 500154, e => {
    "use strict";
    e.s(["createTrackers", 0, function(e, t) {
        let {
            publish: r,
            captureException: i,
            featureName: n
        } = t;

        function s(e, t, r) {
            if (null != r) {
                let s = r instanceof Error ? r.name || "Error" : "UnknownError",
                    o = n ? `${n}_${e}` : e;
                return i?.(r, {
                    error_counter: o
                }), {
                    ...t,
                    errorType: s
                }
            }
            return t
        }
        return {
            trackCounter() {
                for (var e = arguments.length, t = Array(e), i = 0; i < e; i++) t[i] = arguments[i];
                let [n, s] = t;
                r(n, s)
            },
            trackError() {
                for (var e = arguments.length, t = Array(e), i = 0; i < e; i++) t[i] = arguments[i];
                let [n, o, a] = t, l = s(n, {
                    ...o ?? {},
                    severity: "error"
                }, a);
                r(n, l)
            },
            trackCriticalError() {
                for (var e = arguments.length, t = Array(e), i = 0; i < e; i++) t[i] = arguments[i];
                let [n, o, a] = t, l = s(n, {
                    ...o ?? {},
                    severity: "critical"
                }, a);
                r(n, l)
            }
        }
    }])
}, 291967, e => {
    "use strict";
    "u" > typeof window && window.document && window.document.createElement, e.s(["composeEventHandlers", 0, function(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(i) {
            if (e?.(i), !1 === r || !i.defaultPrevented) return t?.(i)
        }
    }])
}, 118747, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(13522);
    t[" useEffectEvent ".trim().toString()], t[" useInsertionEffect ".trim().toString()];
    var i = t[" useInsertionEffect ".trim().toString()] || r.useLayoutEffect;
    Symbol("RADIX:SYNC_STATE"), e.s(["useControllableState", 0, function(e) {
        let {
            prop: r,
            defaultProp: n,
            onChange: s = () => {},
            caller: o
        } = e, [a, l, u] = function(e) {
            let {
                defaultProp: r,
                onChange: n
            } = e, [s, o] = t.useState(r), a = t.useRef(s), l = t.useRef(n);
            return i(() => {
                l.current = n
            }, [n]), t.useEffect(() => {
                a.current !== s && (l.current?.(s), a.current = s)
            }, [s, a]), [s, o, l]
        }({
            defaultProp: n,
            onChange: s
        }), d = void 0 !== r, c = d ? r : a;
        {
            let e = t.useRef(void 0 !== r);
            t.useEffect(() => {
                let t = e.current;
                if (t !== d) {
                    let e = d ? "controlled" : "uncontrolled";
                    console.warn(`${o} is changing from ${t?"controlled":"uncontrolled"} to ${e}. Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component.`)
                }
                e.current = d
            }, [d, o])
        }
        return [c, t.useCallback(e => {
            if (d) {
                let t = "function" == typeof e ? e(r) : e;
                t !== r && u.current?.(t)
            } else l(e)
        }, [d, r, l, u])]
    }], 118747)
}, 183901, e => {
    "use strict";
    var t = e.i(371847);
    e.s(["usePrevious", 0, function(e) {
        let r = t.useRef({
            value: e,
            previous: e
        });
        return t.useMemo(() => (r.current.value !== e && (r.current.previous = r.current.value, r.current.value = e), r.current.previous), [e])
    }])
}, 189192, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(13522);
    e.s(["useSize", 0, function(e) {
        let [i, n] = t.useState(void 0);
        return (0, r.useLayoutEffect)(() => {
            if (e) {
                n({
                    width: e.offsetWidth,
                    height: e.offsetHeight
                });
                let t = new ResizeObserver(t => {
                    let r, i;
                    if (!Array.isArray(t) || !t.length) return;
                    let s = t[0];
                    if ("borderBoxSize" in s) {
                        let e = s.borderBoxSize,
                            t = Array.isArray(e) ? e[0] : e;
                        r = t.inlineSize, i = t.blockSize
                    } else r = e.offsetWidth, i = e.offsetHeight;
                    n({
                        width: r,
                        height: i
                    })
                });
                return t.observe(e, {
                    box: "border-box"
                }), () => t.unobserve(e)
            }
            n(void 0)
        }, [e]), i
    }])
}, 411425, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(371847);
    let i = {
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
        n = r.default.forwardRef((e, n) => {
            let {
                className: s,
                size: o = "Large",
                variant: a = "Determinate",
                value: l = 0,
                showValue: u = !1,
                ariaLabel: d,
                ...c
            } = e, {
                dimension: h,
                strokeWidth: E,
                textClass: f,
                valueContainerSize: m
            } = i[o], p = (h - E) / 2, g = 2 * Math.PI * p, _ = h / 2, v = Math.min(100, Math.max(0, l)), w = u && void 0 !== m ? m : h, S = "Determinate" === a;
            return r.default.createElement("div", {
                ref: n,
                className: (0, t.default)("foundation-web-progress-circle inline-flex items-center justify-center", s),
                role: "progressbar",
                "aria-label": d,
                "aria-valuemin": S ? 0 : void 0,
                "aria-valuemax": S ? 100 : void 0,
                "aria-valuenow": S ? v : void 0,
                style: {
                    width: w,
                    height: w
                },
                ...c
            }, r.default.createElement("svg", {
                width: h,
                height: h,
                viewBox: `0 0 ${h} ${h}`,
                className: "relative"
            }, r.default.createElement("circle", {
                cx: _,
                cy: _,
                r: p,
                fill: "none",
                strokeWidth: E,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), r.default.createElement("circle", {
                cx: _,
                cy: _,
                r: p,
                fill: "none",
                strokeWidth: E,
                strokeDasharray: S ? g : `${.75*g} ${.25*g}`,
                strokeDashoffset: S ? g * (1 - v / 100) : 0,
                strokeLinecap: "round",
                className: (0, t.default)(!S && "foundation-web-progress-circle-indeterminate"),
                style: S ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), S && u && "Large" === o && r.default.createElement("div", {
                className: (0, t.default)("absolute content-emphasis flex items-center justify-center", f),
                "aria-hidden": "true"
            }, r.default.createElement("span", null, Math.round(v)), r.default.createElement("span", null, "%")))
        });
    n.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, n])
}, 659209, e => {
    "use strict";
    var t = e.i(491965),
        r = e.i(7284),
        i = e.i(371847);
    let n = {
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
        s = {
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
        o = {
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
        a = {
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
        l = {
            Small: "height-600",
            XSmall: "height-400"
        },
        u = {
            Small: "padding-x-small",
            XSmall: "padding-x-xsmall"
        },
        d = {
            Small: "width-600",
            XSmall: "width-400"
        },
        c = {
            Small: "text-label-small",
            XSmall: "text-caption-small"
        },
        h = {
            Small: "padding-y-xsmall",
            XSmall: "padding-y-none"
        },
        E = {
            Small: "XSmall",
            XSmall: "XSmall"
        },
        f = {
            Pill: "radius-circle",
            Box: "radius-small"
        },
        m = i.default.forwardRef((e, m) => {
            let {
                className: p,
                label: g,
                variant: _ = "Standard",
                icon: v,
                iconPosition: w = "Leading",
                size: S = "Small",
                shape: T = "Pill",
                ...U
            } = e, C = v && !g, P = "padding-x-xxsmall";
            v && (P = "Leading" === w ? "padding-right-xxsmall" : "padding-left-xxsmall");
            let R = v && i.default.createElement(t.Icon, {
                name: v,
                size: E[S],
                className: o[_]
            });
            return i.default.createElement("div", {
                ref: m,
                ...U,
                className: (0, r.default)("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", f[T], l[S], C ? [d[S], "justify-center"] : ["width-[fit-content]", u[S]], n[_], s[_], a[_], p)
            }, "Leading" === w && R, g && i.default.createElement("span", {
                className: (0, r.default)("text-no-wrap text-truncate-split", c[S], h[S], P, s[_])
            }, g), "Trailing" === w && R)
        });
    m.displayName = "Badge", e.s(["Badge", 0, m])
}, 144674, 248951, e => {
    "use strict";
    var t = e.i(868275),
        r = e.i(357355),
        i = e.i(932598),
        n = e.i(341332),
        s = e.i(245837),
        o = e.i(621899),
        a = e.i(545819),
        l = e.i(682259),
        u = e.i(951605);
    let d = () => null != r.window && null != r.document,
        c = () => ({
            domain: `.${s.default.domain}`,
            maxAge: u.COOKIE_TIMESPAN
        });
    class h {
        save() {
            if (!d()) return;
            let e = `${this.purchaseFlowUuid??""},${this.triggeringContext??""}`,
                {
                    domain: t,
                    maxAge: r
                } = c();
            (0, a.set)(u.COOKIE_NAME, e, {
                domain: t,
                maxAge: r
            })
        }
        static stop() {
            if (!d()) return;
            let {
                domain: e
            } = c();
            (0, a.delete)(u.COOKIE_NAME, {
                domain: e
            })
        }
        static loadFromCookie() {
            if (!d()) return null;
            let e = (0, a.get)(u.COOKIE_NAME);
            if (null == e || "" === e.value) return null;
            let [t, r] = e.value.split(",");
            return new h("" === t ? void 0 : t, null != r && (0, l.isStringEnum)(u.TRIGGERING_CONTEXT, r) ? r : void 0)
        }
        constructor(e, r) {
            (0, t._)(this, "purchaseFlowUuid", void 0), (0, t._)(this, "triggeringContext", void 0), this.purchaseFlowUuid = e, this.triggeringContext = r
        }
    }
    var E = e.i(500154),
        f = e.i(333982);
    let m = (e, t) => {
        r.window?.Sentry?.captureException(e, t ? {
            tags: t
        } : void 0)
    };
    e.s(["captureException", 0, m], 248951);
    let p = {
            featureName: "PaymentsFlowAnalytics",
            team: "Economy > Payments & Fraud",
            features: {
                PaymentFlow: {
                    counters: ["UserPaymentFlowMidPurchaseStepTriggeredWithoutCtx", "UserPaymentFlowFlowEnded", {
                        name: "UserPaymentFlowEventSent",
                        dimensions: ["transport", "requestedTransport", "eventName"]
                    }, {
                        name: "UserPaymentFlowEventFetchFailed",
                        dimensions: ["eventName", "viewName", "platform", "visibility", "elapsed"]
                    }, {
                        name: "UserPaymentFlowEventImgFailed",
                        dimensions: ["eventName", "viewName", "platform", "visibility", "elapsed"]
                    }],
                    errors: ["UserPaymentFlowWrongUsageOfMethod", "UserPaymentFlowSendEventWithoutUuidOrCtx", "UserPaymentFlowLoadPreExistingCtxError", "UserPaymentFlowSendStatusEventError", "UserPaymentFlowSendUserEventError", "UserPaymentFlowStartFlowError", "UserPaymentFlowFlowEndedWithoutTriggerContext", "UserPaymentFlowSendEventKeepaliveError"]
                }
            }
        },
        g = (0, f.createFireTelemetryCounter)(p.featureName),
        {
            trackCounter: _,
            trackError: v
        } = (0, E.createTrackers)(p, {
            publish: g,
            captureException: m,
            featureName: p.featureName
        }),
        w = "__rbxPaymentsFlowListenersAttached",
        S = e => {
            let {
                currentTarget: t
            } = e;
            return null != t && "innerText" in t && "string" == typeof t.innerText ? t.innerText : ""
        },
        T = function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            for (let e of t)
                if (null != e && "" !== e) return e;
            return ""
        },
        U = "__rbxPaymentsFlowUuid",
        C = [{
            web: u.TRIGGERING_CONTEXT.WEB_ROBUX_PURCHASE,
            webview: u.TRIGGERING_CONTEXT.WEBVIEW_ROBUX_PURCHASE,
            mobileWeb: u.TRIGGERING_CONTEXT.MOBILE_WEB_ROBUX_PURCHASE
        }, {
            web: u.TRIGGERING_CONTEXT.WEB_PREMIUM_PURCHASE,
            webview: u.TRIGGERING_CONTEXT.WEBVIEW_PREMIUM_PURCHASE,
            mobileWeb: u.TRIGGERING_CONTEXT.MOBILE_WEB_PREMIUM_PURCHASE
        }, {
            web: u.TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE,
            webview: u.TRIGGERING_CONTEXT.WEBVIEW_ROBLOX_PLUS_PURCHASE,
            mobileWeb: u.TRIGGERING_CONTEXT.MOBILE_WEB_ROBLOX_PLUS_PURCHASE
        }],
        P = new o.Tracker(new o.Configuration({
            baseUrl: `https://ecsv2.${s.default.domain}/www`
        })),
        R = () => "function" == typeof r.window?.fetch,
        y = (e, t, i, n, s) => {
            var o;
            _(e, {
                eventName: t,
                viewName: i,
                platform: n,
                visibility: r.document?.visibilityState ?? "unknown",
                elapsed: (o = Date.now() - s) < 100 ? "lt100ms" : o < 1e3 ? "lt1s" : o < 1e4 ? "lt10s" : "gte10s"
            })
        };
    class A {
        loadOrStartPaymentFlow() {
            if (null != r.window) try {
                if (this.purchaseFlowUuid || this.tryLoadPreExistingCtx(), this.purchaseFlowUuid || this.adoptSharedFlowUuid(), !this.purchaseFlowUuid) {
                    let e = A.getUrlAnalyticId();
                    this.purchaseFlowUuid = e ?? (0, i.generateRandomUuid)(), this.writePaymentFlowContextIntoCookie()
                }
                this.publishSharedFlowUuid()
            } catch (e) {
                v("UserPaymentFlowStartFlowError", null, e)
            }
        }
        getPaymentFlowUuid() {
            return this.adoptSharedFlowUuid(), this.purchaseFlowUuid
        }
        setPaymentFlowUuid(e) {
            this.purchaseFlowUuid = e, this.publishSharedFlowUuid(), this.writePaymentFlowContextIntoCookie()
        }
        setWebStack(e) {
            d() && (this.webStack = e)
        }
        startRobuxUpsellFlow(e) {
            let {
                assetType: t,
                isReseller: r = !1,
                itemId: i = ""
            } = e;
            this.eventMetadata.item_type = t, this.eventMetadata.item_id = i, t === u.ASSET_TYPE.GAME_PASS ? this.triggerContext = u.TRIGGERING_CONTEXT.WEB_GAME_PASS_ROBUX_UPSELL : t === u.ASSET_TYPE.DEVELOPER_PRODUCT ? this.triggerContext = u.TRIGGERING_CONTEXT.WEB_DEVELOPER_PRODUCT_ROBUX_UPSELL : t === u.ASSET_TYPE.PLACE ? this.triggerContext = u.TRIGGERING_CONTEXT.WEB_PAID_GAME_ROBUX_UPSELL : t === u.ASSET_TYPE.PRIVATE_SERVER ? this.triggerContext = u.TRIGGERING_CONTEXT.WEB_PRIVATE_SERVER_ROBUX_UPSELL : t === u.ASSET_TYPE.BUNDLE || t === u.ASSET_TYPE.PACKAGE ? this.triggerContext = u.TRIGGERING_CONTEXT.WEB_CATALOG_BUNDLE_ITEM_ROBUX_UPSELL : r ? this.triggerContext = u.TRIGGERING_CONTEXT.WEB_CATALOG_COLLECTIVE_ITEM_ROBUX_UPSELL : this.triggerContext = u.TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, this.writePaymentFlowContextIntoCookie()
        }
        startRobloxPlusUpsellFlow(e) {
            let {
                assetType: t,
                isReseller: r = !1,
                itemId: i = ""
            } = e;
            if (this.eventMetadata.item_type = t, this.eventMetadata.item_id = i, r) this.triggerContext = u.TRIGGERING_CONTEXT.WEB_CATALOG_RESALE_ITEM_PLUS_UPSELL;
            else switch (t) {
                case u.ASSET_TYPE.GAME_PASS:
                    this.triggerContext = u.TRIGGERING_CONTEXT.WEB_GAME_PASS_PLUS_UPSELL;
                    break;
                case u.ASSET_TYPE.DEVELOPER_PRODUCT:
                    this.triggerContext = u.TRIGGERING_CONTEXT.WEB_DEVELOPER_PRODUCT_PLUS_UPSELL;
                    break;
                case u.ASSET_TYPE.PRIVATE_SERVER:
                    this.triggerContext = u.TRIGGERING_CONTEXT.WEB_PRIVATE_SERVER_PLUS_UPSELL;
                    break;
                case u.ASSET_TYPE.BUNDLE:
                case u.ASSET_TYPE.PACKAGE:
                    this.triggerContext = u.TRIGGERING_CONTEXT.WEB_CATALOG_BUNDLE_ITEM_PLUS_UPSELL;
                    break;
                case u.ASSET_TYPE.SUBSCRIPTION:
                    this.triggerContext = u.TRIGGERING_CONTEXT.WEB_DEVELOPER_SUBSCRIPTION_PLUS_UPSELL;
                    break;
                default:
                    this.triggerContext = u.TRIGGERING_CONTEXT.WEB_CATALOG_SINGLE_ITEM_PLUS_UPSELL
            }
            this.writePaymentFlowContextIntoCookie()
        }
        sendUserPurchaseFlowEvent(e) {
            this.sendFlowEvent(e, "img")
        }
        sendUserPurchaseFlowEventViaFetch(e) {
            this.sendFlowEvent(e, "fetch")
        }
        sendFlowEvent(e, t) {
            let {
                triggerContext: r,
                isMidPurchaseStep: i,
                viewName: n,
                purchaseEventType: s,
                viewMessage: o,
                eventMetadata: a = {},
                isTerminalView: l = !1
            } = e;
            if (d()) try {
                let e = A.reclassifyPlatformTriggeringContext({
                    triggerContext: r
                });
                if (this.eventMetadata = {
                        ...this.eventMetadata,
                        ...a
                    }, !n && !s && !o) return void v("UserPaymentFlowWrongUsageOfMethod");
                this.adoptSharedTriggerContext(), !this.triggerContext && (this.triggerContext = e, this.writePaymentFlowContextIntoCookie(), i && _("UserPaymentFlowMidPurchaseStepTriggeredWithoutCtx")), this.sendEvent({
                    eventName: u.EVENT_NAME.USER_PURCHASE_FLOW,
                    viewName: n,
                    purchaseEventType: s,
                    viewMessage: o
                }, t), l && this.handleTerminalPage(t)
            } catch (e) {
                v("UserPaymentFlowSendUserEventError", null, e)
            }
        }
        sendUserPurchaseStatusEvent(e) {
            this.sendStatusEvent(e, "img")
        }
        sendUserPurchaseStatusEventViaFetch(e) {
            this.sendStatusEvent(e, "fetch")
        }
        sendStatusEvent(e, t) {
            let {
                triggerContext: r,
                status: i,
                viewMessage: n,
                viewName: s
            } = e;
            if (d()) try {
                let e = A.reclassifyPlatformTriggeringContext({
                    triggerContext: r
                });
                if (!i && !n && !s) return void v("UserPaymentFlowWrongUsageOfMethod");
                this.adoptSharedTriggerContext(), this.triggerContext || (this.triggerContext = e, this.writePaymentFlowContextIntoCookie()), this.sendEvent({
                    eventName: u.EVENT_NAME.USER_PURCHASE_STATUS,
                    viewName: s,
                    viewMessage: n,
                    status: i
                }, t), A.isTerminalView(s) && this.handleTerminalPage(t)
            } catch (e) {
                v("UserPaymentFlowSendStatusEventError", null, e)
            }
        }
        adoptSharedTriggerContext() {
            if (this.triggerContext) return;
            this.adoptSharedFlowUuid();
            let e = h.loadFromCookie();
            e?.triggeringContext != null && e.purchaseFlowUuid === this.purchaseFlowUuid && (this.triggerContext = e.triggeringContext)
        }
        adoptSharedFlowUuid() {
            let e = r.window;
            if (null == e || !(U in e)) return;
            let t = e[U];
            "string" == typeof t && "" !== t && (this.purchaseFlowUuid = t)
        }
        publishSharedFlowUuid() {
            let e = r.window;
            null != e && this.purchaseFlowUuid && Object.assign(e, {
                [U]: this.purchaseFlowUuid
            })
        }
        writePaymentFlowContextIntoCookie() {
            this.adoptSharedFlowUuid(), new h(this.purchaseFlowUuid, this.triggerContext).save()
        }
        sendEvent(e, t) {
            var i;
            let s, o, a, l, u, {
                eventName: d,
                viewName: c,
                purchaseEventType: h,
                viewMessage: E,
                status: f
            } = e;
            if (this.adoptSharedFlowUuid(), !this.purchaseFlowUuid || !this.triggerContext) return void v("UserPaymentFlowSendEventWithoutUuidOrCtx");
            let m = r.window;
            if (null == m) return;
            let p = A.getReferralUrl(),
                g = A.extractView(p),
                w = A.extractView(m.location.href),
                S = "fetch" === t && R() ? "fetch" : "img",
                T = JSON.stringify({
                    ...this.eventMetadata,
                    ...void 0 === this.webStack ? {} : {
                        webStack: this.webStack
                    },
                    eventTransport: S
                });
            i = {
                target: "www",
                localTime: new Date,
                eventType: d,
                context: this.triggerContext,
                additionalProperties: {
                    purchase_flow_uuid: this.purchaseFlowUuid,
                    view_name: c,
                    purchase_event_type: h,
                    view_message: E,
                    status: f,
                    refurl: p.substring(0, 200),
                    prev_view_path: g,
                    current_view_path: w,
                    event_metadata: T
                }
            }, s = (0, n.getDeviceMeta)(), o = s?.isIosApp ? "iosApp" : s?.isAndroidApp ? "androidApp" : [s?.isInApp, s?.isAmazonApp, s?.isUWPApp, s?.isXboxApp, s?.isWin32App, s?.isUniversalApp, s?.isSamsungGalaxyStoreApp, s?.isPcGdkApp, s?.isStudio].some(e => !0 === e) ? "otherApp" : "browser", a = c ?? "", _("UserPaymentFlowEventSent", {
                transport: l = "fetch" === t && R() ? "fetch" : "img",
                requestedTransport: t,
                eventName: d
            }), u = Date.now(), "img" === l ? P.sendEventViaImg(i, e => {
                e || y("UserPaymentFlowEventImgFailed", d, a, o, u)
            }) : P.sendEventViaFetch(i, e => {
                e || y("UserPaymentFlowEventFetchFailed", d, a, o, u)
            }).catch(e => {
                v("UserPaymentFlowSendEventKeepaliveError", null, e)
            })
        }
        tryLoadPreExistingCtx() {
            let e = r.document,
                t = r.window;
            if (null != e && null != t) try {
                let {
                    referrer: r
                } = e, i = r && new URL(r).hostname.endsWith(s.default.domain), n = t.performance.getEntriesByType("navigation")[0], o = (e => {
                    if (null != e && "type" in e && "string" == typeof e.type) return e.type
                })(n);
                if (!i && "back_forward" !== o && "reload" !== o) return;
                let a = h.loadFromCookie();
                a && (a.purchaseFlowUuid && (this.purchaseFlowUuid = a.purchaseFlowUuid), a.triggeringContext && (this.triggerContext = a.triggeringContext))
            } catch (e) {
                v("UserPaymentFlowLoadPreExistingCtxError", null, e)
            }
        }
        static extractView(e) {
            if (!e) return "";
            let t = new URL(e);
            return t.hostname.endsWith(`.${s.default.domain}`) ? t.pathname : "External"
        }
        handleTerminalPage(e) {
            if (this.purchaseFlowUuid) {
                if (!this.triggerContext) return void v("UserPaymentFlowFlowEndedWithoutTriggerContext");
                h.stop(), this.sendStatusEvent({
                    triggerContext: this.triggerContext,
                    status: u.PURCHASE_STATUS.PAYMENT_FLOW_ENDED
                }, e), _("UserPaymentFlowFlowEnded")
            }
        }
        static isTerminalView(e) {
            return e === u.VIEW_NAME.CHECKOUT_SUCCESS
        }
        static getReferralUrl() {
            let e = r.document,
                t = r.window;
            if (null == e) return "";
            try {
                return T(e.referrer, t?.frames.top?.document.referrer)
            } catch {
                return e.referrer
            }
        }
        static getUrlAnalyticId() {
            let e = r.window;
            return null == e ? null : new URLSearchParams(e.location.search).get("analyticId")
        }
        static reclassifyPlatformTriggeringContext(e) {
            let {
                triggerContext: t
            } = e, r = (0, n.getDeviceMeta)(), i = [r?.isAmazonApp, r?.isUWPApp, r?.isIosApp, r?.isAndroidApp].some(e => !0 === e);
            for (let {
                    web: e,
                    webview: r,
                    mobileWeb: n
                }
                of C) {
                if (t === e || t === r) return i ? r : e;
                if (t === n) return i ? r : n
            }
            return t
        }
        constructor() {
            if ((0, t._)(this, "purchaseFlowUuid", ""), (0, t._)(this, "triggerContext", void 0), (0, t._)(this, "ENUM_TRIGGERING_CONTEXT", u.TRIGGERING_CONTEXT), (0, t._)(this, "ENUM_VIEW_NAME", u.VIEW_NAME), (0, t._)(this, "ENUM_PURCHASE_EVENT_TYPE", u.PURCHASE_EVENT_TYPE), (0, t._)(this, "ENUM_VIEW_MESSAGE", u.VIEW_MESSAGE), (0, t._)(this, "ENUM_PURCHASE_STATUS", u.PURCHASE_STATUS), (0, t._)(this, "ENUM_CUSTOM_EVENT", u.CUSTOM_EVENT), (0, t._)(this, "eventMetadata", {}), (0, t._)(this, "webStack", void 0), !d()) return;
            this.loadOrStartPaymentFlow()
        }
    }
    let x = new A;
    (e => {
        let t, i = r.document;
        if (null == i || null != (t = r.window) && (!0 === Reflect.get(t, w) || (Object.assign(t, {
                [w]: !0
            }), 0))) return;
        let n = () => {
            r.document?.querySelector("#header li a.robux-menu-btn")?.addEventListener("click", t => {
                e.sendUserPurchaseFlowEvent({
                    triggerContext: u.TRIGGERING_CONTEXT.WEB_ROBUX_PURCHASE,
                    isMidPurchaseStep: !1,
                    viewName: u.VIEW_NAME.NAVIGATION_MENU,
                    purchaseEventType: u.PURCHASE_EVENT_TYPE.USER_INPUT,
                    viewMessage: S(t)
                })
            }), r.document?.getElementById("display-price-container") == null && (r.document?.querySelector("#item-details #upgrade-button")?.addEventListener("click", () => {
                e.sendUserPurchaseFlowEvent({
                    triggerContext: u.TRIGGERING_CONTEXT.WEB_PREMIUM_PURCHASE,
                    isMidPurchaseStep: !1,
                    viewName: u.VIEW_NAME.PREMIUM_UPSELL,
                    purchaseEventType: u.PURCHASE_EVENT_TYPE.USER_INPUT,
                    viewMessage: u.VIEW_MESSAGE.GET_PREMIUM
                })
            }), r.document?.querySelector("#item-details .premium-prompt a")?.addEventListener("click", t => {
                e.sendUserPurchaseFlowEvent({
                    triggerContext: u.TRIGGERING_CONTEXT.WEB_PREMIUM_PURCHASE,
                    isMidPurchaseStep: !1,
                    viewName: u.VIEW_NAME.PREMIUM_UPSELL,
                    purchaseEventType: u.PURCHASE_EVENT_TYPE.USER_INPUT,
                    viewMessage: S(t)
                })
            }))
        };
        "loading" === i.readyState ? i.addEventListener("DOMContentLoaded", n) : n()
    })(x), e.s(["paymentFlowAnalyticsService", 0, x], 144674)
}, 380688, e => {
    "use strict";
    var t = e.i(809804),
        r = e.i(371847);
    let i = "__FN_nvfToKPAOuiV__",
        n = RegExp(`${i}(\\d+)\\|`);
    e.s(["translateHtml", 0, (e, s, o, a) => {
        let l = {
                ...a
            },
            u = {};
        o?.forEach((e, t) => {
            let r = t.toString(),
                n = `${i}${r}|`,
                s = `__FN_END_nvfToKPAOuiV__${r}|`;
            l[e.opening] = n, l[e.closing] = s, u[r] = {
                start: n,
                end: s,
                render: e.render,
                used: !1
            }
        });
        let d = e(s, l),
            c = e => {
                let t = [],
                    r = n.exec(e);
                if (!r) return [e];
                r.index > 0 && t.push(e.slice(0, r.index));
                let i = r[1] && u[r[1]];
                if (!i) return console.warn("Unexpected malformed segment", s), [];
                i.used = !0;
                let o = e.indexOf(i.end);
                if (-1 === o) return console.warn("Unexpected malformed segment", s), [];
                let a = e.slice(r.index + r[0].length, o),
                    l = i.render(c(a));
                Array.isArray(l) ? t.push(...l) : t.push(l);
                let d = e.slice(o + i.end.length);
                return d.length > 0 && t.push(...c(d)), t
            },
            h = c(d).filter(e => "" !== e);
        return Object.values(u).some(e => !e.used) ? (console.warn("Unused segments found", s), []) : h.map((e, i) => (0, t.jsx)(r.Fragment, {
            children: e
        }, i))
    }], 380688)
}]);

//# debugId=4fc9addc-e290-5391-7ef0-3cef333e3275
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0_vzzdkhmw27v.js.map
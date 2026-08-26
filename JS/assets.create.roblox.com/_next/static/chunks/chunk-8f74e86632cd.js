;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "ccb79269-048c-5aaa-aab0-702727b00559")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 305607, e => {
    "use strict";
    e.s(["clamp", 0, function(e, t) {
        let [r, l] = t;
        return Math.min(l, Math.max(r, e))
    }])
}, 174617, e => {
    "use strict";
    "u" > typeof window && window.document && window.document.createElement, e.s(["composeEventHandlers", 0, function(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(l) {
            if (null == e || e(l), !1 === r || !l.defaultPrevented) return null == t ? void 0 : t(l)
        }
    }])
}, 508785, e => {
    "use strict";
    e.i(711300), e.i(634203), e.i(35877);
    var t = e.i(416340),
        r = e.i(608652),
        l = e.i(78892),
        n = e.i(76992),
        o = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let a = e + "CollectionProvider",
            [i, s] = (0, r.createContextScope)(a),
            [u, d] = i(a, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            c = e => {
                let {
                    scope: r,
                    children: l
                } = e, n = t.default.useRef(null), a = t.default.useRef(new Map).current;
                return (0, o.jsx)(u, {
                    scope: r,
                    itemMap: a,
                    collectionRef: n,
                    children: l
                })
            };
        c.displayName = a;
        let f = e + "CollectionSlot",
            p = (0, n.createSlot)(f),
            m = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: n
                } = e, a = d(f, r), i = (0, l.useComposedRefs)(t, a.collectionRef);
                return (0, o.jsx)(p, {
                    ref: i,
                    children: n
                })
            });
        m.displayName = f;
        let v = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, n.createSlot)(v),
            x = t.default.forwardRef((e, r) => {
                let {
                    scope: n,
                    children: a,
                    ...i
                } = e, s = t.default.useRef(null), u = (0, l.useComposedRefs)(r, s), c = d(v, n);
                return t.default.useEffect(() => (c.itemMap.set(s, {
                    ref: s,
                    ...i
                }), () => void c.itemMap.delete(s))), (0, o.jsx)(g, {
                    ...{
                        [h]: ""
                    },
                    ref: u,
                    children: a
                })
            });
        return x.displayName = v, [{
            Provider: c,
            Slot: m,
            ItemSlot: x
        }, function(r) {
            let l = d(e + "CollectionConsumer", r);
            return t.default.useCallback(() => {
                let e = l.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                return Array.from(l.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [l.collectionRef, l.itemMap])
        }, s]
    }])
}, 974539, e => {
    "use strict";
    var t = e.i(416340);
    e.i(221628);
    var r = t.createContext(void 0);
    e.s(["useDirection", 0, function(e) {
        let l = t.useContext(r);
        return e || l || "ltr"
    }])
}, 524887, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(297452),
        l = e.i(992486),
        n = e.i(594278),
        o = e.i(221628),
        a = t.forwardRef((e, t) => {
            let {
                children: r,
                width: l = 10,
                height: a = 5,
                ...i
            } = e;
            return (0, o.jsx)(n.Primitive.svg, {
                ...i,
                ref: t,
                width: l,
                height: a,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? r : (0, o.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    a.displayName = "Arrow";
    var i = e.i(78892),
        s = e.i(608652),
        u = e.i(886449),
        d = e.i(723570),
        c = e.i(692166),
        f = "Popper",
        [p, m] = (0, s.createContextScope)(f),
        [v, h] = p(f),
        g = e => {
            let {
                __scopePopper: r,
                children: l
            } = e, [n, a] = t.useState(null);
            return (0, o.jsx)(v, {
                scope: r,
                anchor: n,
                onAnchorChange: a,
                children: l
            })
        };
    g.displayName = f;
    var x = "PopperAnchor",
        w = t.forwardRef((e, r) => {
            let {
                __scopePopper: l,
                virtualRef: a,
                ...s
            } = e, u = h(x, l), d = t.useRef(null), c = (0, i.useComposedRefs)(r, d);
            return t.useEffect(() => {
                u.onAnchorChange((null == a ? void 0 : a.current) || d.current)
            }), a ? null : (0, o.jsx)(n.Primitive.div, {
                ...s,
                ref: c
            })
        });
    w.displayName = x;
    var y = "PopperContent",
        [b, S] = p(y),
        C = t.forwardRef((e, a) => {
            var s, f, p, m, v, g, x, w;
            let {
                __scopePopper: S,
                side: C = "bottom",
                sideOffset: E = 0,
                align: R = "center",
                alignOffset: P = 0,
                arrowPadding: j = 0,
                avoidCollisions: T = !0,
                collisionBoundary: M = [],
                collisionPadding: k = 0,
                sticky: L = "partial",
                hideWhenDetached: D = !1,
                updatePositionStrategy: H = "optimized",
                onPlaced: _,
                ...O
            } = e, F = h(y, S), [B, z] = t.useState(null), K = (0, i.useComposedRefs)(a, e => z(e)), [V, U] = t.useState(null), X = (0, c.useSize)(V), W = null != (s = null == X ? void 0 : X.width) ? s : 0, Y = null != (f = null == X ? void 0 : X.height) ? f : 0, G = "number" == typeof k ? k : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...k
            }, q = Array.isArray(M) ? M : [M], Z = q.length > 0, J = {
                padding: G,
                boundary: q.filter(N),
                altBoundary: Z
            }, {
                refs: Q,
                floatingStyles: $,
                placement: ee,
                isPositioned: et,
                middlewareData: er
            } = (0, r.useFloating)({
                strategy: "fixed",
                placement: C + ("center" !== R ? "-" + R : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, l.autoUpdate)(...t, {
                        animationFrame: "always" === H
                    })
                },
                elements: {
                    reference: F.anchor
                },
                middleware: [(0, r.offset)({
                    mainAxis: E + Y,
                    alignmentAxis: P
                }), T && (0, r.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === L ? (0, r.limitShift)() : void 0,
                    ...J
                }), T && (0, r.flip)({
                    ...J
                }), (0, r.size)({
                    ...J,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: l,
                            availableHeight: n
                        } = e, {
                            width: o,
                            height: a
                        } = r.reference, i = t.floating.style;
                        i.setProperty("--radix-popper-available-width", "".concat(l, "px")), i.setProperty("--radix-popper-available-height", "".concat(n, "px")), i.setProperty("--radix-popper-anchor-width", "".concat(o, "px")), i.setProperty("--radix-popper-anchor-height", "".concat(a, "px"))
                    }
                }), V && (0, r.arrow)({
                    element: V,
                    padding: j
                }), I({
                    arrowWidth: W,
                    arrowHeight: Y
                }), D && (0, r.hide)({
                    strategy: "referenceHidden",
                    ...J
                })]
            }), [el, en] = A(ee), eo = (0, u.useCallbackRef)(_);
            (0, d.useLayoutEffect)(() => {
                et && (null == eo || eo())
            }, [et, eo]);
            let ea = null == (p = er.arrow) ? void 0 : p.x,
                ei = null == (m = er.arrow) ? void 0 : m.y,
                es = (null == (v = er.arrow) ? void 0 : v.centerOffset) !== 0,
                [eu, ed] = t.useState();
            return (0, d.useLayoutEffect)(() => {
                B && ed(window.getComputedStyle(B).zIndex)
            }, [B]), (0, o.jsx)("div", {
                ref: Q.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...$,
                    transform: et ? $.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: eu,
                    "--radix-popper-transform-origin": [null == (g = er.transformOrigin) ? void 0 : g.x, null == (x = er.transformOrigin) ? void 0 : x.y].join(" "),
                    ...(null == (w = er.hide) ? void 0 : w.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, o.jsx)(b, {
                    scope: S,
                    placedSide: el,
                    onArrowChange: U,
                    arrowX: ea,
                    arrowY: ei,
                    shouldHideArrow: es,
                    children: (0, o.jsx)(n.Primitive.div, {
                        "data-side": el,
                        "data-align": en,
                        ...O,
                        ref: K,
                        style: {
                            ...O.style,
                            animation: et ? void 0 : "none"
                        }
                    })
                })
            })
        });
    C.displayName = y;
    var E = "PopperArrow",
        R = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        P = t.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...l
            } = e, n = S(E, r), i = R[n.placedSide];
            return (0, o.jsx)("span", {
                ref: n.onArrowChange,
                style: {
                    position: "absolute",
                    left: n.arrowX,
                    top: n.arrowY,
                    [i]: 0,
                    transformOrigin: {
                        top: "",
                        right: "0 0",
                        bottom: "center 0",
                        left: "100% 0"
                    } [n.placedSide],
                    transform: {
                        top: "translateY(100%)",
                        right: "translateY(50%) rotate(90deg) translateX(-50%)",
                        bottom: "rotate(180deg)",
                        left: "translateY(50%) rotate(-90deg) translateX(50%)"
                    } [n.placedSide],
                    visibility: n.shouldHideArrow ? "hidden" : void 0
                },
                children: (0, o.jsx)(a, {
                    ...l,
                    ref: t,
                    style: {
                        ...l.style,
                        display: "block"
                    }
                })
            })
        });

    function N(e) {
        return null !== e
    }
    P.displayName = E;
    var I = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, l, n, o, a;
            let {
                placement: i,
                rects: s,
                middlewareData: u
            } = t, d = (null == (n = u.arrow) ? void 0 : n.centerOffset) !== 0, c = d ? 0 : e.arrowWidth, f = d ? 0 : e.arrowHeight, [p, m] = A(i), v = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], h = (null != (r = null == (o = u.arrow) ? void 0 : o.x) ? r : 0) + c / 2, g = (null != (l = null == (a = u.arrow) ? void 0 : a.y) ? l : 0) + f / 2, x = "", w = "";
            return "bottom" === p ? (x = d ? v : "".concat(h, "px"), w = "".concat(-f, "px")) : "top" === p ? (x = d ? v : "".concat(h, "px"), w = "".concat(s.floating.height + f, "px")) : "right" === p ? (x = "".concat(-f, "px"), w = d ? v : "".concat(g, "px")) : "left" === p && (x = "".concat(s.floating.width + f, "px"), w = d ? v : "".concat(g, "px")), {
                data: {
                    x,
                    y: w
                }
            }
        }
    });

    function A(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["Anchor", 0, w, "Arrow", 0, P, "Content", 0, C, "Root", 0, g, "createPopperScope", 0, m], 524887)
}, 600317, 76992, e => {
    "use strict";
    var t = e.i(416340);
    e.i(149285);
    var r = e.i(78892),
        l = e.i(221628);

    function n(e) {
        var n;
        let o, i = (n = e, (o = t.forwardRef((e, l) => {
                let {
                    children: n,
                    ...o
                } = e;
                if (t.isValidElement(n)) {
                    var a, i, s;
                    let e, u, d = (u = (e = null == (i = Object.getOwnPropertyDescriptor((a = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in e && e.isReactWarning) ? a.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? a.props.ref : a.props.ref || a.ref,
                        c = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let l in t) {
                                let n = e[l],
                                    o = t[l];
                                /^on[A-Z]/.test(l) ? n && o ? r[l] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    let l = o(...t);
                                    return n(...t), l
                                } : n && (r[l] = n) : "style" === l ? r[l] = {
                                    ...n,
                                    ...o
                                } : "className" === l && (r[l] = [n, o].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(o, n.props);
                    return n.type !== t.Fragment && (c.ref = l ? (0, r.composeRefs)(l, d) : d), t.cloneElement(n, c)
                }
                return t.Children.count(n) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(n, ".SlotClone"), o),
            s = t.forwardRef((e, r) => {
                let {
                    children: n,
                    ...o
                } = e, s = t.Children.toArray(n), u = s.find(a);
                if (u) {
                    let e = u.props.children,
                        n = s.map(r => r !== u ? r : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, l.jsx)(i, {
                        ...o,
                        ref: r,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, n) : null
                    })
                }
                return (0, l.jsx)(i, {
                    ...o,
                    ref: r,
                    children: n
                })
            });
        return s.displayName = "".concat(e, ".Slot"), s
    }
    var o = Symbol("radix.slottable");

    function a(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === o
    }
    e.s(["createSlot", 0, n], 76992);
    var i = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, r) => {
        let o = n("Primitive.".concat(r)),
            a = t.forwardRef((e, t) => {
                let {
                    asChild: n,
                    ...a
                } = e;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, l.jsx)(n ? o : r, {
                    ...a,
                    ref: t
                })
            });
        return a.displayName = "Primitive.".concat(r), {
            ...e,
            [r]: a
        }
    }, {});
    e.s(["Primitive", 0, i], 600317)
}, 142953, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(174617),
        l = e.i(508785),
        n = e.i(78892),
        o = e.i(608652),
        a = e.i(40266),
        i = e.i(600317),
        s = e.i(886449),
        u = e.i(199786),
        d = e.i(974539),
        c = e.i(221628),
        f = "rovingFocusGroup.onEntryFocus",
        p = {
            bubbles: !1,
            cancelable: !0
        },
        m = "RovingFocusGroup",
        [v, h, g] = (0, l.createCollection)(m),
        [x, w] = (0, o.createContextScope)(m, [g]),
        [y, b] = x(m),
        S = t.forwardRef((e, t) => (0, c.jsx)(v.Provider, {
            scope: e.__scopeRovingFocusGroup,
            children: (0, c.jsx)(v.Slot, {
                scope: e.__scopeRovingFocusGroup,
                children: (0, c.jsx)(C, {
                    ...e,
                    ref: t
                })
            })
        }));
    S.displayName = m;
    var C = t.forwardRef((e, l) => {
            let {
                __scopeRovingFocusGroup: o,
                orientation: a,
                loop: v = !1,
                dir: g,
                currentTabStopId: x,
                defaultCurrentTabStopId: w,
                onCurrentTabStopIdChange: b,
                onEntryFocus: S,
                preventScrollOnEntryFocus: C = !1,
                ...E
            } = e, R = t.useRef(null), P = (0, n.useComposedRefs)(l, R), I = (0, d.useDirection)(g), [A, j] = (0, u.useControllableState)({
                prop: x,
                defaultProp: null != w ? w : null,
                onChange: b,
                caller: m
            }), [T, M] = t.useState(!1), k = (0, s.useCallbackRef)(S), L = h(o), D = t.useRef(!1), [H, _] = t.useState(0);
            return t.useEffect(() => {
                let e = R.current;
                if (e) return e.addEventListener(f, k), () => e.removeEventListener(f, k)
            }, [k]), (0, c.jsx)(y, {
                scope: o,
                orientation: a,
                dir: I,
                loop: v,
                currentTabStopId: A,
                onItemFocus: t.useCallback(e => j(e), [j]),
                onItemShiftTab: t.useCallback(() => M(!0), []),
                onFocusableItemAdd: t.useCallback(() => _(e => e + 1), []),
                onFocusableItemRemove: t.useCallback(() => _(e => e - 1), []),
                children: (0, c.jsx)(i.Primitive.div, {
                    tabIndex: T || 0 === H ? -1 : 0,
                    "data-orientation": a,
                    ...E,
                    ref: P,
                    style: {
                        outline: "none",
                        ...e.style
                    },
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, () => {
                        D.current = !0
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, e => {
                        let t = !D.current;
                        if (e.target === e.currentTarget && t && !T) {
                            let t = new CustomEvent(f, p);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = L().filter(e => e.focusable);
                                N([e.find(e => e.active), e.find(e => e.id === A), ...e].filter(Boolean).map(e => e.ref.current), C)
                            }
                        }
                        D.current = !1
                    }),
                    onBlur: (0, r.composeEventHandlers)(e.onBlur, () => M(!1))
                })
            })
        }),
        E = "RovingFocusGroupItem",
        R = t.forwardRef((e, l) => {
            let {
                __scopeRovingFocusGroup: n,
                focusable: o = !0,
                active: s = !1,
                tabStopId: u,
                children: d,
                ...f
            } = e, p = (0, a.useId)(), m = u || p, g = b(E, n), x = g.currentTabStopId === m, w = h(n), {
                onFocusableItemAdd: y,
                onFocusableItemRemove: S,
                currentTabStopId: C
            } = g;
            return t.useEffect(() => {
                if (o) return y(), () => S()
            }, [o, y, S]), (0, c.jsx)(v.ItemSlot, {
                scope: n,
                id: m,
                focusable: o,
                active: s,
                children: (0, c.jsx)(i.Primitive.span, {
                    tabIndex: x ? 0 : -1,
                    "data-orientation": g.orientation,
                    ...f,
                    ref: l,
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, e => {
                        o ? g.onItemFocus(m) : e.preventDefault()
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, () => g.onItemFocus(m)),
                    onKeyDown: (0, r.composeEventHandlers)(e.onKeyDown, e => {
                        if ("Tab" === e.key && e.shiftKey) return void g.onItemShiftTab();
                        if (e.target !== e.currentTarget) return;
                        let t = function(e, t, r) {
                            var l;
                            let n = (l = e.key, "rtl" !== r ? l : "ArrowLeft" === l ? "ArrowRight" : "ArrowRight" === l ? "ArrowLeft" : l);
                            if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(n)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(n))) return P[n]
                        }(e, g.orientation, g.dir);
                        if (void 0 !== t) {
                            if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                            e.preventDefault();
                            let n = w().filter(e => e.focusable).map(e => e.ref.current);
                            if ("last" === t) n.reverse();
                            else if ("prev" === t || "next" === t) {
                                var r, l;
                                "prev" === t && n.reverse();
                                let o = n.indexOf(e.currentTarget);
                                n = g.loop ? (r = n, l = o + 1, r.map((e, t) => r[(l + t) % r.length])) : n.slice(o + 1)
                            }
                            setTimeout(() => N(n))
                        }
                    }),
                    children: "function" == typeof d ? d({
                        isCurrentTabStop: x,
                        hasTabStop: null != C
                    }) : d
                })
            })
        });
    R.displayName = E;
    var P = {
        ArrowLeft: "prev",
        ArrowUp: "prev",
        ArrowRight: "next",
        ArrowDown: "next",
        PageUp: "first",
        Home: "first",
        PageDown: "last",
        End: "last"
    };

    function N(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            r = document.activeElement;
        for (let l of e)
            if (l === r || (l.focus({
                    preventScroll: t
                }), document.activeElement !== r)) return
    }
    e.s(["Item", 0, R, "Root", 0, S, "createRovingFocusGroupScope", 0, w])
}, 199786, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(723570);
    t[" useEffectEvent ".trim().toString()], t[" useInsertionEffect ".trim().toString()];
    var l = t[" useInsertionEffect ".trim().toString()] || r.useLayoutEffect;
    Symbol("RADIX:SYNC_STATE"), e.s(["useControllableState", 0, function(e) {
        let {
            prop: r,
            defaultProp: n,
            onChange: o = () => {},
            caller: a
        } = e, [i, s, u] = function(e) {
            let {
                defaultProp: r,
                onChange: n
            } = e, [o, a] = t.useState(r), i = t.useRef(o), s = t.useRef(n);
            return l(() => {
                s.current = n
            }, [n]), t.useEffect(() => {
                if (i.current !== o) {
                    var e;
                    null == (e = s.current) || e.call(s, o), i.current = o
                }
            }, [o, i]), [o, a, s]
        }({
            defaultProp: n,
            onChange: o
        }), d = void 0 !== r, c = d ? r : i;
        {
            let e = t.useRef(void 0 !== r);
            t.useEffect(() => {
                let t = e.current;
                if (t !== d) {
                    let e = d ? "controlled" : "uncontrolled";
                    console.warn("".concat(a, " is changing from ").concat(t ? "controlled" : "uncontrolled", " to ").concat(e, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                }
                e.current = d
            }, [d, a])
        }
        return [c, t.useCallback(e => {
            if (d) {
                let l = "function" == typeof e ? e(r) : e;
                if (l !== r) {
                    var t;
                    null == (t = u.current) || t.call(u, l)
                }
            } else s(e)
        }, [d, r, s, u])]
    }], 199786)
}, 300792, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["usePrevious", 0, function(e) {
        let r = t.useRef({
            value: e,
            previous: e
        });
        return t.useMemo(() => (r.current.value !== e && (r.current.previous = r.current.value, r.current.value = e), r.current.previous), [e])
    }])
}, 692166, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(723570);
    e.s(["useSize", 0, function(e) {
        let [l, n] = t.useState(void 0);
        return (0, r.useLayoutEffect)(() => {
            if (e) {
                n({
                    width: e.offsetWidth,
                    height: e.offsetHeight
                });
                let t = new ResizeObserver(t => {
                    let r, l;
                    if (!Array.isArray(t) || !t.length) return;
                    let o = t[0];
                    if ("borderBoxSize" in o) {
                        let e = o.borderBoxSize,
                            t = Array.isArray(e) ? e[0] : e;
                        r = t.inlineSize, l = t.blockSize
                    } else r = e.offsetWidth, l = e.offsetHeight;
                    n({
                        width: r,
                        height: l
                    })
                });
                return t.observe(e, {
                    box: "border-box"
                }), () => t.unobserve(e)
            }
            n(void 0)
        }, [e]), l
    }])
}, 220754, 634733, e => {
    "use strict";
    var t = e.i(253923),
        r = e.i(454778),
        l = e.i(629016),
        n = e.i(175064),
        o = e.i(197649),
        a = e.i(416340),
        i = e.i(149285),
        s = e.i(305607),
        u = e.i(19655),
        d = e.i(608652),
        c = e.i(78892),
        f = e.i(699704),
        p = e.i(221628),
        m = e.i(974539),
        v = e.i(598943),
        h = e.i(793808),
        g = e.i(44265),
        x = e.i(40266),
        w = e.i(524887),
        y = e.i(763960),
        b = e.i(594278),
        S = e.i(886449),
        C = e.i(428156),
        E = e.i(723570),
        R = e.i(300792),
        P = a.forwardRef((e, t) => (0, p.jsx)(b.Primitive.span, {
            ...e,
            ref: t,
            style: {
                position: "absolute",
                border: 0,
                width: 1,
                height: 1,
                padding: 0,
                margin: -1,
                overflow: "hidden",
                clip: "rect(0, 0, 0, 0)",
                whiteSpace: "nowrap",
                wordWrap: "normal",
                ...e.style
            }
        }));
    P.displayName = "VisuallyHidden";
    var N = e.i(3300),
        I = e.i(813593),
        A = [" ", "Enter", "ArrowUp", "ArrowDown"],
        j = [" ", "Enter"],
        T = "Select",
        [M, k, L] = function(e) {
            let t = e + "CollectionProvider",
                [r, l] = (0, d.createContextScope)(t),
                [n, o] = r(t, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }),
                i = e => {
                    let {
                        scope: t,
                        children: r
                    } = e, l = a.default.useRef(null), o = a.default.useRef(new Map).current;
                    return (0, p.jsx)(n, {
                        scope: t,
                        itemMap: o,
                        collectionRef: l,
                        children: r
                    })
                };
            i.displayName = t;
            let s = e + "CollectionSlot",
                u = (0, f.createSlot)(s),
                m = a.default.forwardRef((e, t) => {
                    let {
                        scope: r,
                        children: l
                    } = e, n = o(s, r), a = (0, c.useComposedRefs)(t, n.collectionRef);
                    return (0, p.jsx)(u, {
                        ref: a,
                        children: l
                    })
                });
            m.displayName = s;
            let v = e + "CollectionItemSlot",
                h = "data-radix-collection-item",
                g = (0, f.createSlot)(v),
                x = a.default.forwardRef((e, t) => {
                    let {
                        scope: r,
                        children: l,
                        ...n
                    } = e, i = a.default.useRef(null), s = (0, c.useComposedRefs)(t, i), u = o(v, r);
                    return a.default.useEffect(() => (u.itemMap.set(i, {
                        ref: i,
                        ...n
                    }), () => void u.itemMap.delete(i))), (0, p.jsx)(g, {
                        ...{
                            [h]: ""
                        },
                        ref: s,
                        children: l
                    })
                });
            return x.displayName = v, [{
                Provider: i,
                Slot: m,
                ItemSlot: x
            }, function(t) {
                let r = o(e + "CollectionConsumer", t);
                return a.default.useCallback(() => {
                    let e = r.collectionRef.current;
                    if (!e) return [];
                    let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                    return Array.from(r.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
                }, [r.collectionRef, r.itemMap])
            }, l]
        }(T),
        [D, H] = (0, d.createContextScope)(T, [L, w.createPopperScope]),
        _ = (0, w.createPopperScope)(),
        [O, F] = D(T),
        [B, z] = D(T),
        K = e => {
            let {
                __scopeSelect: t,
                children: r,
                open: l,
                defaultOpen: n,
                onOpenChange: o,
                value: i,
                defaultValue: s,
                onValueChange: u,
                dir: d,
                name: c,
                autoComplete: f,
                disabled: v,
                required: h,
                form: g
            } = e, y = _(t), [b, S] = a.useState(null), [E, R] = a.useState(null), [P, N] = a.useState(!1), I = (0, m.useDirection)(d), [A = !1, j] = (0, C.useControllableState)({
                prop: l,
                defaultProp: n,
                onChange: o
            }), [T, k] = (0, C.useControllableState)({
                prop: i,
                defaultProp: s,
                onChange: u
            }), L = a.useRef(null), D = !b || g || !!b.closest("form"), [H, F] = a.useState(new Set), z = Array.from(H).map(e => e.props.value).join(";");
            return (0, p.jsx)(w.Root, {
                ...y,
                children: (0, p.jsxs)(O, {
                    required: h,
                    scope: t,
                    trigger: b,
                    onTriggerChange: S,
                    valueNode: E,
                    onValueNodeChange: R,
                    valueNodeHasChildren: P,
                    onValueNodeHasChildrenChange: N,
                    contentId: (0, x.useId)(),
                    value: T,
                    onValueChange: k,
                    open: A,
                    onOpenChange: j,
                    dir: I,
                    triggerPointerDownPosRef: L,
                    disabled: v,
                    children: [(0, p.jsx)(M.Provider, {
                        scope: t,
                        children: (0, p.jsx)(B, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: a.useCallback(e => {
                                F(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: a.useCallback(e => {
                                F(t => {
                                    let r = new Set(t);
                                    return r.delete(e), r
                                })
                            }, []),
                            children: r
                        })
                    }), D ? (0, p.jsxs)(eC, {
                        "aria-hidden": !0,
                        required: h,
                        tabIndex: -1,
                        name: c,
                        autoComplete: f,
                        value: T,
                        onChange: e => k(e.target.value),
                        disabled: v,
                        form: g,
                        children: [void 0 === T ? (0, p.jsx)("option", {
                            value: ""
                        }) : null, Array.from(H)]
                    }, z) : null]
                })
            })
        };
    K.displayName = T;
    var V = "SelectTrigger",
        U = a.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                disabled: l = !1,
                ...n
            } = e, o = _(r), i = F(V, r), s = i.disabled || l, d = (0, c.useComposedRefs)(t, i.onTriggerChange), f = k(r), m = a.useRef("touch"), [v, h, g] = eE(e => {
                let t = f().filter(e => !e.disabled),
                    r = t.find(e => e.value === i.value),
                    l = eR(t, e, r);
                void 0 !== l && i.onValueChange(l.value)
            }), x = e => {
                s || (i.onOpenChange(!0), g()), e && (i.triggerPointerDownPosRef.current = {
                    x: Math.round(e.pageX),
                    y: Math.round(e.pageY)
                })
            };
            return (0, p.jsx)(w.Anchor, {
                asChild: !0,
                ...o,
                children: (0, p.jsx)(b.Primitive.button, {
                    type: "button",
                    role: "combobox",
                    "aria-controls": i.contentId,
                    "aria-expanded": i.open,
                    "aria-required": i.required,
                    "aria-autocomplete": "none",
                    dir: i.dir,
                    "data-state": i.open ? "open" : "closed",
                    disabled: s,
                    "data-disabled": s ? "" : void 0,
                    "data-placeholder": eS(i.value) ? "" : void 0,
                    ...n,
                    ref: d,
                    onClick: (0, u.composeEventHandlers)(n.onClick, e => {
                        e.currentTarget.focus(), "mouse" !== m.current && x(e)
                    }),
                    onPointerDown: (0, u.composeEventHandlers)(n.onPointerDown, e => {
                        m.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (x(e), e.preventDefault())
                    }),
                    onKeyDown: (0, u.composeEventHandlers)(n.onKeyDown, e => {
                        let t = "" !== v.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || h(e.key), (!t || " " !== e.key) && A.includes(e.key) && (x(), e.preventDefault())
                    })
                })
            })
        });
    U.displayName = V;
    var X = "SelectValue",
        W = a.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: l,
                style: n,
                children: o,
                placeholder: a = "",
                ...i
            } = e, s = F(X, r), {
                onValueNodeHasChildrenChange: u
            } = s, d = void 0 !== o, f = (0, c.useComposedRefs)(t, s.onValueNodeChange);
            return (0, E.useLayoutEffect)(() => {
                u(d)
            }, [u, d]), (0, p.jsx)(b.Primitive.span, {
                ...i,
                ref: f,
                style: {
                    pointerEvents: "none"
                },
                children: eS(s.value) ? (0, p.jsx)(p.Fragment, {
                    children: a
                }) : o
            })
        });
    W.displayName = X;
    var Y = a.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            children: l,
            ...n
        } = e;
        return (0, p.jsx)(b.Primitive.span, {
            "aria-hidden": !0,
            ...n,
            ref: t,
            children: l || "▼"
        })
    });
    Y.displayName = "SelectIcon";
    var G = e => (0, p.jsx)(y.Portal, {
        asChild: !0,
        ...e
    });
    G.displayName = "SelectPortal";
    var q = "SelectContent",
        Z = a.forwardRef((e, t) => {
            let r = F(q, e.__scopeSelect),
                [l, n] = a.useState();
            return ((0, E.useLayoutEffect)(() => {
                n(new DocumentFragment)
            }, []), r.open) ? (0, p.jsx)(ee, {
                ...e,
                ref: t
            }) : l ? i.createPortal((0, p.jsx)(J, {
                scope: e.__scopeSelect,
                children: (0, p.jsx)(M.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, p.jsx)("div", {
                        children: e.children
                    })
                })
            }), l) : null
        });
    Z.displayName = q;
    var [J, Q] = D(q), $ = (0, f.createSlot)("SelectContent.RemoveScroll"), ee = a.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            position: l = "item-aligned",
            onCloseAutoFocus: n,
            onEscapeKeyDown: o,
            onPointerDownOutside: i,
            side: s,
            sideOffset: d,
            align: f,
            alignOffset: m,
            arrowPadding: x,
            collisionBoundary: w,
            collisionPadding: y,
            sticky: b,
            hideWhenDetached: S,
            avoidCollisions: C,
            ...E
        } = e, R = F(q, r), [P, A] = a.useState(null), [j, T] = a.useState(null), M = (0, c.useComposedRefs)(t, e => A(e)), [L, D] = a.useState(null), [H, _] = a.useState(null), O = k(r), [B, z] = a.useState(!1), K = a.useRef(!1);
        a.useEffect(() => {
            if (P) return (0, N.hideOthers)(P)
        }, [P]), (0, h.useFocusGuards)();
        let V = a.useCallback(e => {
                let [t, ...r] = O().map(e => e.ref.current), [l] = r.slice(-1), n = document.activeElement;
                for (let r of e)
                    if (r === n || (null == r || r.scrollIntoView({
                            block: "nearest"
                        }), r === t && j && (j.scrollTop = 0), r === l && j && (j.scrollTop = j.scrollHeight), null == r || r.focus(), document.activeElement !== n)) return
            }, [O, j]),
            U = a.useCallback(() => V([L, P]), [V, L, P]);
        a.useEffect(() => {
            B && U()
        }, [B, U]);
        let {
            onOpenChange: X,
            triggerPointerDownPosRef: W
        } = R;
        a.useEffect(() => {
            if (P) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        var r, l, n, o;
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (null != (r = null == (n = W.current) ? void 0 : n.x) ? r : 0)),
                            y: Math.abs(Math.round(t.pageY) - (null != (l = null == (o = W.current) ? void 0 : o.y) ? l : 0))
                        }
                    },
                    r = r => {
                        e.x <= 10 && e.y <= 10 ? r.preventDefault() : P.contains(r.target) || X(!1), document.removeEventListener("pointermove", t), W.current = null
                    };
                return null !== W.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                        capture: !0
                    })
                }
            }
        }, [P, X, W]), a.useEffect(() => {
            let e = () => X(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [X]);
        let [Y, G] = eE(e => {
            let t = O().filter(e => !e.disabled),
                r = t.find(e => e.ref.current === document.activeElement),
                l = eR(t, e, r);
            l && setTimeout(() => l.ref.current.focus())
        }), Z = a.useCallback((e, t, r) => {
            let l = !K.current && !r;
            (void 0 !== R.value && R.value === t || l) && (D(e), l && (K.current = !0))
        }, [R.value]), Q = a.useCallback(() => null == P ? void 0 : P.focus(), [P]), ee = a.useCallback((e, t, r) => {
            let l = !K.current && !r;
            (void 0 !== R.value && R.value === t || l) && _(e)
        }, [R.value]), el = "popper" === l ? er : et, en = el === er ? {
            side: s,
            sideOffset: d,
            align: f,
            alignOffset: m,
            arrowPadding: x,
            collisionBoundary: w,
            collisionPadding: y,
            sticky: b,
            hideWhenDetached: S,
            avoidCollisions: C
        } : {};
        return (0, p.jsx)(J, {
            scope: r,
            content: P,
            viewport: j,
            onViewportChange: T,
            itemRefCallback: Z,
            selectedItem: L,
            onItemLeave: Q,
            itemTextRefCallback: ee,
            focusSelectedItem: U,
            selectedItemText: H,
            position: l,
            isPositioned: B,
            searchRef: Y,
            children: (0, p.jsx)(I.RemoveScroll, {
                as: $,
                allowPinchZoom: !0,
                children: (0, p.jsx)(g.FocusScope, {
                    asChild: !0,
                    trapped: R.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: (0, u.composeEventHandlers)(n, e => {
                        var t;
                        null == (t = R.trigger) || t.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, p.jsx)(v.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !0,
                        onEscapeKeyDown: o,
                        onPointerDownOutside: i,
                        onFocusOutside: e => e.preventDefault(),
                        onDismiss: () => R.onOpenChange(!1),
                        children: (0, p.jsx)(el, {
                            role: "listbox",
                            id: R.contentId,
                            "data-state": R.open ? "open" : "closed",
                            dir: R.dir,
                            onContextMenu: e => e.preventDefault(),
                            ...E,
                            ...en,
                            onPlaced: () => z(!0),
                            ref: M,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...E.style
                            },
                            onKeyDown: (0, u.composeEventHandlers)(E.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || G(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = O().filter(e => !e.disabled).map(e => e.ref.current);
                                    if (["ArrowUp", "End"].includes(e.key) && (t = t.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                        let r = e.target,
                                            l = t.indexOf(r);
                                        t = t.slice(l + 1)
                                    }
                                    setTimeout(() => V(t)), e.preventDefault()
                                }
                            })
                        })
                    })
                })
            })
        })
    });
    ee.displayName = "SelectContentImpl";
    var et = a.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onPlaced: l,
            ...n
        } = e, o = F(q, r), i = Q(q, r), [u, d] = a.useState(null), [f, m] = a.useState(null), v = (0, c.useComposedRefs)(t, e => m(e)), h = k(r), g = a.useRef(!1), x = a.useRef(!0), {
            viewport: w,
            selectedItem: y,
            selectedItemText: S,
            focusSelectedItem: C
        } = i, R = a.useCallback(() => {
            if (o.trigger && o.valueNode && u && f && w && y && S) {
                let e = o.trigger.getBoundingClientRect(),
                    t = f.getBoundingClientRect(),
                    r = o.valueNode.getBoundingClientRect(),
                    n = S.getBoundingClientRect();
                if ("rtl" !== o.dir) {
                    let l = n.left - t.left,
                        o = r.left - l,
                        a = e.left - o,
                        i = e.width + a,
                        d = Math.max(i, t.width),
                        c = window.innerWidth - 10,
                        f = (0, s.clamp)(o, [10, Math.max(10, c - d)]);
                    u.style.minWidth = i + "px", u.style.left = f + "px"
                } else {
                    let l = t.right - n.right,
                        o = window.innerWidth - r.right - l,
                        a = window.innerWidth - e.right - o,
                        i = e.width + a,
                        d = Math.max(i, t.width),
                        c = window.innerWidth - 10,
                        f = (0, s.clamp)(o, [10, Math.max(10, c - d)]);
                    u.style.minWidth = i + "px", u.style.right = f + "px"
                }
                let a = h(),
                    i = window.innerHeight - 20,
                    d = w.scrollHeight,
                    c = window.getComputedStyle(f),
                    p = parseInt(c.borderTopWidth, 10),
                    m = parseInt(c.paddingTop, 10),
                    v = parseInt(c.borderBottomWidth, 10),
                    x = p + m + d + parseInt(c.paddingBottom, 10) + v,
                    b = Math.min(5 * y.offsetHeight, x),
                    C = window.getComputedStyle(w),
                    E = parseInt(C.paddingTop, 10),
                    R = parseInt(C.paddingBottom, 10),
                    P = e.top + e.height / 2 - 10,
                    N = y.offsetHeight / 2,
                    I = p + m + (y.offsetTop + N);
                if (I <= P) {
                    let e = a.length > 0 && y === a[a.length - 1].ref.current;
                    u.style.bottom = "0px";
                    let t = Math.max(i - P, N + (e ? R : 0) + (f.clientHeight - w.offsetTop - w.offsetHeight) + v);
                    u.style.height = I + t + "px"
                } else {
                    let e = a.length > 0 && y === a[0].ref.current;
                    u.style.top = "0px";
                    let t = Math.max(P, p + w.offsetTop + (e ? E : 0) + N);
                    u.style.height = t + (x - I) + "px", w.scrollTop = I - P + w.offsetTop
                }
                u.style.margin = "".concat(10, "px 0"), u.style.minHeight = b + "px", u.style.maxHeight = i + "px", null == l || l(), requestAnimationFrame(() => g.current = !0)
            }
        }, [h, o.trigger, o.valueNode, u, f, w, y, S, o.dir, l]);
        (0, E.useLayoutEffect)(() => R(), [R]);
        let [P, N] = a.useState();
        (0, E.useLayoutEffect)(() => {
            f && N(window.getComputedStyle(f).zIndex)
        }, [f]);
        let I = a.useCallback(e => {
            e && !0 === x.current && (R(), null == C || C(), x.current = !1)
        }, [R, C]);
        return (0, p.jsx)(el, {
            scope: r,
            contentWrapper: u,
            shouldExpandOnScrollRef: g,
            onScrollButtonChange: I,
            children: (0, p.jsx)("div", {
                ref: d,
                style: {
                    display: "flex",
                    flexDirection: "column",
                    position: "fixed",
                    zIndex: P
                },
                children: (0, p.jsx)(b.Primitive.div, {
                    ...n,
                    ref: v,
                    style: {
                        boxSizing: "border-box",
                        maxHeight: "100%",
                        ...n.style
                    }
                })
            })
        })
    });
    et.displayName = "SelectItemAlignedPosition";
    var er = a.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            align: l = "start",
            collisionPadding: n = 10,
            ...o
        } = e, a = _(r);
        return (0, p.jsx)(w.Content, {
            ...a,
            ...o,
            ref: t,
            align: l,
            collisionPadding: n,
            style: {
                boxSizing: "border-box",
                ...o.style,
                "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
            }
        })
    });
    er.displayName = "SelectPopperPosition";
    var [el, en] = D(q, {}), eo = "SelectViewport", ea = a.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            nonce: l,
            ...n
        } = e, o = Q(eo, r), i = en(eo, r), s = (0, c.useComposedRefs)(t, o.onViewportChange), d = a.useRef(0);
        return (0, p.jsxs)(p.Fragment, {
            children: [(0, p.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: l
            }), (0, p.jsx)(M.Slot, {
                scope: r,
                children: (0, p.jsx)(b.Primitive.div, {
                    "data-radix-select-viewport": "",
                    role: "presentation",
                    ...n,
                    ref: s,
                    style: {
                        position: "relative",
                        flex: 1,
                        overflow: "hidden auto",
                        ...n.style
                    },
                    onScroll: (0, u.composeEventHandlers)(n.onScroll, e => {
                        let t = e.currentTarget,
                            {
                                contentWrapper: r,
                                shouldExpandOnScrollRef: l
                            } = i;
                        if ((null == l ? void 0 : l.current) && r) {
                            let e = Math.abs(d.current - t.scrollTop);
                            if (e > 0) {
                                let l = window.innerHeight - 20,
                                    n = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                if (n < l) {
                                    let o = n + e,
                                        a = Math.min(l, o),
                                        i = o - a;
                                    r.style.height = a + "px", "0px" === r.style.bottom && (t.scrollTop = i > 0 ? i : 0, r.style.justifyContent = "flex-end")
                                }
                            }
                        }
                        d.current = t.scrollTop
                    })
                })
            })]
        })
    });
    ea.displayName = eo;
    var ei = "SelectGroup",
        [es, eu] = D(ei);
    a.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...l
        } = e, n = (0, x.useId)();
        return (0, p.jsx)(es, {
            scope: r,
            id: n,
            children: (0, p.jsx)(b.Primitive.div, {
                role: "group",
                "aria-labelledby": n,
                ...l,
                ref: t
            })
        })
    }).displayName = ei;
    var ed = "SelectLabel";
    a.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...l
        } = e, n = eu(ed, r);
        return (0, p.jsx)(b.Primitive.div, {
            id: n.id,
            ...l,
            ref: t
        })
    }).displayName = ed;
    var ec = "SelectItem",
        [ef, ep] = D(ec),
        em = a.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                value: l,
                disabled: n = !1,
                textValue: o,
                ...i
            } = e, s = F(ec, r), d = Q(ec, r), f = s.value === l, [m, v] = a.useState(null != o ? o : ""), [h, g] = a.useState(!1), w = (0, c.useComposedRefs)(t, e => {
                var t;
                return null == (t = d.itemRefCallback) ? void 0 : t.call(d, e, l, n)
            }), y = (0, x.useId)(), S = a.useRef("touch"), C = () => {
                n || (s.onValueChange(l), s.onOpenChange(!1))
            };
            if ("" === l) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, p.jsx)(ef, {
                scope: r,
                value: l,
                disabled: n,
                textId: y,
                isSelected: f,
                onItemTextChange: a.useCallback(e => {
                    v(t => {
                        var r;
                        return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                    })
                }, []),
                children: (0, p.jsx)(M.ItemSlot, {
                    scope: r,
                    value: l,
                    disabled: n,
                    textValue: m,
                    children: (0, p.jsx)(b.Primitive.div, {
                        role: "option",
                        "aria-labelledby": y,
                        "data-highlighted": h ? "" : void 0,
                        "aria-selected": f && h,
                        "data-state": f ? "checked" : "unchecked",
                        "aria-disabled": n || void 0,
                        "data-disabled": n ? "" : void 0,
                        tabIndex: n ? void 0 : -1,
                        ...i,
                        ref: w,
                        onFocus: (0, u.composeEventHandlers)(i.onFocus, () => g(!0)),
                        onBlur: (0, u.composeEventHandlers)(i.onBlur, () => g(!1)),
                        onClick: (0, u.composeEventHandlers)(i.onClick, () => {
                            "mouse" !== S.current && C()
                        }),
                        onPointerUp: (0, u.composeEventHandlers)(i.onPointerUp, () => {
                            "mouse" === S.current && C()
                        }),
                        onPointerDown: (0, u.composeEventHandlers)(i.onPointerDown, e => {
                            S.current = e.pointerType
                        }),
                        onPointerMove: (0, u.composeEventHandlers)(i.onPointerMove, e => {
                            if (S.current = e.pointerType, n) {
                                var t;
                                null == (t = d.onItemLeave) || t.call(d)
                            } else "mouse" === S.current && e.currentTarget.focus({
                                preventScroll: !0
                            })
                        }),
                        onPointerLeave: (0, u.composeEventHandlers)(i.onPointerLeave, e => {
                            if (e.currentTarget === document.activeElement) {
                                var t;
                                null == (t = d.onItemLeave) || t.call(d)
                            }
                        }),
                        onKeyDown: (0, u.composeEventHandlers)(i.onKeyDown, e => {
                            var t;
                            ((null == (t = d.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (j.includes(e.key) && C(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    em.displayName = ec;
    var ev = "SelectItemText",
        eh = a.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: l,
                style: n,
                ...o
            } = e, s = F(ev, r), u = Q(ev, r), d = ep(ev, r), f = z(ev, r), [m, v] = a.useState(null), h = (0, c.useComposedRefs)(t, e => v(e), d.onItemTextChange, e => {
                var t;
                return null == (t = u.itemTextRefCallback) ? void 0 : t.call(u, e, d.value, d.disabled)
            }), g = null == m ? void 0 : m.textContent, x = a.useMemo(() => (0, p.jsx)("option", {
                value: d.value,
                disabled: d.disabled,
                children: g
            }, d.value), [d.disabled, d.value, g]), {
                onNativeOptionAdd: w,
                onNativeOptionRemove: y
            } = f;
            return (0, E.useLayoutEffect)(() => (w(x), () => y(x)), [w, y, x]), (0, p.jsxs)(p.Fragment, {
                children: [(0, p.jsx)(b.Primitive.span, {
                    id: d.textId,
                    ...o,
                    ref: h
                }), d.isSelected && s.valueNode && !s.valueNodeHasChildren ? i.createPortal(o.children, s.valueNode) : null]
            })
        });
    eh.displayName = ev;
    var eg = "SelectItemIndicator";
    a.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...l
        } = e;
        return ep(eg, r).isSelected ? (0, p.jsx)(b.Primitive.span, {
            "aria-hidden": !0,
            ...l,
            ref: t
        }) : null
    }).displayName = eg;
    var ex = "SelectScrollUpButton";
    a.forwardRef((e, t) => {
        let r = Q(ex, e.__scopeSelect),
            l = en(ex, e.__scopeSelect),
            [n, o] = a.useState(!1),
            i = (0, c.useComposedRefs)(t, l.onScrollButtonChange);
        return (0, E.useLayoutEffect)(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        o(t.scrollTop > 0)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), n ? (0, p.jsx)(ey, {
            ...e,
            ref: i,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = r;
                e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
            }
        }) : null
    }).displayName = ex;
    var ew = "SelectScrollDownButton";
    a.forwardRef((e, t) => {
        let r = Q(ew, e.__scopeSelect),
            l = en(ew, e.__scopeSelect),
            [n, o] = a.useState(!1),
            i = (0, c.useComposedRefs)(t, l.onScrollButtonChange);
        return (0, E.useLayoutEffect)(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        o(Math.ceil(t.scrollTop) < e)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), n ? (0, p.jsx)(ey, {
            ...e,
            ref: i,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = r;
                e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
            }
        }) : null
    }).displayName = ew;
    var ey = a.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onAutoScroll: l,
            ...n
        } = e, o = Q("SelectScrollButton", r), i = a.useRef(null), s = k(r), d = a.useCallback(() => {
            null !== i.current && (window.clearInterval(i.current), i.current = null)
        }, []);
        return a.useEffect(() => () => d(), [d]), (0, E.useLayoutEffect)(() => {
            var e;
            let t = s().find(e => e.ref.current === document.activeElement);
            null == t || null == (e = t.ref.current) || e.scrollIntoView({
                block: "nearest"
            })
        }, [s]), (0, p.jsx)(b.Primitive.div, {
            "aria-hidden": !0,
            ...n,
            ref: t,
            style: {
                flexShrink: 0,
                ...n.style
            },
            onPointerDown: (0, u.composeEventHandlers)(n.onPointerDown, () => {
                null === i.current && (i.current = window.setInterval(l, 50))
            }),
            onPointerMove: (0, u.composeEventHandlers)(n.onPointerMove, () => {
                var e;
                null == (e = o.onItemLeave) || e.call(o), null === i.current && (i.current = window.setInterval(l, 50))
            }),
            onPointerLeave: (0, u.composeEventHandlers)(n.onPointerLeave, () => {
                d()
            })
        })
    });
    a.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...l
        } = e;
        return (0, p.jsx)(b.Primitive.div, {
            "aria-hidden": !0,
            ...l,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var eb = "SelectArrow";

    function eS(e) {
        return "" === e || void 0 === e
    }
    a.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...l
        } = e, n = _(r), o = F(eb, r), a = Q(eb, r);
        return o.open && "popper" === a.position ? (0, p.jsx)(w.Arrow, {
            ...n,
            ...l,
            ref: t
        }) : null
    }).displayName = eb;
    var eC = a.forwardRef((e, t) => {
        let {
            value: r,
            ...l
        } = e, n = a.useRef(null), o = (0, c.useComposedRefs)(t, n), i = (0, R.usePrevious)(r);
        return a.useEffect(() => {
            let e = n.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
            if (i !== r && t) {
                let l = new Event("change", {
                    bubbles: !0
                });
                t.call(e, r), e.dispatchEvent(l)
            }
        }, [i, r]), (0, p.jsx)(P, {
            asChild: !0,
            children: (0, p.jsx)("select", {
                ...l,
                ref: o,
                defaultValue: r
            })
        })
    });

    function eE(e) {
        let t = (0, S.useCallbackRef)(e),
            r = a.useRef(""),
            l = a.useRef(0),
            n = a.useCallback(e => {
                let n = r.current + e;
                t(n),
                    function e(t) {
                        r.current = t, window.clearTimeout(l.current), "" !== t && (l.current = window.setTimeout(() => e(""), 1e3))
                    }(n)
            }, [t]),
            o = a.useCallback(() => {
                r.current = "", window.clearTimeout(l.current)
            }, []);
        return a.useEffect(() => () => window.clearTimeout(l.current), []), [r, n, o]
    }

    function eR(e, t, r) {
        var l, n;
        let o = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            a = r ? e.indexOf(r) : -1,
            i = (l = e, n = Math.max(a, 0), l.map((e, t) => l[(n + t) % l.length]));
        1 === o.length && (i = i.filter(e => e !== r));
        let s = i.find(e => e.textValue.toLowerCase().startsWith(o.toLowerCase()));
        return s !== r ? s : void 0
    }
    eC.displayName = "BubbleSelect";
    let eP = (0, a.createContext)(null),
        eN = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        eI = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        eA = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        ej = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        eT = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        eM = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        ek = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        eL = (0, a.forwardRef)((e, i) => {
            let {
                label: s,
                labelTooltip: u,
                ariaLabelledBy: d,
                ariaLabel: c,
                className: f,
                size: p,
                variant: m = "Standard",
                value: v,
                placeholder: h,
                isDisabled: g,
                hasError: x,
                hint: w,
                onValueChange: y,
                onOpenChange: b,
                children: S
            } = e, C = (0, r.default)(), E = (0, a.useMemo)(() => ({
                size: p
            }), [p]), R = s ? a.default.createElement("span", {
                id: C,
                className: (0, o.default)(eA[p], "content-emphasis")
            }, s) : null;
            return a.default.createElement(eP.Provider, {
                value: E
            }, a.default.createElement("div", {
                className: (0, o.default)("flex flex-col", g && ["opacity-[0.5]", "pointer-events-none"], eT[p], f)
            }, R && (u ? a.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, R, a.default.createElement(l.LabelTooltip, u)) : R), a.default.createElement(K, {
                value: v,
                disabled: g,
                onValueChange: y,
                onOpenChange: b
            }, a.default.createElement(U, {
                className: (0, o.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", n.INPUT_BACKGROUND_BY_VARIANT[m], n.INPUT_STROKE_BY_VARIANT[m], eM[p], ek[p], eI[p], ej[p], x ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === v ? "content-muted" : "content-default"),
                ref: i,
                "aria-labelledby": s ? C : d,
                "aria-label": c
            }, a.default.createElement(t.StateLayer, null), a.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, a.default.createElement(W, {
                placeholder: h
            })), a.default.createElement(Y, {
                className: (0, o.default)(eN[p], "icon icon-regular-chevron-large-down content-default")
            })), a.default.createElement(G, null, a.default.createElement(Z, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, S))), w && a.default.createElement("span", {
                className: (0, o.default)("text-caption-small", {
                    "content-system-alert": x,
                    "content-default": !x
                })
            }, w)))
        });
    eL.displayName = "Dropdown", e.s(["Dropdown", 0, eL, "DropdownContext", 0, eP], 634733);
    var eD = e.i(23342),
        eH = e.i(142953);
    let e_ = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        eO = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        eF = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        eB = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        ez = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        eK = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        eV = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        eU = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        eX = (0, a.createContext)(null),
        eW = () => {
            let e = (0, a.useContext)(eX);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        var t;
        let {
            children: r,
            className: l,
            size: n
        } = e, i = (0, a.useContext)(eP), s = i ? "dropdown" : "standalone", u = null != (t = null != n ? n : null == i ? void 0 : i.size) ? t : "Medium", d = (0, a.useMemo)(() => ({
            size: u,
            mode: s
        }), [u, s]), c = (0, o.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", e_[u], l), f = "standalone" === s ? a.default.createElement(eH.Root, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, a.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: c
        }, r)) : a.default.createElement("div", {
            className: c
        }, r);
        return a.default.createElement(eX.Provider, {
            value: d
        }, "dropdown" === s ? a.default.createElement(ea, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, f) : f)
    }, "MenuItem", 0, e => {
        let r, {
                value: l,
                leading: n,
                title: i,
                description: s,
                trailing: u,
                disabled: d,
                className: c,
                onSelect: f,
                asChild: p,
                children: m,
                ...v
            } = e,
            {
                size: h,
                mode: g
            } = eW(),
            x = (0, o.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", eV[h], eF[h], eB[h], ez[h], eU[h], d && "opacity-[0.5]", d && "pointer-events-none", c),
            w = a.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, i);
        switch (g) {
            case "dropdown":
                w = a.default.createElement(eh, {
                    asChild: !0
                }, w);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", g)
        }
        let y = a.default.createElement(a.default.Fragment, null, !d && a.default.createElement(t.StateLayer, null), n, a.default.createElement("div", {
            className: (0, o.default)("grow-1 text-truncate-split flex flex-col", eK[h])
        }, w, s && a.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, s)), u);
        if (p) {
            let {
                as: e,
                ...l
            } = v, n = a.default.Children.only(m), o = void 0 === i && n.props.children;
            r = a.default.createElement(eD.Slot, {
                ...l,
                role: "standalone" === g ? "menuitem" : void 0,
                "aria-disabled": d || void 0,
                className: x,
                style: {
                    outlineOffset: 0
                },
                onClick: d ? void 0 : f
            }, o ? a.default.cloneElement(n, {}, a.default.createElement(a.default.Fragment, null, !d && a.default.createElement(t.StateLayer, null), n.props.children)) : a.default.cloneElement(n, {}, y))
        } else if ("a" === v.as) {
            let {
                as: e,
                href: t,
                ...l
            } = v;
            r = a.default.createElement("a", {
                ...l,
                role: "standalone" === g ? "menuitem" : void 0,
                "aria-disabled": d,
                href: d ? void 0 : t,
                className: x,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: d ? void 0 : f
            }, y)
        } else {
            let {
                as: e,
                ...t
            } = v;
            r = a.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === g ? "menuitem" : void 0,
                "aria-disabled": d,
                className: x,
                style: {
                    outlineOffset: 0
                },
                onClick: d ? void 0 : f
            }, y)
        }
        return "dropdown" === g ? a.default.createElement(em, {
            value: l,
            disabled: d,
            asChild: !0
        }, r) : a.default.createElement(eH.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: l
        }, r)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: r,
            leading: l,
            trailing: n,
            disabled: i,
            className: s
        } = e, {
            size: u
        } = eW(), d = (0, o.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", eV[u], eF[u], eB[u], ez[u], i && "opacity-[0.5]", s);
        return a.default.createElement("div", {
            role: "none",
            className: d
        }, l, a.default.createElement("div", {
            className: (0, o.default)("grow-1 text-truncate-split flex flex-col", eK[u])
        }, a.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), r && a.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, r)), n)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: r
        } = e, {
            size: l
        } = eW();
        return a.default.createElement("div", {
            role: "group",
            className: (0, o.default)(eO[l], r)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return a.default.createElement("div", {
            role: "separator",
            className: (0, o.default)("foundation-web-menu-separator", t)
        })
    }], 220754)
}, 629016, e => {
    "use strict";
    var t = e.i(605836),
        r = e.i(516674),
        l = e.i(416340);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: n,
            description: o,
            position: a = "top-center"
        } = e;
        return l.default.createElement(r.Tooltip, {
            position: a,
            title: n,
            description: o
        }, l.default.createElement(r.TooltipTrigger, {
            asChild: !0
        }, l.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": n,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, l.default.createElement(t.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }])
}, 175064, e => {
    "use strict";
    e.s(["INPUT_BACKGROUND_BY_VARIANT", 0, {
        Standard: "bg-none",
        Contrast: "bg-shift-200",
        Utility: "bg-none"
    }, "INPUT_STROKE_BY_VARIANT", 0, {
        Standard: "stroke-standard",
        Contrast: "stroke-none",
        Utility: "stroke-none"
    }, "INPUT_VARIANTS", 0, ["Standard", "Contrast", "Utility"]])
}, 454778, e => {
    "use strict";
    var t = e.i(416340);
    let r = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            l = (0, t.useRef)();
        return l.current || (r += 1, l.current = "".concat(e).concat(r)), l.current
    }])
}]);

//# debugId=ccb79269-048c-5aaa-aab0-702727b00559
//# sourceMappingURL=2kxzekots2c5v.js.map
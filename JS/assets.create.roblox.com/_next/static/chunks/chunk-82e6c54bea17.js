;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1eb611cd-697d-05d9-b0b1-4b173bcb016f")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 305607, e => {
    "use strict";
    e.s(["clamp", 0, function(e, t) {
        let [r, n] = t;
        return Math.min(n, Math.max(r, e))
    }])
}, 174617, e => {
    "use strict";
    "u" > typeof window && window.document && window.document.createElement, e.s(["composeEventHandlers", 0, function(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(n) {
            if (null == e || e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
        }
    }])
}, 742187, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(594278),
        n = e.i(221628),
        o = t.forwardRef((e, t) => {
            let {
                children: o,
                width: l = 10,
                height: i = 5,
                ...a
            } = e;
            return (0, n.jsx)(r.Primitive.svg, {
                ...a,
                ref: t,
                width: l,
                height: i,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? o : (0, n.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    o.displayName = "Arrow", e.s(["Root", 0, o])
}, 539206, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(608652),
        n = e.i(78892),
        o = e.i(699704),
        l = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let i = e + "CollectionProvider",
            [a, s] = (0, r.createContextScope)(i),
            [u, c] = a(i, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: r,
                    children: n
                } = e, o = t.default.useRef(null), i = t.default.useRef(new Map).current;
                return (0, l.jsx)(u, {
                    scope: r,
                    itemMap: i,
                    collectionRef: o,
                    children: n
                })
            };
        d.displayName = i;
        let f = e + "CollectionSlot",
            p = (0, o.createSlot)(f),
            m = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: o
                } = e, i = c(f, r), a = (0, n.useComposedRefs)(t, i.collectionRef);
                return (0, l.jsx)(p, {
                    ref: a,
                    children: o
                })
            });
        m.displayName = f;
        let v = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, o.createSlot)(v),
            y = t.default.forwardRef((e, r) => {
                let {
                    scope: o,
                    children: i,
                    ...a
                } = e, s = t.default.useRef(null), u = (0, n.useComposedRefs)(r, s), d = c(v, o);
                return t.default.useEffect(() => (d.itemMap.set(s, {
                    ref: s,
                    ...a
                }), () => void d.itemMap.delete(s))), (0, l.jsx)(g, {
                    ...{
                        [h]: ""
                    },
                    ref: u,
                    children: i
                })
            });
        return y.displayName = v, [{
            Provider: d,
            Slot: m,
            ItemSlot: y
        }, function(r) {
            let n = c(e + "CollectionConsumer", r);
            return t.default.useCallback(() => {
                let e = n.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                return Array.from(n.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [n.collectionRef, n.itemMap])
        }, s]
    }])
}, 508785, e => {
    "use strict";
    e.i(711300), e.i(634203), e.i(35877);
    var t = e.i(416340),
        r = e.i(608652),
        n = e.i(78892),
        o = e.i(76992),
        l = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let i = e + "CollectionProvider",
            [a, s] = (0, r.createContextScope)(i),
            [u, c] = a(i, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: r,
                    children: n
                } = e, o = t.default.useRef(null), i = t.default.useRef(new Map).current;
                return (0, l.jsx)(u, {
                    scope: r,
                    itemMap: i,
                    collectionRef: o,
                    children: n
                })
            };
        d.displayName = i;
        let f = e + "CollectionSlot",
            p = (0, o.createSlot)(f),
            m = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: o
                } = e, i = c(f, r), a = (0, n.useComposedRefs)(t, i.collectionRef);
                return (0, l.jsx)(p, {
                    ref: a,
                    children: o
                })
            });
        m.displayName = f;
        let v = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, o.createSlot)(v),
            y = t.default.forwardRef((e, r) => {
                let {
                    scope: o,
                    children: i,
                    ...a
                } = e, s = t.default.useRef(null), u = (0, n.useComposedRefs)(r, s), d = c(v, o);
                return t.default.useEffect(() => (d.itemMap.set(s, {
                    ref: s,
                    ...a
                }), () => void d.itemMap.delete(s))), (0, l.jsx)(g, {
                    ...{
                        [h]: ""
                    },
                    ref: u,
                    children: i
                })
            });
        return y.displayName = v, [{
            Provider: d,
            Slot: m,
            ItemSlot: y
        }, function(r) {
            let n = c(e + "CollectionConsumer", r);
            return t.default.useCallback(() => {
                let e = n.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                return Array.from(n.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [n.collectionRef, n.itemMap])
        }, s]
    }])
}, 974539, e => {
    "use strict";
    var t = e.i(416340);
    e.i(221628);
    var r = t.createContext(void 0);
    e.s(["useDirection", 0, function(e) {
        let n = t.useContext(r);
        return e || n || "ltr"
    }])
}, 524887, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(297452),
        n = e.i(992486),
        o = e.i(742187),
        l = e.i(78892),
        i = e.i(608652),
        a = e.i(594278),
        s = e.i(886449),
        u = e.i(723570),
        c = e.i(692166),
        d = e.i(221628),
        f = "Popper",
        [p, m] = (0, i.createContextScope)(f),
        [v, h] = p(f),
        g = e => {
            let {
                __scopePopper: r,
                children: n
            } = e, [o, l] = t.useState(null);
            return (0, d.jsx)(v, {
                scope: r,
                anchor: o,
                onAnchorChange: l,
                children: n
            })
        };
    g.displayName = f;
    var y = "PopperAnchor",
        x = t.forwardRef((e, r) => {
            let {
                __scopePopper: n,
                virtualRef: o,
                ...i
            } = e, s = h(y, n), u = t.useRef(null), c = (0, l.useComposedRefs)(r, u);
            return t.useEffect(() => {
                s.onAnchorChange((null == o ? void 0 : o.current) || u.current)
            }), o ? null : (0, d.jsx)(a.Primitive.div, {
                ...i,
                ref: c
            })
        });
    x.displayName = y;
    var w = "PopperContent",
        [b, C] = p(w),
        E = t.forwardRef((e, o) => {
            var i, f, p, m, v, g, y, x;
            let {
                __scopePopper: C,
                side: E = "bottom",
                sideOffset: S = 0,
                align: R = "center",
                alignOffset: P = 0,
                arrowPadding: j = 0,
                avoidCollisions: L = !0,
                collisionBoundary: O = [],
                collisionPadding: k = 0,
                sticky: M = "partial",
                hideWhenDetached: D = !1,
                updatePositionStrategy: I = "optimized",
                onPlaced: H,
                ..._
            } = e, F = h(w, C), [B, W] = t.useState(null), z = (0, l.useComposedRefs)(o, e => W(e)), [V, U] = t.useState(null), K = (0, c.useSize)(V), X = null != (i = null == K ? void 0 : K.width) ? i : 0, Y = null != (f = null == K ? void 0 : K.height) ? f : 0, G = "number" == typeof k ? k : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...k
            }, q = Array.isArray(O) ? O : [O], Z = q.length > 0, $ = {
                padding: G,
                boundary: q.filter(T),
                altBoundary: Z
            }, {
                refs: J,
                floatingStyles: Q,
                placement: ee,
                isPositioned: et,
                middlewareData: er
            } = (0, r.useFloating)({
                strategy: "fixed",
                placement: E + ("center" !== R ? "-" + R : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, n.autoUpdate)(...t, {
                        animationFrame: "always" === I
                    })
                },
                elements: {
                    reference: F.anchor
                },
                middleware: [(0, r.offset)({
                    mainAxis: S + Y,
                    alignmentAxis: P
                }), L && (0, r.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === M ? (0, r.limitShift)() : void 0,
                    ...$
                }), L && (0, r.flip)({
                    ...$
                }), (0, r.size)({
                    ...$,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: n,
                            availableHeight: o
                        } = e, {
                            width: l,
                            height: i
                        } = r.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(n, "px")), a.setProperty("--radix-popper-available-height", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(i, "px"))
                    }
                }), V && (0, r.arrow)({
                    element: V,
                    padding: j
                }), A({
                    arrowWidth: X,
                    arrowHeight: Y
                }), D && (0, r.hide)({
                    strategy: "referenceHidden",
                    ...$
                })]
            }), [en, eo] = N(ee), el = (0, s.useCallbackRef)(H);
            (0, u.useLayoutEffect)(() => {
                et && (null == el || el())
            }, [et, el]);
            let ei = null == (p = er.arrow) ? void 0 : p.x,
                ea = null == (m = er.arrow) ? void 0 : m.y,
                es = (null == (v = er.arrow) ? void 0 : v.centerOffset) !== 0,
                [eu, ec] = t.useState();
            return (0, u.useLayoutEffect)(() => {
                B && ec(window.getComputedStyle(B).zIndex)
            }, [B]), (0, d.jsx)("div", {
                ref: J.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...Q,
                    transform: et ? Q.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: eu,
                    "--radix-popper-transform-origin": [null == (g = er.transformOrigin) ? void 0 : g.x, null == (y = er.transformOrigin) ? void 0 : y.y].join(" "),
                    ...(null == (x = er.hide) ? void 0 : x.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, d.jsx)(b, {
                    scope: C,
                    placedSide: en,
                    onArrowChange: U,
                    arrowX: ei,
                    arrowY: ea,
                    shouldHideArrow: es,
                    children: (0, d.jsx)(a.Primitive.div, {
                        "data-side": en,
                        "data-align": eo,
                        ..._,
                        ref: z,
                        style: {
                            ..._.style,
                            animation: et ? void 0 : "none"
                        }
                    })
                })
            })
        });
    E.displayName = w;
    var S = "PopperArrow",
        R = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        P = t.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, l = C(S, r), i = R[l.placedSide];
            return (0, d.jsx)("span", {
                ref: l.onArrowChange,
                style: {
                    position: "absolute",
                    left: l.arrowX,
                    top: l.arrowY,
                    [i]: 0,
                    transformOrigin: {
                        top: "",
                        right: "0 0",
                        bottom: "center 0",
                        left: "100% 0"
                    } [l.placedSide],
                    transform: {
                        top: "translateY(100%)",
                        right: "translateY(50%) rotate(90deg) translateX(-50%)",
                        bottom: "rotate(180deg)",
                        left: "translateY(50%) rotate(-90deg) translateX(50%)"
                    } [l.placedSide],
                    visibility: l.shouldHideArrow ? "hidden" : void 0
                },
                children: (0, d.jsx)(o.Root, {
                    ...n,
                    ref: t,
                    style: {
                        ...n.style,
                        display: "block"
                    }
                })
            })
        });

    function T(e) {
        return null !== e
    }
    P.displayName = S;
    var A = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, n, o, l, i;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, m] = N(a), v = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], h = (null != (r = null == (l = u.arrow) ? void 0 : l.x) ? r : 0) + d / 2, g = (null != (n = null == (i = u.arrow) ? void 0 : i.y) ? n : 0) + f / 2, y = "", x = "";
            return "bottom" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(-f, "px")) : "top" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), x = c ? v : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), x = c ? v : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: x
                }
            }
        }
    });

    function N(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["Anchor", 0, x, "Arrow", 0, P, "Content", 0, E, "Root", 0, g, "createPopperScope", 0, m])
}, 600317, e => {
    "use strict";
    var t = e.i(416340);
    e.i(149285);
    var r = e.i(76992),
        n = e.i(221628),
        o = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, o) => {
            let l = (0, r.createSlot)("Primitive.".concat(o)),
                i = t.forwardRef((e, t) => {
                    let {
                        asChild: r,
                        ...i
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, n.jsx)(r ? l : o, {
                        ...i,
                        ref: t
                    })
                });
            return i.displayName = "Primitive.".concat(o), {
                ...e,
                [o]: i
            }
        }, {});
    e.s(["Primitive", 0, o])
}, 142953, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(174617),
        n = e.i(508785),
        o = e.i(78892),
        l = e.i(608652),
        i = e.i(40266),
        a = e.i(600317),
        s = e.i(886449),
        u = e.i(199786),
        c = e.i(974539),
        d = e.i(221628),
        f = "rovingFocusGroup.onEntryFocus",
        p = {
            bubbles: !1,
            cancelable: !0
        },
        m = "RovingFocusGroup",
        [v, h, g] = (0, n.createCollection)(m),
        [y, x] = (0, l.createContextScope)(m, [g]),
        [w, b] = y(m),
        C = t.forwardRef((e, t) => (0, d.jsx)(v.Provider, {
            scope: e.__scopeRovingFocusGroup,
            children: (0, d.jsx)(v.Slot, {
                scope: e.__scopeRovingFocusGroup,
                children: (0, d.jsx)(E, {
                    ...e,
                    ref: t
                })
            })
        }));
    C.displayName = m;
    var E = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: l,
                orientation: i,
                loop: v = !1,
                dir: g,
                currentTabStopId: y,
                defaultCurrentTabStopId: x,
                onCurrentTabStopIdChange: b,
                onEntryFocus: C,
                preventScrollOnEntryFocus: E = !1,
                ...S
            } = e, R = t.useRef(null), P = (0, o.useComposedRefs)(n, R), A = (0, c.useDirection)(g), [N, j] = (0, u.useControllableState)({
                prop: y,
                defaultProp: null != x ? x : null,
                onChange: b,
                caller: m
            }), [L, O] = t.useState(!1), k = (0, s.useCallbackRef)(C), M = h(l), D = t.useRef(!1), [I, H] = t.useState(0);
            return t.useEffect(() => {
                let e = R.current;
                if (e) return e.addEventListener(f, k), () => e.removeEventListener(f, k)
            }, [k]), (0, d.jsx)(w, {
                scope: l,
                orientation: i,
                dir: A,
                loop: v,
                currentTabStopId: N,
                onItemFocus: t.useCallback(e => j(e), [j]),
                onItemShiftTab: t.useCallback(() => O(!0), []),
                onFocusableItemAdd: t.useCallback(() => H(e => e + 1), []),
                onFocusableItemRemove: t.useCallback(() => H(e => e - 1), []),
                children: (0, d.jsx)(a.Primitive.div, {
                    tabIndex: L || 0 === I ? -1 : 0,
                    "data-orientation": i,
                    ...S,
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
                        if (e.target === e.currentTarget && t && !L) {
                            let t = new CustomEvent(f, p);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = M().filter(e => e.focusable);
                                T([e.find(e => e.active), e.find(e => e.id === N), ...e].filter(Boolean).map(e => e.ref.current), E)
                            }
                        }
                        D.current = !1
                    }),
                    onBlur: (0, r.composeEventHandlers)(e.onBlur, () => O(!1))
                })
            })
        }),
        S = "RovingFocusGroupItem",
        R = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: o,
                focusable: l = !0,
                active: s = !1,
                tabStopId: u,
                children: c,
                ...f
            } = e, p = (0, i.useId)(), m = u || p, g = b(S, o), y = g.currentTabStopId === m, x = h(o), {
                onFocusableItemAdd: w,
                onFocusableItemRemove: C,
                currentTabStopId: E
            } = g;
            return t.useEffect(() => {
                if (l) return w(), () => C()
            }, [l, w, C]), (0, d.jsx)(v.ItemSlot, {
                scope: o,
                id: m,
                focusable: l,
                active: s,
                children: (0, d.jsx)(a.Primitive.span, {
                    tabIndex: y ? 0 : -1,
                    "data-orientation": g.orientation,
                    ...f,
                    ref: n,
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, e => {
                        l ? g.onItemFocus(m) : e.preventDefault()
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, () => g.onItemFocus(m)),
                    onKeyDown: (0, r.composeEventHandlers)(e.onKeyDown, e => {
                        if ("Tab" === e.key && e.shiftKey) return void g.onItemShiftTab();
                        if (e.target !== e.currentTarget) return;
                        let t = function(e, t, r) {
                            var n;
                            let o = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                            if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return P[o]
                        }(e, g.orientation, g.dir);
                        if (void 0 !== t) {
                            if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                            e.preventDefault();
                            let o = x().filter(e => e.focusable).map(e => e.ref.current);
                            if ("last" === t) o.reverse();
                            else if ("prev" === t || "next" === t) {
                                var r, n;
                                "prev" === t && o.reverse();
                                let l = o.indexOf(e.currentTarget);
                                o = g.loop ? (r = o, n = l + 1, r.map((e, t) => r[(n + t) % r.length])) : o.slice(l + 1)
                            }
                            setTimeout(() => T(o))
                        }
                    }),
                    children: "function" == typeof c ? c({
                        isCurrentTabStop: y,
                        hasTabStop: null != E
                    }) : c
                })
            })
        });
    R.displayName = S;
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

    function T(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            r = document.activeElement;
        for (let n of e)
            if (n === r || (n.focus({
                    preventScroll: t
                }), document.activeElement !== r)) return
    }
    e.s(["Item", 0, R, "Root", 0, C, "createRovingFocusGroupScope", 0, x])
}, 76992, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(78892),
        n = e.i(221628),
        o = Symbol("radix.slottable");

    function l(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === o
    }
    e.s(["createSlot", 0, function(e) {
        var o;
        let i, a = (o = e, (i = t.forwardRef((e, n) => {
                let {
                    children: o,
                    ...l
                } = e;
                if (t.isValidElement(o)) {
                    var i, a, s;
                    let e, u, c = (u = (e = null == (a = Object.getOwnPropertyDescriptor((i = o).props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning) ? i.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                        d = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let o = e[n],
                                    l = t[n];
                                /^on[A-Z]/.test(n) ? o && l ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    let n = l(...t);
                                    return o(...t), n
                                } : o && (r[n] = o) : "style" === n ? r[n] = {
                                    ...o,
                                    ...l
                                } : "className" === n && (r[n] = [o, l].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(l, o.props);
                    return o.type !== t.Fragment && (d.ref = n ? (0, r.composeRefs)(n, c) : c), t.cloneElement(o, d)
                }
                return t.Children.count(o) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(o, ".SlotClone"), i),
            s = t.forwardRef((e, r) => {
                let {
                    children: o,
                    ...i
                } = e, s = t.Children.toArray(o), u = s.find(l);
                if (u) {
                    let e = u.props.children,
                        o = s.map(r => r !== u ? r : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, n.jsx)(a, {
                        ...i,
                        ref: r,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, o) : null
                    })
                }
                return (0, n.jsx)(a, {
                    ...i,
                    ref: r,
                    children: o
                })
            });
        return s.displayName = "".concat(e, ".Slot"), s
    }])
}, 199786, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(723570);
    t[" useEffectEvent ".trim().toString()], t[" useInsertionEffect ".trim().toString()];
    var n = t[" useInsertionEffect ".trim().toString()] || r.useLayoutEffect;
    Symbol("RADIX:SYNC_STATE"), e.s(["useControllableState", 0, function(e) {
        let {
            prop: r,
            defaultProp: o,
            onChange: l = () => {},
            caller: i
        } = e, [a, s, u] = function(e) {
            let {
                defaultProp: r,
                onChange: o
            } = e, [l, i] = t.useState(r), a = t.useRef(l), s = t.useRef(o);
            return n(() => {
                s.current = o
            }, [o]), t.useEffect(() => {
                if (a.current !== l) {
                    var e;
                    null == (e = s.current) || e.call(s, l), a.current = l
                }
            }, [l, a]), [l, i, s]
        }({
            defaultProp: o,
            onChange: l
        }), c = void 0 !== r, d = c ? r : a;
        {
            let e = t.useRef(void 0 !== r);
            t.useEffect(() => {
                let t = e.current;
                if (t !== c) {
                    let e = c ? "controlled" : "uncontrolled";
                    console.warn("".concat(i, " is changing from ").concat(t ? "controlled" : "uncontrolled", " to ").concat(e, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                }
                e.current = c
            }, [c, i])
        }
        return [d, t.useCallback(e => {
            if (c) {
                let n = "function" == typeof e ? e(r) : e;
                if (n !== r) {
                    var t;
                    null == (t = u.current) || t.call(u, n)
                }
            } else s(e)
        }, [c, r, s, u])]
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
        let [n, o] = t.useState(void 0);
        return (0, r.useLayoutEffect)(() => {
            if (e) {
                o({
                    width: e.offsetWidth,
                    height: e.offsetHeight
                });
                let t = new ResizeObserver(t => {
                    let r, n;
                    if (!Array.isArray(t) || !t.length) return;
                    let l = t[0];
                    if ("borderBoxSize" in l) {
                        let e = l.borderBoxSize,
                            t = Array.isArray(e) ? e[0] : e;
                        r = t.inlineSize, n = t.blockSize
                    } else r = e.offsetWidth, n = e.offsetHeight;
                    o({
                        width: r,
                        height: n
                    })
                });
                return t.observe(e, {
                    box: "border-box"
                }), () => t.unobserve(e)
            }
            o(void 0)
        }, [e]), n
    }])
}, 316413, 563921, e => {
    "use strict";
    var t = e.i(140625),
        r = e.i(408832),
        n = e.i(148380),
        o = e.i(750615),
        l = e.i(197649),
        i = e.i(416340),
        a = e.i(149285),
        s = e.i(305607),
        u = e.i(19655),
        c = e.i(539206),
        d = e.i(78892),
        f = e.i(608652),
        p = e.i(974539),
        m = e.i(598943),
        v = e.i(793808),
        h = e.i(44265),
        g = e.i(40266),
        y = e.i(524887),
        x = e.i(763960),
        w = e.i(594278),
        b = e.i(699704),
        C = e.i(886449),
        E = e.i(428156),
        S = e.i(723570),
        R = e.i(300792),
        P = e.i(221628),
        T = i.forwardRef((e, t) => (0, P.jsx)(w.Primitive.span, {
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
    T.displayName = "VisuallyHidden";
    var A = e.i(3300),
        N = e.i(813593),
        j = [" ", "Enter", "ArrowUp", "ArrowDown"],
        L = [" ", "Enter"],
        O = "Select",
        [k, M, D] = (0, c.createCollection)(O),
        [I, H] = (0, f.createContextScope)(O, [D, y.createPopperScope]),
        _ = (0, y.createPopperScope)(),
        [F, B] = I(O),
        [W, z] = I(O),
        V = e => {
            let {
                __scopeSelect: t,
                children: r,
                open: n,
                defaultOpen: o,
                onOpenChange: l,
                value: a,
                defaultValue: s,
                onValueChange: u,
                dir: c,
                name: d,
                autoComplete: f,
                disabled: m,
                required: v,
                form: h
            } = e, x = _(t), [w, b] = i.useState(null), [C, S] = i.useState(null), [R, T] = i.useState(!1), A = (0, p.useDirection)(c), [N = !1, j] = (0, E.useControllableState)({
                prop: n,
                defaultProp: o,
                onChange: l
            }), [L, O] = (0, E.useControllableState)({
                prop: a,
                defaultProp: s,
                onChange: u
            }), M = i.useRef(null), D = !w || h || !!w.closest("form"), [I, H] = i.useState(new Set), B = Array.from(I).map(e => e.props.value).join(";");
            return (0, P.jsx)(y.Root, {
                ...x,
                children: (0, P.jsxs)(F, {
                    required: v,
                    scope: t,
                    trigger: w,
                    onTriggerChange: b,
                    valueNode: C,
                    onValueNodeChange: S,
                    valueNodeHasChildren: R,
                    onValueNodeHasChildrenChange: T,
                    contentId: (0, g.useId)(),
                    value: L,
                    onValueChange: O,
                    open: N,
                    onOpenChange: j,
                    dir: A,
                    triggerPointerDownPosRef: M,
                    disabled: m,
                    children: [(0, P.jsx)(k.Provider, {
                        scope: t,
                        children: (0, P.jsx)(W, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: i.useCallback(e => {
                                H(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: i.useCallback(e => {
                                H(t => {
                                    let r = new Set(t);
                                    return r.delete(e), r
                                })
                            }, []),
                            children: r
                        })
                    }), D ? (0, P.jsxs)(eS, {
                        "aria-hidden": !0,
                        required: v,
                        tabIndex: -1,
                        name: d,
                        autoComplete: f,
                        value: L,
                        onChange: e => O(e.target.value),
                        disabled: m,
                        form: h,
                        children: [void 0 === L ? (0, P.jsx)("option", {
                            value: ""
                        }) : null, Array.from(I)]
                    }, B) : null]
                })
            })
        };
    V.displayName = O;
    var U = "SelectTrigger",
        K = i.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                disabled: n = !1,
                ...o
            } = e, l = _(r), a = B(U, r), s = a.disabled || n, c = (0, d.useComposedRefs)(t, a.onTriggerChange), f = M(r), p = i.useRef("touch"), [m, v, h] = eR(e => {
                let t = f().filter(e => !e.disabled),
                    r = t.find(e => e.value === a.value),
                    n = eP(t, e, r);
                void 0 !== n && a.onValueChange(n.value)
            }), g = e => {
                s || (a.onOpenChange(!0), h()), e && (a.triggerPointerDownPosRef.current = {
                    x: Math.round(e.pageX),
                    y: Math.round(e.pageY)
                })
            };
            return (0, P.jsx)(y.Anchor, {
                asChild: !0,
                ...l,
                children: (0, P.jsx)(w.Primitive.button, {
                    type: "button",
                    role: "combobox",
                    "aria-controls": a.contentId,
                    "aria-expanded": a.open,
                    "aria-required": a.required,
                    "aria-autocomplete": "none",
                    dir: a.dir,
                    "data-state": a.open ? "open" : "closed",
                    disabled: s,
                    "data-disabled": s ? "" : void 0,
                    "data-placeholder": eE(a.value) ? "" : void 0,
                    ...o,
                    ref: c,
                    onClick: (0, u.composeEventHandlers)(o.onClick, e => {
                        e.currentTarget.focus(), "mouse" !== p.current && g(e)
                    }),
                    onPointerDown: (0, u.composeEventHandlers)(o.onPointerDown, e => {
                        p.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (g(e), e.preventDefault())
                    }),
                    onKeyDown: (0, u.composeEventHandlers)(o.onKeyDown, e => {
                        let t = "" !== m.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || v(e.key), (!t || " " !== e.key) && j.includes(e.key) && (g(), e.preventDefault())
                    })
                })
            })
        });
    K.displayName = U;
    var X = "SelectValue",
        Y = i.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: n,
                style: o,
                children: l,
                placeholder: i = "",
                ...a
            } = e, s = B(X, r), {
                onValueNodeHasChildrenChange: u
            } = s, c = void 0 !== l, f = (0, d.useComposedRefs)(t, s.onValueNodeChange);
            return (0, S.useLayoutEffect)(() => {
                u(c)
            }, [u, c]), (0, P.jsx)(w.Primitive.span, {
                ...a,
                ref: f,
                style: {
                    pointerEvents: "none"
                },
                children: eE(s.value) ? (0, P.jsx)(P.Fragment, {
                    children: i
                }) : l
            })
        });
    Y.displayName = X;
    var G = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            children: n,
            ...o
        } = e;
        return (0, P.jsx)(w.Primitive.span, {
            "aria-hidden": !0,
            ...o,
            ref: t,
            children: n || "▼"
        })
    });
    G.displayName = "SelectIcon";
    var q = e => (0, P.jsx)(x.Portal, {
        asChild: !0,
        ...e
    });
    q.displayName = "SelectPortal";
    var Z = "SelectContent",
        $ = i.forwardRef((e, t) => {
            let r = B(Z, e.__scopeSelect),
                [n, o] = i.useState();
            return ((0, S.useLayoutEffect)(() => {
                o(new DocumentFragment)
            }, []), r.open) ? (0, P.jsx)(et, {
                ...e,
                ref: t
            }) : n ? a.createPortal((0, P.jsx)(J, {
                scope: e.__scopeSelect,
                children: (0, P.jsx)(k.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, P.jsx)("div", {
                        children: e.children
                    })
                })
            }), n) : null
        });
    $.displayName = Z;
    var [J, Q] = I(Z), ee = (0, b.createSlot)("SelectContent.RemoveScroll"), et = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            position: n = "item-aligned",
            onCloseAutoFocus: o,
            onEscapeKeyDown: l,
            onPointerDownOutside: a,
            side: s,
            sideOffset: c,
            align: f,
            alignOffset: p,
            arrowPadding: g,
            collisionBoundary: y,
            collisionPadding: x,
            sticky: w,
            hideWhenDetached: b,
            avoidCollisions: C,
            ...E
        } = e, S = B(Z, r), [R, T] = i.useState(null), [j, L] = i.useState(null), O = (0, d.useComposedRefs)(t, e => T(e)), [k, D] = i.useState(null), [I, H] = i.useState(null), _ = M(r), [F, W] = i.useState(!1), z = i.useRef(!1);
        i.useEffect(() => {
            if (R) return (0, A.hideOthers)(R)
        }, [R]), (0, v.useFocusGuards)();
        let V = i.useCallback(e => {
                let [t, ...r] = _().map(e => e.ref.current), [n] = r.slice(-1), o = document.activeElement;
                for (let r of e)
                    if (r === o || (null == r || r.scrollIntoView({
                            block: "nearest"
                        }), r === t && j && (j.scrollTop = 0), r === n && j && (j.scrollTop = j.scrollHeight), null == r || r.focus(), document.activeElement !== o)) return
            }, [_, j]),
            U = i.useCallback(() => V([k, R]), [V, k, R]);
        i.useEffect(() => {
            F && U()
        }, [F, U]);
        let {
            onOpenChange: K,
            triggerPointerDownPosRef: X
        } = S;
        i.useEffect(() => {
            if (R) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        var r, n, o, l;
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (null != (r = null == (o = X.current) ? void 0 : o.x) ? r : 0)),
                            y: Math.abs(Math.round(t.pageY) - (null != (n = null == (l = X.current) ? void 0 : l.y) ? n : 0))
                        }
                    },
                    r = r => {
                        e.x <= 10 && e.y <= 10 ? r.preventDefault() : R.contains(r.target) || K(!1), document.removeEventListener("pointermove", t), X.current = null
                    };
                return null !== X.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                        capture: !0
                    })
                }
            }
        }, [R, K, X]), i.useEffect(() => {
            let e = () => K(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [K]);
        let [Y, G] = eR(e => {
            let t = _().filter(e => !e.disabled),
                r = t.find(e => e.ref.current === document.activeElement),
                n = eP(t, e, r);
            n && setTimeout(() => n.ref.current.focus())
        }), q = i.useCallback((e, t, r) => {
            let n = !z.current && !r;
            (void 0 !== S.value && S.value === t || n) && (D(e), n && (z.current = !0))
        }, [S.value]), $ = i.useCallback(() => null == R ? void 0 : R.focus(), [R]), Q = i.useCallback((e, t, r) => {
            let n = !z.current && !r;
            (void 0 !== S.value && S.value === t || n) && H(e)
        }, [S.value]), et = "popper" === n ? en : er, eo = et === en ? {
            side: s,
            sideOffset: c,
            align: f,
            alignOffset: p,
            arrowPadding: g,
            collisionBoundary: y,
            collisionPadding: x,
            sticky: w,
            hideWhenDetached: b,
            avoidCollisions: C
        } : {};
        return (0, P.jsx)(J, {
            scope: r,
            content: R,
            viewport: j,
            onViewportChange: L,
            itemRefCallback: q,
            selectedItem: k,
            onItemLeave: $,
            itemTextRefCallback: Q,
            focusSelectedItem: U,
            selectedItemText: I,
            position: n,
            isPositioned: F,
            searchRef: Y,
            children: (0, P.jsx)(N.RemoveScroll, {
                as: ee,
                allowPinchZoom: !0,
                children: (0, P.jsx)(h.FocusScope, {
                    asChild: !0,
                    trapped: S.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: (0, u.composeEventHandlers)(o, e => {
                        var t;
                        null == (t = S.trigger) || t.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, P.jsx)(m.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !0,
                        onEscapeKeyDown: l,
                        onPointerDownOutside: a,
                        onFocusOutside: e => e.preventDefault(),
                        onDismiss: () => S.onOpenChange(!1),
                        children: (0, P.jsx)(et, {
                            role: "listbox",
                            id: S.contentId,
                            "data-state": S.open ? "open" : "closed",
                            dir: S.dir,
                            onContextMenu: e => e.preventDefault(),
                            ...E,
                            ...eo,
                            onPlaced: () => W(!0),
                            ref: O,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...E.style
                            },
                            onKeyDown: (0, u.composeEventHandlers)(E.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || G(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = _().filter(e => !e.disabled).map(e => e.ref.current);
                                    if (["ArrowUp", "End"].includes(e.key) && (t = t.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                        let r = e.target,
                                            n = t.indexOf(r);
                                        t = t.slice(n + 1)
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
    et.displayName = "SelectContentImpl";
    var er = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onPlaced: n,
            ...o
        } = e, l = B(Z, r), a = Q(Z, r), [u, c] = i.useState(null), [f, p] = i.useState(null), m = (0, d.useComposedRefs)(t, e => p(e)), v = M(r), h = i.useRef(!1), g = i.useRef(!0), {
            viewport: y,
            selectedItem: x,
            selectedItemText: b,
            focusSelectedItem: C
        } = a, E = i.useCallback(() => {
            if (l.trigger && l.valueNode && u && f && y && x && b) {
                let e = l.trigger.getBoundingClientRect(),
                    t = f.getBoundingClientRect(),
                    r = l.valueNode.getBoundingClientRect(),
                    o = b.getBoundingClientRect();
                if ("rtl" !== l.dir) {
                    let n = o.left - t.left,
                        l = r.left - n,
                        i = e.left - l,
                        a = e.width + i,
                        c = Math.max(a, t.width),
                        d = window.innerWidth - 10,
                        f = (0, s.clamp)(l, [10, Math.max(10, d - c)]);
                    u.style.minWidth = a + "px", u.style.left = f + "px"
                } else {
                    let n = t.right - o.right,
                        l = window.innerWidth - r.right - n,
                        i = window.innerWidth - e.right - l,
                        a = e.width + i,
                        c = Math.max(a, t.width),
                        d = window.innerWidth - 10,
                        f = (0, s.clamp)(l, [10, Math.max(10, d - c)]);
                    u.style.minWidth = a + "px", u.style.right = f + "px"
                }
                let i = v(),
                    a = window.innerHeight - 20,
                    c = y.scrollHeight,
                    d = window.getComputedStyle(f),
                    p = parseInt(d.borderTopWidth, 10),
                    m = parseInt(d.paddingTop, 10),
                    g = parseInt(d.borderBottomWidth, 10),
                    w = p + m + c + parseInt(d.paddingBottom, 10) + g,
                    C = Math.min(5 * x.offsetHeight, w),
                    E = window.getComputedStyle(y),
                    S = parseInt(E.paddingTop, 10),
                    R = parseInt(E.paddingBottom, 10),
                    P = e.top + e.height / 2 - 10,
                    T = x.offsetHeight / 2,
                    A = p + m + (x.offsetTop + T);
                if (A <= P) {
                    let e = i.length > 0 && x === i[i.length - 1].ref.current;
                    u.style.bottom = "0px";
                    let t = Math.max(a - P, T + (e ? R : 0) + (f.clientHeight - y.offsetTop - y.offsetHeight) + g);
                    u.style.height = A + t + "px"
                } else {
                    let e = i.length > 0 && x === i[0].ref.current;
                    u.style.top = "0px";
                    let t = Math.max(P, p + y.offsetTop + (e ? S : 0) + T);
                    u.style.height = t + (w - A) + "px", y.scrollTop = A - P + y.offsetTop
                }
                u.style.margin = "".concat(10, "px 0"), u.style.minHeight = C + "px", u.style.maxHeight = a + "px", null == n || n(), requestAnimationFrame(() => h.current = !0)
            }
        }, [v, l.trigger, l.valueNode, u, f, y, x, b, l.dir, n]);
        (0, S.useLayoutEffect)(() => E(), [E]);
        let [R, T] = i.useState();
        (0, S.useLayoutEffect)(() => {
            f && T(window.getComputedStyle(f).zIndex)
        }, [f]);
        let A = i.useCallback(e => {
            e && !0 === g.current && (E(), null == C || C(), g.current = !1)
        }, [E, C]);
        return (0, P.jsx)(eo, {
            scope: r,
            contentWrapper: u,
            shouldExpandOnScrollRef: h,
            onScrollButtonChange: A,
            children: (0, P.jsx)("div", {
                ref: c,
                style: {
                    display: "flex",
                    flexDirection: "column",
                    position: "fixed",
                    zIndex: R
                },
                children: (0, P.jsx)(w.Primitive.div, {
                    ...o,
                    ref: m,
                    style: {
                        boxSizing: "border-box",
                        maxHeight: "100%",
                        ...o.style
                    }
                })
            })
        })
    });
    er.displayName = "SelectItemAlignedPosition";
    var en = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            align: n = "start",
            collisionPadding: o = 10,
            ...l
        } = e, i = _(r);
        return (0, P.jsx)(y.Content, {
            ...i,
            ...l,
            ref: t,
            align: n,
            collisionPadding: o,
            style: {
                boxSizing: "border-box",
                ...l.style,
                "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
            }
        })
    });
    en.displayName = "SelectPopperPosition";
    var [eo, el] = I(Z, {}), ei = "SelectViewport", ea = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            nonce: n,
            ...o
        } = e, l = Q(ei, r), a = el(ei, r), s = (0, d.useComposedRefs)(t, l.onViewportChange), c = i.useRef(0);
        return (0, P.jsxs)(P.Fragment, {
            children: [(0, P.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: n
            }), (0, P.jsx)(k.Slot, {
                scope: r,
                children: (0, P.jsx)(w.Primitive.div, {
                    "data-radix-select-viewport": "",
                    role: "presentation",
                    ...o,
                    ref: s,
                    style: {
                        position: "relative",
                        flex: 1,
                        overflow: "hidden auto",
                        ...o.style
                    },
                    onScroll: (0, u.composeEventHandlers)(o.onScroll, e => {
                        let t = e.currentTarget,
                            {
                                contentWrapper: r,
                                shouldExpandOnScrollRef: n
                            } = a;
                        if ((null == n ? void 0 : n.current) && r) {
                            let e = Math.abs(c.current - t.scrollTop);
                            if (e > 0) {
                                let n = window.innerHeight - 20,
                                    o = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                if (o < n) {
                                    let l = o + e,
                                        i = Math.min(n, l),
                                        a = l - i;
                                    r.style.height = i + "px", "0px" === r.style.bottom && (t.scrollTop = a > 0 ? a : 0, r.style.justifyContent = "flex-end")
                                }
                            }
                        }
                        c.current = t.scrollTop
                    })
                })
            })]
        })
    });
    ea.displayName = ei;
    var es = "SelectGroup",
        [eu, ec] = I(es);
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, o = (0, g.useId)();
        return (0, P.jsx)(eu, {
            scope: r,
            id: o,
            children: (0, P.jsx)(w.Primitive.div, {
                role: "group",
                "aria-labelledby": o,
                ...n,
                ref: t
            })
        })
    }).displayName = es;
    var ed = "SelectLabel";
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, o = ec(ed, r);
        return (0, P.jsx)(w.Primitive.div, {
            id: o.id,
            ...n,
            ref: t
        })
    }).displayName = ed;
    var ef = "SelectItem",
        [ep, em] = I(ef),
        ev = i.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                value: n,
                disabled: o = !1,
                textValue: l,
                ...a
            } = e, s = B(ef, r), c = Q(ef, r), f = s.value === n, [p, m] = i.useState(null != l ? l : ""), [v, h] = i.useState(!1), y = (0, d.useComposedRefs)(t, e => {
                var t;
                return null == (t = c.itemRefCallback) ? void 0 : t.call(c, e, n, o)
            }), x = (0, g.useId)(), b = i.useRef("touch"), C = () => {
                o || (s.onValueChange(n), s.onOpenChange(!1))
            };
            if ("" === n) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, P.jsx)(ep, {
                scope: r,
                value: n,
                disabled: o,
                textId: x,
                isSelected: f,
                onItemTextChange: i.useCallback(e => {
                    m(t => {
                        var r;
                        return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                    })
                }, []),
                children: (0, P.jsx)(k.ItemSlot, {
                    scope: r,
                    value: n,
                    disabled: o,
                    textValue: p,
                    children: (0, P.jsx)(w.Primitive.div, {
                        role: "option",
                        "aria-labelledby": x,
                        "data-highlighted": v ? "" : void 0,
                        "aria-selected": f && v,
                        "data-state": f ? "checked" : "unchecked",
                        "aria-disabled": o || void 0,
                        "data-disabled": o ? "" : void 0,
                        tabIndex: o ? void 0 : -1,
                        ...a,
                        ref: y,
                        onFocus: (0, u.composeEventHandlers)(a.onFocus, () => h(!0)),
                        onBlur: (0, u.composeEventHandlers)(a.onBlur, () => h(!1)),
                        onClick: (0, u.composeEventHandlers)(a.onClick, () => {
                            "mouse" !== b.current && C()
                        }),
                        onPointerUp: (0, u.composeEventHandlers)(a.onPointerUp, () => {
                            "mouse" === b.current && C()
                        }),
                        onPointerDown: (0, u.composeEventHandlers)(a.onPointerDown, e => {
                            b.current = e.pointerType
                        }),
                        onPointerMove: (0, u.composeEventHandlers)(a.onPointerMove, e => {
                            if (b.current = e.pointerType, o) {
                                var t;
                                null == (t = c.onItemLeave) || t.call(c)
                            } else "mouse" === b.current && e.currentTarget.focus({
                                preventScroll: !0
                            })
                        }),
                        onPointerLeave: (0, u.composeEventHandlers)(a.onPointerLeave, e => {
                            if (e.currentTarget === document.activeElement) {
                                var t;
                                null == (t = c.onItemLeave) || t.call(c)
                            }
                        }),
                        onKeyDown: (0, u.composeEventHandlers)(a.onKeyDown, e => {
                            var t;
                            ((null == (t = c.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (L.includes(e.key) && C(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    ev.displayName = ef;
    var eh = "SelectItemText",
        eg = i.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: n,
                style: o,
                ...l
            } = e, s = B(eh, r), u = Q(eh, r), c = em(eh, r), f = z(eh, r), [p, m] = i.useState(null), v = (0, d.useComposedRefs)(t, e => m(e), c.onItemTextChange, e => {
                var t;
                return null == (t = u.itemTextRefCallback) ? void 0 : t.call(u, e, c.value, c.disabled)
            }), h = null == p ? void 0 : p.textContent, g = i.useMemo(() => (0, P.jsx)("option", {
                value: c.value,
                disabled: c.disabled,
                children: h
            }, c.value), [c.disabled, c.value, h]), {
                onNativeOptionAdd: y,
                onNativeOptionRemove: x
            } = f;
            return (0, S.useLayoutEffect)(() => (y(g), () => x(g)), [y, x, g]), (0, P.jsxs)(P.Fragment, {
                children: [(0, P.jsx)(w.Primitive.span, {
                    id: c.textId,
                    ...l,
                    ref: v
                }), c.isSelected && s.valueNode && !s.valueNodeHasChildren ? a.createPortal(l.children, s.valueNode) : null]
            })
        });
    eg.displayName = eh;
    var ey = "SelectItemIndicator";
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e;
        return em(ey, r).isSelected ? (0, P.jsx)(w.Primitive.span, {
            "aria-hidden": !0,
            ...n,
            ref: t
        }) : null
    }).displayName = ey;
    var ex = "SelectScrollUpButton";
    i.forwardRef((e, t) => {
        let r = Q(ex, e.__scopeSelect),
            n = el(ex, e.__scopeSelect),
            [o, l] = i.useState(!1),
            a = (0, d.useComposedRefs)(t, n.onScrollButtonChange);
        return (0, S.useLayoutEffect)(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        l(t.scrollTop > 0)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), o ? (0, P.jsx)(eb, {
            ...e,
            ref: a,
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
    i.forwardRef((e, t) => {
        let r = Q(ew, e.__scopeSelect),
            n = el(ew, e.__scopeSelect),
            [o, l] = i.useState(!1),
            a = (0, d.useComposedRefs)(t, n.onScrollButtonChange);
        return (0, S.useLayoutEffect)(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        l(Math.ceil(t.scrollTop) < e)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), o ? (0, P.jsx)(eb, {
            ...e,
            ref: a,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = r;
                e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
            }
        }) : null
    }).displayName = ew;
    var eb = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onAutoScroll: n,
            ...o
        } = e, l = Q("SelectScrollButton", r), a = i.useRef(null), s = M(r), c = i.useCallback(() => {
            null !== a.current && (window.clearInterval(a.current), a.current = null)
        }, []);
        return i.useEffect(() => () => c(), [c]), (0, S.useLayoutEffect)(() => {
            var e;
            let t = s().find(e => e.ref.current === document.activeElement);
            null == t || null == (e = t.ref.current) || e.scrollIntoView({
                block: "nearest"
            })
        }, [s]), (0, P.jsx)(w.Primitive.div, {
            "aria-hidden": !0,
            ...o,
            ref: t,
            style: {
                flexShrink: 0,
                ...o.style
            },
            onPointerDown: (0, u.composeEventHandlers)(o.onPointerDown, () => {
                null === a.current && (a.current = window.setInterval(n, 50))
            }),
            onPointerMove: (0, u.composeEventHandlers)(o.onPointerMove, () => {
                var e;
                null == (e = l.onItemLeave) || e.call(l), null === a.current && (a.current = window.setInterval(n, 50))
            }),
            onPointerLeave: (0, u.composeEventHandlers)(o.onPointerLeave, () => {
                c()
            })
        })
    });
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e;
        return (0, P.jsx)(w.Primitive.div, {
            "aria-hidden": !0,
            ...n,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var eC = "SelectArrow";

    function eE(e) {
        return "" === e || void 0 === e
    }
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, o = _(r), l = B(eC, r), i = Q(eC, r);
        return l.open && "popper" === i.position ? (0, P.jsx)(y.Arrow, {
            ...o,
            ...n,
            ref: t
        }) : null
    }).displayName = eC;
    var eS = i.forwardRef((e, t) => {
        let {
            value: r,
            ...n
        } = e, o = i.useRef(null), l = (0, d.useComposedRefs)(t, o), a = (0, R.usePrevious)(r);
        return i.useEffect(() => {
            let e = o.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
            if (a !== r && t) {
                let n = new Event("change", {
                    bubbles: !0
                });
                t.call(e, r), e.dispatchEvent(n)
            }
        }, [a, r]), (0, P.jsx)(T, {
            asChild: !0,
            children: (0, P.jsx)("select", {
                ...n,
                ref: l,
                defaultValue: r
            })
        })
    });

    function eR(e) {
        let t = (0, C.useCallbackRef)(e),
            r = i.useRef(""),
            n = i.useRef(0),
            o = i.useCallback(e => {
                let o = r.current + e;
                t(o),
                    function e(t) {
                        r.current = t, window.clearTimeout(n.current), "" !== t && (n.current = window.setTimeout(() => e(""), 1e3))
                    }(o)
            }, [t]),
            l = i.useCallback(() => {
                r.current = "", window.clearTimeout(n.current)
            }, []);
        return i.useEffect(() => () => window.clearTimeout(n.current), []), [r, o, l]
    }

    function eP(e, t, r) {
        var n, o;
        let l = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            i = r ? e.indexOf(r) : -1,
            a = (n = e, o = Math.max(i, 0), n.map((e, t) => n[(o + t) % n.length]));
        1 === l.length && (a = a.filter(e => e !== r));
        let s = a.find(e => e.textValue.toLowerCase().startsWith(l.toLowerCase()));
        return s !== r ? s : void 0
    }
    eS.displayName = "BubbleSelect", e.s(["Content", 0, $, "Icon", 0, G, "Item", 0, ev, "ItemText", 0, eg, "Portal", 0, q, "Root", 0, V, "Trigger", 0, K, "Value", 0, Y, "Viewport", 0, ea], 563921);
    let eT = (0, i.createContext)(null),
        eA = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        eN = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        ej = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        eL = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        eO = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        ek = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        eM = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        eD = (0, i.forwardRef)((e, a) => {
            let {
                label: s,
                labelTooltip: u,
                ariaLabelledBy: c,
                ariaLabel: d,
                className: f,
                size: p,
                variant: m = "Standard",
                value: v,
                placeholder: h,
                isDisabled: g,
                hasError: y,
                hint: x,
                onValueChange: w,
                onOpenChange: b,
                children: C
            } = e, E = (0, r.default)(), S = (0, i.useMemo)(() => ({
                size: p
            }), [p]), R = s ? i.default.createElement("span", {
                id: E,
                className: (0, l.default)(ej[p], "content-emphasis")
            }, s) : null;
            return i.default.createElement(eT.Provider, {
                value: S
            }, i.default.createElement("div", {
                className: (0, l.default)("flex flex-col", g && ["opacity-[0.5]", "pointer-events-none"], eO[p], f)
            }, R && (u ? i.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, R, i.default.createElement(n.LabelTooltip, u)) : R), i.default.createElement(V, {
                value: v,
                disabled: g,
                onValueChange: w,
                onOpenChange: b
            }, i.default.createElement(K, {
                className: (0, l.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", o.INPUT_BACKGROUND_BY_VARIANT[m], o.INPUT_STROKE_BY_VARIANT[m], ek[p], eM[p], eN[p], eL[p], y ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === v ? "content-muted" : "content-default"),
                ref: a,
                "aria-labelledby": s ? E : c,
                "aria-label": d
            }, i.default.createElement(t.StateLayer, null), i.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, i.default.createElement(Y, {
                placeholder: h
            })), i.default.createElement(G, {
                className: (0, l.default)(eA[p], "icon icon-regular-chevron-large-down content-default")
            })), i.default.createElement(q, null, i.default.createElement($, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, C))), x && i.default.createElement("span", {
                className: (0, l.default)("text-caption-small", {
                    "content-system-alert": y,
                    "content-default": !y
                })
            }, x)))
        });
    eD.displayName = "Dropdown", e.s(["Dropdown", 0, eD, "DropdownContext", 0, eT], 316413)
}, 95899, e => {
    "use strict";
    var t = e.i(140625),
        r = e.i(316413),
        n = e.i(197649),
        o = e.i(416340),
        l = e.i(23342),
        i = e.i(563921),
        a = e.i(142953);
    let s = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        u = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        c = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        d = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        f = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        p = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        m = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        v = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        h = (0, o.createContext)(null),
        g = () => {
            let e = (0, o.useContext)(h);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        var t;
        let {
            children: l,
            className: u,
            size: c
        } = e, d = (0, o.useContext)(r.DropdownContext), f = d ? "dropdown" : "standalone", p = null != (t = null != c ? c : null == d ? void 0 : d.size) ? t : "Medium", m = (0, o.useMemo)(() => ({
            size: p,
            mode: f
        }), [p, f]), v = (0, n.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", s[p], u), g = "standalone" === f ? o.default.createElement(a.Root, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, o.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: v
        }, l)) : o.default.createElement("div", {
            className: v
        }, l);
        return o.default.createElement(h.Provider, {
            value: m
        }, "dropdown" === f ? o.default.createElement(i.Viewport, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, g) : g)
    }, "MenuItem", 0, e => {
        let r, {
                value: s,
                leading: u,
                title: h,
                description: y,
                trailing: x,
                disabled: w,
                className: b,
                onSelect: C,
                asChild: E,
                children: S,
                ...R
            } = e,
            {
                size: P,
                mode: T
            } = g(),
            A = (0, n.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", m[P], c[P], d[P], f[P], v[P], w && "opacity-[0.5]", w && "pointer-events-none", b),
            N = o.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, h);
        switch (T) {
            case "dropdown":
                N = o.default.createElement(i.ItemText, {
                    asChild: !0
                }, N);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", T)
        }
        let j = o.default.createElement(o.default.Fragment, null, !w && o.default.createElement(t.StateLayer, null), u, o.default.createElement("div", {
            className: (0, n.default)("grow-1 text-truncate-split flex flex-col", p[P])
        }, N, y && o.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, y)), x);
        if (E) {
            let {
                as: e,
                ...n
            } = R, i = o.default.Children.only(S), a = void 0 === h && i.props.children;
            r = o.default.createElement(l.Slot, {
                ...n,
                role: "standalone" === T ? "menuitem" : void 0,
                "aria-disabled": w || void 0,
                className: A,
                style: {
                    outlineOffset: 0
                },
                onClick: w ? void 0 : C
            }, a ? o.default.cloneElement(i, {}, o.default.createElement(o.default.Fragment, null, !w && o.default.createElement(t.StateLayer, null), i.props.children)) : o.default.cloneElement(i, {}, j))
        } else if ("a" === R.as) {
            let {
                as: e,
                href: t,
                ...n
            } = R;
            r = o.default.createElement("a", {
                ...n,
                role: "standalone" === T ? "menuitem" : void 0,
                "aria-disabled": w,
                href: w ? void 0 : t,
                className: A,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: w ? void 0 : C
            }, j)
        } else {
            let {
                as: e,
                ...t
            } = R;
            r = o.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === T ? "menuitem" : void 0,
                "aria-disabled": w,
                className: A,
                style: {
                    outlineOffset: 0
                },
                onClick: w ? void 0 : C
            }, j)
        }
        return "dropdown" === T ? o.default.createElement(i.Item, {
            value: s,
            disabled: w,
            asChild: !0
        }, r) : o.default.createElement(a.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: s
        }, r)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: r,
            leading: l,
            trailing: i,
            disabled: a,
            className: s
        } = e, {
            size: u
        } = g(), v = (0, n.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", m[u], c[u], d[u], f[u], a && "opacity-[0.5]", s);
        return o.default.createElement("div", {
            role: "none",
            className: v
        }, l, o.default.createElement("div", {
            className: (0, n.default)("grow-1 text-truncate-split flex flex-col", p[u])
        }, o.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), r && o.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, r)), i)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: r
        } = e, {
            size: l
        } = g();
        return o.default.createElement("div", {
            role: "group",
            className: (0, n.default)(u[l], r)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return o.default.createElement("div", {
            role: "separator",
            className: (0, n.default)("foundation-web-menu-separator", t)
        })
    }])
}, 905943, 734463, e => {
    "use strict";
    var t = e.i(197649),
        r = e.i(416340),
        n = e.i(19655),
        o = e.i(78892),
        l = e.i(608652),
        i = e.i(598943),
        a = e.i(793808),
        s = e.i(44265),
        u = e.i(40266),
        c = e.i(524887),
        d = e.i(763960),
        f = e.i(226972),
        p = e.i(594278),
        m = e.i(699704),
        v = e.i(428156),
        h = e.i(3300),
        g = e.i(813593),
        y = e.i(221628),
        x = "Popover",
        [w, b] = (0, l.createContextScope)(x, [c.createPopperScope]),
        C = (0, c.createPopperScope)(),
        [E, S] = w(x),
        R = e => {
            let {
                __scopePopover: t,
                children: n,
                open: o,
                defaultOpen: l,
                onOpenChange: i,
                modal: a = !1
            } = e, s = C(t), d = r.useRef(null), [f, p] = r.useState(!1), [m = !1, h] = (0, v.useControllableState)({
                prop: o,
                defaultProp: l,
                onChange: i
            });
            return (0, y.jsx)(c.Root, {
                ...s,
                children: (0, y.jsx)(E, {
                    scope: t,
                    contentId: (0, u.useId)(),
                    triggerRef: d,
                    open: m,
                    onOpenChange: h,
                    onOpenToggle: r.useCallback(() => h(e => !e), [h]),
                    hasCustomAnchor: f,
                    onCustomAnchorAdd: r.useCallback(() => p(!0), []),
                    onCustomAnchorRemove: r.useCallback(() => p(!1), []),
                    modal: a,
                    children: n
                })
            })
        };
    R.displayName = x;
    var P = "PopoverAnchor",
        T = r.forwardRef((e, t) => {
            let {
                __scopePopover: n,
                ...o
            } = e, l = S(P, n), i = C(n), {
                onCustomAnchorAdd: a,
                onCustomAnchorRemove: s
            } = l;
            return r.useEffect(() => (a(), () => s()), [a, s]), (0, y.jsx)(c.Anchor, {
                ...i,
                ...o,
                ref: t
            })
        });
    T.displayName = P;
    var A = "PopoverTrigger",
        N = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...l
            } = e, i = S(A, r), a = C(r), s = (0, o.useComposedRefs)(t, i.triggerRef), u = (0, y.jsx)(p.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": i.open,
                "aria-controls": i.contentId,
                "data-state": V(i.open),
                ...l,
                ref: s,
                onClick: (0, n.composeEventHandlers)(e.onClick, i.onOpenToggle)
            });
            return i.hasCustomAnchor ? u : (0, y.jsx)(c.Anchor, {
                asChild: !0,
                ...a,
                children: u
            })
        });
    N.displayName = A;
    var j = "PopoverPortal",
        [L, O] = w(j, {
            forceMount: void 0
        }),
        k = e => {
            let {
                __scopePopover: t,
                forceMount: r,
                children: n,
                container: o
            } = e, l = S(j, t);
            return (0, y.jsx)(L, {
                scope: t,
                forceMount: r,
                children: (0, y.jsx)(f.Presence, {
                    present: r || l.open,
                    children: (0, y.jsx)(d.Portal, {
                        asChild: !0,
                        container: o,
                        children: n
                    })
                })
            })
        };
    k.displayName = j;
    var M = "PopoverContent",
        D = r.forwardRef((e, t) => {
            let r = O(M, e.__scopePopover),
                {
                    forceMount: n = r.forceMount,
                    ...o
                } = e,
                l = S(M, e.__scopePopover);
            return (0, y.jsx)(f.Presence, {
                present: n || l.open,
                children: l.modal ? (0, y.jsx)(H, {
                    ...o,
                    ref: t
                }) : (0, y.jsx)(_, {
                    ...o,
                    ref: t
                })
            })
        });
    D.displayName = M;
    var I = (0, m.createSlot)("PopoverContent.RemoveScroll"),
        H = r.forwardRef((e, t) => {
            let l = S(M, e.__scopePopover),
                i = r.useRef(null),
                a = (0, o.useComposedRefs)(t, i),
                s = r.useRef(!1);
            return r.useEffect(() => {
                let e = i.current;
                if (e) return (0, h.hideOthers)(e)
            }, []), (0, y.jsx)(g.RemoveScroll, {
                as: I,
                allowPinchZoom: !0,
                children: (0, y.jsx)(F, {
                    ...e,
                    ref: a,
                    trapFocus: l.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: (0, n.composeEventHandlers)(e.onCloseAutoFocus, e => {
                        var t;
                        e.preventDefault(), s.current || null == (t = l.triggerRef.current) || t.focus()
                    }),
                    onPointerDownOutside: (0, n.composeEventHandlers)(e.onPointerDownOutside, e => {
                        let t = e.detail.originalEvent,
                            r = 0 === t.button && !0 === t.ctrlKey;
                        s.current = 2 === t.button || r
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: (0, n.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        _ = r.forwardRef((e, t) => {
            let n = S(M, e.__scopePopover),
                o = r.useRef(!1),
                l = r.useRef(!1);
            return (0, y.jsx)(F, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var r, i;
                    null == (r = e.onCloseAutoFocus) || r.call(e, t), t.defaultPrevented || (o.current || null == (i = n.triggerRef.current) || i.focus(), t.preventDefault()), o.current = !1, l.current = !1
                },
                onInteractOutside: t => {
                    var r, i;
                    null == (r = e.onInteractOutside) || r.call(e, t), t.defaultPrevented || (o.current = !0, "pointerdown" === t.detail.originalEvent.type && (l.current = !0));
                    let a = t.target;
                    (null == (i = n.triggerRef.current) ? void 0 : i.contains(a)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && l.current && t.preventDefault()
                }
            })
        }),
        F = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                trapFocus: n,
                onOpenAutoFocus: o,
                onCloseAutoFocus: l,
                disableOutsidePointerEvents: u,
                onEscapeKeyDown: d,
                onPointerDownOutside: f,
                onFocusOutside: p,
                onInteractOutside: m,
                ...v
            } = e, h = S(M, r), g = C(r);
            return (0, a.useFocusGuards)(), (0, y.jsx)(s.FocusScope, {
                asChild: !0,
                loop: !0,
                trapped: n,
                onMountAutoFocus: o,
                onUnmountAutoFocus: l,
                children: (0, y.jsx)(i.DismissableLayer, {
                    asChild: !0,
                    disableOutsidePointerEvents: u,
                    onInteractOutside: m,
                    onEscapeKeyDown: d,
                    onPointerDownOutside: f,
                    onFocusOutside: p,
                    onDismiss: () => h.onOpenChange(!1),
                    children: (0, y.jsx)(c.Content, {
                        "data-state": V(h.open),
                        role: "dialog",
                        id: h.contentId,
                        ...g,
                        ...v,
                        ref: t,
                        style: {
                            ...v.style,
                            "--radix-popover-content-transform-origin": "var(--radix-popper-transform-origin)",
                            "--radix-popover-content-available-width": "var(--radix-popper-available-width)",
                            "--radix-popover-content-available-height": "var(--radix-popper-available-height)",
                            "--radix-popover-trigger-width": "var(--radix-popper-anchor-width)",
                            "--radix-popover-trigger-height": "var(--radix-popper-anchor-height)"
                        }
                    })
                })
            })
        }),
        B = "PopoverClose",
        W = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...o
            } = e, l = S(B, r);
            return (0, y.jsx)(p.Primitive.button, {
                type: "button",
                ...o,
                ref: t,
                onClick: (0, n.composeEventHandlers)(e.onClick, () => l.onOpenChange(!1))
            })
        });
    W.displayName = B;
    var z = r.forwardRef((e, t) => {
        let {
            __scopePopover: r,
            ...n
        } = e, o = C(r);
        return (0, y.jsx)(c.Arrow, {
            ...o,
            ...n,
            ref: t
        })
    });

    function V(e) {
        return e ? "open" : "closed"
    }
    z.displayName = "PopoverArrow", e.s(["Anchor", 0, T, "Arrow", 0, z, "Close", 0, W, "Content", 0, D, "Portal", 0, k, "Root", 0, R, "Trigger", 0, N], 734463);
    let U = e => {
        var t, r, n, o, l, i;
        let a = null != (t = null == (n = (o = window).matchMedia) || null == (r = n.call(o, "(pointer: coarse)")) ? void 0 : r.matches) && t,
            s = null == (l = document.activeElement) ? void 0 : l.matches(":focus-visible");
        if (a && !s) return void e.preventDefault();
        let u = null == (i = e.currentTarget) ? void 0 : i.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        u && (e.preventDefault(), u.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: n,
            onOpenChange: o,
            children: l
        } = e;
        return r.createElement(R, {
            open: t,
            defaultOpen: n,
            onOpenChange: o
        }, l)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: t,
            className: n,
            children: o
        } = e;
        return r.createElement(T, {
            asChild: t,
            className: n
        }, o)
    }, "PopoverClose", 0, function(e) {
        let {
            children: t,
            ...n
        } = e;
        return r.createElement(W, n, t)
    }, "PopoverContent", 0, function(e) {
        let {
            side: n = "bottom",
            align: o = "center",
            sideOffset: l = 4,
            className: i,
            children: a,
            ariaLabel: s,
            onOpenAutoFocus: u,
            ...c
        } = e;
        return r.createElement(k, null, r.createElement(D, {
            side: n,
            align: o,
            sideOffset: l,
            ...c,
            "aria-label": null != s ? s : c["aria-label"],
            onOpenAutoFocus: null != u ? u : U,
            className: (0, t.default)("foundation-web-portal-zindex", i)
        }, a))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: n,
            className: o,
            children: l
        } = e;
        return r.createElement(N, {
            asChild: t,
            disabled: n,
            className: o
        }, l)
    }], 905943)
}, 515351, 606944, 992486, 297452, e => {
    "use strict";
    let t;
    var r, n, o = e.i(197649),
        l = e.i(416340);

    function i(e) {
        let {
            className: t
        } = e;
        return l.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, o.default)("block", t),
            style: {
                marginTop: -1
            }
        }, l.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }

    function a(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(n) {
            if (null == e || e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
        }
    }

    function s(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function u() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return e => {
            let r = !1,
                n = t.map(t => {
                    let n = s(t, e);
                    return r || "function" != typeof n || (r = !0), n
                });
            if (r) return () => {
                for (let e = 0; e < n.length; e++) {
                    let r = n[e];
                    "function" == typeof r ? r() : s(t[e], null)
                }
            }
        }
    }

    function c() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return l.useCallback(u(...t), t)
    }
    e.s(["Beak", 0, i], 606944);
    var d = e.i(221628);

    function f(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            r = [],
            n = () => {
                let t = r.map(e => l.createContext(e));
                return function(r) {
                    let n = (null == r ? void 0 : r[e]) || t;
                    return l.useMemo(() => ({
                        ["__scope".concat(e)]: {
                            ...r,
                            [e]: n
                        }
                    }), [r, n])
                }
            };
        return n.scopeName = e, [function(t, n) {
            let o = l.createContext(n),
                i = r.length;
            r = [...r, n];
            let a = t => {
                var r;
                let {
                    scope: n,
                    children: a,
                    ...s
                } = t, u = (null == n || null == (r = n[e]) ? void 0 : r[i]) || o, c = l.useMemo(() => s, Object.values(s));
                return (0, d.jsx)(u.Provider, {
                    value: c,
                    children: a
                })
            };
            return a.displayName = t + "Provider", [a, function(r, a) {
                var s;
                let u = (null == a || null == (s = a[e]) ? void 0 : s[i]) || o,
                    c = l.useContext(u);
                if (c) return c;
                if (void 0 !== n) return n;
                throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            let n = t[0];
            if (1 === t.length) return n;
            let o = () => {
                let e = t.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(t) {
                    let r = e.reduce((e, r) => {
                        let {
                            useScope: n,
                            scopeName: o
                        } = r, l = n(t)["__scope".concat(o)];
                        return {
                            ...e,
                            ...l
                        }
                    }, {});
                    return l.useMemo(() => ({
                        ["__scope".concat(n.scopeName)]: r
                    }), [r])
                }
            };
            return o.scopeName = n.scopeName, o
        }(n, ...t)]
    }
    var p = e.i(149285),
        m = l.forwardRef((e, t) => {
            let {
                children: r,
                ...n
            } = e, o = l.Children.toArray(r), i = o.find(g);
            if (i) {
                let e = i.props.children,
                    r = o.map(t => t !== i ? t : l.Children.count(e) > 1 ? l.Children.only(null) : l.isValidElement(e) ? e.props.children : null);
                return (0, d.jsx)(v, {
                    ...n,
                    ref: t,
                    children: l.isValidElement(e) ? l.cloneElement(e, void 0, r) : null
                })
            }
            return (0, d.jsx)(v, {
                ...n,
                ref: t,
                children: r
            })
        });
    m.displayName = "Slot";
    var v = l.forwardRef((e, t) => {
        let {
            children: r,
            ...n
        } = e;
        if (l.isValidElement(r)) {
            var o, i, a;
            let e, s, c = (s = (e = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in e && e.isReactWarning) ? o.ref : (s = (e = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning) ? o.props.ref : o.props.ref || o.ref;
            return l.cloneElement(r, {
                ... function(e, t) {
                    let r = {
                        ...t
                    };
                    for (let n in t) {
                        let o = e[n],
                            l = t[n];
                        /^on[A-Z]/.test(n) ? o && l ? r[n] = function() {
                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                            l(...t), o(...t)
                        } : o && (r[n] = o) : "style" === n ? r[n] = {
                            ...o,
                            ...l
                        } : "className" === n && (r[n] = [o, l].filter(Boolean).join(" "))
                    }
                    return {
                        ...e,
                        ...r
                    }
                }(n, r.props),
                ref: t ? u(t, c) : c
            })
        }
        return l.Children.count(r) > 1 ? l.Children.only(null) : null
    });
    v.displayName = "SlotClone";
    var h = e => {
        let {
            children: t
        } = e;
        return (0, d.jsx)(d.Fragment, {
            children: t
        })
    };

    function g(e) {
        return l.isValidElement(e) && e.type === h
    }
    var y = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
        let r = l.forwardRef((e, r) => {
            let {
                asChild: n,
                ...o
            } = e, l = n ? m : t;
            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, d.jsx)(l, {
                ...o,
                ref: r
            })
        });
        return r.displayName = "Primitive.".concat(t), {
            ...e,
            [t]: r
        }
    }, {});

    function x(e) {
        let t = l.useRef(e);
        return l.useEffect(() => {
            t.current = e
        }), l.useMemo(() => function() {
            for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
            return null == (e = t.current) ? void 0 : e.call(t, ...n)
        }, [])
    }
    var w = "dismissableLayer.update",
        b = l.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        C = l.forwardRef((e, t) => {
            var n, o;
            let {
                disableOutsidePointerEvents: i = !1,
                onEscapeKeyDown: s,
                onPointerDownOutside: u,
                onFocusOutside: f,
                onInteractOutside: p,
                onDismiss: m,
                ...v
            } = e, h = l.useContext(b), [g, C] = l.useState(null), R = null != (n = null == g ? void 0 : g.ownerDocument) ? n : null == (o = globalThis) ? void 0 : o.document, [, P] = l.useState({}), T = c(t, e => C(e)), A = Array.from(h.layers), [N] = [...h.layersWithOutsidePointerEventsDisabled].slice(-1), j = A.indexOf(N), L = g ? A.indexOf(g) : -1, O = h.layersWithOutsidePointerEventsDisabled.size > 0, k = L >= j, M = function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    n = x(e),
                    o = l.useRef(!1),
                    i = l.useRef(() => {});
                return l.useEffect(() => {
                    let e = e => {
                            if (e.target && !o.current) {
                                let t = function() {
                                        S("dismissableLayer.pointerDownOutside", n, o, {
                                            discrete: !0
                                        })
                                    },
                                    o = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (r.removeEventListener("click", i.current), i.current = t, r.addEventListener("click", i.current, {
                                    once: !0
                                })) : t()
                            } else r.removeEventListener("click", i.current);
                            o.current = !1
                        },
                        t = window.setTimeout(() => {
                            r.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(t), r.removeEventListener("pointerdown", e), r.removeEventListener("click", i.current)
                    }
                }, [r, n]), {
                    onPointerDownCapture: () => o.current = !0
                }
            }(e => {
                let t = e.target,
                    r = [...h.branches].some(e => e.contains(t));
                k && !r && (null == u || u(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, R), D = function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    n = x(e),
                    o = l.useRef(!1);
                return l.useEffect(() => {
                    let e = e => {
                        e.target && !o.current && S("dismissableLayer.focusOutside", n, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return r.addEventListener("focusin", e), () => r.removeEventListener("focusin", e)
                }, [r, n]), {
                    onFocusCapture: () => o.current = !0,
                    onBlurCapture: () => o.current = !1
                }
            }(e => {
                let t = e.target;
                ![...h.branches].some(e => e.contains(t)) && (null == f || f(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, R);
            return ! function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    n = x(e);
                l.useEffect(() => {
                    let e = e => {
                        "Escape" === e.key && n(e)
                    };
                    return r.addEventListener("keydown", e, {
                        capture: !0
                    }), () => r.removeEventListener("keydown", e, {
                        capture: !0
                    })
                }, [n, r])
            }(e => {
                L === h.layers.size - 1 && (null == s || s(e), !e.defaultPrevented && m && (e.preventDefault(), m()))
            }, R), l.useEffect(() => {
                if (g) return i && (0 === h.layersWithOutsidePointerEventsDisabled.size && (r = R.body.style.pointerEvents, R.body.style.pointerEvents = "none"), h.layersWithOutsidePointerEventsDisabled.add(g)), h.layers.add(g), E(), () => {
                    i && 1 === h.layersWithOutsidePointerEventsDisabled.size && (R.body.style.pointerEvents = r)
                }
            }, [g, R, i, h]), l.useEffect(() => () => {
                g && (h.layers.delete(g), h.layersWithOutsidePointerEventsDisabled.delete(g), E())
            }, [g, h]), l.useEffect(() => {
                let e = () => P({});
                return document.addEventListener(w, e), () => document.removeEventListener(w, e)
            }, []), (0, d.jsx)(y.div, {
                ...v,
                ref: T,
                style: {
                    pointerEvents: O ? k ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: a(e.onFocusCapture, D.onFocusCapture),
                onBlurCapture: a(e.onBlurCapture, D.onBlurCapture),
                onPointerDownCapture: a(e.onPointerDownCapture, M.onPointerDownCapture)
            })
        });

    function E() {
        let e = new CustomEvent(w);
        document.dispatchEvent(e)
    }

    function S(e, t, r, n) {
        let {
            discrete: o
        } = n, l = r.originalEvent.target, i = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: r
        });
        if (t && l.addEventListener(e, t, {
                once: !0
            }), o) l && p.flushSync(() => l.dispatchEvent(i));
        else l.dispatchEvent(i)
    }
    C.displayName = "DismissableLayer", l.forwardRef((e, t) => {
        let r = l.useContext(b),
            n = l.useRef(null),
            o = c(t, n);
        return l.useEffect(() => {
            let e = n.current;
            if (e) return r.branches.add(e), () => {
                r.branches.delete(e)
            }
        }, [r.branches]), (0, d.jsx)(y.div, {
            ...e,
            ref: o
        })
    }).displayName = "DismissableLayerBranch";
    var R = (null == (n = globalThis) ? void 0 : n.document) ? l.useLayoutEffect : () => {},
        P = l["useId".toString()] || (() => void 0),
        T = 0;
    let A = ["top", "right", "bottom", "left"],
        N = A.reduce((e, t) => e.concat(t, t + "-start", t + "-end"), []),
        j = Math.min,
        L = Math.max,
        O = Math.round,
        k = Math.floor,
        M = e => ({
            x: e,
            y: e
        }),
        D = {
            left: "right",
            right: "left",
            bottom: "top",
            top: "bottom"
        };

    function I(e, t) {
        return "function" == typeof e ? e(t) : e
    }

    function H(e) {
        return e.split("-")[0]
    }

    function _(e) {
        return e.split("-")[1]
    }

    function F(e) {
        return "x" === e ? "y" : "x"
    }

    function B(e) {
        return "y" === e ? "height" : "width"
    }

    function W(e) {
        let t = e[0];
        return "t" === t || "b" === t ? "y" : "x"
    }

    function z(e, t, r) {
        void 0 === r && (r = !1);
        let n = _(e),
            o = F(W(e)),
            l = B(o),
            i = "x" === o ? n === (r ? "end" : "start") ? "right" : "left" : "start" === n ? "bottom" : "top";
        return t.reference[l] > t.floating[l] && (i = G(i)), [i, G(i)]
    }

    function V(e) {
        return e.includes("start") ? e.replace("start", "end") : e.replace("end", "start")
    }
    let U = ["left", "right"],
        K = ["right", "left"],
        X = ["top", "bottom"],
        Y = ["bottom", "top"];

    function G(e) {
        let t = H(e);
        return D[t] + e.slice(t.length)
    }

    function q(e) {
        return "number" != typeof e ? {
            top: 0,
            right: 0,
            bottom: 0,
            left: 0,
            ...e
        } : {
            top: e,
            right: e,
            bottom: e,
            left: e
        }
    }

    function Z(e) {
        let {
            x: t,
            y: r,
            width: n,
            height: o
        } = e;
        return {
            width: n,
            height: o,
            top: r,
            left: t,
            right: t + n,
            bottom: r + o,
            x: t,
            y: r
        }
    }

    function $(e, t, r) {
        let n, {
                reference: o,
                floating: l
            } = e,
            i = W(t),
            a = F(W(t)),
            s = B(a),
            u = H(t),
            c = "y" === i,
            d = o.x + o.width / 2 - l.width / 2,
            f = o.y + o.height / 2 - l.height / 2,
            p = o[s] / 2 - l[s] / 2;
        switch (u) {
            case "top":
                n = {
                    x: d,
                    y: o.y - l.height
                };
                break;
            case "bottom":
                n = {
                    x: d,
                    y: o.y + o.height
                };
                break;
            case "right":
                n = {
                    x: o.x + o.width,
                    y: f
                };
                break;
            case "left":
                n = {
                    x: o.x - l.width,
                    y: f
                };
                break;
            default:
                n = {
                    x: o.x,
                    y: o.y
                }
        }
        switch (_(t)) {
            case "start":
                n[a] -= p * (r && c ? -1 : 1);
                break;
            case "end":
                n[a] += p * (r && c ? -1 : 1)
        }
        return n
    }
    async function J(e, t) {
        var r;
        void 0 === t && (t = {});
        let {
            x: n,
            y: o,
            platform: l,
            rects: i,
            elements: a,
            strategy: s
        } = e, {
            boundary: u = "clippingAncestors",
            rootBoundary: c = "viewport",
            elementContext: d = "floating",
            altBoundary: f = !1,
            padding: p = 0
        } = I(t, e), m = q(p), v = a[f ? "floating" === d ? "reference" : "floating" : d], h = Z(await l.getClippingRect({
            element: null == (r = await (null == l.isElement ? void 0 : l.isElement(v))) || r ? v : v.contextElement || await (null == l.getDocumentElement ? void 0 : l.getDocumentElement(a.floating)),
            boundary: u,
            rootBoundary: c,
            strategy: s
        })), g = "floating" === d ? {
            x: n,
            y: o,
            width: i.floating.width,
            height: i.floating.height
        } : i.reference, y = await (null == l.getOffsetParent ? void 0 : l.getOffsetParent(a.floating)), x = await (null == l.isElement ? void 0 : l.isElement(y)) && await (null == l.getScale ? void 0 : l.getScale(y)) || {
            x: 1,
            y: 1
        }, w = Z(l.convertOffsetParentRelativeRectToViewportRelativeRect ? await l.convertOffsetParentRelativeRectToViewportRelativeRect({
            elements: a,
            rect: g,
            offsetParent: y,
            strategy: s
        }) : g);
        return {
            top: (h.top - w.top + m.top) / x.y,
            bottom: (w.bottom - h.bottom + m.bottom) / x.y,
            left: (h.left - w.left + m.left) / x.x,
            right: (w.right - h.right + m.right) / x.x
        }
    }
    let Q = async (e, t, r) => {
        let {
            placement: n = "bottom",
            strategy: o = "absolute",
            middleware: l = [],
            platform: i
        } = r, a = i.detectOverflow ? i : {
            ...i,
            detectOverflow: J
        }, s = await (null == i.isRTL ? void 0 : i.isRTL(t)), u = await i.getElementRects({
            reference: e,
            floating: t,
            strategy: o
        }), {
            x: c,
            y: d
        } = $(u, n, s), f = n, p = 0, m = {};
        for (let r = 0; r < l.length; r++) {
            let v = l[r];
            if (!v) continue;
            let {
                name: h,
                fn: g
            } = v, {
                x: y,
                y: x,
                data: w,
                reset: b
            } = await g({
                x: c,
                y: d,
                initialPlacement: n,
                placement: f,
                strategy: o,
                middlewareData: m,
                rects: u,
                platform: a,
                elements: {
                    reference: e,
                    floating: t
                }
            });
            c = null != y ? y : c, d = null != x ? x : d, m[h] = {
                ...m[h],
                ...w
            }, b && p < 50 && (p++, "object" == typeof b && (b.placement && (f = b.placement), b.rects && (u = !0 === b.rects ? await i.getElementRects({
                reference: e,
                floating: t,
                strategy: o
            }) : b.rects), {
                x: c,
                y: d
            } = $(u, f, s)), r = -1)
        }
        return {
            x: c,
            y: d,
            placement: f,
            strategy: o,
            middlewareData: m
        }
    };

    function ee(e, t) {
        return {
            top: e.top - t.height,
            right: e.right - t.width,
            bottom: e.bottom - t.height,
            left: e.left - t.width
        }
    }

    function et(e) {
        return A.some(t => e[t] >= 0)
    }

    function er(e) {
        let t = j(...e.map(e => e.left)),
            r = j(...e.map(e => e.top));
        return {
            x: t,
            y: r,
            width: L(...e.map(e => e.right)) - t,
            height: L(...e.map(e => e.bottom)) - r
        }
    }
    let en = new Set(["left", "top"]);
    async function eo(e, t) {
        let {
            placement: r,
            platform: n,
            elements: o
        } = e, l = await (null == n.isRTL ? void 0 : n.isRTL(o.floating)), i = H(r), a = _(r), s = "y" === W(r), u = en.has(i) ? -1 : 1, c = l && s ? -1 : 1, d = I(t, e), {
            mainAxis: f,
            crossAxis: p,
            alignmentAxis: m
        } = "number" == typeof d ? {
            mainAxis: d,
            crossAxis: 0,
            alignmentAxis: null
        } : {
            mainAxis: d.mainAxis || 0,
            crossAxis: d.crossAxis || 0,
            alignmentAxis: d.alignmentAxis
        };
        return a && "number" == typeof m && (p = "end" === a ? -1 * m : m), s ? {
            x: p * c,
            y: f * u
        } : {
            x: f * u,
            y: p * c
        }
    }

    function el() {
        return "u" > typeof window
    }

    function ei(e) {
        return eu(e) ? (e.nodeName || "").toLowerCase() : "#document"
    }

    function ea(e) {
        var t;
        return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
    }

    function es(e) {
        var t;
        return null == (t = (eu(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
    }

    function eu(e) {
        return !!el() && (e instanceof Node || e instanceof ea(e).Node)
    }

    function ec(e) {
        return !!el() && (e instanceof Element || e instanceof ea(e).Element)
    }

    function ed(e) {
        return !!el() && (e instanceof HTMLElement || e instanceof ea(e).HTMLElement)
    }

    function ef(e) {
        return !(!el() || "u" < typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof ea(e).ShadowRoot)
    }

    function ep(e) {
        let {
            overflow: t,
            overflowX: r,
            overflowY: n,
            display: o
        } = eb(e);
        return /auto|scroll|overlay|hidden|clip/.test(t + n + r) && "inline" !== o && "contents" !== o
    }

    function em(e) {
        try {
            if (e.matches(":popover-open")) return !0
        } catch (e) {}
        try {
            return e.matches(":modal")
        } catch (e) {
            return !1
        }
    }
    let ev = /transform|translate|scale|rotate|perspective|filter/,
        eh = /paint|layout|strict|content/,
        eg = e => !!e && "none" !== e;

    function ey(e) {
        let t = ec(e) ? eb(e) : e;
        return eg(t.transform) || eg(t.translate) || eg(t.scale) || eg(t.rotate) || eg(t.perspective) || !ex() && (eg(t.backdropFilter) || eg(t.filter)) || ev.test(t.willChange || "") || eh.test(t.contain || "")
    }

    function ex() {
        return null == t && (t = "u" > typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), t
    }

    function ew(e) {
        return /^(html|body|#document)$/.test(ei(e))
    }

    function eb(e) {
        return ea(e).getComputedStyle(e)
    }

    function eC(e) {
        return ec(e) ? {
            scrollLeft: e.scrollLeft,
            scrollTop: e.scrollTop
        } : {
            scrollLeft: e.scrollX,
            scrollTop: e.scrollY
        }
    }

    function eE(e) {
        if ("html" === ei(e)) return e;
        let t = e.assignedSlot || e.parentNode || ef(e) && e.host || es(e);
        return ef(t) ? t.host : t
    }

    function eS(e, t, r) {
        var n;
        void 0 === t && (t = []), void 0 === r && (r = !0);
        let o = function e(t) {
                let r = eE(t);
                return ew(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : ed(r) && ep(r) ? r : e(r)
            }(e),
            l = o === (null == (n = e.ownerDocument) ? void 0 : n.body),
            i = ea(o);
        if (!l) return t.concat(o, eS(o, [], r));
        {
            let e = eR(i);
            return t.concat(i, i.visualViewport || [], ep(o) ? o : [], e && r ? eS(e) : [])
        }
    }

    function eR(e) {
        return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
    }

    function eP(e) {
        let t = eb(e),
            r = parseFloat(t.width) || 0,
            n = parseFloat(t.height) || 0,
            o = ed(e),
            l = o ? e.offsetWidth : r,
            i = o ? e.offsetHeight : n,
            a = O(r) !== l || O(n) !== i;
        return a && (r = l, n = i), {
            width: r,
            height: n,
            $: a
        }
    }

    function eT(e) {
        return ec(e) ? e : e.contextElement
    }

    function eA(e) {
        let t = eT(e);
        if (!ed(t)) return M(1);
        let r = t.getBoundingClientRect(),
            {
                width: n,
                height: o,
                $: l
            } = eP(t),
            i = (l ? O(r.width) : r.width) / n,
            a = (l ? O(r.height) : r.height) / o;
        return i && Number.isFinite(i) || (i = 1), a && Number.isFinite(a) || (a = 1), {
            x: i,
            y: a
        }
    }
    let eN = M(0);

    function ej(e) {
        let t = ea(e);
        return ex() && t.visualViewport ? {
            x: t.visualViewport.offsetLeft,
            y: t.visualViewport.offsetTop
        } : eN
    }

    function eL(e, t, r, n) {
        var o;
        void 0 === t && (t = !1), void 0 === r && (r = !1);
        let l = e.getBoundingClientRect(),
            i = eT(e),
            a = M(1);
        t && (n ? ec(n) && (a = eA(n)) : a = eA(e));
        let s = (void 0 === (o = r) && (o = !1), n && (!o || n === ea(i)) && o) ? ej(i) : M(0),
            u = (l.left + s.x) / a.x,
            c = (l.top + s.y) / a.y,
            d = l.width / a.x,
            f = l.height / a.y;
        if (i) {
            let e = ea(i),
                t = n && ec(n) ? ea(n) : n,
                r = e,
                o = eR(r);
            for (; o && n && t !== r;) {
                let e = eA(o),
                    t = o.getBoundingClientRect(),
                    n = eb(o),
                    l = t.left + (o.clientLeft + parseFloat(n.paddingLeft)) * e.x,
                    i = t.top + (o.clientTop + parseFloat(n.paddingTop)) * e.y;
                u *= e.x, c *= e.y, d *= e.x, f *= e.y, u += l, c += i, o = eR(r = ea(o))
            }
        }
        return Z({
            width: d,
            height: f,
            x: u,
            y: c
        })
    }

    function eO(e, t) {
        let r = eC(e).scrollLeft;
        return t ? t.left + r : eL(es(e)).left + r
    }

    function ek(e, t) {
        let r = e.getBoundingClientRect();
        return {
            x: r.left + t.scrollLeft - eO(e, r),
            y: r.top + t.scrollTop
        }
    }

    function eM(e, t, r) {
        var n;
        let o;
        if ("viewport" === t) o = function(e, t) {
            let r = ea(e),
                n = es(e),
                o = r.visualViewport,
                l = n.clientWidth,
                i = n.clientHeight,
                a = 0,
                s = 0;
            if (o) {
                l = o.width, i = o.height;
                let e = ex();
                (!e || e && "fixed" === t) && (a = o.offsetLeft, s = o.offsetTop)
            }
            let u = eO(n);
            if (u <= 0) {
                let e = n.ownerDocument,
                    t = e.body,
                    r = getComputedStyle(t),
                    o = "CSS1Compat" === e.compatMode && parseFloat(r.marginLeft) + parseFloat(r.marginRight) || 0,
                    i = Math.abs(n.clientWidth - t.clientWidth - o);
                i <= 25 && (l -= i)
            } else u <= 25 && (l += u);
            return {
                width: l,
                height: i,
                x: a,
                y: s
            }
        }(e, r);
        else if ("document" === t) {
            let t, r, l, i, a, s, u;
            n = es(e), t = es(n), r = eC(n), l = n.ownerDocument.body, i = L(t.scrollWidth, t.clientWidth, l.scrollWidth, l.clientWidth), a = L(t.scrollHeight, t.clientHeight, l.scrollHeight, l.clientHeight), s = -r.scrollLeft + eO(n), u = -r.scrollTop, "rtl" === eb(l).direction && (s += L(t.clientWidth, l.clientWidth) - i), o = {
                width: i,
                height: a,
                x: s,
                y: u
            }
        } else if (ec(t)) {
            let e, n, l, i, a, s;
            n = (e = eL(t, !0, "fixed" === r)).top + t.clientTop, l = e.left + t.clientLeft, i = ed(t) ? eA(t) : M(1), a = t.clientWidth * i.x, s = t.clientHeight * i.y, o = {
                width: a,
                height: s,
                x: l * i.x,
                y: n * i.y
            }
        } else {
            let r = ej(e);
            o = {
                x: t.x - r.x,
                y: t.y - r.y,
                width: t.width,
                height: t.height
            }
        }
        return Z(o)
    }

    function eD(e) {
        return "static" === eb(e).position
    }

    function eI(e, t) {
        if (!ed(e) || "fixed" === eb(e).position) return null;
        if (t) return t(e);
        let r = e.offsetParent;
        return es(e) === r && (r = r.ownerDocument.body), r
    }

    function eH(e, t) {
        var r;
        let n = ea(e);
        if (em(e)) return n;
        if (!ed(e)) {
            let t = eE(e);
            for (; t && !ew(t);) {
                if (ec(t) && !eD(t)) return t;
                t = eE(t)
            }
            return n
        }
        let o = eI(e, t);
        for (; o && (r = o, /^(table|td|th)$/.test(ei(r))) && eD(o);) o = eI(o, t);
        return o && ew(o) && eD(o) && !ey(o) ? n : o || function(e) {
            let t = eE(e);
            for (; ed(t) && !ew(t);) {
                if (ey(t)) return t;
                if (em(t)) break;
                t = eE(t)
            }
            return null
        }(e) || n
    }
    let e_ = async function(e) {
        let t = this.getOffsetParent || eH,
            r = this.getDimensions,
            n = await r(e.floating);
        return {
            reference: function(e, t, r) {
                let n = ed(t),
                    o = es(t),
                    l = "fixed" === r,
                    i = eL(e, !0, l, t),
                    a = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    s = M(0);
                if (n || !n && !l)
                    if (("body" !== ei(t) || ep(o)) && (a = eC(t)), n) {
                        let e = eL(t, !0, l, t);
                        s.x = e.x + t.clientLeft, s.y = e.y + t.clientTop
                    } else o && (s.x = eO(o));
                l && !n && o && (s.x = eO(o));
                let u = !o || n || l ? M(0) : ek(o, a);
                return {
                    x: i.left + a.scrollLeft - s.x - u.x,
                    y: i.top + a.scrollTop - s.y - u.y,
                    width: i.width,
                    height: i.height
                }
            }(e.reference, await t(e.floating), e.strategy),
            floating: {
                x: 0,
                y: 0,
                width: n.width,
                height: n.height
            }
        }
    }, eF = {
        convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
            let {
                elements: t,
                rect: r,
                offsetParent: n,
                strategy: o
            } = e, l = "fixed" === o, i = es(n), a = !!t && em(t.floating);
            if (n === i || a && l) return r;
            let s = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                u = M(1),
                c = M(0),
                d = ed(n);
            if ((d || !d && !l) && (("body" !== ei(n) || ep(i)) && (s = eC(n)), d)) {
                let e = eL(n);
                u = eA(n), c.x = e.x + n.clientLeft, c.y = e.y + n.clientTop
            }
            let f = !i || d || l ? M(0) : ek(i, s);
            return {
                width: r.width * u.x,
                height: r.height * u.y,
                x: r.x * u.x - s.scrollLeft * u.x + c.x + f.x,
                y: r.y * u.y - s.scrollTop * u.y + c.y + f.y
            }
        },
        getDocumentElement: es,
        getClippingRect: function(e) {
            let {
                element: t,
                boundary: r,
                rootBoundary: n,
                strategy: o
            } = e, l = [..."clippingAncestors" === r ? em(t) ? [] : function(e, t) {
                let r = t.get(e);
                if (r) return r;
                let n = eS(e, [], !1).filter(e => ec(e) && "body" !== ei(e)),
                    o = null,
                    l = "fixed" === eb(e).position,
                    i = l ? eE(e) : e;
                for (; ec(i) && !ew(i);) {
                    let t = eb(i),
                        r = ey(i);
                    r || "fixed" !== t.position || (o = null), (l ? r || o : !(!r && "static" === t.position && o && ("absolute" === o.position || "fixed" === o.position) || ep(i) && !r && function e(t, r) {
                        let n = eE(t);
                        return !(n === r || !ec(n) || ew(n)) && ("fixed" === eb(n).position || e(n, r))
                    }(e, i))) ? o = t : n = n.filter(e => e !== i), i = eE(i)
                }
                return t.set(e, n), n
            }(t, this._c) : [].concat(r), n], i = eM(t, l[0], o), a = i.top, s = i.right, u = i.bottom, c = i.left;
            for (let e = 1; e < l.length; e++) {
                let r = eM(t, l[e], o);
                a = L(r.top, a), s = j(r.right, s), u = j(r.bottom, u), c = L(r.left, c)
            }
            return {
                width: s - c,
                height: u - a,
                x: c,
                y: a
            }
        },
        getOffsetParent: eH,
        getElementRects: e_,
        getClientRects: function(e) {
            return Array.from(e.getClientRects())
        },
        getDimensions: function(e) {
            let {
                width: t,
                height: r
            } = eP(e);
            return {
                width: t,
                height: r
            }
        },
        getScale: eA,
        isElement: ec,
        isRTL: function(e) {
            return "rtl" === eb(e).direction
        }
    };

    function eB(e, t) {
        return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
    }

    function eW(e, t, r, n) {
        let o;
        void 0 === n && (n = {});
        let {
            ancestorScroll: l = !0,
            ancestorResize: i = !0,
            elementResize: a = "function" == typeof ResizeObserver,
            layoutShift: s = "function" == typeof IntersectionObserver,
            animationFrame: u = !1
        } = n, c = eT(e), d = l || i ? [...c ? eS(c) : [], ...t ? eS(t) : []] : [];
        d.forEach(e => {
            l && e.addEventListener("scroll", r, {
                passive: !0
            }), i && e.addEventListener("resize", r)
        });
        let f = c && s ? function(e, t) {
                let r, n = null,
                    o = es(e);

                function l() {
                    var e;
                    clearTimeout(r), null == (e = n) || e.disconnect(), n = null
                }
                return ! function i(a, s) {
                    void 0 === a && (a = !1), void 0 === s && (s = 1), l();
                    let u = e.getBoundingClientRect(),
                        {
                            left: c,
                            top: d,
                            width: f,
                            height: p
                        } = u;
                    if (a || t(), !f || !p) return;
                    let m = {
                            rootMargin: -k(d) + "px " + -k(o.clientWidth - (c + f)) + "px " + -k(o.clientHeight - (d + p)) + "px " + -k(c) + "px",
                            threshold: L(0, j(1, s)) || 1
                        },
                        v = !0;

                    function h(t) {
                        let n = t[0].intersectionRatio;
                        if (n !== s) {
                            if (!v) return i();
                            n ? i(!1, n) : r = setTimeout(() => {
                                i(!1, 1e-7)
                            }, 1e3)
                        }
                        1 !== n || eB(u, e.getBoundingClientRect()) || i(), v = !1
                    }
                    try {
                        n = new IntersectionObserver(h, {
                            ...m,
                            root: o.ownerDocument
                        })
                    } catch (e) {
                        n = new IntersectionObserver(h, m)
                    }
                    n.observe(e)
                }(!0), l
            }(c, r) : null,
            p = -1,
            m = null;
        a && (m = new ResizeObserver(e => {
            let [n] = e;
            n && n.target === c && m && t && (m.unobserve(t), cancelAnimationFrame(p), p = requestAnimationFrame(() => {
                var e;
                null == (e = m) || e.observe(t)
            })), r()
        }), c && !u && m.observe(c), t && m.observe(t));
        let v = u ? eL(e) : null;
        return u && function t() {
            let n = eL(e);
            v && !eB(v, n) && r(), v = n, o = requestAnimationFrame(t)
        }(), r(), () => {
            var e;
            d.forEach(e => {
                l && e.removeEventListener("scroll", r), i && e.removeEventListener("resize", r)
            }), null == f || f(), null == (e = m) || e.disconnect(), m = null, u && cancelAnimationFrame(o)
        }
    }
    let ez = function(e) {
            return void 0 === e && (e = 0), {
                name: "offset",
                options: e,
                async fn(t) {
                    var r, n;
                    let {
                        x: o,
                        y: l,
                        placement: i,
                        middlewareData: a
                    } = t, s = await eo(t, e);
                    return i === (null == (r = a.offset) ? void 0 : r.placement) && null != (n = a.arrow) && n.alignmentOffset ? {} : {
                        x: o + s.x,
                        y: l + s.y,
                        data: {
                            ...s,
                            placement: i
                        }
                    }
                }
            }
        },
        eV = function(e) {
            return void 0 === e && (e = {}), {
                name: "shift",
                options: e,
                async fn(t) {
                    let {
                        x: r,
                        y: n,
                        placement: o,
                        platform: l
                    } = t, {
                        mainAxis: i = !0,
                        crossAxis: a = !1,
                        limiter: s = {
                            fn: e => {
                                let {
                                    x: t,
                                    y: r
                                } = e;
                                return {
                                    x: t,
                                    y: r
                                }
                            }
                        },
                        ...u
                    } = I(e, t), c = {
                        x: r,
                        y: n
                    }, d = await l.detectOverflow(t, u), f = W(H(o)), p = F(f), m = c[p], v = c[f];
                    if (i) {
                        let e = "y" === p ? "top" : "left",
                            t = "y" === p ? "bottom" : "right",
                            r = m + d[e],
                            n = m - d[t];
                        m = L(r, j(m, n))
                    }
                    if (a) {
                        let e = "y" === f ? "top" : "left",
                            t = "y" === f ? "bottom" : "right",
                            r = v + d[e],
                            n = v - d[t];
                        v = L(r, j(v, n))
                    }
                    let h = s.fn({
                        ...t,
                        [p]: m,
                        [f]: v
                    });
                    return {
                        ...h,
                        data: {
                            x: h.x - r,
                            y: h.y - n,
                            enabled: {
                                [p]: i,
                                [f]: a
                            }
                        }
                    }
                }
            }
        },
        eU = function(e) {
            return void 0 === e && (e = {}), {
                name: "flip",
                options: e,
                async fn(t) {
                    var r, n, o, l, i;
                    let a, s, u, {
                            placement: c,
                            middlewareData: d,
                            rects: f,
                            initialPlacement: p,
                            platform: m,
                            elements: v
                        } = t,
                        {
                            mainAxis: h = !0,
                            crossAxis: g = !0,
                            fallbackPlacements: y,
                            fallbackStrategy: x = "bestFit",
                            fallbackAxisSideDirection: w = "none",
                            flipAlignment: b = !0,
                            ...C
                        } = I(e, t);
                    if (null != (r = d.arrow) && r.alignmentOffset) return {};
                    let E = H(c),
                        S = W(p),
                        R = H(p) === p,
                        P = await (null == m.isRTL ? void 0 : m.isRTL(v.floating)),
                        T = y || (R || !b ? [G(p)] : (a = G(p), [V(p), a, V(a)])),
                        A = "none" !== w;
                    !y && A && T.push(...(s = _(p), u = function(e, t, r) {
                        switch (e) {
                            case "top":
                            case "bottom":
                                if (r) return t ? K : U;
                                return t ? U : K;
                            case "left":
                            case "right":
                                return t ? X : Y;
                            default:
                                return []
                        }
                    }(H(p), "start" === w, P), s && (u = u.map(e => e + "-" + s), b && (u = u.concat(u.map(V)))), u));
                    let N = [p, ...T],
                        j = await m.detectOverflow(t, C),
                        L = [],
                        O = (null == (n = d.flip) ? void 0 : n.overflows) || [];
                    if (h && L.push(j[E]), g) {
                        let e = z(c, f, P);
                        L.push(j[e[0]], j[e[1]])
                    }
                    if (O = [...O, {
                            placement: c,
                            overflows: L
                        }], !L.every(e => e <= 0)) {
                        let e = ((null == (o = d.flip) ? void 0 : o.index) || 0) + 1,
                            t = N[e];
                        if (t && ("alignment" !== g || S === W(t) || O.every(e => W(e.placement) !== S || e.overflows[0] > 0))) return {
                            data: {
                                index: e,
                                overflows: O
                            },
                            reset: {
                                placement: t
                            }
                        };
                        let r = null == (l = O.filter(e => e.overflows[0] <= 0).sort((e, t) => e.overflows[1] - t.overflows[1])[0]) ? void 0 : l.placement;
                        if (!r) switch (x) {
                            case "bestFit": {
                                let e = null == (i = O.filter(e => {
                                    if (A) {
                                        let t = W(e.placement);
                                        return t === S || "y" === t
                                    }
                                    return !0
                                }).map(e => [e.placement, e.overflows.filter(e => e > 0).reduce((e, t) => e + t, 0)]).sort((e, t) => e[1] - t[1])[0]) ? void 0 : i[0];
                                e && (r = e);
                                break
                            }
                            case "initialPlacement":
                                r = p
                        }
                        if (c !== r) return {
                            reset: {
                                placement: r
                            }
                        }
                    }
                    return {}
                }
            }
        },
        eK = function(e) {
            return void 0 === e && (e = {}), {
                name: "size",
                options: e,
                async fn(t) {
                    var r, n;
                    let o, l, {
                            placement: i,
                            rects: a,
                            platform: s,
                            elements: u
                        } = t,
                        {
                            apply: c = () => {},
                            ...d
                        } = I(e, t),
                        f = await s.detectOverflow(t, d),
                        p = H(i),
                        m = _(i),
                        v = "y" === W(i),
                        {
                            width: h,
                            height: g
                        } = a.floating;
                    "top" === p || "bottom" === p ? (o = p, l = m === (await (null == s.isRTL ? void 0 : s.isRTL(u.floating)) ? "start" : "end") ? "left" : "right") : (l = p, o = "end" === m ? "top" : "bottom");
                    let y = g - f.top - f.bottom,
                        x = h - f.left - f.right,
                        w = j(g - f[o], y),
                        b = j(h - f[l], x),
                        C = !t.middlewareData.shift,
                        E = w,
                        S = b;
                    if (null != (r = t.middlewareData.shift) && r.enabled.x && (S = x), null != (n = t.middlewareData.shift) && n.enabled.y && (E = y), C && !m) {
                        let e = L(f.left, 0),
                            t = L(f.right, 0),
                            r = L(f.top, 0),
                            n = L(f.bottom, 0);
                        v ? S = h - 2 * (0 !== e || 0 !== t ? e + t : L(f.left, f.right)) : E = g - 2 * (0 !== r || 0 !== n ? r + n : L(f.top, f.bottom))
                    }
                    await c({
                        ...t,
                        availableWidth: S,
                        availableHeight: E
                    });
                    let R = await s.getDimensions(u.floating);
                    return h !== R.width || g !== R.height ? {
                        reset: {
                            rects: !0
                        }
                    } : {}
                }
            }
        },
        eX = function(e) {
            return void 0 === e && (e = {}), {
                name: "hide",
                options: e,
                async fn(t) {
                    let {
                        rects: r,
                        platform: n
                    } = t, {
                        strategy: o = "referenceHidden",
                        ...l
                    } = I(e, t);
                    switch (o) {
                        case "referenceHidden": {
                            let e = ee(await n.detectOverflow(t, {
                                ...l,
                                elementContext: "reference"
                            }), r.reference);
                            return {
                                data: {
                                    referenceHiddenOffsets: e,
                                    referenceHidden: et(e)
                                }
                            }
                        }
                        case "escaped": {
                            let e = ee(await n.detectOverflow(t, {
                                ...l,
                                altBoundary: !0
                            }), r.floating);
                            return {
                                data: {
                                    escapedOffsets: e,
                                    escaped: et(e)
                                }
                            }
                        }
                        default:
                            return {}
                    }
                }
            }
        },
        eY = e => ({
            name: "arrow",
            options: e,
            async fn(t) {
                let {
                    x: r,
                    y: n,
                    placement: o,
                    rects: l,
                    platform: i,
                    elements: a,
                    middlewareData: s
                } = t, {
                    element: u,
                    padding: c = 0
                } = I(e, t) || {};
                if (null == u) return {};
                let d = q(c),
                    f = {
                        x: r,
                        y: n
                    },
                    p = F(W(o)),
                    m = B(p),
                    v = await i.getDimensions(u),
                    h = "y" === p,
                    g = h ? "clientHeight" : "clientWidth",
                    y = l.reference[m] + l.reference[p] - f[p] - l.floating[m],
                    x = f[p] - l.reference[p],
                    w = await (null == i.getOffsetParent ? void 0 : i.getOffsetParent(u)),
                    b = w ? w[g] : 0;
                b && await (null == i.isElement ? void 0 : i.isElement(w)) || (b = a.floating[g] || l.floating[m]);
                let C = b / 2 - v[m] / 2 - 1,
                    E = j(d[h ? "top" : "left"], C),
                    S = j(d[h ? "bottom" : "right"], C),
                    R = b - v[m] - S,
                    P = b / 2 - v[m] / 2 + (y / 2 - x / 2),
                    T = L(E, j(P, R)),
                    A = !s.arrow && null != _(o) && P !== T && l.reference[m] / 2 - (P < E ? E : S) - v[m] / 2 < 0,
                    N = A ? P < E ? P - E : P - R : 0;
                return {
                    [p]: f[p] + N,
                    data: {
                        [p]: T,
                        centerOffset: P - T - N,
                        ...A && {
                            alignmentOffset: N
                        }
                    },
                    reset: A
                }
            }
        }),
        eG = function(e) {
            return void 0 === e && (e = {}), {
                options: e,
                fn(t) {
                    let {
                        x: r,
                        y: n,
                        placement: o,
                        rects: l,
                        middlewareData: i
                    } = t, {
                        offset: a = 0,
                        mainAxis: s = !0,
                        crossAxis: u = !0
                    } = I(e, t), c = {
                        x: r,
                        y: n
                    }, d = W(o), f = F(d), p = c[f], m = c[d], v = I(a, t), h = "number" == typeof v ? {
                        mainAxis: v,
                        crossAxis: 0
                    } : {
                        mainAxis: 0,
                        crossAxis: 0,
                        ...v
                    };
                    if (s) {
                        let e = "y" === f ? "height" : "width",
                            t = l.reference[f] - l.floating[e] + h.mainAxis,
                            r = l.reference[f] + l.reference[e] - h.mainAxis;
                        p < t ? p = t : p > r && (p = r)
                    }
                    if (u) {
                        var g, y;
                        let e = "y" === f ? "width" : "height",
                            t = en.has(H(o)),
                            r = l.reference[d] - l.floating[e] + (t && (null == (g = i.offset) ? void 0 : g[d]) || 0) + (t ? 0 : h.crossAxis),
                            n = l.reference[d] + l.reference[e] + (t ? 0 : (null == (y = i.offset) ? void 0 : y[d]) || 0) - (t ? h.crossAxis : 0);
                        m < r ? m = r : m > n && (m = n)
                    }
                    return {
                        [f]: p,
                        [d]: m
                    }
                }
            }
        },
        eq = (e, t, r) => {
            let n = new Map,
                o = {
                    platform: eF,
                    ...r
                },
                l = {
                    ...o.platform,
                    _c: n
                };
            return Q(e, t, {
                ...o,
                platform: l
            })
        };
    e.s(["arrow", 0, eY, "autoPlacement", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "autoPlacement",
            options: e,
            async fn(t) {
                var r, n, o, l;
                let {
                    rects: i,
                    middlewareData: a,
                    placement: s,
                    platform: u,
                    elements: c
                } = t, {
                    crossAxis: d = !1,
                    alignment: f,
                    allowedPlacements: p = N,
                    autoAlignment: m = !0,
                    ...v
                } = I(e, t), h = void 0 !== f || p === N ? ((l = f || null) ? [...p.filter(e => _(e) === l), ...p.filter(e => _(e) !== l)] : p.filter(e => H(e) === e)).filter(e => !l || _(e) === l || !!m && V(e) !== e) : p, g = await u.detectOverflow(t, v), y = (null == (r = a.autoPlacement) ? void 0 : r.index) || 0, x = h[y];
                if (null == x) return {};
                let w = z(x, i, await (null == u.isRTL ? void 0 : u.isRTL(c.floating)));
                if (s !== x) return {
                    reset: {
                        placement: h[0]
                    }
                };
                let b = [g[H(x)], g[w[0]], g[w[1]]],
                    C = [...(null == (n = a.autoPlacement) ? void 0 : n.overflows) || [], {
                        placement: x,
                        overflows: b
                    }],
                    E = h[y + 1];
                if (E) return {
                    data: {
                        index: y + 1,
                        overflows: C
                    },
                    reset: {
                        placement: E
                    }
                };
                let S = C.map(e => {
                        let t = _(e.placement);
                        return [e.placement, t && d ? e.overflows.slice(0, 2).reduce((e, t) => e + t, 0) : e.overflows[0], e.overflows]
                    }).sort((e, t) => e[1] - t[1]),
                    R = (null == (o = S.filter(e => e[2].slice(0, _(e[0]) ? 2 : 3).every(e => e <= 0))[0]) ? void 0 : o[0]) || S[0][0];
                return R !== s ? {
                    data: {
                        index: y + 1,
                        overflows: C
                    },
                    reset: {
                        placement: R
                    }
                } : {}
            }
        }
    }, "autoUpdate", 0, eW, "computePosition", 0, eq, "flip", 0, eU, "hide", 0, eX, "inline", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "inline",
            options: e,
            async fn(t) {
                let {
                    placement: r,
                    elements: n,
                    rects: o,
                    platform: l,
                    strategy: i
                } = t, {
                    padding: a = 2,
                    x: s,
                    y: u
                } = I(e, t), c = Array.from(await (null == l.getClientRects ? void 0 : l.getClientRects(n.reference)) || []), d = function(e) {
                    let t = e.slice().sort((e, t) => e.y - t.y),
                        r = [],
                        n = null;
                    for (let e = 0; e < t.length; e++) {
                        let o = t[e];
                        !n || o.y - n.y > n.height / 2 ? r.push([o]) : r[r.length - 1].push(o), n = o
                    }
                    return r.map(e => Z(er(e)))
                }(c), f = Z(er(c)), p = q(a), m = await l.getElementRects({
                    reference: {
                        getBoundingClientRect: function() {
                            if (2 === d.length && d[0].left > d[1].right && null != s && null != u) return d.find(e => s > e.left - p.left && s < e.right + p.right && u > e.top - p.top && u < e.bottom + p.bottom) || f;
                            if (d.length >= 2) {
                                if ("y" === W(r)) {
                                    let e = d[0],
                                        t = d[d.length - 1],
                                        n = "top" === H(r),
                                        o = e.top,
                                        l = t.bottom,
                                        i = n ? e.left : t.left,
                                        a = n ? e.right : t.right;
                                    return {
                                        top: o,
                                        bottom: l,
                                        left: i,
                                        right: a,
                                        width: a - i,
                                        height: l - o,
                                        x: i,
                                        y: o
                                    }
                                }
                                let e = "left" === H(r),
                                    t = L(...d.map(e => e.right)),
                                    n = j(...d.map(e => e.left)),
                                    o = d.filter(r => e ? r.left === n : r.right === t),
                                    l = o[0].top,
                                    i = o[o.length - 1].bottom;
                                return {
                                    top: l,
                                    bottom: i,
                                    left: n,
                                    right: t,
                                    width: t - n,
                                    height: i - l,
                                    x: n,
                                    y: l
                                }
                            }
                            return f
                        }
                    },
                    floating: n.floating,
                    strategy: i
                });
                return o.reference.x !== m.reference.x || o.reference.y !== m.reference.y || o.reference.width !== m.reference.width || o.reference.height !== m.reference.height ? {
                    reset: {
                        rects: m
                    }
                } : {}
            }
        }
    }, "limitShift", 0, eG, "offset", 0, ez, "shift", 0, eV, "size", 0, eK], 992486);
    var eZ = "u" > typeof document ? l.useLayoutEffect : function() {};

    function e$(e, t) {
        let r, n, o;
        if (e === t) return !0;
        if (typeof e != typeof t) return !1;
        if ("function" == typeof e && e.toString() === t.toString()) return !0;
        if (e && t && "object" == typeof e) {
            if (Array.isArray(e)) {
                if ((r = e.length) !== t.length) return !1;
                for (n = r; 0 != n--;)
                    if (!e$(e[n], t[n])) return !1;
                return !0
            }
            if ((r = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (n = r; 0 != n--;)
                if (!({}).hasOwnProperty.call(t, o[n])) return !1;
            for (n = r; 0 != n--;) {
                let r = o[n];
                if (("_owner" !== r || !e.$$typeof) && !e$(e[r], t[r])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function eJ(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function eQ(e, t) {
        let r = eJ(e);
        return Math.round(t * r) / r
    }

    function e0(e) {
        let t = l.useRef(e);
        return eZ(() => {
            t.current = e
        }), t
    }

    function e1(e) {
        void 0 === e && (e = {});
        let {
            placement: t = "bottom",
            strategy: r = "absolute",
            middleware: n = [],
            platform: o,
            elements: {
                reference: i,
                floating: a
            } = {},
            transform: s = !0,
            whileElementsMounted: u,
            open: c
        } = e, [d, f] = l.useState({
            x: 0,
            y: 0,
            strategy: r,
            placement: t,
            middlewareData: {},
            isPositioned: !1
        }), [m, v] = l.useState(n);
        e$(m, n) || v(n);
        let [h, g] = l.useState(null), [y, x] = l.useState(null), w = l.useCallback(e => {
            e !== S.current && (S.current = e, g(e))
        }, []), b = l.useCallback(e => {
            e !== R.current && (R.current = e, x(e))
        }, []), C = i || h, E = a || y, S = l.useRef(null), R = l.useRef(null), P = l.useRef(d), T = null != u, A = e0(u), N = e0(o), j = e0(c), L = l.useCallback(() => {
            if (!S.current || !R.current) return;
            let e = {
                placement: t,
                strategy: r,
                middleware: m
            };
            N.current && (e.platform = N.current), eq(S.current, R.current, e).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== j.current
                };
                O.current && !e$(P.current, t) && (P.current = t, p.flushSync(() => {
                    f(t)
                }))
            })
        }, [m, t, r, N, j]);
        eZ(() => {
            !1 === c && P.current.isPositioned && (P.current.isPositioned = !1, f(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [c]);
        let O = l.useRef(!1);
        eZ(() => (O.current = !0, () => {
            O.current = !1
        }), []), eZ(() => {
            if (C && (S.current = C), E && (R.current = E), C && E) {
                if (A.current) return A.current(C, E, L);
                L()
            }
        }, [C, E, L, A, T]);
        let k = l.useMemo(() => ({
                reference: S,
                floating: R,
                setReference: w,
                setFloating: b
            }), [w, b]),
            M = l.useMemo(() => ({
                reference: C,
                floating: E
            }), [C, E]),
            D = l.useMemo(() => {
                let e = {
                    position: r,
                    left: 0,
                    top: 0
                };
                if (!M.floating) return e;
                let t = eQ(M.floating, d.x),
                    n = eQ(M.floating, d.y);
                return s ? {
                    ...e,
                    transform: "translate(" + t + "px, " + n + "px)",
                    ...eJ(M.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: r,
                    left: t,
                    top: n
                }
            }, [r, s, M.floating, d.x, d.y]);
        return l.useMemo(() => ({
            ...d,
            update: L,
            refs: k,
            elements: M,
            floatingStyles: D
        }), [d, L, k, M, D])
    }
    let e2 = (e, t) => {
            let r = ez(e);
            return {
                name: r.name,
                fn: r.fn,
                options: [e, t]
            }
        },
        e6 = (e, t) => {
            let r = eV(e);
            return {
                name: r.name,
                fn: r.fn,
                options: [e, t]
            }
        },
        e5 = (e, t) => ({
            fn: eG(e).fn,
            options: [e, t]
        }),
        e4 = (e, t) => {
            let r = eU(e);
            return {
                name: r.name,
                fn: r.fn,
                options: [e, t]
            }
        },
        e9 = (e, t) => {
            let r = eK(e);
            return {
                name: r.name,
                fn: r.fn,
                options: [e, t]
            }
        },
        e3 = (e, t) => {
            let r = eX(e);
            return {
                name: r.name,
                fn: r.fn,
                options: [e, t]
            }
        },
        e8 = (e, t) => {
            let r = {
                name: "arrow",
                options: e,
                fn(t) {
                    let {
                        element: r,
                        padding: n
                    } = "function" == typeof e ? e(t) : e;
                    return r && ({}).hasOwnProperty.call(r, "current") ? null != r.current ? eY({
                        element: r.current,
                        padding: n
                    }).fn(t) : {} : r ? eY({
                        element: r,
                        padding: n
                    }).fn(t) : {}
                }
            };
            return {
                name: r.name,
                fn: r.fn,
                options: [e, t]
            }
        };
    e.s(["arrow", 0, e8, "flip", 0, e4, "hide", 0, e3, "limitShift", 0, e5, "offset", 0, e2, "shift", 0, e6, "size", 0, e9, "useFloating", 0, e1], 297452);
    var e7 = l.forwardRef((e, t) => {
        let {
            children: r,
            width: n = 10,
            height: o = 5,
            ...l
        } = e;
        return (0, d.jsx)(y.svg, {
            ...l,
            ref: t,
            width: n,
            height: o,
            viewBox: "0 0 30 10",
            preserveAspectRatio: "none",
            children: e.asChild ? r : (0, d.jsx)("polygon", {
                points: "0,0 30,0 15,10"
            })
        })
    });
    e7.displayName = "Arrow";
    var te = "Popper",
        [tt, tr] = f(te),
        [tn, to] = tt(te),
        tl = e => {
            let {
                __scopePopper: t,
                children: r
            } = e, [n, o] = l.useState(null);
            return (0, d.jsx)(tn, {
                scope: t,
                anchor: n,
                onAnchorChange: o,
                children: r
            })
        };
    tl.displayName = te;
    var ti = "PopperAnchor",
        ta = l.forwardRef((e, t) => {
            let {
                __scopePopper: r,
                virtualRef: n,
                ...o
            } = e, i = to(ti, r), a = l.useRef(null), s = c(t, a);
            return l.useEffect(() => {
                i.onAnchorChange((null == n ? void 0 : n.current) || a.current)
            }), n ? null : (0, d.jsx)(y.div, {
                ...o,
                ref: s
            })
        });
    ta.displayName = ti;
    var ts = "PopperContent",
        [tu, tc] = tt(ts),
        td = l.forwardRef((e, t) => {
            var r, n, o, i, a, s, u, f;
            let {
                __scopePopper: p,
                side: m = "bottom",
                sideOffset: v = 0,
                align: h = "center",
                alignOffset: g = 0,
                arrowPadding: w = 0,
                avoidCollisions: b = !0,
                collisionBoundary: C = [],
                collisionPadding: E = 0,
                sticky: S = "partial",
                hideWhenDetached: P = !1,
                updatePositionStrategy: T = "optimized",
                onPlaced: A,
                ...N
            } = e, j = to(ts, p), [L, O] = l.useState(null), k = c(t, e => O(e)), [M, D] = l.useState(null), I = function(e) {
                let [t, r] = l.useState(void 0);
                return R(() => {
                    if (e) {
                        r({
                            width: e.offsetWidth,
                            height: e.offsetHeight
                        });
                        let t = new ResizeObserver(t => {
                            let n, o;
                            if (!Array.isArray(t) || !t.length) return;
                            let l = t[0];
                            if ("borderBoxSize" in l) {
                                let e = l.borderBoxSize,
                                    t = Array.isArray(e) ? e[0] : e;
                                n = t.inlineSize, o = t.blockSize
                            } else n = e.offsetWidth, o = e.offsetHeight;
                            r({
                                width: n,
                                height: o
                            })
                        });
                        return t.observe(e, {
                            box: "border-box"
                        }), () => t.unobserve(e)
                    }
                    r(void 0)
                }, [e]), t
            }(M), H = null != (r = null == I ? void 0 : I.width) ? r : 0, _ = null != (n = null == I ? void 0 : I.height) ? n : 0, F = "number" == typeof E ? E : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...E
            }, B = Array.isArray(C) ? C : [C], W = B.length > 0, z = {
                padding: F,
                boundary: B.filter(tv),
                altBoundary: W
            }, {
                refs: V,
                floatingStyles: U,
                placement: K,
                isPositioned: X,
                middlewareData: Y
            } = e1({
                strategy: "fixed",
                placement: m + ("center" !== h ? "-" + h : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return eW(...t, {
                        animationFrame: "always" === T
                    })
                },
                elements: {
                    reference: j.anchor
                },
                middleware: [e2({
                    mainAxis: v + _,
                    alignmentAxis: g
                }), b && e6({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === S ? e5() : void 0,
                    ...z
                }), b && e4({
                    ...z
                }), e9({
                    ...z,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: n,
                            availableHeight: o
                        } = e, {
                            width: l,
                            height: i
                        } = r.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(n, "px")), a.setProperty("--radix-popper-available-height", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(i, "px"))
                    }
                }), M && e8({
                    element: M,
                    padding: w
                }), th({
                    arrowWidth: H,
                    arrowHeight: _
                }), P && e3({
                    strategy: "referenceHidden",
                    ...z
                })]
            }), [G, q] = tg(K), Z = x(A);
            R(() => {
                X && (null == Z || Z())
            }, [X, Z]);
            let $ = null == (o = Y.arrow) ? void 0 : o.x,
                J = null == (i = Y.arrow) ? void 0 : i.y,
                Q = (null == (a = Y.arrow) ? void 0 : a.centerOffset) !== 0,
                [ee, et] = l.useState();
            return R(() => {
                L && et(window.getComputedStyle(L).zIndex)
            }, [L]), (0, d.jsx)("div", {
                ref: V.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...U,
                    transform: X ? U.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: ee,
                    "--radix-popper-transform-origin": [null == (s = Y.transformOrigin) ? void 0 : s.x, null == (u = Y.transformOrigin) ? void 0 : u.y].join(" "),
                    ...(null == (f = Y.hide) ? void 0 : f.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, d.jsx)(tu, {
                    scope: p,
                    placedSide: G,
                    onArrowChange: D,
                    arrowX: $,
                    arrowY: J,
                    shouldHideArrow: Q,
                    children: (0, d.jsx)(y.div, {
                        "data-side": G,
                        "data-align": q,
                        ...N,
                        ref: k,
                        style: {
                            ...N.style,
                            animation: X ? void 0 : "none"
                        }
                    })
                })
            })
        });
    td.displayName = ts;
    var tf = "PopperArrow",
        tp = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        tm = l.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, o = tc(tf, r), l = tp[o.placedSide];
            return (0, d.jsx)("span", {
                ref: o.onArrowChange,
                style: {
                    position: "absolute",
                    left: o.arrowX,
                    top: o.arrowY,
                    [l]: 0,
                    transformOrigin: {
                        top: "",
                        right: "0 0",
                        bottom: "center 0",
                        left: "100% 0"
                    } [o.placedSide],
                    transform: {
                        top: "translateY(100%)",
                        right: "translateY(50%) rotate(90deg) translateX(-50%)",
                        bottom: "rotate(180deg)",
                        left: "translateY(50%) rotate(-90deg) translateX(50%)"
                    } [o.placedSide],
                    visibility: o.shouldHideArrow ? "hidden" : void 0
                },
                children: (0, d.jsx)(e7, {
                    ...n,
                    ref: t,
                    style: {
                        ...n.style,
                        display: "block"
                    }
                })
            })
        });

    function tv(e) {
        return null !== e
    }
    tm.displayName = tf;
    var th = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, n, o, l, i;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, m] = tg(a), v = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], h = (null != (r = null == (l = u.arrow) ? void 0 : l.x) ? r : 0) + d / 2, g = (null != (n = null == (i = u.arrow) ? void 0 : i.y) ? n : 0) + f / 2, y = "", x = "";
            return "bottom" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(-f, "px")) : "top" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), x = c ? v : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), x = c ? v : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: x
                }
            }
        }
    });

    function tg(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    var ty = l.forwardRef((e, t) => {
        var r, n;
        let {
            container: o,
            ...i
        } = e, [a, s] = l.useState(!1);
        R(() => s(!0), []);
        let u = o || a && (null == (n = globalThis) || null == (r = n.document) ? void 0 : r.body);
        return u ? p.default.createPortal((0, d.jsx)(y.div, {
            ...i,
            ref: t
        }), u) : null
    });
    ty.displayName = "Portal";
    var tx = e => {
        var t, r, n;
        let o, i, {
                present: a,
                children: s
            } = e,
            u = function(e) {
                var t, r;
                let [n, o] = l.useState(), i = l.useRef({}), a = l.useRef(e), s = l.useRef("none"), [u, c] = (t = e ? "mounted" : "unmounted", r = {
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
                }, l.useReducer((e, t) => {
                    let n = r[e][t];
                    return null != n ? n : e
                }, t));
                return l.useEffect(() => {
                    let e = tw(i.current);
                    s.current = "mounted" === u ? e : "none"
                }, [u]), R(() => {
                    let t = i.current,
                        r = a.current;
                    if (r !== e) {
                        let n = s.current,
                            o = tw(t);
                        e ? c("MOUNT") : "none" === o || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : r && n !== o ? c("ANIMATION_OUT") : c("UNMOUNT"), a.current = e
                    }
                }, [e, c]), R(() => {
                    if (n) {
                        var e;
                        let t, r = null != (e = n.ownerDocument.defaultView) ? e : window,
                            o = e => {
                                let o = tw(i.current).includes(e.animationName);
                                if (e.target === n && o && (c("ANIMATION_END"), !a.current)) {
                                    let e = n.style.animationFillMode;
                                    n.style.animationFillMode = "forwards", t = r.setTimeout(() => {
                                        "forwards" === n.style.animationFillMode && (n.style.animationFillMode = e)
                                    })
                                }
                            },
                            l = e => {
                                e.target === n && (s.current = tw(i.current))
                            };
                        return n.addEventListener("animationstart", l), n.addEventListener("animationcancel", o), n.addEventListener("animationend", o), () => {
                            r.clearTimeout(t), n.removeEventListener("animationstart", l), n.removeEventListener("animationcancel", o), n.removeEventListener("animationend", o)
                        }
                    }
                    c("ANIMATION_END")
                }, [n, c]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(u),
                    ref: l.useCallback(e => {
                        e && (i.current = getComputedStyle(e)), o(e)
                    }, [])
                }
            }(a),
            d = "function" == typeof s ? s({
                present: u.isPresent
            }) : l.Children.only(s),
            f = c(u.ref, (i = (o = null == (r = Object.getOwnPropertyDescriptor((t = d).props, "ref")) ? void 0 : r.get) && "isReactWarning" in o && o.isReactWarning) ? t.ref : (i = (o = null == (n = Object.getOwnPropertyDescriptor(t, "ref")) ? void 0 : n.get) && "isReactWarning" in o && o.isReactWarning) ? t.props.ref : t.props.ref || t.ref);
        return "function" == typeof s || u.isPresent ? l.cloneElement(d, {
            ref: f
        }) : null
    };

    function tw(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    tx.displayName = "Presence";
    var tb = l.forwardRef((e, t) => (0, d.jsx)(y.span, {
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
    tb.displayName = "VisuallyHidden";
    var [tC, tE] = f("Tooltip", [tr]), tS = tr(), tR = "TooltipProvider", tP = "tooltip.open", [tT, tA] = tC(tR), tN = e => {
        let {
            __scopeTooltip: t,
            delayDuration: r = 700,
            skipDelayDuration: n = 300,
            disableHoverableContent: o = !1,
            children: i
        } = e, [a, s] = l.useState(!0), u = l.useRef(!1), c = l.useRef(0);
        return l.useEffect(() => {
            let e = c.current;
            return () => window.clearTimeout(e)
        }, []), (0, d.jsx)(tT, {
            scope: t,
            isOpenDelayed: a,
            delayDuration: r,
            onOpen: l.useCallback(() => {
                window.clearTimeout(c.current), s(!1)
            }, []),
            onClose: l.useCallback(() => {
                window.clearTimeout(c.current), c.current = window.setTimeout(() => s(!0), n)
            }, [n]),
            isPointerInTransitRef: u,
            onPointerInTransitChange: l.useCallback(e => {
                u.current = e
            }, []),
            disableHoverableContent: o,
            children: i
        })
    };
    tN.displayName = tR;
    var tj = "Tooltip",
        [tL, tO] = tC(tj),
        tk = e => {
            let {
                __scopeTooltip: t,
                children: r,
                open: n,
                defaultOpen: o = !1,
                onOpenChange: i,
                disableHoverableContent: a,
                delayDuration: s
            } = e, u = tA(tj, e.__scopeTooltip), c = tS(t), [f, p] = l.useState(null), m = function() {
                let [e, t] = l.useState(P());
                return R(() => {
                    t(e => null != e ? e : String(T++))
                }, [void 0]), e ? "radix-".concat(e) : ""
            }(), v = l.useRef(0), h = null != a ? a : u.disableHoverableContent, g = null != s ? s : u.delayDuration, y = l.useRef(!1), [w = !1, b] = function(e) {
                let {
                    prop: t,
                    defaultProp: r,
                    onChange: n = () => {}
                } = e, [o, i] = function(e) {
                    let {
                        defaultProp: t,
                        onChange: r
                    } = e, n = l.useState(t), [o] = n, i = l.useRef(o), a = x(r);
                    return l.useEffect(() => {
                        i.current !== o && (a(o), i.current = o)
                    }, [o, i, a]), n
                }({
                    defaultProp: r,
                    onChange: n
                }), a = void 0 !== t, s = a ? t : o, u = x(n);
                return [s, l.useCallback(e => {
                    if (a) {
                        let r = "function" == typeof e ? e(t) : e;
                        r !== t && u(r)
                    } else i(e)
                }, [a, t, i, u])]
            }({
                prop: n,
                defaultProp: o,
                onChange: e => {
                    e ? (u.onOpen(), document.dispatchEvent(new CustomEvent(tP))) : u.onClose(), null == i || i(e)
                }
            }), C = l.useMemo(() => w ? y.current ? "delayed-open" : "instant-open" : "closed", [w]), E = l.useCallback(() => {
                window.clearTimeout(v.current), v.current = 0, y.current = !1, b(!0)
            }, [b]), S = l.useCallback(() => {
                window.clearTimeout(v.current), v.current = 0, b(!1)
            }, [b]), A = l.useCallback(() => {
                window.clearTimeout(v.current), v.current = window.setTimeout(() => {
                    y.current = !0, b(!0), v.current = 0
                }, g)
            }, [g, b]);
            return l.useEffect(() => () => {
                v.current && (window.clearTimeout(v.current), v.current = 0)
            }, []), (0, d.jsx)(tl, {
                ...c,
                children: (0, d.jsx)(tL, {
                    scope: t,
                    contentId: m,
                    open: w,
                    stateAttribute: C,
                    trigger: f,
                    onTriggerChange: p,
                    onTriggerEnter: l.useCallback(() => {
                        u.isOpenDelayed ? A() : E()
                    }, [u.isOpenDelayed, A, E]),
                    onTriggerLeave: l.useCallback(() => {
                        h ? S() : (window.clearTimeout(v.current), v.current = 0)
                    }, [S, h]),
                    onOpen: E,
                    onClose: S,
                    disableHoverableContent: h,
                    children: r
                })
            })
        };
    tk.displayName = tj;
    var tM = "TooltipTrigger",
        tD = l.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                ...n
            } = e, o = tO(tM, r), i = tA(tM, r), s = tS(r), u = c(t, l.useRef(null), o.onTriggerChange), f = l.useRef(!1), p = l.useRef(!1), m = l.useCallback(() => f.current = !1, []);
            return l.useEffect(() => () => document.removeEventListener("pointerup", m), [m]), (0, d.jsx)(ta, {
                asChild: !0,
                ...s,
                children: (0, d.jsx)(y.button, {
                    "aria-describedby": o.open ? o.contentId : void 0,
                    "data-state": o.stateAttribute,
                    ...n,
                    ref: u,
                    onPointerMove: a(e.onPointerMove, e => {
                        "touch" !== e.pointerType && (p.current || i.isPointerInTransitRef.current || (o.onTriggerEnter(), p.current = !0))
                    }),
                    onPointerLeave: a(e.onPointerLeave, () => {
                        o.onTriggerLeave(), p.current = !1
                    }),
                    onPointerDown: a(e.onPointerDown, () => {
                        f.current = !0, document.addEventListener("pointerup", m, {
                            once: !0
                        })
                    }),
                    onFocus: a(e.onFocus, () => {
                        f.current || o.onOpen()
                    }),
                    onBlur: a(e.onBlur, o.onClose),
                    onClick: a(e.onClick, o.onClose)
                })
            })
        });
    tD.displayName = tM;
    var tI = "TooltipPortal",
        [tH, t_] = tC(tI, {
            forceMount: void 0
        }),
        tF = e => {
            let {
                __scopeTooltip: t,
                forceMount: r,
                children: n,
                container: o
            } = e, l = tO(tI, t);
            return (0, d.jsx)(tH, {
                scope: t,
                forceMount: r,
                children: (0, d.jsx)(tx, {
                    present: r || l.open,
                    children: (0, d.jsx)(ty, {
                        asChild: !0,
                        container: o,
                        children: n
                    })
                })
            })
        };
    tF.displayName = tI;
    var tB = "TooltipContent",
        tW = l.forwardRef((e, t) => {
            let r = t_(tB, e.__scopeTooltip),
                {
                    forceMount: n = r.forceMount,
                    side: o = "top",
                    ...l
                } = e,
                i = tO(tB, e.__scopeTooltip);
            return (0, d.jsx)(tx, {
                present: n || i.open,
                children: i.disableHoverableContent ? (0, d.jsx)(tK, {
                    side: o,
                    ...l,
                    ref: t
                }) : (0, d.jsx)(tz, {
                    side: o,
                    ...l,
                    ref: t
                })
            })
        }),
        tz = l.forwardRef((e, t) => {
            let r = tO(tB, e.__scopeTooltip),
                n = tA(tB, e.__scopeTooltip),
                o = l.useRef(null),
                i = c(t, o),
                [a, s] = l.useState(null),
                {
                    trigger: u,
                    onClose: f
                } = r,
                p = o.current,
                {
                    onPointerInTransitChange: m
                } = n,
                v = l.useCallback(() => {
                    s(null), m(!1)
                }, [m]),
                h = l.useCallback((e, t) => {
                    let r, n = e.currentTarget,
                        o = {
                            x: e.clientX,
                            y: e.clientY
                        },
                        l = function(e, t) {
                            let r = Math.abs(t.top - e.y),
                                n = Math.abs(t.bottom - e.y),
                                o = Math.abs(t.right - e.x),
                                l = Math.abs(t.left - e.x);
                            switch (Math.min(r, n, o, l)) {
                                case l:
                                    return "left";
                                case o:
                                    return "right";
                                case r:
                                    return "top";
                                case n:
                                    return "bottom";
                                default:
                                    throw Error("unreachable")
                            }
                        }(o, n.getBoundingClientRect());
                    s(((r = [... function(e, t) {
                        let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5,
                            n = [];
                        switch (t) {
                            case "top":
                                n.push({
                                    x: e.x - r,
                                    y: e.y + r
                                }, {
                                    x: e.x + r,
                                    y: e.y + r
                                });
                                break;
                            case "bottom":
                                n.push({
                                    x: e.x - r,
                                    y: e.y - r
                                }, {
                                    x: e.x + r,
                                    y: e.y - r
                                });
                                break;
                            case "left":
                                n.push({
                                    x: e.x + r,
                                    y: e.y - r
                                }, {
                                    x: e.x + r,
                                    y: e.y + r
                                });
                                break;
                            case "right":
                                n.push({
                                    x: e.x - r,
                                    y: e.y - r
                                }, {
                                    x: e.x - r,
                                    y: e.y + r
                                })
                        }
                        return n
                    }(o, l), ... function(e) {
                        let {
                            top: t,
                            right: r,
                            bottom: n,
                            left: o
                        } = e;
                        return [{
                            x: o,
                            y: t
                        }, {
                            x: r,
                            y: t
                        }, {
                            x: r,
                            y: n
                        }, {
                            x: o,
                            y: n
                        }]
                    }(t.getBoundingClientRect())].slice()).sort((e, t) => e.x < t.x ? -1 : e.x > t.x ? 1 : e.y < t.y ? -1 : 1 * !!(e.y > t.y)), function(e) {
                        if (e.length <= 1) return e.slice();
                        let t = [];
                        for (let r = 0; r < e.length; r++) {
                            let n = e[r];
                            for (; t.length >= 2;) {
                                let e = t[t.length - 1],
                                    r = t[t.length - 2];
                                if ((e.x - r.x) * (n.y - r.y) >= (e.y - r.y) * (n.x - r.x)) t.pop();
                                else break
                            }
                            t.push(n)
                        }
                        t.pop();
                        let r = [];
                        for (let t = e.length - 1; t >= 0; t--) {
                            let n = e[t];
                            for (; r.length >= 2;) {
                                let e = r[r.length - 1],
                                    t = r[r.length - 2];
                                if ((e.x - t.x) * (n.y - t.y) >= (e.y - t.y) * (n.x - t.x)) r.pop();
                                else break
                            }
                            r.push(n)
                        }
                        return (r.pop(), 1 === t.length && 1 === r.length && t[0].x === r[0].x && t[0].y === r[0].y) ? t : t.concat(r)
                    }(r))), m(!0)
                }, [m]);
            return l.useEffect(() => () => v(), [v]), l.useEffect(() => {
                if (u && p) {
                    let e = e => h(e, p),
                        t = e => h(e, u);
                    return u.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t), () => {
                        u.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                    }
                }
            }, [u, p, h, v]), l.useEffect(() => {
                if (a) {
                    let e = e => {
                        let t = e.target,
                            r = {
                                x: e.clientX,
                                y: e.clientY
                            },
                            n = (null == u ? void 0 : u.contains(t)) || (null == p ? void 0 : p.contains(t)),
                            o = ! function(e, t) {
                                let {
                                    x: r,
                                    y: n
                                } = e, o = !1;
                                for (let e = 0, l = t.length - 1; e < t.length; l = e++) {
                                    let i = t[e].x,
                                        a = t[e].y,
                                        s = t[l].x,
                                        u = t[l].y;
                                    a > n != u > n && r < (s - i) * (n - a) / (u - a) + i && (o = !o)
                                }
                                return o
                            }(r, a);
                        n ? v() : o && (v(), f())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [u, p, a, f, v]), (0, d.jsx)(tK, {
                ...e,
                ref: i
            })
        }),
        [tV, tU] = tC(tj, {
            isInside: !1
        }),
        tK = l.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                children: n,
                "aria-label": o,
                onEscapeKeyDown: i,
                onPointerDownOutside: a,
                ...s
            } = e, u = tO(tB, r), c = tS(r), {
                onClose: f
            } = u;
            return l.useEffect(() => (document.addEventListener(tP, f), () => document.removeEventListener(tP, f)), [f]), l.useEffect(() => {
                if (u.trigger) {
                    let e = e => {
                        let t = e.target;
                        (null == t ? void 0 : t.contains(u.trigger)) && f()
                    };
                    return window.addEventListener("scroll", e, {
                        capture: !0
                    }), () => window.removeEventListener("scroll", e, {
                        capture: !0
                    })
                }
            }, [u.trigger, f]), (0, d.jsx)(C, {
                asChild: !0,
                disableOutsidePointerEvents: !1,
                onEscapeKeyDown: i,
                onPointerDownOutside: a,
                onFocusOutside: e => e.preventDefault(),
                onDismiss: f,
                children: (0, d.jsxs)(td, {
                    "data-state": u.stateAttribute,
                    ...c,
                    ...s,
                    ref: t,
                    style: {
                        ...s.style,
                        "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                        "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                        "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                        "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                        "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                    },
                    children: [(0, d.jsx)(h, {
                        children: n
                    }), (0, d.jsx)(tV, {
                        scope: r,
                        isInside: !0,
                        children: (0, d.jsx)(tb, {
                            id: u.contentId,
                            role: "tooltip",
                            children: o || n
                        })
                    })]
                })
            })
        });
    tW.displayName = tB;
    var tX = "TooltipArrow",
        tY = l.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                ...n
            } = e, o = tS(r);
            return tU(tX, r).isInside ? null : (0, d.jsx)(tm, {
                ...o,
                ...n,
                ref: t
            })
        });
    tY.displayName = tX, e.s(["Tooltip", 0, function(e) {
        let {
            position: t,
            hasBeak: r = !0,
            title: n,
            description: a,
            ariaLabel: s,
            delayDurationMs: u = 500,
            children: c,
            open: d,
            onOpenChange: f,
            contentClassName: p
        } = e, [m, v] = t.split("-"), h = null != s ? s : "string" == typeof n && null == a ? n : void 0;
        return l.createElement(tN, {
            delayDuration: u
        }, l.createElement(tk, {
            open: d,
            onOpenChange: f
        }, c, l.createElement(tF, null, l.createElement(tW, {
            side: m,
            align: v,
            "aria-label": h,
            className: (0, o.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", p),
            sideOffset: 5
        }, r && l.createElement(tY, {
            asChild: !0
        }, l.createElement(i, {
            className: "content-[var(--inverse-surface-0)]"
        })), l.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, l.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, n), a && l.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, a))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: r,
            className: n
        } = e;
        return l.createElement(tD, {
            asChild: r,
            className: n
        }, t)
    }], 515351)
}, 148380, e => {
    "use strict";
    var t = e.i(75584),
        r = e.i(515351),
        n = e.i(416340);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: o,
            description: l,
            position: i = "top-center"
        } = e;
        return n.default.createElement(r.Tooltip, {
            position: i,
            title: o,
            description: l
        }, n.default.createElement(r.TooltipTrigger, {
            asChild: !0
        }, n.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": o,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, n.default.createElement(t.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }])
}, 750615, e => {
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
}, 561579, e => {
    "use strict";
    var t = e.i(194250),
        r = e.i(416340),
        n = e.i(863605),
        o = e.i(154502),
        l = e.i(945146),
        i = e.i(690569),
        a = e.i(251635),
        s = e.i(787802),
        u = e.i(221628),
        c = e.i(770593),
        d = e.i(121880);

    function f(e) {
        return (0, i.g)("MuiCard", e)
    }
    e.i(407110), (0, s.g)("MuiCard", ["root"]);
    let p = ["className", "raised"],
        m = (0, a.s)(c.M, {
            name: "MuiCard",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })(() => ({
            overflow: "hidden"
        })),
        v = r.forwardRef(function(e, t) {
            let r = (0, d.u)({
                    props: e,
                    name: "MuiCard"
                }),
                {
                    className: n,
                    raised: o = !1
                } = r,
                s = (0, i._)(r, p),
                c = (0, l._)({}, r, {
                    raised: o
                }),
                v = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, a.a)({
                        root: ["root"]
                    }, f, t)
                })(c);
            return (0, u.jsx)(m, (0, l._)({
                className: (0, a.c)(v.root, n),
                elevation: o ? 8 : void 0,
                ref: t,
                ownerState: c
            }, s))
        });
    var h = (0, n.default)({
            name: "Card"
        })(function(e, r) {
            var n = r.variant;
            return {
                root: (0, t._)({
                    boxShadow: "none",
                    overflow: "hidden",
                    WebkitMaskImage: "-webkit-radial-gradient(white, black)",
                    backgroundColor: "outlined" === n ? "transparent" : e.palette.surface[200],
                    position: "relative"
                }, e.border.radius.large)
            }
        }),
        g = (0, r.forwardRef)(function(e, n) {
            var l = e.children,
                i = e.classes,
                a = e.variant,
                s = e.className,
                u = (0, t.a)(e, ["children", "classes", "variant", "className"]),
                c = h((0, t._)((0, t._)({}, u), {
                    variant: a
                }), {
                    props: {
                        classes: (0, o.default)(i, s)
                    }
                });
            return r.default.createElement(v, (0, t._)({}, u, {
                variant: "outlined" === a ? "outlined" : "elevation",
                classes: c.classes,
                ref: n
            }), l)
        });
    e.s(["C", 0, g])
}, 116873, e => {
    "use strict";
    var t = e.i(561579);
    e.s(["Card", () => t.C])
}, 783536, e => {
    "use strict";
    var t = e.i(307778),
        r = e.i(650295);
    e.s(["u", 0, function(e) {
        let {
            props: n,
            name: o,
            defaultTheme: l,
            themeId: i
        } = e, a = (0, r.u)(l);
        return i && (a = a[i] || a), (0, t.g)({
            theme: a,
            name: o,
            props: n
        })
    }])
}]);

//# debugId=1eb611cd-697d-05d9-b0b1-4b173bcb016f
//# sourceMappingURL=07mimq7552azx.js.map
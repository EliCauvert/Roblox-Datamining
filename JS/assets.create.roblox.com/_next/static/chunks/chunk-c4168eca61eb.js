;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "c2ff05af-7fc6-6ca8-55f2-1f4502c4fd3f")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 305607, 539206, e => {
    "use strict";
    e.s(["clamp", 0, function(e, t) {
        let [r, o] = t;
        return Math.min(o, Math.max(r, e))
    }], 305607);
    var t = e.i(416340),
        r = e.i(608652),
        o = e.i(78892),
        n = e.i(699704),
        l = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let a = e + "CollectionProvider",
            [i, s] = (0, r.createContextScope)(a),
            [u, c] = i(a, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: r,
                    children: o
                } = e, n = t.default.useRef(null), a = t.default.useRef(new Map).current;
                return (0, l.jsx)(u, {
                    scope: r,
                    itemMap: a,
                    collectionRef: n,
                    children: o
                })
            };
        d.displayName = a;
        let p = e + "CollectionSlot",
            f = (0, n.createSlot)(p),
            v = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: n
                } = e, a = c(p, r), i = (0, o.useComposedRefs)(t, a.collectionRef);
                return (0, l.jsx)(f, {
                    ref: i,
                    children: n
                })
            });
        v.displayName = p;
        let m = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, n.createSlot)(m),
            x = t.default.forwardRef((e, r) => {
                let {
                    scope: n,
                    children: a,
                    ...i
                } = e, s = t.default.useRef(null), u = (0, o.useComposedRefs)(r, s), d = c(m, n);
                return t.default.useEffect(() => (d.itemMap.set(s, {
                    ref: s,
                    ...i
                }), () => void d.itemMap.delete(s))), (0, l.jsx)(g, {
                    ...{
                        [h]: ""
                    },
                    ref: u,
                    children: a
                })
            });
        return x.displayName = m, [{
            Provider: d,
            Slot: v,
            ItemSlot: x
        }, function(r) {
            let o = c(e + "CollectionConsumer", r);
            return t.default.useCallback(() => {
                let e = o.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                return Array.from(o.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [o.collectionRef, o.itemMap])
        }, s]
    }], 539206)
}, 508785, e => {
    "use strict";
    e.i(711300), e.i(634203), e.i(35877);
    var t = e.i(416340),
        r = e.i(608652),
        o = e.i(78892),
        n = e.i(76992),
        l = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let a = e + "CollectionProvider",
            [i, s] = (0, r.createContextScope)(a),
            [u, c] = i(a, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: r,
                    children: o
                } = e, n = t.default.useRef(null), a = t.default.useRef(new Map).current;
                return (0, l.jsx)(u, {
                    scope: r,
                    itemMap: a,
                    collectionRef: n,
                    children: o
                })
            };
        d.displayName = a;
        let p = e + "CollectionSlot",
            f = (0, n.createSlot)(p),
            v = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: n
                } = e, a = c(p, r), i = (0, o.useComposedRefs)(t, a.collectionRef);
                return (0, l.jsx)(f, {
                    ref: i,
                    children: n
                })
            });
        v.displayName = p;
        let m = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, n.createSlot)(m),
            x = t.default.forwardRef((e, r) => {
                let {
                    scope: n,
                    children: a,
                    ...i
                } = e, s = t.default.useRef(null), u = (0, o.useComposedRefs)(r, s), d = c(m, n);
                return t.default.useEffect(() => (d.itemMap.set(s, {
                    ref: s,
                    ...i
                }), () => void d.itemMap.delete(s))), (0, l.jsx)(g, {
                    ...{
                        [h]: ""
                    },
                    ref: u,
                    children: a
                })
            });
        return x.displayName = m, [{
            Provider: d,
            Slot: v,
            ItemSlot: x
        }, function(r) {
            let o = c(e + "CollectionConsumer", r);
            return t.default.useCallback(() => {
                let e = o.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                return Array.from(o.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [o.collectionRef, o.itemMap])
        }, s]
    }])
}, 974539, e => {
    "use strict";
    var t = e.i(416340);
    e.i(221628);
    var r = t.createContext(void 0);
    e.s(["useDirection", 0, function(e) {
        let o = t.useContext(r);
        return e || o || "ltr"
    }])
}, 734463, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(19655),
        o = e.i(78892),
        n = e.i(608652),
        l = e.i(598943),
        a = e.i(793808),
        i = e.i(44265),
        s = e.i(40266),
        u = e.i(524887),
        c = e.i(763960),
        d = e.i(226972),
        p = e.i(594278),
        f = e.i(699704),
        v = e.i(428156),
        m = e.i(3300),
        h = e.i(813593),
        g = e.i(221628),
        x = "Popover",
        [w, y] = (0, n.createContextScope)(x, [u.createPopperScope]),
        C = (0, u.createPopperScope)(),
        [b, S] = w(x),
        R = e => {
            let {
                __scopePopover: r,
                children: o,
                open: n,
                defaultOpen: l,
                onOpenChange: a,
                modal: i = !1
            } = e, c = C(r), d = t.useRef(null), [p, f] = t.useState(!1), [m = !1, h] = (0, v.useControllableState)({
                prop: n,
                defaultProp: l,
                onChange: a
            });
            return (0, g.jsx)(u.Root, {
                ...c,
                children: (0, g.jsx)(b, {
                    scope: r,
                    contentId: (0, s.useId)(),
                    triggerRef: d,
                    open: m,
                    onOpenChange: h,
                    onOpenToggle: t.useCallback(() => h(e => !e), [h]),
                    hasCustomAnchor: p,
                    onCustomAnchorAdd: t.useCallback(() => f(!0), []),
                    onCustomAnchorRemove: t.useCallback(() => f(!1), []),
                    modal: i,
                    children: o
                })
            })
        };
    R.displayName = x;
    var P = "PopoverAnchor",
        E = t.forwardRef((e, r) => {
            let {
                __scopePopover: o,
                ...n
            } = e, l = S(P, o), a = C(o), {
                onCustomAnchorAdd: i,
                onCustomAnchorRemove: s
            } = l;
            return t.useEffect(() => (i(), () => s()), [i, s]), (0, g.jsx)(u.Anchor, {
                ...a,
                ...n,
                ref: r
            })
        });
    E.displayName = P;
    var j = "PopoverTrigger",
        A = t.forwardRef((e, t) => {
            let {
                __scopePopover: n,
                ...l
            } = e, a = S(j, n), i = C(n), s = (0, o.useComposedRefs)(t, a.triggerRef), c = (0, g.jsx)(p.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": a.open,
                "aria-controls": a.contentId,
                "data-state": V(a.open),
                ...l,
                ref: s,
                onClick: (0, r.composeEventHandlers)(e.onClick, a.onOpenToggle)
            });
            return a.hasCustomAnchor ? c : (0, g.jsx)(u.Anchor, {
                asChild: !0,
                ...i,
                children: c
            })
        });
    A.displayName = j;
    var I = "PopoverPortal",
        [T, k] = w(I, {
            forceMount: void 0
        }),
        D = e => {
            let {
                __scopePopover: t,
                forceMount: r,
                children: o,
                container: n
            } = e, l = S(I, t);
            return (0, g.jsx)(T, {
                scope: t,
                forceMount: r,
                children: (0, g.jsx)(d.Presence, {
                    present: r || l.open,
                    children: (0, g.jsx)(c.Portal, {
                        asChild: !0,
                        container: n,
                        children: o
                    })
                })
            })
        };
    D.displayName = I;
    var H = "PopoverContent",
        N = t.forwardRef((e, t) => {
            let r = k(H, e.__scopePopover),
                {
                    forceMount: o = r.forceMount,
                    ...n
                } = e,
                l = S(H, e.__scopePopover);
            return (0, g.jsx)(d.Presence, {
                present: o || l.open,
                children: l.modal ? (0, g.jsx)(F, {
                    ...n,
                    ref: t
                }) : (0, g.jsx)(L, {
                    ...n,
                    ref: t
                })
            })
        });
    N.displayName = H;
    var M = (0, f.createSlot)("PopoverContent.RemoveScroll"),
        F = t.forwardRef((e, n) => {
            let l = S(H, e.__scopePopover),
                a = t.useRef(null),
                i = (0, o.useComposedRefs)(n, a),
                s = t.useRef(!1);
            return t.useEffect(() => {
                let e = a.current;
                if (e) return (0, m.hideOthers)(e)
            }, []), (0, g.jsx)(h.RemoveScroll, {
                as: M,
                allowPinchZoom: !0,
                children: (0, g.jsx)(O, {
                    ...e,
                    ref: i,
                    trapFocus: l.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: (0, r.composeEventHandlers)(e.onCloseAutoFocus, e => {
                        var t;
                        e.preventDefault(), s.current || null == (t = l.triggerRef.current) || t.focus()
                    }),
                    onPointerDownOutside: (0, r.composeEventHandlers)(e.onPointerDownOutside, e => {
                        let t = e.detail.originalEvent,
                            r = 0 === t.button && !0 === t.ctrlKey;
                        s.current = 2 === t.button || r
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: (0, r.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        L = t.forwardRef((e, r) => {
            let o = S(H, e.__scopePopover),
                n = t.useRef(!1),
                l = t.useRef(!1);
            return (0, g.jsx)(O, {
                ...e,
                ref: r,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var r, a;
                    null == (r = e.onCloseAutoFocus) || r.call(e, t), t.defaultPrevented || (n.current || null == (a = o.triggerRef.current) || a.focus(), t.preventDefault()), n.current = !1, l.current = !1
                },
                onInteractOutside: t => {
                    var r, a;
                    null == (r = e.onInteractOutside) || r.call(e, t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (l.current = !0));
                    let i = t.target;
                    (null == (a = o.triggerRef.current) ? void 0 : a.contains(i)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && l.current && t.preventDefault()
                }
            })
        }),
        O = t.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                trapFocus: o,
                onOpenAutoFocus: n,
                onCloseAutoFocus: s,
                disableOutsidePointerEvents: c,
                onEscapeKeyDown: d,
                onPointerDownOutside: p,
                onFocusOutside: f,
                onInteractOutside: v,
                ...m
            } = e, h = S(H, r), x = C(r);
            return (0, a.useFocusGuards)(), (0, g.jsx)(i.FocusScope, {
                asChild: !0,
                loop: !0,
                trapped: o,
                onMountAutoFocus: n,
                onUnmountAutoFocus: s,
                children: (0, g.jsx)(l.DismissableLayer, {
                    asChild: !0,
                    disableOutsidePointerEvents: c,
                    onInteractOutside: v,
                    onEscapeKeyDown: d,
                    onPointerDownOutside: p,
                    onFocusOutside: f,
                    onDismiss: () => h.onOpenChange(!1),
                    children: (0, g.jsx)(u.Content, {
                        "data-state": V(h.open),
                        role: "dialog",
                        id: h.contentId,
                        ...x,
                        ...m,
                        ref: t,
                        style: {
                            ...m.style,
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
        _ = "PopoverClose",
        B = t.forwardRef((e, t) => {
            let {
                __scopePopover: o,
                ...n
            } = e, l = S(_, o);
            return (0, g.jsx)(p.Primitive.button, {
                type: "button",
                ...n,
                ref: t,
                onClick: (0, r.composeEventHandlers)(e.onClick, () => l.onOpenChange(!1))
            })
        });
    B.displayName = _;
    var K = t.forwardRef((e, t) => {
        let {
            __scopePopover: r,
            ...o
        } = e, n = C(r);
        return (0, g.jsx)(u.Arrow, {
            ...n,
            ...o,
            ref: t
        })
    });

    function V(e) {
        return e ? "open" : "closed"
    }
    K.displayName = "PopoverArrow", e.s(["Anchor", 0, E, "Arrow", 0, K, "Close", 0, B, "Content", 0, N, "Portal", 0, D, "Root", 0, R, "Trigger", 0, A])
}, 524887, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(297452),
        o = e.i(992486),
        n = e.i(594278),
        l = e.i(221628),
        a = t.forwardRef((e, t) => {
            let {
                children: r,
                width: o = 10,
                height: a = 5,
                ...i
            } = e;
            return (0, l.jsx)(n.Primitive.svg, {
                ...i,
                ref: t,
                width: o,
                height: a,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? r : (0, l.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    a.displayName = "Arrow";
    var i = e.i(78892),
        s = e.i(608652),
        u = e.i(886449),
        c = e.i(723570),
        d = e.i(692166),
        p = "Popper",
        [f, v] = (0, s.createContextScope)(p),
        [m, h] = f(p),
        g = e => {
            let {
                __scopePopper: r,
                children: o
            } = e, [n, a] = t.useState(null);
            return (0, l.jsx)(m, {
                scope: r,
                anchor: n,
                onAnchorChange: a,
                children: o
            })
        };
    g.displayName = p;
    var x = "PopperAnchor",
        w = t.forwardRef((e, r) => {
            let {
                __scopePopper: o,
                virtualRef: a,
                ...s
            } = e, u = h(x, o), c = t.useRef(null), d = (0, i.useComposedRefs)(r, c);
            return t.useEffect(() => {
                u.onAnchorChange((null == a ? void 0 : a.current) || c.current)
            }), a ? null : (0, l.jsx)(n.Primitive.div, {
                ...s,
                ref: d
            })
        });
    w.displayName = x;
    var y = "PopperContent",
        [C, b] = f(y),
        S = t.forwardRef((e, a) => {
            var s, p, f, v, m, g, x, w;
            let {
                __scopePopper: b,
                side: S = "bottom",
                sideOffset: R = 0,
                align: P = "center",
                alignOffset: E = 0,
                arrowPadding: T = 0,
                avoidCollisions: k = !0,
                collisionBoundary: D = [],
                collisionPadding: H = 0,
                sticky: N = "partial",
                hideWhenDetached: M = !1,
                updatePositionStrategy: F = "optimized",
                onPlaced: L,
                ...O
            } = e, _ = h(y, b), [B, K] = t.useState(null), V = (0, i.useComposedRefs)(a, e => K(e)), [U, z] = t.useState(null), W = (0, d.useSize)(U), G = null != (s = null == W ? void 0 : W.width) ? s : 0, Y = null != (p = null == W ? void 0 : W.height) ? p : 0, q = "number" == typeof H ? H : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...H
            }, X = Array.isArray(D) ? D : [D], Z = X.length > 0, J = {
                padding: q,
                boundary: X.filter(j),
                altBoundary: Z
            }, {
                refs: Q,
                floatingStyles: $,
                placement: ee,
                isPositioned: et,
                middlewareData: er
            } = (0, r.useFloating)({
                strategy: "fixed",
                placement: S + ("center" !== P ? "-" + P : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, o.autoUpdate)(...t, {
                        animationFrame: "always" === F
                    })
                },
                elements: {
                    reference: _.anchor
                },
                middleware: [(0, r.offset)({
                    mainAxis: R + Y,
                    alignmentAxis: E
                }), k && (0, r.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === N ? (0, r.limitShift)() : void 0,
                    ...J
                }), k && (0, r.flip)({
                    ...J
                }), (0, r.size)({
                    ...J,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: o,
                            availableHeight: n
                        } = e, {
                            width: l,
                            height: a
                        } = r.reference, i = t.floating.style;
                        i.setProperty("--radix-popper-available-width", "".concat(o, "px")), i.setProperty("--radix-popper-available-height", "".concat(n, "px")), i.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), i.setProperty("--radix-popper-anchor-height", "".concat(a, "px"))
                    }
                }), U && (0, r.arrow)({
                    element: U,
                    padding: T
                }), A({
                    arrowWidth: G,
                    arrowHeight: Y
                }), M && (0, r.hide)({
                    strategy: "referenceHidden",
                    ...J
                })]
            }), [eo, en] = I(ee), el = (0, u.useCallbackRef)(L);
            (0, c.useLayoutEffect)(() => {
                et && (null == el || el())
            }, [et, el]);
            let ea = null == (f = er.arrow) ? void 0 : f.x,
                ei = null == (v = er.arrow) ? void 0 : v.y,
                es = (null == (m = er.arrow) ? void 0 : m.centerOffset) !== 0,
                [eu, ec] = t.useState();
            return (0, c.useLayoutEffect)(() => {
                B && ec(window.getComputedStyle(B).zIndex)
            }, [B]), (0, l.jsx)("div", {
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
                children: (0, l.jsx)(C, {
                    scope: b,
                    placedSide: eo,
                    onArrowChange: z,
                    arrowX: ea,
                    arrowY: ei,
                    shouldHideArrow: es,
                    children: (0, l.jsx)(n.Primitive.div, {
                        "data-side": eo,
                        "data-align": en,
                        ...O,
                        ref: V,
                        style: {
                            ...O.style,
                            animation: et ? void 0 : "none"
                        }
                    })
                })
            })
        });
    S.displayName = y;
    var R = "PopperArrow",
        P = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        E = t.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...o
            } = e, n = b(R, r), i = P[n.placedSide];
            return (0, l.jsx)("span", {
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
                children: (0, l.jsx)(a, {
                    ...o,
                    ref: t,
                    style: {
                        ...o.style,
                        display: "block"
                    }
                })
            })
        });

    function j(e) {
        return null !== e
    }
    E.displayName = R;
    var A = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, o, n, l, a;
            let {
                placement: i,
                rects: s,
                middlewareData: u
            } = t, c = (null == (n = u.arrow) ? void 0 : n.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, p = c ? 0 : e.arrowHeight, [f, v] = I(i), m = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [v], h = (null != (r = null == (l = u.arrow) ? void 0 : l.x) ? r : 0) + d / 2, g = (null != (o = null == (a = u.arrow) ? void 0 : a.y) ? o : 0) + p / 2, x = "", w = "";
            return "bottom" === f ? (x = c ? m : "".concat(h, "px"), w = "".concat(-p, "px")) : "top" === f ? (x = c ? m : "".concat(h, "px"), w = "".concat(s.floating.height + p, "px")) : "right" === f ? (x = "".concat(-p, "px"), w = c ? m : "".concat(g, "px")) : "left" === f && (x = "".concat(s.floating.width + p, "px"), w = c ? m : "".concat(g, "px")), {
                data: {
                    x,
                    y: w
                }
            }
        }
    });

    function I(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["Anchor", 0, w, "Arrow", 0, E, "Content", 0, S, "Root", 0, g, "createPopperScope", 0, v], 524887)
}, 142953, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(174617),
        o = e.i(508785),
        n = e.i(78892),
        l = e.i(608652),
        a = e.i(40266),
        i = e.i(600317),
        s = e.i(886449),
        u = e.i(199786),
        c = e.i(974539),
        d = e.i(221628),
        p = "rovingFocusGroup.onEntryFocus",
        f = {
            bubbles: !1,
            cancelable: !0
        },
        v = "RovingFocusGroup",
        [m, h, g] = (0, o.createCollection)(v),
        [x, w] = (0, l.createContextScope)(v, [g]),
        [y, C] = x(v),
        b = t.forwardRef((e, t) => (0, d.jsx)(m.Provider, {
            scope: e.__scopeRovingFocusGroup,
            children: (0, d.jsx)(m.Slot, {
                scope: e.__scopeRovingFocusGroup,
                children: (0, d.jsx)(S, {
                    ...e,
                    ref: t
                })
            })
        }));
    b.displayName = v;
    var S = t.forwardRef((e, o) => {
            let {
                __scopeRovingFocusGroup: l,
                orientation: a,
                loop: m = !1,
                dir: g,
                currentTabStopId: x,
                defaultCurrentTabStopId: w,
                onCurrentTabStopIdChange: C,
                onEntryFocus: b,
                preventScrollOnEntryFocus: S = !1,
                ...R
            } = e, P = t.useRef(null), E = (0, n.useComposedRefs)(o, P), A = (0, c.useDirection)(g), [I, T] = (0, u.useControllableState)({
                prop: x,
                defaultProp: null != w ? w : null,
                onChange: C,
                caller: v
            }), [k, D] = t.useState(!1), H = (0, s.useCallbackRef)(b), N = h(l), M = t.useRef(!1), [F, L] = t.useState(0);
            return t.useEffect(() => {
                let e = P.current;
                if (e) return e.addEventListener(p, H), () => e.removeEventListener(p, H)
            }, [H]), (0, d.jsx)(y, {
                scope: l,
                orientation: a,
                dir: A,
                loop: m,
                currentTabStopId: I,
                onItemFocus: t.useCallback(e => T(e), [T]),
                onItemShiftTab: t.useCallback(() => D(!0), []),
                onFocusableItemAdd: t.useCallback(() => L(e => e + 1), []),
                onFocusableItemRemove: t.useCallback(() => L(e => e - 1), []),
                children: (0, d.jsx)(i.Primitive.div, {
                    tabIndex: k || 0 === F ? -1 : 0,
                    "data-orientation": a,
                    ...R,
                    ref: E,
                    style: {
                        outline: "none",
                        ...e.style
                    },
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, () => {
                        M.current = !0
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, e => {
                        let t = !M.current;
                        if (e.target === e.currentTarget && t && !k) {
                            let t = new CustomEvent(p, f);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = N().filter(e => e.focusable);
                                j([e.find(e => e.active), e.find(e => e.id === I), ...e].filter(Boolean).map(e => e.ref.current), S)
                            }
                        }
                        M.current = !1
                    }),
                    onBlur: (0, r.composeEventHandlers)(e.onBlur, () => D(!1))
                })
            })
        }),
        R = "RovingFocusGroupItem",
        P = t.forwardRef((e, o) => {
            let {
                __scopeRovingFocusGroup: n,
                focusable: l = !0,
                active: s = !1,
                tabStopId: u,
                children: c,
                ...p
            } = e, f = (0, a.useId)(), v = u || f, g = C(R, n), x = g.currentTabStopId === v, w = h(n), {
                onFocusableItemAdd: y,
                onFocusableItemRemove: b,
                currentTabStopId: S
            } = g;
            return t.useEffect(() => {
                if (l) return y(), () => b()
            }, [l, y, b]), (0, d.jsx)(m.ItemSlot, {
                scope: n,
                id: v,
                focusable: l,
                active: s,
                children: (0, d.jsx)(i.Primitive.span, {
                    tabIndex: x ? 0 : -1,
                    "data-orientation": g.orientation,
                    ...p,
                    ref: o,
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, e => {
                        l ? g.onItemFocus(v) : e.preventDefault()
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, () => g.onItemFocus(v)),
                    onKeyDown: (0, r.composeEventHandlers)(e.onKeyDown, e => {
                        if ("Tab" === e.key && e.shiftKey) return void g.onItemShiftTab();
                        if (e.target !== e.currentTarget) return;
                        let t = function(e, t, r) {
                            var o;
                            let n = (o = e.key, "rtl" !== r ? o : "ArrowLeft" === o ? "ArrowRight" : "ArrowRight" === o ? "ArrowLeft" : o);
                            if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(n)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(n))) return E[n]
                        }(e, g.orientation, g.dir);
                        if (void 0 !== t) {
                            if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                            e.preventDefault();
                            let n = w().filter(e => e.focusable).map(e => e.ref.current);
                            if ("last" === t) n.reverse();
                            else if ("prev" === t || "next" === t) {
                                var r, o;
                                "prev" === t && n.reverse();
                                let l = n.indexOf(e.currentTarget);
                                n = g.loop ? (r = n, o = l + 1, r.map((e, t) => r[(o + t) % r.length])) : n.slice(l + 1)
                            }
                            setTimeout(() => j(n))
                        }
                    }),
                    children: "function" == typeof c ? c({
                        isCurrentTabStop: x,
                        hasTabStop: null != S
                    }) : c
                })
            })
        });
    P.displayName = R;
    var E = {
        ArrowLeft: "prev",
        ArrowUp: "prev",
        ArrowRight: "next",
        ArrowDown: "next",
        PageUp: "first",
        Home: "first",
        PageDown: "last",
        End: "last"
    };

    function j(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            r = document.activeElement;
        for (let o of e)
            if (o === r || (o.focus({
                    preventScroll: t
                }), document.activeElement !== r)) return
    }
    e.s(["Item", 0, P, "Root", 0, b, "createRovingFocusGroupScope", 0, w])
}, 563921, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(149285),
        o = e.i(305607),
        n = e.i(19655),
        l = e.i(539206),
        a = e.i(78892),
        i = e.i(608652),
        s = e.i(974539),
        u = e.i(598943),
        c = e.i(793808),
        d = e.i(44265),
        p = e.i(40266),
        f = e.i(524887),
        v = e.i(763960),
        m = e.i(594278),
        h = e.i(699704),
        g = e.i(886449),
        x = e.i(428156),
        w = e.i(723570),
        y = e.i(300792),
        C = e.i(221628),
        b = t.forwardRef((e, t) => (0, C.jsx)(m.Primitive.span, {
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
    b.displayName = "VisuallyHidden";
    var S = e.i(3300),
        R = e.i(813593),
        P = [" ", "Enter", "ArrowUp", "ArrowDown"],
        E = [" ", "Enter"],
        j = "Select",
        [A, I, T] = (0, l.createCollection)(j),
        [k, D] = (0, i.createContextScope)(j, [T, f.createPopperScope]),
        H = (0, f.createPopperScope)(),
        [N, M] = k(j),
        [F, L] = k(j),
        O = e => {
            let {
                __scopeSelect: r,
                children: o,
                open: n,
                defaultOpen: l,
                onOpenChange: a,
                value: i,
                defaultValue: u,
                onValueChange: c,
                dir: d,
                name: v,
                autoComplete: m,
                disabled: h,
                required: g,
                form: w
            } = e, y = H(r), [b, S] = t.useState(null), [R, P] = t.useState(null), [E, j] = t.useState(!1), I = (0, s.useDirection)(d), [T = !1, k] = (0, x.useControllableState)({
                prop: n,
                defaultProp: l,
                onChange: a
            }), [D, M] = (0, x.useControllableState)({
                prop: i,
                defaultProp: u,
                onChange: c
            }), L = t.useRef(null), O = !b || w || !!b.closest("form"), [_, B] = t.useState(new Set), K = Array.from(_).map(e => e.props.value).join(";");
            return (0, C.jsx)(f.Root, {
                ...y,
                children: (0, C.jsxs)(N, {
                    required: g,
                    scope: r,
                    trigger: b,
                    onTriggerChange: S,
                    valueNode: R,
                    onValueNodeChange: P,
                    valueNodeHasChildren: E,
                    onValueNodeHasChildrenChange: j,
                    contentId: (0, p.useId)(),
                    value: D,
                    onValueChange: M,
                    open: T,
                    onOpenChange: k,
                    dir: I,
                    triggerPointerDownPosRef: L,
                    disabled: h,
                    children: [(0, C.jsx)(A.Provider, {
                        scope: r,
                        children: (0, C.jsx)(F, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: t.useCallback(e => {
                                B(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: t.useCallback(e => {
                                B(t => {
                                    let r = new Set(t);
                                    return r.delete(e), r
                                })
                            }, []),
                            children: o
                        })
                    }), O ? (0, C.jsxs)(ew, {
                        "aria-hidden": !0,
                        required: g,
                        tabIndex: -1,
                        name: v,
                        autoComplete: m,
                        value: D,
                        onChange: e => M(e.target.value),
                        disabled: h,
                        form: w,
                        children: [void 0 === D ? (0, C.jsx)("option", {
                            value: ""
                        }) : null, Array.from(_)]
                    }, K) : null]
                })
            })
        };
    O.displayName = j;
    var _ = "SelectTrigger",
        B = t.forwardRef((e, r) => {
            let {
                __scopeSelect: o,
                disabled: l = !1,
                ...i
            } = e, s = H(o), u = M(_, o), c = u.disabled || l, d = (0, a.useComposedRefs)(r, u.onTriggerChange), p = I(o), v = t.useRef("touch"), [h, g, x] = ey(e => {
                let t = p().filter(e => !e.disabled),
                    r = t.find(e => e.value === u.value),
                    o = eC(t, e, r);
                void 0 !== o && u.onValueChange(o.value)
            }), w = e => {
                c || (u.onOpenChange(!0), x()), e && (u.triggerPointerDownPosRef.current = {
                    x: Math.round(e.pageX),
                    y: Math.round(e.pageY)
                })
            };
            return (0, C.jsx)(f.Anchor, {
                asChild: !0,
                ...s,
                children: (0, C.jsx)(m.Primitive.button, {
                    type: "button",
                    role: "combobox",
                    "aria-controls": u.contentId,
                    "aria-expanded": u.open,
                    "aria-required": u.required,
                    "aria-autocomplete": "none",
                    dir: u.dir,
                    "data-state": u.open ? "open" : "closed",
                    disabled: c,
                    "data-disabled": c ? "" : void 0,
                    "data-placeholder": ex(u.value) ? "" : void 0,
                    ...i,
                    ref: d,
                    onClick: (0, n.composeEventHandlers)(i.onClick, e => {
                        e.currentTarget.focus(), "mouse" !== v.current && w(e)
                    }),
                    onPointerDown: (0, n.composeEventHandlers)(i.onPointerDown, e => {
                        v.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (w(e), e.preventDefault())
                    }),
                    onKeyDown: (0, n.composeEventHandlers)(i.onKeyDown, e => {
                        let t = "" !== h.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || g(e.key), (!t || " " !== e.key) && P.includes(e.key) && (w(), e.preventDefault())
                    })
                })
            })
        });
    B.displayName = _;
    var K = "SelectValue",
        V = t.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: o,
                style: n,
                children: l,
                placeholder: i = "",
                ...s
            } = e, u = M(K, r), {
                onValueNodeHasChildrenChange: c
            } = u, d = void 0 !== l, p = (0, a.useComposedRefs)(t, u.onValueNodeChange);
            return (0, w.useLayoutEffect)(() => {
                c(d)
            }, [c, d]), (0, C.jsx)(m.Primitive.span, {
                ...s,
                ref: p,
                style: {
                    pointerEvents: "none"
                },
                children: ex(u.value) ? (0, C.jsx)(C.Fragment, {
                    children: i
                }) : l
            })
        });
    V.displayName = K;
    var U = t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            children: o,
            ...n
        } = e;
        return (0, C.jsx)(m.Primitive.span, {
            "aria-hidden": !0,
            ...n,
            ref: t,
            children: o || "▼"
        })
    });
    U.displayName = "SelectIcon";
    var z = e => (0, C.jsx)(v.Portal, {
        asChild: !0,
        ...e
    });
    z.displayName = "SelectPortal";
    var W = "SelectContent",
        G = t.forwardRef((e, o) => {
            let n = M(W, e.__scopeSelect),
                [l, a] = t.useState();
            return ((0, w.useLayoutEffect)(() => {
                a(new DocumentFragment)
            }, []), n.open) ? (0, C.jsx)(Z, {
                ...e,
                ref: o
            }) : l ? r.createPortal((0, C.jsx)(Y, {
                scope: e.__scopeSelect,
                children: (0, C.jsx)(A.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, C.jsx)("div", {
                        children: e.children
                    })
                })
            }), l) : null
        });
    G.displayName = W;
    var [Y, q] = k(W), X = (0, h.createSlot)("SelectContent.RemoveScroll"), Z = t.forwardRef((e, r) => {
        let {
            __scopeSelect: o,
            position: l = "item-aligned",
            onCloseAutoFocus: i,
            onEscapeKeyDown: s,
            onPointerDownOutside: p,
            side: f,
            sideOffset: v,
            align: m,
            alignOffset: h,
            arrowPadding: g,
            collisionBoundary: x,
            collisionPadding: w,
            sticky: y,
            hideWhenDetached: b,
            avoidCollisions: P,
            ...E
        } = e, j = M(W, o), [A, T] = t.useState(null), [k, D] = t.useState(null), H = (0, a.useComposedRefs)(r, e => T(e)), [N, F] = t.useState(null), [L, O] = t.useState(null), _ = I(o), [B, K] = t.useState(!1), V = t.useRef(!1);
        t.useEffect(() => {
            if (A) return (0, S.hideOthers)(A)
        }, [A]), (0, c.useFocusGuards)();
        let U = t.useCallback(e => {
                let [t, ...r] = _().map(e => e.ref.current), [o] = r.slice(-1), n = document.activeElement;
                for (let r of e)
                    if (r === n || (null == r || r.scrollIntoView({
                            block: "nearest"
                        }), r === t && k && (k.scrollTop = 0), r === o && k && (k.scrollTop = k.scrollHeight), null == r || r.focus(), document.activeElement !== n)) return
            }, [_, k]),
            z = t.useCallback(() => U([N, A]), [U, N, A]);
        t.useEffect(() => {
            B && z()
        }, [B, z]);
        let {
            onOpenChange: G,
            triggerPointerDownPosRef: q
        } = j;
        t.useEffect(() => {
            if (A) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        var r, o, n, l;
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (null != (r = null == (n = q.current) ? void 0 : n.x) ? r : 0)),
                            y: Math.abs(Math.round(t.pageY) - (null != (o = null == (l = q.current) ? void 0 : l.y) ? o : 0))
                        }
                    },
                    r = r => {
                        e.x <= 10 && e.y <= 10 ? r.preventDefault() : A.contains(r.target) || G(!1), document.removeEventListener("pointermove", t), q.current = null
                    };
                return null !== q.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                        capture: !0
                    })
                }
            }
        }, [A, G, q]), t.useEffect(() => {
            let e = () => G(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [G]);
        let [Z, $] = ey(e => {
            let t = _().filter(e => !e.disabled),
                r = t.find(e => e.ref.current === document.activeElement),
                o = eC(t, e, r);
            o && setTimeout(() => o.ref.current.focus())
        }), ee = t.useCallback((e, t, r) => {
            let o = !V.current && !r;
            (void 0 !== j.value && j.value === t || o) && (F(e), o && (V.current = !0))
        }, [j.value]), et = t.useCallback(() => null == A ? void 0 : A.focus(), [A]), er = t.useCallback((e, t, r) => {
            let o = !V.current && !r;
            (void 0 !== j.value && j.value === t || o) && O(e)
        }, [j.value]), eo = "popper" === l ? Q : J, en = eo === Q ? {
            side: f,
            sideOffset: v,
            align: m,
            alignOffset: h,
            arrowPadding: g,
            collisionBoundary: x,
            collisionPadding: w,
            sticky: y,
            hideWhenDetached: b,
            avoidCollisions: P
        } : {};
        return (0, C.jsx)(Y, {
            scope: o,
            content: A,
            viewport: k,
            onViewportChange: D,
            itemRefCallback: ee,
            selectedItem: N,
            onItemLeave: et,
            itemTextRefCallback: er,
            focusSelectedItem: z,
            selectedItemText: L,
            position: l,
            isPositioned: B,
            searchRef: Z,
            children: (0, C.jsx)(R.RemoveScroll, {
                as: X,
                allowPinchZoom: !0,
                children: (0, C.jsx)(d.FocusScope, {
                    asChild: !0,
                    trapped: j.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: (0, n.composeEventHandlers)(i, e => {
                        var t;
                        null == (t = j.trigger) || t.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, C.jsx)(u.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !0,
                        onEscapeKeyDown: s,
                        onPointerDownOutside: p,
                        onFocusOutside: e => e.preventDefault(),
                        onDismiss: () => j.onOpenChange(!1),
                        children: (0, C.jsx)(eo, {
                            role: "listbox",
                            id: j.contentId,
                            "data-state": j.open ? "open" : "closed",
                            dir: j.dir,
                            onContextMenu: e => e.preventDefault(),
                            ...E,
                            ...en,
                            onPlaced: () => K(!0),
                            ref: H,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...E.style
                            },
                            onKeyDown: (0, n.composeEventHandlers)(E.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || $(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = _().filter(e => !e.disabled).map(e => e.ref.current);
                                    if (["ArrowUp", "End"].includes(e.key) && (t = t.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                        let r = e.target,
                                            o = t.indexOf(r);
                                        t = t.slice(o + 1)
                                    }
                                    setTimeout(() => U(t)), e.preventDefault()
                                }
                            })
                        })
                    })
                })
            })
        })
    });
    Z.displayName = "SelectContentImpl";
    var J = t.forwardRef((e, r) => {
        let {
            __scopeSelect: n,
            onPlaced: l,
            ...i
        } = e, s = M(W, n), u = q(W, n), [c, d] = t.useState(null), [p, f] = t.useState(null), v = (0, a.useComposedRefs)(r, e => f(e)), h = I(n), g = t.useRef(!1), x = t.useRef(!0), {
            viewport: y,
            selectedItem: b,
            selectedItemText: S,
            focusSelectedItem: R
        } = u, P = t.useCallback(() => {
            if (s.trigger && s.valueNode && c && p && y && b && S) {
                let e = s.trigger.getBoundingClientRect(),
                    t = p.getBoundingClientRect(),
                    r = s.valueNode.getBoundingClientRect(),
                    n = S.getBoundingClientRect();
                if ("rtl" !== s.dir) {
                    let l = n.left - t.left,
                        a = r.left - l,
                        i = e.left - a,
                        s = e.width + i,
                        u = Math.max(s, t.width),
                        d = window.innerWidth - 10,
                        p = (0, o.clamp)(a, [10, Math.max(10, d - u)]);
                    c.style.minWidth = s + "px", c.style.left = p + "px"
                } else {
                    let l = t.right - n.right,
                        a = window.innerWidth - r.right - l,
                        i = window.innerWidth - e.right - a,
                        s = e.width + i,
                        u = Math.max(s, t.width),
                        d = window.innerWidth - 10,
                        p = (0, o.clamp)(a, [10, Math.max(10, d - u)]);
                    c.style.minWidth = s + "px", c.style.right = p + "px"
                }
                let a = h(),
                    i = window.innerHeight - 20,
                    u = y.scrollHeight,
                    d = window.getComputedStyle(p),
                    f = parseInt(d.borderTopWidth, 10),
                    v = parseInt(d.paddingTop, 10),
                    m = parseInt(d.borderBottomWidth, 10),
                    x = f + v + u + parseInt(d.paddingBottom, 10) + m,
                    w = Math.min(5 * b.offsetHeight, x),
                    C = window.getComputedStyle(y),
                    R = parseInt(C.paddingTop, 10),
                    P = parseInt(C.paddingBottom, 10),
                    E = e.top + e.height / 2 - 10,
                    j = b.offsetHeight / 2,
                    A = f + v + (b.offsetTop + j);
                if (A <= E) {
                    let e = a.length > 0 && b === a[a.length - 1].ref.current;
                    c.style.bottom = "0px";
                    let t = Math.max(i - E, j + (e ? P : 0) + (p.clientHeight - y.offsetTop - y.offsetHeight) + m);
                    c.style.height = A + t + "px"
                } else {
                    let e = a.length > 0 && b === a[0].ref.current;
                    c.style.top = "0px";
                    let t = Math.max(E, f + y.offsetTop + (e ? R : 0) + j);
                    c.style.height = t + (x - A) + "px", y.scrollTop = A - E + y.offsetTop
                }
                c.style.margin = "".concat(10, "px 0"), c.style.minHeight = w + "px", c.style.maxHeight = i + "px", null == l || l(), requestAnimationFrame(() => g.current = !0)
            }
        }, [h, s.trigger, s.valueNode, c, p, y, b, S, s.dir, l]);
        (0, w.useLayoutEffect)(() => P(), [P]);
        let [E, j] = t.useState();
        (0, w.useLayoutEffect)(() => {
            p && j(window.getComputedStyle(p).zIndex)
        }, [p]);
        let A = t.useCallback(e => {
            e && !0 === x.current && (P(), null == R || R(), x.current = !1)
        }, [P, R]);
        return (0, C.jsx)($, {
            scope: n,
            contentWrapper: c,
            shouldExpandOnScrollRef: g,
            onScrollButtonChange: A,
            children: (0, C.jsx)("div", {
                ref: d,
                style: {
                    display: "flex",
                    flexDirection: "column",
                    position: "fixed",
                    zIndex: E
                },
                children: (0, C.jsx)(m.Primitive.div, {
                    ...i,
                    ref: v,
                    style: {
                        boxSizing: "border-box",
                        maxHeight: "100%",
                        ...i.style
                    }
                })
            })
        })
    });
    J.displayName = "SelectItemAlignedPosition";
    var Q = t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            align: o = "start",
            collisionPadding: n = 10,
            ...l
        } = e, a = H(r);
        return (0, C.jsx)(f.Content, {
            ...a,
            ...l,
            ref: t,
            align: o,
            collisionPadding: n,
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
    Q.displayName = "SelectPopperPosition";
    var [$, ee] = k(W, {}), et = "SelectViewport", er = t.forwardRef((e, r) => {
        let {
            __scopeSelect: o,
            nonce: l,
            ...i
        } = e, s = q(et, o), u = ee(et, o), c = (0, a.useComposedRefs)(r, s.onViewportChange), d = t.useRef(0);
        return (0, C.jsxs)(C.Fragment, {
            children: [(0, C.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: l
            }), (0, C.jsx)(A.Slot, {
                scope: o,
                children: (0, C.jsx)(m.Primitive.div, {
                    "data-radix-select-viewport": "",
                    role: "presentation",
                    ...i,
                    ref: c,
                    style: {
                        position: "relative",
                        flex: 1,
                        overflow: "hidden auto",
                        ...i.style
                    },
                    onScroll: (0, n.composeEventHandlers)(i.onScroll, e => {
                        let t = e.currentTarget,
                            {
                                contentWrapper: r,
                                shouldExpandOnScrollRef: o
                            } = u;
                        if ((null == o ? void 0 : o.current) && r) {
                            let e = Math.abs(d.current - t.scrollTop);
                            if (e > 0) {
                                let o = window.innerHeight - 20,
                                    n = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                if (n < o) {
                                    let l = n + e,
                                        a = Math.min(o, l),
                                        i = l - a;
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
    er.displayName = et;
    var eo = "SelectGroup",
        [en, el] = k(eo);
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...o
        } = e, n = (0, p.useId)();
        return (0, C.jsx)(en, {
            scope: r,
            id: n,
            children: (0, C.jsx)(m.Primitive.div, {
                role: "group",
                "aria-labelledby": n,
                ...o,
                ref: t
            })
        })
    }).displayName = eo;
    var ea = "SelectLabel";
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...o
        } = e, n = el(ea, r);
        return (0, C.jsx)(m.Primitive.div, {
            id: n.id,
            ...o,
            ref: t
        })
    }).displayName = ea;
    var ei = "SelectItem",
        [es, eu] = k(ei),
        ec = t.forwardRef((e, r) => {
            let {
                __scopeSelect: o,
                value: l,
                disabled: i = !1,
                textValue: s,
                ...u
            } = e, c = M(ei, o), d = q(ei, o), f = c.value === l, [v, h] = t.useState(null != s ? s : ""), [g, x] = t.useState(!1), w = (0, a.useComposedRefs)(r, e => {
                var t;
                return null == (t = d.itemRefCallback) ? void 0 : t.call(d, e, l, i)
            }), y = (0, p.useId)(), b = t.useRef("touch"), S = () => {
                i || (c.onValueChange(l), c.onOpenChange(!1))
            };
            if ("" === l) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, C.jsx)(es, {
                scope: o,
                value: l,
                disabled: i,
                textId: y,
                isSelected: f,
                onItemTextChange: t.useCallback(e => {
                    h(t => {
                        var r;
                        return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                    })
                }, []),
                children: (0, C.jsx)(A.ItemSlot, {
                    scope: o,
                    value: l,
                    disabled: i,
                    textValue: v,
                    children: (0, C.jsx)(m.Primitive.div, {
                        role: "option",
                        "aria-labelledby": y,
                        "data-highlighted": g ? "" : void 0,
                        "aria-selected": f && g,
                        "data-state": f ? "checked" : "unchecked",
                        "aria-disabled": i || void 0,
                        "data-disabled": i ? "" : void 0,
                        tabIndex: i ? void 0 : -1,
                        ...u,
                        ref: w,
                        onFocus: (0, n.composeEventHandlers)(u.onFocus, () => x(!0)),
                        onBlur: (0, n.composeEventHandlers)(u.onBlur, () => x(!1)),
                        onClick: (0, n.composeEventHandlers)(u.onClick, () => {
                            "mouse" !== b.current && S()
                        }),
                        onPointerUp: (0, n.composeEventHandlers)(u.onPointerUp, () => {
                            "mouse" === b.current && S()
                        }),
                        onPointerDown: (0, n.composeEventHandlers)(u.onPointerDown, e => {
                            b.current = e.pointerType
                        }),
                        onPointerMove: (0, n.composeEventHandlers)(u.onPointerMove, e => {
                            if (b.current = e.pointerType, i) {
                                var t;
                                null == (t = d.onItemLeave) || t.call(d)
                            } else "mouse" === b.current && e.currentTarget.focus({
                                preventScroll: !0
                            })
                        }),
                        onPointerLeave: (0, n.composeEventHandlers)(u.onPointerLeave, e => {
                            if (e.currentTarget === document.activeElement) {
                                var t;
                                null == (t = d.onItemLeave) || t.call(d)
                            }
                        }),
                        onKeyDown: (0, n.composeEventHandlers)(u.onKeyDown, e => {
                            var t;
                            ((null == (t = d.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (E.includes(e.key) && S(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    ec.displayName = ei;
    var ed = "SelectItemText",
        ep = t.forwardRef((e, o) => {
            let {
                __scopeSelect: n,
                className: l,
                style: i,
                ...s
            } = e, u = M(ed, n), c = q(ed, n), d = eu(ed, n), p = L(ed, n), [f, v] = t.useState(null), h = (0, a.useComposedRefs)(o, e => v(e), d.onItemTextChange, e => {
                var t;
                return null == (t = c.itemTextRefCallback) ? void 0 : t.call(c, e, d.value, d.disabled)
            }), g = null == f ? void 0 : f.textContent, x = t.useMemo(() => (0, C.jsx)("option", {
                value: d.value,
                disabled: d.disabled,
                children: g
            }, d.value), [d.disabled, d.value, g]), {
                onNativeOptionAdd: y,
                onNativeOptionRemove: b
            } = p;
            return (0, w.useLayoutEffect)(() => (y(x), () => b(x)), [y, b, x]), (0, C.jsxs)(C.Fragment, {
                children: [(0, C.jsx)(m.Primitive.span, {
                    id: d.textId,
                    ...s,
                    ref: h
                }), d.isSelected && u.valueNode && !u.valueNodeHasChildren ? r.createPortal(s.children, u.valueNode) : null]
            })
        });
    ep.displayName = ed;
    var ef = "SelectItemIndicator";
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...o
        } = e;
        return eu(ef, r).isSelected ? (0, C.jsx)(m.Primitive.span, {
            "aria-hidden": !0,
            ...o,
            ref: t
        }) : null
    }).displayName = ef;
    var ev = "SelectScrollUpButton";
    t.forwardRef((e, r) => {
        let o = q(ev, e.__scopeSelect),
            n = ee(ev, e.__scopeSelect),
            [l, i] = t.useState(!1),
            s = (0, a.useComposedRefs)(r, n.onScrollButtonChange);
        return (0, w.useLayoutEffect)(() => {
            if (o.viewport && o.isPositioned) {
                let e = function() {
                        i(t.scrollTop > 0)
                    },
                    t = o.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [o.viewport, o.isPositioned]), l ? (0, C.jsx)(eh, {
            ...e,
            ref: s,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = o;
                e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
            }
        }) : null
    }).displayName = ev;
    var em = "SelectScrollDownButton";
    t.forwardRef((e, r) => {
        let o = q(em, e.__scopeSelect),
            n = ee(em, e.__scopeSelect),
            [l, i] = t.useState(!1),
            s = (0, a.useComposedRefs)(r, n.onScrollButtonChange);
        return (0, w.useLayoutEffect)(() => {
            if (o.viewport && o.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        i(Math.ceil(t.scrollTop) < e)
                    },
                    t = o.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [o.viewport, o.isPositioned]), l ? (0, C.jsx)(eh, {
            ...e,
            ref: s,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = o;
                e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
            }
        }) : null
    }).displayName = em;
    var eh = t.forwardRef((e, r) => {
        let {
            __scopeSelect: o,
            onAutoScroll: l,
            ...a
        } = e, i = q("SelectScrollButton", o), s = t.useRef(null), u = I(o), c = t.useCallback(() => {
            null !== s.current && (window.clearInterval(s.current), s.current = null)
        }, []);
        return t.useEffect(() => () => c(), [c]), (0, w.useLayoutEffect)(() => {
            var e;
            let t = u().find(e => e.ref.current === document.activeElement);
            null == t || null == (e = t.ref.current) || e.scrollIntoView({
                block: "nearest"
            })
        }, [u]), (0, C.jsx)(m.Primitive.div, {
            "aria-hidden": !0,
            ...a,
            ref: r,
            style: {
                flexShrink: 0,
                ...a.style
            },
            onPointerDown: (0, n.composeEventHandlers)(a.onPointerDown, () => {
                null === s.current && (s.current = window.setInterval(l, 50))
            }),
            onPointerMove: (0, n.composeEventHandlers)(a.onPointerMove, () => {
                var e;
                null == (e = i.onItemLeave) || e.call(i), null === s.current && (s.current = window.setInterval(l, 50))
            }),
            onPointerLeave: (0, n.composeEventHandlers)(a.onPointerLeave, () => {
                c()
            })
        })
    });
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...o
        } = e;
        return (0, C.jsx)(m.Primitive.div, {
            "aria-hidden": !0,
            ...o,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var eg = "SelectArrow";

    function ex(e) {
        return "" === e || void 0 === e
    }
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...o
        } = e, n = H(r), l = M(eg, r), a = q(eg, r);
        return l.open && "popper" === a.position ? (0, C.jsx)(f.Arrow, {
            ...n,
            ...o,
            ref: t
        }) : null
    }).displayName = eg;
    var ew = t.forwardRef((e, r) => {
        let {
            value: o,
            ...n
        } = e, l = t.useRef(null), i = (0, a.useComposedRefs)(r, l), s = (0, y.usePrevious)(o);
        return t.useEffect(() => {
            let e = l.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
            if (s !== o && t) {
                let r = new Event("change", {
                    bubbles: !0
                });
                t.call(e, o), e.dispatchEvent(r)
            }
        }, [s, o]), (0, C.jsx)(b, {
            asChild: !0,
            children: (0, C.jsx)("select", {
                ...n,
                ref: i,
                defaultValue: o
            })
        })
    });

    function ey(e) {
        let r = (0, g.useCallbackRef)(e),
            o = t.useRef(""),
            n = t.useRef(0),
            l = t.useCallback(e => {
                let t = o.current + e;
                r(t),
                    function e(t) {
                        o.current = t, window.clearTimeout(n.current), "" !== t && (n.current = window.setTimeout(() => e(""), 1e3))
                    }(t)
            }, [r]),
            a = t.useCallback(() => {
                o.current = "", window.clearTimeout(n.current)
            }, []);
        return t.useEffect(() => () => window.clearTimeout(n.current), []), [o, l, a]
    }

    function eC(e, t, r) {
        var o, n;
        let l = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            a = r ? e.indexOf(r) : -1,
            i = (o = e, n = Math.max(a, 0), o.map((e, t) => o[(n + t) % o.length]));
        1 === l.length && (i = i.filter(e => e !== r));
        let s = i.find(e => e.textValue.toLowerCase().startsWith(l.toLowerCase()));
        return s !== r ? s : void 0
    }
    ew.displayName = "BubbleSelect", e.s(["Content", 0, G, "Icon", 0, U, "Item", 0, ec, "ItemText", 0, ep, "Portal", 0, z, "Root", 0, O, "Trigger", 0, B, "Value", 0, V, "Viewport", 0, er], 563921)
}]);

//# debugId=c2ff05af-7fc6-6ca8-55f2-1f4502c4fd3f
//# sourceMappingURL=1rgoo8t32bhae.js.map
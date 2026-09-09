;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "d8d8d2f5-e3c4-e8da-3839-7d24b00d53b5")
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
                width: i = 10,
                height: l = 5,
                ...a
            } = e;
            return (0, n.jsx)(r.Primitive.svg, {
                ...a,
                ref: t,
                width: i,
                height: l,
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
        i = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let l = e + "CollectionProvider",
            [a, s] = (0, r.createContextScope)(l),
            [u, c] = a(l, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: r,
                    children: n
                } = e, o = t.default.useRef(null), l = t.default.useRef(new Map).current;
                return (0, i.jsx)(u, {
                    scope: r,
                    itemMap: l,
                    collectionRef: o,
                    children: n
                })
            };
        d.displayName = l;
        let f = e + "CollectionSlot",
            p = (0, o.createSlot)(f),
            v = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: o
                } = e, l = c(f, r), a = (0, n.useComposedRefs)(t, l.collectionRef);
                return (0, i.jsx)(p, {
                    ref: a,
                    children: o
                })
            });
        v.displayName = f;
        let m = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, o.createSlot)(m),
            y = t.default.forwardRef((e, r) => {
                let {
                    scope: o,
                    children: l,
                    ...a
                } = e, s = t.default.useRef(null), u = (0, n.useComposedRefs)(r, s), d = c(m, o);
                return t.default.useEffect(() => (d.itemMap.set(s, {
                    ref: s,
                    ...a
                }), () => void d.itemMap.delete(s))), (0, i.jsx)(g, {
                    ...{
                        [h]: ""
                    },
                    ref: u,
                    children: l
                })
            });
        return y.displayName = m, [{
            Provider: d,
            Slot: v,
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
        i = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let l = e + "CollectionProvider",
            [a, s] = (0, r.createContextScope)(l),
            [u, c] = a(l, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: r,
                    children: n
                } = e, o = t.default.useRef(null), l = t.default.useRef(new Map).current;
                return (0, i.jsx)(u, {
                    scope: r,
                    itemMap: l,
                    collectionRef: o,
                    children: n
                })
            };
        d.displayName = l;
        let f = e + "CollectionSlot",
            p = (0, o.createSlot)(f),
            v = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: o
                } = e, l = c(f, r), a = (0, n.useComposedRefs)(t, l.collectionRef);
                return (0, i.jsx)(p, {
                    ref: a,
                    children: o
                })
            });
        v.displayName = f;
        let m = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, o.createSlot)(m),
            y = t.default.forwardRef((e, r) => {
                let {
                    scope: o,
                    children: l,
                    ...a
                } = e, s = t.default.useRef(null), u = (0, n.useComposedRefs)(r, s), d = c(m, o);
                return t.default.useEffect(() => (d.itemMap.set(s, {
                    ref: s,
                    ...a
                }), () => void d.itemMap.delete(s))), (0, i.jsx)(g, {
                    ...{
                        [h]: ""
                    },
                    ref: u,
                    children: l
                })
            });
        return y.displayName = m, [{
            Provider: d,
            Slot: v,
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
}, 734463, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(19655),
        n = e.i(78892),
        o = e.i(608652),
        i = e.i(598943),
        l = e.i(793808),
        a = e.i(44265),
        s = e.i(40266),
        u = e.i(524887),
        c = e.i(763960),
        d = e.i(226972),
        f = e.i(594278),
        p = e.i(699704),
        v = e.i(428156),
        m = e.i(3300),
        h = e.i(813593),
        g = e.i(221628),
        y = "Popover",
        [w, x] = (0, o.createContextScope)(y, [u.createPopperScope]),
        b = (0, u.createPopperScope)(),
        [C, R] = w(y),
        E = e => {
            let {
                __scopePopover: r,
                children: n,
                open: o,
                defaultOpen: i,
                onOpenChange: l,
                modal: a = !1
            } = e, c = b(r), d = t.useRef(null), [f, p] = t.useState(!1), [m = !1, h] = (0, v.useControllableState)({
                prop: o,
                defaultProp: i,
                onChange: l
            });
            return (0, g.jsx)(u.Root, {
                ...c,
                children: (0, g.jsx)(C, {
                    scope: r,
                    contentId: (0, s.useId)(),
                    triggerRef: d,
                    open: m,
                    onOpenChange: h,
                    onOpenToggle: t.useCallback(() => h(e => !e), [h]),
                    hasCustomAnchor: f,
                    onCustomAnchorAdd: t.useCallback(() => p(!0), []),
                    onCustomAnchorRemove: t.useCallback(() => p(!1), []),
                    modal: a,
                    children: n
                })
            })
        };
    E.displayName = y;
    var S = "PopoverAnchor",
        P = t.forwardRef((e, r) => {
            let {
                __scopePopover: n,
                ...o
            } = e, i = R(S, n), l = b(n), {
                onCustomAnchorAdd: a,
                onCustomAnchorRemove: s
            } = i;
            return t.useEffect(() => (a(), () => s()), [a, s]), (0, g.jsx)(u.Anchor, {
                ...l,
                ...o,
                ref: r
            })
        });
    P.displayName = S;
    var A = "PopoverTrigger",
        T = t.forwardRef((e, t) => {
            let {
                __scopePopover: o,
                ...i
            } = e, l = R(A, o), a = b(o), s = (0, n.useComposedRefs)(t, l.triggerRef), c = (0, g.jsx)(f.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": l.open,
                "aria-controls": l.contentId,
                "data-state": V(l.open),
                ...i,
                ref: s,
                onClick: (0, r.composeEventHandlers)(e.onClick, l.onOpenToggle)
            });
            return l.hasCustomAnchor ? c : (0, g.jsx)(u.Anchor, {
                asChild: !0,
                ...a,
                children: c
            })
        });
    T.displayName = A;
    var j = "PopoverPortal",
        [L, O] = w(j, {
            forceMount: void 0
        }),
        D = e => {
            let {
                __scopePopover: t,
                forceMount: r,
                children: n,
                container: o
            } = e, i = R(j, t);
            return (0, g.jsx)(L, {
                scope: t,
                forceMount: r,
                children: (0, g.jsx)(d.Presence, {
                    present: r || i.open,
                    children: (0, g.jsx)(c.Portal, {
                        asChild: !0,
                        container: o,
                        children: n
                    })
                })
            })
        };
    D.displayName = j;
    var N = "PopoverContent",
        k = t.forwardRef((e, t) => {
            let r = O(N, e.__scopePopover),
                {
                    forceMount: n = r.forceMount,
                    ...o
                } = e,
                i = R(N, e.__scopePopover);
            return (0, g.jsx)(d.Presence, {
                present: n || i.open,
                children: i.modal ? (0, g.jsx)(M, {
                    ...o,
                    ref: t
                }) : (0, g.jsx)(H, {
                    ...o,
                    ref: t
                })
            })
        });
    k.displayName = N;
    var I = (0, p.createSlot)("PopoverContent.RemoveScroll"),
        M = t.forwardRef((e, o) => {
            let i = R(N, e.__scopePopover),
                l = t.useRef(null),
                a = (0, n.useComposedRefs)(o, l),
                s = t.useRef(!1);
            return t.useEffect(() => {
                let e = l.current;
                if (e) return (0, m.hideOthers)(e)
            }, []), (0, g.jsx)(h.RemoveScroll, {
                as: I,
                allowPinchZoom: !0,
                children: (0, g.jsx)(F, {
                    ...e,
                    ref: a,
                    trapFocus: i.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: (0, r.composeEventHandlers)(e.onCloseAutoFocus, e => {
                        var t;
                        e.preventDefault(), s.current || null == (t = i.triggerRef.current) || t.focus()
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
        H = t.forwardRef((e, r) => {
            let n = R(N, e.__scopePopover),
                o = t.useRef(!1),
                i = t.useRef(!1);
            return (0, g.jsx)(F, {
                ...e,
                ref: r,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var r, l;
                    null == (r = e.onCloseAutoFocus) || r.call(e, t), t.defaultPrevented || (o.current || null == (l = n.triggerRef.current) || l.focus(), t.preventDefault()), o.current = !1, i.current = !1
                },
                onInteractOutside: t => {
                    var r, l;
                    null == (r = e.onInteractOutside) || r.call(e, t), t.defaultPrevented || (o.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                    let a = t.target;
                    (null == (l = n.triggerRef.current) ? void 0 : l.contains(a)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                }
            })
        }),
        F = t.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                trapFocus: n,
                onOpenAutoFocus: o,
                onCloseAutoFocus: s,
                disableOutsidePointerEvents: c,
                onEscapeKeyDown: d,
                onPointerDownOutside: f,
                onFocusOutside: p,
                onInteractOutside: v,
                ...m
            } = e, h = R(N, r), y = b(r);
            return (0, l.useFocusGuards)(), (0, g.jsx)(a.FocusScope, {
                asChild: !0,
                loop: !0,
                trapped: n,
                onMountAutoFocus: o,
                onUnmountAutoFocus: s,
                children: (0, g.jsx)(i.DismissableLayer, {
                    asChild: !0,
                    disableOutsidePointerEvents: c,
                    onInteractOutside: v,
                    onEscapeKeyDown: d,
                    onPointerDownOutside: f,
                    onFocusOutside: p,
                    onDismiss: () => h.onOpenChange(!1),
                    children: (0, g.jsx)(u.Content, {
                        "data-state": V(h.open),
                        role: "dialog",
                        id: h.contentId,
                        ...y,
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
        W = t.forwardRef((e, t) => {
            let {
                __scopePopover: n,
                ...o
            } = e, i = R(_, n);
            return (0, g.jsx)(f.Primitive.button, {
                type: "button",
                ...o,
                ref: t,
                onClick: (0, r.composeEventHandlers)(e.onClick, () => i.onOpenChange(!1))
            })
        });
    W.displayName = _;
    var B = t.forwardRef((e, t) => {
        let {
            __scopePopover: r,
            ...n
        } = e, o = b(r);
        return (0, g.jsx)(u.Arrow, {
            ...o,
            ...n,
            ref: t
        })
    });

    function V(e) {
        return e ? "open" : "closed"
    }
    B.displayName = "PopoverArrow", e.s(["Anchor", 0, P, "Arrow", 0, B, "Close", 0, W, "Content", 0, k, "Portal", 0, D, "Root", 0, E, "Trigger", 0, T])
}, 524887, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(297452),
        n = e.i(992486),
        o = e.i(742187),
        i = e.i(78892),
        l = e.i(608652),
        a = e.i(594278),
        s = e.i(886449),
        u = e.i(723570),
        c = e.i(692166),
        d = e.i(221628),
        f = "Popper",
        [p, v] = (0, l.createContextScope)(f),
        [m, h] = p(f),
        g = e => {
            let {
                __scopePopper: r,
                children: n
            } = e, [o, i] = t.useState(null);
            return (0, d.jsx)(m, {
                scope: r,
                anchor: o,
                onAnchorChange: i,
                children: n
            })
        };
    g.displayName = f;
    var y = "PopperAnchor",
        w = t.forwardRef((e, r) => {
            let {
                __scopePopper: n,
                virtualRef: o,
                ...l
            } = e, s = h(y, n), u = t.useRef(null), c = (0, i.useComposedRefs)(r, u);
            return t.useEffect(() => {
                s.onAnchorChange((null == o ? void 0 : o.current) || u.current)
            }), o ? null : (0, d.jsx)(a.Primitive.div, {
                ...l,
                ref: c
            })
        });
    w.displayName = y;
    var x = "PopperContent",
        [b, C] = p(x),
        R = t.forwardRef((e, o) => {
            var l, f, p, v, m, g, y, w;
            let {
                __scopePopper: C,
                side: R = "bottom",
                sideOffset: E = 0,
                align: S = "center",
                alignOffset: P = 0,
                arrowPadding: L = 0,
                avoidCollisions: O = !0,
                collisionBoundary: D = [],
                collisionPadding: N = 0,
                sticky: k = "partial",
                hideWhenDetached: I = !1,
                updatePositionStrategy: M = "optimized",
                onPlaced: H,
                ...F
            } = e, _ = h(x, C), [W, B] = t.useState(null), V = (0, i.useComposedRefs)(o, e => B(e)), [z, U] = t.useState(null), K = (0, c.useSize)(z), Y = null != (l = null == K ? void 0 : K.width) ? l : 0, X = null != (f = null == K ? void 0 : K.height) ? f : 0, G = "number" == typeof N ? N : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...N
            }, q = Array.isArray(D) ? D : [D], $ = q.length > 0, Z = {
                padding: G,
                boundary: q.filter(A),
                altBoundary: $
            }, {
                refs: J,
                floatingStyles: Q,
                placement: ee,
                isPositioned: et,
                middlewareData: er
            } = (0, r.useFloating)({
                strategy: "fixed",
                placement: R + ("center" !== S ? "-" + S : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, n.autoUpdate)(...t, {
                        animationFrame: "always" === M
                    })
                },
                elements: {
                    reference: _.anchor
                },
                middleware: [(0, r.offset)({
                    mainAxis: E + X,
                    alignmentAxis: P
                }), O && (0, r.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === k ? (0, r.limitShift)() : void 0,
                    ...Z
                }), O && (0, r.flip)({
                    ...Z
                }), (0, r.size)({
                    ...Z,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: n,
                            availableHeight: o
                        } = e, {
                            width: i,
                            height: l
                        } = r.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(n, "px")), a.setProperty("--radix-popper-available-height", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(i, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                    }
                }), z && (0, r.arrow)({
                    element: z,
                    padding: L
                }), T({
                    arrowWidth: Y,
                    arrowHeight: X
                }), I && (0, r.hide)({
                    strategy: "referenceHidden",
                    ...Z
                })]
            }), [en, eo] = j(ee), ei = (0, s.useCallbackRef)(H);
            (0, u.useLayoutEffect)(() => {
                et && (null == ei || ei())
            }, [et, ei]);
            let el = null == (p = er.arrow) ? void 0 : p.x,
                ea = null == (v = er.arrow) ? void 0 : v.y,
                es = (null == (m = er.arrow) ? void 0 : m.centerOffset) !== 0,
                [eu, ec] = t.useState();
            return (0, u.useLayoutEffect)(() => {
                W && ec(window.getComputedStyle(W).zIndex)
            }, [W]), (0, d.jsx)("div", {
                ref: J.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...Q,
                    transform: et ? Q.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: eu,
                    "--radix-popper-transform-origin": [null == (g = er.transformOrigin) ? void 0 : g.x, null == (y = er.transformOrigin) ? void 0 : y.y].join(" "),
                    ...(null == (w = er.hide) ? void 0 : w.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, d.jsx)(b, {
                    scope: C,
                    placedSide: en,
                    onArrowChange: U,
                    arrowX: el,
                    arrowY: ea,
                    shouldHideArrow: es,
                    children: (0, d.jsx)(a.Primitive.div, {
                        "data-side": en,
                        "data-align": eo,
                        ...F,
                        ref: V,
                        style: {
                            ...F.style,
                            animation: et ? void 0 : "none"
                        }
                    })
                })
            })
        });
    R.displayName = x;
    var E = "PopperArrow",
        S = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        P = t.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, i = C(E, r), l = S[i.placedSide];
            return (0, d.jsx)("span", {
                ref: i.onArrowChange,
                style: {
                    position: "absolute",
                    left: i.arrowX,
                    top: i.arrowY,
                    [l]: 0,
                    transformOrigin: {
                        top: "",
                        right: "0 0",
                        bottom: "center 0",
                        left: "100% 0"
                    } [i.placedSide],
                    transform: {
                        top: "translateY(100%)",
                        right: "translateY(50%) rotate(90deg) translateX(-50%)",
                        bottom: "rotate(180deg)",
                        left: "translateY(50%) rotate(-90deg) translateX(50%)"
                    } [i.placedSide],
                    visibility: i.shouldHideArrow ? "hidden" : void 0
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

    function A(e) {
        return null !== e
    }
    P.displayName = E;
    var T = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, n, o, i, l;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, v] = j(a), m = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [v], h = (null != (r = null == (i = u.arrow) ? void 0 : i.x) ? r : 0) + d / 2, g = (null != (n = null == (l = u.arrow) ? void 0 : l.y) ? n : 0) + f / 2, y = "", w = "";
            return "bottom" === p ? (y = c ? m : "".concat(h, "px"), w = "".concat(-f, "px")) : "top" === p ? (y = c ? m : "".concat(h, "px"), w = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), w = c ? m : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), w = c ? m : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: w
                }
            }
        }
    });

    function j(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["Anchor", 0, w, "Arrow", 0, P, "Content", 0, R, "Root", 0, g, "createPopperScope", 0, v])
}, 600317, e => {
    "use strict";
    var t = e.i(416340);
    e.i(149285);
    var r = e.i(76992),
        n = e.i(221628),
        o = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, o) => {
            let i = (0, r.createSlot)("Primitive.".concat(o)),
                l = t.forwardRef((e, t) => {
                    let {
                        asChild: r,
                        ...l
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, n.jsx)(r ? i : o, {
                        ...l,
                        ref: t
                    })
                });
            return l.displayName = "Primitive.".concat(o), {
                ...e,
                [o]: l
            }
        }, {});
    e.s(["Primitive", 0, o])
}, 142953, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(174617),
        n = e.i(508785),
        o = e.i(78892),
        i = e.i(608652),
        l = e.i(40266),
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
        v = "RovingFocusGroup",
        [m, h, g] = (0, n.createCollection)(v),
        [y, w] = (0, i.createContextScope)(v, [g]),
        [x, b] = y(v),
        C = t.forwardRef((e, t) => (0, d.jsx)(m.Provider, {
            scope: e.__scopeRovingFocusGroup,
            children: (0, d.jsx)(m.Slot, {
                scope: e.__scopeRovingFocusGroup,
                children: (0, d.jsx)(R, {
                    ...e,
                    ref: t
                })
            })
        }));
    C.displayName = v;
    var R = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: i,
                orientation: l,
                loop: m = !1,
                dir: g,
                currentTabStopId: y,
                defaultCurrentTabStopId: w,
                onCurrentTabStopIdChange: b,
                onEntryFocus: C,
                preventScrollOnEntryFocus: R = !1,
                ...E
            } = e, S = t.useRef(null), P = (0, o.useComposedRefs)(n, S), T = (0, c.useDirection)(g), [j, L] = (0, u.useControllableState)({
                prop: y,
                defaultProp: null != w ? w : null,
                onChange: b,
                caller: v
            }), [O, D] = t.useState(!1), N = (0, s.useCallbackRef)(C), k = h(i), I = t.useRef(!1), [M, H] = t.useState(0);
            return t.useEffect(() => {
                let e = S.current;
                if (e) return e.addEventListener(f, N), () => e.removeEventListener(f, N)
            }, [N]), (0, d.jsx)(x, {
                scope: i,
                orientation: l,
                dir: T,
                loop: m,
                currentTabStopId: j,
                onItemFocus: t.useCallback(e => L(e), [L]),
                onItemShiftTab: t.useCallback(() => D(!0), []),
                onFocusableItemAdd: t.useCallback(() => H(e => e + 1), []),
                onFocusableItemRemove: t.useCallback(() => H(e => e - 1), []),
                children: (0, d.jsx)(a.Primitive.div, {
                    tabIndex: O || 0 === M ? -1 : 0,
                    "data-orientation": l,
                    ...E,
                    ref: P,
                    style: {
                        outline: "none",
                        ...e.style
                    },
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, () => {
                        I.current = !0
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, e => {
                        let t = !I.current;
                        if (e.target === e.currentTarget && t && !O) {
                            let t = new CustomEvent(f, p);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = k().filter(e => e.focusable);
                                A([e.find(e => e.active), e.find(e => e.id === j), ...e].filter(Boolean).map(e => e.ref.current), R)
                            }
                        }
                        I.current = !1
                    }),
                    onBlur: (0, r.composeEventHandlers)(e.onBlur, () => D(!1))
                })
            })
        }),
        E = "RovingFocusGroupItem",
        S = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: o,
                focusable: i = !0,
                active: s = !1,
                tabStopId: u,
                children: c,
                ...f
            } = e, p = (0, l.useId)(), v = u || p, g = b(E, o), y = g.currentTabStopId === v, w = h(o), {
                onFocusableItemAdd: x,
                onFocusableItemRemove: C,
                currentTabStopId: R
            } = g;
            return t.useEffect(() => {
                if (i) return x(), () => C()
            }, [i, x, C]), (0, d.jsx)(m.ItemSlot, {
                scope: o,
                id: v,
                focusable: i,
                active: s,
                children: (0, d.jsx)(a.Primitive.span, {
                    tabIndex: y ? 0 : -1,
                    "data-orientation": g.orientation,
                    ...f,
                    ref: n,
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, e => {
                        i ? g.onItemFocus(v) : e.preventDefault()
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, () => g.onItemFocus(v)),
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
                            let o = w().filter(e => e.focusable).map(e => e.ref.current);
                            if ("last" === t) o.reverse();
                            else if ("prev" === t || "next" === t) {
                                var r, n;
                                "prev" === t && o.reverse();
                                let i = o.indexOf(e.currentTarget);
                                o = g.loop ? (r = o, n = i + 1, r.map((e, t) => r[(n + t) % r.length])) : o.slice(i + 1)
                            }
                            setTimeout(() => A(o))
                        }
                    }),
                    children: "function" == typeof c ? c({
                        isCurrentTabStop: y,
                        hasTabStop: null != R
                    }) : c
                })
            })
        });
    S.displayName = E;
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

    function A(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            r = document.activeElement;
        for (let n of e)
            if (n === r || (n.focus({
                    preventScroll: t
                }), document.activeElement !== r)) return
    }
    e.s(["Item", 0, S, "Root", 0, C, "createRovingFocusGroupScope", 0, w])
}, 563921, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(149285),
        n = e.i(305607),
        o = e.i(19655),
        i = e.i(539206),
        l = e.i(78892),
        a = e.i(608652),
        s = e.i(974539),
        u = e.i(598943),
        c = e.i(793808),
        d = e.i(44265),
        f = e.i(40266),
        p = e.i(524887),
        v = e.i(763960),
        m = e.i(594278),
        h = e.i(699704),
        g = e.i(886449),
        y = e.i(428156),
        w = e.i(723570),
        x = e.i(300792),
        b = e.i(221628),
        C = t.forwardRef((e, t) => (0, b.jsx)(m.Primitive.span, {
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
    C.displayName = "VisuallyHidden";
    var R = e.i(3300),
        E = e.i(813593),
        S = [" ", "Enter", "ArrowUp", "ArrowDown"],
        P = [" ", "Enter"],
        A = "Select",
        [T, j, L] = (0, i.createCollection)(A),
        [O, D] = (0, a.createContextScope)(A, [L, p.createPopperScope]),
        N = (0, p.createPopperScope)(),
        [k, I] = O(A),
        [M, H] = O(A),
        F = e => {
            let {
                __scopeSelect: r,
                children: n,
                open: o,
                defaultOpen: i,
                onOpenChange: l,
                value: a,
                defaultValue: u,
                onValueChange: c,
                dir: d,
                name: v,
                autoComplete: m,
                disabled: h,
                required: g,
                form: w
            } = e, x = N(r), [C, R] = t.useState(null), [E, S] = t.useState(null), [P, A] = t.useState(!1), j = (0, s.useDirection)(d), [L = !1, O] = (0, y.useControllableState)({
                prop: o,
                defaultProp: i,
                onChange: l
            }), [D, I] = (0, y.useControllableState)({
                prop: a,
                defaultProp: u,
                onChange: c
            }), H = t.useRef(null), F = !C || w || !!C.closest("form"), [_, W] = t.useState(new Set), B = Array.from(_).map(e => e.props.value).join(";");
            return (0, b.jsx)(p.Root, {
                ...x,
                children: (0, b.jsxs)(k, {
                    required: g,
                    scope: r,
                    trigger: C,
                    onTriggerChange: R,
                    valueNode: E,
                    onValueNodeChange: S,
                    valueNodeHasChildren: P,
                    onValueNodeHasChildrenChange: A,
                    contentId: (0, f.useId)(),
                    value: D,
                    onValueChange: I,
                    open: L,
                    onOpenChange: O,
                    dir: j,
                    triggerPointerDownPosRef: H,
                    disabled: h,
                    children: [(0, b.jsx)(T.Provider, {
                        scope: r,
                        children: (0, b.jsx)(M, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: t.useCallback(e => {
                                W(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: t.useCallback(e => {
                                W(t => {
                                    let r = new Set(t);
                                    return r.delete(e), r
                                })
                            }, []),
                            children: n
                        })
                    }), F ? (0, b.jsxs)(ew, {
                        "aria-hidden": !0,
                        required: g,
                        tabIndex: -1,
                        name: v,
                        autoComplete: m,
                        value: D,
                        onChange: e => I(e.target.value),
                        disabled: h,
                        form: w,
                        children: [void 0 === D ? (0, b.jsx)("option", {
                            value: ""
                        }) : null, Array.from(_)]
                    }, B) : null]
                })
            })
        };
    F.displayName = A;
    var _ = "SelectTrigger",
        W = t.forwardRef((e, r) => {
            let {
                __scopeSelect: n,
                disabled: i = !1,
                ...a
            } = e, s = N(n), u = I(_, n), c = u.disabled || i, d = (0, l.useComposedRefs)(r, u.onTriggerChange), f = j(n), v = t.useRef("touch"), [h, g, y] = ex(e => {
                let t = f().filter(e => !e.disabled),
                    r = t.find(e => e.value === u.value),
                    n = eb(t, e, r);
                void 0 !== n && u.onValueChange(n.value)
            }), w = e => {
                c || (u.onOpenChange(!0), y()), e && (u.triggerPointerDownPosRef.current = {
                    x: Math.round(e.pageX),
                    y: Math.round(e.pageY)
                })
            };
            return (0, b.jsx)(p.Anchor, {
                asChild: !0,
                ...s,
                children: (0, b.jsx)(m.Primitive.button, {
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
                    "data-placeholder": ey(u.value) ? "" : void 0,
                    ...a,
                    ref: d,
                    onClick: (0, o.composeEventHandlers)(a.onClick, e => {
                        e.currentTarget.focus(), "mouse" !== v.current && w(e)
                    }),
                    onPointerDown: (0, o.composeEventHandlers)(a.onPointerDown, e => {
                        v.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (w(e), e.preventDefault())
                    }),
                    onKeyDown: (0, o.composeEventHandlers)(a.onKeyDown, e => {
                        let t = "" !== h.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || g(e.key), (!t || " " !== e.key) && S.includes(e.key) && (w(), e.preventDefault())
                    })
                })
            })
        });
    W.displayName = _;
    var B = "SelectValue",
        V = t.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: n,
                style: o,
                children: i,
                placeholder: a = "",
                ...s
            } = e, u = I(B, r), {
                onValueNodeHasChildrenChange: c
            } = u, d = void 0 !== i, f = (0, l.useComposedRefs)(t, u.onValueNodeChange);
            return (0, w.useLayoutEffect)(() => {
                c(d)
            }, [c, d]), (0, b.jsx)(m.Primitive.span, {
                ...s,
                ref: f,
                style: {
                    pointerEvents: "none"
                },
                children: ey(u.value) ? (0, b.jsx)(b.Fragment, {
                    children: a
                }) : i
            })
        });
    V.displayName = B;
    var z = t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            children: n,
            ...o
        } = e;
        return (0, b.jsx)(m.Primitive.span, {
            "aria-hidden": !0,
            ...o,
            ref: t,
            children: n || "▼"
        })
    });
    z.displayName = "SelectIcon";
    var U = e => (0, b.jsx)(v.Portal, {
        asChild: !0,
        ...e
    });
    U.displayName = "SelectPortal";
    var K = "SelectContent",
        Y = t.forwardRef((e, n) => {
            let o = I(K, e.__scopeSelect),
                [i, l] = t.useState();
            return ((0, w.useLayoutEffect)(() => {
                l(new DocumentFragment)
            }, []), o.open) ? (0, b.jsx)($, {
                ...e,
                ref: n
            }) : i ? r.createPortal((0, b.jsx)(X, {
                scope: e.__scopeSelect,
                children: (0, b.jsx)(T.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, b.jsx)("div", {
                        children: e.children
                    })
                })
            }), i) : null
        });
    Y.displayName = K;
    var [X, G] = O(K), q = (0, h.createSlot)("SelectContent.RemoveScroll"), $ = t.forwardRef((e, r) => {
        let {
            __scopeSelect: n,
            position: i = "item-aligned",
            onCloseAutoFocus: a,
            onEscapeKeyDown: s,
            onPointerDownOutside: f,
            side: p,
            sideOffset: v,
            align: m,
            alignOffset: h,
            arrowPadding: g,
            collisionBoundary: y,
            collisionPadding: w,
            sticky: x,
            hideWhenDetached: C,
            avoidCollisions: S,
            ...P
        } = e, A = I(K, n), [T, L] = t.useState(null), [O, D] = t.useState(null), N = (0, l.useComposedRefs)(r, e => L(e)), [k, M] = t.useState(null), [H, F] = t.useState(null), _ = j(n), [W, B] = t.useState(!1), V = t.useRef(!1);
        t.useEffect(() => {
            if (T) return (0, R.hideOthers)(T)
        }, [T]), (0, c.useFocusGuards)();
        let z = t.useCallback(e => {
                let [t, ...r] = _().map(e => e.ref.current), [n] = r.slice(-1), o = document.activeElement;
                for (let r of e)
                    if (r === o || (null == r || r.scrollIntoView({
                            block: "nearest"
                        }), r === t && O && (O.scrollTop = 0), r === n && O && (O.scrollTop = O.scrollHeight), null == r || r.focus(), document.activeElement !== o)) return
            }, [_, O]),
            U = t.useCallback(() => z([k, T]), [z, k, T]);
        t.useEffect(() => {
            W && U()
        }, [W, U]);
        let {
            onOpenChange: Y,
            triggerPointerDownPosRef: G
        } = A;
        t.useEffect(() => {
            if (T) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        var r, n, o, i;
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (null != (r = null == (o = G.current) ? void 0 : o.x) ? r : 0)),
                            y: Math.abs(Math.round(t.pageY) - (null != (n = null == (i = G.current) ? void 0 : i.y) ? n : 0))
                        }
                    },
                    r = r => {
                        e.x <= 10 && e.y <= 10 ? r.preventDefault() : T.contains(r.target) || Y(!1), document.removeEventListener("pointermove", t), G.current = null
                    };
                return null !== G.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                        capture: !0
                    })
                }
            }
        }, [T, Y, G]), t.useEffect(() => {
            let e = () => Y(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [Y]);
        let [$, Q] = ex(e => {
            let t = _().filter(e => !e.disabled),
                r = t.find(e => e.ref.current === document.activeElement),
                n = eb(t, e, r);
            n && setTimeout(() => n.ref.current.focus())
        }), ee = t.useCallback((e, t, r) => {
            let n = !V.current && !r;
            (void 0 !== A.value && A.value === t || n) && (M(e), n && (V.current = !0))
        }, [A.value]), et = t.useCallback(() => null == T ? void 0 : T.focus(), [T]), er = t.useCallback((e, t, r) => {
            let n = !V.current && !r;
            (void 0 !== A.value && A.value === t || n) && F(e)
        }, [A.value]), en = "popper" === i ? J : Z, eo = en === J ? {
            side: p,
            sideOffset: v,
            align: m,
            alignOffset: h,
            arrowPadding: g,
            collisionBoundary: y,
            collisionPadding: w,
            sticky: x,
            hideWhenDetached: C,
            avoidCollisions: S
        } : {};
        return (0, b.jsx)(X, {
            scope: n,
            content: T,
            viewport: O,
            onViewportChange: D,
            itemRefCallback: ee,
            selectedItem: k,
            onItemLeave: et,
            itemTextRefCallback: er,
            focusSelectedItem: U,
            selectedItemText: H,
            position: i,
            isPositioned: W,
            searchRef: $,
            children: (0, b.jsx)(E.RemoveScroll, {
                as: q,
                allowPinchZoom: !0,
                children: (0, b.jsx)(d.FocusScope, {
                    asChild: !0,
                    trapped: A.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: (0, o.composeEventHandlers)(a, e => {
                        var t;
                        null == (t = A.trigger) || t.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, b.jsx)(u.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !0,
                        onEscapeKeyDown: s,
                        onPointerDownOutside: f,
                        onFocusOutside: e => e.preventDefault(),
                        onDismiss: () => A.onOpenChange(!1),
                        children: (0, b.jsx)(en, {
                            role: "listbox",
                            id: A.contentId,
                            "data-state": A.open ? "open" : "closed",
                            dir: A.dir,
                            onContextMenu: e => e.preventDefault(),
                            ...P,
                            ...eo,
                            onPlaced: () => B(!0),
                            ref: N,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...P.style
                            },
                            onKeyDown: (0, o.composeEventHandlers)(P.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || Q(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = _().filter(e => !e.disabled).map(e => e.ref.current);
                                    if (["ArrowUp", "End"].includes(e.key) && (t = t.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                        let r = e.target,
                                            n = t.indexOf(r);
                                        t = t.slice(n + 1)
                                    }
                                    setTimeout(() => z(t)), e.preventDefault()
                                }
                            })
                        })
                    })
                })
            })
        })
    });
    $.displayName = "SelectContentImpl";
    var Z = t.forwardRef((e, r) => {
        let {
            __scopeSelect: o,
            onPlaced: i,
            ...a
        } = e, s = I(K, o), u = G(K, o), [c, d] = t.useState(null), [f, p] = t.useState(null), v = (0, l.useComposedRefs)(r, e => p(e)), h = j(o), g = t.useRef(!1), y = t.useRef(!0), {
            viewport: x,
            selectedItem: C,
            selectedItemText: R,
            focusSelectedItem: E
        } = u, S = t.useCallback(() => {
            if (s.trigger && s.valueNode && c && f && x && C && R) {
                let e = s.trigger.getBoundingClientRect(),
                    t = f.getBoundingClientRect(),
                    r = s.valueNode.getBoundingClientRect(),
                    o = R.getBoundingClientRect();
                if ("rtl" !== s.dir) {
                    let i = o.left - t.left,
                        l = r.left - i,
                        a = e.left - l,
                        s = e.width + a,
                        u = Math.max(s, t.width),
                        d = window.innerWidth - 10,
                        f = (0, n.clamp)(l, [10, Math.max(10, d - u)]);
                    c.style.minWidth = s + "px", c.style.left = f + "px"
                } else {
                    let i = t.right - o.right,
                        l = window.innerWidth - r.right - i,
                        a = window.innerWidth - e.right - l,
                        s = e.width + a,
                        u = Math.max(s, t.width),
                        d = window.innerWidth - 10,
                        f = (0, n.clamp)(l, [10, Math.max(10, d - u)]);
                    c.style.minWidth = s + "px", c.style.right = f + "px"
                }
                let l = h(),
                    a = window.innerHeight - 20,
                    u = x.scrollHeight,
                    d = window.getComputedStyle(f),
                    p = parseInt(d.borderTopWidth, 10),
                    v = parseInt(d.paddingTop, 10),
                    m = parseInt(d.borderBottomWidth, 10),
                    y = p + v + u + parseInt(d.paddingBottom, 10) + m,
                    w = Math.min(5 * C.offsetHeight, y),
                    b = window.getComputedStyle(x),
                    E = parseInt(b.paddingTop, 10),
                    S = parseInt(b.paddingBottom, 10),
                    P = e.top + e.height / 2 - 10,
                    A = C.offsetHeight / 2,
                    T = p + v + (C.offsetTop + A);
                if (T <= P) {
                    let e = l.length > 0 && C === l[l.length - 1].ref.current;
                    c.style.bottom = "0px";
                    let t = Math.max(a - P, A + (e ? S : 0) + (f.clientHeight - x.offsetTop - x.offsetHeight) + m);
                    c.style.height = T + t + "px"
                } else {
                    let e = l.length > 0 && C === l[0].ref.current;
                    c.style.top = "0px";
                    let t = Math.max(P, p + x.offsetTop + (e ? E : 0) + A);
                    c.style.height = t + (y - T) + "px", x.scrollTop = T - P + x.offsetTop
                }
                c.style.margin = "".concat(10, "px 0"), c.style.minHeight = w + "px", c.style.maxHeight = a + "px", null == i || i(), requestAnimationFrame(() => g.current = !0)
            }
        }, [h, s.trigger, s.valueNode, c, f, x, C, R, s.dir, i]);
        (0, w.useLayoutEffect)(() => S(), [S]);
        let [P, A] = t.useState();
        (0, w.useLayoutEffect)(() => {
            f && A(window.getComputedStyle(f).zIndex)
        }, [f]);
        let T = t.useCallback(e => {
            e && !0 === y.current && (S(), null == E || E(), y.current = !1)
        }, [S, E]);
        return (0, b.jsx)(Q, {
            scope: o,
            contentWrapper: c,
            shouldExpandOnScrollRef: g,
            onScrollButtonChange: T,
            children: (0, b.jsx)("div", {
                ref: d,
                style: {
                    display: "flex",
                    flexDirection: "column",
                    position: "fixed",
                    zIndex: P
                },
                children: (0, b.jsx)(m.Primitive.div, {
                    ...a,
                    ref: v,
                    style: {
                        boxSizing: "border-box",
                        maxHeight: "100%",
                        ...a.style
                    }
                })
            })
        })
    });
    Z.displayName = "SelectItemAlignedPosition";
    var J = t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            align: n = "start",
            collisionPadding: o = 10,
            ...i
        } = e, l = N(r);
        return (0, b.jsx)(p.Content, {
            ...l,
            ...i,
            ref: t,
            align: n,
            collisionPadding: o,
            style: {
                boxSizing: "border-box",
                ...i.style,
                "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
            }
        })
    });
    J.displayName = "SelectPopperPosition";
    var [Q, ee] = O(K, {}), et = "SelectViewport", er = t.forwardRef((e, r) => {
        let {
            __scopeSelect: n,
            nonce: i,
            ...a
        } = e, s = G(et, n), u = ee(et, n), c = (0, l.useComposedRefs)(r, s.onViewportChange), d = t.useRef(0);
        return (0, b.jsxs)(b.Fragment, {
            children: [(0, b.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: i
            }), (0, b.jsx)(T.Slot, {
                scope: n,
                children: (0, b.jsx)(m.Primitive.div, {
                    "data-radix-select-viewport": "",
                    role: "presentation",
                    ...a,
                    ref: c,
                    style: {
                        position: "relative",
                        flex: 1,
                        overflow: "hidden auto",
                        ...a.style
                    },
                    onScroll: (0, o.composeEventHandlers)(a.onScroll, e => {
                        let t = e.currentTarget,
                            {
                                contentWrapper: r,
                                shouldExpandOnScrollRef: n
                            } = u;
                        if ((null == n ? void 0 : n.current) && r) {
                            let e = Math.abs(d.current - t.scrollTop);
                            if (e > 0) {
                                let n = window.innerHeight - 20,
                                    o = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                if (o < n) {
                                    let i = o + e,
                                        l = Math.min(n, i),
                                        a = i - l;
                                    r.style.height = l + "px", "0px" === r.style.bottom && (t.scrollTop = a > 0 ? a : 0, r.style.justifyContent = "flex-end")
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
    var en = "SelectGroup",
        [eo, ei] = O(en);
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, o = (0, f.useId)();
        return (0, b.jsx)(eo, {
            scope: r,
            id: o,
            children: (0, b.jsx)(m.Primitive.div, {
                role: "group",
                "aria-labelledby": o,
                ...n,
                ref: t
            })
        })
    }).displayName = en;
    var el = "SelectLabel";
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, o = ei(el, r);
        return (0, b.jsx)(m.Primitive.div, {
            id: o.id,
            ...n,
            ref: t
        })
    }).displayName = el;
    var ea = "SelectItem",
        [es, eu] = O(ea),
        ec = t.forwardRef((e, r) => {
            let {
                __scopeSelect: n,
                value: i,
                disabled: a = !1,
                textValue: s,
                ...u
            } = e, c = I(ea, n), d = G(ea, n), p = c.value === i, [v, h] = t.useState(null != s ? s : ""), [g, y] = t.useState(!1), w = (0, l.useComposedRefs)(r, e => {
                var t;
                return null == (t = d.itemRefCallback) ? void 0 : t.call(d, e, i, a)
            }), x = (0, f.useId)(), C = t.useRef("touch"), R = () => {
                a || (c.onValueChange(i), c.onOpenChange(!1))
            };
            if ("" === i) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, b.jsx)(es, {
                scope: n,
                value: i,
                disabled: a,
                textId: x,
                isSelected: p,
                onItemTextChange: t.useCallback(e => {
                    h(t => {
                        var r;
                        return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                    })
                }, []),
                children: (0, b.jsx)(T.ItemSlot, {
                    scope: n,
                    value: i,
                    disabled: a,
                    textValue: v,
                    children: (0, b.jsx)(m.Primitive.div, {
                        role: "option",
                        "aria-labelledby": x,
                        "data-highlighted": g ? "" : void 0,
                        "aria-selected": p && g,
                        "data-state": p ? "checked" : "unchecked",
                        "aria-disabled": a || void 0,
                        "data-disabled": a ? "" : void 0,
                        tabIndex: a ? void 0 : -1,
                        ...u,
                        ref: w,
                        onFocus: (0, o.composeEventHandlers)(u.onFocus, () => y(!0)),
                        onBlur: (0, o.composeEventHandlers)(u.onBlur, () => y(!1)),
                        onClick: (0, o.composeEventHandlers)(u.onClick, () => {
                            "mouse" !== C.current && R()
                        }),
                        onPointerUp: (0, o.composeEventHandlers)(u.onPointerUp, () => {
                            "mouse" === C.current && R()
                        }),
                        onPointerDown: (0, o.composeEventHandlers)(u.onPointerDown, e => {
                            C.current = e.pointerType
                        }),
                        onPointerMove: (0, o.composeEventHandlers)(u.onPointerMove, e => {
                            if (C.current = e.pointerType, a) {
                                var t;
                                null == (t = d.onItemLeave) || t.call(d)
                            } else "mouse" === C.current && e.currentTarget.focus({
                                preventScroll: !0
                            })
                        }),
                        onPointerLeave: (0, o.composeEventHandlers)(u.onPointerLeave, e => {
                            if (e.currentTarget === document.activeElement) {
                                var t;
                                null == (t = d.onItemLeave) || t.call(d)
                            }
                        }),
                        onKeyDown: (0, o.composeEventHandlers)(u.onKeyDown, e => {
                            var t;
                            ((null == (t = d.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (P.includes(e.key) && R(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    ec.displayName = ea;
    var ed = "SelectItemText",
        ef = t.forwardRef((e, n) => {
            let {
                __scopeSelect: o,
                className: i,
                style: a,
                ...s
            } = e, u = I(ed, o), c = G(ed, o), d = eu(ed, o), f = H(ed, o), [p, v] = t.useState(null), h = (0, l.useComposedRefs)(n, e => v(e), d.onItemTextChange, e => {
                var t;
                return null == (t = c.itemTextRefCallback) ? void 0 : t.call(c, e, d.value, d.disabled)
            }), g = null == p ? void 0 : p.textContent, y = t.useMemo(() => (0, b.jsx)("option", {
                value: d.value,
                disabled: d.disabled,
                children: g
            }, d.value), [d.disabled, d.value, g]), {
                onNativeOptionAdd: x,
                onNativeOptionRemove: C
            } = f;
            return (0, w.useLayoutEffect)(() => (x(y), () => C(y)), [x, C, y]), (0, b.jsxs)(b.Fragment, {
                children: [(0, b.jsx)(m.Primitive.span, {
                    id: d.textId,
                    ...s,
                    ref: h
                }), d.isSelected && u.valueNode && !u.valueNodeHasChildren ? r.createPortal(s.children, u.valueNode) : null]
            })
        });
    ef.displayName = ed;
    var ep = "SelectItemIndicator";
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e;
        return eu(ep, r).isSelected ? (0, b.jsx)(m.Primitive.span, {
            "aria-hidden": !0,
            ...n,
            ref: t
        }) : null
    }).displayName = ep;
    var ev = "SelectScrollUpButton";
    t.forwardRef((e, r) => {
        let n = G(ev, e.__scopeSelect),
            o = ee(ev, e.__scopeSelect),
            [i, a] = t.useState(!1),
            s = (0, l.useComposedRefs)(r, o.onScrollButtonChange);
        return (0, w.useLayoutEffect)(() => {
            if (n.viewport && n.isPositioned) {
                let e = function() {
                        a(t.scrollTop > 0)
                    },
                    t = n.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [n.viewport, n.isPositioned]), i ? (0, b.jsx)(eh, {
            ...e,
            ref: s,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = n;
                e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
            }
        }) : null
    }).displayName = ev;
    var em = "SelectScrollDownButton";
    t.forwardRef((e, r) => {
        let n = G(em, e.__scopeSelect),
            o = ee(em, e.__scopeSelect),
            [i, a] = t.useState(!1),
            s = (0, l.useComposedRefs)(r, o.onScrollButtonChange);
        return (0, w.useLayoutEffect)(() => {
            if (n.viewport && n.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        a(Math.ceil(t.scrollTop) < e)
                    },
                    t = n.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [n.viewport, n.isPositioned]), i ? (0, b.jsx)(eh, {
            ...e,
            ref: s,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = n;
                e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
            }
        }) : null
    }).displayName = em;
    var eh = t.forwardRef((e, r) => {
        let {
            __scopeSelect: n,
            onAutoScroll: i,
            ...l
        } = e, a = G("SelectScrollButton", n), s = t.useRef(null), u = j(n), c = t.useCallback(() => {
            null !== s.current && (window.clearInterval(s.current), s.current = null)
        }, []);
        return t.useEffect(() => () => c(), [c]), (0, w.useLayoutEffect)(() => {
            var e;
            let t = u().find(e => e.ref.current === document.activeElement);
            null == t || null == (e = t.ref.current) || e.scrollIntoView({
                block: "nearest"
            })
        }, [u]), (0, b.jsx)(m.Primitive.div, {
            "aria-hidden": !0,
            ...l,
            ref: r,
            style: {
                flexShrink: 0,
                ...l.style
            },
            onPointerDown: (0, o.composeEventHandlers)(l.onPointerDown, () => {
                null === s.current && (s.current = window.setInterval(i, 50))
            }),
            onPointerMove: (0, o.composeEventHandlers)(l.onPointerMove, () => {
                var e;
                null == (e = a.onItemLeave) || e.call(a), null === s.current && (s.current = window.setInterval(i, 50))
            }),
            onPointerLeave: (0, o.composeEventHandlers)(l.onPointerLeave, () => {
                c()
            })
        })
    });
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e;
        return (0, b.jsx)(m.Primitive.div, {
            "aria-hidden": !0,
            ...n,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var eg = "SelectArrow";

    function ey(e) {
        return "" === e || void 0 === e
    }
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, o = N(r), i = I(eg, r), l = G(eg, r);
        return i.open && "popper" === l.position ? (0, b.jsx)(p.Arrow, {
            ...o,
            ...n,
            ref: t
        }) : null
    }).displayName = eg;
    var ew = t.forwardRef((e, r) => {
        let {
            value: n,
            ...o
        } = e, i = t.useRef(null), a = (0, l.useComposedRefs)(r, i), s = (0, x.usePrevious)(n);
        return t.useEffect(() => {
            let e = i.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
            if (s !== n && t) {
                let r = new Event("change", {
                    bubbles: !0
                });
                t.call(e, n), e.dispatchEvent(r)
            }
        }, [s, n]), (0, b.jsx)(C, {
            asChild: !0,
            children: (0, b.jsx)("select", {
                ...o,
                ref: a,
                defaultValue: n
            })
        })
    });

    function ex(e) {
        let r = (0, g.useCallbackRef)(e),
            n = t.useRef(""),
            o = t.useRef(0),
            i = t.useCallback(e => {
                let t = n.current + e;
                r(t),
                    function e(t) {
                        n.current = t, window.clearTimeout(o.current), "" !== t && (o.current = window.setTimeout(() => e(""), 1e3))
                    }(t)
            }, [r]),
            l = t.useCallback(() => {
                n.current = "", window.clearTimeout(o.current)
            }, []);
        return t.useEffect(() => () => window.clearTimeout(o.current), []), [n, i, l]
    }

    function eb(e, t, r) {
        var n, o;
        let i = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            l = r ? e.indexOf(r) : -1,
            a = (n = e, o = Math.max(l, 0), n.map((e, t) => n[(o + t) % n.length]));
        1 === i.length && (a = a.filter(e => e !== r));
        let s = a.find(e => e.textValue.toLowerCase().startsWith(i.toLowerCase()));
        return s !== r ? s : void 0
    }
    ew.displayName = "BubbleSelect", e.s(["Content", 0, Y, "Icon", 0, z, "Item", 0, ec, "ItemText", 0, ef, "Portal", 0, U, "Root", 0, F, "Trigger", 0, W, "Value", 0, V, "Viewport", 0, er], 563921)
}, 76992, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(78892),
        n = e.i(221628),
        o = Symbol("radix.slottable");

    function i(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === o
    }
    e.s(["createSlot", 0, function(e) {
        var o;
        let l, a = (o = e, (l = t.forwardRef((e, n) => {
                let {
                    children: o,
                    ...i
                } = e;
                if (t.isValidElement(o)) {
                    var l, a, s;
                    let e, u, c = (u = (e = null == (a = Object.getOwnPropertyDescriptor((l = o).props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning) ? l.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? l.props.ref : l.props.ref || l.ref,
                        d = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let o = e[n],
                                    i = t[n];
                                /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    let n = i(...t);
                                    return o(...t), n
                                } : o && (r[n] = o) : "style" === n ? r[n] = {
                                    ...o,
                                    ...i
                                } : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(i, o.props);
                    return o.type !== t.Fragment && (d.ref = n ? (0, r.composeRefs)(n, c) : c), t.cloneElement(o, d)
                }
                return t.Children.count(o) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(o, ".SlotClone"), l),
            s = t.forwardRef((e, r) => {
                let {
                    children: o,
                    ...l
                } = e, s = t.Children.toArray(o), u = s.find(i);
                if (u) {
                    let e = u.props.children,
                        o = s.map(r => r !== u ? r : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, n.jsx)(a, {
                        ...l,
                        ref: r,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, o) : null
                    })
                }
                return (0, n.jsx)(a, {
                    ...l,
                    ref: r,
                    children: o
                })
            });
        return s.displayName = "".concat(e, ".Slot"), s
    }])
}, 989665, 992486, 297452, e => {
    "use strict";
    let t;
    var r, n, o = e.i(416340);

    function i(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(n) {
            if (null == e || e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
        }
    }

    function l(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function a() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return e => {
            let r = !1,
                n = t.map(t => {
                    let n = l(t, e);
                    return r || "function" != typeof n || (r = !0), n
                });
            if (r) return () => {
                for (let e = 0; e < n.length; e++) {
                    let r = n[e];
                    "function" == typeof r ? r() : l(t[e], null)
                }
            }
        }
    }

    function s() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return o.useCallback(a(...t), t)
    }
    var u = e.i(221628);

    function c(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            r = [],
            n = () => {
                let t = r.map(e => o.createContext(e));
                return function(r) {
                    let n = (null == r ? void 0 : r[e]) || t;
                    return o.useMemo(() => ({
                        ["__scope".concat(e)]: {
                            ...r,
                            [e]: n
                        }
                    }), [r, n])
                }
            };
        return n.scopeName = e, [function(t, n) {
            let i = o.createContext(n),
                l = r.length;
            r = [...r, n];
            let a = t => {
                var r;
                let {
                    scope: n,
                    children: a,
                    ...s
                } = t, c = (null == n || null == (r = n[e]) ? void 0 : r[l]) || i, d = o.useMemo(() => s, Object.values(s));
                return (0, u.jsx)(c.Provider, {
                    value: d,
                    children: a
                })
            };
            return a.displayName = t + "Provider", [a, function(r, a) {
                var s;
                let u = (null == a || null == (s = a[e]) ? void 0 : s[l]) || i,
                    c = o.useContext(u);
                if (c) return c;
                if (void 0 !== n) return n;
                throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            let n = t[0];
            if (1 === t.length) return n;
            let i = () => {
                let e = t.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(t) {
                    let r = e.reduce((e, r) => {
                        let {
                            useScope: n,
                            scopeName: o
                        } = r, i = n(t)["__scope".concat(o)];
                        return {
                            ...e,
                            ...i
                        }
                    }, {});
                    return o.useMemo(() => ({
                        ["__scope".concat(n.scopeName)]: r
                    }), [r])
                }
            };
            return i.scopeName = n.scopeName, i
        }(n, ...t)]
    }
    var d = e.i(149285),
        f = o.forwardRef((e, t) => {
            let {
                children: r,
                ...n
            } = e, i = o.Children.toArray(r), l = i.find(m);
            if (l) {
                let e = l.props.children,
                    r = i.map(t => t !== l ? t : o.Children.count(e) > 1 ? o.Children.only(null) : o.isValidElement(e) ? e.props.children : null);
                return (0, u.jsx)(p, {
                    ...n,
                    ref: t,
                    children: o.isValidElement(e) ? o.cloneElement(e, void 0, r) : null
                })
            }
            return (0, u.jsx)(p, {
                ...n,
                ref: t,
                children: r
            })
        });
    f.displayName = "Slot";
    var p = o.forwardRef((e, t) => {
        let {
            children: r,
            ...n
        } = e;
        if (o.isValidElement(r)) {
            var i, l, s;
            let e, u, c = (u = (e = null == (l = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : l.get) && "isReactWarning" in e && e.isReactWarning) ? i.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? i.props.ref : i.props.ref || i.ref;
            return o.cloneElement(r, {
                ... function(e, t) {
                    let r = {
                        ...t
                    };
                    for (let n in t) {
                        let o = e[n],
                            i = t[n];
                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                            i(...t), o(...t)
                        } : o && (r[n] = o) : "style" === n ? r[n] = {
                            ...o,
                            ...i
                        } : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                    }
                    return {
                        ...e,
                        ...r
                    }
                }(n, r.props),
                ref: t ? a(t, c) : c
            })
        }
        return o.Children.count(r) > 1 ? o.Children.only(null) : null
    });
    p.displayName = "SlotClone";
    var v = e => {
        let {
            children: t
        } = e;
        return (0, u.jsx)(u.Fragment, {
            children: t
        })
    };

    function m(e) {
        return o.isValidElement(e) && e.type === v
    }
    var h = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
        let r = o.forwardRef((e, r) => {
            let {
                asChild: n,
                ...o
            } = e, i = n ? f : t;
            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, u.jsx)(i, {
                ...o,
                ref: r
            })
        });
        return r.displayName = "Primitive.".concat(t), {
            ...e,
            [t]: r
        }
    }, {});

    function g(e) {
        let t = o.useRef(e);
        return o.useEffect(() => {
            t.current = e
        }), o.useMemo(() => function() {
            for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
            return null == (e = t.current) ? void 0 : e.call(t, ...n)
        }, [])
    }
    var y = "dismissableLayer.update",
        w = o.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        x = o.forwardRef((e, t) => {
            var n, l;
            let {
                disableOutsidePointerEvents: a = !1,
                onEscapeKeyDown: c,
                onPointerDownOutside: d,
                onFocusOutside: f,
                onInteractOutside: p,
                onDismiss: v,
                ...m
            } = e, x = o.useContext(w), [R, E] = o.useState(null), S = null != (n = null == R ? void 0 : R.ownerDocument) ? n : null == (l = globalThis) ? void 0 : l.document, [, P] = o.useState({}), A = s(t, e => E(e)), T = Array.from(x.layers), [j] = [...x.layersWithOutsidePointerEventsDisabled].slice(-1), L = T.indexOf(j), O = R ? T.indexOf(R) : -1, D = x.layersWithOutsidePointerEventsDisabled.size > 0, N = O >= L, k = function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    n = g(e),
                    i = o.useRef(!1),
                    l = o.useRef(() => {});
                return o.useEffect(() => {
                    let e = e => {
                            if (e.target && !i.current) {
                                let t = function() {
                                        C("dismissableLayer.pointerDownOutside", n, o, {
                                            discrete: !0
                                        })
                                    },
                                    o = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (r.removeEventListener("click", l.current), l.current = t, r.addEventListener("click", l.current, {
                                    once: !0
                                })) : t()
                            } else r.removeEventListener("click", l.current);
                            i.current = !1
                        },
                        t = window.setTimeout(() => {
                            r.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(t), r.removeEventListener("pointerdown", e), r.removeEventListener("click", l.current)
                    }
                }, [r, n]), {
                    onPointerDownCapture: () => i.current = !0
                }
            }(e => {
                let t = e.target,
                    r = [...x.branches].some(e => e.contains(t));
                N && !r && (null == d || d(e), null == p || p(e), e.defaultPrevented || null == v || v())
            }, S), I = function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    n = g(e),
                    i = o.useRef(!1);
                return o.useEffect(() => {
                    let e = e => {
                        e.target && !i.current && C("dismissableLayer.focusOutside", n, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return r.addEventListener("focusin", e), () => r.removeEventListener("focusin", e)
                }, [r, n]), {
                    onFocusCapture: () => i.current = !0,
                    onBlurCapture: () => i.current = !1
                }
            }(e => {
                let t = e.target;
                ![...x.branches].some(e => e.contains(t)) && (null == f || f(e), null == p || p(e), e.defaultPrevented || null == v || v())
            }, S);
            return ! function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    n = g(e);
                o.useEffect(() => {
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
                O === x.layers.size - 1 && (null == c || c(e), !e.defaultPrevented && v && (e.preventDefault(), v()))
            }, S), o.useEffect(() => {
                if (R) return a && (0 === x.layersWithOutsidePointerEventsDisabled.size && (r = S.body.style.pointerEvents, S.body.style.pointerEvents = "none"), x.layersWithOutsidePointerEventsDisabled.add(R)), x.layers.add(R), b(), () => {
                    a && 1 === x.layersWithOutsidePointerEventsDisabled.size && (S.body.style.pointerEvents = r)
                }
            }, [R, S, a, x]), o.useEffect(() => () => {
                R && (x.layers.delete(R), x.layersWithOutsidePointerEventsDisabled.delete(R), b())
            }, [R, x]), o.useEffect(() => {
                let e = () => P({});
                return document.addEventListener(y, e), () => document.removeEventListener(y, e)
            }, []), (0, u.jsx)(h.div, {
                ...m,
                ref: A,
                style: {
                    pointerEvents: D ? N ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: i(e.onFocusCapture, I.onFocusCapture),
                onBlurCapture: i(e.onBlurCapture, I.onBlurCapture),
                onPointerDownCapture: i(e.onPointerDownCapture, k.onPointerDownCapture)
            })
        });

    function b() {
        let e = new CustomEvent(y);
        document.dispatchEvent(e)
    }

    function C(e, t, r, n) {
        let {
            discrete: o
        } = n, i = r.originalEvent.target, l = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: r
        });
        if (t && i.addEventListener(e, t, {
                once: !0
            }), o) i && d.flushSync(() => i.dispatchEvent(l));
        else i.dispatchEvent(l)
    }
    x.displayName = "DismissableLayer", o.forwardRef((e, t) => {
        let r = o.useContext(w),
            n = o.useRef(null),
            i = s(t, n);
        return o.useEffect(() => {
            let e = n.current;
            if (e) return r.branches.add(e), () => {
                r.branches.delete(e)
            }
        }, [r.branches]), (0, u.jsx)(h.div, {
            ...e,
            ref: i
        })
    }).displayName = "DismissableLayerBranch";
    var R = (null == (n = globalThis) ? void 0 : n.document) ? o.useLayoutEffect : () => {},
        E = o["useId".toString()] || (() => void 0),
        S = 0;
    let P = ["top", "right", "bottom", "left"],
        A = P.reduce((e, t) => e.concat(t, t + "-start", t + "-end"), []),
        T = Math.min,
        j = Math.max,
        L = Math.round,
        O = Math.floor,
        D = e => ({
            x: e,
            y: e
        }),
        N = {
            left: "right",
            right: "left",
            bottom: "top",
            top: "bottom"
        };

    function k(e, t) {
        return "function" == typeof e ? e(t) : e
    }

    function I(e) {
        return e.split("-")[0]
    }

    function M(e) {
        return e.split("-")[1]
    }

    function H(e) {
        return "x" === e ? "y" : "x"
    }

    function F(e) {
        return "y" === e ? "height" : "width"
    }

    function _(e) {
        let t = e[0];
        return "t" === t || "b" === t ? "y" : "x"
    }

    function W(e, t, r) {
        void 0 === r && (r = !1);
        let n = M(e),
            o = H(_(e)),
            i = F(o),
            l = "x" === o ? n === (r ? "end" : "start") ? "right" : "left" : "start" === n ? "bottom" : "top";
        return t.reference[i] > t.floating[i] && (l = Y(l)), [l, Y(l)]
    }

    function B(e) {
        return e.includes("start") ? e.replace("start", "end") : e.replace("end", "start")
    }
    let V = ["left", "right"],
        z = ["right", "left"],
        U = ["top", "bottom"],
        K = ["bottom", "top"];

    function Y(e) {
        let t = I(e);
        return N[t] + e.slice(t.length)
    }

    function X(e) {
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

    function G(e) {
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

    function q(e, t, r) {
        let n, {
                reference: o,
                floating: i
            } = e,
            l = _(t),
            a = H(_(t)),
            s = F(a),
            u = I(t),
            c = "y" === l,
            d = o.x + o.width / 2 - i.width / 2,
            f = o.y + o.height / 2 - i.height / 2,
            p = o[s] / 2 - i[s] / 2;
        switch (u) {
            case "top":
                n = {
                    x: d,
                    y: o.y - i.height
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
                    x: o.x - i.width,
                    y: f
                };
                break;
            default:
                n = {
                    x: o.x,
                    y: o.y
                }
        }
        switch (M(t)) {
            case "start":
                n[a] -= p * (r && c ? -1 : 1);
                break;
            case "end":
                n[a] += p * (r && c ? -1 : 1)
        }
        return n
    }
    async function $(e, t) {
        var r;
        void 0 === t && (t = {});
        let {
            x: n,
            y: o,
            platform: i,
            rects: l,
            elements: a,
            strategy: s
        } = e, {
            boundary: u = "clippingAncestors",
            rootBoundary: c = "viewport",
            elementContext: d = "floating",
            altBoundary: f = !1,
            padding: p = 0
        } = k(t, e), v = X(p), m = a[f ? "floating" === d ? "reference" : "floating" : d], h = G(await i.getClippingRect({
            element: null == (r = await (null == i.isElement ? void 0 : i.isElement(m))) || r ? m : m.contextElement || await (null == i.getDocumentElement ? void 0 : i.getDocumentElement(a.floating)),
            boundary: u,
            rootBoundary: c,
            strategy: s
        })), g = "floating" === d ? {
            x: n,
            y: o,
            width: l.floating.width,
            height: l.floating.height
        } : l.reference, y = await (null == i.getOffsetParent ? void 0 : i.getOffsetParent(a.floating)), w = await (null == i.isElement ? void 0 : i.isElement(y)) && await (null == i.getScale ? void 0 : i.getScale(y)) || {
            x: 1,
            y: 1
        }, x = G(i.convertOffsetParentRelativeRectToViewportRelativeRect ? await i.convertOffsetParentRelativeRectToViewportRelativeRect({
            elements: a,
            rect: g,
            offsetParent: y,
            strategy: s
        }) : g);
        return {
            top: (h.top - x.top + v.top) / w.y,
            bottom: (x.bottom - h.bottom + v.bottom) / w.y,
            left: (h.left - x.left + v.left) / w.x,
            right: (x.right - h.right + v.right) / w.x
        }
    }
    let Z = async (e, t, r) => {
        let {
            placement: n = "bottom",
            strategy: o = "absolute",
            middleware: i = [],
            platform: l
        } = r, a = l.detectOverflow ? l : {
            ...l,
            detectOverflow: $
        }, s = await (null == l.isRTL ? void 0 : l.isRTL(t)), u = await l.getElementRects({
            reference: e,
            floating: t,
            strategy: o
        }), {
            x: c,
            y: d
        } = q(u, n, s), f = n, p = 0, v = {};
        for (let r = 0; r < i.length; r++) {
            let m = i[r];
            if (!m) continue;
            let {
                name: h,
                fn: g
            } = m, {
                x: y,
                y: w,
                data: x,
                reset: b
            } = await g({
                x: c,
                y: d,
                initialPlacement: n,
                placement: f,
                strategy: o,
                middlewareData: v,
                rects: u,
                platform: a,
                elements: {
                    reference: e,
                    floating: t
                }
            });
            c = null != y ? y : c, d = null != w ? w : d, v[h] = {
                ...v[h],
                ...x
            }, b && p < 50 && (p++, "object" == typeof b && (b.placement && (f = b.placement), b.rects && (u = !0 === b.rects ? await l.getElementRects({
                reference: e,
                floating: t,
                strategy: o
            }) : b.rects), {
                x: c,
                y: d
            } = q(u, f, s)), r = -1)
        }
        return {
            x: c,
            y: d,
            placement: f,
            strategy: o,
            middlewareData: v
        }
    };

    function J(e, t) {
        return {
            top: e.top - t.height,
            right: e.right - t.width,
            bottom: e.bottom - t.height,
            left: e.left - t.width
        }
    }

    function Q(e) {
        return P.some(t => e[t] >= 0)
    }

    function ee(e) {
        let t = T(...e.map(e => e.left)),
            r = T(...e.map(e => e.top));
        return {
            x: t,
            y: r,
            width: j(...e.map(e => e.right)) - t,
            height: j(...e.map(e => e.bottom)) - r
        }
    }
    let et = new Set(["left", "top"]);
    async function er(e, t) {
        let {
            placement: r,
            platform: n,
            elements: o
        } = e, i = await (null == n.isRTL ? void 0 : n.isRTL(o.floating)), l = I(r), a = M(r), s = "y" === _(r), u = et.has(l) ? -1 : 1, c = i && s ? -1 : 1, d = k(t, e), {
            mainAxis: f,
            crossAxis: p,
            alignmentAxis: v
        } = "number" == typeof d ? {
            mainAxis: d,
            crossAxis: 0,
            alignmentAxis: null
        } : {
            mainAxis: d.mainAxis || 0,
            crossAxis: d.crossAxis || 0,
            alignmentAxis: d.alignmentAxis
        };
        return a && "number" == typeof v && (p = "end" === a ? -1 * v : v), s ? {
            x: p * c,
            y: f * u
        } : {
            x: f * u,
            y: p * c
        }
    }

    function en() {
        return "u" > typeof window
    }

    function eo(e) {
        return ea(e) ? (e.nodeName || "").toLowerCase() : "#document"
    }

    function ei(e) {
        var t;
        return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
    }

    function el(e) {
        var t;
        return null == (t = (ea(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
    }

    function ea(e) {
        return !!en() && (e instanceof Node || e instanceof ei(e).Node)
    }

    function es(e) {
        return !!en() && (e instanceof Element || e instanceof ei(e).Element)
    }

    function eu(e) {
        return !!en() && (e instanceof HTMLElement || e instanceof ei(e).HTMLElement)
    }

    function ec(e) {
        return !(!en() || "u" < typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof ei(e).ShadowRoot)
    }

    function ed(e) {
        let {
            overflow: t,
            overflowX: r,
            overflowY: n,
            display: o
        } = ew(e);
        return /auto|scroll|overlay|hidden|clip/.test(t + n + r) && "inline" !== o && "contents" !== o
    }

    function ef(e) {
        try {
            if (e.matches(":popover-open")) return !0
        } catch (e) {}
        try {
            return e.matches(":modal")
        } catch (e) {
            return !1
        }
    }
    let ep = /transform|translate|scale|rotate|perspective|filter/,
        ev = /paint|layout|strict|content/,
        em = e => !!e && "none" !== e;

    function eh(e) {
        let t = es(e) ? ew(e) : e;
        return em(t.transform) || em(t.translate) || em(t.scale) || em(t.rotate) || em(t.perspective) || !eg() && (em(t.backdropFilter) || em(t.filter)) || ep.test(t.willChange || "") || ev.test(t.contain || "")
    }

    function eg() {
        return null == t && (t = "u" > typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), t
    }

    function ey(e) {
        return /^(html|body|#document)$/.test(eo(e))
    }

    function ew(e) {
        return ei(e).getComputedStyle(e)
    }

    function ex(e) {
        return es(e) ? {
            scrollLeft: e.scrollLeft,
            scrollTop: e.scrollTop
        } : {
            scrollLeft: e.scrollX,
            scrollTop: e.scrollY
        }
    }

    function eb(e) {
        if ("html" === eo(e)) return e;
        let t = e.assignedSlot || e.parentNode || ec(e) && e.host || el(e);
        return ec(t) ? t.host : t
    }

    function eC(e, t, r) {
        var n;
        void 0 === t && (t = []), void 0 === r && (r = !0);
        let o = function e(t) {
                let r = eb(t);
                return ey(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : eu(r) && ed(r) ? r : e(r)
            }(e),
            i = o === (null == (n = e.ownerDocument) ? void 0 : n.body),
            l = ei(o);
        if (!i) return t.concat(o, eC(o, [], r));
        {
            let e = eR(l);
            return t.concat(l, l.visualViewport || [], ed(o) ? o : [], e && r ? eC(e) : [])
        }
    }

    function eR(e) {
        return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
    }

    function eE(e) {
        let t = ew(e),
            r = parseFloat(t.width) || 0,
            n = parseFloat(t.height) || 0,
            o = eu(e),
            i = o ? e.offsetWidth : r,
            l = o ? e.offsetHeight : n,
            a = L(r) !== i || L(n) !== l;
        return a && (r = i, n = l), {
            width: r,
            height: n,
            $: a
        }
    }

    function eS(e) {
        return es(e) ? e : e.contextElement
    }

    function eP(e) {
        let t = eS(e);
        if (!eu(t)) return D(1);
        let r = t.getBoundingClientRect(),
            {
                width: n,
                height: o,
                $: i
            } = eE(t),
            l = (i ? L(r.width) : r.width) / n,
            a = (i ? L(r.height) : r.height) / o;
        return l && Number.isFinite(l) || (l = 1), a && Number.isFinite(a) || (a = 1), {
            x: l,
            y: a
        }
    }
    let eA = D(0);

    function eT(e) {
        let t = ei(e);
        return eg() && t.visualViewport ? {
            x: t.visualViewport.offsetLeft,
            y: t.visualViewport.offsetTop
        } : eA
    }

    function ej(e, t, r, n) {
        var o;
        void 0 === t && (t = !1), void 0 === r && (r = !1);
        let i = e.getBoundingClientRect(),
            l = eS(e),
            a = D(1);
        t && (n ? es(n) && (a = eP(n)) : a = eP(e));
        let s = (void 0 === (o = r) && (o = !1), n && (!o || n === ei(l)) && o) ? eT(l) : D(0),
            u = (i.left + s.x) / a.x,
            c = (i.top + s.y) / a.y,
            d = i.width / a.x,
            f = i.height / a.y;
        if (l) {
            let e = ei(l),
                t = n && es(n) ? ei(n) : n,
                r = e,
                o = eR(r);
            for (; o && n && t !== r;) {
                let e = eP(o),
                    t = o.getBoundingClientRect(),
                    n = ew(o),
                    i = t.left + (o.clientLeft + parseFloat(n.paddingLeft)) * e.x,
                    l = t.top + (o.clientTop + parseFloat(n.paddingTop)) * e.y;
                u *= e.x, c *= e.y, d *= e.x, f *= e.y, u += i, c += l, o = eR(r = ei(o))
            }
        }
        return G({
            width: d,
            height: f,
            x: u,
            y: c
        })
    }

    function eL(e, t) {
        let r = ex(e).scrollLeft;
        return t ? t.left + r : ej(el(e)).left + r
    }

    function eO(e, t) {
        let r = e.getBoundingClientRect();
        return {
            x: r.left + t.scrollLeft - eL(e, r),
            y: r.top + t.scrollTop
        }
    }

    function eD(e, t, r) {
        var n;
        let o;
        if ("viewport" === t) o = function(e, t) {
            let r = ei(e),
                n = el(e),
                o = r.visualViewport,
                i = n.clientWidth,
                l = n.clientHeight,
                a = 0,
                s = 0;
            if (o) {
                i = o.width, l = o.height;
                let e = eg();
                (!e || e && "fixed" === t) && (a = o.offsetLeft, s = o.offsetTop)
            }
            let u = eL(n);
            if (u <= 0) {
                let e = n.ownerDocument,
                    t = e.body,
                    r = getComputedStyle(t),
                    o = "CSS1Compat" === e.compatMode && parseFloat(r.marginLeft) + parseFloat(r.marginRight) || 0,
                    l = Math.abs(n.clientWidth - t.clientWidth - o);
                l <= 25 && (i -= l)
            } else u <= 25 && (i += u);
            return {
                width: i,
                height: l,
                x: a,
                y: s
            }
        }(e, r);
        else if ("document" === t) {
            let t, r, i, l, a, s, u;
            n = el(e), t = el(n), r = ex(n), i = n.ownerDocument.body, l = j(t.scrollWidth, t.clientWidth, i.scrollWidth, i.clientWidth), a = j(t.scrollHeight, t.clientHeight, i.scrollHeight, i.clientHeight), s = -r.scrollLeft + eL(n), u = -r.scrollTop, "rtl" === ew(i).direction && (s += j(t.clientWidth, i.clientWidth) - l), o = {
                width: l,
                height: a,
                x: s,
                y: u
            }
        } else if (es(t)) {
            let e, n, i, l, a, s;
            n = (e = ej(t, !0, "fixed" === r)).top + t.clientTop, i = e.left + t.clientLeft, l = eu(t) ? eP(t) : D(1), a = t.clientWidth * l.x, s = t.clientHeight * l.y, o = {
                width: a,
                height: s,
                x: i * l.x,
                y: n * l.y
            }
        } else {
            let r = eT(e);
            o = {
                x: t.x - r.x,
                y: t.y - r.y,
                width: t.width,
                height: t.height
            }
        }
        return G(o)
    }

    function eN(e) {
        return "static" === ew(e).position
    }

    function ek(e, t) {
        if (!eu(e) || "fixed" === ew(e).position) return null;
        if (t) return t(e);
        let r = e.offsetParent;
        return el(e) === r && (r = r.ownerDocument.body), r
    }

    function eI(e, t) {
        var r;
        let n = ei(e);
        if (ef(e)) return n;
        if (!eu(e)) {
            let t = eb(e);
            for (; t && !ey(t);) {
                if (es(t) && !eN(t)) return t;
                t = eb(t)
            }
            return n
        }
        let o = ek(e, t);
        for (; o && (r = o, /^(table|td|th)$/.test(eo(r))) && eN(o);) o = ek(o, t);
        return o && ey(o) && eN(o) && !eh(o) ? n : o || function(e) {
            let t = eb(e);
            for (; eu(t) && !ey(t);) {
                if (eh(t)) return t;
                if (ef(t)) break;
                t = eb(t)
            }
            return null
        }(e) || n
    }
    let eM = async function(e) {
        let t = this.getOffsetParent || eI,
            r = this.getDimensions,
            n = await r(e.floating);
        return {
            reference: function(e, t, r) {
                let n = eu(t),
                    o = el(t),
                    i = "fixed" === r,
                    l = ej(e, !0, i, t),
                    a = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    s = D(0);
                if (n || !n && !i)
                    if (("body" !== eo(t) || ed(o)) && (a = ex(t)), n) {
                        let e = ej(t, !0, i, t);
                        s.x = e.x + t.clientLeft, s.y = e.y + t.clientTop
                    } else o && (s.x = eL(o));
                i && !n && o && (s.x = eL(o));
                let u = !o || n || i ? D(0) : eO(o, a);
                return {
                    x: l.left + a.scrollLeft - s.x - u.x,
                    y: l.top + a.scrollTop - s.y - u.y,
                    width: l.width,
                    height: l.height
                }
            }(e.reference, await t(e.floating), e.strategy),
            floating: {
                x: 0,
                y: 0,
                width: n.width,
                height: n.height
            }
        }
    }, eH = {
        convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
            let {
                elements: t,
                rect: r,
                offsetParent: n,
                strategy: o
            } = e, i = "fixed" === o, l = el(n), a = !!t && ef(t.floating);
            if (n === l || a && i) return r;
            let s = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                u = D(1),
                c = D(0),
                d = eu(n);
            if ((d || !d && !i) && (("body" !== eo(n) || ed(l)) && (s = ex(n)), d)) {
                let e = ej(n);
                u = eP(n), c.x = e.x + n.clientLeft, c.y = e.y + n.clientTop
            }
            let f = !l || d || i ? D(0) : eO(l, s);
            return {
                width: r.width * u.x,
                height: r.height * u.y,
                x: r.x * u.x - s.scrollLeft * u.x + c.x + f.x,
                y: r.y * u.y - s.scrollTop * u.y + c.y + f.y
            }
        },
        getDocumentElement: el,
        getClippingRect: function(e) {
            let {
                element: t,
                boundary: r,
                rootBoundary: n,
                strategy: o
            } = e, i = [..."clippingAncestors" === r ? ef(t) ? [] : function(e, t) {
                let r = t.get(e);
                if (r) return r;
                let n = eC(e, [], !1).filter(e => es(e) && "body" !== eo(e)),
                    o = null,
                    i = "fixed" === ew(e).position,
                    l = i ? eb(e) : e;
                for (; es(l) && !ey(l);) {
                    let t = ew(l),
                        r = eh(l);
                    r || "fixed" !== t.position || (o = null), (i ? r || o : !(!r && "static" === t.position && o && ("absolute" === o.position || "fixed" === o.position) || ed(l) && !r && function e(t, r) {
                        let n = eb(t);
                        return !(n === r || !es(n) || ey(n)) && ("fixed" === ew(n).position || e(n, r))
                    }(e, l))) ? o = t : n = n.filter(e => e !== l), l = eb(l)
                }
                return t.set(e, n), n
            }(t, this._c) : [].concat(r), n], l = eD(t, i[0], o), a = l.top, s = l.right, u = l.bottom, c = l.left;
            for (let e = 1; e < i.length; e++) {
                let r = eD(t, i[e], o);
                a = j(r.top, a), s = T(r.right, s), u = T(r.bottom, u), c = j(r.left, c)
            }
            return {
                width: s - c,
                height: u - a,
                x: c,
                y: a
            }
        },
        getOffsetParent: eI,
        getElementRects: eM,
        getClientRects: function(e) {
            return Array.from(e.getClientRects())
        },
        getDimensions: function(e) {
            let {
                width: t,
                height: r
            } = eE(e);
            return {
                width: t,
                height: r
            }
        },
        getScale: eP,
        isElement: es,
        isRTL: function(e) {
            return "rtl" === ew(e).direction
        }
    };

    function eF(e, t) {
        return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
    }

    function e_(e, t, r, n) {
        let o;
        void 0 === n && (n = {});
        let {
            ancestorScroll: i = !0,
            ancestorResize: l = !0,
            elementResize: a = "function" == typeof ResizeObserver,
            layoutShift: s = "function" == typeof IntersectionObserver,
            animationFrame: u = !1
        } = n, c = eS(e), d = i || l ? [...c ? eC(c) : [], ...t ? eC(t) : []] : [];
        d.forEach(e => {
            i && e.addEventListener("scroll", r, {
                passive: !0
            }), l && e.addEventListener("resize", r)
        });
        let f = c && s ? function(e, t) {
                let r, n = null,
                    o = el(e);

                function i() {
                    var e;
                    clearTimeout(r), null == (e = n) || e.disconnect(), n = null
                }
                return ! function l(a, s) {
                    void 0 === a && (a = !1), void 0 === s && (s = 1), i();
                    let u = e.getBoundingClientRect(),
                        {
                            left: c,
                            top: d,
                            width: f,
                            height: p
                        } = u;
                    if (a || t(), !f || !p) return;
                    let v = {
                            rootMargin: -O(d) + "px " + -O(o.clientWidth - (c + f)) + "px " + -O(o.clientHeight - (d + p)) + "px " + -O(c) + "px",
                            threshold: j(0, T(1, s)) || 1
                        },
                        m = !0;

                    function h(t) {
                        let n = t[0].intersectionRatio;
                        if (n !== s) {
                            if (!m) return l();
                            n ? l(!1, n) : r = setTimeout(() => {
                                l(!1, 1e-7)
                            }, 1e3)
                        }
                        1 !== n || eF(u, e.getBoundingClientRect()) || l(), m = !1
                    }
                    try {
                        n = new IntersectionObserver(h, {
                            ...v,
                            root: o.ownerDocument
                        })
                    } catch (e) {
                        n = new IntersectionObserver(h, v)
                    }
                    n.observe(e)
                }(!0), i
            }(c, r) : null,
            p = -1,
            v = null;
        a && (v = new ResizeObserver(e => {
            let [n] = e;
            n && n.target === c && v && t && (v.unobserve(t), cancelAnimationFrame(p), p = requestAnimationFrame(() => {
                var e;
                null == (e = v) || e.observe(t)
            })), r()
        }), c && !u && v.observe(c), t && v.observe(t));
        let m = u ? ej(e) : null;
        return u && function t() {
            let n = ej(e);
            m && !eF(m, n) && r(), m = n, o = requestAnimationFrame(t)
        }(), r(), () => {
            var e;
            d.forEach(e => {
                i && e.removeEventListener("scroll", r), l && e.removeEventListener("resize", r)
            }), null == f || f(), null == (e = v) || e.disconnect(), v = null, u && cancelAnimationFrame(o)
        }
    }
    let eW = function(e) {
            return void 0 === e && (e = 0), {
                name: "offset",
                options: e,
                async fn(t) {
                    var r, n;
                    let {
                        x: o,
                        y: i,
                        placement: l,
                        middlewareData: a
                    } = t, s = await er(t, e);
                    return l === (null == (r = a.offset) ? void 0 : r.placement) && null != (n = a.arrow) && n.alignmentOffset ? {} : {
                        x: o + s.x,
                        y: i + s.y,
                        data: {
                            ...s,
                            placement: l
                        }
                    }
                }
            }
        },
        eB = function(e) {
            return void 0 === e && (e = {}), {
                name: "shift",
                options: e,
                async fn(t) {
                    let {
                        x: r,
                        y: n,
                        placement: o,
                        platform: i
                    } = t, {
                        mainAxis: l = !0,
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
                    } = k(e, t), c = {
                        x: r,
                        y: n
                    }, d = await i.detectOverflow(t, u), f = _(I(o)), p = H(f), v = c[p], m = c[f];
                    if (l) {
                        let e = "y" === p ? "top" : "left",
                            t = "y" === p ? "bottom" : "right",
                            r = v + d[e],
                            n = v - d[t];
                        v = j(r, T(v, n))
                    }
                    if (a) {
                        let e = "y" === f ? "top" : "left",
                            t = "y" === f ? "bottom" : "right",
                            r = m + d[e],
                            n = m - d[t];
                        m = j(r, T(m, n))
                    }
                    let h = s.fn({
                        ...t,
                        [p]: v,
                        [f]: m
                    });
                    return {
                        ...h,
                        data: {
                            x: h.x - r,
                            y: h.y - n,
                            enabled: {
                                [p]: l,
                                [f]: a
                            }
                        }
                    }
                }
            }
        },
        eV = function(e) {
            return void 0 === e && (e = {}), {
                name: "flip",
                options: e,
                async fn(t) {
                    var r, n, o, i, l;
                    let a, s, u, {
                            placement: c,
                            middlewareData: d,
                            rects: f,
                            initialPlacement: p,
                            platform: v,
                            elements: m
                        } = t,
                        {
                            mainAxis: h = !0,
                            crossAxis: g = !0,
                            fallbackPlacements: y,
                            fallbackStrategy: w = "bestFit",
                            fallbackAxisSideDirection: x = "none",
                            flipAlignment: b = !0,
                            ...C
                        } = k(e, t);
                    if (null != (r = d.arrow) && r.alignmentOffset) return {};
                    let R = I(c),
                        E = _(p),
                        S = I(p) === p,
                        P = await (null == v.isRTL ? void 0 : v.isRTL(m.floating)),
                        A = y || (S || !b ? [Y(p)] : (a = Y(p), [B(p), a, B(a)])),
                        T = "none" !== x;
                    !y && T && A.push(...(s = M(p), u = function(e, t, r) {
                        switch (e) {
                            case "top":
                            case "bottom":
                                if (r) return t ? z : V;
                                return t ? V : z;
                            case "left":
                            case "right":
                                return t ? U : K;
                            default:
                                return []
                        }
                    }(I(p), "start" === x, P), s && (u = u.map(e => e + "-" + s), b && (u = u.concat(u.map(B)))), u));
                    let j = [p, ...A],
                        L = await v.detectOverflow(t, C),
                        O = [],
                        D = (null == (n = d.flip) ? void 0 : n.overflows) || [];
                    if (h && O.push(L[R]), g) {
                        let e = W(c, f, P);
                        O.push(L[e[0]], L[e[1]])
                    }
                    if (D = [...D, {
                            placement: c,
                            overflows: O
                        }], !O.every(e => e <= 0)) {
                        let e = ((null == (o = d.flip) ? void 0 : o.index) || 0) + 1,
                            t = j[e];
                        if (t && ("alignment" !== g || E === _(t) || D.every(e => _(e.placement) !== E || e.overflows[0] > 0))) return {
                            data: {
                                index: e,
                                overflows: D
                            },
                            reset: {
                                placement: t
                            }
                        };
                        let r = null == (i = D.filter(e => e.overflows[0] <= 0).sort((e, t) => e.overflows[1] - t.overflows[1])[0]) ? void 0 : i.placement;
                        if (!r) switch (w) {
                            case "bestFit": {
                                let e = null == (l = D.filter(e => {
                                    if (T) {
                                        let t = _(e.placement);
                                        return t === E || "y" === t
                                    }
                                    return !0
                                }).map(e => [e.placement, e.overflows.filter(e => e > 0).reduce((e, t) => e + t, 0)]).sort((e, t) => e[1] - t[1])[0]) ? void 0 : l[0];
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
        ez = function(e) {
            return void 0 === e && (e = {}), {
                name: "size",
                options: e,
                async fn(t) {
                    var r, n;
                    let o, i, {
                            placement: l,
                            rects: a,
                            platform: s,
                            elements: u
                        } = t,
                        {
                            apply: c = () => {},
                            ...d
                        } = k(e, t),
                        f = await s.detectOverflow(t, d),
                        p = I(l),
                        v = M(l),
                        m = "y" === _(l),
                        {
                            width: h,
                            height: g
                        } = a.floating;
                    "top" === p || "bottom" === p ? (o = p, i = v === (await (null == s.isRTL ? void 0 : s.isRTL(u.floating)) ? "start" : "end") ? "left" : "right") : (i = p, o = "end" === v ? "top" : "bottom");
                    let y = g - f.top - f.bottom,
                        w = h - f.left - f.right,
                        x = T(g - f[o], y),
                        b = T(h - f[i], w),
                        C = !t.middlewareData.shift,
                        R = x,
                        E = b;
                    if (null != (r = t.middlewareData.shift) && r.enabled.x && (E = w), null != (n = t.middlewareData.shift) && n.enabled.y && (R = y), C && !v) {
                        let e = j(f.left, 0),
                            t = j(f.right, 0),
                            r = j(f.top, 0),
                            n = j(f.bottom, 0);
                        m ? E = h - 2 * (0 !== e || 0 !== t ? e + t : j(f.left, f.right)) : R = g - 2 * (0 !== r || 0 !== n ? r + n : j(f.top, f.bottom))
                    }
                    await c({
                        ...t,
                        availableWidth: E,
                        availableHeight: R
                    });
                    let S = await s.getDimensions(u.floating);
                    return h !== S.width || g !== S.height ? {
                        reset: {
                            rects: !0
                        }
                    } : {}
                }
            }
        },
        eU = function(e) {
            return void 0 === e && (e = {}), {
                name: "hide",
                options: e,
                async fn(t) {
                    let {
                        rects: r,
                        platform: n
                    } = t, {
                        strategy: o = "referenceHidden",
                        ...i
                    } = k(e, t);
                    switch (o) {
                        case "referenceHidden": {
                            let e = J(await n.detectOverflow(t, {
                                ...i,
                                elementContext: "reference"
                            }), r.reference);
                            return {
                                data: {
                                    referenceHiddenOffsets: e,
                                    referenceHidden: Q(e)
                                }
                            }
                        }
                        case "escaped": {
                            let e = J(await n.detectOverflow(t, {
                                ...i,
                                altBoundary: !0
                            }), r.floating);
                            return {
                                data: {
                                    escapedOffsets: e,
                                    escaped: Q(e)
                                }
                            }
                        }
                        default:
                            return {}
                    }
                }
            }
        },
        eK = e => ({
            name: "arrow",
            options: e,
            async fn(t) {
                let {
                    x: r,
                    y: n,
                    placement: o,
                    rects: i,
                    platform: l,
                    elements: a,
                    middlewareData: s
                } = t, {
                    element: u,
                    padding: c = 0
                } = k(e, t) || {};
                if (null == u) return {};
                let d = X(c),
                    f = {
                        x: r,
                        y: n
                    },
                    p = H(_(o)),
                    v = F(p),
                    m = await l.getDimensions(u),
                    h = "y" === p,
                    g = h ? "clientHeight" : "clientWidth",
                    y = i.reference[v] + i.reference[p] - f[p] - i.floating[v],
                    w = f[p] - i.reference[p],
                    x = await (null == l.getOffsetParent ? void 0 : l.getOffsetParent(u)),
                    b = x ? x[g] : 0;
                b && await (null == l.isElement ? void 0 : l.isElement(x)) || (b = a.floating[g] || i.floating[v]);
                let C = b / 2 - m[v] / 2 - 1,
                    R = T(d[h ? "top" : "left"], C),
                    E = T(d[h ? "bottom" : "right"], C),
                    S = b - m[v] - E,
                    P = b / 2 - m[v] / 2 + (y / 2 - w / 2),
                    A = j(R, T(P, S)),
                    L = !s.arrow && null != M(o) && P !== A && i.reference[v] / 2 - (P < R ? R : E) - m[v] / 2 < 0,
                    O = L ? P < R ? P - R : P - S : 0;
                return {
                    [p]: f[p] + O,
                    data: {
                        [p]: A,
                        centerOffset: P - A - O,
                        ...L && {
                            alignmentOffset: O
                        }
                    },
                    reset: L
                }
            }
        }),
        eY = function(e) {
            return void 0 === e && (e = {}), {
                options: e,
                fn(t) {
                    let {
                        x: r,
                        y: n,
                        placement: o,
                        rects: i,
                        middlewareData: l
                    } = t, {
                        offset: a = 0,
                        mainAxis: s = !0,
                        crossAxis: u = !0
                    } = k(e, t), c = {
                        x: r,
                        y: n
                    }, d = _(o), f = H(d), p = c[f], v = c[d], m = k(a, t), h = "number" == typeof m ? {
                        mainAxis: m,
                        crossAxis: 0
                    } : {
                        mainAxis: 0,
                        crossAxis: 0,
                        ...m
                    };
                    if (s) {
                        let e = "y" === f ? "height" : "width",
                            t = i.reference[f] - i.floating[e] + h.mainAxis,
                            r = i.reference[f] + i.reference[e] - h.mainAxis;
                        p < t ? p = t : p > r && (p = r)
                    }
                    if (u) {
                        var g, y;
                        let e = "y" === f ? "width" : "height",
                            t = et.has(I(o)),
                            r = i.reference[d] - i.floating[e] + (t && (null == (g = l.offset) ? void 0 : g[d]) || 0) + (t ? 0 : h.crossAxis),
                            n = i.reference[d] + i.reference[e] + (t ? 0 : (null == (y = l.offset) ? void 0 : y[d]) || 0) - (t ? h.crossAxis : 0);
                        v < r ? v = r : v > n && (v = n)
                    }
                    return {
                        [f]: p,
                        [d]: v
                    }
                }
            }
        },
        eX = (e, t, r) => {
            let n = new Map,
                o = {
                    platform: eH,
                    ...r
                },
                i = {
                    ...o.platform,
                    _c: n
                };
            return Z(e, t, {
                ...o,
                platform: i
            })
        };
    e.s(["arrow", 0, eK, "autoPlacement", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "autoPlacement",
            options: e,
            async fn(t) {
                var r, n, o, i;
                let {
                    rects: l,
                    middlewareData: a,
                    placement: s,
                    platform: u,
                    elements: c
                } = t, {
                    crossAxis: d = !1,
                    alignment: f,
                    allowedPlacements: p = A,
                    autoAlignment: v = !0,
                    ...m
                } = k(e, t), h = void 0 !== f || p === A ? ((i = f || null) ? [...p.filter(e => M(e) === i), ...p.filter(e => M(e) !== i)] : p.filter(e => I(e) === e)).filter(e => !i || M(e) === i || !!v && B(e) !== e) : p, g = await u.detectOverflow(t, m), y = (null == (r = a.autoPlacement) ? void 0 : r.index) || 0, w = h[y];
                if (null == w) return {};
                let x = W(w, l, await (null == u.isRTL ? void 0 : u.isRTL(c.floating)));
                if (s !== w) return {
                    reset: {
                        placement: h[0]
                    }
                };
                let b = [g[I(w)], g[x[0]], g[x[1]]],
                    C = [...(null == (n = a.autoPlacement) ? void 0 : n.overflows) || [], {
                        placement: w,
                        overflows: b
                    }],
                    R = h[y + 1];
                if (R) return {
                    data: {
                        index: y + 1,
                        overflows: C
                    },
                    reset: {
                        placement: R
                    }
                };
                let E = C.map(e => {
                        let t = M(e.placement);
                        return [e.placement, t && d ? e.overflows.slice(0, 2).reduce((e, t) => e + t, 0) : e.overflows[0], e.overflows]
                    }).sort((e, t) => e[1] - t[1]),
                    S = (null == (o = E.filter(e => e[2].slice(0, M(e[0]) ? 2 : 3).every(e => e <= 0))[0]) ? void 0 : o[0]) || E[0][0];
                return S !== s ? {
                    data: {
                        index: y + 1,
                        overflows: C
                    },
                    reset: {
                        placement: S
                    }
                } : {}
            }
        }
    }, "autoUpdate", 0, e_, "computePosition", 0, eX, "flip", 0, eV, "hide", 0, eU, "inline", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "inline",
            options: e,
            async fn(t) {
                let {
                    placement: r,
                    elements: n,
                    rects: o,
                    platform: i,
                    strategy: l
                } = t, {
                    padding: a = 2,
                    x: s,
                    y: u
                } = k(e, t), c = Array.from(await (null == i.getClientRects ? void 0 : i.getClientRects(n.reference)) || []), d = function(e) {
                    let t = e.slice().sort((e, t) => e.y - t.y),
                        r = [],
                        n = null;
                    for (let e = 0; e < t.length; e++) {
                        let o = t[e];
                        !n || o.y - n.y > n.height / 2 ? r.push([o]) : r[r.length - 1].push(o), n = o
                    }
                    return r.map(e => G(ee(e)))
                }(c), f = G(ee(c)), p = X(a), v = await i.getElementRects({
                    reference: {
                        getBoundingClientRect: function() {
                            if (2 === d.length && d[0].left > d[1].right && null != s && null != u) return d.find(e => s > e.left - p.left && s < e.right + p.right && u > e.top - p.top && u < e.bottom + p.bottom) || f;
                            if (d.length >= 2) {
                                if ("y" === _(r)) {
                                    let e = d[0],
                                        t = d[d.length - 1],
                                        n = "top" === I(r),
                                        o = e.top,
                                        i = t.bottom,
                                        l = n ? e.left : t.left,
                                        a = n ? e.right : t.right;
                                    return {
                                        top: o,
                                        bottom: i,
                                        left: l,
                                        right: a,
                                        width: a - l,
                                        height: i - o,
                                        x: l,
                                        y: o
                                    }
                                }
                                let e = "left" === I(r),
                                    t = j(...d.map(e => e.right)),
                                    n = T(...d.map(e => e.left)),
                                    o = d.filter(r => e ? r.left === n : r.right === t),
                                    i = o[0].top,
                                    l = o[o.length - 1].bottom;
                                return {
                                    top: i,
                                    bottom: l,
                                    left: n,
                                    right: t,
                                    width: t - n,
                                    height: l - i,
                                    x: n,
                                    y: i
                                }
                            }
                            return f
                        }
                    },
                    floating: n.floating,
                    strategy: l
                });
                return o.reference.x !== v.reference.x || o.reference.y !== v.reference.y || o.reference.width !== v.reference.width || o.reference.height !== v.reference.height ? {
                    reset: {
                        rects: v
                    }
                } : {}
            }
        }
    }, "limitShift", 0, eY, "offset", 0, eW, "shift", 0, eB, "size", 0, ez], 992486);
    var eG = "u" > typeof document ? o.useLayoutEffect : function() {};

    function eq(e, t) {
        let r, n, o;
        if (e === t) return !0;
        if (typeof e != typeof t) return !1;
        if ("function" == typeof e && e.toString() === t.toString()) return !0;
        if (e && t && "object" == typeof e) {
            if (Array.isArray(e)) {
                if ((r = e.length) !== t.length) return !1;
                for (n = r; 0 != n--;)
                    if (!eq(e[n], t[n])) return !1;
                return !0
            }
            if ((r = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (n = r; 0 != n--;)
                if (!({}).hasOwnProperty.call(t, o[n])) return !1;
            for (n = r; 0 != n--;) {
                let r = o[n];
                if (("_owner" !== r || !e.$$typeof) && !eq(e[r], t[r])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function e$(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function eZ(e, t) {
        let r = e$(e);
        return Math.round(t * r) / r
    }

    function eJ(e) {
        let t = o.useRef(e);
        return eG(() => {
            t.current = e
        }), t
    }

    function eQ(e) {
        void 0 === e && (e = {});
        let {
            placement: t = "bottom",
            strategy: r = "absolute",
            middleware: n = [],
            platform: i,
            elements: {
                reference: l,
                floating: a
            } = {},
            transform: s = !0,
            whileElementsMounted: u,
            open: c
        } = e, [f, p] = o.useState({
            x: 0,
            y: 0,
            strategy: r,
            placement: t,
            middlewareData: {},
            isPositioned: !1
        }), [v, m] = o.useState(n);
        eq(v, n) || m(n);
        let [h, g] = o.useState(null), [y, w] = o.useState(null), x = o.useCallback(e => {
            e !== E.current && (E.current = e, g(e))
        }, []), b = o.useCallback(e => {
            e !== S.current && (S.current = e, w(e))
        }, []), C = l || h, R = a || y, E = o.useRef(null), S = o.useRef(null), P = o.useRef(f), A = null != u, T = eJ(u), j = eJ(i), L = eJ(c), O = o.useCallback(() => {
            if (!E.current || !S.current) return;
            let e = {
                placement: t,
                strategy: r,
                middleware: v
            };
            j.current && (e.platform = j.current), eX(E.current, S.current, e).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== L.current
                };
                D.current && !eq(P.current, t) && (P.current = t, d.flushSync(() => {
                    p(t)
                }))
            })
        }, [v, t, r, j, L]);
        eG(() => {
            !1 === c && P.current.isPositioned && (P.current.isPositioned = !1, p(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [c]);
        let D = o.useRef(!1);
        eG(() => (D.current = !0, () => {
            D.current = !1
        }), []), eG(() => {
            if (C && (E.current = C), R && (S.current = R), C && R) {
                if (T.current) return T.current(C, R, O);
                O()
            }
        }, [C, R, O, T, A]);
        let N = o.useMemo(() => ({
                reference: E,
                floating: S,
                setReference: x,
                setFloating: b
            }), [x, b]),
            k = o.useMemo(() => ({
                reference: C,
                floating: R
            }), [C, R]),
            I = o.useMemo(() => {
                let e = {
                    position: r,
                    left: 0,
                    top: 0
                };
                if (!k.floating) return e;
                let t = eZ(k.floating, f.x),
                    n = eZ(k.floating, f.y);
                return s ? {
                    ...e,
                    transform: "translate(" + t + "px, " + n + "px)",
                    ...e$(k.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: r,
                    left: t,
                    top: n
                }
            }, [r, s, k.floating, f.x, f.y]);
        return o.useMemo(() => ({
            ...f,
            update: O,
            refs: N,
            elements: k,
            floatingStyles: I
        }), [f, O, N, k, I])
    }
    let e0 = (e, t) => {
            let r = eW(e);
            return {
                name: r.name,
                fn: r.fn,
                options: [e, t]
            }
        },
        e1 = (e, t) => {
            let r = eB(e);
            return {
                name: r.name,
                fn: r.fn,
                options: [e, t]
            }
        },
        e2 = (e, t) => ({
            fn: eY(e).fn,
            options: [e, t]
        }),
        e6 = (e, t) => {
            let r = eV(e);
            return {
                name: r.name,
                fn: r.fn,
                options: [e, t]
            }
        },
        e9 = (e, t) => {
            let r = ez(e);
            return {
                name: r.name,
                fn: r.fn,
                options: [e, t]
            }
        },
        e8 = (e, t) => {
            let r = eU(e);
            return {
                name: r.name,
                fn: r.fn,
                options: [e, t]
            }
        },
        e4 = (e, t) => {
            let r = {
                name: "arrow",
                options: e,
                fn(t) {
                    let {
                        element: r,
                        padding: n
                    } = "function" == typeof e ? e(t) : e;
                    return r && ({}).hasOwnProperty.call(r, "current") ? null != r.current ? eK({
                        element: r.current,
                        padding: n
                    }).fn(t) : {} : r ? eK({
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
    e.s(["arrow", 0, e4, "flip", 0, e6, "hide", 0, e8, "limitShift", 0, e2, "offset", 0, e0, "shift", 0, e1, "size", 0, e9, "useFloating", 0, eQ], 297452);
    var e5 = o.forwardRef((e, t) => {
        let {
            children: r,
            width: n = 10,
            height: o = 5,
            ...i
        } = e;
        return (0, u.jsx)(h.svg, {
            ...i,
            ref: t,
            width: n,
            height: o,
            viewBox: "0 0 30 10",
            preserveAspectRatio: "none",
            children: e.asChild ? r : (0, u.jsx)("polygon", {
                points: "0,0 30,0 15,10"
            })
        })
    });
    e5.displayName = "Arrow";
    var e7 = "Popper",
        [e3, te] = c(e7),
        [tt, tr] = e3(e7),
        tn = e => {
            let {
                __scopePopper: t,
                children: r
            } = e, [n, i] = o.useState(null);
            return (0, u.jsx)(tt, {
                scope: t,
                anchor: n,
                onAnchorChange: i,
                children: r
            })
        };
    tn.displayName = e7;
    var to = "PopperAnchor",
        ti = o.forwardRef((e, t) => {
            let {
                __scopePopper: r,
                virtualRef: n,
                ...i
            } = e, l = tr(to, r), a = o.useRef(null), c = s(t, a);
            return o.useEffect(() => {
                l.onAnchorChange((null == n ? void 0 : n.current) || a.current)
            }), n ? null : (0, u.jsx)(h.div, {
                ...i,
                ref: c
            })
        });
    ti.displayName = to;
    var tl = "PopperContent",
        [ta, ts] = e3(tl),
        tu = o.forwardRef((e, t) => {
            var r, n, i, l, a, c, d, f;
            let {
                __scopePopper: p,
                side: v = "bottom",
                sideOffset: m = 0,
                align: y = "center",
                alignOffset: w = 0,
                arrowPadding: x = 0,
                avoidCollisions: b = !0,
                collisionBoundary: C = [],
                collisionPadding: E = 0,
                sticky: S = "partial",
                hideWhenDetached: P = !1,
                updatePositionStrategy: A = "optimized",
                onPlaced: T,
                ...j
            } = e, L = tr(tl, p), [O, D] = o.useState(null), N = s(t, e => D(e)), [k, I] = o.useState(null), M = function(e) {
                let [t, r] = o.useState(void 0);
                return R(() => {
                    if (e) {
                        r({
                            width: e.offsetWidth,
                            height: e.offsetHeight
                        });
                        let t = new ResizeObserver(t => {
                            let n, o;
                            if (!Array.isArray(t) || !t.length) return;
                            let i = t[0];
                            if ("borderBoxSize" in i) {
                                let e = i.borderBoxSize,
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
            }(k), H = null != (r = null == M ? void 0 : M.width) ? r : 0, F = null != (n = null == M ? void 0 : M.height) ? n : 0, _ = "number" == typeof E ? E : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...E
            }, W = Array.isArray(C) ? C : [C], B = W.length > 0, V = {
                padding: _,
                boundary: W.filter(tp),
                altBoundary: B
            }, {
                refs: z,
                floatingStyles: U,
                placement: K,
                isPositioned: Y,
                middlewareData: X
            } = eQ({
                strategy: "fixed",
                placement: v + ("center" !== y ? "-" + y : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return e_(...t, {
                        animationFrame: "always" === A
                    })
                },
                elements: {
                    reference: L.anchor
                },
                middleware: [e0({
                    mainAxis: m + F,
                    alignmentAxis: w
                }), b && e1({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === S ? e2() : void 0,
                    ...V
                }), b && e6({
                    ...V
                }), e9({
                    ...V,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: n,
                            availableHeight: o
                        } = e, {
                            width: i,
                            height: l
                        } = r.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(n, "px")), a.setProperty("--radix-popper-available-height", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(i, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                    }
                }), k && e4({
                    element: k,
                    padding: x
                }), tv({
                    arrowWidth: H,
                    arrowHeight: F
                }), P && e8({
                    strategy: "referenceHidden",
                    ...V
                })]
            }), [G, q] = tm(K), $ = g(T);
            R(() => {
                Y && (null == $ || $())
            }, [Y, $]);
            let Z = null == (i = X.arrow) ? void 0 : i.x,
                J = null == (l = X.arrow) ? void 0 : l.y,
                Q = (null == (a = X.arrow) ? void 0 : a.centerOffset) !== 0,
                [ee, et] = o.useState();
            return R(() => {
                O && et(window.getComputedStyle(O).zIndex)
            }, [O]), (0, u.jsx)("div", {
                ref: z.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...U,
                    transform: Y ? U.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: ee,
                    "--radix-popper-transform-origin": [null == (c = X.transformOrigin) ? void 0 : c.x, null == (d = X.transformOrigin) ? void 0 : d.y].join(" "),
                    ...(null == (f = X.hide) ? void 0 : f.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, u.jsx)(ta, {
                    scope: p,
                    placedSide: G,
                    onArrowChange: I,
                    arrowX: Z,
                    arrowY: J,
                    shouldHideArrow: Q,
                    children: (0, u.jsx)(h.div, {
                        "data-side": G,
                        "data-align": q,
                        ...j,
                        ref: N,
                        style: {
                            ...j.style,
                            animation: Y ? void 0 : "none"
                        }
                    })
                })
            })
        });
    tu.displayName = tl;
    var tc = "PopperArrow",
        td = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        tf = o.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, o = ts(tc, r), i = td[o.placedSide];
            return (0, u.jsx)("span", {
                ref: o.onArrowChange,
                style: {
                    position: "absolute",
                    left: o.arrowX,
                    top: o.arrowY,
                    [i]: 0,
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
                children: (0, u.jsx)(e5, {
                    ...n,
                    ref: t,
                    style: {
                        ...n.style,
                        display: "block"
                    }
                })
            })
        });

    function tp(e) {
        return null !== e
    }
    tf.displayName = tc;
    var tv = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, n, o, i, l;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, v] = tm(a), m = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [v], h = (null != (r = null == (i = u.arrow) ? void 0 : i.x) ? r : 0) + d / 2, g = (null != (n = null == (l = u.arrow) ? void 0 : l.y) ? n : 0) + f / 2, y = "", w = "";
            return "bottom" === p ? (y = c ? m : "".concat(h, "px"), w = "".concat(-f, "px")) : "top" === p ? (y = c ? m : "".concat(h, "px"), w = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), w = c ? m : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), w = c ? m : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: w
                }
            }
        }
    });

    function tm(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    var th = o.forwardRef((e, t) => {
        var r, n;
        let {
            container: i,
            ...l
        } = e, [a, s] = o.useState(!1);
        R(() => s(!0), []);
        let c = i || a && (null == (n = globalThis) || null == (r = n.document) ? void 0 : r.body);
        return c ? d.default.createPortal((0, u.jsx)(h.div, {
            ...l,
            ref: t
        }), c) : null
    });
    th.displayName = "Portal";
    var tg = e => {
        var t, r, n;
        let i, l, {
                present: a,
                children: u
            } = e,
            c = function(e) {
                var t, r;
                let [n, i] = o.useState(), l = o.useRef({}), a = o.useRef(e), s = o.useRef("none"), [u, c] = (t = e ? "mounted" : "unmounted", r = {
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
                }, o.useReducer((e, t) => {
                    let n = r[e][t];
                    return null != n ? n : e
                }, t));
                return o.useEffect(() => {
                    let e = ty(l.current);
                    s.current = "mounted" === u ? e : "none"
                }, [u]), R(() => {
                    let t = l.current,
                        r = a.current;
                    if (r !== e) {
                        let n = s.current,
                            o = ty(t);
                        e ? c("MOUNT") : "none" === o || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : r && n !== o ? c("ANIMATION_OUT") : c("UNMOUNT"), a.current = e
                    }
                }, [e, c]), R(() => {
                    if (n) {
                        var e;
                        let t, r = null != (e = n.ownerDocument.defaultView) ? e : window,
                            o = e => {
                                let o = ty(l.current).includes(e.animationName);
                                if (e.target === n && o && (c("ANIMATION_END"), !a.current)) {
                                    let e = n.style.animationFillMode;
                                    n.style.animationFillMode = "forwards", t = r.setTimeout(() => {
                                        "forwards" === n.style.animationFillMode && (n.style.animationFillMode = e)
                                    })
                                }
                            },
                            i = e => {
                                e.target === n && (s.current = ty(l.current))
                            };
                        return n.addEventListener("animationstart", i), n.addEventListener("animationcancel", o), n.addEventListener("animationend", o), () => {
                            r.clearTimeout(t), n.removeEventListener("animationstart", i), n.removeEventListener("animationcancel", o), n.removeEventListener("animationend", o)
                        }
                    }
                    c("ANIMATION_END")
                }, [n, c]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(u),
                    ref: o.useCallback(e => {
                        e && (l.current = getComputedStyle(e)), i(e)
                    }, [])
                }
            }(a),
            d = "function" == typeof u ? u({
                present: c.isPresent
            }) : o.Children.only(u),
            f = s(c.ref, (l = (i = null == (r = Object.getOwnPropertyDescriptor((t = d).props, "ref")) ? void 0 : r.get) && "isReactWarning" in i && i.isReactWarning) ? t.ref : (l = (i = null == (n = Object.getOwnPropertyDescriptor(t, "ref")) ? void 0 : n.get) && "isReactWarning" in i && i.isReactWarning) ? t.props.ref : t.props.ref || t.ref);
        return "function" == typeof u || c.isPresent ? o.cloneElement(d, {
            ref: f
        }) : null
    };

    function ty(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    tg.displayName = "Presence";
    var tw = o.forwardRef((e, t) => (0, u.jsx)(h.span, {
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
    tw.displayName = "VisuallyHidden";
    var [tx, tb] = c("Tooltip", [te]), tC = te(), tR = "TooltipProvider", tE = "tooltip.open", [tS, tP] = tx(tR), tA = e => {
        let {
            __scopeTooltip: t,
            delayDuration: r = 700,
            skipDelayDuration: n = 300,
            disableHoverableContent: i = !1,
            children: l
        } = e, [a, s] = o.useState(!0), c = o.useRef(!1), d = o.useRef(0);
        return o.useEffect(() => {
            let e = d.current;
            return () => window.clearTimeout(e)
        }, []), (0, u.jsx)(tS, {
            scope: t,
            isOpenDelayed: a,
            delayDuration: r,
            onOpen: o.useCallback(() => {
                window.clearTimeout(d.current), s(!1)
            }, []),
            onClose: o.useCallback(() => {
                window.clearTimeout(d.current), d.current = window.setTimeout(() => s(!0), n)
            }, [n]),
            isPointerInTransitRef: c,
            onPointerInTransitChange: o.useCallback(e => {
                c.current = e
            }, []),
            disableHoverableContent: i,
            children: l
        })
    };
    tA.displayName = tR;
    var tT = "Tooltip",
        [tj, tL] = tx(tT),
        tO = e => {
            let {
                __scopeTooltip: t,
                children: r,
                open: n,
                defaultOpen: i = !1,
                onOpenChange: l,
                disableHoverableContent: a,
                delayDuration: s
            } = e, c = tP(tT, e.__scopeTooltip), d = tC(t), [f, p] = o.useState(null), v = function() {
                let [e, t] = o.useState(E());
                return R(() => {
                    t(e => null != e ? e : String(S++))
                }, [void 0]), e ? "radix-".concat(e) : ""
            }(), m = o.useRef(0), h = null != a ? a : c.disableHoverableContent, y = null != s ? s : c.delayDuration, w = o.useRef(!1), [x = !1, b] = function(e) {
                let {
                    prop: t,
                    defaultProp: r,
                    onChange: n = () => {}
                } = e, [i, l] = function(e) {
                    let {
                        defaultProp: t,
                        onChange: r
                    } = e, n = o.useState(t), [i] = n, l = o.useRef(i), a = g(r);
                    return o.useEffect(() => {
                        l.current !== i && (a(i), l.current = i)
                    }, [i, l, a]), n
                }({
                    defaultProp: r,
                    onChange: n
                }), a = void 0 !== t, s = a ? t : i, u = g(n);
                return [s, o.useCallback(e => {
                    if (a) {
                        let r = "function" == typeof e ? e(t) : e;
                        r !== t && u(r)
                    } else l(e)
                }, [a, t, l, u])]
            }({
                prop: n,
                defaultProp: i,
                onChange: e => {
                    e ? (c.onOpen(), document.dispatchEvent(new CustomEvent(tE))) : c.onClose(), null == l || l(e)
                }
            }), C = o.useMemo(() => x ? w.current ? "delayed-open" : "instant-open" : "closed", [x]), P = o.useCallback(() => {
                window.clearTimeout(m.current), m.current = 0, w.current = !1, b(!0)
            }, [b]), A = o.useCallback(() => {
                window.clearTimeout(m.current), m.current = 0, b(!1)
            }, [b]), T = o.useCallback(() => {
                window.clearTimeout(m.current), m.current = window.setTimeout(() => {
                    w.current = !0, b(!0), m.current = 0
                }, y)
            }, [y, b]);
            return o.useEffect(() => () => {
                m.current && (window.clearTimeout(m.current), m.current = 0)
            }, []), (0, u.jsx)(tn, {
                ...d,
                children: (0, u.jsx)(tj, {
                    scope: t,
                    contentId: v,
                    open: x,
                    stateAttribute: C,
                    trigger: f,
                    onTriggerChange: p,
                    onTriggerEnter: o.useCallback(() => {
                        c.isOpenDelayed ? T() : P()
                    }, [c.isOpenDelayed, T, P]),
                    onTriggerLeave: o.useCallback(() => {
                        h ? A() : (window.clearTimeout(m.current), m.current = 0)
                    }, [A, h]),
                    onOpen: P,
                    onClose: A,
                    disableHoverableContent: h,
                    children: r
                })
            })
        };
    tO.displayName = tT;
    var tD = "TooltipTrigger",
        tN = o.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                ...n
            } = e, l = tL(tD, r), a = tP(tD, r), c = tC(r), d = s(t, o.useRef(null), l.onTriggerChange), f = o.useRef(!1), p = o.useRef(!1), v = o.useCallback(() => f.current = !1, []);
            return o.useEffect(() => () => document.removeEventListener("pointerup", v), [v]), (0, u.jsx)(ti, {
                asChild: !0,
                ...c,
                children: (0, u.jsx)(h.button, {
                    "aria-describedby": l.open ? l.contentId : void 0,
                    "data-state": l.stateAttribute,
                    ...n,
                    ref: d,
                    onPointerMove: i(e.onPointerMove, e => {
                        "touch" !== e.pointerType && (p.current || a.isPointerInTransitRef.current || (l.onTriggerEnter(), p.current = !0))
                    }),
                    onPointerLeave: i(e.onPointerLeave, () => {
                        l.onTriggerLeave(), p.current = !1
                    }),
                    onPointerDown: i(e.onPointerDown, () => {
                        f.current = !0, document.addEventListener("pointerup", v, {
                            once: !0
                        })
                    }),
                    onFocus: i(e.onFocus, () => {
                        f.current || l.onOpen()
                    }),
                    onBlur: i(e.onBlur, l.onClose),
                    onClick: i(e.onClick, l.onClose)
                })
            })
        });
    tN.displayName = tD;
    var tk = "TooltipPortal",
        [tI, tM] = tx(tk, {
            forceMount: void 0
        }),
        tH = e => {
            let {
                __scopeTooltip: t,
                forceMount: r,
                children: n,
                container: o
            } = e, i = tL(tk, t);
            return (0, u.jsx)(tI, {
                scope: t,
                forceMount: r,
                children: (0, u.jsx)(tg, {
                    present: r || i.open,
                    children: (0, u.jsx)(th, {
                        asChild: !0,
                        container: o,
                        children: n
                    })
                })
            })
        };
    tH.displayName = tk;
    var tF = "TooltipContent",
        t_ = o.forwardRef((e, t) => {
            let r = tM(tF, e.__scopeTooltip),
                {
                    forceMount: n = r.forceMount,
                    side: o = "top",
                    ...i
                } = e,
                l = tL(tF, e.__scopeTooltip);
            return (0, u.jsx)(tg, {
                present: n || l.open,
                children: l.disableHoverableContent ? (0, u.jsx)(tz, {
                    side: o,
                    ...i,
                    ref: t
                }) : (0, u.jsx)(tW, {
                    side: o,
                    ...i,
                    ref: t
                })
            })
        }),
        tW = o.forwardRef((e, t) => {
            let r = tL(tF, e.__scopeTooltip),
                n = tP(tF, e.__scopeTooltip),
                i = o.useRef(null),
                l = s(t, i),
                [a, c] = o.useState(null),
                {
                    trigger: d,
                    onClose: f
                } = r,
                p = i.current,
                {
                    onPointerInTransitChange: v
                } = n,
                m = o.useCallback(() => {
                    c(null), v(!1)
                }, [v]),
                h = o.useCallback((e, t) => {
                    let r, n = e.currentTarget,
                        o = {
                            x: e.clientX,
                            y: e.clientY
                        },
                        i = function(e, t) {
                            let r = Math.abs(t.top - e.y),
                                n = Math.abs(t.bottom - e.y),
                                o = Math.abs(t.right - e.x),
                                i = Math.abs(t.left - e.x);
                            switch (Math.min(r, n, o, i)) {
                                case i:
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
                    c(((r = [... function(e, t) {
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
                    }(o, i), ... function(e) {
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
                    }(r))), v(!0)
                }, [v]);
            return o.useEffect(() => () => m(), [m]), o.useEffect(() => {
                if (d && p) {
                    let e = e => h(e, p),
                        t = e => h(e, d);
                    return d.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t), () => {
                        d.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                    }
                }
            }, [d, p, h, m]), o.useEffect(() => {
                if (a) {
                    let e = e => {
                        let t = e.target,
                            r = {
                                x: e.clientX,
                                y: e.clientY
                            },
                            n = (null == d ? void 0 : d.contains(t)) || (null == p ? void 0 : p.contains(t)),
                            o = ! function(e, t) {
                                let {
                                    x: r,
                                    y: n
                                } = e, o = !1;
                                for (let e = 0, i = t.length - 1; e < t.length; i = e++) {
                                    let l = t[e].x,
                                        a = t[e].y,
                                        s = t[i].x,
                                        u = t[i].y;
                                    a > n != u > n && r < (s - l) * (n - a) / (u - a) + l && (o = !o)
                                }
                                return o
                            }(r, a);
                        n ? m() : o && (m(), f())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [d, p, a, f, m]), (0, u.jsx)(tz, {
                ...e,
                ref: l
            })
        }),
        [tB, tV] = tx(tT, {
            isInside: !1
        }),
        tz = o.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                children: n,
                "aria-label": i,
                onEscapeKeyDown: l,
                onPointerDownOutside: a,
                ...s
            } = e, c = tL(tF, r), d = tC(r), {
                onClose: f
            } = c;
            return o.useEffect(() => (document.addEventListener(tE, f), () => document.removeEventListener(tE, f)), [f]), o.useEffect(() => {
                if (c.trigger) {
                    let e = e => {
                        let t = e.target;
                        (null == t ? void 0 : t.contains(c.trigger)) && f()
                    };
                    return window.addEventListener("scroll", e, {
                        capture: !0
                    }), () => window.removeEventListener("scroll", e, {
                        capture: !0
                    })
                }
            }, [c.trigger, f]), (0, u.jsx)(x, {
                asChild: !0,
                disableOutsidePointerEvents: !1,
                onEscapeKeyDown: l,
                onPointerDownOutside: a,
                onFocusOutside: e => e.preventDefault(),
                onDismiss: f,
                children: (0, u.jsxs)(tu, {
                    "data-state": c.stateAttribute,
                    ...d,
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
                    children: [(0, u.jsx)(v, {
                        children: n
                    }), (0, u.jsx)(tB, {
                        scope: r,
                        isInside: !0,
                        children: (0, u.jsx)(tw, {
                            id: c.contentId,
                            role: "tooltip",
                            children: i || n
                        })
                    })]
                })
            })
        });
    t_.displayName = tF;
    var tU = "TooltipArrow",
        tK = o.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                ...n
            } = e, o = tC(r);
            return tV(tU, r).isInside ? null : (0, u.jsx)(tf, {
                ...o,
                ...n,
                ref: t
            })
        });
    tK.displayName = tU, e.s(["Arrow", 0, tK, "Content", 0, t_, "Portal", 0, tH, "Provider", 0, tA, "Root", 0, tO, "Trigger", 0, tN], 989665)
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
            onChange: i = () => {},
            caller: l
        } = e, [a, s, u] = function(e) {
            let {
                defaultProp: r,
                onChange: o
            } = e, [i, l] = t.useState(r), a = t.useRef(i), s = t.useRef(o);
            return n(() => {
                s.current = o
            }, [o]), t.useEffect(() => {
                if (a.current !== i) {
                    var e;
                    null == (e = s.current) || e.call(s, i), a.current = i
                }
            }, [i, a]), [i, l, s]
        }({
            defaultProp: o,
            onChange: i
        }), c = void 0 !== r, d = c ? r : a;
        {
            let e = t.useRef(void 0 !== r);
            t.useEffect(() => {
                let t = e.current;
                if (t !== c) {
                    let e = c ? "controlled" : "uncontrolled";
                    console.warn("".concat(l, " is changing from ").concat(t ? "controlled" : "uncontrolled", " to ").concat(e, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                }
                e.current = c
            }, [c, l])
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
                    let i = t[0];
                    if ("borderBoxSize" in i) {
                        let e = i.borderBoxSize,
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
}]);

//# debugId=d8d8d2f5-e3c4-e8da-3839-7d24b00d53b5
//# sourceMappingURL=0tznyd_lb4o9u.js.map
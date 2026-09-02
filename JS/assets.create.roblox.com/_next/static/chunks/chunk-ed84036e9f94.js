;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1407cfde-a13b-d4ec-3ae1-bf58f348cfc7")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 305607, e => {
    "use strict";
    e.s(["clamp", 0, function(e, t) {
        let [n, r] = t;
        return Math.min(r, Math.max(n, e))
    }])
}, 174617, e => {
    "use strict";
    "u" > typeof window && window.document && window.document.createElement, e.s(["composeEventHandlers", 0, function(e, t) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (null == e || e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }])
}, 742187, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(594278),
        r = e.i(221628),
        o = t.forwardRef((e, t) => {
            let {
                children: o,
                width: l = 10,
                height: i = 5,
                ...a
            } = e;
            return (0, r.jsx)(n.Primitive.svg, {
                ...a,
                ref: t,
                width: l,
                height: i,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? o : (0, r.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    o.displayName = "Arrow", e.s(["Root", 0, o])
}, 539206, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(608652),
        r = e.i(78892),
        o = e.i(699704),
        l = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let i = e + "CollectionProvider",
            [a, s] = (0, n.createContextScope)(i),
            [u, c] = a(i, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: n,
                    children: r
                } = e, o = t.default.useRef(null), i = t.default.useRef(new Map).current;
                return (0, l.jsx)(u, {
                    scope: n,
                    itemMap: i,
                    collectionRef: o,
                    children: r
                })
            };
        d.displayName = i;
        let f = e + "CollectionSlot",
            p = (0, o.createSlot)(f),
            m = t.default.forwardRef((e, t) => {
                let {
                    scope: n,
                    children: o
                } = e, i = c(f, n), a = (0, r.useComposedRefs)(t, i.collectionRef);
                return (0, l.jsx)(p, {
                    ref: a,
                    children: o
                })
            });
        m.displayName = f;
        let v = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, o.createSlot)(v),
            y = t.default.forwardRef((e, n) => {
                let {
                    scope: o,
                    children: i,
                    ...a
                } = e, s = t.default.useRef(null), u = (0, r.useComposedRefs)(n, s), d = c(v, o);
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
        }, function(n) {
            let r = c(e + "CollectionConsumer", n);
            return t.default.useCallback(() => {
                let e = r.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                return Array.from(r.itemMap.values()).sort((e, n) => t.indexOf(e.ref.current) - t.indexOf(n.ref.current))
            }, [r.collectionRef, r.itemMap])
        }, s]
    }])
}, 508785, e => {
    "use strict";
    e.i(711300), e.i(634203), e.i(35877);
    var t = e.i(416340),
        n = e.i(608652),
        r = e.i(78892),
        o = e.i(76992),
        l = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let i = e + "CollectionProvider",
            [a, s] = (0, n.createContextScope)(i),
            [u, c] = a(i, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: n,
                    children: r
                } = e, o = t.default.useRef(null), i = t.default.useRef(new Map).current;
                return (0, l.jsx)(u, {
                    scope: n,
                    itemMap: i,
                    collectionRef: o,
                    children: r
                })
            };
        d.displayName = i;
        let f = e + "CollectionSlot",
            p = (0, o.createSlot)(f),
            m = t.default.forwardRef((e, t) => {
                let {
                    scope: n,
                    children: o
                } = e, i = c(f, n), a = (0, r.useComposedRefs)(t, i.collectionRef);
                return (0, l.jsx)(p, {
                    ref: a,
                    children: o
                })
            });
        m.displayName = f;
        let v = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, o.createSlot)(v),
            y = t.default.forwardRef((e, n) => {
                let {
                    scope: o,
                    children: i,
                    ...a
                } = e, s = t.default.useRef(null), u = (0, r.useComposedRefs)(n, s), d = c(v, o);
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
        }, function(n) {
            let r = c(e + "CollectionConsumer", n);
            return t.default.useCallback(() => {
                let e = r.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                return Array.from(r.itemMap.values()).sort((e, n) => t.indexOf(e.ref.current) - t.indexOf(n.ref.current))
            }, [r.collectionRef, r.itemMap])
        }, s]
    }])
}, 974539, e => {
    "use strict";
    var t = e.i(416340);
    e.i(221628);
    var n = t.createContext(void 0);
    e.s(["useDirection", 0, function(e) {
        let r = t.useContext(n);
        return e || r || "ltr"
    }])
}, 734463, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(19655),
        r = e.i(78892),
        o = e.i(608652),
        l = e.i(598943),
        i = e.i(793808),
        a = e.i(44265),
        s = e.i(40266),
        u = e.i(524887),
        c = e.i(763960),
        d = e.i(226972),
        f = e.i(594278),
        p = e.i(699704),
        m = e.i(428156),
        v = e.i(3300),
        h = e.i(813593),
        g = e.i(221628),
        y = "Popover",
        [x, w] = (0, o.createContextScope)(y, [u.createPopperScope]),
        b = (0, u.createPopperScope)(),
        [C, E] = x(y),
        S = e => {
            let {
                __scopePopover: n,
                children: r,
                open: o,
                defaultOpen: l,
                onOpenChange: i,
                modal: a = !1
            } = e, c = b(n), d = t.useRef(null), [f, p] = t.useState(!1), [v = !1, h] = (0, m.useControllableState)({
                prop: o,
                defaultProp: l,
                onChange: i
            });
            return (0, g.jsx)(u.Root, {
                ...c,
                children: (0, g.jsx)(C, {
                    scope: n,
                    contentId: (0, s.useId)(),
                    triggerRef: d,
                    open: v,
                    onOpenChange: h,
                    onOpenToggle: t.useCallback(() => h(e => !e), [h]),
                    hasCustomAnchor: f,
                    onCustomAnchorAdd: t.useCallback(() => p(!0), []),
                    onCustomAnchorRemove: t.useCallback(() => p(!1), []),
                    modal: a,
                    children: r
                })
            })
        };
    S.displayName = y;
    var R = "PopoverAnchor",
        P = t.forwardRef((e, n) => {
            let {
                __scopePopover: r,
                ...o
            } = e, l = E(R, r), i = b(r), {
                onCustomAnchorAdd: a,
                onCustomAnchorRemove: s
            } = l;
            return t.useEffect(() => (a(), () => s()), [a, s]), (0, g.jsx)(u.Anchor, {
                ...i,
                ...o,
                ref: n
            })
        });
    P.displayName = R;
    var T = "PopoverTrigger",
        A = t.forwardRef((e, t) => {
            let {
                __scopePopover: o,
                ...l
            } = e, i = E(T, o), a = b(o), s = (0, r.useComposedRefs)(t, i.triggerRef), c = (0, g.jsx)(f.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": i.open,
                "aria-controls": i.contentId,
                "data-state": z(i.open),
                ...l,
                ref: s,
                onClick: (0, n.composeEventHandlers)(e.onClick, i.onOpenToggle)
            });
            return i.hasCustomAnchor ? c : (0, g.jsx)(u.Anchor, {
                asChild: !0,
                ...a,
                children: c
            })
        });
    A.displayName = T;
    var N = "PopoverPortal",
        [j, L] = x(N, {
            forceMount: void 0
        }),
        O = e => {
            let {
                __scopePopover: t,
                forceMount: n,
                children: r,
                container: o
            } = e, l = E(N, t);
            return (0, g.jsx)(j, {
                scope: t,
                forceMount: n,
                children: (0, g.jsx)(d.Presence, {
                    present: n || l.open,
                    children: (0, g.jsx)(c.Portal, {
                        asChild: !0,
                        container: o,
                        children: r
                    })
                })
            })
        };
    O.displayName = N;
    var k = "PopoverContent",
        D = t.forwardRef((e, t) => {
            let n = L(k, e.__scopePopover),
                {
                    forceMount: r = n.forceMount,
                    ...o
                } = e,
                l = E(k, e.__scopePopover);
            return (0, g.jsx)(d.Presence, {
                present: r || l.open,
                children: l.modal ? (0, g.jsx)(I, {
                    ...o,
                    ref: t
                }) : (0, g.jsx)(H, {
                    ...o,
                    ref: t
                })
            })
        });
    D.displayName = k;
    var M = (0, p.createSlot)("PopoverContent.RemoveScroll"),
        I = t.forwardRef((e, o) => {
            let l = E(k, e.__scopePopover),
                i = t.useRef(null),
                a = (0, r.useComposedRefs)(o, i),
                s = t.useRef(!1);
            return t.useEffect(() => {
                let e = i.current;
                if (e) return (0, v.hideOthers)(e)
            }, []), (0, g.jsx)(h.RemoveScroll, {
                as: M,
                allowPinchZoom: !0,
                children: (0, g.jsx)(F, {
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
                            n = 0 === t.button && !0 === t.ctrlKey;
                        s.current = 2 === t.button || n
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: (0, n.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        H = t.forwardRef((e, n) => {
            let r = E(k, e.__scopePopover),
                o = t.useRef(!1),
                l = t.useRef(!1);
            return (0, g.jsx)(F, {
                ...e,
                ref: n,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var n, i;
                    null == (n = e.onCloseAutoFocus) || n.call(e, t), t.defaultPrevented || (o.current || null == (i = r.triggerRef.current) || i.focus(), t.preventDefault()), o.current = !1, l.current = !1
                },
                onInteractOutside: t => {
                    var n, i;
                    null == (n = e.onInteractOutside) || n.call(e, t), t.defaultPrevented || (o.current = !0, "pointerdown" === t.detail.originalEvent.type && (l.current = !0));
                    let a = t.target;
                    (null == (i = r.triggerRef.current) ? void 0 : i.contains(a)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && l.current && t.preventDefault()
                }
            })
        }),
        F = t.forwardRef((e, t) => {
            let {
                __scopePopover: n,
                trapFocus: r,
                onOpenAutoFocus: o,
                onCloseAutoFocus: s,
                disableOutsidePointerEvents: c,
                onEscapeKeyDown: d,
                onPointerDownOutside: f,
                onFocusOutside: p,
                onInteractOutside: m,
                ...v
            } = e, h = E(k, n), y = b(n);
            return (0, i.useFocusGuards)(), (0, g.jsx)(a.FocusScope, {
                asChild: !0,
                loop: !0,
                trapped: r,
                onMountAutoFocus: o,
                onUnmountAutoFocus: s,
                children: (0, g.jsx)(l.DismissableLayer, {
                    asChild: !0,
                    disableOutsidePointerEvents: c,
                    onInteractOutside: m,
                    onEscapeKeyDown: d,
                    onPointerDownOutside: f,
                    onFocusOutside: p,
                    onDismiss: () => h.onOpenChange(!1),
                    children: (0, g.jsx)(u.Content, {
                        "data-state": z(h.open),
                        role: "dialog",
                        id: h.contentId,
                        ...y,
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
        _ = "PopoverClose",
        B = t.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...o
            } = e, l = E(_, r);
            return (0, g.jsx)(f.Primitive.button, {
                type: "button",
                ...o,
                ref: t,
                onClick: (0, n.composeEventHandlers)(e.onClick, () => l.onOpenChange(!1))
            })
        });
    B.displayName = _;
    var W = t.forwardRef((e, t) => {
        let {
            __scopePopover: n,
            ...r
        } = e, o = b(n);
        return (0, g.jsx)(u.Arrow, {
            ...o,
            ...r,
            ref: t
        })
    });

    function z(e) {
        return e ? "open" : "closed"
    }
    W.displayName = "PopoverArrow", e.s(["Anchor", 0, P, "Arrow", 0, W, "Close", 0, B, "Content", 0, D, "Portal", 0, O, "Root", 0, S, "Trigger", 0, A])
}, 524887, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(297452),
        r = e.i(992486),
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
                __scopePopper: n,
                children: r
            } = e, [o, l] = t.useState(null);
            return (0, d.jsx)(v, {
                scope: n,
                anchor: o,
                onAnchorChange: l,
                children: r
            })
        };
    g.displayName = f;
    var y = "PopperAnchor",
        x = t.forwardRef((e, n) => {
            let {
                __scopePopper: r,
                virtualRef: o,
                ...i
            } = e, s = h(y, r), u = t.useRef(null), c = (0, l.useComposedRefs)(n, u);
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
                sticky: D = "partial",
                hideWhenDetached: M = !1,
                updatePositionStrategy: I = "optimized",
                onPlaced: H,
                ...F
            } = e, _ = h(w, C), [B, W] = t.useState(null), z = (0, l.useComposedRefs)(o, e => W(e)), [V, U] = t.useState(null), K = (0, c.useSize)(V), X = null != (i = null == K ? void 0 : K.width) ? i : 0, Y = null != (f = null == K ? void 0 : K.height) ? f : 0, G = "number" == typeof k ? k : {
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
                middlewareData: en
            } = (0, n.useFloating)({
                strategy: "fixed",
                placement: E + ("center" !== R ? "-" + R : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return (0, r.autoUpdate)(...t, {
                        animationFrame: "always" === I
                    })
                },
                elements: {
                    reference: _.anchor
                },
                middleware: [(0, n.offset)({
                    mainAxis: S + Y,
                    alignmentAxis: P
                }), L && (0, n.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === D ? (0, n.limitShift)() : void 0,
                    ...$
                }), L && (0, n.flip)({
                    ...$
                }), (0, n.size)({
                    ...$,
                    apply: e => {
                        let {
                            elements: t,
                            rects: n,
                            availableWidth: r,
                            availableHeight: o
                        } = e, {
                            width: l,
                            height: i
                        } = n.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(r, "px")), a.setProperty("--radix-popper-available-height", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(i, "px"))
                    }
                }), V && (0, n.arrow)({
                    element: V,
                    padding: j
                }), A({
                    arrowWidth: X,
                    arrowHeight: Y
                }), M && (0, n.hide)({
                    strategy: "referenceHidden",
                    ...$
                })]
            }), [er, eo] = N(ee), el = (0, s.useCallbackRef)(H);
            (0, u.useLayoutEffect)(() => {
                et && (null == el || el())
            }, [et, el]);
            let ei = null == (p = en.arrow) ? void 0 : p.x,
                ea = null == (m = en.arrow) ? void 0 : m.y,
                es = (null == (v = en.arrow) ? void 0 : v.centerOffset) !== 0,
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
                    "--radix-popper-transform-origin": [null == (g = en.transformOrigin) ? void 0 : g.x, null == (y = en.transformOrigin) ? void 0 : y.y].join(" "),
                    ...(null == (x = en.hide) ? void 0 : x.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, d.jsx)(b, {
                    scope: C,
                    placedSide: er,
                    onArrowChange: U,
                    arrowX: ei,
                    arrowY: ea,
                    shouldHideArrow: es,
                    children: (0, d.jsx)(a.Primitive.div, {
                        "data-side": er,
                        "data-align": eo,
                        ...F,
                        ref: z,
                        style: {
                            ...F.style,
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
                __scopePopper: n,
                ...r
            } = e, l = C(S, n), i = R[l.placedSide];
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
                    ...r,
                    ref: t,
                    style: {
                        ...r.style,
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
            var n, r, o, l, i;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, m] = N(a), v = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], h = (null != (n = null == (l = u.arrow) ? void 0 : l.x) ? n : 0) + d / 2, g = (null != (r = null == (i = u.arrow) ? void 0 : i.y) ? r : 0) + f / 2, y = "", x = "";
            return "bottom" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(-f, "px")) : "top" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), x = c ? v : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), x = c ? v : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: x
                }
            }
        }
    });

    function N(e) {
        let [t, n = "center"] = e.split("-");
        return [t, n]
    }
    e.s(["Anchor", 0, x, "Arrow", 0, P, "Content", 0, E, "Root", 0, g, "createPopperScope", 0, m])
}, 600317, e => {
    "use strict";
    var t = e.i(416340);
    e.i(149285);
    var n = e.i(76992),
        r = e.i(221628),
        o = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, o) => {
            let l = (0, n.createSlot)("Primitive.".concat(o)),
                i = t.forwardRef((e, t) => {
                    let {
                        asChild: n,
                        ...i
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, r.jsx)(n ? l : o, {
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
        n = e.i(174617),
        r = e.i(508785),
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
        [v, h, g] = (0, r.createCollection)(m),
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
    var E = t.forwardRef((e, r) => {
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
            } = e, R = t.useRef(null), P = (0, o.useComposedRefs)(r, R), A = (0, c.useDirection)(g), [N, j] = (0, u.useControllableState)({
                prop: y,
                defaultProp: null != x ? x : null,
                onChange: b,
                caller: m
            }), [L, O] = t.useState(!1), k = (0, s.useCallbackRef)(C), D = h(l), M = t.useRef(!1), [I, H] = t.useState(0);
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
                    onMouseDown: (0, n.composeEventHandlers)(e.onMouseDown, () => {
                        M.current = !0
                    }),
                    onFocus: (0, n.composeEventHandlers)(e.onFocus, e => {
                        let t = !M.current;
                        if (e.target === e.currentTarget && t && !L) {
                            let t = new CustomEvent(f, p);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = D().filter(e => e.focusable);
                                T([e.find(e => e.active), e.find(e => e.id === N), ...e].filter(Boolean).map(e => e.ref.current), E)
                            }
                        }
                        M.current = !1
                    }),
                    onBlur: (0, n.composeEventHandlers)(e.onBlur, () => O(!1))
                })
            })
        }),
        S = "RovingFocusGroupItem",
        R = t.forwardRef((e, r) => {
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
                    ref: r,
                    onMouseDown: (0, n.composeEventHandlers)(e.onMouseDown, e => {
                        l ? g.onItemFocus(m) : e.preventDefault()
                    }),
                    onFocus: (0, n.composeEventHandlers)(e.onFocus, () => g.onItemFocus(m)),
                    onKeyDown: (0, n.composeEventHandlers)(e.onKeyDown, e => {
                        if ("Tab" === e.key && e.shiftKey) return void g.onItemShiftTab();
                        if (e.target !== e.currentTarget) return;
                        let t = function(e, t, n) {
                            var r;
                            let o = (r = e.key, "rtl" !== n ? r : "ArrowLeft" === r ? "ArrowRight" : "ArrowRight" === r ? "ArrowLeft" : r);
                            if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return P[o]
                        }(e, g.orientation, g.dir);
                        if (void 0 !== t) {
                            if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                            e.preventDefault();
                            let o = x().filter(e => e.focusable).map(e => e.ref.current);
                            if ("last" === t) o.reverse();
                            else if ("prev" === t || "next" === t) {
                                var n, r;
                                "prev" === t && o.reverse();
                                let l = o.indexOf(e.currentTarget);
                                o = g.loop ? (n = o, r = l + 1, n.map((e, t) => n[(r + t) % n.length])) : o.slice(l + 1)
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
            n = document.activeElement;
        for (let r of e)
            if (r === n || (r.focus({
                    preventScroll: t
                }), document.activeElement !== n)) return
    }
    e.s(["Item", 0, R, "Root", 0, C, "createRovingFocusGroupScope", 0, x])
}, 563921, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(149285),
        r = e.i(305607),
        o = e.i(19655),
        l = e.i(539206),
        i = e.i(78892),
        a = e.i(608652),
        s = e.i(974539),
        u = e.i(598943),
        c = e.i(793808),
        d = e.i(44265),
        f = e.i(40266),
        p = e.i(524887),
        m = e.i(763960),
        v = e.i(594278),
        h = e.i(699704),
        g = e.i(886449),
        y = e.i(428156),
        x = e.i(723570),
        w = e.i(300792),
        b = e.i(221628),
        C = t.forwardRef((e, t) => (0, b.jsx)(v.Primitive.span, {
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
    var E = e.i(3300),
        S = e.i(813593),
        R = [" ", "Enter", "ArrowUp", "ArrowDown"],
        P = [" ", "Enter"],
        T = "Select",
        [A, N, j] = (0, l.createCollection)(T),
        [L, O] = (0, a.createContextScope)(T, [j, p.createPopperScope]),
        k = (0, p.createPopperScope)(),
        [D, M] = L(T),
        [I, H] = L(T),
        F = e => {
            let {
                __scopeSelect: n,
                children: r,
                open: o,
                defaultOpen: l,
                onOpenChange: i,
                value: a,
                defaultValue: u,
                onValueChange: c,
                dir: d,
                name: m,
                autoComplete: v,
                disabled: h,
                required: g,
                form: x
            } = e, w = k(n), [C, E] = t.useState(null), [S, R] = t.useState(null), [P, T] = t.useState(!1), N = (0, s.useDirection)(d), [j = !1, L] = (0, y.useControllableState)({
                prop: o,
                defaultProp: l,
                onChange: i
            }), [O, M] = (0, y.useControllableState)({
                prop: a,
                defaultProp: u,
                onChange: c
            }), H = t.useRef(null), F = !C || x || !!C.closest("form"), [_, B] = t.useState(new Set), W = Array.from(_).map(e => e.props.value).join(";");
            return (0, b.jsx)(p.Root, {
                ...w,
                children: (0, b.jsxs)(D, {
                    required: g,
                    scope: n,
                    trigger: C,
                    onTriggerChange: E,
                    valueNode: S,
                    onValueNodeChange: R,
                    valueNodeHasChildren: P,
                    onValueNodeHasChildrenChange: T,
                    contentId: (0, f.useId)(),
                    value: O,
                    onValueChange: M,
                    open: j,
                    onOpenChange: L,
                    dir: N,
                    triggerPointerDownPosRef: H,
                    disabled: h,
                    children: [(0, b.jsx)(A.Provider, {
                        scope: n,
                        children: (0, b.jsx)(I, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: t.useCallback(e => {
                                B(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: t.useCallback(e => {
                                B(t => {
                                    let n = new Set(t);
                                    return n.delete(e), n
                                })
                            }, []),
                            children: r
                        })
                    }), F ? (0, b.jsxs)(ex, {
                        "aria-hidden": !0,
                        required: g,
                        tabIndex: -1,
                        name: m,
                        autoComplete: v,
                        value: O,
                        onChange: e => M(e.target.value),
                        disabled: h,
                        form: x,
                        children: [void 0 === O ? (0, b.jsx)("option", {
                            value: ""
                        }) : null, Array.from(_)]
                    }, W) : null]
                })
            })
        };
    F.displayName = T;
    var _ = "SelectTrigger",
        B = t.forwardRef((e, n) => {
            let {
                __scopeSelect: r,
                disabled: l = !1,
                ...a
            } = e, s = k(r), u = M(_, r), c = u.disabled || l, d = (0, i.useComposedRefs)(n, u.onTriggerChange), f = N(r), m = t.useRef("touch"), [h, g, y] = ew(e => {
                let t = f().filter(e => !e.disabled),
                    n = t.find(e => e.value === u.value),
                    r = eb(t, e, n);
                void 0 !== r && u.onValueChange(r.value)
            }), x = e => {
                c || (u.onOpenChange(!0), y()), e && (u.triggerPointerDownPosRef.current = {
                    x: Math.round(e.pageX),
                    y: Math.round(e.pageY)
                })
            };
            return (0, b.jsx)(p.Anchor, {
                asChild: !0,
                ...s,
                children: (0, b.jsx)(v.Primitive.button, {
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
                        e.currentTarget.focus(), "mouse" !== m.current && x(e)
                    }),
                    onPointerDown: (0, o.composeEventHandlers)(a.onPointerDown, e => {
                        m.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (x(e), e.preventDefault())
                    }),
                    onKeyDown: (0, o.composeEventHandlers)(a.onKeyDown, e => {
                        let t = "" !== h.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || g(e.key), (!t || " " !== e.key) && R.includes(e.key) && (x(), e.preventDefault())
                    })
                })
            })
        });
    B.displayName = _;
    var W = "SelectValue",
        z = t.forwardRef((e, t) => {
            let {
                __scopeSelect: n,
                className: r,
                style: o,
                children: l,
                placeholder: a = "",
                ...s
            } = e, u = M(W, n), {
                onValueNodeHasChildrenChange: c
            } = u, d = void 0 !== l, f = (0, i.useComposedRefs)(t, u.onValueNodeChange);
            return (0, x.useLayoutEffect)(() => {
                c(d)
            }, [c, d]), (0, b.jsx)(v.Primitive.span, {
                ...s,
                ref: f,
                style: {
                    pointerEvents: "none"
                },
                children: ey(u.value) ? (0, b.jsx)(b.Fragment, {
                    children: a
                }) : l
            })
        });
    z.displayName = W;
    var V = t.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            children: r,
            ...o
        } = e;
        return (0, b.jsx)(v.Primitive.span, {
            "aria-hidden": !0,
            ...o,
            ref: t,
            children: r || "▼"
        })
    });
    V.displayName = "SelectIcon";
    var U = e => (0, b.jsx)(m.Portal, {
        asChild: !0,
        ...e
    });
    U.displayName = "SelectPortal";
    var K = "SelectContent",
        X = t.forwardRef((e, r) => {
            let o = M(K, e.__scopeSelect),
                [l, i] = t.useState();
            return ((0, x.useLayoutEffect)(() => {
                i(new DocumentFragment)
            }, []), o.open) ? (0, b.jsx)(Z, {
                ...e,
                ref: r
            }) : l ? n.createPortal((0, b.jsx)(Y, {
                scope: e.__scopeSelect,
                children: (0, b.jsx)(A.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, b.jsx)("div", {
                        children: e.children
                    })
                })
            }), l) : null
        });
    X.displayName = K;
    var [Y, G] = L(K), q = (0, h.createSlot)("SelectContent.RemoveScroll"), Z = t.forwardRef((e, n) => {
        let {
            __scopeSelect: r,
            position: l = "item-aligned",
            onCloseAutoFocus: a,
            onEscapeKeyDown: s,
            onPointerDownOutside: f,
            side: p,
            sideOffset: m,
            align: v,
            alignOffset: h,
            arrowPadding: g,
            collisionBoundary: y,
            collisionPadding: x,
            sticky: w,
            hideWhenDetached: C,
            avoidCollisions: R,
            ...P
        } = e, T = M(K, r), [A, j] = t.useState(null), [L, O] = t.useState(null), k = (0, i.useComposedRefs)(n, e => j(e)), [D, I] = t.useState(null), [H, F] = t.useState(null), _ = N(r), [B, W] = t.useState(!1), z = t.useRef(!1);
        t.useEffect(() => {
            if (A) return (0, E.hideOthers)(A)
        }, [A]), (0, c.useFocusGuards)();
        let V = t.useCallback(e => {
                let [t, ...n] = _().map(e => e.ref.current), [r] = n.slice(-1), o = document.activeElement;
                for (let n of e)
                    if (n === o || (null == n || n.scrollIntoView({
                            block: "nearest"
                        }), n === t && L && (L.scrollTop = 0), n === r && L && (L.scrollTop = L.scrollHeight), null == n || n.focus(), document.activeElement !== o)) return
            }, [_, L]),
            U = t.useCallback(() => V([D, A]), [V, D, A]);
        t.useEffect(() => {
            B && U()
        }, [B, U]);
        let {
            onOpenChange: X,
            triggerPointerDownPosRef: G
        } = T;
        t.useEffect(() => {
            if (A) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        var n, r, o, l;
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (null != (n = null == (o = G.current) ? void 0 : o.x) ? n : 0)),
                            y: Math.abs(Math.round(t.pageY) - (null != (r = null == (l = G.current) ? void 0 : l.y) ? r : 0))
                        }
                    },
                    n = n => {
                        e.x <= 10 && e.y <= 10 ? n.preventDefault() : A.contains(n.target) || X(!1), document.removeEventListener("pointermove", t), G.current = null
                    };
                return null !== G.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", n, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", n, {
                        capture: !0
                    })
                }
            }
        }, [A, X, G]), t.useEffect(() => {
            let e = () => X(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [X]);
        let [Z, Q] = ew(e => {
            let t = _().filter(e => !e.disabled),
                n = t.find(e => e.ref.current === document.activeElement),
                r = eb(t, e, n);
            r && setTimeout(() => r.ref.current.focus())
        }), ee = t.useCallback((e, t, n) => {
            let r = !z.current && !n;
            (void 0 !== T.value && T.value === t || r) && (I(e), r && (z.current = !0))
        }, [T.value]), et = t.useCallback(() => null == A ? void 0 : A.focus(), [A]), en = t.useCallback((e, t, n) => {
            let r = !z.current && !n;
            (void 0 !== T.value && T.value === t || r) && F(e)
        }, [T.value]), er = "popper" === l ? J : $, eo = er === J ? {
            side: p,
            sideOffset: m,
            align: v,
            alignOffset: h,
            arrowPadding: g,
            collisionBoundary: y,
            collisionPadding: x,
            sticky: w,
            hideWhenDetached: C,
            avoidCollisions: R
        } : {};
        return (0, b.jsx)(Y, {
            scope: r,
            content: A,
            viewport: L,
            onViewportChange: O,
            itemRefCallback: ee,
            selectedItem: D,
            onItemLeave: et,
            itemTextRefCallback: en,
            focusSelectedItem: U,
            selectedItemText: H,
            position: l,
            isPositioned: B,
            searchRef: Z,
            children: (0, b.jsx)(S.RemoveScroll, {
                as: q,
                allowPinchZoom: !0,
                children: (0, b.jsx)(d.FocusScope, {
                    asChild: !0,
                    trapped: T.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: (0, o.composeEventHandlers)(a, e => {
                        var t;
                        null == (t = T.trigger) || t.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, b.jsx)(u.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !0,
                        onEscapeKeyDown: s,
                        onPointerDownOutside: f,
                        onFocusOutside: e => e.preventDefault(),
                        onDismiss: () => T.onOpenChange(!1),
                        children: (0, b.jsx)(er, {
                            role: "listbox",
                            id: T.contentId,
                            "data-state": T.open ? "open" : "closed",
                            dir: T.dir,
                            onContextMenu: e => e.preventDefault(),
                            ...P,
                            ...eo,
                            onPlaced: () => W(!0),
                            ref: k,
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
                                        let n = e.target,
                                            r = t.indexOf(n);
                                        t = t.slice(r + 1)
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
    Z.displayName = "SelectContentImpl";
    var $ = t.forwardRef((e, n) => {
        let {
            __scopeSelect: o,
            onPlaced: l,
            ...a
        } = e, s = M(K, o), u = G(K, o), [c, d] = t.useState(null), [f, p] = t.useState(null), m = (0, i.useComposedRefs)(n, e => p(e)), h = N(o), g = t.useRef(!1), y = t.useRef(!0), {
            viewport: w,
            selectedItem: C,
            selectedItemText: E,
            focusSelectedItem: S
        } = u, R = t.useCallback(() => {
            if (s.trigger && s.valueNode && c && f && w && C && E) {
                let e = s.trigger.getBoundingClientRect(),
                    t = f.getBoundingClientRect(),
                    n = s.valueNode.getBoundingClientRect(),
                    o = E.getBoundingClientRect();
                if ("rtl" !== s.dir) {
                    let l = o.left - t.left,
                        i = n.left - l,
                        a = e.left - i,
                        s = e.width + a,
                        u = Math.max(s, t.width),
                        d = window.innerWidth - 10,
                        f = (0, r.clamp)(i, [10, Math.max(10, d - u)]);
                    c.style.minWidth = s + "px", c.style.left = f + "px"
                } else {
                    let l = t.right - o.right,
                        i = window.innerWidth - n.right - l,
                        a = window.innerWidth - e.right - i,
                        s = e.width + a,
                        u = Math.max(s, t.width),
                        d = window.innerWidth - 10,
                        f = (0, r.clamp)(i, [10, Math.max(10, d - u)]);
                    c.style.minWidth = s + "px", c.style.right = f + "px"
                }
                let i = h(),
                    a = window.innerHeight - 20,
                    u = w.scrollHeight,
                    d = window.getComputedStyle(f),
                    p = parseInt(d.borderTopWidth, 10),
                    m = parseInt(d.paddingTop, 10),
                    v = parseInt(d.borderBottomWidth, 10),
                    y = p + m + u + parseInt(d.paddingBottom, 10) + v,
                    x = Math.min(5 * C.offsetHeight, y),
                    b = window.getComputedStyle(w),
                    S = parseInt(b.paddingTop, 10),
                    R = parseInt(b.paddingBottom, 10),
                    P = e.top + e.height / 2 - 10,
                    T = C.offsetHeight / 2,
                    A = p + m + (C.offsetTop + T);
                if (A <= P) {
                    let e = i.length > 0 && C === i[i.length - 1].ref.current;
                    c.style.bottom = "0px";
                    let t = Math.max(a - P, T + (e ? R : 0) + (f.clientHeight - w.offsetTop - w.offsetHeight) + v);
                    c.style.height = A + t + "px"
                } else {
                    let e = i.length > 0 && C === i[0].ref.current;
                    c.style.top = "0px";
                    let t = Math.max(P, p + w.offsetTop + (e ? S : 0) + T);
                    c.style.height = t + (y - A) + "px", w.scrollTop = A - P + w.offsetTop
                }
                c.style.margin = "".concat(10, "px 0"), c.style.minHeight = x + "px", c.style.maxHeight = a + "px", null == l || l(), requestAnimationFrame(() => g.current = !0)
            }
        }, [h, s.trigger, s.valueNode, c, f, w, C, E, s.dir, l]);
        (0, x.useLayoutEffect)(() => R(), [R]);
        let [P, T] = t.useState();
        (0, x.useLayoutEffect)(() => {
            f && T(window.getComputedStyle(f).zIndex)
        }, [f]);
        let A = t.useCallback(e => {
            e && !0 === y.current && (R(), null == S || S(), y.current = !1)
        }, [R, S]);
        return (0, b.jsx)(Q, {
            scope: o,
            contentWrapper: c,
            shouldExpandOnScrollRef: g,
            onScrollButtonChange: A,
            children: (0, b.jsx)("div", {
                ref: d,
                style: {
                    display: "flex",
                    flexDirection: "column",
                    position: "fixed",
                    zIndex: P
                },
                children: (0, b.jsx)(v.Primitive.div, {
                    ...a,
                    ref: m,
                    style: {
                        boxSizing: "border-box",
                        maxHeight: "100%",
                        ...a.style
                    }
                })
            })
        })
    });
    $.displayName = "SelectItemAlignedPosition";
    var J = t.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            align: r = "start",
            collisionPadding: o = 10,
            ...l
        } = e, i = k(n);
        return (0, b.jsx)(p.Content, {
            ...i,
            ...l,
            ref: t,
            align: r,
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
    J.displayName = "SelectPopperPosition";
    var [Q, ee] = L(K, {}), et = "SelectViewport", en = t.forwardRef((e, n) => {
        let {
            __scopeSelect: r,
            nonce: l,
            ...a
        } = e, s = G(et, r), u = ee(et, r), c = (0, i.useComposedRefs)(n, s.onViewportChange), d = t.useRef(0);
        return (0, b.jsxs)(b.Fragment, {
            children: [(0, b.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: l
            }), (0, b.jsx)(A.Slot, {
                scope: r,
                children: (0, b.jsx)(v.Primitive.div, {
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
                                contentWrapper: n,
                                shouldExpandOnScrollRef: r
                            } = u;
                        if ((null == r ? void 0 : r.current) && n) {
                            let e = Math.abs(d.current - t.scrollTop);
                            if (e > 0) {
                                let r = window.innerHeight - 20,
                                    o = Math.max(parseFloat(n.style.minHeight), parseFloat(n.style.height));
                                if (o < r) {
                                    let l = o + e,
                                        i = Math.min(r, l),
                                        a = l - i;
                                    n.style.height = i + "px", "0px" === n.style.bottom && (t.scrollTop = a > 0 ? a : 0, n.style.justifyContent = "flex-end")
                                }
                            }
                        }
                        d.current = t.scrollTop
                    })
                })
            })]
        })
    });
    en.displayName = et;
    var er = "SelectGroup",
        [eo, el] = L(er);
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            ...r
        } = e, o = (0, f.useId)();
        return (0, b.jsx)(eo, {
            scope: n,
            id: o,
            children: (0, b.jsx)(v.Primitive.div, {
                role: "group",
                "aria-labelledby": o,
                ...r,
                ref: t
            })
        })
    }).displayName = er;
    var ei = "SelectLabel";
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            ...r
        } = e, o = el(ei, n);
        return (0, b.jsx)(v.Primitive.div, {
            id: o.id,
            ...r,
            ref: t
        })
    }).displayName = ei;
    var ea = "SelectItem",
        [es, eu] = L(ea),
        ec = t.forwardRef((e, n) => {
            let {
                __scopeSelect: r,
                value: l,
                disabled: a = !1,
                textValue: s,
                ...u
            } = e, c = M(ea, r), d = G(ea, r), p = c.value === l, [m, h] = t.useState(null != s ? s : ""), [g, y] = t.useState(!1), x = (0, i.useComposedRefs)(n, e => {
                var t;
                return null == (t = d.itemRefCallback) ? void 0 : t.call(d, e, l, a)
            }), w = (0, f.useId)(), C = t.useRef("touch"), E = () => {
                a || (c.onValueChange(l), c.onOpenChange(!1))
            };
            if ("" === l) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, b.jsx)(es, {
                scope: r,
                value: l,
                disabled: a,
                textId: w,
                isSelected: p,
                onItemTextChange: t.useCallback(e => {
                    h(t => {
                        var n;
                        return t || (null != (n = null == e ? void 0 : e.textContent) ? n : "").trim()
                    })
                }, []),
                children: (0, b.jsx)(A.ItemSlot, {
                    scope: r,
                    value: l,
                    disabled: a,
                    textValue: m,
                    children: (0, b.jsx)(v.Primitive.div, {
                        role: "option",
                        "aria-labelledby": w,
                        "data-highlighted": g ? "" : void 0,
                        "aria-selected": p && g,
                        "data-state": p ? "checked" : "unchecked",
                        "aria-disabled": a || void 0,
                        "data-disabled": a ? "" : void 0,
                        tabIndex: a ? void 0 : -1,
                        ...u,
                        ref: x,
                        onFocus: (0, o.composeEventHandlers)(u.onFocus, () => y(!0)),
                        onBlur: (0, o.composeEventHandlers)(u.onBlur, () => y(!1)),
                        onClick: (0, o.composeEventHandlers)(u.onClick, () => {
                            "mouse" !== C.current && E()
                        }),
                        onPointerUp: (0, o.composeEventHandlers)(u.onPointerUp, () => {
                            "mouse" === C.current && E()
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
                            ((null == (t = d.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (P.includes(e.key) && E(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    ec.displayName = ea;
    var ed = "SelectItemText",
        ef = t.forwardRef((e, r) => {
            let {
                __scopeSelect: o,
                className: l,
                style: a,
                ...s
            } = e, u = M(ed, o), c = G(ed, o), d = eu(ed, o), f = H(ed, o), [p, m] = t.useState(null), h = (0, i.useComposedRefs)(r, e => m(e), d.onItemTextChange, e => {
                var t;
                return null == (t = c.itemTextRefCallback) ? void 0 : t.call(c, e, d.value, d.disabled)
            }), g = null == p ? void 0 : p.textContent, y = t.useMemo(() => (0, b.jsx)("option", {
                value: d.value,
                disabled: d.disabled,
                children: g
            }, d.value), [d.disabled, d.value, g]), {
                onNativeOptionAdd: w,
                onNativeOptionRemove: C
            } = f;
            return (0, x.useLayoutEffect)(() => (w(y), () => C(y)), [w, C, y]), (0, b.jsxs)(b.Fragment, {
                children: [(0, b.jsx)(v.Primitive.span, {
                    id: d.textId,
                    ...s,
                    ref: h
                }), d.isSelected && u.valueNode && !u.valueNodeHasChildren ? n.createPortal(s.children, u.valueNode) : null]
            })
        });
    ef.displayName = ed;
    var ep = "SelectItemIndicator";
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            ...r
        } = e;
        return eu(ep, n).isSelected ? (0, b.jsx)(v.Primitive.span, {
            "aria-hidden": !0,
            ...r,
            ref: t
        }) : null
    }).displayName = ep;
    var em = "SelectScrollUpButton";
    t.forwardRef((e, n) => {
        let r = G(em, e.__scopeSelect),
            o = ee(em, e.__scopeSelect),
            [l, a] = t.useState(!1),
            s = (0, i.useComposedRefs)(n, o.onScrollButtonChange);
        return (0, x.useLayoutEffect)(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        a(t.scrollTop > 0)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), l ? (0, b.jsx)(eh, {
            ...e,
            ref: s,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = r;
                e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
            }
        }) : null
    }).displayName = em;
    var ev = "SelectScrollDownButton";
    t.forwardRef((e, n) => {
        let r = G(ev, e.__scopeSelect),
            o = ee(ev, e.__scopeSelect),
            [l, a] = t.useState(!1),
            s = (0, i.useComposedRefs)(n, o.onScrollButtonChange);
        return (0, x.useLayoutEffect)(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        a(Math.ceil(t.scrollTop) < e)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), l ? (0, b.jsx)(eh, {
            ...e,
            ref: s,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = r;
                e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
            }
        }) : null
    }).displayName = ev;
    var eh = t.forwardRef((e, n) => {
        let {
            __scopeSelect: r,
            onAutoScroll: l,
            ...i
        } = e, a = G("SelectScrollButton", r), s = t.useRef(null), u = N(r), c = t.useCallback(() => {
            null !== s.current && (window.clearInterval(s.current), s.current = null)
        }, []);
        return t.useEffect(() => () => c(), [c]), (0, x.useLayoutEffect)(() => {
            var e;
            let t = u().find(e => e.ref.current === document.activeElement);
            null == t || null == (e = t.ref.current) || e.scrollIntoView({
                block: "nearest"
            })
        }, [u]), (0, b.jsx)(v.Primitive.div, {
            "aria-hidden": !0,
            ...i,
            ref: n,
            style: {
                flexShrink: 0,
                ...i.style
            },
            onPointerDown: (0, o.composeEventHandlers)(i.onPointerDown, () => {
                null === s.current && (s.current = window.setInterval(l, 50))
            }),
            onPointerMove: (0, o.composeEventHandlers)(i.onPointerMove, () => {
                var e;
                null == (e = a.onItemLeave) || e.call(a), null === s.current && (s.current = window.setInterval(l, 50))
            }),
            onPointerLeave: (0, o.composeEventHandlers)(i.onPointerLeave, () => {
                c()
            })
        })
    });
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            ...r
        } = e;
        return (0, b.jsx)(v.Primitive.div, {
            "aria-hidden": !0,
            ...r,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var eg = "SelectArrow";

    function ey(e) {
        return "" === e || void 0 === e
    }
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            ...r
        } = e, o = k(n), l = M(eg, n), i = G(eg, n);
        return l.open && "popper" === i.position ? (0, b.jsx)(p.Arrow, {
            ...o,
            ...r,
            ref: t
        }) : null
    }).displayName = eg;
    var ex = t.forwardRef((e, n) => {
        let {
            value: r,
            ...o
        } = e, l = t.useRef(null), a = (0, i.useComposedRefs)(n, l), s = (0, w.usePrevious)(r);
        return t.useEffect(() => {
            let e = l.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
            if (s !== r && t) {
                let n = new Event("change", {
                    bubbles: !0
                });
                t.call(e, r), e.dispatchEvent(n)
            }
        }, [s, r]), (0, b.jsx)(C, {
            asChild: !0,
            children: (0, b.jsx)("select", {
                ...o,
                ref: a,
                defaultValue: r
            })
        })
    });

    function ew(e) {
        let n = (0, g.useCallbackRef)(e),
            r = t.useRef(""),
            o = t.useRef(0),
            l = t.useCallback(e => {
                let t = r.current + e;
                n(t),
                    function e(t) {
                        r.current = t, window.clearTimeout(o.current), "" !== t && (o.current = window.setTimeout(() => e(""), 1e3))
                    }(t)
            }, [n]),
            i = t.useCallback(() => {
                r.current = "", window.clearTimeout(o.current)
            }, []);
        return t.useEffect(() => () => window.clearTimeout(o.current), []), [r, l, i]
    }

    function eb(e, t, n) {
        var r, o;
        let l = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            i = n ? e.indexOf(n) : -1,
            a = (r = e, o = Math.max(i, 0), r.map((e, t) => r[(o + t) % r.length]));
        1 === l.length && (a = a.filter(e => e !== n));
        let s = a.find(e => e.textValue.toLowerCase().startsWith(l.toLowerCase()));
        return s !== n ? s : void 0
    }
    ex.displayName = "BubbleSelect", e.s(["Content", 0, X, "Icon", 0, V, "Item", 0, ec, "ItemText", 0, ef, "Portal", 0, U, "Root", 0, F, "Trigger", 0, B, "Value", 0, z, "Viewport", 0, en], 563921)
}, 76992, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(78892),
        r = e.i(221628),
        o = Symbol("radix.slottable");

    function l(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === o
    }
    e.s(["createSlot", 0, function(e) {
        var o;
        let i, a = (o = e, (i = t.forwardRef((e, r) => {
                let {
                    children: o,
                    ...l
                } = e;
                if (t.isValidElement(o)) {
                    var i, a, s;
                    let e, u, c = (u = (e = null == (a = Object.getOwnPropertyDescriptor((i = o).props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning) ? i.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                        d = function(e, t) {
                            let n = {
                                ...t
                            };
                            for (let r in t) {
                                let o = e[r],
                                    l = t[r];
                                /^on[A-Z]/.test(r) ? o && l ? n[r] = function() {
                                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                    let r = l(...t);
                                    return o(...t), r
                                } : o && (n[r] = o) : "style" === r ? n[r] = {
                                    ...o,
                                    ...l
                                } : "className" === r && (n[r] = [o, l].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...n
                            }
                        }(l, o.props);
                    return o.type !== t.Fragment && (d.ref = r ? (0, n.composeRefs)(r, c) : c), t.cloneElement(o, d)
                }
                return t.Children.count(o) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(o, ".SlotClone"), i),
            s = t.forwardRef((e, n) => {
                let {
                    children: o,
                    ...i
                } = e, s = t.Children.toArray(o), u = s.find(l);
                if (u) {
                    let e = u.props.children,
                        o = s.map(n => n !== u ? n : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, r.jsx)(a, {
                        ...i,
                        ref: n,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, o) : null
                    })
                }
                return (0, r.jsx)(a, {
                    ...i,
                    ref: n,
                    children: o
                })
            });
        return s.displayName = "".concat(e, ".Slot"), s
    }])
}, 989665, 992486, 297452, e => {
    "use strict";
    let t;
    var n, r, o = e.i(416340);

    function l(e, t) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (null == e || e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }

    function i(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function a() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return e => {
            let n = !1,
                r = t.map(t => {
                    let r = i(t, e);
                    return n || "function" != typeof r || (n = !0), r
                });
            if (n) return () => {
                for (let e = 0; e < r.length; e++) {
                    let n = r[e];
                    "function" == typeof n ? n() : i(t[e], null)
                }
            }
        }
    }

    function s() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return o.useCallback(a(...t), t)
    }
    var u = e.i(221628);

    function c(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            n = [],
            r = () => {
                let t = n.map(e => o.createContext(e));
                return function(n) {
                    let r = (null == n ? void 0 : n[e]) || t;
                    return o.useMemo(() => ({
                        ["__scope".concat(e)]: {
                            ...n,
                            [e]: r
                        }
                    }), [n, r])
                }
            };
        return r.scopeName = e, [function(t, r) {
            let l = o.createContext(r),
                i = n.length;
            n = [...n, r];
            let a = t => {
                var n;
                let {
                    scope: r,
                    children: a,
                    ...s
                } = t, c = (null == r || null == (n = r[e]) ? void 0 : n[i]) || l, d = o.useMemo(() => s, Object.values(s));
                return (0, u.jsx)(c.Provider, {
                    value: d,
                    children: a
                })
            };
            return a.displayName = t + "Provider", [a, function(n, a) {
                var s;
                let u = (null == a || null == (s = a[e]) ? void 0 : s[i]) || l,
                    c = o.useContext(u);
                if (c) return c;
                if (void 0 !== r) return r;
                throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            let r = t[0];
            if (1 === t.length) return r;
            let l = () => {
                let e = t.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(t) {
                    let n = e.reduce((e, n) => {
                        let {
                            useScope: r,
                            scopeName: o
                        } = n, l = r(t)["__scope".concat(o)];
                        return {
                            ...e,
                            ...l
                        }
                    }, {});
                    return o.useMemo(() => ({
                        ["__scope".concat(r.scopeName)]: n
                    }), [n])
                }
            };
            return l.scopeName = r.scopeName, l
        }(r, ...t)]
    }
    var d = e.i(149285),
        f = o.forwardRef((e, t) => {
            let {
                children: n,
                ...r
            } = e, l = o.Children.toArray(n), i = l.find(v);
            if (i) {
                let e = i.props.children,
                    n = l.map(t => t !== i ? t : o.Children.count(e) > 1 ? o.Children.only(null) : o.isValidElement(e) ? e.props.children : null);
                return (0, u.jsx)(p, {
                    ...r,
                    ref: t,
                    children: o.isValidElement(e) ? o.cloneElement(e, void 0, n) : null
                })
            }
            return (0, u.jsx)(p, {
                ...r,
                ref: t,
                children: n
            })
        });
    f.displayName = "Slot";
    var p = o.forwardRef((e, t) => {
        let {
            children: n,
            ...r
        } = e;
        if (o.isValidElement(n)) {
            var l, i, s;
            let e, u, c = (u = (e = null == (i = Object.getOwnPropertyDescriptor((l = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in e && e.isReactWarning) ? l.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? l.props.ref : l.props.ref || l.ref;
            return o.cloneElement(n, {
                ... function(e, t) {
                    let n = {
                        ...t
                    };
                    for (let r in t) {
                        let o = e[r],
                            l = t[r];
                        /^on[A-Z]/.test(r) ? o && l ? n[r] = function() {
                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                            l(...t), o(...t)
                        } : o && (n[r] = o) : "style" === r ? n[r] = {
                            ...o,
                            ...l
                        } : "className" === r && (n[r] = [o, l].filter(Boolean).join(" "))
                    }
                    return {
                        ...e,
                        ...n
                    }
                }(r, n.props),
                ref: t ? a(t, c) : c
            })
        }
        return o.Children.count(n) > 1 ? o.Children.only(null) : null
    });
    p.displayName = "SlotClone";
    var m = e => {
        let {
            children: t
        } = e;
        return (0, u.jsx)(u.Fragment, {
            children: t
        })
    };

    function v(e) {
        return o.isValidElement(e) && e.type === m
    }
    var h = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
        let n = o.forwardRef((e, n) => {
            let {
                asChild: r,
                ...o
            } = e, l = r ? f : t;
            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, u.jsx)(l, {
                ...o,
                ref: n
            })
        });
        return n.displayName = "Primitive.".concat(t), {
            ...e,
            [t]: n
        }
    }, {});

    function g(e) {
        let t = o.useRef(e);
        return o.useEffect(() => {
            t.current = e
        }), o.useMemo(() => function() {
            for (var e, n = arguments.length, r = Array(n), o = 0; o < n; o++) r[o] = arguments[o];
            return null == (e = t.current) ? void 0 : e.call(t, ...r)
        }, [])
    }
    var y = "dismissableLayer.update",
        x = o.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        w = o.forwardRef((e, t) => {
            var r, i;
            let {
                disableOutsidePointerEvents: a = !1,
                onEscapeKeyDown: c,
                onPointerDownOutside: d,
                onFocusOutside: f,
                onInteractOutside: p,
                onDismiss: m,
                ...v
            } = e, w = o.useContext(x), [E, S] = o.useState(null), R = null != (r = null == E ? void 0 : E.ownerDocument) ? r : null == (i = globalThis) ? void 0 : i.document, [, P] = o.useState({}), T = s(t, e => S(e)), A = Array.from(w.layers), [N] = [...w.layersWithOutsidePointerEventsDisabled].slice(-1), j = A.indexOf(N), L = E ? A.indexOf(E) : -1, O = w.layersWithOutsidePointerEventsDisabled.size > 0, k = L >= j, D = function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = g(e),
                    l = o.useRef(!1),
                    i = o.useRef(() => {});
                return o.useEffect(() => {
                    let e = e => {
                            if (e.target && !l.current) {
                                let t = function() {
                                        C("dismissableLayer.pointerDownOutside", r, o, {
                                            discrete: !0
                                        })
                                    },
                                    o = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (n.removeEventListener("click", i.current), i.current = t, n.addEventListener("click", i.current, {
                                    once: !0
                                })) : t()
                            } else n.removeEventListener("click", i.current);
                            l.current = !1
                        },
                        t = window.setTimeout(() => {
                            n.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(t), n.removeEventListener("pointerdown", e), n.removeEventListener("click", i.current)
                    }
                }, [n, r]), {
                    onPointerDownCapture: () => l.current = !0
                }
            }(e => {
                let t = e.target,
                    n = [...w.branches].some(e => e.contains(t));
                k && !n && (null == d || d(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, R), M = function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = g(e),
                    l = o.useRef(!1);
                return o.useEffect(() => {
                    let e = e => {
                        e.target && !l.current && C("dismissableLayer.focusOutside", r, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return n.addEventListener("focusin", e), () => n.removeEventListener("focusin", e)
                }, [n, r]), {
                    onFocusCapture: () => l.current = !0,
                    onBlurCapture: () => l.current = !1
                }
            }(e => {
                let t = e.target;
                ![...w.branches].some(e => e.contains(t)) && (null == f || f(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, R);
            return ! function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = g(e);
                o.useEffect(() => {
                    let e = e => {
                        "Escape" === e.key && r(e)
                    };
                    return n.addEventListener("keydown", e, {
                        capture: !0
                    }), () => n.removeEventListener("keydown", e, {
                        capture: !0
                    })
                }, [r, n])
            }(e => {
                L === w.layers.size - 1 && (null == c || c(e), !e.defaultPrevented && m && (e.preventDefault(), m()))
            }, R), o.useEffect(() => {
                if (E) return a && (0 === w.layersWithOutsidePointerEventsDisabled.size && (n = R.body.style.pointerEvents, R.body.style.pointerEvents = "none"), w.layersWithOutsidePointerEventsDisabled.add(E)), w.layers.add(E), b(), () => {
                    a && 1 === w.layersWithOutsidePointerEventsDisabled.size && (R.body.style.pointerEvents = n)
                }
            }, [E, R, a, w]), o.useEffect(() => () => {
                E && (w.layers.delete(E), w.layersWithOutsidePointerEventsDisabled.delete(E), b())
            }, [E, w]), o.useEffect(() => {
                let e = () => P({});
                return document.addEventListener(y, e), () => document.removeEventListener(y, e)
            }, []), (0, u.jsx)(h.div, {
                ...v,
                ref: T,
                style: {
                    pointerEvents: O ? k ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: l(e.onFocusCapture, M.onFocusCapture),
                onBlurCapture: l(e.onBlurCapture, M.onBlurCapture),
                onPointerDownCapture: l(e.onPointerDownCapture, D.onPointerDownCapture)
            })
        });

    function b() {
        let e = new CustomEvent(y);
        document.dispatchEvent(e)
    }

    function C(e, t, n, r) {
        let {
            discrete: o
        } = r, l = n.originalEvent.target, i = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: n
        });
        if (t && l.addEventListener(e, t, {
                once: !0
            }), o) l && d.flushSync(() => l.dispatchEvent(i));
        else l.dispatchEvent(i)
    }
    w.displayName = "DismissableLayer", o.forwardRef((e, t) => {
        let n = o.useContext(x),
            r = o.useRef(null),
            l = s(t, r);
        return o.useEffect(() => {
            let e = r.current;
            if (e) return n.branches.add(e), () => {
                n.branches.delete(e)
            }
        }, [n.branches]), (0, u.jsx)(h.div, {
            ...e,
            ref: l
        })
    }).displayName = "DismissableLayerBranch";
    var E = (null == (r = globalThis) ? void 0 : r.document) ? o.useLayoutEffect : () => {},
        S = o["useId".toString()] || (() => void 0),
        R = 0;
    let P = ["top", "right", "bottom", "left"],
        T = P.reduce((e, t) => e.concat(t, t + "-start", t + "-end"), []),
        A = Math.min,
        N = Math.max,
        j = Math.round,
        L = Math.floor,
        O = e => ({
            x: e,
            y: e
        }),
        k = {
            left: "right",
            right: "left",
            bottom: "top",
            top: "bottom"
        };

    function D(e, t) {
        return "function" == typeof e ? e(t) : e
    }

    function M(e) {
        return e.split("-")[0]
    }

    function I(e) {
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

    function B(e, t, n) {
        void 0 === n && (n = !1);
        let r = I(e),
            o = H(_(e)),
            l = F(o),
            i = "x" === o ? r === (n ? "end" : "start") ? "right" : "left" : "start" === r ? "bottom" : "top";
        return t.reference[l] > t.floating[l] && (i = X(i)), [i, X(i)]
    }

    function W(e) {
        return e.includes("start") ? e.replace("start", "end") : e.replace("end", "start")
    }
    let z = ["left", "right"],
        V = ["right", "left"],
        U = ["top", "bottom"],
        K = ["bottom", "top"];

    function X(e) {
        let t = M(e);
        return k[t] + e.slice(t.length)
    }

    function Y(e) {
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
            y: n,
            width: r,
            height: o
        } = e;
        return {
            width: r,
            height: o,
            top: n,
            left: t,
            right: t + r,
            bottom: n + o,
            x: t,
            y: n
        }
    }

    function q(e, t, n) {
        let r, {
                reference: o,
                floating: l
            } = e,
            i = _(t),
            a = H(_(t)),
            s = F(a),
            u = M(t),
            c = "y" === i,
            d = o.x + o.width / 2 - l.width / 2,
            f = o.y + o.height / 2 - l.height / 2,
            p = o[s] / 2 - l[s] / 2;
        switch (u) {
            case "top":
                r = {
                    x: d,
                    y: o.y - l.height
                };
                break;
            case "bottom":
                r = {
                    x: d,
                    y: o.y + o.height
                };
                break;
            case "right":
                r = {
                    x: o.x + o.width,
                    y: f
                };
                break;
            case "left":
                r = {
                    x: o.x - l.width,
                    y: f
                };
                break;
            default:
                r = {
                    x: o.x,
                    y: o.y
                }
        }
        switch (I(t)) {
            case "start":
                r[a] -= p * (n && c ? -1 : 1);
                break;
            case "end":
                r[a] += p * (n && c ? -1 : 1)
        }
        return r
    }
    async function Z(e, t) {
        var n;
        void 0 === t && (t = {});
        let {
            x: r,
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
        } = D(t, e), m = Y(p), v = a[f ? "floating" === d ? "reference" : "floating" : d], h = G(await l.getClippingRect({
            element: null == (n = await (null == l.isElement ? void 0 : l.isElement(v))) || n ? v : v.contextElement || await (null == l.getDocumentElement ? void 0 : l.getDocumentElement(a.floating)),
            boundary: u,
            rootBoundary: c,
            strategy: s
        })), g = "floating" === d ? {
            x: r,
            y: o,
            width: i.floating.width,
            height: i.floating.height
        } : i.reference, y = await (null == l.getOffsetParent ? void 0 : l.getOffsetParent(a.floating)), x = await (null == l.isElement ? void 0 : l.isElement(y)) && await (null == l.getScale ? void 0 : l.getScale(y)) || {
            x: 1,
            y: 1
        }, w = G(l.convertOffsetParentRelativeRectToViewportRelativeRect ? await l.convertOffsetParentRelativeRectToViewportRelativeRect({
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
    let $ = async (e, t, n) => {
        let {
            placement: r = "bottom",
            strategy: o = "absolute",
            middleware: l = [],
            platform: i
        } = n, a = i.detectOverflow ? i : {
            ...i,
            detectOverflow: Z
        }, s = await (null == i.isRTL ? void 0 : i.isRTL(t)), u = await i.getElementRects({
            reference: e,
            floating: t,
            strategy: o
        }), {
            x: c,
            y: d
        } = q(u, r, s), f = r, p = 0, m = {};
        for (let n = 0; n < l.length; n++) {
            let v = l[n];
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
                initialPlacement: r,
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
            } = q(u, f, s)), n = -1)
        }
        return {
            x: c,
            y: d,
            placement: f,
            strategy: o,
            middlewareData: m
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
        let t = A(...e.map(e => e.left)),
            n = A(...e.map(e => e.top));
        return {
            x: t,
            y: n,
            width: N(...e.map(e => e.right)) - t,
            height: N(...e.map(e => e.bottom)) - n
        }
    }
    let et = new Set(["left", "top"]);
    async function en(e, t) {
        let {
            placement: n,
            platform: r,
            elements: o
        } = e, l = await (null == r.isRTL ? void 0 : r.isRTL(o.floating)), i = M(n), a = I(n), s = "y" === _(n), u = et.has(i) ? -1 : 1, c = l && s ? -1 : 1, d = D(t, e), {
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

    function er() {
        return "u" > typeof window
    }

    function eo(e) {
        return ea(e) ? (e.nodeName || "").toLowerCase() : "#document"
    }

    function el(e) {
        var t;
        return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
    }

    function ei(e) {
        var t;
        return null == (t = (ea(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
    }

    function ea(e) {
        return !!er() && (e instanceof Node || e instanceof el(e).Node)
    }

    function es(e) {
        return !!er() && (e instanceof Element || e instanceof el(e).Element)
    }

    function eu(e) {
        return !!er() && (e instanceof HTMLElement || e instanceof el(e).HTMLElement)
    }

    function ec(e) {
        return !(!er() || "u" < typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof el(e).ShadowRoot)
    }

    function ed(e) {
        let {
            overflow: t,
            overflowX: n,
            overflowY: r,
            display: o
        } = ex(e);
        return /auto|scroll|overlay|hidden|clip/.test(t + r + n) && "inline" !== o && "contents" !== o
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
        em = /paint|layout|strict|content/,
        ev = e => !!e && "none" !== e;

    function eh(e) {
        let t = es(e) ? ex(e) : e;
        return ev(t.transform) || ev(t.translate) || ev(t.scale) || ev(t.rotate) || ev(t.perspective) || !eg() && (ev(t.backdropFilter) || ev(t.filter)) || ep.test(t.willChange || "") || em.test(t.contain || "")
    }

    function eg() {
        return null == t && (t = "u" > typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), t
    }

    function ey(e) {
        return /^(html|body|#document)$/.test(eo(e))
    }

    function ex(e) {
        return el(e).getComputedStyle(e)
    }

    function ew(e) {
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
        let t = e.assignedSlot || e.parentNode || ec(e) && e.host || ei(e);
        return ec(t) ? t.host : t
    }

    function eC(e, t, n) {
        var r;
        void 0 === t && (t = []), void 0 === n && (n = !0);
        let o = function e(t) {
                let n = eb(t);
                return ey(n) ? t.ownerDocument ? t.ownerDocument.body : t.body : eu(n) && ed(n) ? n : e(n)
            }(e),
            l = o === (null == (r = e.ownerDocument) ? void 0 : r.body),
            i = el(o);
        if (!l) return t.concat(o, eC(o, [], n));
        {
            let e = eE(i);
            return t.concat(i, i.visualViewport || [], ed(o) ? o : [], e && n ? eC(e) : [])
        }
    }

    function eE(e) {
        return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
    }

    function eS(e) {
        let t = ex(e),
            n = parseFloat(t.width) || 0,
            r = parseFloat(t.height) || 0,
            o = eu(e),
            l = o ? e.offsetWidth : n,
            i = o ? e.offsetHeight : r,
            a = j(n) !== l || j(r) !== i;
        return a && (n = l, r = i), {
            width: n,
            height: r,
            $: a
        }
    }

    function eR(e) {
        return es(e) ? e : e.contextElement
    }

    function eP(e) {
        let t = eR(e);
        if (!eu(t)) return O(1);
        let n = t.getBoundingClientRect(),
            {
                width: r,
                height: o,
                $: l
            } = eS(t),
            i = (l ? j(n.width) : n.width) / r,
            a = (l ? j(n.height) : n.height) / o;
        return i && Number.isFinite(i) || (i = 1), a && Number.isFinite(a) || (a = 1), {
            x: i,
            y: a
        }
    }
    let eT = O(0);

    function eA(e) {
        let t = el(e);
        return eg() && t.visualViewport ? {
            x: t.visualViewport.offsetLeft,
            y: t.visualViewport.offsetTop
        } : eT
    }

    function eN(e, t, n, r) {
        var o;
        void 0 === t && (t = !1), void 0 === n && (n = !1);
        let l = e.getBoundingClientRect(),
            i = eR(e),
            a = O(1);
        t && (r ? es(r) && (a = eP(r)) : a = eP(e));
        let s = (void 0 === (o = n) && (o = !1), r && (!o || r === el(i)) && o) ? eA(i) : O(0),
            u = (l.left + s.x) / a.x,
            c = (l.top + s.y) / a.y,
            d = l.width / a.x,
            f = l.height / a.y;
        if (i) {
            let e = el(i),
                t = r && es(r) ? el(r) : r,
                n = e,
                o = eE(n);
            for (; o && r && t !== n;) {
                let e = eP(o),
                    t = o.getBoundingClientRect(),
                    r = ex(o),
                    l = t.left + (o.clientLeft + parseFloat(r.paddingLeft)) * e.x,
                    i = t.top + (o.clientTop + parseFloat(r.paddingTop)) * e.y;
                u *= e.x, c *= e.y, d *= e.x, f *= e.y, u += l, c += i, o = eE(n = el(o))
            }
        }
        return G({
            width: d,
            height: f,
            x: u,
            y: c
        })
    }

    function ej(e, t) {
        let n = ew(e).scrollLeft;
        return t ? t.left + n : eN(ei(e)).left + n
    }

    function eL(e, t) {
        let n = e.getBoundingClientRect();
        return {
            x: n.left + t.scrollLeft - ej(e, n),
            y: n.top + t.scrollTop
        }
    }

    function eO(e, t, n) {
        var r;
        let o;
        if ("viewport" === t) o = function(e, t) {
            let n = el(e),
                r = ei(e),
                o = n.visualViewport,
                l = r.clientWidth,
                i = r.clientHeight,
                a = 0,
                s = 0;
            if (o) {
                l = o.width, i = o.height;
                let e = eg();
                (!e || e && "fixed" === t) && (a = o.offsetLeft, s = o.offsetTop)
            }
            let u = ej(r);
            if (u <= 0) {
                let e = r.ownerDocument,
                    t = e.body,
                    n = getComputedStyle(t),
                    o = "CSS1Compat" === e.compatMode && parseFloat(n.marginLeft) + parseFloat(n.marginRight) || 0,
                    i = Math.abs(r.clientWidth - t.clientWidth - o);
                i <= 25 && (l -= i)
            } else u <= 25 && (l += u);
            return {
                width: l,
                height: i,
                x: a,
                y: s
            }
        }(e, n);
        else if ("document" === t) {
            let t, n, l, i, a, s, u;
            r = ei(e), t = ei(r), n = ew(r), l = r.ownerDocument.body, i = N(t.scrollWidth, t.clientWidth, l.scrollWidth, l.clientWidth), a = N(t.scrollHeight, t.clientHeight, l.scrollHeight, l.clientHeight), s = -n.scrollLeft + ej(r), u = -n.scrollTop, "rtl" === ex(l).direction && (s += N(t.clientWidth, l.clientWidth) - i), o = {
                width: i,
                height: a,
                x: s,
                y: u
            }
        } else if (es(t)) {
            let e, r, l, i, a, s;
            r = (e = eN(t, !0, "fixed" === n)).top + t.clientTop, l = e.left + t.clientLeft, i = eu(t) ? eP(t) : O(1), a = t.clientWidth * i.x, s = t.clientHeight * i.y, o = {
                width: a,
                height: s,
                x: l * i.x,
                y: r * i.y
            }
        } else {
            let n = eA(e);
            o = {
                x: t.x - n.x,
                y: t.y - n.y,
                width: t.width,
                height: t.height
            }
        }
        return G(o)
    }

    function ek(e) {
        return "static" === ex(e).position
    }

    function eD(e, t) {
        if (!eu(e) || "fixed" === ex(e).position) return null;
        if (t) return t(e);
        let n = e.offsetParent;
        return ei(e) === n && (n = n.ownerDocument.body), n
    }

    function eM(e, t) {
        var n;
        let r = el(e);
        if (ef(e)) return r;
        if (!eu(e)) {
            let t = eb(e);
            for (; t && !ey(t);) {
                if (es(t) && !ek(t)) return t;
                t = eb(t)
            }
            return r
        }
        let o = eD(e, t);
        for (; o && (n = o, /^(table|td|th)$/.test(eo(n))) && ek(o);) o = eD(o, t);
        return o && ey(o) && ek(o) && !eh(o) ? r : o || function(e) {
            let t = eb(e);
            for (; eu(t) && !ey(t);) {
                if (eh(t)) return t;
                if (ef(t)) break;
                t = eb(t)
            }
            return null
        }(e) || r
    }
    let eI = async function(e) {
        let t = this.getOffsetParent || eM,
            n = this.getDimensions,
            r = await n(e.floating);
        return {
            reference: function(e, t, n) {
                let r = eu(t),
                    o = ei(t),
                    l = "fixed" === n,
                    i = eN(e, !0, l, t),
                    a = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    s = O(0);
                if (r || !r && !l)
                    if (("body" !== eo(t) || ed(o)) && (a = ew(t)), r) {
                        let e = eN(t, !0, l, t);
                        s.x = e.x + t.clientLeft, s.y = e.y + t.clientTop
                    } else o && (s.x = ej(o));
                l && !r && o && (s.x = ej(o));
                let u = !o || r || l ? O(0) : eL(o, a);
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
                width: r.width,
                height: r.height
            }
        }
    }, eH = {
        convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
            let {
                elements: t,
                rect: n,
                offsetParent: r,
                strategy: o
            } = e, l = "fixed" === o, i = ei(r), a = !!t && ef(t.floating);
            if (r === i || a && l) return n;
            let s = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                u = O(1),
                c = O(0),
                d = eu(r);
            if ((d || !d && !l) && (("body" !== eo(r) || ed(i)) && (s = ew(r)), d)) {
                let e = eN(r);
                u = eP(r), c.x = e.x + r.clientLeft, c.y = e.y + r.clientTop
            }
            let f = !i || d || l ? O(0) : eL(i, s);
            return {
                width: n.width * u.x,
                height: n.height * u.y,
                x: n.x * u.x - s.scrollLeft * u.x + c.x + f.x,
                y: n.y * u.y - s.scrollTop * u.y + c.y + f.y
            }
        },
        getDocumentElement: ei,
        getClippingRect: function(e) {
            let {
                element: t,
                boundary: n,
                rootBoundary: r,
                strategy: o
            } = e, l = [..."clippingAncestors" === n ? ef(t) ? [] : function(e, t) {
                let n = t.get(e);
                if (n) return n;
                let r = eC(e, [], !1).filter(e => es(e) && "body" !== eo(e)),
                    o = null,
                    l = "fixed" === ex(e).position,
                    i = l ? eb(e) : e;
                for (; es(i) && !ey(i);) {
                    let t = ex(i),
                        n = eh(i);
                    n || "fixed" !== t.position || (o = null), (l ? n || o : !(!n && "static" === t.position && o && ("absolute" === o.position || "fixed" === o.position) || ed(i) && !n && function e(t, n) {
                        let r = eb(t);
                        return !(r === n || !es(r) || ey(r)) && ("fixed" === ex(r).position || e(r, n))
                    }(e, i))) ? o = t : r = r.filter(e => e !== i), i = eb(i)
                }
                return t.set(e, r), r
            }(t, this._c) : [].concat(n), r], i = eO(t, l[0], o), a = i.top, s = i.right, u = i.bottom, c = i.left;
            for (let e = 1; e < l.length; e++) {
                let n = eO(t, l[e], o);
                a = N(n.top, a), s = A(n.right, s), u = A(n.bottom, u), c = N(n.left, c)
            }
            return {
                width: s - c,
                height: u - a,
                x: c,
                y: a
            }
        },
        getOffsetParent: eM,
        getElementRects: eI,
        getClientRects: function(e) {
            return Array.from(e.getClientRects())
        },
        getDimensions: function(e) {
            let {
                width: t,
                height: n
            } = eS(e);
            return {
                width: t,
                height: n
            }
        },
        getScale: eP,
        isElement: es,
        isRTL: function(e) {
            return "rtl" === ex(e).direction
        }
    };

    function eF(e, t) {
        return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
    }

    function e_(e, t, n, r) {
        let o;
        void 0 === r && (r = {});
        let {
            ancestorScroll: l = !0,
            ancestorResize: i = !0,
            elementResize: a = "function" == typeof ResizeObserver,
            layoutShift: s = "function" == typeof IntersectionObserver,
            animationFrame: u = !1
        } = r, c = eR(e), d = l || i ? [...c ? eC(c) : [], ...t ? eC(t) : []] : [];
        d.forEach(e => {
            l && e.addEventListener("scroll", n, {
                passive: !0
            }), i && e.addEventListener("resize", n)
        });
        let f = c && s ? function(e, t) {
                let n, r = null,
                    o = ei(e);

                function l() {
                    var e;
                    clearTimeout(n), null == (e = r) || e.disconnect(), r = null
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
                            rootMargin: -L(d) + "px " + -L(o.clientWidth - (c + f)) + "px " + -L(o.clientHeight - (d + p)) + "px " + -L(c) + "px",
                            threshold: N(0, A(1, s)) || 1
                        },
                        v = !0;

                    function h(t) {
                        let r = t[0].intersectionRatio;
                        if (r !== s) {
                            if (!v) return i();
                            r ? i(!1, r) : n = setTimeout(() => {
                                i(!1, 1e-7)
                            }, 1e3)
                        }
                        1 !== r || eF(u, e.getBoundingClientRect()) || i(), v = !1
                    }
                    try {
                        r = new IntersectionObserver(h, {
                            ...m,
                            root: o.ownerDocument
                        })
                    } catch (e) {
                        r = new IntersectionObserver(h, m)
                    }
                    r.observe(e)
                }(!0), l
            }(c, n) : null,
            p = -1,
            m = null;
        a && (m = new ResizeObserver(e => {
            let [r] = e;
            r && r.target === c && m && t && (m.unobserve(t), cancelAnimationFrame(p), p = requestAnimationFrame(() => {
                var e;
                null == (e = m) || e.observe(t)
            })), n()
        }), c && !u && m.observe(c), t && m.observe(t));
        let v = u ? eN(e) : null;
        return u && function t() {
            let r = eN(e);
            v && !eF(v, r) && n(), v = r, o = requestAnimationFrame(t)
        }(), n(), () => {
            var e;
            d.forEach(e => {
                l && e.removeEventListener("scroll", n), i && e.removeEventListener("resize", n)
            }), null == f || f(), null == (e = m) || e.disconnect(), m = null, u && cancelAnimationFrame(o)
        }
    }
    let eB = function(e) {
            return void 0 === e && (e = 0), {
                name: "offset",
                options: e,
                async fn(t) {
                    var n, r;
                    let {
                        x: o,
                        y: l,
                        placement: i,
                        middlewareData: a
                    } = t, s = await en(t, e);
                    return i === (null == (n = a.offset) ? void 0 : n.placement) && null != (r = a.arrow) && r.alignmentOffset ? {} : {
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
        eW = function(e) {
            return void 0 === e && (e = {}), {
                name: "shift",
                options: e,
                async fn(t) {
                    let {
                        x: n,
                        y: r,
                        placement: o,
                        platform: l
                    } = t, {
                        mainAxis: i = !0,
                        crossAxis: a = !1,
                        limiter: s = {
                            fn: e => {
                                let {
                                    x: t,
                                    y: n
                                } = e;
                                return {
                                    x: t,
                                    y: n
                                }
                            }
                        },
                        ...u
                    } = D(e, t), c = {
                        x: n,
                        y: r
                    }, d = await l.detectOverflow(t, u), f = _(M(o)), p = H(f), m = c[p], v = c[f];
                    if (i) {
                        let e = "y" === p ? "top" : "left",
                            t = "y" === p ? "bottom" : "right",
                            n = m + d[e],
                            r = m - d[t];
                        m = N(n, A(m, r))
                    }
                    if (a) {
                        let e = "y" === f ? "top" : "left",
                            t = "y" === f ? "bottom" : "right",
                            n = v + d[e],
                            r = v - d[t];
                        v = N(n, A(v, r))
                    }
                    let h = s.fn({
                        ...t,
                        [p]: m,
                        [f]: v
                    });
                    return {
                        ...h,
                        data: {
                            x: h.x - n,
                            y: h.y - r,
                            enabled: {
                                [p]: i,
                                [f]: a
                            }
                        }
                    }
                }
            }
        },
        ez = function(e) {
            return void 0 === e && (e = {}), {
                name: "flip",
                options: e,
                async fn(t) {
                    var n, r, o, l, i;
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
                        } = D(e, t);
                    if (null != (n = d.arrow) && n.alignmentOffset) return {};
                    let E = M(c),
                        S = _(p),
                        R = M(p) === p,
                        P = await (null == m.isRTL ? void 0 : m.isRTL(v.floating)),
                        T = y || (R || !b ? [X(p)] : (a = X(p), [W(p), a, W(a)])),
                        A = "none" !== w;
                    !y && A && T.push(...(s = I(p), u = function(e, t, n) {
                        switch (e) {
                            case "top":
                            case "bottom":
                                if (n) return t ? V : z;
                                return t ? z : V;
                            case "left":
                            case "right":
                                return t ? U : K;
                            default:
                                return []
                        }
                    }(M(p), "start" === w, P), s && (u = u.map(e => e + "-" + s), b && (u = u.concat(u.map(W)))), u));
                    let N = [p, ...T],
                        j = await m.detectOverflow(t, C),
                        L = [],
                        O = (null == (r = d.flip) ? void 0 : r.overflows) || [];
                    if (h && L.push(j[E]), g) {
                        let e = B(c, f, P);
                        L.push(j[e[0]], j[e[1]])
                    }
                    if (O = [...O, {
                            placement: c,
                            overflows: L
                        }], !L.every(e => e <= 0)) {
                        let e = ((null == (o = d.flip) ? void 0 : o.index) || 0) + 1,
                            t = N[e];
                        if (t && ("alignment" !== g || S === _(t) || O.every(e => _(e.placement) !== S || e.overflows[0] > 0))) return {
                            data: {
                                index: e,
                                overflows: O
                            },
                            reset: {
                                placement: t
                            }
                        };
                        let n = null == (l = O.filter(e => e.overflows[0] <= 0).sort((e, t) => e.overflows[1] - t.overflows[1])[0]) ? void 0 : l.placement;
                        if (!n) switch (x) {
                            case "bestFit": {
                                let e = null == (i = O.filter(e => {
                                    if (A) {
                                        let t = _(e.placement);
                                        return t === S || "y" === t
                                    }
                                    return !0
                                }).map(e => [e.placement, e.overflows.filter(e => e > 0).reduce((e, t) => e + t, 0)]).sort((e, t) => e[1] - t[1])[0]) ? void 0 : i[0];
                                e && (n = e);
                                break
                            }
                            case "initialPlacement":
                                n = p
                        }
                        if (c !== n) return {
                            reset: {
                                placement: n
                            }
                        }
                    }
                    return {}
                }
            }
        },
        eV = function(e) {
            return void 0 === e && (e = {}), {
                name: "size",
                options: e,
                async fn(t) {
                    var n, r;
                    let o, l, {
                            placement: i,
                            rects: a,
                            platform: s,
                            elements: u
                        } = t,
                        {
                            apply: c = () => {},
                            ...d
                        } = D(e, t),
                        f = await s.detectOverflow(t, d),
                        p = M(i),
                        m = I(i),
                        v = "y" === _(i),
                        {
                            width: h,
                            height: g
                        } = a.floating;
                    "top" === p || "bottom" === p ? (o = p, l = m === (await (null == s.isRTL ? void 0 : s.isRTL(u.floating)) ? "start" : "end") ? "left" : "right") : (l = p, o = "end" === m ? "top" : "bottom");
                    let y = g - f.top - f.bottom,
                        x = h - f.left - f.right,
                        w = A(g - f[o], y),
                        b = A(h - f[l], x),
                        C = !t.middlewareData.shift,
                        E = w,
                        S = b;
                    if (null != (n = t.middlewareData.shift) && n.enabled.x && (S = x), null != (r = t.middlewareData.shift) && r.enabled.y && (E = y), C && !m) {
                        let e = N(f.left, 0),
                            t = N(f.right, 0),
                            n = N(f.top, 0),
                            r = N(f.bottom, 0);
                        v ? S = h - 2 * (0 !== e || 0 !== t ? e + t : N(f.left, f.right)) : E = g - 2 * (0 !== n || 0 !== r ? n + r : N(f.top, f.bottom))
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
        eU = function(e) {
            return void 0 === e && (e = {}), {
                name: "hide",
                options: e,
                async fn(t) {
                    let {
                        rects: n,
                        platform: r
                    } = t, {
                        strategy: o = "referenceHidden",
                        ...l
                    } = D(e, t);
                    switch (o) {
                        case "referenceHidden": {
                            let e = J(await r.detectOverflow(t, {
                                ...l,
                                elementContext: "reference"
                            }), n.reference);
                            return {
                                data: {
                                    referenceHiddenOffsets: e,
                                    referenceHidden: Q(e)
                                }
                            }
                        }
                        case "escaped": {
                            let e = J(await r.detectOverflow(t, {
                                ...l,
                                altBoundary: !0
                            }), n.floating);
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
                    x: n,
                    y: r,
                    placement: o,
                    rects: l,
                    platform: i,
                    elements: a,
                    middlewareData: s
                } = t, {
                    element: u,
                    padding: c = 0
                } = D(e, t) || {};
                if (null == u) return {};
                let d = Y(c),
                    f = {
                        x: n,
                        y: r
                    },
                    p = H(_(o)),
                    m = F(p),
                    v = await i.getDimensions(u),
                    h = "y" === p,
                    g = h ? "clientHeight" : "clientWidth",
                    y = l.reference[m] + l.reference[p] - f[p] - l.floating[m],
                    x = f[p] - l.reference[p],
                    w = await (null == i.getOffsetParent ? void 0 : i.getOffsetParent(u)),
                    b = w ? w[g] : 0;
                b && await (null == i.isElement ? void 0 : i.isElement(w)) || (b = a.floating[g] || l.floating[m]);
                let C = b / 2 - v[m] / 2 - 1,
                    E = A(d[h ? "top" : "left"], C),
                    S = A(d[h ? "bottom" : "right"], C),
                    R = b - v[m] - S,
                    P = b / 2 - v[m] / 2 + (y / 2 - x / 2),
                    T = N(E, A(P, R)),
                    j = !s.arrow && null != I(o) && P !== T && l.reference[m] / 2 - (P < E ? E : S) - v[m] / 2 < 0,
                    L = j ? P < E ? P - E : P - R : 0;
                return {
                    [p]: f[p] + L,
                    data: {
                        [p]: T,
                        centerOffset: P - T - L,
                        ...j && {
                            alignmentOffset: L
                        }
                    },
                    reset: j
                }
            }
        }),
        eX = function(e) {
            return void 0 === e && (e = {}), {
                options: e,
                fn(t) {
                    let {
                        x: n,
                        y: r,
                        placement: o,
                        rects: l,
                        middlewareData: i
                    } = t, {
                        offset: a = 0,
                        mainAxis: s = !0,
                        crossAxis: u = !0
                    } = D(e, t), c = {
                        x: n,
                        y: r
                    }, d = _(o), f = H(d), p = c[f], m = c[d], v = D(a, t), h = "number" == typeof v ? {
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
                            n = l.reference[f] + l.reference[e] - h.mainAxis;
                        p < t ? p = t : p > n && (p = n)
                    }
                    if (u) {
                        var g, y;
                        let e = "y" === f ? "width" : "height",
                            t = et.has(M(o)),
                            n = l.reference[d] - l.floating[e] + (t && (null == (g = i.offset) ? void 0 : g[d]) || 0) + (t ? 0 : h.crossAxis),
                            r = l.reference[d] + l.reference[e] + (t ? 0 : (null == (y = i.offset) ? void 0 : y[d]) || 0) - (t ? h.crossAxis : 0);
                        m < n ? m = n : m > r && (m = r)
                    }
                    return {
                        [f]: p,
                        [d]: m
                    }
                }
            }
        },
        eY = (e, t, n) => {
            let r = new Map,
                o = {
                    platform: eH,
                    ...n
                },
                l = {
                    ...o.platform,
                    _c: r
                };
            return $(e, t, {
                ...o,
                platform: l
            })
        };
    e.s(["arrow", 0, eK, "autoPlacement", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "autoPlacement",
            options: e,
            async fn(t) {
                var n, r, o, l;
                let {
                    rects: i,
                    middlewareData: a,
                    placement: s,
                    platform: u,
                    elements: c
                } = t, {
                    crossAxis: d = !1,
                    alignment: f,
                    allowedPlacements: p = T,
                    autoAlignment: m = !0,
                    ...v
                } = D(e, t), h = void 0 !== f || p === T ? ((l = f || null) ? [...p.filter(e => I(e) === l), ...p.filter(e => I(e) !== l)] : p.filter(e => M(e) === e)).filter(e => !l || I(e) === l || !!m && W(e) !== e) : p, g = await u.detectOverflow(t, v), y = (null == (n = a.autoPlacement) ? void 0 : n.index) || 0, x = h[y];
                if (null == x) return {};
                let w = B(x, i, await (null == u.isRTL ? void 0 : u.isRTL(c.floating)));
                if (s !== x) return {
                    reset: {
                        placement: h[0]
                    }
                };
                let b = [g[M(x)], g[w[0]], g[w[1]]],
                    C = [...(null == (r = a.autoPlacement) ? void 0 : r.overflows) || [], {
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
                        let t = I(e.placement);
                        return [e.placement, t && d ? e.overflows.slice(0, 2).reduce((e, t) => e + t, 0) : e.overflows[0], e.overflows]
                    }).sort((e, t) => e[1] - t[1]),
                    R = (null == (o = S.filter(e => e[2].slice(0, I(e[0]) ? 2 : 3).every(e => e <= 0))[0]) ? void 0 : o[0]) || S[0][0];
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
    }, "autoUpdate", 0, e_, "computePosition", 0, eY, "flip", 0, ez, "hide", 0, eU, "inline", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "inline",
            options: e,
            async fn(t) {
                let {
                    placement: n,
                    elements: r,
                    rects: o,
                    platform: l,
                    strategy: i
                } = t, {
                    padding: a = 2,
                    x: s,
                    y: u
                } = D(e, t), c = Array.from(await (null == l.getClientRects ? void 0 : l.getClientRects(r.reference)) || []), d = function(e) {
                    let t = e.slice().sort((e, t) => e.y - t.y),
                        n = [],
                        r = null;
                    for (let e = 0; e < t.length; e++) {
                        let o = t[e];
                        !r || o.y - r.y > r.height / 2 ? n.push([o]) : n[n.length - 1].push(o), r = o
                    }
                    return n.map(e => G(ee(e)))
                }(c), f = G(ee(c)), p = Y(a), m = await l.getElementRects({
                    reference: {
                        getBoundingClientRect: function() {
                            if (2 === d.length && d[0].left > d[1].right && null != s && null != u) return d.find(e => s > e.left - p.left && s < e.right + p.right && u > e.top - p.top && u < e.bottom + p.bottom) || f;
                            if (d.length >= 2) {
                                if ("y" === _(n)) {
                                    let e = d[0],
                                        t = d[d.length - 1],
                                        r = "top" === M(n),
                                        o = e.top,
                                        l = t.bottom,
                                        i = r ? e.left : t.left,
                                        a = r ? e.right : t.right;
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
                                let e = "left" === M(n),
                                    t = N(...d.map(e => e.right)),
                                    r = A(...d.map(e => e.left)),
                                    o = d.filter(n => e ? n.left === r : n.right === t),
                                    l = o[0].top,
                                    i = o[o.length - 1].bottom;
                                return {
                                    top: l,
                                    bottom: i,
                                    left: r,
                                    right: t,
                                    width: t - r,
                                    height: i - l,
                                    x: r,
                                    y: l
                                }
                            }
                            return f
                        }
                    },
                    floating: r.floating,
                    strategy: i
                });
                return o.reference.x !== m.reference.x || o.reference.y !== m.reference.y || o.reference.width !== m.reference.width || o.reference.height !== m.reference.height ? {
                    reset: {
                        rects: m
                    }
                } : {}
            }
        }
    }, "limitShift", 0, eX, "offset", 0, eB, "shift", 0, eW, "size", 0, eV], 992486);
    var eG = "u" > typeof document ? o.useLayoutEffect : function() {};

    function eq(e, t) {
        let n, r, o;
        if (e === t) return !0;
        if (typeof e != typeof t) return !1;
        if ("function" == typeof e && e.toString() === t.toString()) return !0;
        if (e && t && "object" == typeof e) {
            if (Array.isArray(e)) {
                if ((n = e.length) !== t.length) return !1;
                for (r = n; 0 != r--;)
                    if (!eq(e[r], t[r])) return !1;
                return !0
            }
            if ((n = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (r = n; 0 != r--;)
                if (!({}).hasOwnProperty.call(t, o[r])) return !1;
            for (r = n; 0 != r--;) {
                let n = o[r];
                if (("_owner" !== n || !e.$$typeof) && !eq(e[n], t[n])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function eZ(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function e$(e, t) {
        let n = eZ(e);
        return Math.round(t * n) / n
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
            strategy: n = "absolute",
            middleware: r = [],
            platform: l,
            elements: {
                reference: i,
                floating: a
            } = {},
            transform: s = !0,
            whileElementsMounted: u,
            open: c
        } = e, [f, p] = o.useState({
            x: 0,
            y: 0,
            strategy: n,
            placement: t,
            middlewareData: {},
            isPositioned: !1
        }), [m, v] = o.useState(r);
        eq(m, r) || v(r);
        let [h, g] = o.useState(null), [y, x] = o.useState(null), w = o.useCallback(e => {
            e !== S.current && (S.current = e, g(e))
        }, []), b = o.useCallback(e => {
            e !== R.current && (R.current = e, x(e))
        }, []), C = i || h, E = a || y, S = o.useRef(null), R = o.useRef(null), P = o.useRef(f), T = null != u, A = eJ(u), N = eJ(l), j = eJ(c), L = o.useCallback(() => {
            if (!S.current || !R.current) return;
            let e = {
                placement: t,
                strategy: n,
                middleware: m
            };
            N.current && (e.platform = N.current), eY(S.current, R.current, e).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== j.current
                };
                O.current && !eq(P.current, t) && (P.current = t, d.flushSync(() => {
                    p(t)
                }))
            })
        }, [m, t, n, N, j]);
        eG(() => {
            !1 === c && P.current.isPositioned && (P.current.isPositioned = !1, p(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [c]);
        let O = o.useRef(!1);
        eG(() => (O.current = !0, () => {
            O.current = !1
        }), []), eG(() => {
            if (C && (S.current = C), E && (R.current = E), C && E) {
                if (A.current) return A.current(C, E, L);
                L()
            }
        }, [C, E, L, A, T]);
        let k = o.useMemo(() => ({
                reference: S,
                floating: R,
                setReference: w,
                setFloating: b
            }), [w, b]),
            D = o.useMemo(() => ({
                reference: C,
                floating: E
            }), [C, E]),
            M = o.useMemo(() => {
                let e = {
                    position: n,
                    left: 0,
                    top: 0
                };
                if (!D.floating) return e;
                let t = e$(D.floating, f.x),
                    r = e$(D.floating, f.y);
                return s ? {
                    ...e,
                    transform: "translate(" + t + "px, " + r + "px)",
                    ...eZ(D.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: n,
                    left: t,
                    top: r
                }
            }, [n, s, D.floating, f.x, f.y]);
        return o.useMemo(() => ({
            ...f,
            update: L,
            refs: k,
            elements: D,
            floatingStyles: M
        }), [f, L, k, D, M])
    }
    let e0 = (e, t) => {
            let n = eB(e);
            return {
                name: n.name,
                fn: n.fn,
                options: [e, t]
            }
        },
        e1 = (e, t) => {
            let n = eW(e);
            return {
                name: n.name,
                fn: n.fn,
                options: [e, t]
            }
        },
        e2 = (e, t) => ({
            fn: eX(e).fn,
            options: [e, t]
        }),
        e6 = (e, t) => {
            let n = ez(e);
            return {
                name: n.name,
                fn: n.fn,
                options: [e, t]
            }
        },
        e4 = (e, t) => {
            let n = eV(e);
            return {
                name: n.name,
                fn: n.fn,
                options: [e, t]
            }
        },
        e9 = (e, t) => {
            let n = eU(e);
            return {
                name: n.name,
                fn: n.fn,
                options: [e, t]
            }
        },
        e3 = (e, t) => {
            let n = {
                name: "arrow",
                options: e,
                fn(t) {
                    let {
                        element: n,
                        padding: r
                    } = "function" == typeof e ? e(t) : e;
                    return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? eK({
                        element: n.current,
                        padding: r
                    }).fn(t) : {} : n ? eK({
                        element: n,
                        padding: r
                    }).fn(t) : {}
                }
            };
            return {
                name: n.name,
                fn: n.fn,
                options: [e, t]
            }
        };
    e.s(["arrow", 0, e3, "flip", 0, e6, "hide", 0, e9, "limitShift", 0, e2, "offset", 0, e0, "shift", 0, e1, "size", 0, e4, "useFloating", 0, eQ], 297452);
    var e5 = o.forwardRef((e, t) => {
        let {
            children: n,
            width: r = 10,
            height: o = 5,
            ...l
        } = e;
        return (0, u.jsx)(h.svg, {
            ...l,
            ref: t,
            width: r,
            height: o,
            viewBox: "0 0 30 10",
            preserveAspectRatio: "none",
            children: e.asChild ? n : (0, u.jsx)("polygon", {
                points: "0,0 30,0 15,10"
            })
        })
    });
    e5.displayName = "Arrow";
    var e8 = "Popper",
        [e7, te] = c(e8),
        [tt, tn] = e7(e8),
        tr = e => {
            let {
                __scopePopper: t,
                children: n
            } = e, [r, l] = o.useState(null);
            return (0, u.jsx)(tt, {
                scope: t,
                anchor: r,
                onAnchorChange: l,
                children: n
            })
        };
    tr.displayName = e8;
    var to = "PopperAnchor",
        tl = o.forwardRef((e, t) => {
            let {
                __scopePopper: n,
                virtualRef: r,
                ...l
            } = e, i = tn(to, n), a = o.useRef(null), c = s(t, a);
            return o.useEffect(() => {
                i.onAnchorChange((null == r ? void 0 : r.current) || a.current)
            }), r ? null : (0, u.jsx)(h.div, {
                ...l,
                ref: c
            })
        });
    tl.displayName = to;
    var ti = "PopperContent",
        [ta, ts] = e7(ti),
        tu = o.forwardRef((e, t) => {
            var n, r, l, i, a, c, d, f;
            let {
                __scopePopper: p,
                side: m = "bottom",
                sideOffset: v = 0,
                align: y = "center",
                alignOffset: x = 0,
                arrowPadding: w = 0,
                avoidCollisions: b = !0,
                collisionBoundary: C = [],
                collisionPadding: S = 0,
                sticky: R = "partial",
                hideWhenDetached: P = !1,
                updatePositionStrategy: T = "optimized",
                onPlaced: A,
                ...N
            } = e, j = tn(ti, p), [L, O] = o.useState(null), k = s(t, e => O(e)), [D, M] = o.useState(null), I = function(e) {
                let [t, n] = o.useState(void 0);
                return E(() => {
                    if (e) {
                        n({
                            width: e.offsetWidth,
                            height: e.offsetHeight
                        });
                        let t = new ResizeObserver(t => {
                            let r, o;
                            if (!Array.isArray(t) || !t.length) return;
                            let l = t[0];
                            if ("borderBoxSize" in l) {
                                let e = l.borderBoxSize,
                                    t = Array.isArray(e) ? e[0] : e;
                                r = t.inlineSize, o = t.blockSize
                            } else r = e.offsetWidth, o = e.offsetHeight;
                            n({
                                width: r,
                                height: o
                            })
                        });
                        return t.observe(e, {
                            box: "border-box"
                        }), () => t.unobserve(e)
                    }
                    n(void 0)
                }, [e]), t
            }(D), H = null != (n = null == I ? void 0 : I.width) ? n : 0, F = null != (r = null == I ? void 0 : I.height) ? r : 0, _ = "number" == typeof S ? S : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...S
            }, B = Array.isArray(C) ? C : [C], W = B.length > 0, z = {
                padding: _,
                boundary: B.filter(tp),
                altBoundary: W
            }, {
                refs: V,
                floatingStyles: U,
                placement: K,
                isPositioned: X,
                middlewareData: Y
            } = eQ({
                strategy: "fixed",
                placement: m + ("center" !== y ? "-" + y : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return e_(...t, {
                        animationFrame: "always" === T
                    })
                },
                elements: {
                    reference: j.anchor
                },
                middleware: [e0({
                    mainAxis: v + F,
                    alignmentAxis: x
                }), b && e1({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === R ? e2() : void 0,
                    ...z
                }), b && e6({
                    ...z
                }), e4({
                    ...z,
                    apply: e => {
                        let {
                            elements: t,
                            rects: n,
                            availableWidth: r,
                            availableHeight: o
                        } = e, {
                            width: l,
                            height: i
                        } = n.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(r, "px")), a.setProperty("--radix-popper-available-height", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(i, "px"))
                    }
                }), D && e3({
                    element: D,
                    padding: w
                }), tm({
                    arrowWidth: H,
                    arrowHeight: F
                }), P && e9({
                    strategy: "referenceHidden",
                    ...z
                })]
            }), [G, q] = tv(K), Z = g(A);
            E(() => {
                X && (null == Z || Z())
            }, [X, Z]);
            let $ = null == (l = Y.arrow) ? void 0 : l.x,
                J = null == (i = Y.arrow) ? void 0 : i.y,
                Q = (null == (a = Y.arrow) ? void 0 : a.centerOffset) !== 0,
                [ee, et] = o.useState();
            return E(() => {
                L && et(window.getComputedStyle(L).zIndex)
            }, [L]), (0, u.jsx)("div", {
                ref: V.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...U,
                    transform: X ? U.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: ee,
                    "--radix-popper-transform-origin": [null == (c = Y.transformOrigin) ? void 0 : c.x, null == (d = Y.transformOrigin) ? void 0 : d.y].join(" "),
                    ...(null == (f = Y.hide) ? void 0 : f.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, u.jsx)(ta, {
                    scope: p,
                    placedSide: G,
                    onArrowChange: M,
                    arrowX: $,
                    arrowY: J,
                    shouldHideArrow: Q,
                    children: (0, u.jsx)(h.div, {
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
    tu.displayName = ti;
    var tc = "PopperArrow",
        td = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        tf = o.forwardRef(function(e, t) {
            let {
                __scopePopper: n,
                ...r
            } = e, o = ts(tc, n), l = td[o.placedSide];
            return (0, u.jsx)("span", {
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
                children: (0, u.jsx)(e5, {
                    ...r,
                    ref: t,
                    style: {
                        ...r.style,
                        display: "block"
                    }
                })
            })
        });

    function tp(e) {
        return null !== e
    }
    tf.displayName = tc;
    var tm = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var n, r, o, l, i;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, m] = tv(a), v = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], h = (null != (n = null == (l = u.arrow) ? void 0 : l.x) ? n : 0) + d / 2, g = (null != (r = null == (i = u.arrow) ? void 0 : i.y) ? r : 0) + f / 2, y = "", x = "";
            return "bottom" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(-f, "px")) : "top" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), x = c ? v : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), x = c ? v : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: x
                }
            }
        }
    });

    function tv(e) {
        let [t, n = "center"] = e.split("-");
        return [t, n]
    }
    var th = o.forwardRef((e, t) => {
        var n, r;
        let {
            container: l,
            ...i
        } = e, [a, s] = o.useState(!1);
        E(() => s(!0), []);
        let c = l || a && (null == (r = globalThis) || null == (n = r.document) ? void 0 : n.body);
        return c ? d.default.createPortal((0, u.jsx)(h.div, {
            ...i,
            ref: t
        }), c) : null
    });
    th.displayName = "Portal";
    var tg = e => {
        var t, n, r;
        let l, i, {
                present: a,
                children: u
            } = e,
            c = function(e) {
                var t, n;
                let [r, l] = o.useState(), i = o.useRef({}), a = o.useRef(e), s = o.useRef("none"), [u, c] = (t = e ? "mounted" : "unmounted", n = {
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
                    let r = n[e][t];
                    return null != r ? r : e
                }, t));
                return o.useEffect(() => {
                    let e = ty(i.current);
                    s.current = "mounted" === u ? e : "none"
                }, [u]), E(() => {
                    let t = i.current,
                        n = a.current;
                    if (n !== e) {
                        let r = s.current,
                            o = ty(t);
                        e ? c("MOUNT") : "none" === o || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : n && r !== o ? c("ANIMATION_OUT") : c("UNMOUNT"), a.current = e
                    }
                }, [e, c]), E(() => {
                    if (r) {
                        var e;
                        let t, n = null != (e = r.ownerDocument.defaultView) ? e : window,
                            o = e => {
                                let o = ty(i.current).includes(e.animationName);
                                if (e.target === r && o && (c("ANIMATION_END"), !a.current)) {
                                    let e = r.style.animationFillMode;
                                    r.style.animationFillMode = "forwards", t = n.setTimeout(() => {
                                        "forwards" === r.style.animationFillMode && (r.style.animationFillMode = e)
                                    })
                                }
                            },
                            l = e => {
                                e.target === r && (s.current = ty(i.current))
                            };
                        return r.addEventListener("animationstart", l), r.addEventListener("animationcancel", o), r.addEventListener("animationend", o), () => {
                            n.clearTimeout(t), r.removeEventListener("animationstart", l), r.removeEventListener("animationcancel", o), r.removeEventListener("animationend", o)
                        }
                    }
                    c("ANIMATION_END")
                }, [r, c]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(u),
                    ref: o.useCallback(e => {
                        e && (i.current = getComputedStyle(e)), l(e)
                    }, [])
                }
            }(a),
            d = "function" == typeof u ? u({
                present: c.isPresent
            }) : o.Children.only(u),
            f = s(c.ref, (i = (l = null == (n = Object.getOwnPropertyDescriptor((t = d).props, "ref")) ? void 0 : n.get) && "isReactWarning" in l && l.isReactWarning) ? t.ref : (i = (l = null == (r = Object.getOwnPropertyDescriptor(t, "ref")) ? void 0 : r.get) && "isReactWarning" in l && l.isReactWarning) ? t.props.ref : t.props.ref || t.ref);
        return "function" == typeof u || c.isPresent ? o.cloneElement(d, {
            ref: f
        }) : null
    };

    function ty(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    tg.displayName = "Presence";
    var tx = o.forwardRef((e, t) => (0, u.jsx)(h.span, {
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
    tx.displayName = "VisuallyHidden";
    var [tw, tb] = c("Tooltip", [te]), tC = te(), tE = "TooltipProvider", tS = "tooltip.open", [tR, tP] = tw(tE), tT = e => {
        let {
            __scopeTooltip: t,
            delayDuration: n = 700,
            skipDelayDuration: r = 300,
            disableHoverableContent: l = !1,
            children: i
        } = e, [a, s] = o.useState(!0), c = o.useRef(!1), d = o.useRef(0);
        return o.useEffect(() => {
            let e = d.current;
            return () => window.clearTimeout(e)
        }, []), (0, u.jsx)(tR, {
            scope: t,
            isOpenDelayed: a,
            delayDuration: n,
            onOpen: o.useCallback(() => {
                window.clearTimeout(d.current), s(!1)
            }, []),
            onClose: o.useCallback(() => {
                window.clearTimeout(d.current), d.current = window.setTimeout(() => s(!0), r)
            }, [r]),
            isPointerInTransitRef: c,
            onPointerInTransitChange: o.useCallback(e => {
                c.current = e
            }, []),
            disableHoverableContent: l,
            children: i
        })
    };
    tT.displayName = tE;
    var tA = "Tooltip",
        [tN, tj] = tw(tA),
        tL = e => {
            let {
                __scopeTooltip: t,
                children: n,
                open: r,
                defaultOpen: l = !1,
                onOpenChange: i,
                disableHoverableContent: a,
                delayDuration: s
            } = e, c = tP(tA, e.__scopeTooltip), d = tC(t), [f, p] = o.useState(null), m = function() {
                let [e, t] = o.useState(S());
                return E(() => {
                    t(e => null != e ? e : String(R++))
                }, [void 0]), e ? "radix-".concat(e) : ""
            }(), v = o.useRef(0), h = null != a ? a : c.disableHoverableContent, y = null != s ? s : c.delayDuration, x = o.useRef(!1), [w = !1, b] = function(e) {
                let {
                    prop: t,
                    defaultProp: n,
                    onChange: r = () => {}
                } = e, [l, i] = function(e) {
                    let {
                        defaultProp: t,
                        onChange: n
                    } = e, r = o.useState(t), [l] = r, i = o.useRef(l), a = g(n);
                    return o.useEffect(() => {
                        i.current !== l && (a(l), i.current = l)
                    }, [l, i, a]), r
                }({
                    defaultProp: n,
                    onChange: r
                }), a = void 0 !== t, s = a ? t : l, u = g(r);
                return [s, o.useCallback(e => {
                    if (a) {
                        let n = "function" == typeof e ? e(t) : e;
                        n !== t && u(n)
                    } else i(e)
                }, [a, t, i, u])]
            }({
                prop: r,
                defaultProp: l,
                onChange: e => {
                    e ? (c.onOpen(), document.dispatchEvent(new CustomEvent(tS))) : c.onClose(), null == i || i(e)
                }
            }), C = o.useMemo(() => w ? x.current ? "delayed-open" : "instant-open" : "closed", [w]), P = o.useCallback(() => {
                window.clearTimeout(v.current), v.current = 0, x.current = !1, b(!0)
            }, [b]), T = o.useCallback(() => {
                window.clearTimeout(v.current), v.current = 0, b(!1)
            }, [b]), A = o.useCallback(() => {
                window.clearTimeout(v.current), v.current = window.setTimeout(() => {
                    x.current = !0, b(!0), v.current = 0
                }, y)
            }, [y, b]);
            return o.useEffect(() => () => {
                v.current && (window.clearTimeout(v.current), v.current = 0)
            }, []), (0, u.jsx)(tr, {
                ...d,
                children: (0, u.jsx)(tN, {
                    scope: t,
                    contentId: m,
                    open: w,
                    stateAttribute: C,
                    trigger: f,
                    onTriggerChange: p,
                    onTriggerEnter: o.useCallback(() => {
                        c.isOpenDelayed ? A() : P()
                    }, [c.isOpenDelayed, A, P]),
                    onTriggerLeave: o.useCallback(() => {
                        h ? T() : (window.clearTimeout(v.current), v.current = 0)
                    }, [T, h]),
                    onOpen: P,
                    onClose: T,
                    disableHoverableContent: h,
                    children: n
                })
            })
        };
    tL.displayName = tA;
    var tO = "TooltipTrigger",
        tk = o.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                ...r
            } = e, i = tj(tO, n), a = tP(tO, n), c = tC(n), d = s(t, o.useRef(null), i.onTriggerChange), f = o.useRef(!1), p = o.useRef(!1), m = o.useCallback(() => f.current = !1, []);
            return o.useEffect(() => () => document.removeEventListener("pointerup", m), [m]), (0, u.jsx)(tl, {
                asChild: !0,
                ...c,
                children: (0, u.jsx)(h.button, {
                    "aria-describedby": i.open ? i.contentId : void 0,
                    "data-state": i.stateAttribute,
                    ...r,
                    ref: d,
                    onPointerMove: l(e.onPointerMove, e => {
                        "touch" !== e.pointerType && (p.current || a.isPointerInTransitRef.current || (i.onTriggerEnter(), p.current = !0))
                    }),
                    onPointerLeave: l(e.onPointerLeave, () => {
                        i.onTriggerLeave(), p.current = !1
                    }),
                    onPointerDown: l(e.onPointerDown, () => {
                        f.current = !0, document.addEventListener("pointerup", m, {
                            once: !0
                        })
                    }),
                    onFocus: l(e.onFocus, () => {
                        f.current || i.onOpen()
                    }),
                    onBlur: l(e.onBlur, i.onClose),
                    onClick: l(e.onClick, i.onClose)
                })
            })
        });
    tk.displayName = tO;
    var tD = "TooltipPortal",
        [tM, tI] = tw(tD, {
            forceMount: void 0
        }),
        tH = e => {
            let {
                __scopeTooltip: t,
                forceMount: n,
                children: r,
                container: o
            } = e, l = tj(tD, t);
            return (0, u.jsx)(tM, {
                scope: t,
                forceMount: n,
                children: (0, u.jsx)(tg, {
                    present: n || l.open,
                    children: (0, u.jsx)(th, {
                        asChild: !0,
                        container: o,
                        children: r
                    })
                })
            })
        };
    tH.displayName = tD;
    var tF = "TooltipContent",
        t_ = o.forwardRef((e, t) => {
            let n = tI(tF, e.__scopeTooltip),
                {
                    forceMount: r = n.forceMount,
                    side: o = "top",
                    ...l
                } = e,
                i = tj(tF, e.__scopeTooltip);
            return (0, u.jsx)(tg, {
                present: r || i.open,
                children: i.disableHoverableContent ? (0, u.jsx)(tV, {
                    side: o,
                    ...l,
                    ref: t
                }) : (0, u.jsx)(tB, {
                    side: o,
                    ...l,
                    ref: t
                })
            })
        }),
        tB = o.forwardRef((e, t) => {
            let n = tj(tF, e.__scopeTooltip),
                r = tP(tF, e.__scopeTooltip),
                l = o.useRef(null),
                i = s(t, l),
                [a, c] = o.useState(null),
                {
                    trigger: d,
                    onClose: f
                } = n,
                p = l.current,
                {
                    onPointerInTransitChange: m
                } = r,
                v = o.useCallback(() => {
                    c(null), m(!1)
                }, [m]),
                h = o.useCallback((e, t) => {
                    let n, r = e.currentTarget,
                        o = {
                            x: e.clientX,
                            y: e.clientY
                        },
                        l = function(e, t) {
                            let n = Math.abs(t.top - e.y),
                                r = Math.abs(t.bottom - e.y),
                                o = Math.abs(t.right - e.x),
                                l = Math.abs(t.left - e.x);
                            switch (Math.min(n, r, o, l)) {
                                case l:
                                    return "left";
                                case o:
                                    return "right";
                                case n:
                                    return "top";
                                case r:
                                    return "bottom";
                                default:
                                    throw Error("unreachable")
                            }
                        }(o, r.getBoundingClientRect());
                    c(((n = [... function(e, t) {
                        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5,
                            r = [];
                        switch (t) {
                            case "top":
                                r.push({
                                    x: e.x - n,
                                    y: e.y + n
                                }, {
                                    x: e.x + n,
                                    y: e.y + n
                                });
                                break;
                            case "bottom":
                                r.push({
                                    x: e.x - n,
                                    y: e.y - n
                                }, {
                                    x: e.x + n,
                                    y: e.y - n
                                });
                                break;
                            case "left":
                                r.push({
                                    x: e.x + n,
                                    y: e.y - n
                                }, {
                                    x: e.x + n,
                                    y: e.y + n
                                });
                                break;
                            case "right":
                                r.push({
                                    x: e.x - n,
                                    y: e.y - n
                                }, {
                                    x: e.x - n,
                                    y: e.y + n
                                })
                        }
                        return r
                    }(o, l), ... function(e) {
                        let {
                            top: t,
                            right: n,
                            bottom: r,
                            left: o
                        } = e;
                        return [{
                            x: o,
                            y: t
                        }, {
                            x: n,
                            y: t
                        }, {
                            x: n,
                            y: r
                        }, {
                            x: o,
                            y: r
                        }]
                    }(t.getBoundingClientRect())].slice()).sort((e, t) => e.x < t.x ? -1 : e.x > t.x ? 1 : e.y < t.y ? -1 : 1 * !!(e.y > t.y)), function(e) {
                        if (e.length <= 1) return e.slice();
                        let t = [];
                        for (let n = 0; n < e.length; n++) {
                            let r = e[n];
                            for (; t.length >= 2;) {
                                let e = t[t.length - 1],
                                    n = t[t.length - 2];
                                if ((e.x - n.x) * (r.y - n.y) >= (e.y - n.y) * (r.x - n.x)) t.pop();
                                else break
                            }
                            t.push(r)
                        }
                        t.pop();
                        let n = [];
                        for (let t = e.length - 1; t >= 0; t--) {
                            let r = e[t];
                            for (; n.length >= 2;) {
                                let e = n[n.length - 1],
                                    t = n[n.length - 2];
                                if ((e.x - t.x) * (r.y - t.y) >= (e.y - t.y) * (r.x - t.x)) n.pop();
                                else break
                            }
                            n.push(r)
                        }
                        return (n.pop(), 1 === t.length && 1 === n.length && t[0].x === n[0].x && t[0].y === n[0].y) ? t : t.concat(n)
                    }(n))), m(!0)
                }, [m]);
            return o.useEffect(() => () => v(), [v]), o.useEffect(() => {
                if (d && p) {
                    let e = e => h(e, p),
                        t = e => h(e, d);
                    return d.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t), () => {
                        d.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                    }
                }
            }, [d, p, h, v]), o.useEffect(() => {
                if (a) {
                    let e = e => {
                        let t = e.target,
                            n = {
                                x: e.clientX,
                                y: e.clientY
                            },
                            r = (null == d ? void 0 : d.contains(t)) || (null == p ? void 0 : p.contains(t)),
                            o = ! function(e, t) {
                                let {
                                    x: n,
                                    y: r
                                } = e, o = !1;
                                for (let e = 0, l = t.length - 1; e < t.length; l = e++) {
                                    let i = t[e].x,
                                        a = t[e].y,
                                        s = t[l].x,
                                        u = t[l].y;
                                    a > r != u > r && n < (s - i) * (r - a) / (u - a) + i && (o = !o)
                                }
                                return o
                            }(n, a);
                        r ? v() : o && (v(), f())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [d, p, a, f, v]), (0, u.jsx)(tV, {
                ...e,
                ref: i
            })
        }),
        [tW, tz] = tw(tA, {
            isInside: !1
        }),
        tV = o.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                children: r,
                "aria-label": l,
                onEscapeKeyDown: i,
                onPointerDownOutside: a,
                ...s
            } = e, c = tj(tF, n), d = tC(n), {
                onClose: f
            } = c;
            return o.useEffect(() => (document.addEventListener(tS, f), () => document.removeEventListener(tS, f)), [f]), o.useEffect(() => {
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
            }, [c.trigger, f]), (0, u.jsx)(w, {
                asChild: !0,
                disableOutsidePointerEvents: !1,
                onEscapeKeyDown: i,
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
                    children: [(0, u.jsx)(m, {
                        children: r
                    }), (0, u.jsx)(tW, {
                        scope: n,
                        isInside: !0,
                        children: (0, u.jsx)(tx, {
                            id: c.contentId,
                            role: "tooltip",
                            children: l || r
                        })
                    })]
                })
            })
        });
    t_.displayName = tF;
    var tU = "TooltipArrow",
        tK = o.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                ...r
            } = e, o = tC(n);
            return tz(tU, n).isInside ? null : (0, u.jsx)(tf, {
                ...o,
                ...r,
                ref: t
            })
        });
    tK.displayName = tU, e.s(["Arrow", 0, tK, "Content", 0, t_, "Portal", 0, tH, "Provider", 0, tT, "Root", 0, tL, "Trigger", 0, tk], 989665)
}, 199786, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(723570);
    t[" useEffectEvent ".trim().toString()], t[" useInsertionEffect ".trim().toString()];
    var r = t[" useInsertionEffect ".trim().toString()] || n.useLayoutEffect;
    Symbol("RADIX:SYNC_STATE"), e.s(["useControllableState", 0, function(e) {
        let {
            prop: n,
            defaultProp: o,
            onChange: l = () => {},
            caller: i
        } = e, [a, s, u] = function(e) {
            let {
                defaultProp: n,
                onChange: o
            } = e, [l, i] = t.useState(n), a = t.useRef(l), s = t.useRef(o);
            return r(() => {
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
        }), c = void 0 !== n, d = c ? n : a;
        {
            let e = t.useRef(void 0 !== n);
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
                let r = "function" == typeof e ? e(n) : e;
                if (r !== n) {
                    var t;
                    null == (t = u.current) || t.call(u, r)
                }
            } else s(e)
        }, [c, n, s, u])]
    }], 199786)
}, 300792, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["usePrevious", 0, function(e) {
        let n = t.useRef({
            value: e,
            previous: e
        });
        return t.useMemo(() => (n.current.value !== e && (n.current.previous = n.current.value, n.current.value = e), n.current.previous), [e])
    }])
}, 692166, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(723570);
    e.s(["useSize", 0, function(e) {
        let [r, o] = t.useState(void 0);
        return (0, n.useLayoutEffect)(() => {
            if (e) {
                o({
                    width: e.offsetWidth,
                    height: e.offsetHeight
                });
                let t = new ResizeObserver(t => {
                    let n, r;
                    if (!Array.isArray(t) || !t.length) return;
                    let l = t[0];
                    if ("borderBoxSize" in l) {
                        let e = l.borderBoxSize,
                            t = Array.isArray(e) ? e[0] : e;
                        n = t.inlineSize, r = t.blockSize
                    } else n = e.offsetWidth, r = e.offsetHeight;
                    o({
                        width: n,
                        height: r
                    })
                });
                return t.observe(e, {
                    box: "border-box"
                }), () => t.unobserve(e)
            }
            o(void 0)
        }, [e]), r
    }])
}, 382368, e => {
    "use strict";
    var t = e.i(472536),
        n = e.i(579325),
        r = e.i(663932),
        o = e.i(618691),
        l = e.i(197649),
        i = e.i(416340),
        a = e.i(563921);
    let s = (0, i.createContext)(null),
        u = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        c = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        d = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        f = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        p = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        m = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        v = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        h = (0, i.forwardRef)((e, h) => {
            let {
                label: g,
                labelTooltip: y,
                ariaLabelledBy: x,
                ariaLabel: w,
                className: b,
                size: C,
                variant: E = "Standard",
                value: S,
                placeholder: R,
                isDisabled: P,
                hasError: T,
                hint: A,
                onValueChange: N,
                onOpenChange: j,
                children: L
            } = e, O = (0, n.default)(), k = (0, i.useMemo)(() => ({
                size: C
            }), [C]), D = g ? i.default.createElement("span", {
                id: O,
                className: (0, l.default)(d[C], "content-emphasis")
            }, g) : null;
            return i.default.createElement(s.Provider, {
                value: k
            }, i.default.createElement("div", {
                className: (0, l.default)("flex flex-col", P && ["opacity-[0.5]", "pointer-events-none"], p[C], b)
            }, D && (y ? i.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, D, i.default.createElement(r.LabelTooltip, y)) : D), i.default.createElement(a.Root, {
                value: S,
                disabled: P,
                onValueChange: N,
                onOpenChange: j
            }, i.default.createElement(a.Trigger, {
                className: (0, l.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", o.INPUT_BACKGROUND_BY_VARIANT[E], o.INPUT_STROKE_BY_VARIANT[E], m[C], v[C], c[C], f[C], T ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === S ? "content-muted" : "content-default"),
                ref: h,
                "aria-labelledby": g ? O : x,
                "aria-label": w
            }, i.default.createElement(t.StateLayer, null), i.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, i.default.createElement(a.Value, {
                placeholder: R
            })), i.default.createElement(a.Icon, {
                className: (0, l.default)(u[C], "icon icon-regular-chevron-large-down content-default")
            })), i.default.createElement(a.Portal, null, i.default.createElement(a.Content, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, L))), A && i.default.createElement("span", {
                className: (0, l.default)("text-caption-small", {
                    "content-system-alert": T,
                    "content-default": !T
                })
            }, A)))
        });
    h.displayName = "Dropdown", e.s(["Dropdown", 0, h, "DropdownContext", 0, s])
}, 678547, e => {
    "use strict";
    var t = e.i(472536),
        n = e.i(382368),
        r = e.i(197649),
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
        } = e, d = (0, o.useContext)(n.DropdownContext), f = d ? "dropdown" : "standalone", p = null != (t = null != c ? c : null == d ? void 0 : d.size) ? t : "Medium", m = (0, o.useMemo)(() => ({
            size: p,
            mode: f
        }), [p, f]), v = (0, r.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", s[p], u), g = "standalone" === f ? o.default.createElement(a.Root, {
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
        let n, {
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
            A = (0, r.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", m[P], c[P], d[P], f[P], v[P], w && "opacity-[0.5]", w && "pointer-events-none", b),
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
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", p[P])
        }, N, y && o.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, y)), x);
        if (E) {
            let {
                as: e,
                ...r
            } = R, i = o.default.Children.only(S), a = void 0 === h && i.props.children;
            n = o.default.createElement(l.Slot, {
                ...r,
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
                ...r
            } = R;
            n = o.default.createElement("a", {
                ...r,
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
            n = o.default.createElement("button", {
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
        }, n) : o.default.createElement(a.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: s
        }, n)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: n,
            leading: l,
            trailing: i,
            disabled: a,
            className: s
        } = e, {
            size: u
        } = g(), v = (0, r.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", m[u], c[u], d[u], f[u], a && "opacity-[0.5]", s);
        return o.default.createElement("div", {
            role: "none",
            className: v
        }, l, o.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", p[u])
        }, o.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), n && o.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, n)), i)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: n
        } = e, {
            size: l
        } = g();
        return o.default.createElement("div", {
            role: "group",
            className: (0, r.default)(u[l], n)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return o.default.createElement("div", {
            role: "separator",
            className: (0, r.default)("foundation-web-menu-separator", t)
        })
    }])
}, 838775, e => {
    "use strict";
    var t = e.i(197649),
        n = e.i(416340),
        r = e.i(734463);
    let o = e => {
        var t, n, r, o, l, i;
        let a = null != (t = null == (r = (o = window).matchMedia) || null == (n = r.call(o, "(pointer: coarse)")) ? void 0 : n.matches) && t,
            s = null == (l = document.activeElement) ? void 0 : l.matches(":focus-visible");
        if (a && !s) return void e.preventDefault();
        let u = null == (i = e.currentTarget) ? void 0 : i.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        u && (e.preventDefault(), u.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: o,
            onOpenChange: l,
            children: i
        } = e;
        return n.createElement(r.Root, {
            open: t,
            defaultOpen: o,
            onOpenChange: l
        }, i)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: t,
            className: o,
            children: l
        } = e;
        return n.createElement(r.Anchor, {
            asChild: t,
            className: o
        }, l)
    }, "PopoverClose", 0, function(e) {
        let {
            children: t,
            ...o
        } = e;
        return n.createElement(r.Close, o, t)
    }, "PopoverContent", 0, function(e) {
        let {
            side: l = "bottom",
            align: i = "center",
            sideOffset: a = 4,
            className: s,
            children: u,
            ariaLabel: c,
            onOpenAutoFocus: d,
            ...f
        } = e;
        return n.createElement(r.Portal, null, n.createElement(r.Content, {
            side: l,
            align: i,
            sideOffset: a,
            ...f,
            "aria-label": null != c ? c : f["aria-label"],
            onOpenAutoFocus: null != d ? d : o,
            className: (0, t.default)("foundation-web-portal-zindex", s)
        }, u))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: o,
            className: l,
            children: i
        } = e;
        return n.createElement(r.Trigger, {
            asChild: t,
            disabled: o,
            className: l
        }, i)
    }])
}, 23696, e => {
    "use strict";
    var t = e.i(643456),
        n = e.i(197649),
        r = e.i(416340),
        o = e.i(989665);
    e.s(["Tooltip", 0, function(e) {
        let {
            position: l,
            hasBeak: i = !0,
            title: a,
            description: s,
            ariaLabel: u,
            delayDurationMs: c = 500,
            children: d,
            open: f,
            onOpenChange: p,
            contentClassName: m
        } = e, [v, h] = l.split("-"), g = null != u ? u : "string" == typeof a && null == s ? a : void 0;
        return r.createElement(o.Provider, {
            delayDuration: c
        }, r.createElement(o.Root, {
            open: f,
            onOpenChange: p
        }, d, r.createElement(o.Portal, null, r.createElement(o.Content, {
            side: v,
            align: h,
            "aria-label": g,
            className: (0, n.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", m),
            sideOffset: 5
        }, i && r.createElement(o.Arrow, {
            asChild: !0
        }, r.createElement(t.Beak, {
            className: "content-[var(--inverse-surface-0)]"
        })), r.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, r.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, a), s && r.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, s))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: n,
            className: l
        } = e;
        return r.createElement(o.Trigger, {
            asChild: n,
            className: l
        }, t)
    }])
}, 643456, e => {
    "use strict";
    var t = e.i(197649),
        n = e.i(416340);
    e.s(["Beak", 0, function(e) {
        let {
            className: r
        } = e;
        return n.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, t.default)("block", r),
            style: {
                marginTop: -1
            }
        }, n.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }])
}, 663932, e => {
    "use strict";
    var t = e.i(725074),
        n = e.i(23696),
        r = e.i(416340);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: o,
            description: l,
            position: i = "top-center"
        } = e;
        return r.default.createElement(n.Tooltip, {
            position: i,
            title: o,
            description: l
        }, r.default.createElement(n.TooltipTrigger, {
            asChild: !0
        }, r.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": o,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, r.default.createElement(t.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }])
}, 618691, e => {
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
}]);

//# debugId=1407cfde-a13b-d4ec-3ae1-bf58f348cfc7
//# sourceMappingURL=38ti9juakrbpd.js.map
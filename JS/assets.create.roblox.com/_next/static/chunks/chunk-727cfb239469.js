;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "ffd52785-16ee-bc1a-118a-586ddf0fbb46")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 790067, 292123, e => {
    "use strict";
    e.s(["f", 0, function(e, t) {
        let [r, n] = t;
        return Math.min(n, Math.max(r, e))
    }], 790067);
    var t = e.i(643766),
        r = e.i(859726),
        n = e.i(120297),
        l = e.i(393225),
        o = e.i(785517);
    e.s(["f", 0, function(e) {
        let a = e + "CollectionProvider",
            [i, s] = (0, r.c)(a),
            [c, d] = i(a, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            u = e => {
                let {
                    scope: r,
                    children: n
                } = e, l = t.default.useRef(null), a = t.default.useRef(new Map).current;
                return (0, o.jsx)(c, {
                    scope: r,
                    itemMap: a,
                    collectionRef: l,
                    children: n
                })
            };
        u.displayName = a;
        let f = e + "CollectionSlot",
            p = (0, l.f)(f),
            v = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: l
                } = e, a = d(f, r), i = (0, n.j)(t, a.collectionRef);
                return (0, o.jsx)(p, {
                    ref: i,
                    children: l
                })
            });
        v.displayName = f;
        let m = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, l.f)(m),
            x = t.default.forwardRef((e, r) => {
                let {
                    scope: l,
                    children: a,
                    ...i
                } = e, s = t.default.useRef(null), c = (0, n.j)(r, s), u = d(m, l);
                return t.default.useEffect(() => (u.itemMap.set(s, {
                    ref: s,
                    ...i
                }), () => void u.itemMap.delete(s))), (0, o.jsx)(g, {
                    ...{
                        [h]: ""
                    },
                    ref: c,
                    children: a
                })
            });
        return x.displayName = m, [{
            Provider: u,
            Slot: v,
            ItemSlot: x
        }, function(r) {
            let n = d(e + "CollectionConsumer", r);
            return t.default.useCallback(() => {
                let e = n.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                return Array.from(n.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [n.collectionRef, n.itemMap])
        }, s]
    }], 292123)
}, 692178, e => {
    "use strict";
    e.i(540949), e.i(28232), e.i(562442);
    var t = e.i(643766),
        r = e.i(859726),
        n = e.i(120297),
        l = e.i(831153),
        o = e.i(785517);
    e.s(["f", 0, function(e) {
        let a = e + "CollectionProvider",
            [i, s] = (0, r.c)(a),
            [c, d] = i(a, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            u = e => {
                let {
                    scope: r,
                    children: n
                } = e, l = t.default.useRef(null), a = t.default.useRef(new Map).current;
                return (0, o.jsx)(c, {
                    scope: r,
                    itemMap: a,
                    collectionRef: l,
                    children: n
                })
            };
        u.displayName = a;
        let f = e + "CollectionSlot",
            p = (0, l.f)(f),
            v = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: l
                } = e, a = d(f, r), i = (0, n.j)(t, a.collectionRef);
                return (0, o.jsx)(p, {
                    ref: i,
                    children: l
                })
            });
        v.displayName = f;
        let m = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, l.f)(m),
            x = t.default.forwardRef((e, r) => {
                let {
                    scope: l,
                    children: a,
                    ...i
                } = e, s = t.default.useRef(null), c = (0, n.j)(r, s), u = d(m, l);
                return t.default.useEffect(() => (u.itemMap.set(s, {
                    ref: s,
                    ...i
                }), () => void u.itemMap.delete(s))), (0, o.jsx)(g, {
                    ...{
                        [h]: ""
                    },
                    ref: c,
                    children: a
                })
            });
        return x.displayName = m, [{
            Provider: u,
            Slot: v,
            ItemSlot: x
        }, function(r) {
            let n = d(e + "CollectionConsumer", r);
            return t.default.useCallback(() => {
                let e = n.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                return Array.from(n.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [n.collectionRef, n.itemMap])
        }, s]
    }])
}, 981896, e => {
    "use strict";
    var t = e.i(643766);
    e.i(785517);
    var r = t.createContext(void 0);
    e.s(["f", 0, function(e) {
        let n = t.useContext(r);
        return e || n || "ltr"
    }])
}, 539377, e => {
    "use strict";
    var t = e.i(643766),
        r = e.i(7724),
        n = e.i(120297),
        l = e.i(859726),
        o = e.i(434378),
        a = e.i(505953),
        i = e.i(615951),
        s = e.i(257165),
        c = e.i(718810),
        d = e.i(517365),
        u = e.i(644227),
        f = e.i(760869),
        p = e.i(393225),
        v = e.i(493430),
        m = e.i(714724),
        h = e.i(633089),
        g = e.i(785517),
        x = "Popover",
        [w, y] = (0, l.c)(x, [c.y]),
        b = (0, c.y)(),
        [C, S] = w(x),
        j = e => {
            let {
                __scopePopover: r,
                children: n,
                open: l,
                defaultOpen: o,
                onOpenChange: a,
                modal: i = !1
            } = e, d = b(r), u = t.useRef(null), [f, p] = t.useState(!1), [m = !1, h] = (0, v.f)({
                prop: l,
                defaultProp: o,
                onChange: a
            });
            return (0, g.jsx)(c.F, {
                ...d,
                children: (0, g.jsx)(C, {
                    scope: r,
                    contentId: (0, s.f)(),
                    triggerRef: u,
                    open: m,
                    onOpenChange: h,
                    onOpenToggle: t.useCallback(() => h(e => !e), [h]),
                    hasCustomAnchor: f,
                    onCustomAnchorAdd: t.useCallback(() => p(!0), []),
                    onCustomAnchorRemove: t.useCallback(() => p(!1), []),
                    modal: i,
                    children: n
                })
            })
        };
    j.displayName = x;
    var R = "PopoverAnchor",
        E = t.forwardRef((e, r) => {
            let {
                __scopePopover: n,
                ...l
            } = e, o = S(R, n), a = b(n), {
                onCustomAnchorAdd: i,
                onCustomAnchorRemove: s
            } = o;
            return t.useEffect(() => (i(), () => s()), [i, s]), (0, g.jsx)(c.g, {
                ...a,
                ...l,
                ref: r
            })
        });
    E.displayName = R;
    var P = "PopoverTrigger",
        A = t.forwardRef((e, t) => {
            let {
                __scopePopover: l,
                ...o
            } = e, a = S(P, l), i = b(l), s = (0, n.j)(t, a.triggerRef), d = (0, g.jsx)(f.V.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": a.open,
                "aria-controls": a.contentId,
                "data-state": U(a.open),
                ...o,
                ref: s,
                onClick: (0, r.f)(e.onClick, a.onOpenToggle)
            });
            return a.hasCustomAnchor ? d : (0, g.jsx)(c.g, {
                asChild: !0,
                ...i,
                children: d
            })
        });
    A.displayName = P;
    var M = "PopoverPortal",
        [T, I] = w(M, {
            forceMount: void 0
        }),
        N = e => {
            let {
                __scopePopover: t,
                forceMount: r,
                children: n,
                container: l
            } = e, o = S(M, t);
            return (0, g.jsx)(T, {
                scope: t,
                forceMount: r,
                children: (0, g.jsx)(u.f, {
                    present: r || o.open,
                    children: (0, g.jsx)(d.f, {
                        asChild: !0,
                        container: l,
                        children: n
                    })
                })
            })
        };
    N.displayName = M;
    var k = "PopoverContent",
        D = t.forwardRef((e, t) => {
            let r = I(k, e.__scopePopover),
                {
                    forceMount: n = r.forceMount,
                    ...l
                } = e,
                o = S(k, e.__scopePopover);
            return (0, g.jsx)(u.f, {
                present: n || o.open,
                children: o.modal ? (0, g.jsx)(O, {
                    ...l,
                    ref: t
                }) : (0, g.jsx)(L, {
                    ...l,
                    ref: t
                })
            })
        });
    D.displayName = k;
    var F = (0, p.f)("PopoverContent.RemoveScroll"),
        O = t.forwardRef((e, l) => {
            let o = S(k, e.__scopePopover),
                a = t.useRef(null),
                i = (0, n.j)(l, a),
                s = t.useRef(!1);
            return t.useEffect(() => {
                let e = a.current;
                if (e) return (0, m.f)(e)
            }, []), (0, g.jsx)(h.f, {
                as: F,
                allowPinchZoom: !0,
                children: (0, g.jsx)(V, {
                    ...e,
                    ref: i,
                    trapFocus: o.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: (0, r.f)(e.onCloseAutoFocus, e => {
                        var t;
                        e.preventDefault(), s.current || null == (t = o.triggerRef.current) || t.focus()
                    }),
                    onPointerDownOutside: (0, r.f)(e.onPointerDownOutside, e => {
                        let t = e.detail.originalEvent,
                            r = 0 === t.button && !0 === t.ctrlKey;
                        s.current = 2 === t.button || r
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: (0, r.f)(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        L = t.forwardRef((e, r) => {
            let n = S(k, e.__scopePopover),
                l = t.useRef(!1),
                o = t.useRef(!1);
            return (0, g.jsx)(V, {
                ...e,
                ref: r,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var r, a;
                    null == (r = e.onCloseAutoFocus) || r.call(e, t), t.defaultPrevented || (l.current || null == (a = n.triggerRef.current) || a.focus(), t.preventDefault()), l.current = !1, o.current = !1
                },
                onInteractOutside: t => {
                    var r, a;
                    null == (r = e.onInteractOutside) || r.call(e, t), t.defaultPrevented || (l.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                    let i = t.target;
                    (null == (a = n.triggerRef.current) ? void 0 : a.contains(i)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                }
            })
        }),
        V = t.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                trapFocus: n,
                onOpenAutoFocus: l,
                onCloseAutoFocus: s,
                disableOutsidePointerEvents: d,
                onEscapeKeyDown: u,
                onPointerDownOutside: f,
                onFocusOutside: p,
                onInteractOutside: v,
                ...m
            } = e, h = S(k, r), x = b(r);
            return (0, a.f)(), (0, g.jsx)(i.f, {
                asChild: !0,
                loop: !0,
                trapped: n,
                onMountAutoFocus: l,
                onUnmountAutoFocus: s,
                children: (0, g.jsx)(o.f, {
                    asChild: !0,
                    disableOutsidePointerEvents: d,
                    onInteractOutside: v,
                    onEscapeKeyDown: u,
                    onPointerDownOutside: f,
                    onFocusOutside: p,
                    onDismiss: () => h.onOpenChange(!1),
                    children: (0, g.jsx)(c.c, {
                        "data-state": U(h.open),
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
        H = t.forwardRef((e, t) => {
            let {
                __scopePopover: n,
                ...l
            } = e, o = S(_, n);
            return (0, g.jsx)(f.V.button, {
                type: "button",
                ...l,
                ref: t,
                onClick: (0, r.f)(e.onClick, () => o.onOpenChange(!1))
            })
        });
    H.displayName = _;
    var B = t.forwardRef((e, t) => {
        let {
            __scopePopover: r,
            ...n
        } = e, l = b(r);
        return (0, g.jsx)(c.j, {
            ...l,
            ...n,
            ref: t
        })
    });

    function U(e) {
        return e ? "open" : "closed"
    }
    B.displayName = "PopoverArrow", e.s(["g", 0, E, "j", 0, B, "K", 0, H, "c", 0, D, "z", 0, N, "F", 0, j, "d", 0, A])
}, 718810, e => {
    "use strict";
    var t = e.i(643766),
        r = e.i(980891),
        n = e.i(350303),
        l = e.i(760869),
        o = e.i(785517),
        a = t.forwardRef((e, t) => {
            let {
                children: r,
                width: n = 10,
                height: a = 5,
                ...i
            } = e;
            return (0, o.jsx)(l.V.svg, {
                ...i,
                ref: t,
                width: n,
                height: a,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? r : (0, o.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    a.displayName = "Arrow";
    var i = e.i(120297),
        s = e.i(859726),
        c = e.i(103649),
        d = e.i(206350),
        u = e.i(842769),
        f = "Popper",
        [p, v] = (0, s.c)(f),
        [m, h] = p(f),
        g = e => {
            let {
                __scopePopper: r,
                children: n
            } = e, [l, a] = t.useState(null);
            return (0, o.jsx)(m, {
                scope: r,
                anchor: l,
                onAnchorChange: a,
                children: n
            })
        };
    g.displayName = f;
    var x = "PopperAnchor",
        w = t.forwardRef((e, r) => {
            let {
                __scopePopper: n,
                virtualRef: a,
                ...s
            } = e, c = h(x, n), d = t.useRef(null), u = (0, i.j)(r, d);
            return t.useEffect(() => {
                c.onAnchorChange((null == a ? void 0 : a.current) || d.current)
            }), a ? null : (0, o.jsx)(l.V.div, {
                ...s,
                ref: u
            })
        });
    w.displayName = x;
    var y = "PopperContent",
        [b, C] = p(y),
        S = t.forwardRef((e, a) => {
            var s, f, p, v, m, g, x, w;
            let {
                __scopePopper: C,
                side: S = "bottom",
                sideOffset: j = 0,
                align: R = "center",
                alignOffset: E = 0,
                arrowPadding: T = 0,
                avoidCollisions: I = !0,
                collisionBoundary: N = [],
                collisionPadding: k = 0,
                sticky: D = "partial",
                hideWhenDetached: F = !1,
                updatePositionStrategy: O = "optimized",
                onPlaced: L,
                ...V
            } = e, _ = h(y, C), [H, B] = t.useState(null), U = (0, i.j)(a, e => B(e)), [K, z] = t.useState(null), W = (0, u.f)(K), q = null != (s = null == W ? void 0 : W.width) ? s : 0, X = null != (f = null == W ? void 0 : W.height) ? f : 0, Y = "number" == typeof k ? k : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...k
            }, G = Array.isArray(N) ? N : [N], Z = G.length > 0, J = {
                padding: Y,
                boundary: G.filter(P),
                altBoundary: Z
            }, {
                refs: Q,
                floatingStyles: $,
                placement: ee,
                isPositioned: et,
                middlewareData: er
            } = (0, r.E)({
                strategy: "fixed",
                placement: S + ("center" !== R ? "-" + R : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, n.n)(...t, {
                        animationFrame: "always" === O
                    })
                },
                elements: {
                    reference: _.anchor
                },
                middleware: [(0, r.T)({
                    mainAxis: j + X,
                    alignmentAxis: E
                }), I && (0, r.e)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === D ? (0, r.n)() : void 0,
                    ...J
                }), I && (0, r.x)({
                    ...J
                }), (0, r.o)({
                    ...J,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: n,
                            availableHeight: l
                        } = e, {
                            width: o,
                            height: a
                        } = r.reference, i = t.floating.style;
                        i.setProperty("--radix-popper-available-width", "".concat(n, "px")), i.setProperty("--radix-popper-available-height", "".concat(l, "px")), i.setProperty("--radix-popper-anchor-width", "".concat(o, "px")), i.setProperty("--radix-popper-anchor-height", "".concat(a, "px"))
                    }
                }), K && (0, r.P)({
                    element: K,
                    padding: T
                }), A({
                    arrowWidth: q,
                    arrowHeight: X
                }), F && (0, r.c)({
                    strategy: "referenceHidden",
                    ...J
                })]
            }), [en, el] = M(ee), eo = (0, c.f)(L);
            (0, d.f)(() => {
                et && (null == eo || eo())
            }, [et, eo]);
            let ea = null == (p = er.arrow) ? void 0 : p.x,
                ei = null == (v = er.arrow) ? void 0 : v.y,
                es = (null == (m = er.arrow) ? void 0 : m.centerOffset) !== 0,
                [ec, ed] = t.useState();
            return (0, d.f)(() => {
                H && ed(window.getComputedStyle(H).zIndex)
            }, [H]), (0, o.jsx)("div", {
                ref: Q.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...$,
                    transform: et ? $.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: ec,
                    "--radix-popper-transform-origin": [null == (g = er.transformOrigin) ? void 0 : g.x, null == (x = er.transformOrigin) ? void 0 : x.y].join(" "),
                    ...(null == (w = er.hide) ? void 0 : w.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, o.jsx)(b, {
                    scope: C,
                    placedSide: en,
                    onArrowChange: z,
                    arrowX: ea,
                    arrowY: ei,
                    shouldHideArrow: es,
                    children: (0, o.jsx)(l.V.div, {
                        "data-side": en,
                        "data-align": el,
                        ...V,
                        ref: U,
                        style: {
                            ...V.style,
                            animation: et ? void 0 : "none"
                        }
                    })
                })
            })
        });
    S.displayName = y;
    var j = "PopperArrow",
        R = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        E = t.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, l = C(j, r), i = R[l.placedSide];
            return (0, o.jsx)("span", {
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
                children: (0, o.jsx)(a, {
                    ...n,
                    ref: t,
                    style: {
                        ...n.style,
                        display: "block"
                    }
                })
            })
        });

    function P(e) {
        return null !== e
    }
    E.displayName = j;
    var A = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, n, l, o, a;
            let {
                placement: i,
                rects: s,
                middlewareData: c
            } = t, d = (null == (l = c.arrow) ? void 0 : l.centerOffset) !== 0, u = d ? 0 : e.arrowWidth, f = d ? 0 : e.arrowHeight, [p, v] = M(i), m = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [v], h = (null != (r = null == (o = c.arrow) ? void 0 : o.x) ? r : 0) + u / 2, g = (null != (n = null == (a = c.arrow) ? void 0 : a.y) ? n : 0) + f / 2, x = "", w = "";
            return "bottom" === p ? (x = d ? m : "".concat(h, "px"), w = "".concat(-f, "px")) : "top" === p ? (x = d ? m : "".concat(h, "px"), w = "".concat(s.floating.height + f, "px")) : "right" === p ? (x = "".concat(-f, "px"), w = d ? m : "".concat(g, "px")) : "left" === p && (x = "".concat(s.floating.width + f, "px"), w = d ? m : "".concat(g, "px")), {
                data: {
                    x,
                    y: w
                }
            }
        }
    });

    function M(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["g", 0, w, "j", 0, E, "c", 0, S, "F", 0, g, "y", 0, v], 718810)
}, 114903, e => {
    "use strict";
    var t = e.i(643766),
        r = e.i(950020),
        n = e.i(692178),
        l = e.i(120297),
        o = e.i(859726),
        a = e.i(257165),
        i = e.i(546633),
        s = e.i(103649),
        c = e.i(517952),
        d = e.i(981896),
        u = e.i(785517),
        f = "rovingFocusGroup.onEntryFocus",
        p = {
            bubbles: !1,
            cancelable: !0
        },
        v = "RovingFocusGroup",
        [m, h, g] = (0, n.f)(v),
        [x, w] = (0, o.c)(v, [g]),
        [y, b] = x(v),
        C = t.forwardRef((e, t) => (0, u.jsx)(m.Provider, {
            scope: e.__scopeRovingFocusGroup,
            children: (0, u.jsx)(m.Slot, {
                scope: e.__scopeRovingFocusGroup,
                children: (0, u.jsx)(S, {
                    ...e,
                    ref: t
                })
            })
        }));
    C.displayName = v;
    var S = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: o,
                orientation: a,
                loop: m = !1,
                dir: g,
                currentTabStopId: x,
                defaultCurrentTabStopId: w,
                onCurrentTabStopIdChange: b,
                onEntryFocus: C,
                preventScrollOnEntryFocus: S = !1,
                ...j
            } = e, R = t.useRef(null), E = (0, l.j)(n, R), A = (0, d.f)(g), [M, T] = (0, c.f)({
                prop: x,
                defaultProp: null != w ? w : null,
                onChange: b,
                caller: v
            }), [I, N] = t.useState(!1), k = (0, s.f)(C), D = h(o), F = t.useRef(!1), [O, L] = t.useState(0);
            return t.useEffect(() => {
                let e = R.current;
                if (e) return e.addEventListener(f, k), () => e.removeEventListener(f, k)
            }, [k]), (0, u.jsx)(y, {
                scope: o,
                orientation: a,
                dir: A,
                loop: m,
                currentTabStopId: M,
                onItemFocus: t.useCallback(e => T(e), [T]),
                onItemShiftTab: t.useCallback(() => N(!0), []),
                onFocusableItemAdd: t.useCallback(() => L(e => e + 1), []),
                onFocusableItemRemove: t.useCallback(() => L(e => e - 1), []),
                children: (0, u.jsx)(i.f.div, {
                    tabIndex: I || 0 === O ? -1 : 0,
                    "data-orientation": a,
                    ...j,
                    ref: E,
                    style: {
                        outline: "none",
                        ...e.style
                    },
                    onMouseDown: (0, r.f)(e.onMouseDown, () => {
                        F.current = !0
                    }),
                    onFocus: (0, r.f)(e.onFocus, e => {
                        let t = !F.current;
                        if (e.target === e.currentTarget && t && !I) {
                            let t = new CustomEvent(f, p);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = D().filter(e => e.focusable);
                                P([e.find(e => e.active), e.find(e => e.id === M), ...e].filter(Boolean).map(e => e.ref.current), S)
                            }
                        }
                        F.current = !1
                    }),
                    onBlur: (0, r.f)(e.onBlur, () => N(!1))
                })
            })
        }),
        j = "RovingFocusGroupItem",
        R = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: l,
                focusable: o = !0,
                active: s = !1,
                tabStopId: c,
                children: d,
                ...f
            } = e, p = (0, a.f)(), v = c || p, g = b(j, l), x = g.currentTabStopId === v, w = h(l), {
                onFocusableItemAdd: y,
                onFocusableItemRemove: C,
                currentTabStopId: S
            } = g;
            return t.useEffect(() => {
                if (o) return y(), () => C()
            }, [o, y, C]), (0, u.jsx)(m.ItemSlot, {
                scope: l,
                id: v,
                focusable: o,
                active: s,
                children: (0, u.jsx)(i.f.span, {
                    tabIndex: x ? 0 : -1,
                    "data-orientation": g.orientation,
                    ...f,
                    ref: n,
                    onMouseDown: (0, r.f)(e.onMouseDown, e => {
                        o ? g.onItemFocus(v) : e.preventDefault()
                    }),
                    onFocus: (0, r.f)(e.onFocus, () => g.onItemFocus(v)),
                    onKeyDown: (0, r.f)(e.onKeyDown, e => {
                        if ("Tab" === e.key && e.shiftKey) return void g.onItemShiftTab();
                        if (e.target !== e.currentTarget) return;
                        let t = function(e, t, r) {
                            var n;
                            let l = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                            if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(l)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(l))) return E[l]
                        }(e, g.orientation, g.dir);
                        if (void 0 !== t) {
                            if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                            e.preventDefault();
                            let l = w().filter(e => e.focusable).map(e => e.ref.current);
                            if ("last" === t) l.reverse();
                            else if ("prev" === t || "next" === t) {
                                var r, n;
                                "prev" === t && l.reverse();
                                let o = l.indexOf(e.currentTarget);
                                l = g.loop ? (r = l, n = o + 1, r.map((e, t) => r[(n + t) % r.length])) : l.slice(o + 1)
                            }
                            setTimeout(() => P(l))
                        }
                    }),
                    children: "function" == typeof d ? d({
                        isCurrentTabStop: x,
                        hasTabStop: null != S
                    }) : d
                })
            })
        });
    R.displayName = j;
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

    function P(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            r = document.activeElement;
        for (let n of e)
            if (n === r || (n.focus({
                    preventScroll: t
                }), document.activeElement !== r)) return
    }
    e.s(["M", 0, R, "F", 0, C, "B", 0, w])
}, 548223, e => {
    "use strict";
    var t = e.i(643766),
        r = e.i(860663),
        n = e.i(790067),
        l = e.i(7724),
        o = e.i(292123),
        a = e.i(120297),
        i = e.i(859726),
        s = e.i(981896),
        c = e.i(434378),
        d = e.i(505953),
        u = e.i(615951),
        f = e.i(257165),
        p = e.i(718810),
        v = e.i(517365),
        m = e.i(760869),
        h = e.i(393225),
        g = e.i(103649),
        x = e.i(493430),
        w = e.i(206350),
        y = e.i(179510),
        b = e.i(785517),
        C = t.forwardRef((e, t) => (0, b.jsx)(m.V.span, {
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
    var S = e.i(714724),
        j = e.i(633089),
        R = [" ", "Enter", "ArrowUp", "ArrowDown"],
        E = [" ", "Enter"],
        P = "Select",
        [A, M, T] = (0, o.f)(P),
        [I, N] = (0, i.c)(P, [T, p.y]),
        k = (0, p.y)(),
        [D, F] = I(P),
        [O, L] = I(P),
        V = e => {
            let {
                __scopeSelect: r,
                children: n,
                open: l,
                defaultOpen: o,
                onOpenChange: a,
                value: i,
                defaultValue: c,
                onValueChange: d,
                dir: u,
                name: v,
                autoComplete: m,
                disabled: h,
                required: g,
                form: w
            } = e, y = k(r), [C, S] = t.useState(null), [j, R] = t.useState(null), [E, P] = t.useState(!1), M = (0, s.f)(u), [T = !1, I] = (0, x.f)({
                prop: l,
                defaultProp: o,
                onChange: a
            }), [N, F] = (0, x.f)({
                prop: i,
                defaultProp: c,
                onChange: d
            }), L = t.useRef(null), V = !C || w || !!C.closest("form"), [_, H] = t.useState(new Set), B = Array.from(_).map(e => e.props.value).join(";");
            return (0, b.jsx)(p.F, {
                ...y,
                children: (0, b.jsxs)(D, {
                    required: g,
                    scope: r,
                    trigger: C,
                    onTriggerChange: S,
                    valueNode: j,
                    onValueNodeChange: R,
                    valueNodeHasChildren: E,
                    onValueNodeHasChildrenChange: P,
                    contentId: (0, f.f)(),
                    value: N,
                    onValueChange: F,
                    open: T,
                    onOpenChange: I,
                    dir: M,
                    triggerPointerDownPosRef: L,
                    disabled: h,
                    children: [(0, b.jsx)(A.Provider, {
                        scope: r,
                        children: (0, b.jsx)(O, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: t.useCallback(e => {
                                H(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: t.useCallback(e => {
                                H(t => {
                                    let r = new Set(t);
                                    return r.delete(e), r
                                })
                            }, []),
                            children: n
                        })
                    }), V ? (0, b.jsxs)(ey, {
                        "aria-hidden": !0,
                        required: g,
                        tabIndex: -1,
                        name: v,
                        autoComplete: m,
                        value: N,
                        onChange: e => F(e.target.value),
                        disabled: h,
                        form: w,
                        children: [void 0 === N ? (0, b.jsx)("option", {
                            value: ""
                        }) : null, Array.from(_)]
                    }, B) : null]
                })
            })
        };
    V.displayName = P;
    var _ = "SelectTrigger",
        H = t.forwardRef((e, r) => {
            let {
                __scopeSelect: n,
                disabled: o = !1,
                ...i
            } = e, s = k(n), c = F(_, n), d = c.disabled || o, u = (0, a.j)(r, c.onTriggerChange), f = M(n), v = t.useRef("touch"), [h, g, x] = eb(e => {
                let t = f().filter(e => !e.disabled),
                    r = t.find(e => e.value === c.value),
                    n = eC(t, e, r);
                void 0 !== n && c.onValueChange(n.value)
            }), w = e => {
                d || (c.onOpenChange(!0), x()), e && (c.triggerPointerDownPosRef.current = {
                    x: Math.round(e.pageX),
                    y: Math.round(e.pageY)
                })
            };
            return (0, b.jsx)(p.g, {
                asChild: !0,
                ...s,
                children: (0, b.jsx)(m.V.button, {
                    type: "button",
                    role: "combobox",
                    "aria-controls": c.contentId,
                    "aria-expanded": c.open,
                    "aria-required": c.required,
                    "aria-autocomplete": "none",
                    dir: c.dir,
                    "data-state": c.open ? "open" : "closed",
                    disabled: d,
                    "data-disabled": d ? "" : void 0,
                    "data-placeholder": ew(c.value) ? "" : void 0,
                    ...i,
                    ref: u,
                    onClick: (0, l.f)(i.onClick, e => {
                        e.currentTarget.focus(), "mouse" !== v.current && w(e)
                    }),
                    onPointerDown: (0, l.f)(i.onPointerDown, e => {
                        v.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (w(e), e.preventDefault())
                    }),
                    onKeyDown: (0, l.f)(i.onKeyDown, e => {
                        let t = "" !== h.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || g(e.key), (!t || " " !== e.key) && R.includes(e.key) && (w(), e.preventDefault())
                    })
                })
            })
        });
    H.displayName = _;
    var B = "SelectValue",
        U = t.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: n,
                style: l,
                children: o,
                placeholder: i = "",
                ...s
            } = e, c = F(B, r), {
                onValueNodeHasChildrenChange: d
            } = c, u = void 0 !== o, f = (0, a.j)(t, c.onValueNodeChange);
            return (0, w.f)(() => {
                d(u)
            }, [d, u]), (0, b.jsx)(m.V.span, {
                ...s,
                ref: f,
                style: {
                    pointerEvents: "none"
                },
                children: ew(c.value) ? (0, b.jsx)(b.Fragment, {
                    children: i
                }) : o
            })
        });
    U.displayName = B;
    var K = t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            children: n,
            ...l
        } = e;
        return (0, b.jsx)(m.V.span, {
            "aria-hidden": !0,
            ...l,
            ref: t,
            children: n || "▼"
        })
    });
    K.displayName = "SelectIcon";
    var z = e => (0, b.jsx)(v.f, {
        asChild: !0,
        ...e
    });
    z.displayName = "SelectPortal";
    var W = "SelectContent",
        q = t.forwardRef((e, n) => {
            let l = F(W, e.__scopeSelect),
                [o, a] = t.useState();
            return ((0, w.f)(() => {
                a(new DocumentFragment)
            }, []), l.open) ? (0, b.jsx)(Z, {
                ...e,
                ref: n
            }) : o ? r.createPortal((0, b.jsx)(X, {
                scope: e.__scopeSelect,
                children: (0, b.jsx)(A.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, b.jsx)("div", {
                        children: e.children
                    })
                })
            }), o) : null
        });
    q.displayName = W;
    var [X, Y] = I(W), G = (0, h.f)("SelectContent.RemoveScroll"), Z = t.forwardRef((e, r) => {
        let {
            __scopeSelect: n,
            position: o = "item-aligned",
            onCloseAutoFocus: i,
            onEscapeKeyDown: s,
            onPointerDownOutside: f,
            side: p,
            sideOffset: v,
            align: m,
            alignOffset: h,
            arrowPadding: g,
            collisionBoundary: x,
            collisionPadding: w,
            sticky: y,
            hideWhenDetached: C,
            avoidCollisions: R,
            ...E
        } = e, P = F(W, n), [A, T] = t.useState(null), [I, N] = t.useState(null), k = (0, a.j)(r, e => T(e)), [D, O] = t.useState(null), [L, V] = t.useState(null), _ = M(n), [H, B] = t.useState(!1), U = t.useRef(!1);
        t.useEffect(() => {
            if (A) return (0, S.f)(A)
        }, [A]), (0, d.f)();
        let K = t.useCallback(e => {
                let [t, ...r] = _().map(e => e.ref.current), [n] = r.slice(-1), l = document.activeElement;
                for (let r of e)
                    if (r === l || (null == r || r.scrollIntoView({
                            block: "nearest"
                        }), r === t && I && (I.scrollTop = 0), r === n && I && (I.scrollTop = I.scrollHeight), null == r || r.focus(), document.activeElement !== l)) return
            }, [_, I]),
            z = t.useCallback(() => K([D, A]), [K, D, A]);
        t.useEffect(() => {
            H && z()
        }, [H, z]);
        let {
            onOpenChange: q,
            triggerPointerDownPosRef: Y
        } = P;
        t.useEffect(() => {
            if (A) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        var r, n, l, o;
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (null != (r = null == (l = Y.current) ? void 0 : l.x) ? r : 0)),
                            y: Math.abs(Math.round(t.pageY) - (null != (n = null == (o = Y.current) ? void 0 : o.y) ? n : 0))
                        }
                    },
                    r = r => {
                        e.x <= 10 && e.y <= 10 ? r.preventDefault() : A.contains(r.target) || q(!1), document.removeEventListener("pointermove", t), Y.current = null
                    };
                return null !== Y.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                        capture: !0
                    })
                }
            }
        }, [A, q, Y]), t.useEffect(() => {
            let e = () => q(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [q]);
        let [Z, $] = eb(e => {
            let t = _().filter(e => !e.disabled),
                r = t.find(e => e.ref.current === document.activeElement),
                n = eC(t, e, r);
            n && setTimeout(() => n.ref.current.focus())
        }), ee = t.useCallback((e, t, r) => {
            let n = !U.current && !r;
            (void 0 !== P.value && P.value === t || n) && (O(e), n && (U.current = !0))
        }, [P.value]), et = t.useCallback(() => null == A ? void 0 : A.focus(), [A]), er = t.useCallback((e, t, r) => {
            let n = !U.current && !r;
            (void 0 !== P.value && P.value === t || n) && V(e)
        }, [P.value]), en = "popper" === o ? Q : J, el = en === Q ? {
            side: p,
            sideOffset: v,
            align: m,
            alignOffset: h,
            arrowPadding: g,
            collisionBoundary: x,
            collisionPadding: w,
            sticky: y,
            hideWhenDetached: C,
            avoidCollisions: R
        } : {};
        return (0, b.jsx)(X, {
            scope: n,
            content: A,
            viewport: I,
            onViewportChange: N,
            itemRefCallback: ee,
            selectedItem: D,
            onItemLeave: et,
            itemTextRefCallback: er,
            focusSelectedItem: z,
            selectedItemText: L,
            position: o,
            isPositioned: H,
            searchRef: Z,
            children: (0, b.jsx)(j.f, {
                as: G,
                allowPinchZoom: !0,
                children: (0, b.jsx)(u.f, {
                    asChild: !0,
                    trapped: P.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: (0, l.f)(i, e => {
                        var t;
                        null == (t = P.trigger) || t.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, b.jsx)(c.f, {
                        asChild: !0,
                        disableOutsidePointerEvents: !0,
                        onEscapeKeyDown: s,
                        onPointerDownOutside: f,
                        onFocusOutside: e => e.preventDefault(),
                        onDismiss: () => P.onOpenChange(!1),
                        children: (0, b.jsx)(en, {
                            role: "listbox",
                            id: P.contentId,
                            "data-state": P.open ? "open" : "closed",
                            dir: P.dir,
                            onContextMenu: e => e.preventDefault(),
                            ...E,
                            ...el,
                            onPlaced: () => B(!0),
                            ref: k,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...E.style
                            },
                            onKeyDown: (0, l.f)(E.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || $(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = _().filter(e => !e.disabled).map(e => e.ref.current);
                                    if (["ArrowUp", "End"].includes(e.key) && (t = t.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                        let r = e.target,
                                            n = t.indexOf(r);
                                        t = t.slice(n + 1)
                                    }
                                    setTimeout(() => K(t)), e.preventDefault()
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
            __scopeSelect: l,
            onPlaced: o,
            ...i
        } = e, s = F(W, l), c = Y(W, l), [d, u] = t.useState(null), [f, p] = t.useState(null), v = (0, a.j)(r, e => p(e)), h = M(l), g = t.useRef(!1), x = t.useRef(!0), {
            viewport: y,
            selectedItem: C,
            selectedItemText: S,
            focusSelectedItem: j
        } = c, R = t.useCallback(() => {
            if (s.trigger && s.valueNode && d && f && y && C && S) {
                let e = s.trigger.getBoundingClientRect(),
                    t = f.getBoundingClientRect(),
                    r = s.valueNode.getBoundingClientRect(),
                    l = S.getBoundingClientRect();
                if ("rtl" !== s.dir) {
                    let o = l.left - t.left,
                        a = r.left - o,
                        i = e.left - a,
                        s = e.width + i,
                        c = Math.max(s, t.width),
                        u = window.innerWidth - 10,
                        f = (0, n.f)(a, [10, Math.max(10, u - c)]);
                    d.style.minWidth = s + "px", d.style.left = f + "px"
                } else {
                    let o = t.right - l.right,
                        a = window.innerWidth - r.right - o,
                        i = window.innerWidth - e.right - a,
                        s = e.width + i,
                        c = Math.max(s, t.width),
                        u = window.innerWidth - 10,
                        f = (0, n.f)(a, [10, Math.max(10, u - c)]);
                    d.style.minWidth = s + "px", d.style.right = f + "px"
                }
                let a = h(),
                    i = window.innerHeight - 20,
                    c = y.scrollHeight,
                    u = window.getComputedStyle(f),
                    p = parseInt(u.borderTopWidth, 10),
                    v = parseInt(u.paddingTop, 10),
                    m = parseInt(u.borderBottomWidth, 10),
                    x = p + v + c + parseInt(u.paddingBottom, 10) + m,
                    w = Math.min(5 * C.offsetHeight, x),
                    b = window.getComputedStyle(y),
                    j = parseInt(b.paddingTop, 10),
                    R = parseInt(b.paddingBottom, 10),
                    E = e.top + e.height / 2 - 10,
                    P = C.offsetHeight / 2,
                    A = p + v + (C.offsetTop + P);
                if (A <= E) {
                    let e = a.length > 0 && C === a[a.length - 1].ref.current;
                    d.style.bottom = "0px";
                    let t = Math.max(i - E, P + (e ? R : 0) + (f.clientHeight - y.offsetTop - y.offsetHeight) + m);
                    d.style.height = A + t + "px"
                } else {
                    let e = a.length > 0 && C === a[0].ref.current;
                    d.style.top = "0px";
                    let t = Math.max(E, p + y.offsetTop + (e ? j : 0) + P);
                    d.style.height = t + (x - A) + "px", y.scrollTop = A - E + y.offsetTop
                }
                d.style.margin = "".concat(10, "px 0"), d.style.minHeight = w + "px", d.style.maxHeight = i + "px", null == o || o(), requestAnimationFrame(() => g.current = !0)
            }
        }, [h, s.trigger, s.valueNode, d, f, y, C, S, s.dir, o]);
        (0, w.f)(() => R(), [R]);
        let [E, P] = t.useState();
        (0, w.f)(() => {
            f && P(window.getComputedStyle(f).zIndex)
        }, [f]);
        let A = t.useCallback(e => {
            e && !0 === x.current && (R(), null == j || j(), x.current = !1)
        }, [R, j]);
        return (0, b.jsx)($, {
            scope: l,
            contentWrapper: d,
            shouldExpandOnScrollRef: g,
            onScrollButtonChange: A,
            children: (0, b.jsx)("div", {
                ref: u,
                style: {
                    display: "flex",
                    flexDirection: "column",
                    position: "fixed",
                    zIndex: E
                },
                children: (0, b.jsx)(m.V.div, {
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
            align: n = "start",
            collisionPadding: l = 10,
            ...o
        } = e, a = k(r);
        return (0, b.jsx)(p.c, {
            ...a,
            ...o,
            ref: t,
            align: n,
            collisionPadding: l,
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
    Q.displayName = "SelectPopperPosition";
    var [$, ee] = I(W, {}), et = "SelectViewport", er = t.forwardRef((e, r) => {
        let {
            __scopeSelect: n,
            nonce: o,
            ...i
        } = e, s = Y(et, n), c = ee(et, n), d = (0, a.j)(r, s.onViewportChange), u = t.useRef(0);
        return (0, b.jsxs)(b.Fragment, {
            children: [(0, b.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: o
            }), (0, b.jsx)(A.Slot, {
                scope: n,
                children: (0, b.jsx)(m.V.div, {
                    "data-radix-select-viewport": "",
                    role: "presentation",
                    ...i,
                    ref: d,
                    style: {
                        position: "relative",
                        flex: 1,
                        overflow: "hidden auto",
                        ...i.style
                    },
                    onScroll: (0, l.f)(i.onScroll, e => {
                        let t = e.currentTarget,
                            {
                                contentWrapper: r,
                                shouldExpandOnScrollRef: n
                            } = c;
                        if ((null == n ? void 0 : n.current) && r) {
                            let e = Math.abs(u.current - t.scrollTop);
                            if (e > 0) {
                                let n = window.innerHeight - 20,
                                    l = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                if (l < n) {
                                    let o = l + e,
                                        a = Math.min(n, o),
                                        i = o - a;
                                    r.style.height = a + "px", "0px" === r.style.bottom && (t.scrollTop = i > 0 ? i : 0, r.style.justifyContent = "flex-end")
                                }
                            }
                        }
                        u.current = t.scrollTop
                    })
                })
            })]
        })
    });
    er.displayName = et;
    var en = "SelectGroup",
        [el, eo] = I(en);
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, l = (0, f.f)();
        return (0, b.jsx)(el, {
            scope: r,
            id: l,
            children: (0, b.jsx)(m.V.div, {
                role: "group",
                "aria-labelledby": l,
                ...n,
                ref: t
            })
        })
    }).displayName = en;
    var ea = "SelectLabel";
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, l = eo(ea, r);
        return (0, b.jsx)(m.V.div, {
            id: l.id,
            ...n,
            ref: t
        })
    }).displayName = ea;
    var ei = "SelectItem",
        [es, ec] = I(ei),
        ed = t.forwardRef((e, r) => {
            let {
                __scopeSelect: n,
                value: o,
                disabled: i = !1,
                textValue: s,
                ...c
            } = e, d = F(ei, n), u = Y(ei, n), p = d.value === o, [v, h] = t.useState(null != s ? s : ""), [g, x] = t.useState(!1), w = (0, a.j)(r, e => {
                var t;
                return null == (t = u.itemRefCallback) ? void 0 : t.call(u, e, o, i)
            }), y = (0, f.f)(), C = t.useRef("touch"), S = () => {
                i || (d.onValueChange(o), d.onOpenChange(!1))
            };
            if ("" === o) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, b.jsx)(es, {
                scope: n,
                value: o,
                disabled: i,
                textId: y,
                isSelected: p,
                onItemTextChange: t.useCallback(e => {
                    h(t => {
                        var r;
                        return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                    })
                }, []),
                children: (0, b.jsx)(A.ItemSlot, {
                    scope: n,
                    value: o,
                    disabled: i,
                    textValue: v,
                    children: (0, b.jsx)(m.V.div, {
                        role: "option",
                        "aria-labelledby": y,
                        "data-highlighted": g ? "" : void 0,
                        "aria-selected": p && g,
                        "data-state": p ? "checked" : "unchecked",
                        "aria-disabled": i || void 0,
                        "data-disabled": i ? "" : void 0,
                        tabIndex: i ? void 0 : -1,
                        ...c,
                        ref: w,
                        onFocus: (0, l.f)(c.onFocus, () => x(!0)),
                        onBlur: (0, l.f)(c.onBlur, () => x(!1)),
                        onClick: (0, l.f)(c.onClick, () => {
                            "mouse" !== C.current && S()
                        }),
                        onPointerUp: (0, l.f)(c.onPointerUp, () => {
                            "mouse" === C.current && S()
                        }),
                        onPointerDown: (0, l.f)(c.onPointerDown, e => {
                            C.current = e.pointerType
                        }),
                        onPointerMove: (0, l.f)(c.onPointerMove, e => {
                            if (C.current = e.pointerType, i) {
                                var t;
                                null == (t = u.onItemLeave) || t.call(u)
                            } else "mouse" === C.current && e.currentTarget.focus({
                                preventScroll: !0
                            })
                        }),
                        onPointerLeave: (0, l.f)(c.onPointerLeave, e => {
                            if (e.currentTarget === document.activeElement) {
                                var t;
                                null == (t = u.onItemLeave) || t.call(u)
                            }
                        }),
                        onKeyDown: (0, l.f)(c.onKeyDown, e => {
                            var t;
                            ((null == (t = u.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (E.includes(e.key) && S(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    ed.displayName = ei;
    var eu = "SelectItemText",
        ef = t.forwardRef((e, n) => {
            let {
                __scopeSelect: l,
                className: o,
                style: i,
                ...s
            } = e, c = F(eu, l), d = Y(eu, l), u = ec(eu, l), f = L(eu, l), [p, v] = t.useState(null), h = (0, a.j)(n, e => v(e), u.onItemTextChange, e => {
                var t;
                return null == (t = d.itemTextRefCallback) ? void 0 : t.call(d, e, u.value, u.disabled)
            }), g = null == p ? void 0 : p.textContent, x = t.useMemo(() => (0, b.jsx)("option", {
                value: u.value,
                disabled: u.disabled,
                children: g
            }, u.value), [u.disabled, u.value, g]), {
                onNativeOptionAdd: y,
                onNativeOptionRemove: C
            } = f;
            return (0, w.f)(() => (y(x), () => C(x)), [y, C, x]), (0, b.jsxs)(b.Fragment, {
                children: [(0, b.jsx)(m.V.span, {
                    id: u.textId,
                    ...s,
                    ref: h
                }), u.isSelected && c.valueNode && !c.valueNodeHasChildren ? r.createPortal(s.children, c.valueNode) : null]
            })
        });
    ef.displayName = eu;
    var ep = "SelectItemIndicator",
        ev = t.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                ...n
            } = e;
            return ec(ep, r).isSelected ? (0, b.jsx)(m.V.span, {
                "aria-hidden": !0,
                ...n,
                ref: t
            }) : null
        });
    ev.displayName = ep;
    var em = "SelectScrollUpButton";
    t.forwardRef((e, r) => {
        let n = Y(em, e.__scopeSelect),
            l = ee(em, e.__scopeSelect),
            [o, i] = t.useState(!1),
            s = (0, a.j)(r, l.onScrollButtonChange);
        return (0, w.f)(() => {
            if (n.viewport && n.isPositioned) {
                let e = function() {
                        i(t.scrollTop > 0)
                    },
                    t = n.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [n.viewport, n.isPositioned]), o ? (0, b.jsx)(eg, {
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
    }).displayName = em;
    var eh = "SelectScrollDownButton";
    t.forwardRef((e, r) => {
        let n = Y(eh, e.__scopeSelect),
            l = ee(eh, e.__scopeSelect),
            [o, i] = t.useState(!1),
            s = (0, a.j)(r, l.onScrollButtonChange);
        return (0, w.f)(() => {
            if (n.viewport && n.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        i(Math.ceil(t.scrollTop) < e)
                    },
                    t = n.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [n.viewport, n.isPositioned]), o ? (0, b.jsx)(eg, {
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
    }).displayName = eh;
    var eg = t.forwardRef((e, r) => {
        let {
            __scopeSelect: n,
            onAutoScroll: o,
            ...a
        } = e, i = Y("SelectScrollButton", n), s = t.useRef(null), c = M(n), d = t.useCallback(() => {
            null !== s.current && (window.clearInterval(s.current), s.current = null)
        }, []);
        return t.useEffect(() => () => d(), [d]), (0, w.f)(() => {
            var e;
            let t = c().find(e => e.ref.current === document.activeElement);
            null == t || null == (e = t.ref.current) || e.scrollIntoView({
                block: "nearest"
            })
        }, [c]), (0, b.jsx)(m.V.div, {
            "aria-hidden": !0,
            ...a,
            ref: r,
            style: {
                flexShrink: 0,
                ...a.style
            },
            onPointerDown: (0, l.f)(a.onPointerDown, () => {
                null === s.current && (s.current = window.setInterval(o, 50))
            }),
            onPointerMove: (0, l.f)(a.onPointerMove, () => {
                var e;
                null == (e = i.onItemLeave) || e.call(i), null === s.current && (s.current = window.setInterval(o, 50))
            }),
            onPointerLeave: (0, l.f)(a.onPointerLeave, () => {
                d()
            })
        })
    });
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e;
        return (0, b.jsx)(m.V.div, {
            "aria-hidden": !0,
            ...n,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var ex = "SelectArrow";

    function ew(e) {
        return "" === e || void 0 === e
    }
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, l = k(r), o = F(ex, r), a = Y(ex, r);
        return o.open && "popper" === a.position ? (0, b.jsx)(p.j, {
            ...l,
            ...n,
            ref: t
        }) : null
    }).displayName = ex;
    var ey = t.forwardRef((e, r) => {
        let {
            value: n,
            ...l
        } = e, o = t.useRef(null), i = (0, a.j)(r, o), s = (0, y.f)(n);
        return t.useEffect(() => {
            let e = o.current,
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
                ...l,
                ref: i,
                defaultValue: n
            })
        })
    });

    function eb(e) {
        let r = (0, g.f)(e),
            n = t.useRef(""),
            l = t.useRef(0),
            o = t.useCallback(e => {
                let t = n.current + e;
                r(t),
                    function e(t) {
                        n.current = t, window.clearTimeout(l.current), "" !== t && (l.current = window.setTimeout(() => e(""), 1e3))
                    }(t)
            }, [r]),
            a = t.useCallback(() => {
                n.current = "", window.clearTimeout(l.current)
            }, []);
        return t.useEffect(() => () => window.clearTimeout(l.current), []), [n, o, a]
    }

    function eC(e, t, r) {
        var n, l;
        let o = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            a = r ? e.indexOf(r) : -1,
            i = (n = e, l = Math.max(a, 0), n.map((e, t) => n[(l + t) % n.length]));
        1 === o.length && (i = i.filter(e => e !== r));
        let s = i.find(e => e.textValue.toLowerCase().startsWith(o.toLowerCase()));
        return s !== r ? s : void 0
    }
    ey.displayName = "BubbleSelect", e.s(["c", 0, q, "W", 0, K, "M", 0, ed, "j", 0, ev, "s", 0, ef, "z", 0, z, "F", 0, V, "d", 0, H, "A", 0, U, "n", 0, er], 548223)
}, 331420, e => {
    "use strict";
    var t = e.i(27213),
        r = e.i(94302),
        n = e.i(335020),
        l = e.i(643766),
        o = e.i(637068);
    let a = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        i = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        s = {
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
        c = {
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
        u = {
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
        p = {
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
        v = (0, l.forwardRef)((e, v) => {
            let m, {
                className: h,
                icon: g,
                ariaLabel: x,
                isDisabled: w = !1,
                isCircular: y = !1,
                isSelected: b = !1,
                size: C = "Large",
                variant: S = "Emphasis",
                iconColor: j = "Default",
                asChild: R,
                children: E,
                ...P
            } = e;
            m = w ? d[S] : b ? u[S] : c[S];
            let A = (0, n.U)("foundation-web-icon-button", w ? r.f : [t.Y, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", a[C], s[C][y ? "circular" : "square"], m, h),
                M = l.default.createElement(l.default.Fragment, null, l.default.createElement(t.v, null), l.default.createElement("span", {
                    className: (0, n.U)("icon", g, i[C], w ? p[j][S] : f[j][S])
                }));
            if (R) {
                let {
                    as: e,
                    ...t
                } = P, r = l.default.Children.only(E);
                return l.default.createElement(o.M, {
                    ref: v,
                    ...t,
                    className: A,
                    "aria-label": x,
                    "aria-disabled": w || void 0
                }, l.default.cloneElement(r, {}, M))
            }
            if ("a" === P.as) {
                let {
                    as: e,
                    href: t,
                    ...r
                } = P;
                return l.default.createElement("a", {
                    ref: v,
                    ...r,
                    "aria-label": x,
                    "aria-disabled": w,
                    href: w ? void 0 : t,
                    className: A
                }, M)
            }
            let {
                as: T,
                ...I
            } = P;
            return l.default.createElement("button", {
                ref: v,
                type: "button",
                ...I,
                "aria-label": x,
                disabled: w,
                className: A
            }, M)
        });
    e.s(["f", 0, v])
}, 134321, 987279, e => {
    "use strict";
    var t = e.i(335020),
        r = e.i(643766);

    function n(e) {
        let {
            className: n
        } = e;
        return r.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, t.U)("block", n),
            style: {
                marginTop: -1
            }
        }, r.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }
    e.s(["f", 0, n], 987279);
    var l = e.i(866491);
    e.s(["W", 0, function(e) {
        let {
            position: o,
            hasBeak: a = !0,
            title: i,
            description: s,
            ariaLabel: c,
            delayDurationMs: d = 500,
            children: u,
            open: f,
            onOpenChange: p,
            contentClassName: v
        } = e, [m, h] = o.split("-"), g = null != c ? c : "string" == typeof i && null == s ? i : void 0;
        return r.createElement(l.g, {
            delayDuration: d
        }, r.createElement(l.F, {
            open: f,
            onOpenChange: p
        }, u, r.createElement(l.z, null, r.createElement(l.c, {
            side: m,
            align: h,
            "aria-label": g,
            className: (0, t.U)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", v),
            sideOffset: 5
        }, a && r.createElement(l.j, {
            asChild: !0
        }, r.createElement(n, {
            className: "content-[var(--inverse-surface-0)]"
        })), r.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, r.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, i), s && r.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, s))))))
    }, "y", 0, function(e) {
        let {
            children: t,
            asChild: n,
            className: o
        } = e;
        return r.createElement(l.d, {
            asChild: n,
            className: o
        }, t)
    }], 134321)
}]);

//# debugId=ffd52785-16ee-bc1a-118a-586ddf0fbb46
//# sourceMappingURL=02d2wa0joxwpb.js.map
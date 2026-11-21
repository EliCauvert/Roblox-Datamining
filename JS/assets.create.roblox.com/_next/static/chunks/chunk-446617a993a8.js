;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "430b576b-4ff2-d348-710f-9dbea0cfbd79")
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
        o = e.i(393225),
        l = e.i(785517);
    e.s(["f", 0, function(e) {
        let a = e + "CollectionProvider",
            [i, s] = (0, r.c)(a),
            [u, c] = i(a, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: r,
                    children: n
                } = e, o = t.default.useRef(null), a = t.default.useRef(new Map).current;
                return (0, l.jsx)(u, {
                    scope: r,
                    itemMap: a,
                    collectionRef: o,
                    children: n
                })
            };
        d.displayName = a;
        let f = e + "CollectionSlot",
            p = (0, o.f)(f),
            v = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: o
                } = e, a = c(f, r), i = (0, n.j)(t, a.collectionRef);
                return (0, l.jsx)(p, {
                    ref: i,
                    children: o
                })
            });
        v.displayName = f;
        let m = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, o.f)(m),
            y = t.default.forwardRef((e, r) => {
                let {
                    scope: o,
                    children: a,
                    ...i
                } = e, s = t.default.useRef(null), u = (0, n.j)(r, s), d = c(m, o);
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
    }], 292123)
}, 692178, e => {
    "use strict";
    e.i(540949), e.i(28232), e.i(562442);
    var t = e.i(643766),
        r = e.i(859726),
        n = e.i(120297),
        o = e.i(831153),
        l = e.i(785517);
    e.s(["f", 0, function(e) {
        let a = e + "CollectionProvider",
            [i, s] = (0, r.c)(a),
            [u, c] = i(a, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: r,
                    children: n
                } = e, o = t.default.useRef(null), a = t.default.useRef(new Map).current;
                return (0, l.jsx)(u, {
                    scope: r,
                    itemMap: a,
                    collectionRef: o,
                    children: n
                })
            };
        d.displayName = a;
        let f = e + "CollectionSlot",
            p = (0, o.f)(f),
            v = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: o
                } = e, a = c(f, r), i = (0, n.j)(t, a.collectionRef);
                return (0, l.jsx)(p, {
                    ref: i,
                    children: o
                })
            });
        v.displayName = f;
        let m = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, o.f)(m),
            y = t.default.forwardRef((e, r) => {
                let {
                    scope: o,
                    children: a,
                    ...i
                } = e, s = t.default.useRef(null), u = (0, n.j)(r, s), d = c(m, o);
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
}, 981896, e => {
    "use strict";
    var t = e.i(643766);
    e.i(785517);
    var r = t.createContext(void 0);
    e.s(["f", 0, function(e) {
        let n = t.useContext(r);
        return e || n || "ltr"
    }])
}, 539377, 718810, e => {
    "use strict";
    var t = e.i(643766),
        r = e.i(7724),
        n = e.i(120297),
        o = e.i(859726),
        l = e.i(434378),
        a = e.i(505953),
        i = e.i(615951),
        s = e.i(257165),
        u = e.i(980891),
        c = e.i(350303),
        d = e.i(760869),
        f = e.i(785517),
        p = t.forwardRef((e, t) => {
            let {
                children: r,
                width: n = 10,
                height: o = 5,
                ...l
            } = e;
            return (0, f.jsx)(d.V.svg, {
                ...l,
                ref: t,
                width: n,
                height: o,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? r : (0, f.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    p.displayName = "Arrow";
    var v = e.i(103649),
        m = e.i(206350),
        h = e.i(842769),
        g = "Popper",
        [y, x] = (0, o.c)(g),
        [w, b] = y(g),
        C = e => {
            let {
                __scopePopper: r,
                children: n
            } = e, [o, l] = t.useState(null);
            return (0, f.jsx)(w, {
                scope: r,
                anchor: o,
                onAnchorChange: l,
                children: n
            })
        };
    C.displayName = g;
    var E = "PopperAnchor",
        j = t.forwardRef((e, r) => {
            let {
                __scopePopper: o,
                virtualRef: l,
                ...a
            } = e, i = b(E, o), s = t.useRef(null), u = (0, n.j)(r, s);
            return t.useEffect(() => {
                i.onAnchorChange((null == l ? void 0 : l.current) || s.current)
            }), l ? null : (0, f.jsx)(d.V.div, {
                ...a,
                ref: u
            })
        });
    j.displayName = E;
    var S = "PopperContent",
        [R, P] = y(S),
        T = t.forwardRef((e, r) => {
            var o, l, a, i, s, p, g, y;
            let {
                __scopePopper: x,
                side: w = "bottom",
                sideOffset: C = 0,
                align: E = "center",
                alignOffset: j = 0,
                arrowPadding: P = 0,
                avoidCollisions: T = !0,
                collisionBoundary: A = [],
                collisionPadding: N = 0,
                sticky: k = "partial",
                hideWhenDetached: I = !1,
                updatePositionStrategy: L = "optimized",
                onPlaced: F,
                ..._
            } = e, B = b(S, x), [V, H] = t.useState(null), U = (0, n.j)(r, e => H(e)), [z, W] = t.useState(null), K = (0, h.f)(z), X = null != (o = null == K ? void 0 : K.width) ? o : 0, Y = null != (l = null == K ? void 0 : K.height) ? l : 0, q = "number" == typeof N ? N : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...N
            }, G = Array.isArray(A) ? A : [A], Z = G.length > 0, J = {
                padding: q,
                boundary: G.filter(M),
                altBoundary: Z
            }, {
                refs: Q,
                floatingStyles: $,
                placement: ee,
                isPositioned: et,
                middlewareData: er
            } = (0, u.E)({
                strategy: "fixed",
                placement: w + ("center" !== E ? "-" + E : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, c.n)(...t, {
                        animationFrame: "always" === L
                    })
                },
                elements: {
                    reference: B.anchor
                },
                middleware: [(0, u.T)({
                    mainAxis: C + Y,
                    alignmentAxis: j
                }), T && (0, u.e)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === k ? (0, u.n)() : void 0,
                    ...J
                }), T && (0, u.x)({
                    ...J
                }), (0, u.o)({
                    ...J,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: n,
                            availableHeight: o
                        } = e, {
                            width: l,
                            height: a
                        } = r.reference, i = t.floating.style;
                        i.setProperty("--radix-popper-available-width", "".concat(n, "px")), i.setProperty("--radix-popper-available-height", "".concat(o, "px")), i.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), i.setProperty("--radix-popper-anchor-height", "".concat(a, "px"))
                    }
                }), z && (0, u.P)({
                    element: z,
                    padding: P
                }), O({
                    arrowWidth: X,
                    arrowHeight: Y
                }), I && (0, u.c)({
                    strategy: "referenceHidden",
                    ...J
                })]
            }), [en, eo] = D(ee), el = (0, v.f)(F);
            (0, m.f)(() => {
                et && (null == el || el())
            }, [et, el]);
            let ea = null == (a = er.arrow) ? void 0 : a.x,
                ei = null == (i = er.arrow) ? void 0 : i.y,
                es = (null == (s = er.arrow) ? void 0 : s.centerOffset) !== 0,
                [eu, ec] = t.useState();
            return (0, m.f)(() => {
                V && ec(window.getComputedStyle(V).zIndex)
            }, [V]), (0, f.jsx)("div", {
                ref: Q.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...$,
                    transform: et ? $.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: eu,
                    "--radix-popper-transform-origin": [null == (p = er.transformOrigin) ? void 0 : p.x, null == (g = er.transformOrigin) ? void 0 : g.y].join(" "),
                    ...(null == (y = er.hide) ? void 0 : y.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, f.jsx)(R, {
                    scope: x,
                    placedSide: en,
                    onArrowChange: W,
                    arrowX: ea,
                    arrowY: ei,
                    shouldHideArrow: es,
                    children: (0, f.jsx)(d.V.div, {
                        "data-side": en,
                        "data-align": eo,
                        ..._,
                        ref: U,
                        style: {
                            ..._.style,
                            animation: et ? void 0 : "none"
                        }
                    })
                })
            })
        });
    T.displayName = S;
    var A = "PopperArrow",
        N = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        k = t.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, o = P(A, r), l = N[o.placedSide];
            return (0, f.jsx)("span", {
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
                children: (0, f.jsx)(p, {
                    ...n,
                    ref: t,
                    style: {
                        ...n.style,
                        display: "block"
                    }
                })
            })
        });

    function M(e) {
        return null !== e
    }
    k.displayName = A;
    var O = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, n, o, l, a;
            let {
                placement: i,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, v] = D(i), m = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [v], h = (null != (r = null == (l = u.arrow) ? void 0 : l.x) ? r : 0) + d / 2, g = (null != (n = null == (a = u.arrow) ? void 0 : a.y) ? n : 0) + f / 2, y = "", x = "";
            return "bottom" === p ? (y = c ? m : "".concat(h, "px"), x = "".concat(-f, "px")) : "top" === p ? (y = c ? m : "".concat(h, "px"), x = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), x = c ? m : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), x = c ? m : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: x
                }
            }
        }
    });

    function D(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["g", 0, j, "j", 0, k, "c", 0, T, "F", 0, C, "y", 0, x], 718810);
    var I = e.i(517365),
        L = e.i(644227),
        F = e.i(393225),
        _ = e.i(493430),
        B = e.i(714724),
        V = e.i(633089),
        H = "Popover",
        [U, z] = (0, o.c)(H, [x]),
        W = x(),
        [K, X] = U(H),
        Y = e => {
            let {
                __scopePopover: r,
                children: n,
                open: o,
                defaultOpen: l,
                onOpenChange: a,
                modal: i = !1
            } = e, u = W(r), c = t.useRef(null), [d, p] = t.useState(!1), [v = !1, m] = (0, _.f)({
                prop: o,
                defaultProp: l,
                onChange: a
            });
            return (0, f.jsx)(C, {
                ...u,
                children: (0, f.jsx)(K, {
                    scope: r,
                    contentId: (0, s.f)(),
                    triggerRef: c,
                    open: v,
                    onOpenChange: m,
                    onOpenToggle: t.useCallback(() => m(e => !e), [m]),
                    hasCustomAnchor: d,
                    onCustomAnchorAdd: t.useCallback(() => p(!0), []),
                    onCustomAnchorRemove: t.useCallback(() => p(!1), []),
                    modal: i,
                    children: n
                })
            })
        };
    Y.displayName = H;
    var q = "PopoverAnchor",
        G = t.forwardRef((e, r) => {
            let {
                __scopePopover: n,
                ...o
            } = e, l = X(q, n), a = W(n), {
                onCustomAnchorAdd: i,
                onCustomAnchorRemove: s
            } = l;
            return t.useEffect(() => (i(), () => s()), [i, s]), (0, f.jsx)(j, {
                ...a,
                ...o,
                ref: r
            })
        });
    G.displayName = q;
    var Z = "PopoverTrigger",
        J = t.forwardRef((e, t) => {
            let {
                __scopePopover: o,
                ...l
            } = e, a = X(Z, o), i = W(o), s = (0, n.j)(t, a.triggerRef), u = (0, f.jsx)(d.V.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": a.open,
                "aria-controls": a.contentId,
                "data-state": ed(a.open),
                ...l,
                ref: s,
                onClick: (0, r.f)(e.onClick, a.onOpenToggle)
            });
            return a.hasCustomAnchor ? u : (0, f.jsx)(j, {
                asChild: !0,
                ...i,
                children: u
            })
        });
    J.displayName = Z;
    var Q = "PopoverPortal",
        [$, ee] = U(Q, {
            forceMount: void 0
        }),
        et = e => {
            let {
                __scopePopover: t,
                forceMount: r,
                children: n,
                container: o
            } = e, l = X(Q, t);
            return (0, f.jsx)($, {
                scope: t,
                forceMount: r,
                children: (0, f.jsx)(L.f, {
                    present: r || l.open,
                    children: (0, f.jsx)(I.f, {
                        asChild: !0,
                        container: o,
                        children: n
                    })
                })
            })
        };
    et.displayName = Q;
    var er = "PopoverContent",
        en = t.forwardRef((e, t) => {
            let r = ee(er, e.__scopePopover),
                {
                    forceMount: n = r.forceMount,
                    ...o
                } = e,
                l = X(er, e.__scopePopover);
            return (0, f.jsx)(L.f, {
                present: n || l.open,
                children: l.modal ? (0, f.jsx)(el, {
                    ...o,
                    ref: t
                }) : (0, f.jsx)(ea, {
                    ...o,
                    ref: t
                })
            })
        });
    en.displayName = er;
    var eo = (0, F.f)("PopoverContent.RemoveScroll"),
        el = t.forwardRef((e, o) => {
            let l = X(er, e.__scopePopover),
                a = t.useRef(null),
                i = (0, n.j)(o, a),
                s = t.useRef(!1);
            return t.useEffect(() => {
                let e = a.current;
                if (e) return (0, B.f)(e)
            }, []), (0, f.jsx)(V.f, {
                as: eo,
                allowPinchZoom: !0,
                children: (0, f.jsx)(ei, {
                    ...e,
                    ref: i,
                    trapFocus: l.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: (0, r.f)(e.onCloseAutoFocus, e => {
                        var t;
                        e.preventDefault(), s.current || null == (t = l.triggerRef.current) || t.focus()
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
        ea = t.forwardRef((e, r) => {
            let n = X(er, e.__scopePopover),
                o = t.useRef(!1),
                l = t.useRef(!1);
            return (0, f.jsx)(ei, {
                ...e,
                ref: r,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var r, a;
                    null == (r = e.onCloseAutoFocus) || r.call(e, t), t.defaultPrevented || (o.current || null == (a = n.triggerRef.current) || a.focus(), t.preventDefault()), o.current = !1, l.current = !1
                },
                onInteractOutside: t => {
                    var r, a;
                    null == (r = e.onInteractOutside) || r.call(e, t), t.defaultPrevented || (o.current = !0, "pointerdown" === t.detail.originalEvent.type && (l.current = !0));
                    let i = t.target;
                    (null == (a = n.triggerRef.current) ? void 0 : a.contains(i)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && l.current && t.preventDefault()
                }
            })
        }),
        ei = t.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                trapFocus: n,
                onOpenAutoFocus: o,
                onCloseAutoFocus: s,
                disableOutsidePointerEvents: u,
                onEscapeKeyDown: c,
                onPointerDownOutside: d,
                onFocusOutside: p,
                onInteractOutside: v,
                ...m
            } = e, h = X(er, r), g = W(r);
            return (0, a.f)(), (0, f.jsx)(i.f, {
                asChild: !0,
                loop: !0,
                trapped: n,
                onMountAutoFocus: o,
                onUnmountAutoFocus: s,
                children: (0, f.jsx)(l.f, {
                    asChild: !0,
                    disableOutsidePointerEvents: u,
                    onInteractOutside: v,
                    onEscapeKeyDown: c,
                    onPointerDownOutside: d,
                    onFocusOutside: p,
                    onDismiss: () => h.onOpenChange(!1),
                    children: (0, f.jsx)(T, {
                        "data-state": ed(h.open),
                        role: "dialog",
                        id: h.contentId,
                        ...g,
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
        es = "PopoverClose",
        eu = t.forwardRef((e, t) => {
            let {
                __scopePopover: n,
                ...o
            } = e, l = X(es, n);
            return (0, f.jsx)(d.V.button, {
                type: "button",
                ...o,
                ref: t,
                onClick: (0, r.f)(e.onClick, () => l.onOpenChange(!1))
            })
        });
    eu.displayName = es;
    var ec = t.forwardRef((e, t) => {
        let {
            __scopePopover: r,
            ...n
        } = e, o = W(r);
        return (0, f.jsx)(k, {
            ...o,
            ...n,
            ref: t
        })
    });

    function ed(e) {
        return e ? "open" : "closed"
    }
    ec.displayName = "PopoverArrow", e.s(["g", 0, G, "j", 0, ec, "K", 0, eu, "c", 0, en, "z", 0, et, "F", 0, Y, "d", 0, J], 539377)
}, 114903, e => {
    "use strict";
    var t = e.i(643766),
        r = e.i(950020),
        n = e.i(692178),
        o = e.i(120297),
        l = e.i(859726),
        a = e.i(257165),
        i = e.i(546633),
        s = e.i(103649),
        u = e.i(517952),
        c = e.i(981896),
        d = e.i(785517),
        f = "rovingFocusGroup.onEntryFocus",
        p = {
            bubbles: !1,
            cancelable: !0
        },
        v = "RovingFocusGroup",
        [m, h, g] = (0, n.f)(v),
        [y, x] = (0, l.c)(v, [g]),
        [w, b] = y(v),
        C = t.forwardRef((e, t) => (0, d.jsx)(m.Provider, {
            scope: e.__scopeRovingFocusGroup,
            children: (0, d.jsx)(m.Slot, {
                scope: e.__scopeRovingFocusGroup,
                children: (0, d.jsx)(E, {
                    ...e,
                    ref: t
                })
            })
        }));
    C.displayName = v;
    var E = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: l,
                orientation: a,
                loop: m = !1,
                dir: g,
                currentTabStopId: y,
                defaultCurrentTabStopId: x,
                onCurrentTabStopIdChange: b,
                onEntryFocus: C,
                preventScrollOnEntryFocus: E = !1,
                ...j
            } = e, S = t.useRef(null), R = (0, o.j)(n, S), T = (0, c.f)(g), [A, N] = (0, u.f)({
                prop: y,
                defaultProp: null != x ? x : null,
                onChange: b,
                caller: v
            }), [k, M] = t.useState(!1), O = (0, s.f)(C), D = h(l), I = t.useRef(!1), [L, F] = t.useState(0);
            return t.useEffect(() => {
                let e = S.current;
                if (e) return e.addEventListener(f, O), () => e.removeEventListener(f, O)
            }, [O]), (0, d.jsx)(w, {
                scope: l,
                orientation: a,
                dir: T,
                loop: m,
                currentTabStopId: A,
                onItemFocus: t.useCallback(e => N(e), [N]),
                onItemShiftTab: t.useCallback(() => M(!0), []),
                onFocusableItemAdd: t.useCallback(() => F(e => e + 1), []),
                onFocusableItemRemove: t.useCallback(() => F(e => e - 1), []),
                children: (0, d.jsx)(i.f.div, {
                    tabIndex: k || 0 === L ? -1 : 0,
                    "data-orientation": a,
                    ...j,
                    ref: R,
                    style: {
                        outline: "none",
                        ...e.style
                    },
                    onMouseDown: (0, r.f)(e.onMouseDown, () => {
                        I.current = !0
                    }),
                    onFocus: (0, r.f)(e.onFocus, e => {
                        let t = !I.current;
                        if (e.target === e.currentTarget && t && !k) {
                            let t = new CustomEvent(f, p);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = D().filter(e => e.focusable);
                                P([e.find(e => e.active), e.find(e => e.id === A), ...e].filter(Boolean).map(e => e.ref.current), E)
                            }
                        }
                        I.current = !1
                    }),
                    onBlur: (0, r.f)(e.onBlur, () => M(!1))
                })
            })
        }),
        j = "RovingFocusGroupItem",
        S = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: o,
                focusable: l = !0,
                active: s = !1,
                tabStopId: u,
                children: c,
                ...f
            } = e, p = (0, a.f)(), v = u || p, g = b(j, o), y = g.currentTabStopId === v, x = h(o), {
                onFocusableItemAdd: w,
                onFocusableItemRemove: C,
                currentTabStopId: E
            } = g;
            return t.useEffect(() => {
                if (l) return w(), () => C()
            }, [l, w, C]), (0, d.jsx)(m.ItemSlot, {
                scope: o,
                id: v,
                focusable: l,
                active: s,
                children: (0, d.jsx)(i.f.span, {
                    tabIndex: y ? 0 : -1,
                    "data-orientation": g.orientation,
                    ...f,
                    ref: n,
                    onMouseDown: (0, r.f)(e.onMouseDown, e => {
                        l ? g.onItemFocus(v) : e.preventDefault()
                    }),
                    onFocus: (0, r.f)(e.onFocus, () => g.onItemFocus(v)),
                    onKeyDown: (0, r.f)(e.onKeyDown, e => {
                        if ("Tab" === e.key && e.shiftKey) return void g.onItemShiftTab();
                        if (e.target !== e.currentTarget) return;
                        let t = function(e, t, r) {
                            var n;
                            let o = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                            if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return R[o]
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
                            setTimeout(() => P(o))
                        }
                    }),
                    children: "function" == typeof c ? c({
                        isCurrentTabStop: y,
                        hasTabStop: null != E
                    }) : c
                })
            })
        });
    S.displayName = j;
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

    function P(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            r = document.activeElement;
        for (let n of e)
            if (n === r || (n.focus({
                    preventScroll: t
                }), document.activeElement !== r)) return
    }
    e.s(["M", 0, S, "F", 0, C, "B", 0, x])
}, 548223, e => {
    "use strict";
    var t = e.i(643766),
        r = e.i(860663),
        n = e.i(790067),
        o = e.i(7724),
        l = e.i(292123),
        a = e.i(120297),
        i = e.i(859726),
        s = e.i(981896),
        u = e.i(434378),
        c = e.i(505953),
        d = e.i(615951),
        f = e.i(257165),
        p = e.i(718810),
        v = e.i(517365),
        m = e.i(760869),
        h = e.i(393225),
        g = e.i(103649),
        y = e.i(493430),
        x = e.i(206350),
        w = e.i(179510),
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
    var E = e.i(714724),
        j = e.i(633089),
        S = [" ", "Enter", "ArrowUp", "ArrowDown"],
        R = [" ", "Enter"],
        P = "Select",
        [T, A, N] = (0, l.f)(P),
        [k, M] = (0, i.c)(P, [N, p.y]),
        O = (0, p.y)(),
        [D, I] = k(P),
        [L, F] = k(P),
        _ = e => {
            let {
                __scopeSelect: r,
                children: n,
                open: o,
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
                form: x
            } = e, w = O(r), [C, E] = t.useState(null), [j, S] = t.useState(null), [R, P] = t.useState(!1), A = (0, s.f)(d), [N = !1, k] = (0, y.f)({
                prop: o,
                defaultProp: l,
                onChange: a
            }), [M, I] = (0, y.f)({
                prop: i,
                defaultProp: u,
                onChange: c
            }), F = t.useRef(null), _ = !C || x || !!C.closest("form"), [B, V] = t.useState(new Set), H = Array.from(B).map(e => e.props.value).join(";");
            return (0, b.jsx)(p.F, {
                ...w,
                children: (0, b.jsxs)(D, {
                    required: g,
                    scope: r,
                    trigger: C,
                    onTriggerChange: E,
                    valueNode: j,
                    onValueNodeChange: S,
                    valueNodeHasChildren: R,
                    onValueNodeHasChildrenChange: P,
                    contentId: (0, f.f)(),
                    value: M,
                    onValueChange: I,
                    open: N,
                    onOpenChange: k,
                    dir: A,
                    triggerPointerDownPosRef: F,
                    disabled: h,
                    children: [(0, b.jsx)(T.Provider, {
                        scope: r,
                        children: (0, b.jsx)(L, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: t.useCallback(e => {
                                V(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: t.useCallback(e => {
                                V(t => {
                                    let r = new Set(t);
                                    return r.delete(e), r
                                })
                            }, []),
                            children: n
                        })
                    }), _ ? (0, b.jsxs)(ew, {
                        "aria-hidden": !0,
                        required: g,
                        tabIndex: -1,
                        name: v,
                        autoComplete: m,
                        value: M,
                        onChange: e => I(e.target.value),
                        disabled: h,
                        form: x,
                        children: [void 0 === M ? (0, b.jsx)("option", {
                            value: ""
                        }) : null, Array.from(B)]
                    }, H) : null]
                })
            })
        };
    _.displayName = P;
    var B = "SelectTrigger",
        V = t.forwardRef((e, r) => {
            let {
                __scopeSelect: n,
                disabled: l = !1,
                ...i
            } = e, s = O(n), u = I(B, n), c = u.disabled || l, d = (0, a.j)(r, u.onTriggerChange), f = A(n), v = t.useRef("touch"), [h, g, y] = eb(e => {
                let t = f().filter(e => !e.disabled),
                    r = t.find(e => e.value === u.value),
                    n = eC(t, e, r);
                void 0 !== n && u.onValueChange(n.value)
            }), x = e => {
                c || (u.onOpenChange(!0), y()), e && (u.triggerPointerDownPosRef.current = {
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
                    onClick: (0, o.f)(i.onClick, e => {
                        e.currentTarget.focus(), "mouse" !== v.current && x(e)
                    }),
                    onPointerDown: (0, o.f)(i.onPointerDown, e => {
                        v.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (x(e), e.preventDefault())
                    }),
                    onKeyDown: (0, o.f)(i.onKeyDown, e => {
                        let t = "" !== h.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || g(e.key), (!t || " " !== e.key) && S.includes(e.key) && (x(), e.preventDefault())
                    })
                })
            })
        });
    V.displayName = B;
    var H = "SelectValue",
        U = t.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: n,
                style: o,
                children: l,
                placeholder: i = "",
                ...s
            } = e, u = I(H, r), {
                onValueNodeHasChildrenChange: c
            } = u, d = void 0 !== l, f = (0, a.j)(t, u.onValueNodeChange);
            return (0, x.f)(() => {
                c(d)
            }, [c, d]), (0, b.jsx)(m.V.span, {
                ...s,
                ref: f,
                style: {
                    pointerEvents: "none"
                },
                children: ex(u.value) ? (0, b.jsx)(b.Fragment, {
                    children: i
                }) : l
            })
        });
    U.displayName = H;
    var z = t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            children: n,
            ...o
        } = e;
        return (0, b.jsx)(m.V.span, {
            "aria-hidden": !0,
            ...o,
            ref: t,
            children: n || "▼"
        })
    });
    z.displayName = "SelectIcon";
    var W = e => (0, b.jsx)(v.f, {
        asChild: !0,
        ...e
    });
    W.displayName = "SelectPortal";
    var K = "SelectContent",
        X = t.forwardRef((e, n) => {
            let o = I(K, e.__scopeSelect),
                [l, a] = t.useState();
            return ((0, x.f)(() => {
                a(new DocumentFragment)
            }, []), o.open) ? (0, b.jsx)(Z, {
                ...e,
                ref: n
            }) : l ? r.createPortal((0, b.jsx)(Y, {
                scope: e.__scopeSelect,
                children: (0, b.jsx)(T.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, b.jsx)("div", {
                        children: e.children
                    })
                })
            }), l) : null
        });
    X.displayName = K;
    var [Y, q] = k(K), G = (0, h.f)("SelectContent.RemoveScroll"), Z = t.forwardRef((e, r) => {
        let {
            __scopeSelect: n,
            position: l = "item-aligned",
            onCloseAutoFocus: i,
            onEscapeKeyDown: s,
            onPointerDownOutside: f,
            side: p,
            sideOffset: v,
            align: m,
            alignOffset: h,
            arrowPadding: g,
            collisionBoundary: y,
            collisionPadding: x,
            sticky: w,
            hideWhenDetached: C,
            avoidCollisions: S,
            ...R
        } = e, P = I(K, n), [T, N] = t.useState(null), [k, M] = t.useState(null), O = (0, a.j)(r, e => N(e)), [D, L] = t.useState(null), [F, _] = t.useState(null), B = A(n), [V, H] = t.useState(!1), U = t.useRef(!1);
        t.useEffect(() => {
            if (T) return (0, E.f)(T)
        }, [T]), (0, c.f)();
        let z = t.useCallback(e => {
                let [t, ...r] = B().map(e => e.ref.current), [n] = r.slice(-1), o = document.activeElement;
                for (let r of e)
                    if (r === o || (null == r || r.scrollIntoView({
                            block: "nearest"
                        }), r === t && k && (k.scrollTop = 0), r === n && k && (k.scrollTop = k.scrollHeight), null == r || r.focus(), document.activeElement !== o)) return
            }, [B, k]),
            W = t.useCallback(() => z([D, T]), [z, D, T]);
        t.useEffect(() => {
            V && W()
        }, [V, W]);
        let {
            onOpenChange: X,
            triggerPointerDownPosRef: q
        } = P;
        t.useEffect(() => {
            if (T) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        var r, n, o, l;
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (null != (r = null == (o = q.current) ? void 0 : o.x) ? r : 0)),
                            y: Math.abs(Math.round(t.pageY) - (null != (n = null == (l = q.current) ? void 0 : l.y) ? n : 0))
                        }
                    },
                    r = r => {
                        e.x <= 10 && e.y <= 10 ? r.preventDefault() : T.contains(r.target) || X(!1), document.removeEventListener("pointermove", t), q.current = null
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
        }, [T, X, q]), t.useEffect(() => {
            let e = () => X(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [X]);
        let [Z, $] = eb(e => {
            let t = B().filter(e => !e.disabled),
                r = t.find(e => e.ref.current === document.activeElement),
                n = eC(t, e, r);
            n && setTimeout(() => n.ref.current.focus())
        }), ee = t.useCallback((e, t, r) => {
            let n = !U.current && !r;
            (void 0 !== P.value && P.value === t || n) && (L(e), n && (U.current = !0))
        }, [P.value]), et = t.useCallback(() => null == T ? void 0 : T.focus(), [T]), er = t.useCallback((e, t, r) => {
            let n = !U.current && !r;
            (void 0 !== P.value && P.value === t || n) && _(e)
        }, [P.value]), en = "popper" === l ? Q : J, eo = en === Q ? {
            side: p,
            sideOffset: v,
            align: m,
            alignOffset: h,
            arrowPadding: g,
            collisionBoundary: y,
            collisionPadding: x,
            sticky: w,
            hideWhenDetached: C,
            avoidCollisions: S
        } : {};
        return (0, b.jsx)(Y, {
            scope: n,
            content: T,
            viewport: k,
            onViewportChange: M,
            itemRefCallback: ee,
            selectedItem: D,
            onItemLeave: et,
            itemTextRefCallback: er,
            focusSelectedItem: W,
            selectedItemText: F,
            position: l,
            isPositioned: V,
            searchRef: Z,
            children: (0, b.jsx)(j.f, {
                as: G,
                allowPinchZoom: !0,
                children: (0, b.jsx)(d.f, {
                    asChild: !0,
                    trapped: P.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: (0, o.f)(i, e => {
                        var t;
                        null == (t = P.trigger) || t.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, b.jsx)(u.f, {
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
                            ...R,
                            ...eo,
                            onPlaced: () => H(!0),
                            ref: O,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...R.style
                            },
                            onKeyDown: (0, o.f)(R.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || $(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = B().filter(e => !e.disabled).map(e => e.ref.current);
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
    Z.displayName = "SelectContentImpl";
    var J = t.forwardRef((e, r) => {
        let {
            __scopeSelect: o,
            onPlaced: l,
            ...i
        } = e, s = I(K, o), u = q(K, o), [c, d] = t.useState(null), [f, p] = t.useState(null), v = (0, a.j)(r, e => p(e)), h = A(o), g = t.useRef(!1), y = t.useRef(!0), {
            viewport: w,
            selectedItem: C,
            selectedItemText: E,
            focusSelectedItem: j
        } = u, S = t.useCallback(() => {
            if (s.trigger && s.valueNode && c && f && w && C && E) {
                let e = s.trigger.getBoundingClientRect(),
                    t = f.getBoundingClientRect(),
                    r = s.valueNode.getBoundingClientRect(),
                    o = E.getBoundingClientRect();
                if ("rtl" !== s.dir) {
                    let l = o.left - t.left,
                        a = r.left - l,
                        i = e.left - a,
                        s = e.width + i,
                        u = Math.max(s, t.width),
                        d = window.innerWidth - 10,
                        f = (0, n.f)(a, [10, Math.max(10, d - u)]);
                    c.style.minWidth = s + "px", c.style.left = f + "px"
                } else {
                    let l = t.right - o.right,
                        a = window.innerWidth - r.right - l,
                        i = window.innerWidth - e.right - a,
                        s = e.width + i,
                        u = Math.max(s, t.width),
                        d = window.innerWidth - 10,
                        f = (0, n.f)(a, [10, Math.max(10, d - u)]);
                    c.style.minWidth = s + "px", c.style.right = f + "px"
                }
                let a = h(),
                    i = window.innerHeight - 20,
                    u = w.scrollHeight,
                    d = window.getComputedStyle(f),
                    p = parseInt(d.borderTopWidth, 10),
                    v = parseInt(d.paddingTop, 10),
                    m = parseInt(d.borderBottomWidth, 10),
                    y = p + v + u + parseInt(d.paddingBottom, 10) + m,
                    x = Math.min(5 * C.offsetHeight, y),
                    b = window.getComputedStyle(w),
                    j = parseInt(b.paddingTop, 10),
                    S = parseInt(b.paddingBottom, 10),
                    R = e.top + e.height / 2 - 10,
                    P = C.offsetHeight / 2,
                    T = p + v + (C.offsetTop + P);
                if (T <= R) {
                    let e = a.length > 0 && C === a[a.length - 1].ref.current;
                    c.style.bottom = "0px";
                    let t = Math.max(i - R, P + (e ? S : 0) + (f.clientHeight - w.offsetTop - w.offsetHeight) + m);
                    c.style.height = T + t + "px"
                } else {
                    let e = a.length > 0 && C === a[0].ref.current;
                    c.style.top = "0px";
                    let t = Math.max(R, p + w.offsetTop + (e ? j : 0) + P);
                    c.style.height = t + (y - T) + "px", w.scrollTop = T - R + w.offsetTop
                }
                c.style.margin = "".concat(10, "px 0"), c.style.minHeight = x + "px", c.style.maxHeight = i + "px", null == l || l(), requestAnimationFrame(() => g.current = !0)
            }
        }, [h, s.trigger, s.valueNode, c, f, w, C, E, s.dir, l]);
        (0, x.f)(() => S(), [S]);
        let [R, P] = t.useState();
        (0, x.f)(() => {
            f && P(window.getComputedStyle(f).zIndex)
        }, [f]);
        let T = t.useCallback(e => {
            e && !0 === y.current && (S(), null == j || j(), y.current = !1)
        }, [S, j]);
        return (0, b.jsx)($, {
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
                    zIndex: R
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
            collisionPadding: o = 10,
            ...l
        } = e, a = O(r);
        return (0, b.jsx)(p.c, {
            ...a,
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
    Q.displayName = "SelectPopperPosition";
    var [$, ee] = k(K, {}), et = "SelectViewport", er = t.forwardRef((e, r) => {
        let {
            __scopeSelect: n,
            nonce: l,
            ...i
        } = e, s = q(et, n), u = ee(et, n), c = (0, a.j)(r, s.onViewportChange), d = t.useRef(0);
        return (0, b.jsxs)(b.Fragment, {
            children: [(0, b.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: l
            }), (0, b.jsx)(T.Slot, {
                scope: n,
                children: (0, b.jsx)(m.V.div, {
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
                    onScroll: (0, o.f)(i.onScroll, e => {
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
                                    let l = o + e,
                                        a = Math.min(n, l),
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
    var en = "SelectGroup",
        [eo, el] = k(en);
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, o = (0, f.f)();
        return (0, b.jsx)(eo, {
            scope: r,
            id: o,
            children: (0, b.jsx)(m.V.div, {
                role: "group",
                "aria-labelledby": o,
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
        } = e, o = el(ea, r);
        return (0, b.jsx)(m.V.div, {
            id: o.id,
            ...n,
            ref: t
        })
    }).displayName = ea;
    var ei = "SelectItem",
        [es, eu] = k(ei),
        ec = t.forwardRef((e, r) => {
            let {
                __scopeSelect: n,
                value: l,
                disabled: i = !1,
                textValue: s,
                ...u
            } = e, c = I(ei, n), d = q(ei, n), p = c.value === l, [v, h] = t.useState(null != s ? s : ""), [g, y] = t.useState(!1), x = (0, a.j)(r, e => {
                var t;
                return null == (t = d.itemRefCallback) ? void 0 : t.call(d, e, l, i)
            }), w = (0, f.f)(), C = t.useRef("touch"), E = () => {
                i || (c.onValueChange(l), c.onOpenChange(!1))
            };
            if ("" === l) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, b.jsx)(es, {
                scope: n,
                value: l,
                disabled: i,
                textId: w,
                isSelected: p,
                onItemTextChange: t.useCallback(e => {
                    h(t => {
                        var r;
                        return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                    })
                }, []),
                children: (0, b.jsx)(T.ItemSlot, {
                    scope: n,
                    value: l,
                    disabled: i,
                    textValue: v,
                    children: (0, b.jsx)(m.V.div, {
                        role: "option",
                        "aria-labelledby": w,
                        "data-highlighted": g ? "" : void 0,
                        "aria-selected": p && g,
                        "data-state": p ? "checked" : "unchecked",
                        "aria-disabled": i || void 0,
                        "data-disabled": i ? "" : void 0,
                        tabIndex: i ? void 0 : -1,
                        ...u,
                        ref: x,
                        onFocus: (0, o.f)(u.onFocus, () => y(!0)),
                        onBlur: (0, o.f)(u.onBlur, () => y(!1)),
                        onClick: (0, o.f)(u.onClick, () => {
                            "mouse" !== C.current && E()
                        }),
                        onPointerUp: (0, o.f)(u.onPointerUp, () => {
                            "mouse" === C.current && E()
                        }),
                        onPointerDown: (0, o.f)(u.onPointerDown, e => {
                            C.current = e.pointerType
                        }),
                        onPointerMove: (0, o.f)(u.onPointerMove, e => {
                            if (C.current = e.pointerType, i) {
                                var t;
                                null == (t = d.onItemLeave) || t.call(d)
                            } else "mouse" === C.current && e.currentTarget.focus({
                                preventScroll: !0
                            })
                        }),
                        onPointerLeave: (0, o.f)(u.onPointerLeave, e => {
                            if (e.currentTarget === document.activeElement) {
                                var t;
                                null == (t = d.onItemLeave) || t.call(d)
                            }
                        }),
                        onKeyDown: (0, o.f)(u.onKeyDown, e => {
                            var t;
                            ((null == (t = d.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (R.includes(e.key) && E(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    ec.displayName = ei;
    var ed = "SelectItemText",
        ef = t.forwardRef((e, n) => {
            let {
                __scopeSelect: o,
                className: l,
                style: i,
                ...s
            } = e, u = I(ed, o), c = q(ed, o), d = eu(ed, o), f = F(ed, o), [p, v] = t.useState(null), h = (0, a.j)(n, e => v(e), d.onItemTextChange, e => {
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
            return (0, x.f)(() => (w(y), () => C(y)), [w, C, y]), (0, b.jsxs)(b.Fragment, {
                children: [(0, b.jsx)(m.V.span, {
                    id: d.textId,
                    ...s,
                    ref: h
                }), d.isSelected && u.valueNode && !u.valueNodeHasChildren ? r.createPortal(s.children, u.valueNode) : null]
            })
        });
    ef.displayName = ed;
    var ep = "SelectItemIndicator",
        ev = t.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                ...n
            } = e;
            return eu(ep, r).isSelected ? (0, b.jsx)(m.V.span, {
                "aria-hidden": !0,
                ...n,
                ref: t
            }) : null
        });
    ev.displayName = ep;
    var em = "SelectScrollUpButton";
    t.forwardRef((e, r) => {
        let n = q(em, e.__scopeSelect),
            o = ee(em, e.__scopeSelect),
            [l, i] = t.useState(!1),
            s = (0, a.j)(r, o.onScrollButtonChange);
        return (0, x.f)(() => {
            if (n.viewport && n.isPositioned) {
                let e = function() {
                        i(t.scrollTop > 0)
                    },
                    t = n.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [n.viewport, n.isPositioned]), l ? (0, b.jsx)(eg, {
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
        let n = q(eh, e.__scopeSelect),
            o = ee(eh, e.__scopeSelect),
            [l, i] = t.useState(!1),
            s = (0, a.j)(r, o.onScrollButtonChange);
        return (0, x.f)(() => {
            if (n.viewport && n.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        i(Math.ceil(t.scrollTop) < e)
                    },
                    t = n.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [n.viewport, n.isPositioned]), l ? (0, b.jsx)(eg, {
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
            onAutoScroll: l,
            ...a
        } = e, i = q("SelectScrollButton", n), s = t.useRef(null), u = A(n), c = t.useCallback(() => {
            null !== s.current && (window.clearInterval(s.current), s.current = null)
        }, []);
        return t.useEffect(() => () => c(), [c]), (0, x.f)(() => {
            var e;
            let t = u().find(e => e.ref.current === document.activeElement);
            null == t || null == (e = t.ref.current) || e.scrollIntoView({
                block: "nearest"
            })
        }, [u]), (0, b.jsx)(m.V.div, {
            "aria-hidden": !0,
            ...a,
            ref: r,
            style: {
                flexShrink: 0,
                ...a.style
            },
            onPointerDown: (0, o.f)(a.onPointerDown, () => {
                null === s.current && (s.current = window.setInterval(l, 50))
            }),
            onPointerMove: (0, o.f)(a.onPointerMove, () => {
                var e;
                null == (e = i.onItemLeave) || e.call(i), null === s.current && (s.current = window.setInterval(l, 50))
            }),
            onPointerLeave: (0, o.f)(a.onPointerLeave, () => {
                c()
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
    var ey = "SelectArrow";

    function ex(e) {
        return "" === e || void 0 === e
    }
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, o = O(r), l = I(ey, r), a = q(ey, r);
        return l.open && "popper" === a.position ? (0, b.jsx)(p.j, {
            ...o,
            ...n,
            ref: t
        }) : null
    }).displayName = ey;
    var ew = t.forwardRef((e, r) => {
        let {
            value: n,
            ...o
        } = e, l = t.useRef(null), i = (0, a.j)(r, l), s = (0, w.f)(n);
        return t.useEffect(() => {
            let e = l.current,
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
                ref: i,
                defaultValue: n
            })
        })
    });

    function eb(e) {
        let r = (0, g.f)(e),
            n = t.useRef(""),
            o = t.useRef(0),
            l = t.useCallback(e => {
                let t = n.current + e;
                r(t),
                    function e(t) {
                        n.current = t, window.clearTimeout(o.current), "" !== t && (o.current = window.setTimeout(() => e(""), 1e3))
                    }(t)
            }, [r]),
            a = t.useCallback(() => {
                n.current = "", window.clearTimeout(o.current)
            }, []);
        return t.useEffect(() => () => window.clearTimeout(o.current), []), [n, l, a]
    }

    function eC(e, t, r) {
        var n, o;
        let l = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            a = r ? e.indexOf(r) : -1,
            i = (n = e, o = Math.max(a, 0), n.map((e, t) => n[(o + t) % n.length]));
        1 === l.length && (i = i.filter(e => e !== r));
        let s = i.find(e => e.textValue.toLowerCase().startsWith(l.toLowerCase()));
        return s !== r ? s : void 0
    }
    ew.displayName = "BubbleSelect", e.s(["c", 0, X, "W", 0, z, "M", 0, ec, "j", 0, ev, "s", 0, ef, "z", 0, W, "F", 0, _, "d", 0, V, "A", 0, U, "n", 0, er], 548223)
}, 866491, e => {
    "use strict";
    var t, r, n = e.i(643766);

    function o(e, t) {
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

    function i() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return n.useCallback(a(...t), t)
    }
    var s = e.i(785517);

    function u(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            r = [],
            o = () => {
                let t = r.map(e => n.createContext(e));
                return function(r) {
                    let o = (null == r ? void 0 : r[e]) || t;
                    return n.useMemo(() => ({
                        ["__scope".concat(e)]: {
                            ...r,
                            [e]: o
                        }
                    }), [r, o])
                }
            };
        return o.scopeName = e, [function(t, o) {
            let l = n.createContext(o),
                a = r.length;
            r = [...r, o];
            let i = t => {
                var r;
                let {
                    scope: o,
                    children: i,
                    ...u
                } = t, c = (null == o || null == (r = o[e]) ? void 0 : r[a]) || l, d = n.useMemo(() => u, Object.values(u));
                return (0, s.jsx)(c.Provider, {
                    value: d,
                    children: i
                })
            };
            return i.displayName = t + "Provider", [i, function(r, i) {
                var s;
                let u = (null == i || null == (s = i[e]) ? void 0 : s[a]) || l,
                    c = n.useContext(u);
                if (c) return c;
                if (void 0 !== o) return o;
                throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            let o = t[0];
            if (1 === t.length) return o;
            let l = () => {
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
                    return n.useMemo(() => ({
                        ["__scope".concat(o.scopeName)]: r
                    }), [r])
                }
            };
            return l.scopeName = o.scopeName, l
        }(o, ...t)]
    }
    var c = e.i(860663),
        d = n.forwardRef((e, t) => {
            let {
                children: r,
                ...o
            } = e, l = n.Children.toArray(r), a = l.find(v);
            if (a) {
                let e = a.props.children,
                    r = l.map(t => t !== a ? t : n.Children.count(e) > 1 ? n.Children.only(null) : n.isValidElement(e) ? e.props.children : null);
                return (0, s.jsx)(f, {
                    ...o,
                    ref: t,
                    children: n.isValidElement(e) ? n.cloneElement(e, void 0, r) : null
                })
            }
            return (0, s.jsx)(f, {
                ...o,
                ref: t,
                children: r
            })
        });
    d.displayName = "Slot";
    var f = n.forwardRef((e, t) => {
        let {
            children: r,
            ...o
        } = e;
        if (n.isValidElement(r)) {
            var l, i, s;
            let e, u, c = (u = (e = null == (i = Object.getOwnPropertyDescriptor((l = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in e && e.isReactWarning) ? l.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? l.props.ref : l.props.ref || l.ref;
            return n.cloneElement(r, {
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
                }(o, r.props),
                ref: t ? a(t, c) : c
            })
        }
        return n.Children.count(r) > 1 ? n.Children.only(null) : null
    });
    f.displayName = "SlotClone";
    var p = e => {
        let {
            children: t
        } = e;
        return (0, s.jsx)(s.Fragment, {
            children: t
        })
    };

    function v(e) {
        return n.isValidElement(e) && e.type === p
    }
    var m = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
        let r = n.forwardRef((e, r) => {
            let {
                asChild: n,
                ...o
            } = e, l = n ? d : t;
            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, s.jsx)(l, {
                ...o,
                ref: r
            })
        });
        return r.displayName = "Primitive.".concat(t), {
            ...e,
            [t]: r
        }
    }, {});

    function h(e) {
        let t = n.useRef(e);
        return n.useEffect(() => {
            t.current = e
        }), n.useMemo(() => function() {
            for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
            return null == (e = t.current) ? void 0 : e.call(t, ...n)
        }, [])
    }
    var g = "dismissableLayer.update",
        y = n.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        x = n.forwardRef((e, r) => {
            var l, a;
            let {
                disableOutsidePointerEvents: u = !1,
                onEscapeKeyDown: c,
                onPointerDownOutside: d,
                onFocusOutside: f,
                onInteractOutside: p,
                onDismiss: v,
                ...x
            } = e, C = n.useContext(y), [E, j] = n.useState(null), S = null != (l = null == E ? void 0 : E.ownerDocument) ? l : null == (a = globalThis) ? void 0 : a.document, [, R] = n.useState({}), P = i(r, e => j(e)), T = Array.from(C.layers), [A] = [...C.layersWithOutsidePointerEventsDisabled].slice(-1), N = T.indexOf(A), k = E ? T.indexOf(E) : -1, M = C.layersWithOutsidePointerEventsDisabled.size > 0, O = k >= N, D = function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    o = h(e),
                    l = n.useRef(!1),
                    a = n.useRef(() => {});
                return n.useEffect(() => {
                    let e = e => {
                            if (e.target && !l.current) {
                                let t = function() {
                                        b("dismissableLayer.pointerDownOutside", o, n, {
                                            discrete: !0
                                        })
                                    },
                                    n = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (r.removeEventListener("click", a.current), a.current = t, r.addEventListener("click", a.current, {
                                    once: !0
                                })) : t()
                            } else r.removeEventListener("click", a.current);
                            l.current = !1
                        },
                        t = window.setTimeout(() => {
                            r.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(t), r.removeEventListener("pointerdown", e), r.removeEventListener("click", a.current)
                    }
                }, [r, o]), {
                    onPointerDownCapture: () => l.current = !0
                }
            }(e => {
                let t = e.target,
                    r = [...C.branches].some(e => e.contains(t));
                O && !r && (null == d || d(e), null == p || p(e), e.defaultPrevented || null == v || v())
            }, S), I = function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    o = h(e),
                    l = n.useRef(!1);
                return n.useEffect(() => {
                    let e = e => {
                        e.target && !l.current && b("dismissableLayer.focusOutside", o, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return r.addEventListener("focusin", e), () => r.removeEventListener("focusin", e)
                }, [r, o]), {
                    onFocusCapture: () => l.current = !0,
                    onBlurCapture: () => l.current = !1
                }
            }(e => {
                let t = e.target;
                ![...C.branches].some(e => e.contains(t)) && (null == f || f(e), null == p || p(e), e.defaultPrevented || null == v || v())
            }, S);
            return ! function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    o = h(e);
                n.useEffect(() => {
                    let e = e => {
                        "Escape" === e.key && o(e)
                    };
                    return r.addEventListener("keydown", e, {
                        capture: !0
                    }), () => r.removeEventListener("keydown", e, {
                        capture: !0
                    })
                }, [o, r])
            }(e => {
                k === C.layers.size - 1 && (null == c || c(e), !e.defaultPrevented && v && (e.preventDefault(), v()))
            }, S), n.useEffect(() => {
                if (E) return u && (0 === C.layersWithOutsidePointerEventsDisabled.size && (t = S.body.style.pointerEvents, S.body.style.pointerEvents = "none"), C.layersWithOutsidePointerEventsDisabled.add(E)), C.layers.add(E), w(), () => {
                    u && 1 === C.layersWithOutsidePointerEventsDisabled.size && (S.body.style.pointerEvents = t)
                }
            }, [E, S, u, C]), n.useEffect(() => () => {
                E && (C.layers.delete(E), C.layersWithOutsidePointerEventsDisabled.delete(E), w())
            }, [E, C]), n.useEffect(() => {
                let e = () => R({});
                return document.addEventListener(g, e), () => document.removeEventListener(g, e)
            }, []), (0, s.jsx)(m.div, {
                ...x,
                ref: P,
                style: {
                    pointerEvents: M ? O ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: o(e.onFocusCapture, I.onFocusCapture),
                onBlurCapture: o(e.onBlurCapture, I.onBlurCapture),
                onPointerDownCapture: o(e.onPointerDownCapture, D.onPointerDownCapture)
            })
        });

    function w() {
        let e = new CustomEvent(g);
        document.dispatchEvent(e)
    }

    function b(e, t, r, n) {
        let {
            discrete: o
        } = n, l = r.originalEvent.target, a = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: r
        });
        if (t && l.addEventListener(e, t, {
                once: !0
            }), o) l && c.flushSync(() => l.dispatchEvent(a));
        else l.dispatchEvent(a)
    }
    x.displayName = "DismissableLayer", n.forwardRef((e, t) => {
        let r = n.useContext(y),
            o = n.useRef(null),
            l = i(t, o);
        return n.useEffect(() => {
            let e = o.current;
            if (e) return r.branches.add(e), () => {
                r.branches.delete(e)
            }
        }, [r.branches]), (0, s.jsx)(m.div, {
            ...e,
            ref: l
        })
    }).displayName = "DismissableLayerBranch";
    var C = (null == (r = globalThis) ? void 0 : r.document) ? n.useLayoutEffect : () => {},
        E = n["useId".toString()] || (() => void 0),
        j = 0,
        S = e.i(980891),
        R = e.i(350303),
        P = n.forwardRef((e, t) => {
            let {
                children: r,
                width: n = 10,
                height: o = 5,
                ...l
            } = e;
            return (0, s.jsx)(m.svg, {
                ...l,
                ref: t,
                width: n,
                height: o,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? r : (0, s.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    P.displayName = "Arrow";
    var T = "Popper",
        [A, N] = u(T),
        [k, M] = A(T),
        O = e => {
            let {
                __scopePopper: t,
                children: r
            } = e, [o, l] = n.useState(null);
            return (0, s.jsx)(k, {
                scope: t,
                anchor: o,
                onAnchorChange: l,
                children: r
            })
        };
    O.displayName = T;
    var D = "PopperAnchor",
        I = n.forwardRef((e, t) => {
            let {
                __scopePopper: r,
                virtualRef: o,
                ...l
            } = e, a = M(D, r), u = n.useRef(null), c = i(t, u);
            return n.useEffect(() => {
                a.onAnchorChange((null == o ? void 0 : o.current) || u.current)
            }), o ? null : (0, s.jsx)(m.div, {
                ...l,
                ref: c
            })
        });
    I.displayName = D;
    var L = "PopperContent",
        [F, _] = A(L),
        B = n.forwardRef((e, t) => {
            var r, o, l, a, u, c, d, f;
            let {
                __scopePopper: p,
                side: v = "bottom",
                sideOffset: g = 0,
                align: y = "center",
                alignOffset: x = 0,
                arrowPadding: w = 0,
                avoidCollisions: b = !0,
                collisionBoundary: E = [],
                collisionPadding: j = 0,
                sticky: P = "partial",
                hideWhenDetached: T = !1,
                updatePositionStrategy: A = "optimized",
                onPlaced: N,
                ...k
            } = e, O = M(L, p), [D, I] = n.useState(null), _ = i(t, e => I(e)), [B, V] = n.useState(null), H = function(e) {
                let [t, r] = n.useState(void 0);
                return C(() => {
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
            }(B), U = null != (r = null == H ? void 0 : H.width) ? r : 0, X = null != (o = null == H ? void 0 : H.height) ? o : 0, Y = "number" == typeof j ? j : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...j
            }, q = Array.isArray(E) ? E : [E], G = q.length > 0, Z = {
                padding: Y,
                boundary: q.filter(z),
                altBoundary: G
            }, {
                refs: J,
                floatingStyles: Q,
                placement: $,
                isPositioned: ee,
                middlewareData: et
            } = (0, S.E)({
                strategy: "fixed",
                placement: v + ("center" !== y ? "-" + y : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, R.n)(...t, {
                        animationFrame: "always" === A
                    })
                },
                elements: {
                    reference: O.anchor
                },
                middleware: [(0, S.T)({
                    mainAxis: g + X,
                    alignmentAxis: x
                }), b && (0, S.e)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === P ? (0, S.n)() : void 0,
                    ...Z
                }), b && (0, S.x)({
                    ...Z
                }), (0, S.o)({
                    ...Z,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: n,
                            availableHeight: o
                        } = e, {
                            width: l,
                            height: a
                        } = r.reference, i = t.floating.style;
                        i.setProperty("--radix-popper-available-width", "".concat(n, "px")), i.setProperty("--radix-popper-available-height", "".concat(o, "px")), i.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), i.setProperty("--radix-popper-anchor-height", "".concat(a, "px"))
                    }
                }), B && (0, S.P)({
                    element: B,
                    padding: w
                }), W({
                    arrowWidth: U,
                    arrowHeight: X
                }), T && (0, S.c)({
                    strategy: "referenceHidden",
                    ...Z
                })]
            }), [er, en] = K($), eo = h(N);
            C(() => {
                ee && (null == eo || eo())
            }, [ee, eo]);
            let el = null == (l = et.arrow) ? void 0 : l.x,
                ea = null == (a = et.arrow) ? void 0 : a.y,
                ei = (null == (u = et.arrow) ? void 0 : u.centerOffset) !== 0,
                [es, eu] = n.useState();
            return C(() => {
                D && eu(window.getComputedStyle(D).zIndex)
            }, [D]), (0, s.jsx)("div", {
                ref: J.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...Q,
                    transform: ee ? Q.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: es,
                    "--radix-popper-transform-origin": [null == (c = et.transformOrigin) ? void 0 : c.x, null == (d = et.transformOrigin) ? void 0 : d.y].join(" "),
                    ...(null == (f = et.hide) ? void 0 : f.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, s.jsx)(F, {
                    scope: p,
                    placedSide: er,
                    onArrowChange: V,
                    arrowX: el,
                    arrowY: ea,
                    shouldHideArrow: ei,
                    children: (0, s.jsx)(m.div, {
                        "data-side": er,
                        "data-align": en,
                        ...k,
                        ref: _,
                        style: {
                            ...k.style,
                            animation: ee ? void 0 : "none"
                        }
                    })
                })
            })
        });
    B.displayName = L;
    var V = "PopperArrow",
        H = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        U = n.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, o = _(V, r), l = H[o.placedSide];
            return (0, s.jsx)("span", {
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
                children: (0, s.jsx)(P, {
                    ...n,
                    ref: t,
                    style: {
                        ...n.style,
                        display: "block"
                    }
                })
            })
        });

    function z(e) {
        return null !== e
    }
    U.displayName = V;
    var W = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, n, o, l, a;
            let {
                placement: i,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, v] = K(i), m = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [v], h = (null != (r = null == (l = u.arrow) ? void 0 : l.x) ? r : 0) + d / 2, g = (null != (n = null == (a = u.arrow) ? void 0 : a.y) ? n : 0) + f / 2, y = "", x = "";
            return "bottom" === p ? (y = c ? m : "".concat(h, "px"), x = "".concat(-f, "px")) : "top" === p ? (y = c ? m : "".concat(h, "px"), x = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), x = c ? m : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), x = c ? m : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: x
                }
            }
        }
    });

    function K(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    var X = n.forwardRef((e, t) => {
        var r, o;
        let {
            container: l,
            ...a
        } = e, [i, u] = n.useState(!1);
        C(() => u(!0), []);
        let d = l || i && (null == (o = globalThis) || null == (r = o.document) ? void 0 : r.body);
        return d ? c.default.createPortal((0, s.jsx)(m.div, {
            ...a,
            ref: t
        }), d) : null
    });
    X.displayName = "Portal";
    var Y = e => {
        var t, r, o;
        let l, a, {
                present: s,
                children: u
            } = e,
            c = function(e) {
                var t, r;
                let [o, l] = n.useState(), a = n.useRef({}), i = n.useRef(e), s = n.useRef("none"), [u, c] = (t = e ? "mounted" : "unmounted", r = {
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
                }, n.useReducer((e, t) => {
                    let n = r[e][t];
                    return null != n ? n : e
                }, t));
                return n.useEffect(() => {
                    let e = q(a.current);
                    s.current = "mounted" === u ? e : "none"
                }, [u]), C(() => {
                    let t = a.current,
                        r = i.current;
                    if (r !== e) {
                        let n = s.current,
                            o = q(t);
                        e ? c("MOUNT") : "none" === o || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : r && n !== o ? c("ANIMATION_OUT") : c("UNMOUNT"), i.current = e
                    }
                }, [e, c]), C(() => {
                    if (o) {
                        var e;
                        let t, r = null != (e = o.ownerDocument.defaultView) ? e : window,
                            n = e => {
                                let n = q(a.current).includes(e.animationName);
                                if (e.target === o && n && (c("ANIMATION_END"), !i.current)) {
                                    let e = o.style.animationFillMode;
                                    o.style.animationFillMode = "forwards", t = r.setTimeout(() => {
                                        "forwards" === o.style.animationFillMode && (o.style.animationFillMode = e)
                                    })
                                }
                            },
                            l = e => {
                                e.target === o && (s.current = q(a.current))
                            };
                        return o.addEventListener("animationstart", l), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n), () => {
                            r.clearTimeout(t), o.removeEventListener("animationstart", l), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                        }
                    }
                    c("ANIMATION_END")
                }, [o, c]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(u),
                    ref: n.useCallback(e => {
                        e && (a.current = getComputedStyle(e)), l(e)
                    }, [])
                }
            }(s),
            d = "function" == typeof u ? u({
                present: c.isPresent
            }) : n.Children.only(u),
            f = i(c.ref, (a = (l = null == (r = Object.getOwnPropertyDescriptor((t = d).props, "ref")) ? void 0 : r.get) && "isReactWarning" in l && l.isReactWarning) ? t.ref : (a = (l = null == (o = Object.getOwnPropertyDescriptor(t, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? t.props.ref : t.props.ref || t.ref);
        return "function" == typeof u || c.isPresent ? n.cloneElement(d, {
            ref: f
        }) : null
    };

    function q(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    Y.displayName = "Presence";
    var G = n.forwardRef((e, t) => (0, s.jsx)(m.span, {
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
    G.displayName = "VisuallyHidden";
    var [Z, J] = u("Tooltip", [N]), Q = N(), $ = "TooltipProvider", ee = "tooltip.open", [et, er] = Z($), en = e => {
        let {
            __scopeTooltip: t,
            delayDuration: r = 700,
            skipDelayDuration: o = 300,
            disableHoverableContent: l = !1,
            children: a
        } = e, [i, u] = n.useState(!0), c = n.useRef(!1), d = n.useRef(0);
        return n.useEffect(() => {
            let e = d.current;
            return () => window.clearTimeout(e)
        }, []), (0, s.jsx)(et, {
            scope: t,
            isOpenDelayed: i,
            delayDuration: r,
            onOpen: n.useCallback(() => {
                window.clearTimeout(d.current), u(!1)
            }, []),
            onClose: n.useCallback(() => {
                window.clearTimeout(d.current), d.current = window.setTimeout(() => u(!0), o)
            }, [o]),
            isPointerInTransitRef: c,
            onPointerInTransitChange: n.useCallback(e => {
                c.current = e
            }, []),
            disableHoverableContent: l,
            children: a
        })
    };
    en.displayName = $;
    var eo = "Tooltip",
        [el, ea] = Z(eo),
        ei = e => {
            let {
                __scopeTooltip: t,
                children: r,
                open: o,
                defaultOpen: l = !1,
                onOpenChange: a,
                disableHoverableContent: i,
                delayDuration: u
            } = e, c = er(eo, e.__scopeTooltip), d = Q(t), [f, p] = n.useState(null), v = function() {
                let [e, t] = n.useState(E());
                return C(() => {
                    t(e => null != e ? e : String(j++))
                }, [void 0]), e ? "radix-".concat(e) : ""
            }(), m = n.useRef(0), g = null != i ? i : c.disableHoverableContent, y = null != u ? u : c.delayDuration, x = n.useRef(!1), [w = !1, b] = function(e) {
                let {
                    prop: t,
                    defaultProp: r,
                    onChange: o = () => {}
                } = e, [l, a] = function(e) {
                    let {
                        defaultProp: t,
                        onChange: r
                    } = e, o = n.useState(t), [l] = o, a = n.useRef(l), i = h(r);
                    return n.useEffect(() => {
                        a.current !== l && (i(l), a.current = l)
                    }, [l, a, i]), o
                }({
                    defaultProp: r,
                    onChange: o
                }), i = void 0 !== t, s = i ? t : l, u = h(o);
                return [s, n.useCallback(e => {
                    if (i) {
                        let r = "function" == typeof e ? e(t) : e;
                        r !== t && u(r)
                    } else a(e)
                }, [i, t, a, u])]
            }({
                prop: o,
                defaultProp: l,
                onChange: e => {
                    e ? (c.onOpen(), document.dispatchEvent(new CustomEvent(ee))) : c.onClose(), null == a || a(e)
                }
            }), S = n.useMemo(() => w ? x.current ? "delayed-open" : "instant-open" : "closed", [w]), R = n.useCallback(() => {
                window.clearTimeout(m.current), m.current = 0, x.current = !1, b(!0)
            }, [b]), P = n.useCallback(() => {
                window.clearTimeout(m.current), m.current = 0, b(!1)
            }, [b]), T = n.useCallback(() => {
                window.clearTimeout(m.current), m.current = window.setTimeout(() => {
                    x.current = !0, b(!0), m.current = 0
                }, y)
            }, [y, b]);
            return n.useEffect(() => () => {
                m.current && (window.clearTimeout(m.current), m.current = 0)
            }, []), (0, s.jsx)(O, {
                ...d,
                children: (0, s.jsx)(el, {
                    scope: t,
                    contentId: v,
                    open: w,
                    stateAttribute: S,
                    trigger: f,
                    onTriggerChange: p,
                    onTriggerEnter: n.useCallback(() => {
                        c.isOpenDelayed ? T() : R()
                    }, [c.isOpenDelayed, T, R]),
                    onTriggerLeave: n.useCallback(() => {
                        g ? P() : (window.clearTimeout(m.current), m.current = 0)
                    }, [P, g]),
                    onOpen: R,
                    onClose: P,
                    disableHoverableContent: g,
                    children: r
                })
            })
        };
    ei.displayName = eo;
    var es = "TooltipTrigger",
        eu = n.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                ...l
            } = e, a = ea(es, r), u = er(es, r), c = Q(r), d = i(t, n.useRef(null), a.onTriggerChange), f = n.useRef(!1), p = n.useRef(!1), v = n.useCallback(() => f.current = !1, []);
            return n.useEffect(() => () => document.removeEventListener("pointerup", v), [v]), (0, s.jsx)(I, {
                asChild: !0,
                ...c,
                children: (0, s.jsx)(m.button, {
                    "aria-describedby": a.open ? a.contentId : void 0,
                    "data-state": a.stateAttribute,
                    ...l,
                    ref: d,
                    onPointerMove: o(e.onPointerMove, e => {
                        "touch" !== e.pointerType && (p.current || u.isPointerInTransitRef.current || (a.onTriggerEnter(), p.current = !0))
                    }),
                    onPointerLeave: o(e.onPointerLeave, () => {
                        a.onTriggerLeave(), p.current = !1
                    }),
                    onPointerDown: o(e.onPointerDown, () => {
                        f.current = !0, document.addEventListener("pointerup", v, {
                            once: !0
                        })
                    }),
                    onFocus: o(e.onFocus, () => {
                        f.current || a.onOpen()
                    }),
                    onBlur: o(e.onBlur, a.onClose),
                    onClick: o(e.onClick, a.onClose)
                })
            })
        });
    eu.displayName = es;
    var ec = "TooltipPortal",
        [ed, ef] = Z(ec, {
            forceMount: void 0
        }),
        ep = e => {
            let {
                __scopeTooltip: t,
                forceMount: r,
                children: n,
                container: o
            } = e, l = ea(ec, t);
            return (0, s.jsx)(ed, {
                scope: t,
                forceMount: r,
                children: (0, s.jsx)(Y, {
                    present: r || l.open,
                    children: (0, s.jsx)(X, {
                        asChild: !0,
                        container: o,
                        children: n
                    })
                })
            })
        };
    ep.displayName = ec;
    var ev = "TooltipContent",
        em = n.forwardRef((e, t) => {
            let r = ef(ev, e.__scopeTooltip),
                {
                    forceMount: n = r.forceMount,
                    side: o = "top",
                    ...l
                } = e,
                a = ea(ev, e.__scopeTooltip);
            return (0, s.jsx)(Y, {
                present: n || a.open,
                children: a.disableHoverableContent ? (0, s.jsx)(ex, {
                    side: o,
                    ...l,
                    ref: t
                }) : (0, s.jsx)(eh, {
                    side: o,
                    ...l,
                    ref: t
                })
            })
        }),
        eh = n.forwardRef((e, t) => {
            let r = ea(ev, e.__scopeTooltip),
                o = er(ev, e.__scopeTooltip),
                l = n.useRef(null),
                a = i(t, l),
                [u, c] = n.useState(null),
                {
                    trigger: d,
                    onClose: f
                } = r,
                p = l.current,
                {
                    onPointerInTransitChange: v
                } = o,
                m = n.useCallback(() => {
                    c(null), v(!1)
                }, [v]),
                h = n.useCallback((e, t) => {
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
                    }(r))), v(!0)
                }, [v]);
            return n.useEffect(() => () => m(), [m]), n.useEffect(() => {
                if (d && p) {
                    let e = e => h(e, p),
                        t = e => h(e, d);
                    return d.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t), () => {
                        d.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                    }
                }
            }, [d, p, h, m]), n.useEffect(() => {
                if (u) {
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
                                for (let e = 0, l = t.length - 1; e < t.length; l = e++) {
                                    let a = t[e].x,
                                        i = t[e].y,
                                        s = t[l].x,
                                        u = t[l].y;
                                    i > n != u > n && r < (s - a) * (n - i) / (u - i) + a && (o = !o)
                                }
                                return o
                            }(r, u);
                        n ? m() : o && (m(), f())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [d, p, u, f, m]), (0, s.jsx)(ex, {
                ...e,
                ref: a
            })
        }),
        [eg, ey] = Z(eo, {
            isInside: !1
        }),
        ex = n.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                children: o,
                "aria-label": l,
                onEscapeKeyDown: a,
                onPointerDownOutside: i,
                ...u
            } = e, c = ea(ev, r), d = Q(r), {
                onClose: f
            } = c;
            return n.useEffect(() => (document.addEventListener(ee, f), () => document.removeEventListener(ee, f)), [f]), n.useEffect(() => {
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
            }, [c.trigger, f]), (0, s.jsx)(x, {
                asChild: !0,
                disableOutsidePointerEvents: !1,
                onEscapeKeyDown: a,
                onPointerDownOutside: i,
                onFocusOutside: e => e.preventDefault(),
                onDismiss: f,
                children: (0, s.jsxs)(B, {
                    "data-state": c.stateAttribute,
                    ...d,
                    ...u,
                    ref: t,
                    style: {
                        ...u.style,
                        "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                        "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                        "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                        "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                        "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                    },
                    children: [(0, s.jsx)(p, {
                        children: o
                    }), (0, s.jsx)(eg, {
                        scope: r,
                        isInside: !0,
                        children: (0, s.jsx)(G, {
                            id: c.contentId,
                            role: "tooltip",
                            children: l || o
                        })
                    })]
                })
            })
        });
    em.displayName = ev;
    var ew = "TooltipArrow",
        eb = n.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                ...n
            } = e, o = Q(r);
            return ey(ew, r).isInside ? null : (0, s.jsx)(U, {
                ...o,
                ...n,
                ref: t
            })
        });
    eb.displayName = ew, e.s(["j", 0, eb, "c", 0, em, "z", 0, ep, "g", 0, en, "F", 0, ei, "d", 0, eu], 866491)
}, 290600, e => {
    "use strict";
    var t = e.i(515961),
        r = e.i(699576),
        n = e.i(335020),
        o = e.i(643766),
        l = e.i(637068);
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
        v = (0, o.forwardRef)((e, v) => {
            let m, {
                className: h,
                icon: g,
                ariaLabel: y,
                isDisabled: x = !1,
                isCircular: w = !1,
                isSelected: b = !1,
                size: C = "Large",
                variant: E = "Emphasis",
                iconColor: j = "Default",
                asChild: S,
                children: R,
                ...P
            } = e;
            m = x ? c[E] : b ? d[E] : u[E];
            let T = (0, n.U)("foundation-web-icon-button", x ? r.f : [t.Y, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", a[C], s[C][w ? "circular" : "square"], m, h),
                A = o.default.createElement(o.default.Fragment, null, o.default.createElement(t.v, null), o.default.createElement("span", {
                    className: (0, n.U)("icon", g, i[C], x ? p[j][E] : f[j][E])
                }));
            if (S) {
                let {
                    as: e,
                    ...t
                } = P, r = o.default.Children.only(R);
                return o.default.createElement(l.M, {
                    ref: v,
                    ...t,
                    className: T,
                    "aria-label": y,
                    "aria-disabled": x || void 0
                }, o.default.cloneElement(r, {}, A))
            }
            if ("a" === P.as) {
                let {
                    as: e,
                    href: t,
                    ...r
                } = P;
                return o.default.createElement("a", {
                    ref: v,
                    ...r,
                    "aria-label": y,
                    "aria-disabled": x,
                    href: x ? void 0 : t,
                    className: T
                }, A)
            }
            let {
                as: N,
                ...k
            } = P;
            return o.default.createElement("button", {
                ref: v,
                type: "button",
                ...k,
                "aria-label": y,
                disabled: x,
                className: T
            }, A)
        });
    e.s(["f", 0, v])
}, 943236, e => {
    "use strict";
    var t = e.i(335020),
        r = e.i(643766);
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
        o = r.default.forwardRef((e, o) => {
            let {
                className: l,
                size: a = "Large",
                variant: i = "Determinate",
                value: s = 0,
                showValue: u = !1,
                ariaLabel: c,
                ...d
            } = e, {
                dimension: f,
                strokeWidth: p,
                textClass: v,
                valueContainerSize: m
            } = n[a], h = (f - p) / 2, g = 2 * Math.PI * h, y = f / 2, x = Math.min(100, Math.max(0, s)), w = u && void 0 !== m ? m : f, b = "Determinate" === i;
            return r.default.createElement("div", {
                ref: o,
                className: (0, t.U)("foundation-web-progress-circle inline-flex items-center justify-center", l),
                role: "progressbar",
                "aria-label": c,
                "aria-valuemin": b ? 0 : void 0,
                "aria-valuemax": b ? 100 : void 0,
                "aria-valuenow": b ? x : void 0,
                style: {
                    width: w,
                    height: w
                },
                ...d
            }, r.default.createElement("svg", {
                width: f,
                height: f,
                viewBox: "0 0 ".concat(f, " ").concat(f),
                className: "relative"
            }, r.default.createElement("circle", {
                cx: y,
                cy: y,
                r: h,
                fill: "none",
                strokeWidth: p,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), r.default.createElement("circle", {
                cx: y,
                cy: y,
                r: h,
                fill: "none",
                strokeWidth: p,
                strokeDasharray: b ? g : "".concat(.75 * g, " ").concat(.25 * g),
                strokeDashoffset: b ? g * (1 - x / 100) : 0,
                strokeLinecap: "round",
                className: (0, t.U)(!b && "foundation-web-progress-circle-indeterminate"),
                style: b ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), b && u && "Large" === a && r.default.createElement("div", {
                className: (0, t.U)("absolute content-emphasis flex items-center justify-center", v),
                "aria-hidden": "true"
            }, r.default.createElement("span", null, Math.round(x)), r.default.createElement("span", null, "%")))
        });
    o.displayName = "ProgressCircle", e.s(["f", 0, o])
}, 250669, 788366, e => {
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
    e.s(["f", 0, n], 788366);
    var o = e.i(866491);
    e.s(["W", 0, function(e) {
        let {
            position: l,
            hasBeak: a = !0,
            title: i,
            description: s,
            ariaLabel: u,
            delayDurationMs: c = 500,
            children: d,
            open: f,
            onOpenChange: p,
            contentClassName: v
        } = e, [m, h] = l.split("-"), g = null != u ? u : "string" == typeof i && null == s ? i : void 0;
        return r.createElement(o.g, {
            delayDuration: c
        }, r.createElement(o.F, {
            open: f,
            onOpenChange: p
        }, d, r.createElement(o.z, null, r.createElement(o.c, {
            side: m,
            align: h,
            "aria-label": g,
            className: (0, t.U)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", v),
            sideOffset: 5
        }, a && r.createElement(o.j, {
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
            className: l
        } = e;
        return r.createElement(o.d, {
            asChild: n,
            className: l
        }, t)
    }], 250669)
}, 600937, e => {
    "use strict";
    var t = e.i(643766);
    let r = 0;
    e.s(["f", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            n = (0, t.useRef)();
        return n.current || (r += 1, n.current = "".concat(e).concat(r)), n.current
    }])
}]);

//# debugId=430b576b-4ff2-d348-710f-9dbea0cfbd79
//# sourceMappingURL=2f7qra3ecgnfo.js.map
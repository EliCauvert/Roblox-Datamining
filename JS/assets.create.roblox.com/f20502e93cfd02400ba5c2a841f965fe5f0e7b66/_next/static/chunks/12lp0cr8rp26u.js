;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "38cce3a9-4ce3-313c-3ea5-860dd8648fcf")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 799724, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(197649),
        r = e.i(840934),
        i = e.i(149285),
        o = e.i(221628),
        l = e.i(924175),
        a = e.i(112223);
    e.i(511952);
    var s = t.forwardRef((e, n) => {
        let {
            children: r,
            ...i
        } = e, l = t.Children.toArray(r), a = l.find(d);
        if (a) {
            let e = a.props.children,
                r = l.map(n => n === a ? t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null : n);
            return (0, o.jsx)(u, {
                ...i,
                ref: n,
                children: t.isValidElement(e) ? t.cloneElement(e, void 0, r) : null
            })
        }
        return (0, o.jsx)(u, {
            ...i,
            ref: n,
            children: r
        })
    });
    s.displayName = "Slot";
    var u = t.forwardRef((e, n) => {
        let {
            children: i,
            ...o
        } = e;
        if (t.isValidElement(i)) {
            var l, a;
            let e, s = (e = null == (l = Object.getOwnPropertyDescriptor(i.props, "ref")) ? void 0 : l.get) && "isReactWarning" in e && e.isReactWarning ? i.ref : (e = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning ? i.props.ref : i.props.ref || i.ref;
            return t.cloneElement(i, {
                ... function(e, t) {
                    let n = {
                        ...t
                    };
                    for (let r in t) {
                        let i = e[r],
                            o = t[r];
                        /^on[A-Z]/.test(r) ? i && o ? n[r] = function() {
                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                            o(...t), i(...t)
                        } : i && (n[r] = i) : "style" === r ? n[r] = {
                            ...i,
                            ...o
                        } : "className" === r && (n[r] = [i, o].filter(Boolean).join(" "))
                    }
                    return {
                        ...e,
                        ...n
                    }
                }(o, i.props),
                ref: n ? (0, r.c)(n, s) : s
            })
        }
        return t.Children.count(i) > 1 ? t.Children.only(null) : null
    });
    u.displayName = "SlotClone";
    var c = e => {
        let {
            children: t
        } = e;
        return (0, o.jsx)(o.Fragment, {
            children: t
        })
    };

    function d(e) {
        return t.isValidElement(e) && e.type === c
    }
    var f, p = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, n) => {
            let r = t.forwardRef((e, t) => {
                let {
                    asChild: r,
                    ...i
                } = e, l = r ? s : n;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(l, {
                    ...i,
                    ref: t
                })
            });
            return r.displayName = "Primitive.".concat(n), {
                ...e,
                [n]: r
            }
        }, {}),
        h = "dismissableLayer.update",
        m = t.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        g = t.forwardRef((e, n) => {
            var i, l;
            let {
                disableOutsidePointerEvents: a = !1,
                onEscapeKeyDown: s,
                onPointerDownOutside: u,
                onFocusOutside: c,
                onInteractOutside: d,
                onDismiss: g,
                ...w
            } = e, x = t.useContext(m), [b, E] = t.useState(null), C = null != (i = null == b ? void 0 : b.ownerDocument) ? i : null == (l = globalThis) ? void 0 : l.document, [, T] = t.useState({}), R = (0, r.u)(n, e => E(e)), P = Array.from(x.layers), [O] = [...x.layersWithOutsidePointerEventsDisabled].slice(-1), A = P.indexOf(O), L = b ? P.indexOf(b) : -1, D = x.layersWithOutsidePointerEventsDisabled.size > 0, S = L >= A, N = function(e) {
                var n;
                let i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                    o = (0, r.f)(e),
                    l = t.useRef(!1),
                    a = t.useRef(() => {});
                return t.useEffect(() => {
                    let e = e => {
                            if (e.target && !l.current) {
                                let t = function() {
                                        v("dismissableLayer.pointerDownOutside", o, n, {
                                            discrete: !0
                                        })
                                    },
                                    n = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (i.removeEventListener("click", a.current), a.current = t, i.addEventListener("click", a.current, {
                                    once: !0
                                })) : t()
                            } else i.removeEventListener("click", a.current);
                            l.current = !1
                        },
                        t = window.setTimeout(() => {
                            i.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(t), i.removeEventListener("pointerdown", e), i.removeEventListener("click", a.current)
                    }
                }, [i, o]), {
                    onPointerDownCapture: () => l.current = !0
                }
            }(e => {
                let t = e.target,
                    n = [...x.branches].some(e => e.contains(t));
                S && !n && (null == u || u(e), null == d || d(e), e.defaultPrevented || null == g || g())
            }, C), k = function(e) {
                var n;
                let i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                    o = (0, r.f)(e),
                    l = t.useRef(!1);
                return t.useEffect(() => {
                    let e = e => {
                        e.target && !l.current && v("dismissableLayer.focusOutside", o, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return i.addEventListener("focusin", e), () => i.removeEventListener("focusin", e)
                }, [i, o]), {
                    onFocusCapture: () => l.current = !0,
                    onBlurCapture: () => l.current = !1
                }
            }(e => {
                let t = e.target;
                [...x.branches].some(e => e.contains(t)) || (null == c || c(e), null == d || d(e), e.defaultPrevented || null == g || g())
            }, C);
            return function(e) {
                var n;
                let i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                    o = (0, r.f)(e);
                t.useEffect(() => {
                    let e = e => {
                        "Escape" === e.key && o(e)
                    };
                    return i.addEventListener("keydown", e, {
                        capture: !0
                    }), () => i.removeEventListener("keydown", e, {
                        capture: !0
                    })
                }, [o, i])
            }(e => {
                L === x.layers.size - 1 && (null == s || s(e), !e.defaultPrevented && g && (e.preventDefault(), g()))
            }, C), t.useEffect(() => {
                if (b) return a && (0 === x.layersWithOutsidePointerEventsDisabled.size && (f = C.body.style.pointerEvents, C.body.style.pointerEvents = "none"), x.layersWithOutsidePointerEventsDisabled.add(b)), x.layers.add(b), y(), () => {
                    a && 1 === x.layersWithOutsidePointerEventsDisabled.size && (C.body.style.pointerEvents = f)
                }
            }, [b, C, a, x]), t.useEffect(() => () => {
                b && (x.layers.delete(b), x.layersWithOutsidePointerEventsDisabled.delete(b), y())
            }, [b, x]), t.useEffect(() => {
                let e = () => T({});
                return document.addEventListener(h, e), () => document.removeEventListener(h, e)
            }, []), (0, o.jsx)(p.div, {
                ...w,
                ref: R,
                style: {
                    pointerEvents: D ? S ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: (0, r.d)(e.onFocusCapture, k.onFocusCapture),
                onBlurCapture: (0, r.d)(e.onBlurCapture, k.onBlurCapture),
                onPointerDownCapture: (0, r.d)(e.onPointerDownCapture, N.onPointerDownCapture)
            })
        });

    function y() {
        let e = new CustomEvent(h);
        document.dispatchEvent(e)
    }

    function v(e, t, n, r) {
        let {
            discrete: o
        } = r, l = n.originalEvent.target, a = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: n
        });
        t && l.addEventListener(e, t, {
            once: !0
        }), o ? l && i.flushSync(() => l.dispatchEvent(a)) : l.dispatchEvent(a)
    }
    g.displayName = "DismissableLayer", t.forwardRef((e, n) => {
        let i = t.useContext(m),
            l = t.useRef(null),
            a = (0, r.u)(n, l);
        return t.useEffect(() => {
            let e = l.current;
            if (e) return i.branches.add(e), () => {
                i.branches.delete(e)
            }
        }, [i.branches]), (0, o.jsx)(p.div, {
            ...e,
            ref: a
        })
    }).displayName = "DismissableLayerBranch";
    var w = t["useId".toString()] || (() => {}),
        x = 0,
        b = t.forwardRef((e, t) => {
            let {
                children: n,
                width: r = 10,
                height: i = 5,
                ...l
            } = e;
            return (0, o.jsx)(p.svg, {
                ...l,
                ref: t,
                width: r,
                height: i,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? n : (0, o.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    b.displayName = "Arrow";
    var E = "Popper",
        [C, T] = (0, r.a)(E),
        [R, P] = C(E),
        O = e => {
            let {
                __scopePopper: n,
                children: r
            } = e, [i, l] = t.useState(null);
            return (0, o.jsx)(R, {
                scope: n,
                anchor: i,
                onAnchorChange: l,
                children: r
            })
        };
    O.displayName = E;
    var A = "PopperAnchor",
        L = t.forwardRef((e, n) => {
            let {
                __scopePopper: i,
                virtualRef: l,
                ...a
            } = e, s = P(A, i), u = t.useRef(null), c = (0, r.u)(n, u);
            return t.useEffect(() => {
                s.onAnchorChange((null == l ? void 0 : l.current) || u.current)
            }), l ? null : (0, o.jsx)(p.div, {
                ...a,
                ref: c
            })
        });
    L.displayName = A;
    var D = "PopperContent",
        [S, N] = C(D),
        k = t.forwardRef((e, n) => {
            var i, a, s, u, c, d, f, h;
            let {
                __scopePopper: m,
                side: g = "bottom",
                sideOffset: y = 0,
                align: v = "center",
                alignOffset: w = 0,
                arrowPadding: x = 0,
                avoidCollisions: b = !0,
                collisionBoundary: E = [],
                collisionPadding: C = 0,
                sticky: T = "partial",
                hideWhenDetached: R = !1,
                updatePositionStrategy: O = "optimized",
                onPlaced: A,
                ...L
            } = e, N = P(D, m), [k, j] = t.useState(null), M = (0, r.u)(n, e => j(e)), [_, F] = t.useState(null), I = (0, r.e)(_), z = null != (i = null == I ? void 0 : I.width) ? i : 0, V = null != (a = null == I ? void 0 : I.height) ? a : 0, U = "number" == typeof C ? C : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...C
            }, Y = Array.isArray(E) ? E : [E], X = Y.length > 0, $ = {
                padding: U,
                boundary: Y.filter(W),
                altBoundary: X
            }, {
                refs: K,
                floatingStyles: q,
                placement: Z,
                isPositioned: G,
                middlewareData: J
            } = (0, l.u)({
                strategy: "fixed",
                placement: g + ("center" !== v ? "-" + v : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return (0, l.a)(...t, {
                        animationFrame: "always" === O
                    })
                },
                elements: {
                    reference: N.anchor
                },
                middleware: [(0, l.o)({
                    mainAxis: y + V,
                    alignmentAxis: w
                }), b && (0, l.s)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === T ? (0, l.l)() : void 0,
                    ...$
                }), b && (0, l.f)({
                    ...$
                }), (0, l.b)({
                    ...$,
                    apply: e => {
                        let {
                            elements: t,
                            rects: n,
                            availableWidth: r,
                            availableHeight: i
                        } = e, {
                            width: o,
                            height: l
                        } = n.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(r, "px")), a.setProperty("--radix-popper-available-height", "".concat(i, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                    }
                }), _ && (0, l.c)({
                    element: _,
                    padding: x
                }), B({
                    arrowWidth: z,
                    arrowHeight: V
                }), R && (0, l.h)({
                    strategy: "referenceHidden",
                    ...$
                })]
            }), [Q, ee] = H(Z), et = (0, r.f)(A);
            (0, r.g)(() => {
                G && (null == et || et())
            }, [G, et]);
            let en = null == (s = J.arrow) ? void 0 : s.x,
                er = null == (u = J.arrow) ? void 0 : u.y,
                ei = 0 !== (null == (c = J.arrow) ? void 0 : c.centerOffset),
                [eo, el] = t.useState();
            return (0, r.g)(() => {
                k && el(window.getComputedStyle(k).zIndex)
            }, [k]), (0, o.jsx)("div", {
                ref: K.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...q,
                    transform: G ? q.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: eo,
                    "--radix-popper-transform-origin": [null == (d = J.transformOrigin) ? void 0 : d.x, null == (f = J.transformOrigin) ? void 0 : f.y].join(" "),
                    ...(null == (h = J.hide) ? void 0 : h.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, o.jsx)(S, {
                    scope: m,
                    placedSide: Q,
                    onArrowChange: F,
                    arrowX: en,
                    arrowY: er,
                    shouldHideArrow: ei,
                    children: (0, o.jsx)(p.div, {
                        "data-side": Q,
                        "data-align": ee,
                        ...L,
                        ref: M,
                        style: {
                            ...L.style,
                            animation: G ? void 0 : "none"
                        }
                    })
                })
            })
        });
    k.displayName = D;
    var j = "PopperArrow",
        M = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        _ = t.forwardRef(function(e, t) {
            let {
                __scopePopper: n,
                ...r
            } = e, i = N(j, n), l = M[i.placedSide];
            return (0, o.jsx)("span", {
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
                children: (0, o.jsx)(b, {
                    ...r,
                    ref: t,
                    style: {
                        ...r.style,
                        display: "block"
                    }
                })
            })
        });

    function W(e) {
        return null !== e
    }
    _.displayName = j;
    var B = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var n, r, i, o, l;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = 0 !== (null == (i = u.arrow) ? void 0 : i.centerOffset), d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, h] = H(a), m = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [h], g = (null != (n = null == (o = u.arrow) ? void 0 : o.x) ? n : 0) + d / 2, y = (null != (r = null == (l = u.arrow) ? void 0 : l.y) ? r : 0) + f / 2, v = "", w = "";
            return "bottom" === p ? (v = c ? m : "".concat(g, "px"), w = -f + "px") : "top" === p ? (v = c ? m : "".concat(g, "px"), w = "".concat(s.floating.height + f, "px")) : "right" === p ? (v = -f + "px", w = c ? m : "".concat(y, "px")) : "left" === p && (v = "".concat(s.floating.width + f, "px"), w = c ? m : "".concat(y, "px")), {
                data: {
                    x: v,
                    y: w
                }
            }
        }
    });

    function H(e) {
        let [t, n = "center"] = e.split("-");
        return [t, n]
    }
    var F = t.forwardRef((e, n) => {
        var l, a;
        let {
            container: s,
            ...u
        } = e, [c, d] = t.useState(!1);
        (0, r.g)(() => d(!0), []);
        let f = s || c && (null == (a = globalThis) || null == (l = a.document) ? void 0 : l.body);
        return f ? i.default.createPortal((0, o.jsx)(p.div, {
            ...u,
            ref: n
        }), f) : null
    });
    F.displayName = "Portal";
    var I = t.forwardRef((e, t) => (0, o.jsx)(p.span, {
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
    I.displayName = "VisuallyHidden";
    var [z, V] = (0, r.a)("Tooltip", [T]), U = T(), Y = "TooltipProvider", X = "tooltip.open", [$, K] = z(Y), q = e => {
        let {
            __scopeTooltip: n,
            delayDuration: r = 700,
            skipDelayDuration: i = 300,
            disableHoverableContent: l = !1,
            children: a
        } = e, [s, u] = t.useState(!0), c = t.useRef(!1), d = t.useRef(0);
        return t.useEffect(() => {
            let e = d.current;
            return () => window.clearTimeout(e)
        }, []), (0, o.jsx)($, {
            scope: n,
            isOpenDelayed: s,
            delayDuration: r,
            onOpen: t.useCallback(() => {
                window.clearTimeout(d.current), u(!1)
            }, []),
            onClose: t.useCallback(() => {
                window.clearTimeout(d.current), d.current = window.setTimeout(() => u(!0), i)
            }, [i]),
            isPointerInTransitRef: c,
            onPointerInTransitChange: t.useCallback(e => {
                c.current = e
            }, []),
            disableHoverableContent: l,
            children: a
        })
    };
    q.displayName = Y;
    var Z = "Tooltip",
        [G, J] = z(Z),
        Q = e => {
            let {
                __scopeTooltip: n,
                children: i,
                open: l,
                defaultOpen: a = !1,
                onOpenChange: s,
                disableHoverableContent: u,
                delayDuration: c
            } = e, d = K(Z, e.__scopeTooltip), f = U(n), [p, h] = t.useState(null), m = function() {
                let [e, n] = t.useState(w());
                return (0, r.g)(() => {
                    n(e => null != e ? e : String(x++))
                }, [void 0]), e ? "radix-".concat(e) : ""
            }(), g = t.useRef(0), y = null != u ? u : d.disableHoverableContent, v = null != c ? c : d.delayDuration, b = t.useRef(!1), [E = !1, C] = (0, r.b)({
                prop: l,
                defaultProp: a,
                onChange: e => {
                    e ? (d.onOpen(), document.dispatchEvent(new CustomEvent(X))) : d.onClose(), null == s || s(e)
                }
            }), T = t.useMemo(() => E ? b.current ? "delayed-open" : "instant-open" : "closed", [E]), R = t.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, b.current = !1, C(!0)
            }, [C]), P = t.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, C(!1)
            }, [C]), A = t.useCallback(() => {
                window.clearTimeout(g.current), g.current = window.setTimeout(() => {
                    b.current = !0, C(!0), g.current = 0
                }, v)
            }, [v, C]);
            return t.useEffect(() => () => {
                g.current && (window.clearTimeout(g.current), g.current = 0)
            }, []), (0, o.jsx)(O, {
                ...f,
                children: (0, o.jsx)(G, {
                    scope: n,
                    contentId: m,
                    open: E,
                    stateAttribute: T,
                    trigger: p,
                    onTriggerChange: h,
                    onTriggerEnter: t.useCallback(() => {
                        d.isOpenDelayed ? A() : R()
                    }, [d.isOpenDelayed, A, R]),
                    onTriggerLeave: t.useCallback(() => {
                        y ? P() : (window.clearTimeout(g.current), g.current = 0)
                    }, [P, y]),
                    onOpen: R,
                    onClose: P,
                    disableHoverableContent: y,
                    children: i
                })
            })
        };
    Q.displayName = Z;
    var ee = "TooltipTrigger",
        et = t.forwardRef((e, n) => {
            let {
                __scopeTooltip: i,
                ...l
            } = e, a = J(ee, i), s = K(ee, i), u = U(i), c = t.useRef(null), d = (0, r.u)(n, c, a.onTriggerChange), f = t.useRef(!1), h = t.useRef(!1), m = t.useCallback(() => f.current = !1, []);
            return t.useEffect(() => () => document.removeEventListener("pointerup", m), [m]), (0, o.jsx)(L, {
                asChild: !0,
                ...u,
                children: (0, o.jsx)(p.button, {
                    "aria-describedby": a.open ? a.contentId : void 0,
                    "data-state": a.stateAttribute,
                    ...l,
                    ref: d,
                    onPointerMove: (0, r.d)(e.onPointerMove, e => {
                        "touch" !== e.pointerType && (h.current || s.isPointerInTransitRef.current || (a.onTriggerEnter(), h.current = !0))
                    }),
                    onPointerLeave: (0, r.d)(e.onPointerLeave, () => {
                        a.onTriggerLeave(), h.current = !1
                    }),
                    onPointerDown: (0, r.d)(e.onPointerDown, () => {
                        f.current = !0, document.addEventListener("pointerup", m, {
                            once: !0
                        })
                    }),
                    onFocus: (0, r.d)(e.onFocus, () => {
                        f.current || a.onOpen()
                    }),
                    onBlur: (0, r.d)(e.onBlur, a.onClose),
                    onClick: (0, r.d)(e.onClick, a.onClose)
                })
            })
        });
    et.displayName = ee;
    var en = "TooltipPortal",
        [er, ei] = z(en, {
            forceMount: void 0
        }),
        eo = e => {
            let {
                __scopeTooltip: t,
                forceMount: n,
                children: i,
                container: l
            } = e, a = J(en, t);
            return (0, o.jsx)(er, {
                scope: t,
                forceMount: n,
                children: (0, o.jsx)(r.P, {
                    present: n || a.open,
                    children: (0, o.jsx)(F, {
                        asChild: !0,
                        container: l,
                        children: i
                    })
                })
            })
        };
    eo.displayName = en;
    var el = "TooltipContent",
        ea = t.forwardRef((e, t) => {
            let n = ei(el, e.__scopeTooltip),
                {
                    forceMount: i = n.forceMount,
                    side: l = "top",
                    ...a
                } = e,
                s = J(el, e.__scopeTooltip);
            return (0, o.jsx)(r.P, {
                present: i || s.open,
                children: s.disableHoverableContent ? (0, o.jsx)(ed, {
                    side: l,
                    ...a,
                    ref: t
                }) : (0, o.jsx)(es, {
                    side: l,
                    ...a,
                    ref: t
                })
            })
        }),
        es = t.forwardRef((e, n) => {
            let i = J(el, e.__scopeTooltip),
                l = K(el, e.__scopeTooltip),
                a = t.useRef(null),
                s = (0, r.u)(n, a),
                [u, c] = t.useState(null),
                {
                    trigger: d,
                    onClose: f
                } = i,
                p = a.current,
                {
                    onPointerInTransitChange: h
                } = l,
                m = t.useCallback(() => {
                    c(null), h(!1)
                }, [h]),
                g = t.useCallback((e, t) => {
                    let n, r = e.currentTarget,
                        i = {
                            x: e.clientX,
                            y: e.clientY
                        };
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
                    }(i, function(e, t) {
                        let n = Math.abs(t.top - e.y),
                            r = Math.abs(t.bottom - e.y),
                            i = Math.abs(t.right - e.x),
                            o = Math.abs(t.left - e.x);
                        switch (Math.min(n, r, i, o)) {
                            case o:
                                return "left";
                            case i:
                                return "right";
                            case n:
                                return "top";
                            case r:
                                return "bottom";
                            default:
                                throw Error("unreachable")
                        }
                    }(i, r.getBoundingClientRect())), ... function(e) {
                        let {
                            top: t,
                            right: n,
                            bottom: r,
                            left: i
                        } = e;
                        return [{
                            x: i,
                            y: t
                        }, {
                            x: n,
                            y: t
                        }, {
                            x: n,
                            y: r
                        }, {
                            x: i,
                            y: r
                        }]
                    }(t.getBoundingClientRect())].slice()).sort((e, t) => e.x < t.x ? -1 : e.x > t.x ? 1 : e.y < t.y ? -1 : +(e.y > t.y)), function(e) {
                        if (e.length <= 1) return e.slice();
                        let t = [];
                        for (let n = 0; n < e.length; n++) {
                            let r = e[n];
                            for (; t.length >= 2;) {
                                let e = t[t.length - 1],
                                    n = t[t.length - 2];
                                if (!((e.x - n.x) * (r.y - n.y) >= (e.y - n.y) * (r.x - n.x))) break;
                                t.pop()
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
                                if (!((e.x - t.x) * (r.y - t.y) >= (e.y - t.y) * (r.x - t.x))) break;
                                n.pop()
                            }
                            n.push(r)
                        }
                        return n.pop(), 1 === t.length && 1 === n.length && t[0].x === n[0].x && t[0].y === n[0].y ? t : t.concat(n)
                    }(n))), h(!0)
                }, [h]);
            return t.useEffect(() => () => m(), [m]), t.useEffect(() => {
                if (d && p) {
                    let e = e => g(e, p),
                        t = e => g(e, d);
                    return d.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t), () => {
                        d.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                    }
                }
            }, [d, p, g, m]), t.useEffect(() => {
                if (u) {
                    let e = e => {
                        let t = e.target,
                            n = {
                                x: e.clientX,
                                y: e.clientY
                            },
                            r = (null == d ? void 0 : d.contains(t)) || (null == p ? void 0 : p.contains(t)),
                            i = ! function(e, t) {
                                let {
                                    x: n,
                                    y: r
                                } = e, i = !1;
                                for (let e = 0, o = t.length - 1; e < t.length; o = e++) {
                                    let l = t[e].x,
                                        a = t[e].y,
                                        s = t[o].x,
                                        u = t[o].y;
                                    a > r != u > r && n < (s - l) * (r - a) / (u - a) + l && (i = !i)
                                }
                                return i
                            }(n, u);
                        r ? m() : i && (m(), f())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [d, p, u, f, m]), (0, o.jsx)(ed, {
                ...e,
                ref: s
            })
        }),
        [eu, ec] = z(Z, {
            isInside: !1
        }),
        ed = t.forwardRef((e, n) => {
            let {
                __scopeTooltip: r,
                children: i,
                "aria-label": l,
                onEscapeKeyDown: a,
                onPointerDownOutside: s,
                ...u
            } = e, d = J(el, r), f = U(r), {
                onClose: p
            } = d;
            return t.useEffect(() => (document.addEventListener(X, p), () => document.removeEventListener(X, p)), [p]), t.useEffect(() => {
                if (d.trigger) {
                    let e = e => {
                        var t;
                        (null == (t = e.target) ? void 0 : t.contains(d.trigger)) && p()
                    };
                    return window.addEventListener("scroll", e, {
                        capture: !0
                    }), () => window.removeEventListener("scroll", e, {
                        capture: !0
                    })
                }
            }, [d.trigger, p]), (0, o.jsx)(g, {
                asChild: !0,
                disableOutsidePointerEvents: !1,
                onEscapeKeyDown: a,
                onPointerDownOutside: s,
                onFocusOutside: e => e.preventDefault(),
                onDismiss: p,
                children: (0, o.jsxs)(k, {
                    "data-state": d.stateAttribute,
                    ...f,
                    ...u,
                    ref: n,
                    style: {
                        ...u.style,
                        "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                        "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                        "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                        "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                        "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                    },
                    children: [(0, o.jsx)(c, {
                        children: i
                    }), (0, o.jsx)(eu, {
                        scope: r,
                        isInside: !0,
                        children: (0, o.jsx)(I, {
                            id: d.contentId,
                            role: "tooltip",
                            children: l || i
                        })
                    })]
                })
            })
        });
    ea.displayName = el;
    var ef = "TooltipArrow",
        ep = t.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                ...r
            } = e, i = U(n);
            return ec(ef, n).isInside ? null : (0, o.jsx)(_, {
                ...i,
                ...r,
                ref: t
            })
        });
    ep.displayName = ef, e.s(["Tooltip", 0, function(e) {
        let {
            position: r,
            hasBeak: i = !0,
            title: o,
            description: l,
            ariaLabel: s,
            delayDurationMs: u = 500,
            children: c,
            open: d,
            onOpenChange: f,
            contentClassName: p
        } = e, [h, m] = r.split("-"), g = null != s ? s : "string" == typeof o && null == l ? o : void 0;
        return t.createElement(q, {
            delayDuration: u
        }, t.createElement(Q, {
            open: d,
            onOpenChange: f
        }, c, t.createElement(eo, null, t.createElement(ea, {
            side: h,
            align: m,
            "aria-label": g,
            className: (0, n.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", p),
            sideOffset: 5
        }, i && t.createElement(ep, {
            asChild: !0
        }, t.createElement(a.Beak, {
            className: "content-[var(--inverse-surface-0)]"
        })), t.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, t.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, o), l && t.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, l))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: n,
            asChild: r,
            className: i
        } = e;
        return t.createElement(et, {
            asChild: r,
            className: i
        }, n)
    }])
}, 924175, 112223, e => {
    "use strict";
    let t;
    var n = e.i(416340),
        r = e.i(149285);
    let i = ["top", "right", "bottom", "left"],
        o = Math.min,
        l = Math.max,
        a = Math.round,
        s = Math.floor,
        u = e => ({
            x: e,
            y: e
        }),
        c = {
            left: "right",
            right: "left",
            bottom: "top",
            top: "bottom"
        };

    function d(e, t) {
        return "function" == typeof e ? e(t) : e
    }

    function f(e) {
        return e.split("-")[0]
    }

    function p(e) {
        return e.split("-")[1]
    }

    function h(e) {
        return "x" === e ? "y" : "x"
    }

    function m(e) {
        return "y" === e ? "height" : "width"
    }

    function g(e) {
        let t = e[0];
        return "t" === t || "b" === t ? "y" : "x"
    }

    function y(e) {
        return e.includes("start") ? e.replace("start", "end") : e.replace("end", "start")
    }
    let v = ["left", "right"],
        w = ["right", "left"],
        x = ["top", "bottom"],
        b = ["bottom", "top"];

    function E(e) {
        let t = f(e);
        return c[t] + e.slice(t.length)
    }

    function C(e) {
        var t, n, r, i;
        return "number" != typeof e ? {
            top: null != (t = e.top) ? t : 0,
            right: null != (n = e.right) ? n : 0,
            bottom: null != (r = e.bottom) ? r : 0,
            left: null != (i = e.left) ? i : 0
        } : {
            top: e,
            right: e,
            bottom: e,
            left: e
        }
    }

    function T(e) {
        let {
            x: t,
            y: n,
            width: r,
            height: i
        } = e;
        return {
            width: r,
            height: i,
            top: n,
            left: t,
            right: t + r,
            bottom: n + i,
            x: t,
            y: n
        }
    }

    function R(e, t, n) {
        let r, {
                reference: i,
                floating: o
            } = e,
            l = g(t),
            a = h(g(t)),
            s = m(a),
            u = f(t),
            c = "y" === l,
            d = i.x + i.width / 2 - o.width / 2,
            y = i.y + i.height / 2 - o.height / 2,
            v = i[s] / 2 - o[s] / 2;
        switch (u) {
            case "top":
                r = {
                    x: d,
                    y: i.y - o.height
                };
                break;
            case "bottom":
                r = {
                    x: d,
                    y: i.y + i.height
                };
                break;
            case "right":
                r = {
                    x: i.x + i.width,
                    y: y
                };
                break;
            case "left":
                r = {
                    x: i.x - o.width,
                    y: y
                };
                break;
            default:
                r = {
                    x: i.x,
                    y: i.y
                }
        }
        switch (p(t)) {
            case "start":
                r[a] -= v * (n && c ? -1 : 1);
                break;
            case "end":
                r[a] += v * (n && c ? -1 : 1)
        }
        return r
    }
    async function P(e, t) {
        var n;
        void 0 === t && (t = {});
        let {
            x: r,
            y: i,
            platform: o,
            rects: l,
            elements: a,
            strategy: s
        } = e, {
            boundary: u = "clippingAncestors",
            rootBoundary: c = "viewport",
            elementContext: f = "floating",
            altBoundary: p = !1,
            padding: h = 0
        } = d(t, e), m = C(h), g = a[p ? "floating" === f ? "reference" : "floating" : f], y = T(await o.getClippingRect({
            element: null == (n = await (null == o.isElement ? void 0 : o.isElement(g))) || n ? g : g.contextElement || await (null == o.getDocumentElement ? void 0 : o.getDocumentElement(a.floating)),
            boundary: u,
            rootBoundary: c,
            strategy: s
        })), v = "floating" === f ? {
            x: r,
            y: i,
            width: l.floating.width,
            height: l.floating.height
        } : l.reference, w = await (null == o.getOffsetParent ? void 0 : o.getOffsetParent(a.floating)), x = await (null == o.isElement ? void 0 : o.isElement(w)) && await (null == o.getScale ? void 0 : o.getScale(w)) || {
            x: 1,
            y: 1
        }, b = T(o.convertOffsetParentRelativeRectToViewportRelativeRect ? await o.convertOffsetParentRelativeRectToViewportRelativeRect({
            elements: a,
            rect: v,
            offsetParent: w,
            strategy: s
        }) : v);
        return {
            top: (y.top - b.top + m.top) / x.y,
            bottom: (b.bottom - y.bottom + m.bottom) / x.y,
            left: (y.left - b.left + m.left) / x.x,
            right: (b.right - y.right + m.right) / x.x
        }
    }

    function O(e, t) {
        return {
            top: e.top - t.height,
            right: e.right - t.width,
            bottom: e.bottom - t.height,
            left: e.left - t.width
        }
    }

    function A(e) {
        return i.some(t => e[t] >= 0)
    }
    let L = new Set(["left", "top"]);

    function D() {
        return "u" > typeof window
    }

    function S(e) {
        return j(e) ? (e.nodeName || "").toLowerCase() : "#document"
    }

    function N(e) {
        var t;
        return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
    }

    function k(e) {
        var t;
        return null == (t = (j(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
    }

    function j(e) {
        return !!D() && (e instanceof Node || e instanceof N(e).Node)
    }

    function M(e) {
        return !!D() && (e instanceof Element || e instanceof N(e).Element)
    }

    function _(e) {
        return !!D() && (e instanceof HTMLElement || e instanceof N(e).HTMLElement)
    }

    function W(e) {
        return !(!D() || "u" < typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof N(e).ShadowRoot)
    }

    function B(e) {
        let {
            overflow: t,
            overflowX: n,
            overflowY: r,
            display: i
        } = X(e);
        return /auto|scroll|overlay|hidden|clip/.test(t + r + n) && "inline" !== i && "contents" !== i
    }

    function H(e) {
        try {
            if (e.matches(":popover-open")) return !0
        } catch (e) {}
        try {
            return e.matches(":modal")
        } catch (e) {
            return !1
        }
    }
    let F = /transform|translate|scale|rotate|perspective|filter/,
        I = /paint|layout|strict|content/,
        z = e => !!e && "none" !== e;

    function V(e) {
        let t = M(e) ? X(e) : e;
        return z(t.transform) || z(t.translate) || z(t.scale) || z(t.rotate) || z(t.perspective) || !U() && (z(t.backdropFilter) || z(t.filter)) || F.test(t.willChange || "") || I.test(t.contain || "")
    }

    function U() {
        return null == t && (t = "u" > typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), t
    }

    function Y(e) {
        return /^(html|body|#document)$/.test(S(e))
    }

    function X(e) {
        return N(e).getComputedStyle(e)
    }

    function $(e) {
        return M(e) ? {
            scrollLeft: e.scrollLeft,
            scrollTop: e.scrollTop
        } : {
            scrollLeft: e.scrollX,
            scrollTop: e.scrollY
        }
    }

    function K(e) {
        if ("html" === S(e)) return e;
        let t = e.assignedSlot || e.parentNode || W(e) && e.host || k(e);
        return W(t) ? t.host : t
    }

    function q(e, t, n) {
        var r;
        void 0 === t && (t = []), void 0 === n && (n = !0);
        let i = function e(t) {
                let n = K(t);
                return Y(n) ? (t.ownerDocument || t).body : _(n) && B(n) ? n : e(n)
            }(e),
            o = i === (null == (r = e.ownerDocument) ? void 0 : r.body),
            l = N(i);
        if (o) {
            let e = Z(l);
            return t.concat(l, l.visualViewport || [], B(i) ? i : [], e && n ? q(e) : [])
        }
        return t.concat(i, q(i, [], n))
    }

    function Z(e) {
        return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
    }

    function G(e) {
        let t = X(e),
            n = parseFloat(t.width) || 0,
            r = parseFloat(t.height) || 0,
            i = _(e),
            o = i ? e.offsetWidth : n,
            l = i ? e.offsetHeight : r,
            s = a(n) !== o || a(r) !== l;
        return s && (n = o, r = l), {
            width: n,
            height: r,
            $: s
        }
    }

    function J(e) {
        return M(e) ? e : e.contextElement
    }

    function Q(e) {
        let t = J(e);
        if (!_(t)) return u(1);
        let n = t.getBoundingClientRect(),
            {
                width: r,
                height: i,
                $: o
            } = G(t),
            l = (o ? a(n.width) : n.width) / r,
            s = (o ? a(n.height) : n.height) / i;
        return l && Number.isFinite(l) || (l = 1), s && Number.isFinite(s) || (s = 1), {
            x: l,
            y: s
        }
    }
    let ee = u(0);

    function et(e) {
        let t = N(e);
        return U() && t.visualViewport ? {
            x: t.visualViewport.offsetLeft,
            y: t.visualViewport.offsetTop
        } : ee
    }

    function en(e, t, n, r) {
        var i;
        void 0 === t && (t = !1), void 0 === n && (n = !1);
        let o = e.getBoundingClientRect(),
            l = J(e),
            a = u(1);
        t && (r ? M(r) && (a = Q(r)) : a = Q(e));
        let s = (void 0 === (i = n) && (i = !1), !(!r || i && r !== N(l)) && i) ? et(l) : u(0),
            c = (o.left + s.x) / a.x,
            d = (o.top + s.y) / a.y,
            f = o.width / a.x,
            p = o.height / a.y;
        if (l) {
            let e = N(l),
                t = r && M(r) ? N(r) : r,
                n = e,
                i = Z(n);
            for (; i && r && t !== n;) {
                let e = Q(i),
                    t = i.getBoundingClientRect(),
                    r = X(i),
                    o = t.left + (i.clientLeft + parseFloat(r.paddingLeft)) * e.x,
                    l = t.top + (i.clientTop + parseFloat(r.paddingTop)) * e.y;
                c *= e.x, d *= e.y, f *= e.x, p *= e.y, c += o, d += l, i = Z(n = N(i))
            }
        }
        return T({
            width: f,
            height: p,
            x: c,
            y: d
        })
    }

    function er(e, t) {
        let n = $(e).scrollLeft;
        return t ? t.left + n : en(k(e)).left + n
    }

    function ei(e, t, n) {
        void 0 === n && (n = !1);
        let r = e.getBoundingClientRect();
        return {
            x: r.left + t.scrollLeft - (n ? 0 : er(e, r)),
            y: r.top + t.scrollTop
        }
    }
    let eo = new Set(["absolute", "fixed"]);

    function el(e, t, n) {
        var r;
        let i;
        if ("viewport" === t) i = function(e, t) {
            let n = N(e),
                r = k(e),
                i = n.visualViewport,
                o = r.clientWidth,
                l = r.clientHeight,
                a = 0,
                s = 0;
            if (i) {
                o = i.width, l = i.height;
                let e = U();
                (!e || e && "fixed" === t) && (a = i.offsetLeft, s = i.offsetTop)
            }
            return {
                width: o,
                height: l,
                x: a,
                y: s
            }
        }(e, n);
        else if ("document" === t) {
            let t, n, o, a, s, u, c;
            r = k(e), t = k(r), n = $(r), o = r.ownerDocument.body, a = l(t.scrollWidth, t.clientWidth, o.scrollWidth, o.clientWidth), s = l(t.scrollHeight, t.clientHeight, o.scrollHeight, o.clientHeight), u = -n.scrollLeft + er(r), c = -n.scrollTop, "rtl" === X(o).direction && (u += l(t.clientWidth, o.clientWidth) - a), i = {
                width: a,
                height: s,
                x: u,
                y: c
            }
        } else if (M(t)) {
            let e, r, o, l;
            r = (e = en(t, !0, "fixed" === n)).top + t.clientTop, o = e.left + t.clientLeft, l = _(t) ? Q(t) : u(1), i = {
                width: t.clientWidth * l.x,
                height: t.clientHeight * l.y,
                x: o * l.x,
                y: r * l.y
            }
        } else {
            let n = et(e);
            i = {
                x: t.x - n.x,
                y: t.y - n.y,
                width: t.width,
                height: t.height
            }
        }
        return T(i)
    }

    function ea(e) {
        return "static" === X(e).position
    }

    function es(e, t) {
        if (!_(e) || "fixed" === X(e).position) return null;
        if (t) return t(e);
        let n = e.offsetParent;
        return k(e) === n && (n = n.ownerDocument.body), n
    }

    function eu(e, t) {
        var n;
        let r = N(e);
        if (H(e)) return r;
        if (!_(e)) {
            let t = K(e);
            for (; t && !Y(t);) {
                if (M(t) && !ea(t)) return t;
                t = K(t)
            }
            return r
        }
        let i = es(e, t);
        for (; i && (n = i, /^(table|td|th)$/.test(S(n))) && ea(i);) i = es(i, t);
        return i && Y(i) && ea(i) && !V(i) ? r : i || function(e) {
            let t = K(e);
            for (; _(t) && !Y(t);) {
                if (V(t)) return t;
                if (H(t)) break;
                t = K(t)
            }
            return null
        }(e) || r
    }
    let ec = {
        convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
            let {
                elements: t,
                rect: n,
                offsetParent: r,
                strategy: i
            } = e, o = "fixed" === i, l = k(r), a = !!t && H(t.floating);
            if (r === l || a && o) return n;
            let s = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                c = u(1),
                d = u(0),
                f = _(r);
            if ((f || !f && !o) && (("body" !== S(r) || B(l)) && (s = $(r)), _(r))) {
                let e = en(r);
                c = Q(r), d.x = e.x + r.clientLeft, d.y = e.y + r.clientTop
            }
            let p = !l || f || o ? u(0) : ei(l, s, !0);
            return {
                width: n.width * c.x,
                height: n.height * c.y,
                x: n.x * c.x - s.scrollLeft * c.x + d.x + p.x,
                y: n.y * c.y - s.scrollTop * c.y + d.y + p.y
            }
        },
        getDocumentElement: k,
        getClippingRect: function(e) {
            let {
                element: t,
                boundary: n,
                rootBoundary: r,
                strategy: i
            } = e, a = [..."clippingAncestors" === n ? H(t) ? [] : function(e, t) {
                let n = t.get(e);
                if (n) return n;
                let r = q(e, [], !1).filter(e => M(e) && "body" !== S(e)),
                    i = null,
                    o = "fixed" === X(e).position,
                    l = o ? K(e) : e;
                for (; M(l) && !Y(l);) {
                    let t = X(l),
                        n = V(l);
                    n || "fixed" !== t.position || (i = null), (o ? !n && !i : !n && "static" === t.position && i && eo.has(i.position) || B(l) && !n && function e(t, n) {
                        let r = K(t);
                        return !(r === n || !M(r) || Y(r)) && ("fixed" === X(r).position || e(r, n))
                    }(e, l)) ? r = r.filter(e => e !== l) : i = t, l = K(l)
                }
                return t.set(e, r), r
            }(t, this._c) : [].concat(n), r], s = a[0], u = a.reduce((e, n) => {
                let r = el(t, n, i);
                return e.top = l(r.top, e.top), e.right = o(r.right, e.right), e.bottom = o(r.bottom, e.bottom), e.left = l(r.left, e.left), e
            }, el(t, s, i));
            return {
                width: u.right - u.left,
                height: u.bottom - u.top,
                x: u.left,
                y: u.top
            }
        },
        getOffsetParent: eu,
        getElementRects: async function(e) {
            let t = this.getOffsetParent || eu,
                n = this.getDimensions,
                r = await n(e.floating);
            return {
                reference: function(e, t, n) {
                    let r = _(t),
                        i = k(t),
                        o = "fixed" === n,
                        l = en(e, !0, o, t),
                        a = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        s = u(0);
                    if (r || !r && !o)
                        if (("body" !== S(t) || B(i)) && (a = $(t)), r) {
                            let e = en(t, !0, o, t);
                            s.x = e.x + t.clientLeft, s.y = e.y + t.clientTop
                        } else i && (s.x = er(i));
                    o && !r && i && (s.x = er(i));
                    let c = !i || r || o ? u(0) : ei(i, a);
                    return {
                        x: l.left + a.scrollLeft - s.x - c.x,
                        y: l.top + a.scrollTop - s.y - c.y,
                        width: l.width,
                        height: l.height
                    }
                }(e.reference, await t(e.floating), e.strategy),
                floating: {
                    x: 0,
                    y: 0,
                    width: r.width,
                    height: r.height
                }
            }
        },
        getClientRects: function(e) {
            return Array.from(e.getClientRects())
        },
        getDimensions: function(e) {
            let {
                width: t,
                height: n
            } = G(e);
            return {
                width: t,
                height: n
            }
        },
        getScale: Q,
        isElement: M,
        isRTL: function(e) {
            return "rtl" === X(e).direction
        }
    };

    function ed(e, t) {
        return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
    }
    let ef = e => ({
        name: "arrow",
        options: e,
        async fn(t) {
            let {
                x: n,
                y: r,
                placement: i,
                rects: a,
                platform: s,
                elements: u,
                middlewareData: c
            } = t, {
                element: f,
                padding: y = 0
            } = d(e, t) || {};
            if (null == f) return {};
            let v = C(y),
                w = {
                    x: n,
                    y: r
                },
                x = h(g(i)),
                b = m(x),
                E = await s.getDimensions(f),
                T = "y" === x,
                R = T ? "clientHeight" : "clientWidth",
                P = a.reference[b] + a.reference[x] - w[x] - a.floating[b],
                O = w[x] - a.reference[x],
                A = await (null == s.getOffsetParent ? void 0 : s.getOffsetParent(f)),
                L = A ? A[R] : 0;
            L && await (null == s.isElement ? void 0 : s.isElement(A)) || (L = u.floating[R] || a.floating[b]);
            let D = L / 2 - E[b] / 2 - 1,
                S = o(v[T ? "top" : "left"], D),
                N = o(v[T ? "bottom" : "right"], D),
                k = L - E[b] - N,
                j = L / 2 - E[b] / 2 + (P / 2 - O / 2),
                M = l(S, o(j, k)),
                _ = !c.arrow && null != p(i) && j !== M && a.reference[b] / 2 - (j < S ? S : N) - E[b] / 2 < 0,
                W = _ ? j < S ? j - S : j - k : 0;
            return {
                [x]: w[x] + W,
                data: {
                    [x]: M,
                    centerOffset: j - M - W,
                    ..._ && {
                        alignmentOffset: W
                    }
                },
                reset: _
            }
        }
    });
    var ep = "u" > typeof document ? n.useLayoutEffect : function() {};

    function eh(e, t) {
        let n, r, i;
        if (e === t) return !0;
        if (typeof e != typeof t) return !1;
        if ("function" == typeof e && e.toString() === t.toString()) return !0;
        if (e && t && "object" == typeof e) {
            if (Array.isArray(e)) {
                if ((n = e.length) !== t.length) return !1;
                for (r = n; 0 != r--;)
                    if (!eh(e[r], t[r])) return !1;
                return !0
            }
            if ((n = (i = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (r = n; 0 != r--;)
                if (!({}).hasOwnProperty.call(t, i[r])) return !1;
            for (r = n; 0 != r--;) {
                let n = i[r];
                if (("_owner" !== n || !e.$$typeof) && !eh(e[n], t[n])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function em(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function eg(e, t) {
        let n = em(e);
        return Math.round(t * n) / n
    }

    function ey(e) {
        let t = n.useRef(e);
        return ep(() => {
            t.current = e
        }), t
    }
    e.s(["a", 0, function(e, t, n, r) {
        void 0 === r && (r = {});
        let {
            ancestorScroll: i = !0,
            ancestorResize: a = !0,
            elementResize: u = "function" == typeof ResizeObserver,
            layoutShift: c = "function" == typeof IntersectionObserver,
            animationFrame: d = !1
        } = r, f = J(e), p = i || a ? [...f ? q(f) : [], ...q(t)] : [];
        p.forEach(e => {
            i && e.addEventListener("scroll", n, {
                passive: !0
            }), a && e.addEventListener("resize", n)
        });
        let h = f && c ? function(e, t) {
                let n, r = null,
                    i = k(e);

                function a() {
                    var e;
                    clearTimeout(n), null == (e = r) || e.disconnect(), r = null
                }
                return function u(c, d) {
                    void 0 === c && (c = !1), void 0 === d && (d = 1), a();
                    let f = e.getBoundingClientRect(),
                        {
                            left: p,
                            top: h,
                            width: m,
                            height: g
                        } = f;
                    if (c || t(), !m || !g) return;
                    let y = {
                            rootMargin: -s(h) + "px " + -s(i.clientWidth - (p + m)) + "px " + -s(i.clientHeight - (h + g)) + "px " + -s(p) + "px",
                            threshold: l(0, o(1, d)) || 1
                        },
                        v = !0;

                    function w(t) {
                        let r = t[0].intersectionRatio;
                        if (r !== d) {
                            if (!v) return u();
                            r ? u(!1, r) : n = setTimeout(() => {
                                u(!1, 1e-7)
                            }, 1e3)
                        }
                        1 !== r || ed(f, e.getBoundingClientRect()) || u(), v = !1
                    }
                    try {
                        r = new IntersectionObserver(w, {
                            ...y,
                            root: i.ownerDocument
                        })
                    } catch (e) {
                        r = new IntersectionObserver(w, y)
                    }
                    r.observe(e)
                }(!0), a
            }(f, n) : null,
            m, g = -1,
            y = null;
        u && (y = new ResizeObserver(e => {
            let [r] = e;
            r && r.target === f && y && (y.unobserve(t), cancelAnimationFrame(g), g = requestAnimationFrame(() => {
                var e;
                null == (e = y) || e.observe(t)
            })), n()
        }), f && !d && y.observe(f), y.observe(t));
        let v = d ? en(e) : null;
        return d && function t() {
            let r = en(e);
            v && !ed(v, r) && n(), v = r, m = requestAnimationFrame(t)
        }(), n(), () => {
            var e;
            p.forEach(e => {
                i && e.removeEventListener("scroll", n), a && e.removeEventListener("resize", n)
            }), null == h || h(), null == (e = y) || e.disconnect(), y = null, d && cancelAnimationFrame(m)
        }
    }, "b", 0, (e, t) => {
        var n;
        return {
            ...(void 0 === (n = e) && (n = {}), {
                name: "size",
                options: n,
                async fn(e) {
                    var t, r;
                    let i, a, {
                            placement: s,
                            rects: u,
                            platform: c,
                            elements: h
                        } = e,
                        {
                            apply: m = () => {},
                            ...y
                        } = d(n, e),
                        v = await P(e, y),
                        w = f(s),
                        x = p(s),
                        b = "y" === g(s),
                        {
                            width: E,
                            height: C
                        } = u.floating;
                    "top" === w || "bottom" === w ? (i = w, a = x === (await (null == c.isRTL ? void 0 : c.isRTL(h.floating)) ? "start" : "end") ? "left" : "right") : (a = w, i = "end" === x ? "top" : "bottom");
                    let T = C - v.top - v.bottom,
                        R = E - v.left - v.right,
                        O = o(C - v[i], T),
                        A = o(E - v[a], R),
                        L = !e.middlewareData.shift,
                        D = O,
                        S = A;
                    if (null != (t = e.middlewareData.shift) && t.enabled.x && (S = R), null != (r = e.middlewareData.shift) && r.enabled.y && (D = T), L && !x) {
                        let e = l(v.left, 0),
                            t = l(v.right, 0),
                            n = l(v.top, 0),
                            r = l(v.bottom, 0);
                        b ? S = E - 2 * (0 !== e || 0 !== t ? e + t : l(v.left, v.right)) : D = C - 2 * (0 !== n || 0 !== r ? n + r : l(v.top, v.bottom))
                    }
                    await m({
                        ...e,
                        availableWidth: S,
                        availableHeight: D
                    });
                    let N = await c.getDimensions(h.floating);
                    return E !== N.width || C !== N.height ? {
                        reset: {
                            rects: !0
                        }
                    } : {}
                }
            }),
            options: [e, t]
        }
    }, "c", 0, (e, t) => ({
        ...{
            name: "arrow",
            options: e,
            fn(t) {
                let {
                    element: n,
                    padding: r
                } = "function" == typeof e ? e(t) : e;
                return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? ef({
                    element: n.current,
                    padding: r
                }).fn(t) : {} : n ? ef({
                    element: n,
                    padding: r
                }).fn(t) : {}
            }
        },
        options: [e, t]
    }), "f", 0, (e, t) => {
        var n;
        return {
            ...(void 0 === (n = e) && (n = {}), {
                name: "flip",
                options: n,
                async fn(e) {
                    var t, r, i, o, l, a;
                    let s, u, c, {
                            placement: C,
                            middlewareData: T,
                            rects: R,
                            initialPlacement: O,
                            platform: A,
                            elements: L
                        } = e,
                        {
                            mainAxis: D = !0,
                            crossAxis: S = !0,
                            fallbackPlacements: N,
                            fallbackStrategy: k = "bestFit",
                            fallbackAxisSideDirection: j = "none",
                            flipAlignment: M = !0,
                            ..._
                        } = d(n, e);
                    if (null != (t = T.arrow) && t.alignmentOffset) return {};
                    let W = f(C),
                        B = g(O),
                        H = f(O) === O,
                        F = await (null == A.isRTL ? void 0 : A.isRTL(L.floating)),
                        I = N || (H || !M ? [E(O)] : (s = E(O), [y(O), s, y(s)])),
                        z = "none" !== j;
                    !N && z && I.push(...(u = p(O), c = function(e, t, n) {
                        switch (e) {
                            case "top":
                            case "bottom":
                                return n ? t ? w : v : t ? v : w;
                            case "left":
                            case "right":
                                return t ? x : b;
                            default:
                                return []
                        }
                    }(f(O), "start" === j, F), u && (c = c.map(e => e + "-" + u), M && (c = c.concat(c.map(y)))), c));
                    let V = [O, ...I],
                        U = await P(e, _),
                        Y = [],
                        X = (null == (r = T.flip) ? void 0 : r.overflows) || [];
                    if (D && Y.push(U[W]), S) {
                        let e, t, n, r, i = (void 0 === (a = F) && (a = !1), e = p(C), n = m(t = h(g(C))), r = "x" === t ? e === (a ? "end" : "start") ? "right" : "left" : "start" === e ? "bottom" : "top", R.reference[n] > R.floating[n] && (r = E(r)), [r, E(r)]);
                        Y.push(U[i[0]], U[i[1]])
                    }
                    if (X = [...X, {
                            placement: C,
                            overflows: Y
                        }], !Y.every(e => e <= 0)) {
                        let e = ((null == (i = T.flip) ? void 0 : i.index) || 0) + 1,
                            t = V[e];
                        if (t && ("alignment" !== S || B === g(t) || X.every(e => g(e.placement) !== B || e.overflows[0] > 0))) return {
                            data: {
                                index: e,
                                overflows: X
                            },
                            reset: {
                                placement: t
                            }
                        };
                        let n = null == (o = X.filter(e => e.overflows[0] <= 0).sort((e, t) => e.overflows[1] - t.overflows[1])[0]) ? void 0 : o.placement;
                        if (!n) switch (k) {
                            case "bestFit": {
                                let e = null == (l = X.filter(e => {
                                    if (z) {
                                        let t = g(e.placement);
                                        return t === B || "y" === t
                                    }
                                    return !0
                                }).map(e => [e.placement, e.overflows.filter(e => e > 0).reduce((e, t) => e + t, 0)]).sort((e, t) => e[1] - t[1])[0]) ? void 0 : l[0];
                                e && (n = e);
                                break
                            }
                            case "initialPlacement":
                                n = O
                        }
                        if (C !== n) return {
                            reset: {
                                placement: n
                            }
                        }
                    }
                    return {}
                }
            }),
            options: [e, t]
        }
    }, "h", 0, (e, t) => {
        var n;
        return {
            ...(void 0 === (n = e) && (n = {}), {
                name: "hide",
                options: n,
                async fn(e) {
                    let {
                        rects: t
                    } = e, {
                        strategy: r = "referenceHidden",
                        ...i
                    } = d(n, e);
                    switch (r) {
                        case "referenceHidden": {
                            let n = O(await P(e, {
                                ...i,
                                elementContext: "reference"
                            }), t.reference);
                            return {
                                data: {
                                    referenceHiddenOffsets: n,
                                    referenceHidden: A(n)
                                }
                            }
                        }
                        case "escaped": {
                            let n = O(await P(e, {
                                ...i,
                                altBoundary: !0
                            }), t.floating);
                            return {
                                data: {
                                    escapedOffsets: n,
                                    escaped: A(n)
                                }
                            }
                        }
                        default:
                            return {}
                    }
                }
            }),
            options: [e, t]
        }
    }, "l", 0, (e, t) => {
        var n;
        return {
            ...(void 0 === (n = e) && (n = {}), {
                options: n,
                fn(e) {
                    let {
                        x: t,
                        y: r,
                        placement: i,
                        rects: o,
                        middlewareData: l
                    } = e, {
                        offset: a = 0,
                        mainAxis: s = !0,
                        crossAxis: u = !0
                    } = d(n, e), c = {
                        x: t,
                        y: r
                    }, p = g(i), m = h(p), y = c[m], v = c[p], w = d(a, e), x = "number" == typeof w ? {
                        mainAxis: w,
                        crossAxis: 0
                    } : {
                        mainAxis: 0,
                        crossAxis: 0,
                        ...w
                    };
                    if (s) {
                        let e = "y" === m ? "height" : "width",
                            t = o.reference[m] - o.floating[e] + x.mainAxis,
                            n = o.reference[m] + o.reference[e] - x.mainAxis;
                        y < t ? y = t : y > n && (y = n)
                    }
                    if (u) {
                        var b, E;
                        let e = "y" === m ? "width" : "height",
                            t = L.has(f(i)),
                            n = o.reference[p] - o.floating[e] + (t && (null == (b = l.offset) ? void 0 : b[p]) || 0) + (t ? 0 : x.crossAxis),
                            r = o.reference[p] + o.reference[e] + (t ? 0 : (null == (E = l.offset) ? void 0 : E[p]) || 0) - (t ? x.crossAxis : 0);
                        v < n ? v = n : v > r && (v = r)
                    }
                    return {
                        [m]: y,
                        [p]: v
                    }
                }
            }),
            options: [e, t]
        }
    }, "o", 0, (e, t) => {
        var n;
        return {
            ...(void 0 === (n = e) && (n = 0), {
                name: "offset",
                options: n,
                async fn(e) {
                    var t, r;
                    let {
                        x: i,
                        y: o,
                        placement: l,
                        middlewareData: a
                    } = e, s = await async function(e, t) {
                        let {
                            placement: n,
                            platform: r,
                            elements: i
                        } = e, o = await (null == r.isRTL ? void 0 : r.isRTL(i.floating)), l = f(n), a = p(n), s = "y" === g(n), u = L.has(l) ? -1 : 1, c = o && s ? -1 : 1, h = d(t, e), {
                            mainAxis: m,
                            crossAxis: y,
                            alignmentAxis: v
                        } = "number" == typeof h ? {
                            mainAxis: h,
                            crossAxis: 0,
                            alignmentAxis: null
                        } : {
                            mainAxis: h.mainAxis || 0,
                            crossAxis: h.crossAxis || 0,
                            alignmentAxis: h.alignmentAxis
                        };
                        return a && "number" == typeof v && (y = "end" === a ? -1 * v : v), s ? {
                            x: y * c,
                            y: m * u
                        } : {
                            x: m * u,
                            y: y * c
                        }
                    }(e, n);
                    return l === (null == (t = a.offset) ? void 0 : t.placement) && null != (r = a.arrow) && r.alignmentOffset ? {} : {
                        x: i + s.x,
                        y: o + s.y,
                        data: {
                            ...s,
                            placement: l
                        }
                    }
                }
            }),
            options: [e, t]
        }
    }, "s", 0, (e, t) => {
        var n;
        return {
            ...(void 0 === (n = e) && (n = {}), {
                name: "shift",
                options: n,
                async fn(e) {
                    let {
                        x: t,
                        y: r,
                        placement: i
                    } = e, {
                        mainAxis: a = !0,
                        crossAxis: s = !1,
                        limiter: u = {
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
                        ...c
                    } = d(n, e), p = {
                        x: t,
                        y: r
                    }, m = await P(e, c), y = g(f(i)), v = h(y), w = p[v], x = p[y];
                    if (a) {
                        let e = "y" === v ? "bottom" : "right";
                        w = l(w + m["y" === v ? "top" : "left"], o(w, w - m[e]))
                    }
                    if (s) {
                        let e = "y" === y ? "bottom" : "right";
                        x = l(x + m["y" === y ? "top" : "left"], o(x, x - m[e]))
                    }
                    let b = u.fn({
                        ...e,
                        [v]: w,
                        [y]: x
                    });
                    return {
                        ...b,
                        data: {
                            x: b.x - t,
                            y: b.y - r,
                            enabled: {
                                [v]: a,
                                [y]: s
                            }
                        }
                    }
                }
            }),
            options: [e, t]
        }
    }, "u", 0, function(e) {
        void 0 === e && (e = {});
        let {
            placement: t = "bottom",
            strategy: i = "absolute",
            middleware: o = [],
            platform: l,
            elements: {
                reference: a,
                floating: s
            } = {},
            transform: u = !0,
            whileElementsMounted: c,
            open: d
        } = e, [f, p] = n.useState({
            x: 0,
            y: 0,
            strategy: i,
            placement: t,
            middlewareData: {},
            isPositioned: !1
        }), [h, m] = n.useState(o);
        eh(h, o) || m(o);
        let [g, y] = n.useState(null), [v, w] = n.useState(null), x = n.useCallback(e => {
            e !== T.current && (T.current = e, y(e))
        }, []), b = n.useCallback(e => {
            e !== P.current && (P.current = e, w(e))
        }, []), E = a || g, C = s || v, T = n.useRef(null), P = n.useRef(null), O = n.useRef(f), A = null != c, L = ey(c), D = ey(l), S = ey(d), N = n.useCallback(() => {
            var e, n;
            let o, l, a;
            if (!T.current || !P.current) return;
            let s = {
                placement: t,
                strategy: i,
                middleware: h
            };
            D.current && (s.platform = D.current), (e = T.current, n = P.current, o = new Map, a = {
                ...(l = {
                    platform: ec,
                    ...s
                }).platform,
                _c: o
            }, (async (e, t, n) => {
                let {
                    placement: r = "bottom",
                    strategy: i = "absolute",
                    middleware: o = [],
                    platform: l
                } = n, a = o.filter(Boolean), s = await (null == l.isRTL ? void 0 : l.isRTL(t)), u = await l.getElementRects({
                    reference: e,
                    floating: t,
                    strategy: i
                }), {
                    x: c,
                    y: d
                } = R(u, r, s), f = r, p = {}, h = 0;
                for (let n = 0; n < a.length; n++) {
                    let {
                        name: o,
                        fn: m
                    } = a[n], {
                        x: g,
                        y: y,
                        data: v,
                        reset: w
                    } = await m({
                        x: c,
                        y: d,
                        initialPlacement: r,
                        placement: f,
                        strategy: i,
                        middlewareData: p,
                        rects: u,
                        platform: l,
                        elements: {
                            reference: e,
                            floating: t
                        }
                    });
                    c = null != g ? g : c, d = null != y ? y : d, p = {
                        ...p,
                        [o]: {
                            ...p[o],
                            ...v
                        }
                    }, w && h <= 50 && (h++, "object" == typeof w && (w.placement && (f = w.placement), w.rects && (u = !0 === w.rects ? await l.getElementRects({
                        reference: e,
                        floating: t,
                        strategy: i
                    }) : w.rects), {
                        x: c,
                        y: d
                    } = R(u, f, s)), n = -1)
                }
                return {
                    x: c,
                    y: d,
                    placement: f,
                    strategy: i,
                    middlewareData: p
                }
            })(e, n, {
                ...l,
                platform: a
            })).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== S.current
                };
                k.current && !eh(O.current, t) && (O.current = t, r.flushSync(() => {
                    p(t)
                }))
            })
        }, [h, t, i, D, S]);
        ep(() => {
            !1 === d && O.current.isPositioned && (O.current.isPositioned = !1, p(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [d]);
        let k = n.useRef(!1);
        ep(() => (k.current = !0, () => {
            k.current = !1
        }), []), ep(() => {
            if (E && (T.current = E), C && (P.current = C), E && C) {
                if (L.current) return L.current(E, C, N);
                N()
            }
        }, [E, C, N, L, A]);
        let j = n.useMemo(() => ({
                reference: T,
                floating: P,
                setReference: x,
                setFloating: b
            }), [x, b]),
            M = n.useMemo(() => ({
                reference: E,
                floating: C
            }), [E, C]),
            _ = n.useMemo(() => {
                let e = {
                    position: i,
                    left: 0,
                    top: 0
                };
                if (!M.floating) return e;
                let t = eg(M.floating, f.x),
                    n = eg(M.floating, f.y);
                return u ? {
                    ...e,
                    transform: "translate(" + t + "px, " + n + "px)",
                    ...em(M.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: i,
                    left: t,
                    top: n
                }
            }, [i, u, M.floating, f.x, f.y]);
        return n.useMemo(() => ({
            ...f,
            update: N,
            refs: j,
            elements: M,
            floatingStyles: _
        }), [f, N, j, M, _])
    }], 924175);
    var ev = e.i(197649);
    e.s(["Beak", 0, function(e) {
        let {
            className: t
        } = e;
        return n.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, ev.default)("block", t),
            style: {
                marginTop: -1
            }
        }, n.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }], 112223)
}, 840934, e => {
    "use strict";
    var t, n = e.i(416340),
        r = e.i(221628);

    function i(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function o() {
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

    function l() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return n.useCallback(o(...t), t)
    }

    function a(e) {
        let t = n.useRef(e);
        return n.useEffect(() => {
            t.current = e
        }), n.useMemo(() => function() {
            for (var e, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
            return null == (e = t.current) ? void 0 : e.call(t, ...r)
        }, [])
    }
    var s = (null == (t = globalThis) ? void 0 : t.document) ? n.useLayoutEffect : () => {},
        u = e => {
            var t, r;
            let i, {
                    present: o,
                    children: a
                } = e,
                u = function(e) {
                    var t, r;
                    let [i, o] = n.useState(), l = n.useRef({}), a = n.useRef(e), u = n.useRef("none"), [d, f] = (t = e ? "mounted" : "unmounted", r = {
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
                        var n;
                        return null != (n = r[e][t]) ? n : e
                    }, t));
                    return n.useEffect(() => {
                        let e = c(l.current);
                        u.current = "mounted" === d ? e : "none"
                    }, [d]), s(() => {
                        let t = l.current,
                            n = a.current;
                        if (n !== e) {
                            let r = u.current,
                                i = c(t);
                            e ? f("MOUNT") : "none" === i || "none" === (null == t ? void 0 : t.display) ? f("UNMOUNT") : f(n && r !== i ? "ANIMATION_OUT" : "UNMOUNT"), a.current = e
                        }
                    }, [e, f]), s(() => {
                        if (i) {
                            var e;
                            let t, n = null != (e = i.ownerDocument.defaultView) ? e : window,
                                r = e => {
                                    let r = c(l.current).includes(e.animationName);
                                    if (e.target === i && r && (f("ANIMATION_END"), !a.current)) {
                                        let e = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = n.setTimeout(() => {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = e)
                                        })
                                    }
                                },
                                o = e => {
                                    e.target === i && (u.current = c(l.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r), () => {
                                n.clearTimeout(t), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                            }
                        }
                        f("ANIMATION_END")
                    }, [i, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: n.useCallback(e => {
                            e && (l.current = getComputedStyle(e)), o(e)
                        }, [])
                    }
                }(o),
                d = "function" == typeof a ? a({
                    present: u.isPresent
                }) : n.Children.only(a),
                f = l(u.ref, (i = null == (t = Object.getOwnPropertyDescriptor(d.props, "ref")) ? void 0 : t.get) && "isReactWarning" in i && i.isReactWarning ? d.ref : (i = null == (r = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : r.get) && "isReactWarning" in i && i.isReactWarning ? d.props.ref : d.props.ref || d.ref);
            return "function" == typeof a || u.isPresent ? n.cloneElement(d, {
                ref: f
            }) : null
        };

    function c(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    u.displayName = "Presence", e.s(["P", 0, u, "a", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            i = [],
            o = () => {
                let t = i.map(e => n.createContext(e));
                return function(r) {
                    let i = (null == r ? void 0 : r[e]) || t;
                    return n.useMemo(() => ({
                        ["__scope".concat(e)]: {
                            ...r,
                            [e]: i
                        }
                    }), [r, i])
                }
            };
        return o.scopeName = e, [function(t, o) {
            let l = n.createContext(o),
                a = i.length;
            i = [...i, o];
            let s = t => {
                var i;
                let {
                    scope: o,
                    children: s,
                    ...u
                } = t, c = (null == o || null == (i = o[e]) ? void 0 : i[a]) || l, d = n.useMemo(() => u, Object.values(u));
                return (0, r.jsx)(c.Provider, {
                    value: d,
                    children: s
                })
            };
            return s.displayName = t + "Provider", [s, function(r, i) {
                var s;
                let u = (null == i || null == (s = i[e]) ? void 0 : s[a]) || l,
                    c = n.useContext(u);
                if (c) return c;
                if (void 0 !== o) return o;
                throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            let i = t[0];
            if (1 === t.length) return i;
            let o = () => {
                let e = t.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(t) {
                    let r = e.reduce((e, n) => {
                        let {
                            useScope: r,
                            scopeName: i
                        } = n;
                        return {
                            ...e,
                            ...r(t)["__scope".concat(i)]
                        }
                    }, {});
                    return n.useMemo(() => ({
                        ["__scope".concat(i.scopeName)]: r
                    }), [r])
                }
            };
            return o.scopeName = i.scopeName, o
        }(o, ...t)]
    }, "b", 0, function(e) {
        let {
            prop: t,
            defaultProp: r,
            onChange: i = () => {}
        } = e, [o, l] = function(e) {
            let {
                defaultProp: t,
                onChange: r
            } = e, i = n.useState(t), [o] = i, l = n.useRef(o), s = a(r);
            return n.useEffect(() => {
                l.current !== o && (s(o), l.current = o)
            }, [o, l, s]), i
        }({
            defaultProp: r,
            onChange: i
        }), s = void 0 !== t, u = s ? t : o, c = a(i);
        return [u, n.useCallback(e => {
            if (s) {
                let n = "function" == typeof e ? e(t) : e;
                n !== t && c(n)
            } else l(e)
        }, [s, t, l, c])]
    }, "c", 0, o, "d", 0, function(e, t) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (null == e || e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }, "e", 0, function(e) {
        let [t, r] = n.useState(void 0);
        return s(() => {
            if (e) {
                r({
                    width: e.offsetWidth,
                    height: e.offsetHeight
                });
                let t = new ResizeObserver(t => {
                    let n, i;
                    if (!Array.isArray(t) || !t.length) return;
                    let o = t[0];
                    if ("borderBoxSize" in o) {
                        let e = o.borderBoxSize,
                            t = Array.isArray(e) ? e[0] : e;
                        n = t.inlineSize, i = t.blockSize
                    } else n = e.offsetWidth, i = e.offsetHeight;
                    r({
                        width: n,
                        height: i
                    })
                });
                return t.observe(e, {
                    box: "border-box"
                }), () => t.unobserve(e)
            }
            r(void 0)
        }, [e]), t
    }, "f", 0, a, "g", 0, s, "u", 0, l])
}]);

//# debugId=38cce3a9-4ce3-313c-3ea5-860dd8648fcf
//# sourceMappingURL=2okh8zpshhnwc.js.map
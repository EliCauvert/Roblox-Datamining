;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "6630f118-832f-13a6-5c80-84cf931291c4")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 305607, e => {
    "use strict";
    e.s(["clamp", 0, function(e, t) {
        let [l, r] = t;
        return Math.min(r, Math.max(l, e))
    }])
}, 524887, e => {
    "use strict";
    var t = e.i(416340),
        l = e.i(297452),
        r = e.i(992486),
        a = e.i(594278),
        n = e.i(221628),
        o = t.forwardRef((e, t) => {
            let {
                children: l,
                width: r = 10,
                height: o = 5,
                ...i
            } = e;
            return (0, n.jsx)(a.Primitive.svg, {
                ...i,
                ref: t,
                width: r,
                height: o,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? l : (0, n.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    o.displayName = "Arrow";
    var i = e.i(78892),
        s = e.i(608652),
        d = e.i(886449),
        u = e.i(723570),
        c = e.i(692166),
        p = "Popper",
        [m, f] = (0, s.createContextScope)(p),
        [v, h] = m(p),
        g = e => {
            let {
                __scopePopper: l,
                children: r
            } = e, [a, o] = t.useState(null);
            return (0, n.jsx)(v, {
                scope: l,
                anchor: a,
                onAnchorChange: o,
                children: r
            })
        };
    g.displayName = p;
    var x = "PopperAnchor",
        w = t.forwardRef((e, l) => {
            let {
                __scopePopper: r,
                virtualRef: o,
                ...s
            } = e, d = h(x, r), u = t.useRef(null), c = (0, i.useComposedRefs)(l, u);
            return t.useEffect(() => {
                d.onAnchorChange((null == o ? void 0 : o.current) || u.current)
            }), o ? null : (0, n.jsx)(a.Primitive.div, {
                ...s,
                ref: c
            })
        });
    w.displayName = x;
    var y = "PopperContent",
        [S, b] = m(y),
        C = t.forwardRef((e, o) => {
            var s, p, m, f, v, g, x, w;
            let {
                __scopePopper: b,
                side: C = "bottom",
                sideOffset: E = 0,
                align: R = "center",
                alignOffset: P = 0,
                arrowPadding: M = 0,
                avoidCollisions: I = !0,
                collisionBoundary: k = [],
                collisionPadding: L = 0,
                sticky: A = "partial",
                hideWhenDetached: H = !1,
                updatePositionStrategy: D = "optimized",
                onPlaced: _,
                ...O
            } = e, B = h(y, b), [U, V] = t.useState(null), X = (0, i.useComposedRefs)(o, e => V(e)), [z, F] = t.useState(null), K = (0, c.useSize)(z), W = null != (s = null == K ? void 0 : K.width) ? s : 0, Y = null != (p = null == K ? void 0 : K.height) ? p : 0, q = "number" == typeof L ? L : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...L
            }, G = Array.isArray(k) ? k : [k], Z = G.length > 0, J = {
                padding: q,
                boundary: G.filter(N),
                altBoundary: Z
            }, {
                refs: Q,
                floatingStyles: $,
                placement: ee,
                isPositioned: et,
                middlewareData: el
            } = (0, l.useFloating)({
                strategy: "fixed",
                placement: C + ("center" !== R ? "-" + R : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), l = 0; l < e; l++) t[l] = arguments[l];
                    return (0, r.autoUpdate)(...t, {
                        animationFrame: "always" === D
                    })
                },
                elements: {
                    reference: B.anchor
                },
                middleware: [(0, l.offset)({
                    mainAxis: E + Y,
                    alignmentAxis: P
                }), I && (0, l.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === A ? (0, l.limitShift)() : void 0,
                    ...J
                }), I && (0, l.flip)({
                    ...J
                }), (0, l.size)({
                    ...J,
                    apply: e => {
                        let {
                            elements: t,
                            rects: l,
                            availableWidth: r,
                            availableHeight: a
                        } = e, {
                            width: n,
                            height: o
                        } = l.reference, i = t.floating.style;
                        i.setProperty("--radix-popper-available-width", "".concat(r, "px")), i.setProperty("--radix-popper-available-height", "".concat(a, "px")), i.setProperty("--radix-popper-anchor-width", "".concat(n, "px")), i.setProperty("--radix-popper-anchor-height", "".concat(o, "px"))
                    }
                }), z && (0, l.arrow)({
                    element: z,
                    padding: M
                }), j({
                    arrowWidth: W,
                    arrowHeight: Y
                }), H && (0, l.hide)({
                    strategy: "referenceHidden",
                    ...J
                })]
            }), [er, ea] = T(ee), en = (0, d.useCallbackRef)(_);
            (0, u.useLayoutEffect)(() => {
                et && (null == en || en())
            }, [et, en]);
            let eo = null == (m = el.arrow) ? void 0 : m.x,
                ei = null == (f = el.arrow) ? void 0 : f.y,
                es = (null == (v = el.arrow) ? void 0 : v.centerOffset) !== 0,
                [ed, eu] = t.useState();
            return (0, u.useLayoutEffect)(() => {
                U && eu(window.getComputedStyle(U).zIndex)
            }, [U]), (0, n.jsx)("div", {
                ref: Q.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...$,
                    transform: et ? $.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: ed,
                    "--radix-popper-transform-origin": [null == (g = el.transformOrigin) ? void 0 : g.x, null == (x = el.transformOrigin) ? void 0 : x.y].join(" "),
                    ...(null == (w = el.hide) ? void 0 : w.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, n.jsx)(S, {
                    scope: b,
                    placedSide: er,
                    onArrowChange: F,
                    arrowX: eo,
                    arrowY: ei,
                    shouldHideArrow: es,
                    children: (0, n.jsx)(a.Primitive.div, {
                        "data-side": er,
                        "data-align": ea,
                        ...O,
                        ref: X,
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
                __scopePopper: l,
                ...r
            } = e, a = b(E, l), i = R[a.placedSide];
            return (0, n.jsx)("span", {
                ref: a.onArrowChange,
                style: {
                    position: "absolute",
                    left: a.arrowX,
                    top: a.arrowY,
                    [i]: 0,
                    transformOrigin: {
                        top: "",
                        right: "0 0",
                        bottom: "center 0",
                        left: "100% 0"
                    } [a.placedSide],
                    transform: {
                        top: "translateY(100%)",
                        right: "translateY(50%) rotate(90deg) translateX(-50%)",
                        bottom: "rotate(180deg)",
                        left: "translateY(50%) rotate(-90deg) translateX(50%)"
                    } [a.placedSide],
                    visibility: a.shouldHideArrow ? "hidden" : void 0
                },
                children: (0, n.jsx)(o, {
                    ...r,
                    ref: t,
                    style: {
                        ...r.style,
                        display: "block"
                    }
                })
            })
        });

    function N(e) {
        return null !== e
    }
    P.displayName = E;
    var j = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var l, r, a, n, o;
            let {
                placement: i,
                rects: s,
                middlewareData: d
            } = t, u = (null == (a = d.arrow) ? void 0 : a.centerOffset) !== 0, c = u ? 0 : e.arrowWidth, p = u ? 0 : e.arrowHeight, [m, f] = T(i), v = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [f], h = (null != (l = null == (n = d.arrow) ? void 0 : n.x) ? l : 0) + c / 2, g = (null != (r = null == (o = d.arrow) ? void 0 : o.y) ? r : 0) + p / 2, x = "", w = "";
            return "bottom" === m ? (x = u ? v : "".concat(h, "px"), w = "".concat(-p, "px")) : "top" === m ? (x = u ? v : "".concat(h, "px"), w = "".concat(s.floating.height + p, "px")) : "right" === m ? (x = "".concat(-p, "px"), w = u ? v : "".concat(g, "px")) : "left" === m && (x = "".concat(s.floating.width + p, "px"), w = u ? v : "".concat(g, "px")), {
                data: {
                    x,
                    y: w
                }
            }
        }
    });

    function T(e) {
        let [t, l = "center"] = e.split("-");
        return [t, l]
    }
    e.s(["Anchor", 0, w, "Arrow", 0, P, "Content", 0, C, "Root", 0, g, "createPopperScope", 0, f], 524887)
}, 220754, 634733, e => {
    "use strict";
    var t = e.i(253923),
        l = e.i(454778),
        r = e.i(629016),
        a = e.i(175064),
        n = e.i(197649),
        o = e.i(416340),
        i = e.i(149285),
        s = e.i(305607),
        d = e.i(19655),
        u = e.i(608652),
        c = e.i(78892),
        p = e.i(699704),
        m = e.i(221628),
        f = e.i(974539),
        v = e.i(598943),
        h = e.i(793808),
        g = e.i(44265),
        x = e.i(40266),
        w = e.i(524887),
        y = e.i(763960),
        S = e.i(594278),
        b = e.i(886449),
        C = e.i(428156),
        E = e.i(723570),
        R = e.i(300792),
        P = o.forwardRef((e, t) => (0, m.jsx)(S.Primitive.span, {
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
        j = e.i(813593),
        T = [" ", "Enter", "ArrowUp", "ArrowDown"],
        M = [" ", "Enter"],
        I = "Select",
        [k, L, A] = function(e) {
            let t = e + "CollectionProvider",
                [l, r] = (0, u.createContextScope)(t),
                [a, n] = l(t, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }),
                i = e => {
                    let {
                        scope: t,
                        children: l
                    } = e, r = o.default.useRef(null), n = o.default.useRef(new Map).current;
                    return (0, m.jsx)(a, {
                        scope: t,
                        itemMap: n,
                        collectionRef: r,
                        children: l
                    })
                };
            i.displayName = t;
            let s = e + "CollectionSlot",
                d = (0, p.createSlot)(s),
                f = o.default.forwardRef((e, t) => {
                    let {
                        scope: l,
                        children: r
                    } = e, a = n(s, l), o = (0, c.useComposedRefs)(t, a.collectionRef);
                    return (0, m.jsx)(d, {
                        ref: o,
                        children: r
                    })
                });
            f.displayName = s;
            let v = e + "CollectionItemSlot",
                h = "data-radix-collection-item",
                g = (0, p.createSlot)(v),
                x = o.default.forwardRef((e, t) => {
                    let {
                        scope: l,
                        children: r,
                        ...a
                    } = e, i = o.default.useRef(null), s = (0, c.useComposedRefs)(t, i), d = n(v, l);
                    return o.default.useEffect(() => (d.itemMap.set(i, {
                        ref: i,
                        ...a
                    }), () => void d.itemMap.delete(i))), (0, m.jsx)(g, {
                        ...{
                            [h]: ""
                        },
                        ref: s,
                        children: r
                    })
                });
            return x.displayName = v, [{
                Provider: i,
                Slot: f,
                ItemSlot: x
            }, function(t) {
                let l = n(e + "CollectionConsumer", t);
                return o.default.useCallback(() => {
                    let e = l.collectionRef.current;
                    if (!e) return [];
                    let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                    return Array.from(l.itemMap.values()).sort((e, l) => t.indexOf(e.ref.current) - t.indexOf(l.ref.current))
                }, [l.collectionRef, l.itemMap])
            }, r]
        }(I),
        [H, D] = (0, u.createContextScope)(I, [A, w.createPopperScope]),
        _ = (0, w.createPopperScope)(),
        [O, B] = H(I),
        [U, V] = H(I),
        X = e => {
            let {
                __scopeSelect: t,
                children: l,
                open: r,
                defaultOpen: a,
                onOpenChange: n,
                value: i,
                defaultValue: s,
                onValueChange: d,
                dir: u,
                name: c,
                autoComplete: p,
                disabled: v,
                required: h,
                form: g
            } = e, y = _(t), [S, b] = o.useState(null), [E, R] = o.useState(null), [P, N] = o.useState(!1), j = (0, f.useDirection)(u), [T = !1, M] = (0, C.useControllableState)({
                prop: r,
                defaultProp: a,
                onChange: n
            }), [I, L] = (0, C.useControllableState)({
                prop: i,
                defaultProp: s,
                onChange: d
            }), A = o.useRef(null), H = !S || g || !!S.closest("form"), [D, B] = o.useState(new Set), V = Array.from(D).map(e => e.props.value).join(";");
            return (0, m.jsx)(w.Root, {
                ...y,
                children: (0, m.jsxs)(O, {
                    required: h,
                    scope: t,
                    trigger: S,
                    onTriggerChange: b,
                    valueNode: E,
                    onValueNodeChange: R,
                    valueNodeHasChildren: P,
                    onValueNodeHasChildrenChange: N,
                    contentId: (0, x.useId)(),
                    value: I,
                    onValueChange: L,
                    open: T,
                    onOpenChange: M,
                    dir: j,
                    triggerPointerDownPosRef: A,
                    disabled: v,
                    children: [(0, m.jsx)(k.Provider, {
                        scope: t,
                        children: (0, m.jsx)(U, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: o.useCallback(e => {
                                B(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: o.useCallback(e => {
                                B(t => {
                                    let l = new Set(t);
                                    return l.delete(e), l
                                })
                            }, []),
                            children: l
                        })
                    }), H ? (0, m.jsxs)(eC, {
                        "aria-hidden": !0,
                        required: h,
                        tabIndex: -1,
                        name: c,
                        autoComplete: p,
                        value: I,
                        onChange: e => L(e.target.value),
                        disabled: v,
                        form: g,
                        children: [void 0 === I ? (0, m.jsx)("option", {
                            value: ""
                        }) : null, Array.from(D)]
                    }, V) : null]
                })
            })
        };
    X.displayName = I;
    var z = "SelectTrigger",
        F = o.forwardRef((e, t) => {
            let {
                __scopeSelect: l,
                disabled: r = !1,
                ...a
            } = e, n = _(l), i = B(z, l), s = i.disabled || r, u = (0, c.useComposedRefs)(t, i.onTriggerChange), p = L(l), f = o.useRef("touch"), [v, h, g] = eE(e => {
                let t = p().filter(e => !e.disabled),
                    l = t.find(e => e.value === i.value),
                    r = eR(t, e, l);
                void 0 !== r && i.onValueChange(r.value)
            }), x = e => {
                s || (i.onOpenChange(!0), g()), e && (i.triggerPointerDownPosRef.current = {
                    x: Math.round(e.pageX),
                    y: Math.round(e.pageY)
                })
            };
            return (0, m.jsx)(w.Anchor, {
                asChild: !0,
                ...n,
                children: (0, m.jsx)(S.Primitive.button, {
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
                    "data-placeholder": eb(i.value) ? "" : void 0,
                    ...a,
                    ref: u,
                    onClick: (0, d.composeEventHandlers)(a.onClick, e => {
                        e.currentTarget.focus(), "mouse" !== f.current && x(e)
                    }),
                    onPointerDown: (0, d.composeEventHandlers)(a.onPointerDown, e => {
                        f.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (x(e), e.preventDefault())
                    }),
                    onKeyDown: (0, d.composeEventHandlers)(a.onKeyDown, e => {
                        let t = "" !== v.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || h(e.key), (!t || " " !== e.key) && T.includes(e.key) && (x(), e.preventDefault())
                    })
                })
            })
        });
    F.displayName = z;
    var K = "SelectValue",
        W = o.forwardRef((e, t) => {
            let {
                __scopeSelect: l,
                className: r,
                style: a,
                children: n,
                placeholder: o = "",
                ...i
            } = e, s = B(K, l), {
                onValueNodeHasChildrenChange: d
            } = s, u = void 0 !== n, p = (0, c.useComposedRefs)(t, s.onValueNodeChange);
            return (0, E.useLayoutEffect)(() => {
                d(u)
            }, [d, u]), (0, m.jsx)(S.Primitive.span, {
                ...i,
                ref: p,
                style: {
                    pointerEvents: "none"
                },
                children: eb(s.value) ? (0, m.jsx)(m.Fragment, {
                    children: o
                }) : n
            })
        });
    W.displayName = K;
    var Y = o.forwardRef((e, t) => {
        let {
            __scopeSelect: l,
            children: r,
            ...a
        } = e;
        return (0, m.jsx)(S.Primitive.span, {
            "aria-hidden": !0,
            ...a,
            ref: t,
            children: r || "▼"
        })
    });
    Y.displayName = "SelectIcon";
    var q = e => (0, m.jsx)(y.Portal, {
        asChild: !0,
        ...e
    });
    q.displayName = "SelectPortal";
    var G = "SelectContent",
        Z = o.forwardRef((e, t) => {
            let l = B(G, e.__scopeSelect),
                [r, a] = o.useState();
            return ((0, E.useLayoutEffect)(() => {
                a(new DocumentFragment)
            }, []), l.open) ? (0, m.jsx)(ee, {
                ...e,
                ref: t
            }) : r ? i.createPortal((0, m.jsx)(J, {
                scope: e.__scopeSelect,
                children: (0, m.jsx)(k.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, m.jsx)("div", {
                        children: e.children
                    })
                })
            }), r) : null
        });
    Z.displayName = G;
    var [J, Q] = H(G), $ = (0, p.createSlot)("SelectContent.RemoveScroll"), ee = o.forwardRef((e, t) => {
        let {
            __scopeSelect: l,
            position: r = "item-aligned",
            onCloseAutoFocus: a,
            onEscapeKeyDown: n,
            onPointerDownOutside: i,
            side: s,
            sideOffset: u,
            align: p,
            alignOffset: f,
            arrowPadding: x,
            collisionBoundary: w,
            collisionPadding: y,
            sticky: S,
            hideWhenDetached: b,
            avoidCollisions: C,
            ...E
        } = e, R = B(G, l), [P, T] = o.useState(null), [M, I] = o.useState(null), k = (0, c.useComposedRefs)(t, e => T(e)), [A, H] = o.useState(null), [D, _] = o.useState(null), O = L(l), [U, V] = o.useState(!1), X = o.useRef(!1);
        o.useEffect(() => {
            if (P) return (0, N.hideOthers)(P)
        }, [P]), (0, h.useFocusGuards)();
        let z = o.useCallback(e => {
                let [t, ...l] = O().map(e => e.ref.current), [r] = l.slice(-1), a = document.activeElement;
                for (let l of e)
                    if (l === a || (null == l || l.scrollIntoView({
                            block: "nearest"
                        }), l === t && M && (M.scrollTop = 0), l === r && M && (M.scrollTop = M.scrollHeight), null == l || l.focus(), document.activeElement !== a)) return
            }, [O, M]),
            F = o.useCallback(() => z([A, P]), [z, A, P]);
        o.useEffect(() => {
            U && F()
        }, [U, F]);
        let {
            onOpenChange: K,
            triggerPointerDownPosRef: W
        } = R;
        o.useEffect(() => {
            if (P) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        var l, r, a, n;
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (null != (l = null == (a = W.current) ? void 0 : a.x) ? l : 0)),
                            y: Math.abs(Math.round(t.pageY) - (null != (r = null == (n = W.current) ? void 0 : n.y) ? r : 0))
                        }
                    },
                    l = l => {
                        e.x <= 10 && e.y <= 10 ? l.preventDefault() : P.contains(l.target) || K(!1), document.removeEventListener("pointermove", t), W.current = null
                    };
                return null !== W.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", l, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", l, {
                        capture: !0
                    })
                }
            }
        }, [P, K, W]), o.useEffect(() => {
            let e = () => K(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [K]);
        let [Y, q] = eE(e => {
            let t = O().filter(e => !e.disabled),
                l = t.find(e => e.ref.current === document.activeElement),
                r = eR(t, e, l);
            r && setTimeout(() => r.ref.current.focus())
        }), Z = o.useCallback((e, t, l) => {
            let r = !X.current && !l;
            (void 0 !== R.value && R.value === t || r) && (H(e), r && (X.current = !0))
        }, [R.value]), Q = o.useCallback(() => null == P ? void 0 : P.focus(), [P]), ee = o.useCallback((e, t, l) => {
            let r = !X.current && !l;
            (void 0 !== R.value && R.value === t || r) && _(e)
        }, [R.value]), er = "popper" === r ? el : et, ea = er === el ? {
            side: s,
            sideOffset: u,
            align: p,
            alignOffset: f,
            arrowPadding: x,
            collisionBoundary: w,
            collisionPadding: y,
            sticky: S,
            hideWhenDetached: b,
            avoidCollisions: C
        } : {};
        return (0, m.jsx)(J, {
            scope: l,
            content: P,
            viewport: M,
            onViewportChange: I,
            itemRefCallback: Z,
            selectedItem: A,
            onItemLeave: Q,
            itemTextRefCallback: ee,
            focusSelectedItem: F,
            selectedItemText: D,
            position: r,
            isPositioned: U,
            searchRef: Y,
            children: (0, m.jsx)(j.RemoveScroll, {
                as: $,
                allowPinchZoom: !0,
                children: (0, m.jsx)(g.FocusScope, {
                    asChild: !0,
                    trapped: R.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: (0, d.composeEventHandlers)(a, e => {
                        var t;
                        null == (t = R.trigger) || t.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, m.jsx)(v.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !0,
                        onEscapeKeyDown: n,
                        onPointerDownOutside: i,
                        onFocusOutside: e => e.preventDefault(),
                        onDismiss: () => R.onOpenChange(!1),
                        children: (0, m.jsx)(er, {
                            role: "listbox",
                            id: R.contentId,
                            "data-state": R.open ? "open" : "closed",
                            dir: R.dir,
                            onContextMenu: e => e.preventDefault(),
                            ...E,
                            ...ea,
                            onPlaced: () => V(!0),
                            ref: k,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...E.style
                            },
                            onKeyDown: (0, d.composeEventHandlers)(E.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || q(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = O().filter(e => !e.disabled).map(e => e.ref.current);
                                    if (["ArrowUp", "End"].includes(e.key) && (t = t.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                        let l = e.target,
                                            r = t.indexOf(l);
                                        t = t.slice(r + 1)
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
    ee.displayName = "SelectContentImpl";
    var et = o.forwardRef((e, t) => {
        let {
            __scopeSelect: l,
            onPlaced: r,
            ...a
        } = e, n = B(G, l), i = Q(G, l), [d, u] = o.useState(null), [p, f] = o.useState(null), v = (0, c.useComposedRefs)(t, e => f(e)), h = L(l), g = o.useRef(!1), x = o.useRef(!0), {
            viewport: w,
            selectedItem: y,
            selectedItemText: b,
            focusSelectedItem: C
        } = i, R = o.useCallback(() => {
            if (n.trigger && n.valueNode && d && p && w && y && b) {
                let e = n.trigger.getBoundingClientRect(),
                    t = p.getBoundingClientRect(),
                    l = n.valueNode.getBoundingClientRect(),
                    a = b.getBoundingClientRect();
                if ("rtl" !== n.dir) {
                    let r = a.left - t.left,
                        n = l.left - r,
                        o = e.left - n,
                        i = e.width + o,
                        u = Math.max(i, t.width),
                        c = window.innerWidth - 10,
                        p = (0, s.clamp)(n, [10, Math.max(10, c - u)]);
                    d.style.minWidth = i + "px", d.style.left = p + "px"
                } else {
                    let r = t.right - a.right,
                        n = window.innerWidth - l.right - r,
                        o = window.innerWidth - e.right - n,
                        i = e.width + o,
                        u = Math.max(i, t.width),
                        c = window.innerWidth - 10,
                        p = (0, s.clamp)(n, [10, Math.max(10, c - u)]);
                    d.style.minWidth = i + "px", d.style.right = p + "px"
                }
                let o = h(),
                    i = window.innerHeight - 20,
                    u = w.scrollHeight,
                    c = window.getComputedStyle(p),
                    m = parseInt(c.borderTopWidth, 10),
                    f = parseInt(c.paddingTop, 10),
                    v = parseInt(c.borderBottomWidth, 10),
                    x = m + f + u + parseInt(c.paddingBottom, 10) + v,
                    S = Math.min(5 * y.offsetHeight, x),
                    C = window.getComputedStyle(w),
                    E = parseInt(C.paddingTop, 10),
                    R = parseInt(C.paddingBottom, 10),
                    P = e.top + e.height / 2 - 10,
                    N = y.offsetHeight / 2,
                    j = m + f + (y.offsetTop + N);
                if (j <= P) {
                    let e = o.length > 0 && y === o[o.length - 1].ref.current;
                    d.style.bottom = "0px";
                    let t = Math.max(i - P, N + (e ? R : 0) + (p.clientHeight - w.offsetTop - w.offsetHeight) + v);
                    d.style.height = j + t + "px"
                } else {
                    let e = o.length > 0 && y === o[0].ref.current;
                    d.style.top = "0px";
                    let t = Math.max(P, m + w.offsetTop + (e ? E : 0) + N);
                    d.style.height = t + (x - j) + "px", w.scrollTop = j - P + w.offsetTop
                }
                d.style.margin = "".concat(10, "px 0"), d.style.minHeight = S + "px", d.style.maxHeight = i + "px", null == r || r(), requestAnimationFrame(() => g.current = !0)
            }
        }, [h, n.trigger, n.valueNode, d, p, w, y, b, n.dir, r]);
        (0, E.useLayoutEffect)(() => R(), [R]);
        let [P, N] = o.useState();
        (0, E.useLayoutEffect)(() => {
            p && N(window.getComputedStyle(p).zIndex)
        }, [p]);
        let j = o.useCallback(e => {
            e && !0 === x.current && (R(), null == C || C(), x.current = !1)
        }, [R, C]);
        return (0, m.jsx)(er, {
            scope: l,
            contentWrapper: d,
            shouldExpandOnScrollRef: g,
            onScrollButtonChange: j,
            children: (0, m.jsx)("div", {
                ref: u,
                style: {
                    display: "flex",
                    flexDirection: "column",
                    position: "fixed",
                    zIndex: P
                },
                children: (0, m.jsx)(S.Primitive.div, {
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
    et.displayName = "SelectItemAlignedPosition";
    var el = o.forwardRef((e, t) => {
        let {
            __scopeSelect: l,
            align: r = "start",
            collisionPadding: a = 10,
            ...n
        } = e, o = _(l);
        return (0, m.jsx)(w.Content, {
            ...o,
            ...n,
            ref: t,
            align: r,
            collisionPadding: a,
            style: {
                boxSizing: "border-box",
                ...n.style,
                "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
            }
        })
    });
    el.displayName = "SelectPopperPosition";
    var [er, ea] = H(G, {}), en = "SelectViewport", eo = o.forwardRef((e, t) => {
        let {
            __scopeSelect: l,
            nonce: r,
            ...a
        } = e, n = Q(en, l), i = ea(en, l), s = (0, c.useComposedRefs)(t, n.onViewportChange), u = o.useRef(0);
        return (0, m.jsxs)(m.Fragment, {
            children: [(0, m.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: r
            }), (0, m.jsx)(k.Slot, {
                scope: l,
                children: (0, m.jsx)(S.Primitive.div, {
                    "data-radix-select-viewport": "",
                    role: "presentation",
                    ...a,
                    ref: s,
                    style: {
                        position: "relative",
                        flex: 1,
                        overflow: "hidden auto",
                        ...a.style
                    },
                    onScroll: (0, d.composeEventHandlers)(a.onScroll, e => {
                        let t = e.currentTarget,
                            {
                                contentWrapper: l,
                                shouldExpandOnScrollRef: r
                            } = i;
                        if ((null == r ? void 0 : r.current) && l) {
                            let e = Math.abs(u.current - t.scrollTop);
                            if (e > 0) {
                                let r = window.innerHeight - 20,
                                    a = Math.max(parseFloat(l.style.minHeight), parseFloat(l.style.height));
                                if (a < r) {
                                    let n = a + e,
                                        o = Math.min(r, n),
                                        i = n - o;
                                    l.style.height = o + "px", "0px" === l.style.bottom && (t.scrollTop = i > 0 ? i : 0, l.style.justifyContent = "flex-end")
                                }
                            }
                        }
                        u.current = t.scrollTop
                    })
                })
            })]
        })
    });
    eo.displayName = en;
    var ei = "SelectGroup",
        [es, ed] = H(ei);
    o.forwardRef((e, t) => {
        let {
            __scopeSelect: l,
            ...r
        } = e, a = (0, x.useId)();
        return (0, m.jsx)(es, {
            scope: l,
            id: a,
            children: (0, m.jsx)(S.Primitive.div, {
                role: "group",
                "aria-labelledby": a,
                ...r,
                ref: t
            })
        })
    }).displayName = ei;
    var eu = "SelectLabel";
    o.forwardRef((e, t) => {
        let {
            __scopeSelect: l,
            ...r
        } = e, a = ed(eu, l);
        return (0, m.jsx)(S.Primitive.div, {
            id: a.id,
            ...r,
            ref: t
        })
    }).displayName = eu;
    var ec = "SelectItem",
        [ep, em] = H(ec),
        ef = o.forwardRef((e, t) => {
            let {
                __scopeSelect: l,
                value: r,
                disabled: a = !1,
                textValue: n,
                ...i
            } = e, s = B(ec, l), u = Q(ec, l), p = s.value === r, [f, v] = o.useState(null != n ? n : ""), [h, g] = o.useState(!1), w = (0, c.useComposedRefs)(t, e => {
                var t;
                return null == (t = u.itemRefCallback) ? void 0 : t.call(u, e, r, a)
            }), y = (0, x.useId)(), b = o.useRef("touch"), C = () => {
                a || (s.onValueChange(r), s.onOpenChange(!1))
            };
            if ("" === r) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, m.jsx)(ep, {
                scope: l,
                value: r,
                disabled: a,
                textId: y,
                isSelected: p,
                onItemTextChange: o.useCallback(e => {
                    v(t => {
                        var l;
                        return t || (null != (l = null == e ? void 0 : e.textContent) ? l : "").trim()
                    })
                }, []),
                children: (0, m.jsx)(k.ItemSlot, {
                    scope: l,
                    value: r,
                    disabled: a,
                    textValue: f,
                    children: (0, m.jsx)(S.Primitive.div, {
                        role: "option",
                        "aria-labelledby": y,
                        "data-highlighted": h ? "" : void 0,
                        "aria-selected": p && h,
                        "data-state": p ? "checked" : "unchecked",
                        "aria-disabled": a || void 0,
                        "data-disabled": a ? "" : void 0,
                        tabIndex: a ? void 0 : -1,
                        ...i,
                        ref: w,
                        onFocus: (0, d.composeEventHandlers)(i.onFocus, () => g(!0)),
                        onBlur: (0, d.composeEventHandlers)(i.onBlur, () => g(!1)),
                        onClick: (0, d.composeEventHandlers)(i.onClick, () => {
                            "mouse" !== b.current && C()
                        }),
                        onPointerUp: (0, d.composeEventHandlers)(i.onPointerUp, () => {
                            "mouse" === b.current && C()
                        }),
                        onPointerDown: (0, d.composeEventHandlers)(i.onPointerDown, e => {
                            b.current = e.pointerType
                        }),
                        onPointerMove: (0, d.composeEventHandlers)(i.onPointerMove, e => {
                            if (b.current = e.pointerType, a) {
                                var t;
                                null == (t = u.onItemLeave) || t.call(u)
                            } else "mouse" === b.current && e.currentTarget.focus({
                                preventScroll: !0
                            })
                        }),
                        onPointerLeave: (0, d.composeEventHandlers)(i.onPointerLeave, e => {
                            if (e.currentTarget === document.activeElement) {
                                var t;
                                null == (t = u.onItemLeave) || t.call(u)
                            }
                        }),
                        onKeyDown: (0, d.composeEventHandlers)(i.onKeyDown, e => {
                            var t;
                            ((null == (t = u.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (M.includes(e.key) && C(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    ef.displayName = ec;
    var ev = "SelectItemText",
        eh = o.forwardRef((e, t) => {
            let {
                __scopeSelect: l,
                className: r,
                style: a,
                ...n
            } = e, s = B(ev, l), d = Q(ev, l), u = em(ev, l), p = V(ev, l), [f, v] = o.useState(null), h = (0, c.useComposedRefs)(t, e => v(e), u.onItemTextChange, e => {
                var t;
                return null == (t = d.itemTextRefCallback) ? void 0 : t.call(d, e, u.value, u.disabled)
            }), g = null == f ? void 0 : f.textContent, x = o.useMemo(() => (0, m.jsx)("option", {
                value: u.value,
                disabled: u.disabled,
                children: g
            }, u.value), [u.disabled, u.value, g]), {
                onNativeOptionAdd: w,
                onNativeOptionRemove: y
            } = p;
            return (0, E.useLayoutEffect)(() => (w(x), () => y(x)), [w, y, x]), (0, m.jsxs)(m.Fragment, {
                children: [(0, m.jsx)(S.Primitive.span, {
                    id: u.textId,
                    ...n,
                    ref: h
                }), u.isSelected && s.valueNode && !s.valueNodeHasChildren ? i.createPortal(n.children, s.valueNode) : null]
            })
        });
    eh.displayName = ev;
    var eg = "SelectItemIndicator";
    o.forwardRef((e, t) => {
        let {
            __scopeSelect: l,
            ...r
        } = e;
        return em(eg, l).isSelected ? (0, m.jsx)(S.Primitive.span, {
            "aria-hidden": !0,
            ...r,
            ref: t
        }) : null
    }).displayName = eg;
    var ex = "SelectScrollUpButton";
    o.forwardRef((e, t) => {
        let l = Q(ex, e.__scopeSelect),
            r = ea(ex, e.__scopeSelect),
            [a, n] = o.useState(!1),
            i = (0, c.useComposedRefs)(t, r.onScrollButtonChange);
        return (0, E.useLayoutEffect)(() => {
            if (l.viewport && l.isPositioned) {
                let e = function() {
                        n(t.scrollTop > 0)
                    },
                    t = l.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [l.viewport, l.isPositioned]), a ? (0, m.jsx)(ey, {
            ...e,
            ref: i,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = l;
                e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
            }
        }) : null
    }).displayName = ex;
    var ew = "SelectScrollDownButton";
    o.forwardRef((e, t) => {
        let l = Q(ew, e.__scopeSelect),
            r = ea(ew, e.__scopeSelect),
            [a, n] = o.useState(!1),
            i = (0, c.useComposedRefs)(t, r.onScrollButtonChange);
        return (0, E.useLayoutEffect)(() => {
            if (l.viewport && l.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        n(Math.ceil(t.scrollTop) < e)
                    },
                    t = l.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [l.viewport, l.isPositioned]), a ? (0, m.jsx)(ey, {
            ...e,
            ref: i,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = l;
                e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
            }
        }) : null
    }).displayName = ew;
    var ey = o.forwardRef((e, t) => {
        let {
            __scopeSelect: l,
            onAutoScroll: r,
            ...a
        } = e, n = Q("SelectScrollButton", l), i = o.useRef(null), s = L(l), u = o.useCallback(() => {
            null !== i.current && (window.clearInterval(i.current), i.current = null)
        }, []);
        return o.useEffect(() => () => u(), [u]), (0, E.useLayoutEffect)(() => {
            var e;
            let t = s().find(e => e.ref.current === document.activeElement);
            null == t || null == (e = t.ref.current) || e.scrollIntoView({
                block: "nearest"
            })
        }, [s]), (0, m.jsx)(S.Primitive.div, {
            "aria-hidden": !0,
            ...a,
            ref: t,
            style: {
                flexShrink: 0,
                ...a.style
            },
            onPointerDown: (0, d.composeEventHandlers)(a.onPointerDown, () => {
                null === i.current && (i.current = window.setInterval(r, 50))
            }),
            onPointerMove: (0, d.composeEventHandlers)(a.onPointerMove, () => {
                var e;
                null == (e = n.onItemLeave) || e.call(n), null === i.current && (i.current = window.setInterval(r, 50))
            }),
            onPointerLeave: (0, d.composeEventHandlers)(a.onPointerLeave, () => {
                u()
            })
        })
    });
    o.forwardRef((e, t) => {
        let {
            __scopeSelect: l,
            ...r
        } = e;
        return (0, m.jsx)(S.Primitive.div, {
            "aria-hidden": !0,
            ...r,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var eS = "SelectArrow";

    function eb(e) {
        return "" === e || void 0 === e
    }
    o.forwardRef((e, t) => {
        let {
            __scopeSelect: l,
            ...r
        } = e, a = _(l), n = B(eS, l), o = Q(eS, l);
        return n.open && "popper" === o.position ? (0, m.jsx)(w.Arrow, {
            ...a,
            ...r,
            ref: t
        }) : null
    }).displayName = eS;
    var eC = o.forwardRef((e, t) => {
        let {
            value: l,
            ...r
        } = e, a = o.useRef(null), n = (0, c.useComposedRefs)(t, a), i = (0, R.usePrevious)(l);
        return o.useEffect(() => {
            let e = a.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
            if (i !== l && t) {
                let r = new Event("change", {
                    bubbles: !0
                });
                t.call(e, l), e.dispatchEvent(r)
            }
        }, [i, l]), (0, m.jsx)(P, {
            asChild: !0,
            children: (0, m.jsx)("select", {
                ...r,
                ref: n,
                defaultValue: l
            })
        })
    });

    function eE(e) {
        let t = (0, b.useCallbackRef)(e),
            l = o.useRef(""),
            r = o.useRef(0),
            a = o.useCallback(e => {
                let a = l.current + e;
                t(a),
                    function e(t) {
                        l.current = t, window.clearTimeout(r.current), "" !== t && (r.current = window.setTimeout(() => e(""), 1e3))
                    }(a)
            }, [t]),
            n = o.useCallback(() => {
                l.current = "", window.clearTimeout(r.current)
            }, []);
        return o.useEffect(() => () => window.clearTimeout(r.current), []), [l, a, n]
    }

    function eR(e, t, l) {
        var r, a;
        let n = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            o = l ? e.indexOf(l) : -1,
            i = (r = e, a = Math.max(o, 0), r.map((e, t) => r[(a + t) % r.length]));
        1 === n.length && (i = i.filter(e => e !== l));
        let s = i.find(e => e.textValue.toLowerCase().startsWith(n.toLowerCase()));
        return s !== l ? s : void 0
    }
    eC.displayName = "BubbleSelect";
    let eP = (0, o.createContext)(null),
        eN = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        ej = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        eT = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        eM = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        eI = {
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
        eL = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        eA = (0, o.forwardRef)((e, i) => {
            let {
                label: s,
                labelTooltip: d,
                ariaLabelledBy: u,
                ariaLabel: c,
                className: p,
                size: m,
                variant: f = "Standard",
                value: v,
                placeholder: h,
                isDisabled: g,
                hasError: x,
                hint: w,
                onValueChange: y,
                onOpenChange: S,
                children: b
            } = e, C = (0, l.default)(), E = (0, o.useMemo)(() => ({
                size: m
            }), [m]), R = s ? o.default.createElement("span", {
                id: C,
                className: (0, n.default)(eT[m], "content-emphasis")
            }, s) : null;
            return o.default.createElement(eP.Provider, {
                value: E
            }, o.default.createElement("div", {
                className: (0, n.default)("flex flex-col", g && ["opacity-[0.5]", "pointer-events-none"], eI[m], p)
            }, R && (d ? o.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, R, o.default.createElement(r.LabelTooltip, d)) : R), o.default.createElement(X, {
                value: v,
                disabled: g,
                onValueChange: y,
                onOpenChange: S
            }, o.default.createElement(F, {
                className: (0, n.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", a.INPUT_BACKGROUND_BY_VARIANT[f], a.INPUT_STROKE_BY_VARIANT[f], ek[m], eL[m], ej[m], eM[m], x ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === v ? "content-muted" : "content-default"),
                ref: i,
                "aria-labelledby": s ? C : u,
                "aria-label": c
            }, o.default.createElement(t.StateLayer, null), o.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, o.default.createElement(W, {
                placeholder: h
            })), o.default.createElement(Y, {
                className: (0, n.default)(eN[m], "icon icon-regular-chevron-large-down content-default")
            })), o.default.createElement(q, null, o.default.createElement(Z, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, b))), w && o.default.createElement("span", {
                className: (0, n.default)("text-caption-small", {
                    "content-system-alert": x,
                    "content-default": !x
                })
            }, w)))
        });
    eA.displayName = "Dropdown", e.s(["Dropdown", 0, eA, "DropdownContext", 0, eP], 634733);
    var eH = e.i(23342),
        eD = e.i(142953);
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
        eB = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        eU = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        eV = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        eX = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        ez = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        eF = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        eK = (0, o.createContext)(null),
        eW = () => {
            let e = (0, o.useContext)(eK);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        var t;
        let {
            children: l,
            className: r,
            size: a
        } = e, i = (0, o.useContext)(eP), s = i ? "dropdown" : "standalone", d = null != (t = null != a ? a : null == i ? void 0 : i.size) ? t : "Medium", u = (0, o.useMemo)(() => ({
            size: d,
            mode: s
        }), [d, s]), c = (0, n.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", e_[d], r), p = "standalone" === s ? o.default.createElement(eD.Root, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, o.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: c
        }, l)) : o.default.createElement("div", {
            className: c
        }, l);
        return o.default.createElement(eK.Provider, {
            value: u
        }, "dropdown" === s ? o.default.createElement(eo, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, p) : p)
    }, "MenuItem", 0, e => {
        let l, {
                value: r,
                leading: a,
                title: i,
                description: s,
                trailing: d,
                disabled: u,
                className: c,
                onSelect: p,
                asChild: m,
                children: f,
                ...v
            } = e,
            {
                size: h,
                mode: g
            } = eW(),
            x = (0, n.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", ez[h], eB[h], eU[h], eV[h], eF[h], u && "opacity-[0.5]", u && "pointer-events-none", c),
            w = o.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, i);
        switch (g) {
            case "dropdown":
                w = o.default.createElement(eh, {
                    asChild: !0
                }, w);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", g)
        }
        let y = o.default.createElement(o.default.Fragment, null, !u && o.default.createElement(t.StateLayer, null), a, o.default.createElement("div", {
            className: (0, n.default)("grow-1 text-truncate-split flex flex-col", eX[h])
        }, w, s && o.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, s)), d);
        if (m) {
            let {
                as: e,
                ...r
            } = v, a = o.default.Children.only(f), n = void 0 === i && a.props.children;
            l = o.default.createElement(eH.Slot, {
                ...r,
                role: "standalone" === g ? "menuitem" : void 0,
                "aria-disabled": u || void 0,
                className: x,
                style: {
                    outlineOffset: 0
                },
                onClick: u ? void 0 : p
            }, n ? o.default.cloneElement(a, {}, o.default.createElement(o.default.Fragment, null, !u && o.default.createElement(t.StateLayer, null), a.props.children)) : o.default.cloneElement(a, {}, y))
        } else if ("a" === v.as) {
            let {
                as: e,
                href: t,
                ...r
            } = v;
            l = o.default.createElement("a", {
                ...r,
                role: "standalone" === g ? "menuitem" : void 0,
                "aria-disabled": u,
                href: u ? void 0 : t,
                className: x,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: u ? void 0 : p
            }, y)
        } else {
            let {
                as: e,
                ...t
            } = v;
            l = o.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === g ? "menuitem" : void 0,
                "aria-disabled": u,
                className: x,
                style: {
                    outlineOffset: 0
                },
                onClick: u ? void 0 : p
            }, y)
        }
        return "dropdown" === g ? o.default.createElement(ef, {
            value: r,
            disabled: u,
            asChild: !0
        }, l) : o.default.createElement(eD.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: r
        }, l)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: l,
            leading: r,
            trailing: a,
            disabled: i,
            className: s
        } = e, {
            size: d
        } = eW(), u = (0, n.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", ez[d], eB[d], eU[d], eV[d], i && "opacity-[0.5]", s);
        return o.default.createElement("div", {
            role: "none",
            className: u
        }, r, o.default.createElement("div", {
            className: (0, n.default)("grow-1 text-truncate-split flex flex-col", eX[d])
        }, o.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), l && o.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, l)), a)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: l
        } = e, {
            size: r
        } = eW();
        return o.default.createElement("div", {
            role: "group",
            className: (0, n.default)(eO[r], l)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return o.default.createElement("div", {
            role: "separator",
            className: (0, n.default)("foundation-web-menu-separator", t)
        })
    }], 220754)
}, 629016, e => {
    "use strict";
    var t = e.i(605836),
        l = e.i(516674),
        r = e.i(416340);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: a,
            description: n,
            position: o = "top-center"
        } = e;
        return r.default.createElement(l.Tooltip, {
            position: o,
            title: a,
            description: n
        }, r.default.createElement(l.TooltipTrigger, {
            asChild: !0
        }, r.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": a,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, r.default.createElement(t.Icon, {
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
    let l = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            r = (0, t.useRef)();
        return r.current || (l += 1, r.current = "".concat(e).concat(l)), r.current
    }])
}]);

//# debugId=6630f118-832f-13a6-5c80-84cf931291c4
//# sourceMappingURL=25y5mroqtt9z7.js.map
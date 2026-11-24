;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "adc41a3a-2cc1-480e-add5-1d237af353c7")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 155581, e => {
    "use strict";
    let t = (e, t, r, l) => {
        try {
            return new Intl.NumberFormat(t, {
                style: r,
                currency: l
            }).format(e)
        } catch {
            return e.toString()
        }
    };
    var r, l = ((r = {}).withPlus = "withPlus", r.withoutPlus = "withoutPlus", r);
    let a = {
        withPlus: ["", "K+", "M+", "B+", "T+"],
        withoutPlus: ["", "K", "M", "B", "T"]
    };
    e.s(["SuffixNames", () => l, "abbreviateNumber", 0, (e, r, l, n) => {
        let o = `${e}`;
        if (l && e < l) return n ? t(e) : o;
        let i = r ? a[r] : a.withoutPlus,
            s = Math.ceil(o.length / 3),
            d = Math.round(e / 1e3 ** s * 10) / 10,
            u = s - 1,
            c = Math.round(e / 1e3 ** u * 10) / 10;
        return c >= 1e3 ? d.toString() + i[s] : c.toString() + i[u]
    }, "formatNumber", 0, t, "suffixes", 0, a, "truncNumber", 0, (e, r, l, n) => {
        let o = `${e}`;
        if (e < (r ?? 1e4)) return t(e);
        let i = l ? a[l] : a.withPlus,
            s = 12,
            d = i[Math.min(Math.floor(Math.log(e) / Math.log(1e3)), i.length - 1)];
        e < 1e6 ? s = 3 : e < 1e9 ? s = 6 : e < 1e12 && (s = 9);
        let u = o.length - s,
            c = n ? `.${o.substring(u,u+n)}` : "";
        return o.substring(0, u) + c + d
    }])
}, 215941, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(706888),
        l = e.i(422957),
        a = e.i(434205),
        n = e.i(809804),
        o = t.forwardRef((e, t) => {
            let {
                children: r,
                width: l = 10,
                height: o = 5,
                ...i
            } = e;
            return (0, n.jsx)(a.Primitive.svg, {
                ...i,
                ref: t,
                width: l,
                height: o,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? r : (0, n.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    o.displayName = "Arrow";
    var i = e.i(539181),
        s = e.i(734988),
        d = e.i(823499),
        u = e.i(13522),
        c = e.i(189192),
        m = "Popper",
        [p, f] = (0, s.createContextScope)(m),
        [h, v] = p(m),
        g = e => {
            let {
                __scopePopper: r,
                children: l
            } = e, [a, o] = t.useState(null);
            return (0, n.jsx)(h, {
                scope: r,
                anchor: a,
                onAnchorChange: o,
                children: l
            })
        };
    g.displayName = m;
    var x = "PopperAnchor",
        w = t.forwardRef((e, r) => {
            let {
                __scopePopper: l,
                virtualRef: o,
                ...s
            } = e, d = v(x, l), u = t.useRef(null), c = (0, i.useComposedRefs)(r, u);
            return t.useEffect(() => {
                d.onAnchorChange(o?.current || u.current)
            }), o ? null : (0, n.jsx)(a.Primitive.div, {
                ...s,
                ref: c
            })
        });
    w.displayName = x;
    var y = "PopperContent",
        [b, S] = p(y),
        C = t.forwardRef((e, o) => {
            let {
                __scopePopper: s,
                side: m = "bottom",
                sideOffset: p = 0,
                align: f = "center",
                alignOffset: h = 0,
                arrowPadding: g = 0,
                avoidCollisions: x = !0,
                collisionBoundary: w = [],
                collisionPadding: S = 0,
                sticky: C = "partial",
                hideWhenDetached: E = !1,
                updatePositionStrategy: R = "optimized",
                onPlaced: P,
                ...L
            } = e, T = v(y, s), [k, I] = t.useState(null), A = (0, i.useComposedRefs)(o, e => I(e)), [H, D] = t.useState(null), O = (0, c.useSize)(H), B = O?.width ?? 0, _ = O?.height ?? 0, F = "number" == typeof S ? S : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...S
            }, X = Array.isArray(w) ? w : [w], K = X.length > 0, z = {
                padding: F,
                boundary: X.filter(N),
                altBoundary: K
            }, {
                refs: V,
                floatingStyles: $,
                placement: U,
                isPositioned: W,
                middlewareData: Y
            } = (0, r.useFloating)({
                strategy: "fixed",
                placement: m + ("center" !== f ? "-" + f : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, l.autoUpdate)(...t, {
                        animationFrame: "always" === R
                    })
                },
                elements: {
                    reference: T.anchor
                },
                middleware: [(0, r.offset)({
                    mainAxis: p + _,
                    alignmentAxis: h
                }), x && (0, r.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === C ? (0, r.limitShift)() : void 0,
                    ...z
                }), x && (0, r.flip)({
                    ...z
                }), (0, r.size)({
                    ...z,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: l,
                            availableHeight: a
                        } = e, {
                            width: n,
                            height: o
                        } = r.reference, i = t.floating.style;
                        i.setProperty("--radix-popper-available-width", `${l}px`), i.setProperty("--radix-popper-available-height", `${a}px`), i.setProperty("--radix-popper-anchor-width", `${n}px`), i.setProperty("--radix-popper-anchor-height", `${o}px`)
                    }
                }), H && (0, r.arrow)({
                    element: H,
                    padding: g
                }), M({
                    arrowWidth: B,
                    arrowHeight: _
                }), E && (0, r.hide)({
                    strategy: "referenceHidden",
                    ...z
                })]
            }), [q, G] = j(U), Z = (0, d.useCallbackRef)(P);
            (0, u.useLayoutEffect)(() => {
                W && Z?.()
            }, [W, Z]);
            let J = Y.arrow?.x,
                Q = Y.arrow?.y,
                ee = Y.arrow?.centerOffset !== 0,
                [et, er] = t.useState();
            return (0, u.useLayoutEffect)(() => {
                k && er(window.getComputedStyle(k).zIndex)
            }, [k]), (0, n.jsx)("div", {
                ref: V.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...$,
                    transform: W ? $.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: et,
                    "--radix-popper-transform-origin": [Y.transformOrigin?.x, Y.transformOrigin?.y].join(" "),
                    ...Y.hide?.referenceHidden && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, n.jsx)(b, {
                    scope: s,
                    placedSide: q,
                    onArrowChange: D,
                    arrowX: J,
                    arrowY: Q,
                    shouldHideArrow: ee,
                    children: (0, n.jsx)(a.Primitive.div, {
                        "data-side": q,
                        "data-align": G,
                        ...L,
                        ref: A,
                        style: {
                            ...L.style,
                            animation: W ? void 0 : "none"
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
            } = e, a = S(E, r), i = R[a.placedSide];
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
    var M = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            let {
                placement: r,
                rects: l,
                middlewareData: a
            } = t, n = a.arrow?.centerOffset !== 0, o = n ? 0 : e.arrowWidth, i = n ? 0 : e.arrowHeight, [s, d] = j(r), u = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [d], c = (a.arrow?.x ?? 0) + o / 2, m = (a.arrow?.y ?? 0) + i / 2, p = "", f = "";
            return "bottom" === s ? (p = n ? u : `${c}px`, f = `${-i}px`) : "top" === s ? (p = n ? u : `${c}px`, f = `${l.floating.height+i}px`) : "right" === s ? (p = `${-i}px`, f = n ? u : `${m}px`) : "left" === s && (p = `${l.floating.width+i}px`, f = n ? u : `${m}px`), {
                data: {
                    x: p,
                    y: f
                }
            }
        }
    });

    function j(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["Anchor", 0, w, "Arrow", 0, P, "Content", 0, C, "Root", 0, g, "createPopperScope", 0, f], 215941)
}, 986377, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(734988),
        l = e.i(539181),
        a = e.i(354981),
        n = e.i(809804);
    e.s(["createCollection", 0, function(e) {
        let o = e + "CollectionProvider",
            [i, s] = (0, r.createContextScope)(o),
            [d, u] = i(o, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            c = e => {
                let {
                    scope: r,
                    children: l
                } = e, a = t.default.useRef(null), o = t.default.useRef(new Map).current;
                return (0, n.jsx)(d, {
                    scope: r,
                    itemMap: o,
                    collectionRef: a,
                    children: l
                })
            };
        c.displayName = o;
        let m = e + "CollectionSlot",
            p = (0, a.createSlot)(m),
            f = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: a
                } = e, o = u(m, r), i = (0, l.useComposedRefs)(t, o.collectionRef);
                return (0, n.jsx)(p, {
                    ref: i,
                    children: a
                })
            });
        f.displayName = m;
        let h = e + "CollectionItemSlot",
            v = "data-radix-collection-item",
            g = (0, a.createSlot)(h),
            x = t.default.forwardRef((e, r) => {
                let {
                    scope: a,
                    children: o,
                    ...i
                } = e, s = t.default.useRef(null), d = (0, l.useComposedRefs)(r, s), c = u(h, a);
                return t.default.useEffect(() => (c.itemMap.set(s, {
                    ref: s,
                    ...i
                }), () => void c.itemMap.delete(s))), (0, n.jsx)(g, {
                    ...{
                        [v]: ""
                    },
                    ref: d,
                    children: o
                })
            });
        return x.displayName = h, [{
            Provider: c,
            Slot: f,
            ItemSlot: x
        }, function(r) {
            let l = u(e + "CollectionConsumer", r);
            return t.default.useCallback(() => {
                let e = l.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll(`[${v}]`));
                return Array.from(l.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [l.collectionRef, l.itemMap])
        }, s]
    }])
}, 726799, 713633, e => {
    "use strict";
    var t = e.i(885065),
        r = e.i(511336),
        l = e.i(790033),
        a = e.i(227801),
        n = e.i(7284),
        o = e.i(371847),
        i = e.i(652447),
        s = e.i(527069),
        d = e.i(775453),
        u = e.i(986377),
        c = e.i(539181),
        m = e.i(734988),
        p = e.i(274879),
        f = e.i(430781),
        h = e.i(653279),
        v = e.i(5872),
        g = e.i(481010),
        x = e.i(215941),
        w = e.i(337537),
        y = e.i(434205),
        b = e.i(354981),
        S = e.i(823499),
        C = e.i(494334),
        E = e.i(13522),
        R = e.i(183901),
        P = e.i(809804),
        N = o.forwardRef((e, t) => (0, P.jsx)(y.Primitive.span, {
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
    N.displayName = "VisuallyHidden";
    var M = e.i(73772),
        j = e.i(641501),
        L = [" ", "Enter", "ArrowUp", "ArrowDown"],
        T = [" ", "Enter"],
        k = "Select",
        [I, A, H] = (0, u.createCollection)(k),
        [D, O] = (0, m.createContextScope)(k, [H, x.createPopperScope]),
        B = (0, x.createPopperScope)(),
        [_, F] = D(k),
        [X, K] = D(k),
        z = e => {
            let {
                __scopeSelect: t,
                children: r,
                open: l,
                defaultOpen: a,
                onOpenChange: n,
                value: i,
                defaultValue: s,
                onValueChange: d,
                dir: u,
                name: c,
                autoComplete: m,
                disabled: f,
                required: h,
                form: v
            } = e, w = B(t), [y, b] = o.useState(null), [S, E] = o.useState(null), [R, N] = o.useState(!1), M = (0, p.useDirection)(u), [j = !1, L] = (0, C.useControllableState)({
                prop: l,
                defaultProp: a,
                onChange: n
            }), [T, k] = (0, C.useControllableState)({
                prop: i,
                defaultProp: s,
                onChange: d
            }), A = o.useRef(null), H = !y || v || !!y.closest("form"), [D, O] = o.useState(new Set), F = Array.from(D).map(e => e.props.value).join(";");
            return (0, P.jsx)(x.Root, {
                ...w,
                children: (0, P.jsxs)(_, {
                    required: h,
                    scope: t,
                    trigger: y,
                    onTriggerChange: b,
                    valueNode: S,
                    onValueNodeChange: E,
                    valueNodeHasChildren: R,
                    onValueNodeHasChildrenChange: N,
                    contentId: (0, g.useId)(),
                    value: T,
                    onValueChange: k,
                    open: j,
                    onOpenChange: L,
                    dir: M,
                    triggerPointerDownPosRef: A,
                    disabled: f,
                    children: [(0, P.jsx)(I.Provider, {
                        scope: t,
                        children: (0, P.jsx)(X, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: o.useCallback(e => {
                                O(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: o.useCallback(e => {
                                O(t => {
                                    let r = new Set(t);
                                    return r.delete(e), r
                                })
                            }, []),
                            children: r
                        })
                    }), H ? (0, P.jsxs)(eE, {
                        "aria-hidden": !0,
                        required: h,
                        tabIndex: -1,
                        name: c,
                        autoComplete: m,
                        value: T,
                        onChange: e => k(e.target.value),
                        disabled: f,
                        form: v,
                        children: [void 0 === T ? (0, P.jsx)("option", {
                            value: ""
                        }) : null, Array.from(D)]
                    }, F) : null]
                })
            })
        };
    z.displayName = k;
    var V = "SelectTrigger",
        $ = o.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                disabled: l = !1,
                ...a
            } = e, n = B(r), i = F(V, r), s = i.disabled || l, u = (0, c.useComposedRefs)(t, i.onTriggerChange), m = A(r), p = o.useRef("touch"), [f, h, v] = eR(e => {
                let t = m().filter(e => !e.disabled),
                    r = t.find(e => e.value === i.value),
                    l = eP(t, e, r);
                void 0 !== l && i.onValueChange(l.value)
            }), g = e => {
                s || (i.onOpenChange(!0), v()), e && (i.triggerPointerDownPosRef.current = {
                    x: Math.round(e.pageX),
                    y: Math.round(e.pageY)
                })
            };
            return (0, P.jsx)(x.Anchor, {
                asChild: !0,
                ...n,
                children: (0, P.jsx)(y.Primitive.button, {
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
                    "data-placeholder": eC(i.value) ? "" : void 0,
                    ...a,
                    ref: u,
                    onClick: (0, d.composeEventHandlers)(a.onClick, e => {
                        e.currentTarget.focus(), "mouse" !== p.current && g(e)
                    }),
                    onPointerDown: (0, d.composeEventHandlers)(a.onPointerDown, e => {
                        p.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (g(e), e.preventDefault())
                    }),
                    onKeyDown: (0, d.composeEventHandlers)(a.onKeyDown, e => {
                        let t = "" !== f.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || h(e.key), (!t || " " !== e.key) && L.includes(e.key) && (g(), e.preventDefault())
                    })
                })
            })
        });
    $.displayName = V;
    var U = "SelectValue",
        W = o.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: l,
                style: a,
                children: n,
                placeholder: o = "",
                ...i
            } = e, s = F(U, r), {
                onValueNodeHasChildrenChange: d
            } = s, u = void 0 !== n, m = (0, c.useComposedRefs)(t, s.onValueNodeChange);
            return (0, E.useLayoutEffect)(() => {
                d(u)
            }, [d, u]), (0, P.jsx)(y.Primitive.span, {
                ...i,
                ref: m,
                style: {
                    pointerEvents: "none"
                },
                children: eC(s.value) ? (0, P.jsx)(P.Fragment, {
                    children: o
                }) : n
            })
        });
    W.displayName = U;
    var Y = o.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            children: l,
            ...a
        } = e;
        return (0, P.jsx)(y.Primitive.span, {
            "aria-hidden": !0,
            ...a,
            ref: t,
            children: l || "▼"
        })
    });
    Y.displayName = "SelectIcon";
    var q = e => (0, P.jsx)(w.Portal, {
        asChild: !0,
        ...e
    });
    q.displayName = "SelectPortal";
    var G = "SelectContent",
        Z = o.forwardRef((e, t) => {
            let r = F(G, e.__scopeSelect),
                [l, a] = o.useState();
            return ((0, E.useLayoutEffect)(() => {
                a(new DocumentFragment)
            }, []), r.open) ? (0, P.jsx)(et, {
                ...e,
                ref: t
            }) : l ? i.createPortal((0, P.jsx)(J, {
                scope: e.__scopeSelect,
                children: (0, P.jsx)(I.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, P.jsx)("div", {
                        children: e.children
                    })
                })
            }), l) : null
        });
    Z.displayName = G;
    var [J, Q] = D(G), ee = (0, b.createSlot)("SelectContent.RemoveScroll"), et = o.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            position: l = "item-aligned",
            onCloseAutoFocus: a,
            onEscapeKeyDown: n,
            onPointerDownOutside: i,
            side: s,
            sideOffset: u,
            align: m,
            alignOffset: p,
            arrowPadding: g,
            collisionBoundary: x,
            collisionPadding: w,
            sticky: y,
            hideWhenDetached: b,
            avoidCollisions: S,
            ...C
        } = e, E = F(G, r), [R, N] = o.useState(null), [L, T] = o.useState(null), k = (0, c.useComposedRefs)(t, e => N(e)), [I, H] = o.useState(null), [D, O] = o.useState(null), B = A(r), [_, X] = o.useState(!1), K = o.useRef(!1);
        o.useEffect(() => {
            if (R) return (0, M.hideOthers)(R)
        }, [R]), (0, h.useFocusGuards)();
        let z = o.useCallback(e => {
                let [t, ...r] = B().map(e => e.ref.current), [l] = r.slice(-1), a = document.activeElement;
                for (let r of e)
                    if (r === a || (r?.scrollIntoView({
                            block: "nearest"
                        }), r === t && L && (L.scrollTop = 0), r === l && L && (L.scrollTop = L.scrollHeight), r?.focus(), document.activeElement !== a)) return
            }, [B, L]),
            V = o.useCallback(() => z([I, R]), [z, I, R]);
        o.useEffect(() => {
            _ && V()
        }, [_, V]);
        let {
            onOpenChange: $,
            triggerPointerDownPosRef: U
        } = E;
        o.useEffect(() => {
            if (R) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (U.current?.x ?? 0)),
                            y: Math.abs(Math.round(t.pageY) - (U.current?.y ?? 0))
                        }
                    },
                    r = r => {
                        e.x <= 10 && e.y <= 10 ? r.preventDefault() : R.contains(r.target) || $(!1), document.removeEventListener("pointermove", t), U.current = null
                    };
                return null !== U.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                        capture: !0
                    })
                }
            }
        }, [R, $, U]), o.useEffect(() => {
            let e = () => $(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [$]);
        let [W, Y] = eR(e => {
            let t = B().filter(e => !e.disabled),
                r = t.find(e => e.ref.current === document.activeElement),
                l = eP(t, e, r);
            l && setTimeout(() => l.ref.current.focus())
        }), q = o.useCallback((e, t, r) => {
            let l = !K.current && !r;
            (void 0 !== E.value && E.value === t || l) && (H(e), l && (K.current = !0))
        }, [E.value]), Z = o.useCallback(() => R?.focus(), [R]), Q = o.useCallback((e, t, r) => {
            let l = !K.current && !r;
            (void 0 !== E.value && E.value === t || l) && O(e)
        }, [E.value]), et = "popper" === l ? el : er, ea = et === el ? {
            side: s,
            sideOffset: u,
            align: m,
            alignOffset: p,
            arrowPadding: g,
            collisionBoundary: x,
            collisionPadding: w,
            sticky: y,
            hideWhenDetached: b,
            avoidCollisions: S
        } : {};
        return (0, P.jsx)(J, {
            scope: r,
            content: R,
            viewport: L,
            onViewportChange: T,
            itemRefCallback: q,
            selectedItem: I,
            onItemLeave: Z,
            itemTextRefCallback: Q,
            focusSelectedItem: V,
            selectedItemText: D,
            position: l,
            isPositioned: _,
            searchRef: W,
            children: (0, P.jsx)(j.RemoveScroll, {
                as: ee,
                allowPinchZoom: !0,
                children: (0, P.jsx)(v.FocusScope, {
                    asChild: !0,
                    trapped: E.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: (0, d.composeEventHandlers)(a, e => {
                        E.trigger?.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, P.jsx)(f.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !0,
                        onEscapeKeyDown: n,
                        onPointerDownOutside: i,
                        onFocusOutside: e => e.preventDefault(),
                        onDismiss: () => E.onOpenChange(!1),
                        children: (0, P.jsx)(et, {
                            role: "listbox",
                            id: E.contentId,
                            "data-state": E.open ? "open" : "closed",
                            dir: E.dir,
                            onContextMenu: e => e.preventDefault(),
                            ...C,
                            ...ea,
                            onPlaced: () => X(!0),
                            ref: k,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...C.style
                            },
                            onKeyDown: (0, d.composeEventHandlers)(C.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || Y(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = B().filter(e => !e.disabled).map(e => e.ref.current);
                                    if (["ArrowUp", "End"].includes(e.key) && (t = t.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                        let r = e.target,
                                            l = t.indexOf(r);
                                        t = t.slice(l + 1)
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
    et.displayName = "SelectContentImpl";
    var er = o.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onPlaced: l,
            ...a
        } = e, n = F(G, r), i = Q(G, r), [d, u] = o.useState(null), [m, p] = o.useState(null), f = (0, c.useComposedRefs)(t, e => p(e)), h = A(r), v = o.useRef(!1), g = o.useRef(!0), {
            viewport: x,
            selectedItem: w,
            selectedItemText: b,
            focusSelectedItem: S
        } = i, C = o.useCallback(() => {
            if (n.trigger && n.valueNode && d && m && x && w && b) {
                let e = n.trigger.getBoundingClientRect(),
                    t = m.getBoundingClientRect(),
                    r = n.valueNode.getBoundingClientRect(),
                    a = b.getBoundingClientRect();
                if ("rtl" !== n.dir) {
                    let l = a.left - t.left,
                        n = r.left - l,
                        o = e.left - n,
                        i = e.width + o,
                        u = Math.max(i, t.width),
                        c = window.innerWidth - 10,
                        m = (0, s.clamp)(n, [10, Math.max(10, c - u)]);
                    d.style.minWidth = i + "px", d.style.left = m + "px"
                } else {
                    let l = t.right - a.right,
                        n = window.innerWidth - r.right - l,
                        o = window.innerWidth - e.right - n,
                        i = e.width + o,
                        u = Math.max(i, t.width),
                        c = window.innerWidth - 10,
                        m = (0, s.clamp)(n, [10, Math.max(10, c - u)]);
                    d.style.minWidth = i + "px", d.style.right = m + "px"
                }
                let o = h(),
                    i = window.innerHeight - 20,
                    u = x.scrollHeight,
                    c = window.getComputedStyle(m),
                    p = parseInt(c.borderTopWidth, 10),
                    f = parseInt(c.paddingTop, 10),
                    g = parseInt(c.borderBottomWidth, 10),
                    y = p + f + u + parseInt(c.paddingBottom, 10) + g,
                    S = Math.min(5 * w.offsetHeight, y),
                    C = window.getComputedStyle(x),
                    E = parseInt(C.paddingTop, 10),
                    R = parseInt(C.paddingBottom, 10),
                    P = e.top + e.height / 2 - 10,
                    N = w.offsetHeight / 2,
                    M = p + f + (w.offsetTop + N);
                if (M <= P) {
                    let e = o.length > 0 && w === o[o.length - 1].ref.current;
                    d.style.bottom = "0px";
                    let t = Math.max(i - P, N + (e ? R : 0) + (m.clientHeight - x.offsetTop - x.offsetHeight) + g);
                    d.style.height = M + t + "px"
                } else {
                    let e = o.length > 0 && w === o[0].ref.current;
                    d.style.top = "0px";
                    let t = Math.max(P, p + x.offsetTop + (e ? E : 0) + N);
                    d.style.height = t + (y - M) + "px", x.scrollTop = M - P + x.offsetTop
                }
                d.style.margin = "10px 0", d.style.minHeight = S + "px", d.style.maxHeight = i + "px", l?.(), requestAnimationFrame(() => v.current = !0)
            }
        }, [h, n.trigger, n.valueNode, d, m, x, w, b, n.dir, l]);
        (0, E.useLayoutEffect)(() => C(), [C]);
        let [R, N] = o.useState();
        (0, E.useLayoutEffect)(() => {
            m && N(window.getComputedStyle(m).zIndex)
        }, [m]);
        let M = o.useCallback(e => {
            e && !0 === g.current && (C(), S?.(), g.current = !1)
        }, [C, S]);
        return (0, P.jsx)(ea, {
            scope: r,
            contentWrapper: d,
            shouldExpandOnScrollRef: v,
            onScrollButtonChange: M,
            children: (0, P.jsx)("div", {
                ref: u,
                style: {
                    display: "flex",
                    flexDirection: "column",
                    position: "fixed",
                    zIndex: R
                },
                children: (0, P.jsx)(y.Primitive.div, {
                    ...a,
                    ref: f,
                    style: {
                        boxSizing: "border-box",
                        maxHeight: "100%",
                        ...a.style
                    }
                })
            })
        })
    });
    er.displayName = "SelectItemAlignedPosition";
    var el = o.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            align: l = "start",
            collisionPadding: a = 10,
            ...n
        } = e, o = B(r);
        return (0, P.jsx)(x.Content, {
            ...o,
            ...n,
            ref: t,
            align: l,
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
    var [ea, en] = D(G, {}), eo = "SelectViewport", ei = o.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            nonce: l,
            ...a
        } = e, n = Q(eo, r), i = en(eo, r), s = (0, c.useComposedRefs)(t, n.onViewportChange), u = o.useRef(0);
        return (0, P.jsxs)(P.Fragment, {
            children: [(0, P.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: l
            }), (0, P.jsx)(I.Slot, {
                scope: r,
                children: (0, P.jsx)(y.Primitive.div, {
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
                                contentWrapper: r,
                                shouldExpandOnScrollRef: l
                            } = i;
                        if (l?.current && r) {
                            let e = Math.abs(u.current - t.scrollTop);
                            if (e > 0) {
                                let l = window.innerHeight - 20,
                                    a = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                if (a < l) {
                                    let n = a + e,
                                        o = Math.min(l, n),
                                        i = n - o;
                                    r.style.height = o + "px", "0px" === r.style.bottom && (t.scrollTop = i > 0 ? i : 0, r.style.justifyContent = "flex-end")
                                }
                            }
                        }
                        u.current = t.scrollTop
                    })
                })
            })]
        })
    });
    ei.displayName = eo;
    var es = "SelectGroup",
        [ed, eu] = D(es);
    o.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...l
        } = e, a = (0, g.useId)();
        return (0, P.jsx)(ed, {
            scope: r,
            id: a,
            children: (0, P.jsx)(y.Primitive.div, {
                role: "group",
                "aria-labelledby": a,
                ...l,
                ref: t
            })
        })
    }).displayName = es;
    var ec = "SelectLabel";
    o.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...l
        } = e, a = eu(ec, r);
        return (0, P.jsx)(y.Primitive.div, {
            id: a.id,
            ...l,
            ref: t
        })
    }).displayName = ec;
    var em = "SelectItem",
        [ep, ef] = D(em),
        eh = o.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                value: l,
                disabled: a = !1,
                textValue: n,
                ...i
            } = e, s = F(em, r), u = Q(em, r), m = s.value === l, [p, f] = o.useState(n ?? ""), [h, v] = o.useState(!1), x = (0, c.useComposedRefs)(t, e => u.itemRefCallback?.(e, l, a)), w = (0, g.useId)(), b = o.useRef("touch"), S = () => {
                a || (s.onValueChange(l), s.onOpenChange(!1))
            };
            if ("" === l) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, P.jsx)(ep, {
                scope: r,
                value: l,
                disabled: a,
                textId: w,
                isSelected: m,
                onItemTextChange: o.useCallback(e => {
                    f(t => t || (e?.textContent ?? "").trim())
                }, []),
                children: (0, P.jsx)(I.ItemSlot, {
                    scope: r,
                    value: l,
                    disabled: a,
                    textValue: p,
                    children: (0, P.jsx)(y.Primitive.div, {
                        role: "option",
                        "aria-labelledby": w,
                        "data-highlighted": h ? "" : void 0,
                        "aria-selected": m && h,
                        "data-state": m ? "checked" : "unchecked",
                        "aria-disabled": a || void 0,
                        "data-disabled": a ? "" : void 0,
                        tabIndex: a ? void 0 : -1,
                        ...i,
                        ref: x,
                        onFocus: (0, d.composeEventHandlers)(i.onFocus, () => v(!0)),
                        onBlur: (0, d.composeEventHandlers)(i.onBlur, () => v(!1)),
                        onClick: (0, d.composeEventHandlers)(i.onClick, () => {
                            "mouse" !== b.current && S()
                        }),
                        onPointerUp: (0, d.composeEventHandlers)(i.onPointerUp, () => {
                            "mouse" === b.current && S()
                        }),
                        onPointerDown: (0, d.composeEventHandlers)(i.onPointerDown, e => {
                            b.current = e.pointerType
                        }),
                        onPointerMove: (0, d.composeEventHandlers)(i.onPointerMove, e => {
                            b.current = e.pointerType, a ? u.onItemLeave?.() : "mouse" === b.current && e.currentTarget.focus({
                                preventScroll: !0
                            })
                        }),
                        onPointerLeave: (0, d.composeEventHandlers)(i.onPointerLeave, e => {
                            e.currentTarget === document.activeElement && u.onItemLeave?.()
                        }),
                        onKeyDown: (0, d.composeEventHandlers)(i.onKeyDown, e => {
                            (u.searchRef?.current === "" || " " !== e.key) && (T.includes(e.key) && S(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    eh.displayName = em;
    var ev = "SelectItemText",
        eg = o.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: l,
                style: a,
                ...n
            } = e, s = F(ev, r), d = Q(ev, r), u = ef(ev, r), m = K(ev, r), [p, f] = o.useState(null), h = (0, c.useComposedRefs)(t, e => f(e), u.onItemTextChange, e => d.itemTextRefCallback?.(e, u.value, u.disabled)), v = p?.textContent, g = o.useMemo(() => (0, P.jsx)("option", {
                value: u.value,
                disabled: u.disabled,
                children: v
            }, u.value), [u.disabled, u.value, v]), {
                onNativeOptionAdd: x,
                onNativeOptionRemove: w
            } = m;
            return (0, E.useLayoutEffect)(() => (x(g), () => w(g)), [x, w, g]), (0, P.jsxs)(P.Fragment, {
                children: [(0, P.jsx)(y.Primitive.span, {
                    id: u.textId,
                    ...n,
                    ref: h
                }), u.isSelected && s.valueNode && !s.valueNodeHasChildren ? i.createPortal(n.children, s.valueNode) : null]
            })
        });
    eg.displayName = ev;
    var ex = "SelectItemIndicator";
    o.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...l
        } = e;
        return ef(ex, r).isSelected ? (0, P.jsx)(y.Primitive.span, {
            "aria-hidden": !0,
            ...l,
            ref: t
        }) : null
    }).displayName = ex;
    var ew = "SelectScrollUpButton";
    o.forwardRef((e, t) => {
        let r = Q(ew, e.__scopeSelect),
            l = en(ew, e.__scopeSelect),
            [a, n] = o.useState(!1),
            i = (0, c.useComposedRefs)(t, l.onScrollButtonChange);
        return (0, E.useLayoutEffect)(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        n(t.scrollTop > 0)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), a ? (0, P.jsx)(eb, {
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
    }).displayName = ew;
    var ey = "SelectScrollDownButton";
    o.forwardRef((e, t) => {
        let r = Q(ey, e.__scopeSelect),
            l = en(ey, e.__scopeSelect),
            [a, n] = o.useState(!1),
            i = (0, c.useComposedRefs)(t, l.onScrollButtonChange);
        return (0, E.useLayoutEffect)(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        n(Math.ceil(t.scrollTop) < e)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), a ? (0, P.jsx)(eb, {
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
    }).displayName = ey;
    var eb = o.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onAutoScroll: l,
            ...a
        } = e, n = Q("SelectScrollButton", r), i = o.useRef(null), s = A(r), u = o.useCallback(() => {
            null !== i.current && (window.clearInterval(i.current), i.current = null)
        }, []);
        return o.useEffect(() => () => u(), [u]), (0, E.useLayoutEffect)(() => {
            let e = s().find(e => e.ref.current === document.activeElement);
            e?.ref.current?.scrollIntoView({
                block: "nearest"
            })
        }, [s]), (0, P.jsx)(y.Primitive.div, {
            "aria-hidden": !0,
            ...a,
            ref: t,
            style: {
                flexShrink: 0,
                ...a.style
            },
            onPointerDown: (0, d.composeEventHandlers)(a.onPointerDown, () => {
                null === i.current && (i.current = window.setInterval(l, 50))
            }),
            onPointerMove: (0, d.composeEventHandlers)(a.onPointerMove, () => {
                n.onItemLeave?.(), null === i.current && (i.current = window.setInterval(l, 50))
            }),
            onPointerLeave: (0, d.composeEventHandlers)(a.onPointerLeave, () => {
                u()
            })
        })
    });
    o.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...l
        } = e;
        return (0, P.jsx)(y.Primitive.div, {
            "aria-hidden": !0,
            ...l,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var eS = "SelectArrow";

    function eC(e) {
        return "" === e || void 0 === e
    }
    o.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...l
        } = e, a = B(r), n = F(eS, r), o = Q(eS, r);
        return n.open && "popper" === o.position ? (0, P.jsx)(x.Arrow, {
            ...a,
            ...l,
            ref: t
        }) : null
    }).displayName = eS;
    var eE = o.forwardRef((e, t) => {
        let {
            value: r,
            ...l
        } = e, a = o.useRef(null), n = (0, c.useComposedRefs)(t, a), i = (0, R.usePrevious)(r);
        return o.useEffect(() => {
            let e = a.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
            if (i !== r && t) {
                let l = new Event("change", {
                    bubbles: !0
                });
                t.call(e, r), e.dispatchEvent(l)
            }
        }, [i, r]), (0, P.jsx)(N, {
            asChild: !0,
            children: (0, P.jsx)("select", {
                ...l,
                ref: n,
                defaultValue: r
            })
        })
    });

    function eR(e) {
        let t = (0, S.useCallbackRef)(e),
            r = o.useRef(""),
            l = o.useRef(0),
            a = o.useCallback(e => {
                let a = r.current + e;
                t(a),
                    function e(t) {
                        r.current = t, window.clearTimeout(l.current), "" !== t && (l.current = window.setTimeout(() => e(""), 1e3))
                    }(a)
            }, [t]),
            n = o.useCallback(() => {
                r.current = "", window.clearTimeout(l.current)
            }, []);
        return o.useEffect(() => () => window.clearTimeout(l.current), []), [r, a, n]
    }

    function eP(e, t, r) {
        var l, a;
        let n = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            o = r ? e.indexOf(r) : -1,
            i = (l = e, a = Math.max(o, 0), l.map((e, t) => l[(a + t) % l.length]));
        1 === n.length && (i = i.filter(e => e !== r));
        let s = i.find(e => e.textValue.toLowerCase().startsWith(n.toLowerCase()));
        return s !== r ? s : void 0
    }
    eE.displayName = "BubbleSelect";
    let eN = (0, o.createContext)(null),
        eM = {
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
        eL = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        eT = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        ek = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        eI = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        eA = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        eH = (0, o.forwardRef)((e, i) => {
            let {
                label: s,
                labelTooltip: d,
                ariaLabelledBy: u,
                ariaLabel: c,
                className: m,
                size: p,
                variant: f = "Standard",
                value: h,
                placeholder: v,
                isDisabled: g,
                hasError: x,
                hint: w,
                onValueChange: y,
                onOpenChange: b,
                children: S
            } = e, C = (0, r.default)(), E = (0, o.useMemo)(() => ({
                size: p
            }), [p]), R = s ? o.default.createElement("span", {
                id: C,
                className: (0, n.default)(eL[p], "content-emphasis")
            }, s) : null;
            return o.default.createElement(eN.Provider, {
                value: E
            }, o.default.createElement("div", {
                className: (0, n.default)("flex flex-col", g && ["opacity-[0.5]", "pointer-events-none"], ek[p], m)
            }, R && (d ? o.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, R, o.default.createElement(l.LabelTooltip, d)) : R), o.default.createElement(z, {
                value: h,
                disabled: g,
                onValueChange: y,
                onOpenChange: b
            }, o.default.createElement($, {
                className: (0, n.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", a.INPUT_BACKGROUND_BY_VARIANT[f], a.INPUT_STROKE_BY_VARIANT[f], eI[p], eA[p], ej[p], eT[p], x ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === h ? "content-muted" : "content-default"),
                ref: i,
                "aria-labelledby": s ? C : u,
                "aria-label": c
            }, o.default.createElement(t.StateLayer, null), o.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, o.default.createElement(W, {
                placeholder: v
            })), o.default.createElement(Y, {
                className: (0, n.default)(eM[p], "icon icon-regular-chevron-large-down content-default")
            })), o.default.createElement(q, null, o.default.createElement(Z, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, S))), w && o.default.createElement("span", {
                className: (0, n.default)("text-caption-small", {
                    "content-system-alert": x,
                    "content-default": !x
                })
            }, w)))
        });
    eH.displayName = "Dropdown", e.s(["Dropdown", 0, eH, "DropdownContext", 0, eN], 713633);
    var eD = e.i(919403),
        eO = e.i(206983);
    let eB = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        e_ = {
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
        eX = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        eK = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        ez = {
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
        e$ = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        eU = (0, o.createContext)(null),
        eW = () => {
            let e = (0, o.useContext)(eU);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        let {
            children: t,
            className: r,
            size: l
        } = e, a = (0, o.useContext)(eN), i = a ? "dropdown" : "standalone", s = l ?? a?.size ?? "Medium", d = (0, o.useMemo)(() => ({
            size: s,
            mode: i
        }), [s, i]), u = (0, n.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", eB[s], r), c = "standalone" === i ? o.default.createElement(eO.Root, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, o.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: u
        }, t)) : o.default.createElement("div", {
            className: u
        }, t);
        return o.default.createElement(eU.Provider, {
            value: d
        }, "dropdown" === i ? o.default.createElement(ei, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, c) : c)
    }, "MenuItem", 0, e => {
        let r, {
                value: l,
                leading: a,
                title: i,
                description: s,
                trailing: d,
                disabled: u,
                className: c,
                onSelect: m,
                asChild: p,
                children: f,
                ...h
            } = e,
            {
                size: v,
                mode: g
            } = eW(),
            x = (0, n.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", eV[v], eF[v], eX[v], eK[v], e$[v], u && "opacity-[0.5]", u && "pointer-events-none", c),
            w = o.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, i);
        switch (g) {
            case "dropdown":
                w = o.default.createElement(eg, {
                    asChild: !0
                }, w);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", g)
        }
        let y = o.default.createElement(o.default.Fragment, null, !u && o.default.createElement(t.StateLayer, null), a, o.default.createElement("div", {
            className: (0, n.default)("grow-1 text-truncate-split flex flex-col", ez[v])
        }, w, s && o.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, s)), d);
        if (p) {
            let {
                as: e,
                ...l
            } = h, a = o.default.Children.only(f), n = void 0 === i && a.props.children;
            r = o.default.createElement(eD.Slot, {
                ...l,
                role: "standalone" === g ? "menuitem" : void 0,
                "aria-disabled": u || void 0,
                className: x,
                style: {
                    outlineOffset: 0
                },
                onClick: u ? void 0 : m
            }, n ? o.default.cloneElement(a, {}, o.default.createElement(o.default.Fragment, null, !u && o.default.createElement(t.StateLayer, null), a.props.children)) : o.default.cloneElement(a, {}, y))
        } else if ("a" === h.as) {
            let {
                as: e,
                href: t,
                ...l
            } = h;
            r = o.default.createElement("a", {
                ...l,
                role: "standalone" === g ? "menuitem" : void 0,
                "aria-disabled": u,
                href: u ? void 0 : t,
                className: x,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: u ? void 0 : m
            }, y)
        } else {
            let {
                as: e,
                ...t
            } = h;
            r = o.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === g ? "menuitem" : void 0,
                "aria-disabled": u,
                className: x,
                style: {
                    outlineOffset: 0
                },
                onClick: u ? void 0 : m
            }, y)
        }
        return "dropdown" === g ? o.default.createElement(eh, {
            value: l,
            disabled: u,
            asChild: !0
        }, r) : o.default.createElement(eO.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: l
        }, r)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: r,
            leading: l,
            trailing: a,
            disabled: i,
            className: s
        } = e, {
            size: d
        } = eW(), u = (0, n.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", eV[d], eF[d], eX[d], eK[d], i && "opacity-[0.5]", s);
        return o.default.createElement("div", {
            role: "none",
            className: u
        }, l, o.default.createElement("div", {
            className: (0, n.default)("grow-1 text-truncate-split flex flex-col", ez[d])
        }, o.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), r && o.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, r)), a)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: r
        } = e, {
            size: l
        } = eW();
        return o.default.createElement("div", {
            role: "group",
            className: (0, n.default)(e_[l], r)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return o.default.createElement("div", {
            role: "separator",
            className: (0, n.default)("foundation-web-menu-separator", t)
        })
    }], 726799)
}]);

//# debugId=adc41a3a-2cc1-480e-add5-1d237af353c7
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/10_u3lvrpeuko.js.map
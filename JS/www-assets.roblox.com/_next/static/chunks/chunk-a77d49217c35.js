;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "3b0f65b8-7978-d146-c734-d428a4613a6e")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 730318, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(420482);

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
            className: (0, t.default)("block", n),
            style: {
                marginTop: -1
            }
        }, r.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }
    var o = e.i(178896);

    function i(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function a() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return e => {
            let r = !1,
                n = t.map(t => {
                    let n = i(t, e);
                    return r || "function" != typeof n || (r = !0), n
                });
            if (r) return () => {
                for (let e = 0; e < n.length; e++) {
                    let r = n[e];
                    "function" == typeof r ? r() : i(t[e], null)
                }
            }
        }
    }

    function l() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return r.useCallback(a(...t), t)
    }
    var s = e.i(19836);

    function u(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            n = [],
            o = () => {
                let t = n.map(e => r.createContext(e));
                return function(n) {
                    let o = n?.[e] || t;
                    return r.useMemo(() => ({
                        [`__scope${e}`]: {
                            ...n,
                            [e]: o
                        }
                    }), [n, o])
                }
            };
        return o.scopeName = e, [function(t, o) {
            let i = r.createContext(o),
                a = n.length;
            n = [...n, o];
            let l = t => {
                let {
                    scope: n,
                    children: o,
                    ...l
                } = t, u = n?.[e]?.[a] || i, d = r.useMemo(() => l, Object.values(l));
                return (0, s.jsx)(u.Provider, {
                    value: d,
                    children: o
                })
            };
            return l.displayName = t + "Provider", [l, function(n, l) {
                let s = l?.[e]?.[a] || i,
                    u = r.useContext(s);
                if (u) return u;
                if (void 0 !== o) return o;
                throw Error(`\`${n}\` must be used within \`${t}\``)
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            let o = t[0];
            if (1 === t.length) return o;
            let i = () => {
                let e = t.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(t) {
                    let n = e.reduce((e, r) => {
                        let {
                            useScope: n,
                            scopeName: o
                        } = r, i = n(t)[`__scope${o}`];
                        return {
                            ...e,
                            ...i
                        }
                    }, {});
                    return r.useMemo(() => ({
                        [`__scope${o.scopeName}`]: n
                    }), [n])
                }
            };
            return i.scopeName = o.scopeName, i
        }(o, ...t)]
    }
    var d = e.i(783660),
        c = globalThis?.document ? r.useLayoutEffect : () => {},
        p = r["useId".toString()] || (() => void 0),
        f = 0,
        m = e.i(630204),
        h = e.i(422957),
        g = e.i(301775),
        v = r.forwardRef((e, t) => {
            let {
                children: n,
                ...o
            } = e, i = r.Children.toArray(n), a = i.find(w);
            if (a) {
                let e = a.props.children,
                    n = i.map(t => t !== a ? t : r.Children.count(e) > 1 ? r.Children.only(null) : r.isValidElement(e) ? e.props.children : null);
                return (0, s.jsx)(y, {
                    ...o,
                    ref: t,
                    children: r.isValidElement(e) ? r.cloneElement(e, void 0, n) : null
                })
            }
            return (0, s.jsx)(y, {
                ...o,
                ref: t,
                children: n
            })
        });
    v.displayName = "Slot";
    var y = r.forwardRef((e, t) => {
        let {
            children: n,
            ...o
        } = e;
        if (r.isValidElement(n)) {
            var i;
            let e, l, s = (i = n, (l = (e = Object.getOwnPropertyDescriptor(i.props, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? i.ref : (l = (e = Object.getOwnPropertyDescriptor(i, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? i.props.ref : i.props.ref || i.ref);
            return r.cloneElement(n, {
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
                }(o, n.props),
                ref: t ? a(t, s) : s
            })
        }
        return r.Children.count(n) > 1 ? r.Children.only(null) : null
    });
    y.displayName = "SlotClone";
    var x = e => {
        let {
            children: t
        } = e;
        return (0, s.jsx)(s.Fragment, {
            children: t
        })
    };

    function w(e) {
        return r.isValidElement(e) && e.type === x
    }
    var b = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
            let n = r.forwardRef((e, r) => {
                let {
                    asChild: n,
                    ...o
                } = e, i = n ? v : t;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, s.jsx)(i, {
                    ...o,
                    ref: r
                })
            });
            return n.displayName = `Primitive.${t}`, {
                ...e,
                [t]: n
            }
        }, {}),
        E = r.forwardRef((e, t) => {
            let {
                children: r,
                width: n = 10,
                height: o = 5,
                ...i
            } = e;
            return (0, s.jsx)(b.svg, {
                ...i,
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

    function C(e) {
        let t = r.useRef(e);
        return r.useEffect(() => {
            t.current = e
        }), r.useMemo(() => function() {
            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
            return t.current?.(...r)
        }, [])
    }
    E.displayName = "Arrow";
    var S = "Popper",
        [T, N] = u(S),
        [R, A] = T(S),
        j = e => {
            let {
                __scopePopper: t,
                children: n
            } = e, [o, i] = r.useState(null);
            return (0, s.jsx)(R, {
                scope: t,
                anchor: o,
                onAnchorChange: i,
                children: n
            })
        };
    j.displayName = S;
    var O = "PopperAnchor",
        P = r.forwardRef((e, t) => {
            let {
                __scopePopper: n,
                virtualRef: o,
                ...i
            } = e, a = A(O, n), u = r.useRef(null), d = l(t, u);
            return r.useEffect(() => {
                a.onAnchorChange(o?.current || u.current)
            }), o ? null : (0, s.jsx)(b.div, {
                ...i,
                ref: d
            })
        });
    P.displayName = O;
    var L = "PopperContent",
        [M, k] = T(L),
        I = r.forwardRef((e, t) => {
            let {
                __scopePopper: n,
                side: o = "bottom",
                sideOffset: i = 0,
                align: a = "center",
                alignOffset: u = 0,
                arrowPadding: d = 0,
                avoidCollisions: p = !0,
                collisionBoundary: f = [],
                collisionPadding: g = 0,
                sticky: v = "partial",
                hideWhenDetached: y = !1,
                updatePositionStrategy: x = "optimized",
                onPlaced: w,
                ...E
            } = e, S = A(L, n), [T, N] = r.useState(null), R = l(t, e => N(e)), [j, O] = r.useState(null), P = function(e) {
                let [t, n] = r.useState(void 0);
                return c(() => {
                    if (e) {
                        n({
                            width: e.offsetWidth,
                            height: e.offsetHeight
                        });
                        let t = new ResizeObserver(t => {
                            let r, o;
                            if (!Array.isArray(t) || !t.length) return;
                            let i = t[0];
                            if ("borderBoxSize" in i) {
                                let e = i.borderBoxSize,
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
            }(j), k = P?.width ?? 0, I = P?.height ?? 0, H = "number" == typeof g ? g : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...g
            }, _ = Array.isArray(f) ? f : [f], $ = _.length > 0, B = {
                padding: H,
                boundary: _.filter(D),
                altBoundary: $
            }, {
                refs: z,
                floatingStyles: F,
                placement: V,
                isPositioned: Y,
                middlewareData: X
            } = (0, m.useFloating)({
                strategy: "fixed",
                placement: o + ("center" !== a ? "-" + a : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, h.autoUpdate)(...t, {
                        animationFrame: "always" === x
                    })
                },
                elements: {
                    reference: S.anchor
                },
                middleware: [(0, m.offset)({
                    mainAxis: i + I,
                    alignmentAxis: u
                }), p && (0, m.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === v ? (0, m.limitShift)() : void 0,
                    ...B
                }), p && (0, m.flip)({
                    ...B
                }), (0, m.size)({
                    ...B,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: n,
                            availableHeight: o
                        } = e, {
                            width: i,
                            height: a
                        } = r.reference, l = t.floating.style;
                        l.setProperty("--radix-popper-available-width", `${n}px`), l.setProperty("--radix-popper-available-height", `${o}px`), l.setProperty("--radix-popper-anchor-width", `${i}px`), l.setProperty("--radix-popper-anchor-height", `${a}px`)
                    }
                }), j && (0, m.arrow)({
                    element: j,
                    padding: d
                }), U({
                    arrowWidth: k,
                    arrowHeight: I
                }), y && (0, m.hide)({
                    strategy: "referenceHidden",
                    ...B
                })]
            }), [K, Z] = W(V), q = C(w);
            c(() => {
                Y && q?.()
            }, [Y, q]);
            let G = X.arrow?.x,
                J = X.arrow?.y,
                Q = X.arrow?.centerOffset !== 0,
                [ee, et] = r.useState();
            return c(() => {
                T && et(window.getComputedStyle(T).zIndex)
            }, [T]), (0, s.jsx)("div", {
                ref: z.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...F,
                    transform: Y ? F.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: ee,
                    "--radix-popper-transform-origin": [X.transformOrigin?.x, X.transformOrigin?.y].join(" "),
                    ...X.hide?.referenceHidden && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, s.jsx)(M, {
                    scope: n,
                    placedSide: K,
                    onArrowChange: O,
                    arrowX: G,
                    arrowY: J,
                    shouldHideArrow: Q,
                    children: (0, s.jsx)(b.div, {
                        "data-side": K,
                        "data-align": Z,
                        ...E,
                        ref: R,
                        style: {
                            ...E.style,
                            animation: Y ? void 0 : "none"
                        }
                    })
                })
            })
        });
    I.displayName = L;
    var H = "PopperArrow",
        _ = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        $ = r.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, o = k(H, r), i = _[o.placedSide];
            return (0, s.jsx)("span", {
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
                children: (0, s.jsx)(E, {
                    ...n,
                    ref: t,
                    style: {
                        ...n.style,
                        display: "block"
                    }
                })
            })
        });

    function D(e) {
        return null !== e
    }
    $.displayName = H;
    var U = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            let {
                placement: r,
                rects: n,
                middlewareData: o
            } = t, i = o.arrow?.centerOffset !== 0, a = i ? 0 : e.arrowWidth, l = i ? 0 : e.arrowHeight, [s, u] = W(r), d = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [u], c = (o.arrow?.x ?? 0) + a / 2, p = (o.arrow?.y ?? 0) + l / 2, f = "", m = "";
            return "bottom" === s ? (f = i ? d : `${c}px`, m = `${-l}px`) : "top" === s ? (f = i ? d : `${c}px`, m = `${n.floating.height+l}px`) : "right" === s ? (f = `${-l}px`, m = i ? d : `${p}px`) : "left" === s && (f = `${n.floating.width+l}px`, m = i ? d : `${p}px`), {
                data: {
                    x: f,
                    y: m
                }
            }
        }
    });

    function W(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    var B = r.forwardRef((e, t) => {
        let {
            container: n,
            ...o
        } = e, [i, a] = r.useState(!1);
        c(() => a(!0), []);
        let l = n || i && globalThis?.document?.body;
        return l ? g.default.createPortal((0, s.jsx)(b.div, {
            ...o,
            ref: t
        }), l) : null
    });
    B.displayName = "Portal";
    var z = e => {
        var t;
        let n, o, {
                present: i,
                children: a
            } = e,
            s = function(e) {
                var t, n;
                let [o, i] = r.useState(), a = r.useRef({}), l = r.useRef(e), s = r.useRef("none"), [u, d] = (t = e ? "mounted" : "unmounted", n = {
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
                }, r.useReducer((e, t) => n[e][t] ?? e, t));
                return r.useEffect(() => {
                    let e = F(a.current);
                    s.current = "mounted" === u ? e : "none"
                }, [u]), c(() => {
                    let t = a.current,
                        r = l.current;
                    if (r !== e) {
                        let n = s.current,
                            o = F(t);
                        e ? d("MOUNT") : "none" === o || t?.display === "none" ? d("UNMOUNT") : r && n !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), l.current = e
                    }
                }, [e, d]), c(() => {
                    if (o) {
                        let e, t = o.ownerDocument.defaultView ?? window,
                            r = r => {
                                let n = F(a.current).includes(r.animationName);
                                if (r.target === o && n && (d("ANIMATION_END"), !l.current)) {
                                    let r = o.style.animationFillMode;
                                    o.style.animationFillMode = "forwards", e = t.setTimeout(() => {
                                        "forwards" === o.style.animationFillMode && (o.style.animationFillMode = r)
                                    })
                                }
                            },
                            n = e => {
                                e.target === o && (s.current = F(a.current))
                            };
                        return o.addEventListener("animationstart", n), o.addEventListener("animationcancel", r), o.addEventListener("animationend", r), () => {
                            t.clearTimeout(e), o.removeEventListener("animationstart", n), o.removeEventListener("animationcancel", r), o.removeEventListener("animationend", r)
                        }
                    }
                    d("ANIMATION_END")
                }, [o, d]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(u),
                    ref: r.useCallback(e => {
                        e && (a.current = getComputedStyle(e)), i(e)
                    }, [])
                }
            }(i),
            u = "function" == typeof a ? a({
                present: s.isPresent
            }) : r.Children.only(a),
            d = l(s.ref, (t = u, (o = (n = Object.getOwnPropertyDescriptor(t.props, "ref")?.get) && "isReactWarning" in n && n.isReactWarning) ? t.ref : (o = (n = Object.getOwnPropertyDescriptor(t, "ref")?.get) && "isReactWarning" in n && n.isReactWarning) ? t.props.ref : t.props.ref || t.ref));
        return "function" == typeof a || s.isPresent ? r.cloneElement(u, {
            ref: d
        }) : null
    };

    function F(e) {
        return e?.animationName || "none"
    }
    z.displayName = "Presence";
    var V = r.forwardRef((e, t) => (0, s.jsx)(b.span, {
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
    V.displayName = "VisuallyHidden";
    var [Y, X] = u("Tooltip", [N]), K = N(), Z = "TooltipProvider", q = "tooltip.open", [G, J] = Y(Z), Q = e => {
        let {
            __scopeTooltip: t,
            delayDuration: n = 700,
            skipDelayDuration: o = 300,
            disableHoverableContent: i = !1,
            children: a
        } = e, [l, u] = r.useState(!0), d = r.useRef(!1), c = r.useRef(0);
        return r.useEffect(() => {
            let e = c.current;
            return () => window.clearTimeout(e)
        }, []), (0, s.jsx)(G, {
            scope: t,
            isOpenDelayed: l,
            delayDuration: n,
            onOpen: r.useCallback(() => {
                window.clearTimeout(c.current), u(!1)
            }, []),
            onClose: r.useCallback(() => {
                window.clearTimeout(c.current), c.current = window.setTimeout(() => u(!0), o)
            }, [o]),
            isPointerInTransitRef: d,
            onPointerInTransitChange: r.useCallback(e => {
                d.current = e
            }, []),
            disableHoverableContent: i,
            children: a
        })
    };
    Q.displayName = Z;
    var ee = "Tooltip",
        [et, er] = Y(ee),
        en = e => {
            let {
                __scopeTooltip: t,
                children: n,
                open: o,
                defaultOpen: i = !1,
                onOpenChange: a,
                disableHoverableContent: l,
                delayDuration: u
            } = e, d = J(ee, e.__scopeTooltip), m = K(t), [h, g] = r.useState(null), v = function() {
                let [e, t] = r.useState(p());
                return c(() => {
                    t(e => e ?? String(f++))
                }, [void 0]), e ? `radix-${e}` : ""
            }(), y = r.useRef(0), x = l ?? d.disableHoverableContent, w = u ?? d.delayDuration, b = r.useRef(!1), [E = !1, S] = function(e) {
                let {
                    prop: t,
                    defaultProp: n,
                    onChange: o = () => {}
                } = e, [i, a] = function(e) {
                    let {
                        defaultProp: t,
                        onChange: n
                    } = e, o = r.useState(t), [i] = o, a = r.useRef(i), l = C(n);
                    return r.useEffect(() => {
                        a.current !== i && (l(i), a.current = i)
                    }, [i, a, l]), o
                }({
                    defaultProp: n,
                    onChange: o
                }), l = void 0 !== t, s = l ? t : i, u = C(o);
                return [s, r.useCallback(e => {
                    if (l) {
                        let r = "function" == typeof e ? e(t) : e;
                        r !== t && u(r)
                    } else a(e)
                }, [l, t, a, u])]
            }({
                prop: o,
                defaultProp: i,
                onChange: e => {
                    e ? (d.onOpen(), document.dispatchEvent(new CustomEvent(q))) : d.onClose(), a?.(e)
                }
            }), T = r.useMemo(() => E ? b.current ? "delayed-open" : "instant-open" : "closed", [E]), N = r.useCallback(() => {
                window.clearTimeout(y.current), y.current = 0, b.current = !1, S(!0)
            }, [S]), R = r.useCallback(() => {
                window.clearTimeout(y.current), y.current = 0, S(!1)
            }, [S]), A = r.useCallback(() => {
                window.clearTimeout(y.current), y.current = window.setTimeout(() => {
                    b.current = !0, S(!0), y.current = 0
                }, w)
            }, [w, S]);
            return r.useEffect(() => () => {
                y.current && (window.clearTimeout(y.current), y.current = 0)
            }, []), (0, s.jsx)(j, {
                ...m,
                children: (0, s.jsx)(et, {
                    scope: t,
                    contentId: v,
                    open: E,
                    stateAttribute: T,
                    trigger: h,
                    onTriggerChange: g,
                    onTriggerEnter: r.useCallback(() => {
                        d.isOpenDelayed ? A() : N()
                    }, [d.isOpenDelayed, A, N]),
                    onTriggerLeave: r.useCallback(() => {
                        x ? R() : (window.clearTimeout(y.current), y.current = 0)
                    }, [R, x]),
                    onOpen: N,
                    onClose: R,
                    disableHoverableContent: x,
                    children: n
                })
            })
        };
    en.displayName = ee;
    var eo = "TooltipTrigger",
        ei = r.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                ...i
            } = e, a = er(eo, n), u = J(eo, n), d = K(n), c = l(t, r.useRef(null), a.onTriggerChange), p = r.useRef(!1), f = r.useRef(!1), m = r.useCallback(() => p.current = !1, []);
            return r.useEffect(() => () => document.removeEventListener("pointerup", m), [m]), (0, s.jsx)(P, {
                asChild: !0,
                ...d,
                children: (0, s.jsx)(b.button, {
                    "aria-describedby": a.open ? a.contentId : void 0,
                    "data-state": a.stateAttribute,
                    ...i,
                    ref: c,
                    onPointerMove: (0, o.composeEventHandlers)(e.onPointerMove, e => {
                        "touch" !== e.pointerType && (f.current || u.isPointerInTransitRef.current || (a.onTriggerEnter(), f.current = !0))
                    }),
                    onPointerLeave: (0, o.composeEventHandlers)(e.onPointerLeave, () => {
                        a.onTriggerLeave(), f.current = !1
                    }),
                    onPointerDown: (0, o.composeEventHandlers)(e.onPointerDown, () => {
                        p.current = !0, document.addEventListener("pointerup", m, {
                            once: !0
                        })
                    }),
                    onFocus: (0, o.composeEventHandlers)(e.onFocus, () => {
                        p.current || a.onOpen()
                    }),
                    onBlur: (0, o.composeEventHandlers)(e.onBlur, a.onClose),
                    onClick: (0, o.composeEventHandlers)(e.onClick, a.onClose)
                })
            })
        });
    ei.displayName = eo;
    var ea = "TooltipPortal",
        [el, es] = Y(ea, {
            forceMount: void 0
        }),
        eu = e => {
            let {
                __scopeTooltip: t,
                forceMount: r,
                children: n,
                container: o
            } = e, i = er(ea, t);
            return (0, s.jsx)(el, {
                scope: t,
                forceMount: r,
                children: (0, s.jsx)(z, {
                    present: r || i.open,
                    children: (0, s.jsx)(B, {
                        asChild: !0,
                        container: o,
                        children: n
                    })
                })
            })
        };
    eu.displayName = ea;
    var ed = "TooltipContent",
        ec = r.forwardRef((e, t) => {
            let r = es(ed, e.__scopeTooltip),
                {
                    forceMount: n = r.forceMount,
                    side: o = "top",
                    ...i
                } = e,
                a = er(ed, e.__scopeTooltip);
            return (0, s.jsx)(z, {
                present: n || a.open,
                children: a.disableHoverableContent ? (0, s.jsx)(eh, {
                    side: o,
                    ...i,
                    ref: t
                }) : (0, s.jsx)(ep, {
                    side: o,
                    ...i,
                    ref: t
                })
            })
        }),
        ep = r.forwardRef((e, t) => {
            let n = er(ed, e.__scopeTooltip),
                o = J(ed, e.__scopeTooltip),
                i = r.useRef(null),
                a = l(t, i),
                [u, d] = r.useState(null),
                {
                    trigger: c,
                    onClose: p
                } = n,
                f = i.current,
                {
                    onPointerInTransitChange: m
                } = o,
                h = r.useCallback(() => {
                    d(null), m(!1)
                }, [m]),
                g = r.useCallback((e, t) => {
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
                    d(((r = [... function(e, t) {
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
                    }(r))), m(!0)
                }, [m]);
            return r.useEffect(() => () => h(), [h]), r.useEffect(() => {
                if (c && f) {
                    let e = e => g(e, f),
                        t = e => g(e, c);
                    return c.addEventListener("pointerleave", e), f.addEventListener("pointerleave", t), () => {
                        c.removeEventListener("pointerleave", e), f.removeEventListener("pointerleave", t)
                    }
                }
            }, [c, f, g, h]), r.useEffect(() => {
                if (u) {
                    let e = e => {
                        let t = e.target,
                            r = {
                                x: e.clientX,
                                y: e.clientY
                            },
                            n = c?.contains(t) || f?.contains(t),
                            o = ! function(e, t) {
                                let {
                                    x: r,
                                    y: n
                                } = e, o = !1;
                                for (let e = 0, i = t.length - 1; e < t.length; i = e++) {
                                    let a = t[e].x,
                                        l = t[e].y,
                                        s = t[i].x,
                                        u = t[i].y;
                                    l > n != u > n && r < (s - a) * (n - l) / (u - l) + a && (o = !o)
                                }
                                return o
                            }(r, u);
                        n ? h() : o && (h(), p())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [c, f, u, p, h]), (0, s.jsx)(eh, {
                ...e,
                ref: a
            })
        }),
        [ef, em] = Y(ee, {
            isInside: !1
        }),
        eh = r.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                children: o,
                "aria-label": i,
                onEscapeKeyDown: a,
                onPointerDownOutside: l,
                ...u
            } = e, c = er(ed, n), p = K(n), {
                onClose: f
            } = c;
            return r.useEffect(() => (document.addEventListener(q, f), () => document.removeEventListener(q, f)), [f]), r.useEffect(() => {
                if (c.trigger) {
                    let e = e => {
                        let t = e.target;
                        t?.contains(c.trigger) && f()
                    };
                    return window.addEventListener("scroll", e, {
                        capture: !0
                    }), () => window.removeEventListener("scroll", e, {
                        capture: !0
                    })
                }
            }, [c.trigger, f]), (0, s.jsx)(d.DismissableLayer, {
                asChild: !0,
                disableOutsidePointerEvents: !1,
                onEscapeKeyDown: a,
                onPointerDownOutside: l,
                onFocusOutside: e => e.preventDefault(),
                onDismiss: f,
                children: (0, s.jsxs)(I, {
                    "data-state": c.stateAttribute,
                    ...p,
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
                    children: [(0, s.jsx)(x, {
                        children: o
                    }), (0, s.jsx)(ef, {
                        scope: n,
                        isInside: !0,
                        children: (0, s.jsx)(V, {
                            id: c.contentId,
                            role: "tooltip",
                            children: i || o
                        })
                    })]
                })
            })
        });
    ec.displayName = ed;
    var eg = "TooltipArrow",
        ev = r.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                ...n
            } = e, o = K(r);
            return em(eg, r).isInside ? null : (0, s.jsx)($, {
                ...o,
                ...n,
                ref: t
            })
        });
    ev.displayName = eg, e.s(["Tooltip", 0, function(e) {
        let {
            position: o,
            hasBeak: i = !0,
            title: a,
            description: l,
            ariaLabel: s,
            delayDurationMs: u = 500,
            children: d,
            open: c,
            onOpenChange: p,
            contentClassName: f
        } = e, [m, h] = o.split("-"), g = s ?? ("string" == typeof a && null == l ? a : void 0);
        return r.createElement(Q, {
            delayDuration: u
        }, r.createElement(en, {
            open: c,
            onOpenChange: p
        }, d, r.createElement(eu, null, r.createElement(ec, {
            side: m,
            align: h,
            "aria-label": g,
            className: (0, t.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", f),
            sideOffset: 5
        }, i && r.createElement(ev, {
            asChild: !0
        }, r.createElement(n, {
            className: "content-[var(--inverse-surface-0)]"
        })), r.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, r.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, a), l && r.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, l))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: n,
            className: o
        } = e;
        return r.createElement(ei, {
            asChild: n,
            className: o
        }, t)
    }], 730318)
}, 736536, 119300, e => {
    "use strict";
    let t = {
        MountSearchLanding: "MountSearchLanding",
        ShowSearchLanding: "ShowSearchLanding",
        UpdateSearchSessionInfo: "UpdateSearchSessionInfo",
        SetSearchLandingHasContent: "SetSearchLandingHasContent"
    };
    e.s(["ModalEvent", 0, t], 119300), e.s(["default", 0, {
        ModalEvent: t,
        mountSearchLanding: function() {
            return new Promise(() => {
                let e = new CustomEvent(t.MountSearchLanding, {
                    detail: {}
                });
                window.dispatchEvent(e)
            })
        },
        showSearchLanding: function(e) {
            return new Promise(() => {
                let r = new CustomEvent(t.ShowSearchLanding, {
                    detail: {
                        sessionInfo: e
                    }
                });
                window.dispatchEvent(r)
            })
        },
        updateSessionInfo: function(e) {
            return new Promise(() => {
                let r = new CustomEvent(t.UpdateSearchSessionInfo, {
                    detail: {
                        sessionInfo: e
                    }
                });
                window.dispatchEvent(r)
            })
        },
        setSearchLandingHasContent: function() {
            return new Promise(() => {
                let e = new CustomEvent(t.SetSearchLandingHasContent, {});
                window.dispatchEvent(e)
            })
        }
    }], 736536)
}]);

//# debugId=3b0f65b8-7978-d146-c734-d428a4613a6e
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/11912j6090vl2.js.map
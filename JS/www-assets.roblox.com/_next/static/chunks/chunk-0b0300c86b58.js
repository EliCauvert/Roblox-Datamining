;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "479f9025-5eb8-3471-55a2-7f237c7fc20a")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 361185, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(745911),
        n = e.i(682877),
        o = e.i(61907);
    e.s(["useFullKeyTranslations", 0, () => {
        let e = (0, r.useTranslations)();
        return (0, t.useMemo)(() => ({
            translateFullKey: (0, n.adaptFullKeyTranslator)(e)
        }), [e])
    }, "useTranslations", 0, e => {
        let i = (0, r.useTranslations)((0, o.fromPeriodToColonDelimited)(e));
        return (0, t.useMemo)(() => (0, n.adaptTranslator)(i, e), [i, e])
    }])
}, 997004, 706888, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(178896);

    function n(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function o() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return e => {
            let r = !1,
                o = t.map(t => {
                    let o = n(t, e);
                    return r || "function" != typeof o || (r = !0), o
                });
            if (r) return () => {
                for (let e = 0; e < o.length; e++) {
                    let r = o[e];
                    "function" == typeof r ? r() : n(t[e], null)
                }
            }
        }
    }

    function i() {
        for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
        return t.useCallback(o(...r), r)
    }
    var a = e.i(19836);

    function l(e) {
        let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            n = [],
            o = () => {
                let r = n.map(e => t.createContext(e));
                return function(n) {
                    let o = n?.[e] || r;
                    return t.useMemo(() => ({
                        [`__scope${e}`]: {
                            ...n,
                            [e]: o
                        }
                    }), [n, o])
                }
            };
        return o.scopeName = e, [function(r, o) {
            let i = t.createContext(o),
                l = n.length;
            n = [...n, o];
            let s = r => {
                let {
                    scope: n,
                    children: o,
                    ...s
                } = r, u = n?.[e]?.[l] || i, c = t.useMemo(() => s, Object.values(s));
                return (0, a.jsx)(u.Provider, {
                    value: c,
                    children: o
                })
            };
            return s.displayName = r + "Provider", [s, function(n, a) {
                let s = a?.[e]?.[l] || i,
                    u = t.useContext(s);
                if (u) return u;
                if (void 0 !== o) return o;
                throw Error(`\`${n}\` must be used within \`${r}\``)
            }]
        }, function() {
            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
            let o = r[0];
            if (1 === r.length) return o;
            let i = () => {
                let e = r.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(r) {
                    let n = e.reduce((e, t) => {
                        let {
                            useScope: n,
                            scopeName: o
                        } = t, i = n(r)[`__scope${o}`];
                        return {
                            ...e,
                            ...i
                        }
                    }, {});
                    return t.useMemo(() => ({
                        [`__scope${o.scopeName}`]: n
                    }), [n])
                }
            };
            return i.scopeName = o.scopeName, i
        }(o, ...r)]
    }
    var s = e.i(430781),
        u = globalThis?.document ? t.useLayoutEffect : () => {},
        c = t["useId".toString()] || (() => void 0),
        d = 0,
        f = e.i(422957),
        p = e.i(301775),
        m = "u" > typeof document ? t.useLayoutEffect : function() {};

    function h(e, t) {
        let r, n, o;
        if (e === t) return !0;
        if (typeof e != typeof t) return !1;
        if ("function" == typeof e && e.toString() === t.toString()) return !0;
        if (e && t && "object" == typeof e) {
            if (Array.isArray(e)) {
                if ((r = e.length) !== t.length) return !1;
                for (n = r; 0 != n--;)
                    if (!h(e[n], t[n])) return !1;
                return !0
            }
            if ((r = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (n = r; 0 != n--;)
                if (!({}).hasOwnProperty.call(t, o[n])) return !1;
            for (n = r; 0 != n--;) {
                let r = o[n];
                if (("_owner" !== r || !e.$$typeof) && !h(e[r], t[r])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function g(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function y(e, t) {
        let r = g(e);
        return Math.round(t * r) / r
    }

    function v(e) {
        let r = t.useRef(e);
        return m(() => {
            r.current = e
        }), r
    }

    function x(e) {
        void 0 === e && (e = {});
        let {
            placement: r = "bottom",
            strategy: n = "absolute",
            middleware: o = [],
            platform: i,
            elements: {
                reference: a,
                floating: l
            } = {},
            transform: s = !0,
            whileElementsMounted: u,
            open: c
        } = e, [d, x] = t.useState({
            x: 0,
            y: 0,
            strategy: n,
            placement: r,
            middlewareData: {},
            isPositioned: !1
        }), [w, b] = t.useState(o);
        h(w, o) || b(o);
        let [T, C] = t.useState(null), [E, R] = t.useState(null), N = t.useCallback(e => {
            e !== O.current && (O.current = e, C(e))
        }, []), P = t.useCallback(e => {
            e !== S.current && (S.current = e, R(e))
        }, []), A = a || T, j = l || E, O = t.useRef(null), S = t.useRef(null), M = t.useRef(d), k = null != u, L = v(u), _ = v(i), $ = v(c), D = t.useCallback(() => {
            if (!O.current || !S.current) return;
            let e = {
                placement: r,
                strategy: n,
                middleware: w
            };
            _.current && (e.platform = _.current), (0, f.computePosition)(O.current, S.current, e).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== $.current
                };
                I.current && !h(M.current, t) && (M.current = t, p.flushSync(() => {
                    x(t)
                }))
            })
        }, [w, r, n, _, $]);
        m(() => {
            !1 === c && M.current.isPositioned && (M.current.isPositioned = !1, x(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [c]);
        let I = t.useRef(!1);
        m(() => (I.current = !0, () => {
            I.current = !1
        }), []), m(() => {
            if (A && (O.current = A), j && (S.current = j), A && j) {
                if (L.current) return L.current(A, j, D);
                D()
            }
        }, [A, j, D, L, k]);
        let H = t.useMemo(() => ({
                reference: O,
                floating: S,
                setReference: N,
                setFloating: P
            }), [N, P]),
            F = t.useMemo(() => ({
                reference: A,
                floating: j
            }), [A, j]),
            U = t.useMemo(() => {
                let e = {
                    position: n,
                    left: 0,
                    top: 0
                };
                if (!F.floating) return e;
                let t = y(F.floating, d.x),
                    r = y(F.floating, d.y);
                return s ? {
                    ...e,
                    transform: "translate(" + t + "px, " + r + "px)",
                    ...g(F.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: n,
                    left: t,
                    top: r
                }
            }, [n, s, F.floating, d.x, d.y]);
        return t.useMemo(() => ({
            ...d,
            update: D,
            refs: H,
            elements: F,
            floatingStyles: U
        }), [d, D, H, F, U])
    }
    let w = (e, t) => ({
            ...(0, f.offset)(e),
            options: [e, t]
        }),
        b = (e, t) => ({
            ...(0, f.shift)(e),
            options: [e, t]
        }),
        T = (e, t) => ({
            ...(0, f.limitShift)(e),
            options: [e, t]
        }),
        C = (e, t) => ({
            ...(0, f.flip)(e),
            options: [e, t]
        }),
        E = (e, t) => ({
            ...(0, f.size)(e),
            options: [e, t]
        }),
        R = (e, t) => ({
            ...(0, f.hide)(e),
            options: [e, t]
        }),
        N = (e, t) => ({
            name: "arrow",
            options: e,
            fn(t) {
                let {
                    element: r,
                    padding: n
                } = "function" == typeof e ? e(t) : e;
                return r && ({}).hasOwnProperty.call(r, "current") ? null != r.current ? (0, f.arrow)({
                    element: r.current,
                    padding: n
                }).fn(t) : {} : r ? (0, f.arrow)({
                    element: r,
                    padding: n
                }).fn(t) : {}
            },
            options: [e, t]
        });
    e.s(["arrow", 0, N, "flip", 0, C, "hide", 0, R, "limitShift", 0, T, "offset", 0, w, "shift", 0, b, "size", 0, E, "useFloating", 0, x], 706888);
    var P = t.forwardRef((e, r) => {
        let {
            children: n,
            ...o
        } = e, i = t.Children.toArray(n), l = i.find(O);
        if (l) {
            let e = l.props.children,
                n = i.map(r => r !== l ? r : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
            return (0, a.jsx)(A, {
                ...o,
                ref: r,
                children: t.isValidElement(e) ? t.cloneElement(e, void 0, n) : null
            })
        }
        return (0, a.jsx)(A, {
            ...o,
            ref: r,
            children: n
        })
    });
    P.displayName = "Slot";
    var A = t.forwardRef((e, r) => {
        let {
            children: n,
            ...i
        } = e;
        if (t.isValidElement(n)) {
            var a;
            let e, l, s = (a = n, (l = (e = Object.getOwnPropertyDescriptor(a.props, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? a.ref : (l = (e = Object.getOwnPropertyDescriptor(a, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? a.props.ref : a.props.ref || a.ref);
            return t.cloneElement(n, {
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
                }(i, n.props),
                ref: r ? o(r, s) : s
            })
        }
        return t.Children.count(n) > 1 ? t.Children.only(null) : null
    });
    A.displayName = "SlotClone";
    var j = e => {
        let {
            children: t
        } = e;
        return (0, a.jsx)(a.Fragment, {
            children: t
        })
    };

    function O(e) {
        return t.isValidElement(e) && e.type === j
    }
    var S = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, r) => {
            let n = t.forwardRef((e, t) => {
                let {
                    asChild: n,
                    ...o
                } = e, i = n ? P : r;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, a.jsx)(i, {
                    ...o,
                    ref: t
                })
            });
            return n.displayName = `Primitive.${r}`, {
                ...e,
                [r]: n
            }
        }, {}),
        M = t.forwardRef((e, t) => {
            let {
                children: r,
                width: n = 10,
                height: o = 5,
                ...i
            } = e;
            return (0, a.jsx)(S.svg, {
                ...i,
                ref: t,
                width: n,
                height: o,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? r : (0, a.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });

    function k(e) {
        let r = t.useRef(e);
        return t.useEffect(() => {
            r.current = e
        }), t.useMemo(() => function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            return r.current?.(...t)
        }, [])
    }
    M.displayName = "Arrow";
    var L = "Popper",
        [_, $] = l(L),
        [D, I] = _(L),
        H = e => {
            let {
                __scopePopper: r,
                children: n
            } = e, [o, i] = t.useState(null);
            return (0, a.jsx)(D, {
                scope: r,
                anchor: o,
                onAnchorChange: i,
                children: n
            })
        };
    H.displayName = L;
    var F = "PopperAnchor",
        U = t.forwardRef((e, r) => {
            let {
                __scopePopper: n,
                virtualRef: o,
                ...l
            } = e, s = I(F, n), u = t.useRef(null), c = i(r, u);
            return t.useEffect(() => {
                s.onAnchorChange(o?.current || u.current)
            }), o ? null : (0, a.jsx)(S.div, {
                ...l,
                ref: c
            })
        });
    U.displayName = F;
    var W = "PopperContent",
        [B, z] = _(W),
        V = t.forwardRef((e, r) => {
            let {
                __scopePopper: n,
                side: o = "bottom",
                sideOffset: l = 0,
                align: s = "center",
                alignOffset: c = 0,
                arrowPadding: d = 0,
                avoidCollisions: p = !0,
                collisionBoundary: m = [],
                collisionPadding: h = 0,
                sticky: g = "partial",
                hideWhenDetached: y = !1,
                updatePositionStrategy: v = "optimized",
                onPlaced: P,
                ...A
            } = e, j = I(W, n), [O, M] = t.useState(null), L = i(r, e => M(e)), [_, $] = t.useState(null), D = function(e) {
                let [r, n] = t.useState(void 0);
                return u(() => {
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
                }, [e]), r
            }(_), H = D?.width ?? 0, F = D?.height ?? 0, U = "number" == typeof h ? h : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...h
            }, z = Array.isArray(m) ? m : [m], V = z.length > 0, Y = {
                padding: U,
                boundary: z.filter(Z),
                altBoundary: V
            }, {
                refs: K,
                floatingStyles: X,
                placement: J,
                isPositioned: Q,
                middlewareData: ee
            } = x({
                strategy: "fixed",
                placement: o + ("center" !== s ? "-" + s : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, f.autoUpdate)(...t, {
                        animationFrame: "always" === v
                    })
                },
                elements: {
                    reference: j.anchor
                },
                middleware: [w({
                    mainAxis: l + F,
                    alignmentAxis: c
                }), p && b({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === g ? T() : void 0,
                    ...Y
                }), p && C({
                    ...Y
                }), E({
                    ...Y,
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
                }), _ && N({
                    element: _,
                    padding: d
                }), q({
                    arrowWidth: H,
                    arrowHeight: F
                }), y && R({
                    strategy: "referenceHidden",
                    ...Y
                })]
            }), [et, er] = G(J), en = k(P);
            u(() => {
                Q && en?.()
            }, [Q, en]);
            let eo = ee.arrow?.x,
                ei = ee.arrow?.y,
                ea = ee.arrow?.centerOffset !== 0,
                [el, es] = t.useState();
            return u(() => {
                O && es(window.getComputedStyle(O).zIndex)
            }, [O]), (0, a.jsx)("div", {
                ref: K.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...X,
                    transform: Q ? X.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: el,
                    "--radix-popper-transform-origin": [ee.transformOrigin?.x, ee.transformOrigin?.y].join(" "),
                    ...ee.hide?.referenceHidden && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, a.jsx)(B, {
                    scope: n,
                    placedSide: et,
                    onArrowChange: $,
                    arrowX: eo,
                    arrowY: ei,
                    shouldHideArrow: ea,
                    children: (0, a.jsx)(S.div, {
                        "data-side": et,
                        "data-align": er,
                        ...A,
                        ref: L,
                        style: {
                            ...A.style,
                            animation: Q ? void 0 : "none"
                        }
                    })
                })
            })
        });
    V.displayName = W;
    var Y = "PopperArrow",
        K = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        X = t.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, o = z(Y, r), i = K[o.placedSide];
            return (0, a.jsx)("span", {
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
                children: (0, a.jsx)(M, {
                    ...n,
                    ref: t,
                    style: {
                        ...n.style,
                        display: "block"
                    }
                })
            })
        });

    function Z(e) {
        return null !== e
    }
    X.displayName = Y;
    var q = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            let {
                placement: r,
                rects: n,
                middlewareData: o
            } = t, i = o.arrow?.centerOffset !== 0, a = i ? 0 : e.arrowWidth, l = i ? 0 : e.arrowHeight, [s, u] = G(r), c = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [u], d = (o.arrow?.x ?? 0) + a / 2, f = (o.arrow?.y ?? 0) + l / 2, p = "", m = "";
            return "bottom" === s ? (p = i ? c : `${d}px`, m = `${-l}px`) : "top" === s ? (p = i ? c : `${d}px`, m = `${n.floating.height+l}px`) : "right" === s ? (p = `${-l}px`, m = i ? c : `${f}px`) : "left" === s && (p = `${n.floating.width+l}px`, m = i ? c : `${f}px`), {
                data: {
                    x: p,
                    y: m
                }
            }
        }
    });

    function G(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    var J = t.forwardRef((e, r) => {
        let {
            container: n,
            ...o
        } = e, [i, l] = t.useState(!1);
        u(() => l(!0), []);
        let s = n || i && globalThis?.document?.body;
        return s ? p.default.createPortal((0, a.jsx)(S.div, {
            ...o,
            ref: r
        }), s) : null
    });
    J.displayName = "Portal";
    var Q = e => {
        var r;
        let n, o, {
                present: a,
                children: l
            } = e,
            s = function(e) {
                var r, n;
                let [o, i] = t.useState(), a = t.useRef({}), l = t.useRef(e), s = t.useRef("none"), [c, d] = (r = e ? "mounted" : "unmounted", n = {
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
                }, t.useReducer((e, t) => n[e][t] ?? e, r));
                return t.useEffect(() => {
                    let e = ee(a.current);
                    s.current = "mounted" === c ? e : "none"
                }, [c]), u(() => {
                    let t = a.current,
                        r = l.current;
                    if (r !== e) {
                        let n = s.current,
                            o = ee(t);
                        e ? d("MOUNT") : "none" === o || t?.display === "none" ? d("UNMOUNT") : r && n !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), l.current = e
                    }
                }, [e, d]), u(() => {
                    if (o) {
                        let e, t = o.ownerDocument.defaultView ?? window,
                            r = r => {
                                let n = ee(a.current).includes(r.animationName);
                                if (r.target === o && n && (d("ANIMATION_END"), !l.current)) {
                                    let r = o.style.animationFillMode;
                                    o.style.animationFillMode = "forwards", e = t.setTimeout(() => {
                                        "forwards" === o.style.animationFillMode && (o.style.animationFillMode = r)
                                    })
                                }
                            },
                            n = e => {
                                e.target === o && (s.current = ee(a.current))
                            };
                        return o.addEventListener("animationstart", n), o.addEventListener("animationcancel", r), o.addEventListener("animationend", r), () => {
                            t.clearTimeout(e), o.removeEventListener("animationstart", n), o.removeEventListener("animationcancel", r), o.removeEventListener("animationend", r)
                        }
                    }
                    d("ANIMATION_END")
                }, [o, d]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(c),
                    ref: t.useCallback(e => {
                        e && (a.current = getComputedStyle(e)), i(e)
                    }, [])
                }
            }(a),
            c = "function" == typeof l ? l({
                present: s.isPresent
            }) : t.Children.only(l),
            d = i(s.ref, (r = c, (o = (n = Object.getOwnPropertyDescriptor(r.props, "ref")?.get) && "isReactWarning" in n && n.isReactWarning) ? r.ref : (o = (n = Object.getOwnPropertyDescriptor(r, "ref")?.get) && "isReactWarning" in n && n.isReactWarning) ? r.props.ref : r.props.ref || r.ref));
        return "function" == typeof l || s.isPresent ? t.cloneElement(c, {
            ref: d
        }) : null
    };

    function ee(e) {
        return e?.animationName || "none"
    }
    Q.displayName = "Presence";
    var et = t.forwardRef((e, t) => (0, a.jsx)(S.span, {
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
    et.displayName = "VisuallyHidden";
    var [er, en] = l("Tooltip", [$]), eo = $(), ei = "TooltipProvider", ea = "tooltip.open", [el, es] = er(ei), eu = e => {
        let {
            __scopeTooltip: r,
            delayDuration: n = 700,
            skipDelayDuration: o = 300,
            disableHoverableContent: i = !1,
            children: l
        } = e, [s, u] = t.useState(!0), c = t.useRef(!1), d = t.useRef(0);
        return t.useEffect(() => {
            let e = d.current;
            return () => window.clearTimeout(e)
        }, []), (0, a.jsx)(el, {
            scope: r,
            isOpenDelayed: s,
            delayDuration: n,
            onOpen: t.useCallback(() => {
                window.clearTimeout(d.current), u(!1)
            }, []),
            onClose: t.useCallback(() => {
                window.clearTimeout(d.current), d.current = window.setTimeout(() => u(!0), o)
            }, [o]),
            isPointerInTransitRef: c,
            onPointerInTransitChange: t.useCallback(e => {
                c.current = e
            }, []),
            disableHoverableContent: i,
            children: l
        })
    };
    eu.displayName = ei;
    var ec = "Tooltip",
        [ed, ef] = er(ec),
        ep = e => {
            let {
                __scopeTooltip: r,
                children: n,
                open: o,
                defaultOpen: i = !1,
                onOpenChange: l,
                disableHoverableContent: s,
                delayDuration: f
            } = e, p = es(ec, e.__scopeTooltip), m = eo(r), [h, g] = t.useState(null), y = function() {
                let [e, r] = t.useState(c());
                return u(() => {
                    r(e => e ?? String(d++))
                }, [void 0]), e ? `radix-${e}` : ""
            }(), v = t.useRef(0), x = s ?? p.disableHoverableContent, w = f ?? p.delayDuration, b = t.useRef(!1), [T = !1, C] = function(e) {
                let {
                    prop: r,
                    defaultProp: n,
                    onChange: o = () => {}
                } = e, [i, a] = function(e) {
                    let {
                        defaultProp: r,
                        onChange: n
                    } = e, o = t.useState(r), [i] = o, a = t.useRef(i), l = k(n);
                    return t.useEffect(() => {
                        a.current !== i && (l(i), a.current = i)
                    }, [i, a, l]), o
                }({
                    defaultProp: n,
                    onChange: o
                }), l = void 0 !== r, s = l ? r : i, u = k(o);
                return [s, t.useCallback(e => {
                    if (l) {
                        let t = "function" == typeof e ? e(r) : e;
                        t !== r && u(t)
                    } else a(e)
                }, [l, r, a, u])]
            }({
                prop: o,
                defaultProp: i,
                onChange: e => {
                    e ? (p.onOpen(), document.dispatchEvent(new CustomEvent(ea))) : p.onClose(), l?.(e)
                }
            }), E = t.useMemo(() => T ? b.current ? "delayed-open" : "instant-open" : "closed", [T]), R = t.useCallback(() => {
                window.clearTimeout(v.current), v.current = 0, b.current = !1, C(!0)
            }, [C]), N = t.useCallback(() => {
                window.clearTimeout(v.current), v.current = 0, C(!1)
            }, [C]), P = t.useCallback(() => {
                window.clearTimeout(v.current), v.current = window.setTimeout(() => {
                    b.current = !0, C(!0), v.current = 0
                }, w)
            }, [w, C]);
            return t.useEffect(() => () => {
                v.current && (window.clearTimeout(v.current), v.current = 0)
            }, []), (0, a.jsx)(H, {
                ...m,
                children: (0, a.jsx)(ed, {
                    scope: r,
                    contentId: y,
                    open: T,
                    stateAttribute: E,
                    trigger: h,
                    onTriggerChange: g,
                    onTriggerEnter: t.useCallback(() => {
                        p.isOpenDelayed ? P() : R()
                    }, [p.isOpenDelayed, P, R]),
                    onTriggerLeave: t.useCallback(() => {
                        x ? N() : (window.clearTimeout(v.current), v.current = 0)
                    }, [N, x]),
                    onOpen: R,
                    onClose: N,
                    disableHoverableContent: x,
                    children: n
                })
            })
        };
    ep.displayName = ec;
    var em = "TooltipTrigger",
        eh = t.forwardRef((e, n) => {
            let {
                __scopeTooltip: o,
                ...l
            } = e, s = ef(em, o), u = es(em, o), c = eo(o), d = i(n, t.useRef(null), s.onTriggerChange), f = t.useRef(!1), p = t.useRef(!1), m = t.useCallback(() => f.current = !1, []);
            return t.useEffect(() => () => document.removeEventListener("pointerup", m), [m]), (0, a.jsx)(U, {
                asChild: !0,
                ...c,
                children: (0, a.jsx)(S.button, {
                    "aria-describedby": s.open ? s.contentId : void 0,
                    "data-state": s.stateAttribute,
                    ...l,
                    ref: d,
                    onPointerMove: (0, r.composeEventHandlers)(e.onPointerMove, e => {
                        "touch" !== e.pointerType && (p.current || u.isPointerInTransitRef.current || (s.onTriggerEnter(), p.current = !0))
                    }),
                    onPointerLeave: (0, r.composeEventHandlers)(e.onPointerLeave, () => {
                        s.onTriggerLeave(), p.current = !1
                    }),
                    onPointerDown: (0, r.composeEventHandlers)(e.onPointerDown, () => {
                        f.current = !0, document.addEventListener("pointerup", m, {
                            once: !0
                        })
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, () => {
                        f.current || s.onOpen()
                    }),
                    onBlur: (0, r.composeEventHandlers)(e.onBlur, s.onClose),
                    onClick: (0, r.composeEventHandlers)(e.onClick, s.onClose)
                })
            })
        });
    eh.displayName = em;
    var eg = "TooltipPortal",
        [ey, ev] = er(eg, {
            forceMount: void 0
        }),
        ex = e => {
            let {
                __scopeTooltip: t,
                forceMount: r,
                children: n,
                container: o
            } = e, i = ef(eg, t);
            return (0, a.jsx)(ey, {
                scope: t,
                forceMount: r,
                children: (0, a.jsx)(Q, {
                    present: r || i.open,
                    children: (0, a.jsx)(J, {
                        asChild: !0,
                        container: o,
                        children: n
                    })
                })
            })
        };
    ex.displayName = eg;
    var ew = "TooltipContent",
        eb = t.forwardRef((e, t) => {
            let r = ev(ew, e.__scopeTooltip),
                {
                    forceMount: n = r.forceMount,
                    side: o = "top",
                    ...i
                } = e,
                l = ef(ew, e.__scopeTooltip);
            return (0, a.jsx)(Q, {
                present: n || l.open,
                children: l.disableHoverableContent ? (0, a.jsx)(eR, {
                    side: o,
                    ...i,
                    ref: t
                }) : (0, a.jsx)(eT, {
                    side: o,
                    ...i,
                    ref: t
                })
            })
        }),
        eT = t.forwardRef((e, r) => {
            let n = ef(ew, e.__scopeTooltip),
                o = es(ew, e.__scopeTooltip),
                l = t.useRef(null),
                s = i(r, l),
                [u, c] = t.useState(null),
                {
                    trigger: d,
                    onClose: f
                } = n,
                p = l.current,
                {
                    onPointerInTransitChange: m
                } = o,
                h = t.useCallback(() => {
                    c(null), m(!1)
                }, [m]),
                g = t.useCallback((e, t) => {
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
                    }(r))), m(!0)
                }, [m]);
            return t.useEffect(() => () => h(), [h]), t.useEffect(() => {
                if (d && p) {
                    let e = e => g(e, p),
                        t = e => g(e, d);
                    return d.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t), () => {
                        d.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                    }
                }
            }, [d, p, g, h]), t.useEffect(() => {
                if (u) {
                    let e = e => {
                        let t = e.target,
                            r = {
                                x: e.clientX,
                                y: e.clientY
                            },
                            n = d?.contains(t) || p?.contains(t),
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
                        n ? h() : o && (h(), f())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [d, p, u, f, h]), (0, a.jsx)(eR, {
                ...e,
                ref: s
            })
        }),
        [eC, eE] = er(ec, {
            isInside: !1
        }),
        eR = t.forwardRef((e, r) => {
            let {
                __scopeTooltip: n,
                children: o,
                "aria-label": i,
                onEscapeKeyDown: l,
                onPointerDownOutside: u,
                ...c
            } = e, d = ef(ew, n), f = eo(n), {
                onClose: p
            } = d;
            return t.useEffect(() => (document.addEventListener(ea, p), () => document.removeEventListener(ea, p)), [p]), t.useEffect(() => {
                if (d.trigger) {
                    let e = e => {
                        let t = e.target;
                        t?.contains(d.trigger) && p()
                    };
                    return window.addEventListener("scroll", e, {
                        capture: !0
                    }), () => window.removeEventListener("scroll", e, {
                        capture: !0
                    })
                }
            }, [d.trigger, p]), (0, a.jsx)(s.DismissableLayer, {
                asChild: !0,
                disableOutsidePointerEvents: !1,
                onEscapeKeyDown: l,
                onPointerDownOutside: u,
                onFocusOutside: e => e.preventDefault(),
                onDismiss: p,
                children: (0, a.jsxs)(V, {
                    "data-state": d.stateAttribute,
                    ...f,
                    ...c,
                    ref: r,
                    style: {
                        ...c.style,
                        "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                        "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                        "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                        "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                        "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                    },
                    children: [(0, a.jsx)(j, {
                        children: o
                    }), (0, a.jsx)(eC, {
                        scope: n,
                        isInside: !0,
                        children: (0, a.jsx)(et, {
                            id: d.contentId,
                            role: "tooltip",
                            children: i || o
                        })
                    })]
                })
            })
        });
    eb.displayName = ew;
    var eN = "TooltipArrow",
        eP = t.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                ...n
            } = e, o = eo(r);
            return eE(eN, r).isInside ? null : (0, a.jsx)(X, {
                ...o,
                ...n,
                ref: t
            })
        });
    eP.displayName = eN, e.s(["Arrow", 0, eP, "Content", 0, eb, "Portal", 0, ex, "Provider", 0, eu, "Root", 0, ep, "Trigger", 0, eh], 997004)
}]);

//# debugId=479f9025-5eb8-3471-55a2-7f237c7fc20a
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0nbolakkd_aq1.js.map
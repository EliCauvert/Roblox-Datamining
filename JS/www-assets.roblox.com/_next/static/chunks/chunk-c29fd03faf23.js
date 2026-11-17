;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "3ed0fab8-9ec4-0915-2248-4158d6791237")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 630204, e => {
    "use strict";
    var t = e.i(422957),
        r = e.i(420482),
        n = e.i(301775),
        o = "u" > typeof document ? r.useLayoutEffect : function() {};

    function i(e, t) {
        let r, n, o;
        if (e === t) return !0;
        if (typeof e != typeof t) return !1;
        if ("function" == typeof e && e.toString() === t.toString()) return !0;
        if (e && t && "object" == typeof e) {
            if (Array.isArray(e)) {
                if ((r = e.length) !== t.length) return !1;
                for (n = r; 0 != n--;)
                    if (!i(e[n], t[n])) return !1;
                return !0
            }
            if ((r = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (n = r; 0 != n--;)
                if (!({}).hasOwnProperty.call(t, o[n])) return !1;
            for (n = r; 0 != n--;) {
                let r = o[n];
                if (("_owner" !== r || !e.$$typeof) && !i(e[r], t[r])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function a(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function l(e, t) {
        let r = a(e);
        return Math.round(t * r) / r
    }

    function s(e) {
        let t = r.useRef(e);
        return o(() => {
            t.current = e
        }), t
    }
    e.s(["arrow", 0, (e, r) => ({
        name: "arrow",
        options: e,
        fn(r) {
            let {
                element: n,
                padding: o
            } = "function" == typeof e ? e(r) : e;
            return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? (0, t.arrow)({
                element: n.current,
                padding: o
            }).fn(r) : {} : n ? (0, t.arrow)({
                element: n,
                padding: o
            }).fn(r) : {}
        },
        options: [e, r]
    }), "flip", 0, (e, r) => ({
        ...(0, t.flip)(e),
        options: [e, r]
    }), "hide", 0, (e, r) => ({
        ...(0, t.hide)(e),
        options: [e, r]
    }), "limitShift", 0, (e, r) => ({
        ...(0, t.limitShift)(e),
        options: [e, r]
    }), "offset", 0, (e, r) => ({
        ...(0, t.offset)(e),
        options: [e, r]
    }), "shift", 0, (e, r) => ({
        ...(0, t.shift)(e),
        options: [e, r]
    }), "size", 0, (e, r) => ({
        ...(0, t.size)(e),
        options: [e, r]
    }), "useFloating", 0, function(e) {
        void 0 === e && (e = {});
        let {
            placement: u = "bottom",
            strategy: c = "absolute",
            middleware: d = [],
            platform: f,
            elements: {
                reference: p,
                floating: m
            } = {},
            transform: h = !0,
            whileElementsMounted: g,
            open: y
        } = e, [x, v] = r.useState({
            x: 0,
            y: 0,
            strategy: c,
            placement: u,
            middlewareData: {},
            isPositioned: !1
        }), [w, b] = r.useState(d);
        i(w, d) || b(d);
        let [C, E] = r.useState(null), [R, A] = r.useState(null), S = r.useCallback(e => {
            e !== j.current && (j.current = e, E(e))
        }, []), N = r.useCallback(e => {
            e !== O.current && (O.current = e, A(e))
        }, []), P = p || C, T = m || R, j = r.useRef(null), O = r.useRef(null), L = r.useRef(x), M = null != g, k = s(g), $ = s(f), z = s(y), H = r.useCallback(() => {
            if (!j.current || !O.current) return;
            let e = {
                placement: u,
                strategy: c,
                middleware: w
            };
            $.current && (e.platform = $.current), (0, t.computePosition)(j.current, O.current, e).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== z.current
                };
                I.current && !i(L.current, t) && (L.current = t, n.flushSync(() => {
                    v(t)
                }))
            })
        }, [w, u, c, $, z]);
        o(() => {
            !1 === y && L.current.isPositioned && (L.current.isPositioned = !1, v(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [y]);
        let I = r.useRef(!1);
        o(() => (I.current = !0, () => {
            I.current = !1
        }), []), o(() => {
            if (P && (j.current = P), T && (O.current = T), P && T) {
                if (k.current) return k.current(P, T, H);
                H()
            }
        }, [P, T, H, k, M]);
        let _ = r.useMemo(() => ({
                reference: j,
                floating: O,
                setReference: S,
                setFloating: N
            }), [S, N]),
            D = r.useMemo(() => ({
                reference: P,
                floating: T
            }), [P, T]),
            B = r.useMemo(() => {
                let e = {
                    position: c,
                    left: 0,
                    top: 0
                };
                if (!D.floating) return e;
                let t = l(D.floating, x.x),
                    r = l(D.floating, x.y);
                return h ? {
                    ...e,
                    transform: "translate(" + t + "px, " + r + "px)",
                    ...a(D.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: c,
                    left: t,
                    top: r
                }
            }, [c, h, D.floating, x.x, x.y]);
        return r.useMemo(() => ({
            ...x,
            update: H,
            refs: _,
            elements: D,
            floatingStyles: B
        }), [x, H, _, D, B])
    }])
}, 540751, 596863, 508189, 130659, 185450, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(420482);

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
    e.s(["Beak", 0, function(e) {
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
    }], 540751), e.s(["composeRefs", 0, o, "useComposedRefs", 0, function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return r.useCallback(o(...t), t)
    }], 596863);
    var i = e.i(19836);
    e.s(["createContextScope", 0, function(e) {
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
            let a = r.createContext(o),
                l = n.length;
            n = [...n, o];
            let s = t => {
                let {
                    scope: n,
                    children: o,
                    ...s
                } = t, u = n?.[e]?.[l] || a, c = r.useMemo(() => s, Object.values(s));
                return (0, i.jsx)(u.Provider, {
                    value: c,
                    children: o
                })
            };
            return s.displayName = t + "Provider", [s, function(n, i) {
                let s = i?.[e]?.[l] || a,
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
    }], 508189);
    var a = globalThis?.document ? r.useLayoutEffect : () => {};
    e.s(["useLayoutEffect", 0, a], 130659);
    var l = r["useId".toString()] || (() => void 0),
        s = 0;
    e.s(["useId", 0, function(e) {
        let [t, n] = r.useState(l());
        return a(() => {
            e || n(e => e ?? String(s++))
        }, [e]), e || (t ? `radix-${t}` : "")
    }], 185450)
}, 730318, e => {
    "use strict";
    var t = e.i(540751),
        r = e.i(7284),
        n = e.i(420482),
        o = e.i(178896),
        i = e.i(596863),
        a = e.i(508189),
        l = e.i(783660),
        s = e.i(185450),
        u = e.i(630204),
        c = e.i(422957),
        d = e.i(301775),
        f = e.i(19836),
        p = n.forwardRef((e, t) => {
            let {
                children: r,
                ...o
            } = e, i = n.Children.toArray(r), a = i.find(g);
            if (a) {
                let e = a.props.children,
                    r = i.map(t => t !== a ? t : n.Children.count(e) > 1 ? n.Children.only(null) : n.isValidElement(e) ? e.props.children : null);
                return (0, f.jsx)(m, {
                    ...o,
                    ref: t,
                    children: n.isValidElement(e) ? n.cloneElement(e, void 0, r) : null
                })
            }
            return (0, f.jsx)(m, {
                ...o,
                ref: t,
                children: r
            })
        });
    p.displayName = "Slot";
    var m = n.forwardRef((e, t) => {
        let {
            children: r,
            ...o
        } = e;
        if (n.isValidElement(r)) {
            var a;
            let e, l, s = (a = r, (l = (e = Object.getOwnPropertyDescriptor(a.props, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? a.ref : (l = (e = Object.getOwnPropertyDescriptor(a, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? a.props.ref : a.props.ref || a.ref);
            return n.cloneElement(r, {
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
                }(o, r.props),
                ref: t ? (0, i.composeRefs)(t, s) : s
            })
        }
        return n.Children.count(r) > 1 ? n.Children.only(null) : null
    });
    m.displayName = "SlotClone";
    var h = e => {
        let {
            children: t
        } = e;
        return (0, f.jsx)(f.Fragment, {
            children: t
        })
    };

    function g(e) {
        return n.isValidElement(e) && e.type === h
    }
    var y = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
            let r = n.forwardRef((e, r) => {
                let {
                    asChild: n,
                    ...o
                } = e, i = n ? p : t;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, f.jsx)(i, {
                    ...o,
                    ref: r
                })
            });
            return r.displayName = `Primitive.${t}`, {
                ...e,
                [t]: r
            }
        }, {}),
        x = n.forwardRef((e, t) => {
            let {
                children: r,
                width: n = 10,
                height: o = 5,
                ...i
            } = e;
            return (0, f.jsx)(y.svg, {
                ...i,
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

    function v(e) {
        let t = n.useRef(e);
        return n.useEffect(() => {
            t.current = e
        }), n.useMemo(() => function() {
            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
            return t.current?.(...r)
        }, [])
    }
    x.displayName = "Arrow";
    var w = e.i(130659),
        b = "Popper",
        [C, E] = (0, a.createContextScope)(b),
        [R, A] = C(b),
        S = e => {
            let {
                __scopePopper: t,
                children: r
            } = e, [o, i] = n.useState(null);
            return (0, f.jsx)(R, {
                scope: t,
                anchor: o,
                onAnchorChange: i,
                children: r
            })
        };
    S.displayName = b;
    var N = "PopperAnchor",
        P = n.forwardRef((e, t) => {
            let {
                __scopePopper: r,
                virtualRef: o,
                ...a
            } = e, l = A(N, r), s = n.useRef(null), u = (0, i.useComposedRefs)(t, s);
            return n.useEffect(() => {
                l.onAnchorChange(o?.current || s.current)
            }), o ? null : (0, f.jsx)(y.div, {
                ...a,
                ref: u
            })
        });
    P.displayName = N;
    var T = "PopperContent",
        [j, O] = C(T),
        L = n.forwardRef((e, t) => {
            let {
                __scopePopper: r,
                side: o = "bottom",
                sideOffset: a = 0,
                align: l = "center",
                alignOffset: s = 0,
                arrowPadding: d = 0,
                avoidCollisions: p = !0,
                collisionBoundary: m = [],
                collisionPadding: h = 0,
                sticky: g = "partial",
                hideWhenDetached: x = !1,
                updatePositionStrategy: b = "optimized",
                onPlaced: C,
                ...E
            } = e, R = A(T, r), [S, N] = n.useState(null), P = (0, i.useComposedRefs)(t, e => N(e)), [O, L] = n.useState(null), M = function(e) {
                let [t, r] = n.useState(void 0);
                return (0, w.useLayoutEffect)(() => {
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
            }(O), k = M?.width ?? 0, $ = M?.height ?? 0, _ = "number" == typeof h ? h : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...h
            }, D = Array.isArray(m) ? m : [m], B = D.length > 0, W = {
                padding: _,
                boundary: D.filter(z),
                altBoundary: B
            }, {
                refs: F,
                floatingStyles: U,
                placement: Y,
                isPositioned: X,
                middlewareData: V
            } = (0, u.useFloating)({
                strategy: "fixed",
                placement: o + ("center" !== l ? "-" + l : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, c.autoUpdate)(...t, {
                        animationFrame: "always" === b
                    })
                },
                elements: {
                    reference: R.anchor
                },
                middleware: [(0, u.offset)({
                    mainAxis: a + $,
                    alignmentAxis: s
                }), p && (0, u.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === g ? (0, u.limitShift)() : void 0,
                    ...W
                }), p && (0, u.flip)({
                    ...W
                }), (0, u.size)({
                    ...W,
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
                }), O && (0, u.arrow)({
                    element: O,
                    padding: d
                }), H({
                    arrowWidth: k,
                    arrowHeight: $
                }), x && (0, u.hide)({
                    strategy: "referenceHidden",
                    ...W
                })]
            }), [K, Z] = I(Y), q = v(C);
            (0, w.useLayoutEffect)(() => {
                X && q?.()
            }, [X, q]);
            let G = V.arrow?.x,
                J = V.arrow?.y,
                Q = V.arrow?.centerOffset !== 0,
                [ee, et] = n.useState();
            return (0, w.useLayoutEffect)(() => {
                S && et(window.getComputedStyle(S).zIndex)
            }, [S]), (0, f.jsx)("div", {
                ref: F.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...U,
                    transform: X ? U.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: ee,
                    "--radix-popper-transform-origin": [V.transformOrigin?.x, V.transformOrigin?.y].join(" "),
                    ...V.hide?.referenceHidden && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, f.jsx)(j, {
                    scope: r,
                    placedSide: K,
                    onArrowChange: L,
                    arrowX: G,
                    arrowY: J,
                    shouldHideArrow: Q,
                    children: (0, f.jsx)(y.div, {
                        "data-side": K,
                        "data-align": Z,
                        ...E,
                        ref: P,
                        style: {
                            ...E.style,
                            animation: X ? void 0 : "none"
                        }
                    })
                })
            })
        });
    L.displayName = T;
    var M = "PopperArrow",
        k = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        $ = n.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, o = O(M, r), i = k[o.placedSide];
            return (0, f.jsx)("span", {
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
                children: (0, f.jsx)(x, {
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
    $.displayName = M;
    var H = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            let {
                placement: r,
                rects: n,
                middlewareData: o
            } = t, i = o.arrow?.centerOffset !== 0, a = i ? 0 : e.arrowWidth, l = i ? 0 : e.arrowHeight, [s, u] = I(r), c = {
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

    function I(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    var _ = n.forwardRef((e, t) => {
        let {
            container: r,
            ...o
        } = e, [i, a] = n.useState(!1);
        (0, w.useLayoutEffect)(() => a(!0), []);
        let l = r || i && globalThis?.document?.body;
        return l ? d.default.createPortal((0, f.jsx)(y.div, {
            ...o,
            ref: t
        }), l) : null
    });
    _.displayName = "Portal";
    var D = e => {
        var t;
        let r, o, {
                present: a,
                children: l
            } = e,
            s = function(e) {
                var t, r;
                let [o, i] = n.useState(), a = n.useRef({}), l = n.useRef(e), s = n.useRef("none"), [u, c] = (t = e ? "mounted" : "unmounted", r = {
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
                }, n.useReducer((e, t) => r[e][t] ?? e, t));
                return n.useEffect(() => {
                    let e = B(a.current);
                    s.current = "mounted" === u ? e : "none"
                }, [u]), (0, w.useLayoutEffect)(() => {
                    let t = a.current,
                        r = l.current;
                    if (r !== e) {
                        let n = s.current,
                            o = B(t);
                        e ? c("MOUNT") : "none" === o || t?.display === "none" ? c("UNMOUNT") : r && n !== o ? c("ANIMATION_OUT") : c("UNMOUNT"), l.current = e
                    }
                }, [e, c]), (0, w.useLayoutEffect)(() => {
                    if (o) {
                        let e, t = o.ownerDocument.defaultView ?? window,
                            r = r => {
                                let n = B(a.current).includes(r.animationName);
                                if (r.target === o && n && (c("ANIMATION_END"), !l.current)) {
                                    let r = o.style.animationFillMode;
                                    o.style.animationFillMode = "forwards", e = t.setTimeout(() => {
                                        "forwards" === o.style.animationFillMode && (o.style.animationFillMode = r)
                                    })
                                }
                            },
                            n = e => {
                                e.target === o && (s.current = B(a.current))
                            };
                        return o.addEventListener("animationstart", n), o.addEventListener("animationcancel", r), o.addEventListener("animationend", r), () => {
                            t.clearTimeout(e), o.removeEventListener("animationstart", n), o.removeEventListener("animationcancel", r), o.removeEventListener("animationend", r)
                        }
                    }
                    c("ANIMATION_END")
                }, [o, c]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(u),
                    ref: n.useCallback(e => {
                        e && (a.current = getComputedStyle(e)), i(e)
                    }, [])
                }
            }(a),
            u = "function" == typeof l ? l({
                present: s.isPresent
            }) : n.Children.only(l),
            c = (0, i.useComposedRefs)(s.ref, (t = u, (o = (r = Object.getOwnPropertyDescriptor(t.props, "ref")?.get) && "isReactWarning" in r && r.isReactWarning) ? t.ref : (o = (r = Object.getOwnPropertyDescriptor(t, "ref")?.get) && "isReactWarning" in r && r.isReactWarning) ? t.props.ref : t.props.ref || t.ref));
        return "function" == typeof l || s.isPresent ? n.cloneElement(u, {
            ref: c
        }) : null
    };

    function B(e) {
        return e?.animationName || "none"
    }
    D.displayName = "Presence";
    var W = n.forwardRef((e, t) => (0, f.jsx)(y.span, {
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
    W.displayName = "VisuallyHidden";
    var [F, U] = (0, a.createContextScope)("Tooltip", [E]), Y = E(), X = "TooltipProvider", V = "tooltip.open", [K, Z] = F(X), q = e => {
        let {
            __scopeTooltip: t,
            delayDuration: r = 700,
            skipDelayDuration: o = 300,
            disableHoverableContent: i = !1,
            children: a
        } = e, [l, s] = n.useState(!0), u = n.useRef(!1), c = n.useRef(0);
        return n.useEffect(() => {
            let e = c.current;
            return () => window.clearTimeout(e)
        }, []), (0, f.jsx)(K, {
            scope: t,
            isOpenDelayed: l,
            delayDuration: r,
            onOpen: n.useCallback(() => {
                window.clearTimeout(c.current), s(!1)
            }, []),
            onClose: n.useCallback(() => {
                window.clearTimeout(c.current), c.current = window.setTimeout(() => s(!0), o)
            }, [o]),
            isPointerInTransitRef: u,
            onPointerInTransitChange: n.useCallback(e => {
                u.current = e
            }, []),
            disableHoverableContent: i,
            children: a
        })
    };
    q.displayName = X;
    var G = "Tooltip",
        [J, Q] = F(G),
        ee = e => {
            let {
                __scopeTooltip: t,
                children: r,
                open: o,
                defaultOpen: i = !1,
                onOpenChange: a,
                disableHoverableContent: l,
                delayDuration: u
            } = e, c = Z(G, e.__scopeTooltip), d = Y(t), [p, m] = n.useState(null), h = (0, s.useId)(), g = n.useRef(0), y = l ?? c.disableHoverableContent, x = u ?? c.delayDuration, w = n.useRef(!1), [b = !1, C] = function(e) {
                let {
                    prop: t,
                    defaultProp: r,
                    onChange: o = () => {}
                } = e, [i, a] = function(e) {
                    let {
                        defaultProp: t,
                        onChange: r
                    } = e, o = n.useState(t), [i] = o, a = n.useRef(i), l = v(r);
                    return n.useEffect(() => {
                        a.current !== i && (l(i), a.current = i)
                    }, [i, a, l]), o
                }({
                    defaultProp: r,
                    onChange: o
                }), l = void 0 !== t, s = l ? t : i, u = v(o);
                return [s, n.useCallback(e => {
                    if (l) {
                        let r = "function" == typeof e ? e(t) : e;
                        r !== t && u(r)
                    } else a(e)
                }, [l, t, a, u])]
            }({
                prop: o,
                defaultProp: i,
                onChange: e => {
                    e ? (c.onOpen(), document.dispatchEvent(new CustomEvent(V))) : c.onClose(), a?.(e)
                }
            }), E = n.useMemo(() => b ? w.current ? "delayed-open" : "instant-open" : "closed", [b]), R = n.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, w.current = !1, C(!0)
            }, [C]), A = n.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, C(!1)
            }, [C]), N = n.useCallback(() => {
                window.clearTimeout(g.current), g.current = window.setTimeout(() => {
                    w.current = !0, C(!0), g.current = 0
                }, x)
            }, [x, C]);
            return n.useEffect(() => () => {
                g.current && (window.clearTimeout(g.current), g.current = 0)
            }, []), (0, f.jsx)(S, {
                ...d,
                children: (0, f.jsx)(J, {
                    scope: t,
                    contentId: h,
                    open: b,
                    stateAttribute: E,
                    trigger: p,
                    onTriggerChange: m,
                    onTriggerEnter: n.useCallback(() => {
                        c.isOpenDelayed ? N() : R()
                    }, [c.isOpenDelayed, N, R]),
                    onTriggerLeave: n.useCallback(() => {
                        y ? A() : (window.clearTimeout(g.current), g.current = 0)
                    }, [A, y]),
                    onOpen: R,
                    onClose: A,
                    disableHoverableContent: y,
                    children: r
                })
            })
        };
    ee.displayName = G;
    var et = "TooltipTrigger",
        er = n.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                ...a
            } = e, l = Q(et, r), s = Z(et, r), u = Y(r), c = n.useRef(null), d = (0, i.useComposedRefs)(t, c, l.onTriggerChange), p = n.useRef(!1), m = n.useRef(!1), h = n.useCallback(() => p.current = !1, []);
            return n.useEffect(() => () => document.removeEventListener("pointerup", h), [h]), (0, f.jsx)(P, {
                asChild: !0,
                ...u,
                children: (0, f.jsx)(y.button, {
                    "aria-describedby": l.open ? l.contentId : void 0,
                    "data-state": l.stateAttribute,
                    ...a,
                    ref: d,
                    onPointerMove: (0, o.composeEventHandlers)(e.onPointerMove, e => {
                        "touch" !== e.pointerType && (m.current || s.isPointerInTransitRef.current || (l.onTriggerEnter(), m.current = !0))
                    }),
                    onPointerLeave: (0, o.composeEventHandlers)(e.onPointerLeave, () => {
                        l.onTriggerLeave(), m.current = !1
                    }),
                    onPointerDown: (0, o.composeEventHandlers)(e.onPointerDown, () => {
                        p.current = !0, document.addEventListener("pointerup", h, {
                            once: !0
                        })
                    }),
                    onFocus: (0, o.composeEventHandlers)(e.onFocus, () => {
                        p.current || l.onOpen()
                    }),
                    onBlur: (0, o.composeEventHandlers)(e.onBlur, l.onClose),
                    onClick: (0, o.composeEventHandlers)(e.onClick, l.onClose)
                })
            })
        });
    er.displayName = et;
    var en = "TooltipPortal",
        [eo, ei] = F(en, {
            forceMount: void 0
        }),
        ea = e => {
            let {
                __scopeTooltip: t,
                forceMount: r,
                children: n,
                container: o
            } = e, i = Q(en, t);
            return (0, f.jsx)(eo, {
                scope: t,
                forceMount: r,
                children: (0, f.jsx)(D, {
                    present: r || i.open,
                    children: (0, f.jsx)(_, {
                        asChild: !0,
                        container: o,
                        children: n
                    })
                })
            })
        };
    ea.displayName = en;
    var el = "TooltipContent",
        es = n.forwardRef((e, t) => {
            let r = ei(el, e.__scopeTooltip),
                {
                    forceMount: n = r.forceMount,
                    side: o = "top",
                    ...i
                } = e,
                a = Q(el, e.__scopeTooltip);
            return (0, f.jsx)(D, {
                present: n || a.open,
                children: a.disableHoverableContent ? (0, f.jsx)(ef, {
                    side: o,
                    ...i,
                    ref: t
                }) : (0, f.jsx)(eu, {
                    side: o,
                    ...i,
                    ref: t
                })
            })
        }),
        eu = n.forwardRef((e, t) => {
            let r = Q(el, e.__scopeTooltip),
                o = Z(el, e.__scopeTooltip),
                a = n.useRef(null),
                l = (0, i.useComposedRefs)(t, a),
                [s, u] = n.useState(null),
                {
                    trigger: c,
                    onClose: d
                } = r,
                p = a.current,
                {
                    onPointerInTransitChange: m
                } = o,
                h = n.useCallback(() => {
                    u(null), m(!1)
                }, [m]),
                g = n.useCallback((e, t) => {
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
                    u(((r = [... function(e, t) {
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
            return n.useEffect(() => () => h(), [h]), n.useEffect(() => {
                if (c && p) {
                    let e = e => g(e, p),
                        t = e => g(e, c);
                    return c.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t), () => {
                        c.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                    }
                }
            }, [c, p, g, h]), n.useEffect(() => {
                if (s) {
                    let e = e => {
                        let t = e.target,
                            r = {
                                x: e.clientX,
                                y: e.clientY
                            },
                            n = c?.contains(t) || p?.contains(t),
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
                            }(r, s);
                        n ? h() : o && (h(), d())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [c, p, s, d, h]), (0, f.jsx)(ef, {
                ...e,
                ref: l
            })
        }),
        [ec, ed] = F(G, {
            isInside: !1
        }),
        ef = n.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                children: o,
                "aria-label": i,
                onEscapeKeyDown: a,
                onPointerDownOutside: s,
                ...u
            } = e, c = Q(el, r), d = Y(r), {
                onClose: p
            } = c;
            return n.useEffect(() => (document.addEventListener(V, p), () => document.removeEventListener(V, p)), [p]), n.useEffect(() => {
                if (c.trigger) {
                    let e = e => {
                        let t = e.target;
                        t?.contains(c.trigger) && p()
                    };
                    return window.addEventListener("scroll", e, {
                        capture: !0
                    }), () => window.removeEventListener("scroll", e, {
                        capture: !0
                    })
                }
            }, [c.trigger, p]), (0, f.jsx)(l.DismissableLayer, {
                asChild: !0,
                disableOutsidePointerEvents: !1,
                onEscapeKeyDown: a,
                onPointerDownOutside: s,
                onFocusOutside: e => e.preventDefault(),
                onDismiss: p,
                children: (0, f.jsxs)(L, {
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
                    children: [(0, f.jsx)(h, {
                        children: o
                    }), (0, f.jsx)(ec, {
                        scope: r,
                        isInside: !0,
                        children: (0, f.jsx)(W, {
                            id: c.contentId,
                            role: "tooltip",
                            children: i || o
                        })
                    })]
                })
            })
        });
    es.displayName = el;
    var ep = "TooltipArrow",
        em = n.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                ...n
            } = e, o = Y(r);
            return ed(ep, r).isInside ? null : (0, f.jsx)($, {
                ...o,
                ...n,
                ref: t
            })
        });
    em.displayName = ep, e.s(["Tooltip", 0, function(e) {
        let {
            position: o,
            hasBeak: i = !0,
            title: a,
            description: l,
            ariaLabel: s,
            delayDurationMs: u = 500,
            children: c,
            open: d,
            onOpenChange: f,
            contentClassName: p
        } = e, [m, h] = o.split("-"), g = s ?? ("string" == typeof a && null == l ? a : void 0);
        return n.createElement(q, {
            delayDuration: u
        }, n.createElement(ee, {
            open: d,
            onOpenChange: f
        }, c, n.createElement(ea, null, n.createElement(es, {
            side: m,
            align: h,
            "aria-label": g,
            className: (0, r.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", p),
            sideOffset: 5
        }, i && n.createElement(em, {
            asChild: !0
        }, n.createElement(t.Beak, {
            className: "content-[var(--inverse-surface-0)]"
        })), n.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, n.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, a), l && n.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, l))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: r,
            className: o
        } = e;
        return n.createElement(er, {
            asChild: r,
            className: o
        }, t)
    }], 730318)
}, 570391, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(18731);
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
}, 555876, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(630204),
        n = e.i(422957),
        o = e.i(158051),
        i = e.i(19836),
        a = t.forwardRef((e, t) => {
            let {
                children: r,
                width: n = 10,
                height: a = 5,
                ...l
            } = e;
            return (0, i.jsx)(o.Primitive.svg, {
                ...l,
                ref: t,
                width: n,
                height: a,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? r : (0, i.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    a.displayName = "Arrow";
    var l = e.i(922353),
        s = e.i(9413),
        u = e.i(488248),
        c = e.i(18731),
        d = e.i(570391),
        f = "Popper",
        [p, m] = (0, s.createContextScope)(f),
        [h, g] = p(f),
        y = e => {
            let {
                __scopePopper: r,
                children: n
            } = e, [o, a] = t.useState(null);
            return (0, i.jsx)(h, {
                scope: r,
                anchor: o,
                onAnchorChange: a,
                children: n
            })
        };
    y.displayName = f;
    var x = "PopperAnchor",
        v = t.forwardRef((e, r) => {
            let {
                __scopePopper: n,
                virtualRef: a,
                ...s
            } = e, u = g(x, n), c = t.useRef(null), d = (0, l.useComposedRefs)(r, c);
            return t.useEffect(() => {
                u.onAnchorChange(a?.current || c.current)
            }), a ? null : (0, i.jsx)(o.Primitive.div, {
                ...s,
                ref: d
            })
        });
    v.displayName = x;
    var w = "PopperContent",
        [b, C] = p(w),
        E = t.forwardRef((e, a) => {
            let {
                __scopePopper: s,
                side: f = "bottom",
                sideOffset: p = 0,
                align: m = "center",
                alignOffset: h = 0,
                arrowPadding: y = 0,
                avoidCollisions: x = !0,
                collisionBoundary: v = [],
                collisionPadding: C = 0,
                sticky: E = "partial",
                hideWhenDetached: R = !1,
                updatePositionStrategy: A = "optimized",
                onPlaced: S,
                ...j
            } = e, O = g(w, s), [L, M] = t.useState(null), k = (0, l.useComposedRefs)(a, e => M(e)), [$, z] = t.useState(null), H = (0, d.useSize)($), I = H?.width ?? 0, _ = H?.height ?? 0, D = "number" == typeof C ? C : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...C
            }, B = Array.isArray(v) ? v : [v], W = B.length > 0, F = {
                padding: D,
                boundary: B.filter(N),
                altBoundary: W
            }, {
                refs: U,
                floatingStyles: Y,
                placement: X,
                isPositioned: V,
                middlewareData: K
            } = (0, r.useFloating)({
                strategy: "fixed",
                placement: f + ("center" !== m ? "-" + m : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, n.autoUpdate)(...t, {
                        animationFrame: "always" === A
                    })
                },
                elements: {
                    reference: O.anchor
                },
                middleware: [(0, r.offset)({
                    mainAxis: p + _,
                    alignmentAxis: h
                }), x && (0, r.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === E ? (0, r.limitShift)() : void 0,
                    ...F
                }), x && (0, r.flip)({
                    ...F
                }), (0, r.size)({
                    ...F,
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
                }), $ && (0, r.arrow)({
                    element: $,
                    padding: y
                }), P({
                    arrowWidth: I,
                    arrowHeight: _
                }), R && (0, r.hide)({
                    strategy: "referenceHidden",
                    ...F
                })]
            }), [Z, q] = T(X), G = (0, u.useCallbackRef)(S);
            (0, c.useLayoutEffect)(() => {
                V && G?.()
            }, [V, G]);
            let J = K.arrow?.x,
                Q = K.arrow?.y,
                ee = K.arrow?.centerOffset !== 0,
                [et, er] = t.useState();
            return (0, c.useLayoutEffect)(() => {
                L && er(window.getComputedStyle(L).zIndex)
            }, [L]), (0, i.jsx)("div", {
                ref: U.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...Y,
                    transform: V ? Y.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: et,
                    "--radix-popper-transform-origin": [K.transformOrigin?.x, K.transformOrigin?.y].join(" "),
                    ...K.hide?.referenceHidden && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, i.jsx)(b, {
                    scope: s,
                    placedSide: Z,
                    onArrowChange: z,
                    arrowX: J,
                    arrowY: Q,
                    shouldHideArrow: ee,
                    children: (0, i.jsx)(o.Primitive.div, {
                        "data-side": Z,
                        "data-align": q,
                        ...j,
                        ref: k,
                        style: {
                            ...j.style,
                            animation: V ? void 0 : "none"
                        }
                    })
                })
            })
        });
    E.displayName = w;
    var R = "PopperArrow",
        A = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        S = t.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, o = C(R, r), l = A[o.placedSide];
            return (0, i.jsx)("span", {
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
                children: (0, i.jsx)(a, {
                    ...n,
                    ref: t,
                    style: {
                        ...n.style,
                        display: "block"
                    }
                })
            })
        });

    function N(e) {
        return null !== e
    }
    S.displayName = R;
    var P = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            let {
                placement: r,
                rects: n,
                middlewareData: o
            } = t, i = o.arrow?.centerOffset !== 0, a = i ? 0 : e.arrowWidth, l = i ? 0 : e.arrowHeight, [s, u] = T(r), c = {
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

    function T(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["Anchor", 0, v, "Arrow", 0, S, "Content", 0, E, "Root", 0, y, "createPopperScope", 0, m], 555876)
}]);

//# debugId=3ed0fab8-9ec4-0915-2248-4158d6791237
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/07rqg2ncjs3_p.js.map
;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "4a120655-da30-bc11-4cf8-8422549f6394")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 516674, 191371, e => {
    "use strict";
    var t, n, r = e.i(197649),
        o = e.i(416340);

    function i(e) {
        let {
            className: t
        } = e;
        return o.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, r.default)("block", t),
            style: {
                marginTop: -1
            }
        }, o.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }

    function l(e, t) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (null == e || e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }

    function a(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function s() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return e => {
            let n = !1,
                r = t.map(t => {
                    let r = a(t, e);
                    return n || "function" != typeof r || (n = !0), r
                });
            if (n) return () => {
                for (let e = 0; e < r.length; e++) {
                    let n = r[e];
                    "function" == typeof n ? n() : a(t[e], null)
                }
            }
        }
    }

    function u() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return o.useCallback(s(...t), t)
    }
    e.s(["Beak", 0, i], 191371);
    var c = e.i(221628);

    function d(e) {
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
            let i = o.createContext(r),
                l = n.length;
            n = [...n, r];
            let a = t => {
                var n;
                let {
                    scope: r,
                    children: a,
                    ...s
                } = t, u = (null == r || null == (n = r[e]) ? void 0 : n[l]) || i, d = o.useMemo(() => s, Object.values(s));
                return (0, c.jsx)(u.Provider, {
                    value: d,
                    children: a
                })
            };
            return a.displayName = t + "Provider", [a, function(n, a) {
                var s;
                let u = (null == a || null == (s = a[e]) ? void 0 : s[l]) || i,
                    c = o.useContext(u);
                if (c) return c;
                if (void 0 !== r) return r;
                throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            let r = t[0];
            if (1 === t.length) return r;
            let i = () => {
                let e = t.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(t) {
                    let n = e.reduce((e, n) => {
                        let {
                            useScope: r,
                            scopeName: o
                        } = n, i = r(t)["__scope".concat(o)];
                        return {
                            ...e,
                            ...i
                        }
                    }, {});
                    return o.useMemo(() => ({
                        ["__scope".concat(r.scopeName)]: n
                    }), [n])
                }
            };
            return i.scopeName = r.scopeName, i
        }(r, ...t)]
    }
    var f = e.i(149285),
        p = o.forwardRef((e, t) => {
            let {
                children: n,
                ...r
            } = e, i = o.Children.toArray(n), l = i.find(h);
            if (l) {
                let e = l.props.children,
                    n = i.map(t => t !== l ? t : o.Children.count(e) > 1 ? o.Children.only(null) : o.isValidElement(e) ? e.props.children : null);
                return (0, c.jsx)(v, {
                    ...r,
                    ref: t,
                    children: o.isValidElement(e) ? o.cloneElement(e, void 0, n) : null
                })
            }
            return (0, c.jsx)(v, {
                ...r,
                ref: t,
                children: n
            })
        });
    p.displayName = "Slot";
    var v = o.forwardRef((e, t) => {
        let {
            children: n,
            ...r
        } = e;
        if (o.isValidElement(n)) {
            var i, l, a;
            let e, u, c = (u = (e = null == (l = Object.getOwnPropertyDescriptor((i = n).props, "ref")) ? void 0 : l.get) && "isReactWarning" in e && e.isReactWarning) ? i.ref : (u = (e = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning) ? i.props.ref : i.props.ref || i.ref;
            return o.cloneElement(n, {
                ... function(e, t) {
                    let n = {
                        ...t
                    };
                    for (let r in t) {
                        let o = e[r],
                            i = t[r];
                        /^on[A-Z]/.test(r) ? o && i ? n[r] = function() {
                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                            i(...t), o(...t)
                        } : o && (n[r] = o) : "style" === r ? n[r] = {
                            ...o,
                            ...i
                        } : "className" === r && (n[r] = [o, i].filter(Boolean).join(" "))
                    }
                    return {
                        ...e,
                        ...n
                    }
                }(r, n.props),
                ref: t ? s(t, c) : c
            })
        }
        return o.Children.count(n) > 1 ? o.Children.only(null) : null
    });
    v.displayName = "SlotClone";
    var m = e => {
        let {
            children: t
        } = e;
        return (0, c.jsx)(c.Fragment, {
            children: t
        })
    };

    function h(e) {
        return o.isValidElement(e) && e.type === m
    }
    var y = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
        let n = o.forwardRef((e, n) => {
            let {
                asChild: r,
                ...o
            } = e, i = r ? p : t;
            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, c.jsx)(i, {
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
    var x = "dismissableLayer.update",
        w = o.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        b = o.forwardRef((e, n) => {
            var r, i;
            let {
                disableOutsidePointerEvents: a = !1,
                onEscapeKeyDown: s,
                onPointerDownOutside: d,
                onFocusOutside: f,
                onInteractOutside: p,
                onDismiss: v,
                ...m
            } = e, h = o.useContext(w), [b, T] = o.useState(null), N = null != (r = null == b ? void 0 : b.ownerDocument) ? r : null == (i = globalThis) ? void 0 : i.document, [, O] = o.useState({}), P = u(n, e => T(e)), R = Array.from(h.layers), [j] = [...h.layersWithOutsidePointerEventsDisabled].slice(-1), A = R.indexOf(j), L = b ? R.indexOf(b) : -1, S = h.layersWithOutsidePointerEventsDisabled.size > 0, D = L >= A, k = function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = g(e),
                    i = o.useRef(!1),
                    l = o.useRef(() => {});
                return o.useEffect(() => {
                    let e = e => {
                            if (e.target && !i.current) {
                                let t = function() {
                                        C("dismissableLayer.pointerDownOutside", r, o, {
                                            discrete: !0
                                        })
                                    },
                                    o = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (n.removeEventListener("click", l.current), l.current = t, n.addEventListener("click", l.current, {
                                    once: !0
                                })) : t()
                            } else n.removeEventListener("click", l.current);
                            i.current = !1
                        },
                        t = window.setTimeout(() => {
                            n.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(t), n.removeEventListener("pointerdown", e), n.removeEventListener("click", l.current)
                    }
                }, [n, r]), {
                    onPointerDownCapture: () => i.current = !0
                }
            }(e => {
                let t = e.target,
                    n = [...h.branches].some(e => e.contains(t));
                D && !n && (null == d || d(e), null == p || p(e), e.defaultPrevented || null == v || v())
            }, N), M = function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = g(e),
                    i = o.useRef(!1);
                return o.useEffect(() => {
                    let e = e => {
                        e.target && !i.current && C("dismissableLayer.focusOutside", r, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return n.addEventListener("focusin", e), () => n.removeEventListener("focusin", e)
                }, [n, r]), {
                    onFocusCapture: () => i.current = !0,
                    onBlurCapture: () => i.current = !1
                }
            }(e => {
                let t = e.target;
                ![...h.branches].some(e => e.contains(t)) && (null == f || f(e), null == p || p(e), e.defaultPrevented || null == v || v())
            }, N);
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
                L === h.layers.size - 1 && (null == s || s(e), !e.defaultPrevented && v && (e.preventDefault(), v()))
            }, N), o.useEffect(() => {
                if (b) return a && (0 === h.layersWithOutsidePointerEventsDisabled.size && (t = N.body.style.pointerEvents, N.body.style.pointerEvents = "none"), h.layersWithOutsidePointerEventsDisabled.add(b)), h.layers.add(b), E(), () => {
                    a && 1 === h.layersWithOutsidePointerEventsDisabled.size && (N.body.style.pointerEvents = t)
                }
            }, [b, N, a, h]), o.useEffect(() => () => {
                b && (h.layers.delete(b), h.layersWithOutsidePointerEventsDisabled.delete(b), E())
            }, [b, h]), o.useEffect(() => {
                let e = () => O({});
                return document.addEventListener(x, e), () => document.removeEventListener(x, e)
            }, []), (0, c.jsx)(y.div, {
                ...m,
                ref: P,
                style: {
                    pointerEvents: S ? D ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: l(e.onFocusCapture, M.onFocusCapture),
                onBlurCapture: l(e.onBlurCapture, M.onBlurCapture),
                onPointerDownCapture: l(e.onPointerDownCapture, k.onPointerDownCapture)
            })
        });

    function E() {
        let e = new CustomEvent(x);
        document.dispatchEvent(e)
    }

    function C(e, t, n, r) {
        let {
            discrete: o
        } = r, i = n.originalEvent.target, l = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: n
        });
        if (t && i.addEventListener(e, t, {
                once: !0
            }), o) i && f.flushSync(() => i.dispatchEvent(l));
        else i.dispatchEvent(l)
    }
    b.displayName = "DismissableLayer", o.forwardRef((e, t) => {
        let n = o.useContext(w),
            r = o.useRef(null),
            i = u(t, r);
        return o.useEffect(() => {
            let e = r.current;
            if (e) return n.branches.add(e), () => {
                n.branches.delete(e)
            }
        }, [n.branches]), (0, c.jsx)(y.div, {
            ...e,
            ref: i
        })
    }).displayName = "DismissableLayerBranch";
    var T = (null == (n = globalThis) ? void 0 : n.document) ? o.useLayoutEffect : () => {},
        N = o["useId".toString()] || (() => void 0),
        O = 0,
        P = e.i(297452),
        R = e.i(992486),
        j = o.forwardRef((e, t) => {
            let {
                children: n,
                width: r = 10,
                height: o = 5,
                ...i
            } = e;
            return (0, c.jsx)(y.svg, {
                ...i,
                ref: t,
                width: r,
                height: o,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? n : (0, c.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    j.displayName = "Arrow";
    var A = "Popper",
        [L, S] = d(A),
        [D, k] = L(A),
        M = e => {
            let {
                __scopePopper: t,
                children: n
            } = e, [r, i] = o.useState(null);
            return (0, c.jsx)(D, {
                scope: t,
                anchor: r,
                onAnchorChange: i,
                children: n
            })
        };
    M.displayName = A;
    var _ = "PopperAnchor",
        I = o.forwardRef((e, t) => {
            let {
                __scopePopper: n,
                virtualRef: r,
                ...i
            } = e, l = k(_, n), a = o.useRef(null), s = u(t, a);
            return o.useEffect(() => {
                l.onAnchorChange((null == r ? void 0 : r.current) || a.current)
            }), r ? null : (0, c.jsx)(y.div, {
                ...i,
                ref: s
            })
        });
    I.displayName = _;
    var W = "PopperContent",
        [B, z] = L(W),
        F = o.forwardRef((e, t) => {
            var n, r, i, l, a, s, d, f;
            let {
                __scopePopper: p,
                side: v = "bottom",
                sideOffset: m = 0,
                align: h = "center",
                alignOffset: x = 0,
                arrowPadding: w = 0,
                avoidCollisions: b = !0,
                collisionBoundary: E = [],
                collisionPadding: C = 0,
                sticky: N = "partial",
                hideWhenDetached: O = !1,
                updatePositionStrategy: j = "optimized",
                onPlaced: A,
                ...L
            } = e, S = k(W, p), [D, M] = o.useState(null), _ = u(t, e => M(e)), [I, z] = o.useState(null), F = function(e) {
                let [t, n] = o.useState(void 0);
                return T(() => {
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
            }(I), U = null != (n = null == F ? void 0 : F.width) ? n : 0, H = null != (r = null == F ? void 0 : F.height) ? r : 0, V = "number" == typeof C ? C : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...C
            }, Z = Array.isArray(E) ? E : [E], q = Z.length > 0, G = {
                padding: V,
                boundary: Z.filter(Y),
                altBoundary: q
            }, {
                refs: J,
                floatingStyles: Q,
                placement: $,
                isPositioned: ee,
                middlewareData: et
            } = (0, P.useFloating)({
                strategy: "fixed",
                placement: v + ("center" !== h ? "-" + h : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return (0, R.autoUpdate)(...t, {
                        animationFrame: "always" === j
                    })
                },
                elements: {
                    reference: S.anchor
                },
                middleware: [(0, P.offset)({
                    mainAxis: m + H,
                    alignmentAxis: x
                }), b && (0, P.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === N ? (0, P.limitShift)() : void 0,
                    ...G
                }), b && (0, P.flip)({
                    ...G
                }), (0, P.size)({
                    ...G,
                    apply: e => {
                        let {
                            elements: t,
                            rects: n,
                            availableWidth: r,
                            availableHeight: o
                        } = e, {
                            width: i,
                            height: l
                        } = n.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(r, "px")), a.setProperty("--radix-popper-available-height", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(i, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                    }
                }), I && (0, P.arrow)({
                    element: I,
                    padding: w
                }), X({
                    arrowWidth: U,
                    arrowHeight: H
                }), O && (0, P.hide)({
                    strategy: "referenceHidden",
                    ...G
                })]
            }), [en, er] = K($), eo = g(A);
            T(() => {
                ee && (null == eo || eo())
            }, [ee, eo]);
            let ei = null == (i = et.arrow) ? void 0 : i.x,
                el = null == (l = et.arrow) ? void 0 : l.y,
                ea = (null == (a = et.arrow) ? void 0 : a.centerOffset) !== 0,
                [es, eu] = o.useState();
            return T(() => {
                D && eu(window.getComputedStyle(D).zIndex)
            }, [D]), (0, c.jsx)("div", {
                ref: J.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...Q,
                    transform: ee ? Q.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: es,
                    "--radix-popper-transform-origin": [null == (s = et.transformOrigin) ? void 0 : s.x, null == (d = et.transformOrigin) ? void 0 : d.y].join(" "),
                    ...(null == (f = et.hide) ? void 0 : f.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, c.jsx)(B, {
                    scope: p,
                    placedSide: en,
                    onArrowChange: z,
                    arrowX: ei,
                    arrowY: el,
                    shouldHideArrow: ea,
                    children: (0, c.jsx)(y.div, {
                        "data-side": en,
                        "data-align": er,
                        ...L,
                        ref: _,
                        style: {
                            ...L.style,
                            animation: ee ? void 0 : "none"
                        }
                    })
                })
            })
        });
    F.displayName = W;
    var U = "PopperArrow",
        H = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        V = o.forwardRef(function(e, t) {
            let {
                __scopePopper: n,
                ...r
            } = e, o = z(U, n), i = H[o.placedSide];
            return (0, c.jsx)("span", {
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
                children: (0, c.jsx)(j, {
                    ...r,
                    ref: t,
                    style: {
                        ...r.style,
                        display: "block"
                    }
                })
            })
        });

    function Y(e) {
        return null !== e
    }
    V.displayName = U;
    var X = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var n, r, o, i, l;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, v] = K(a), m = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [v], h = (null != (n = null == (i = u.arrow) ? void 0 : i.x) ? n : 0) + d / 2, y = (null != (r = null == (l = u.arrow) ? void 0 : l.y) ? r : 0) + f / 2, g = "", x = "";
            return "bottom" === p ? (g = c ? m : "".concat(h, "px"), x = "".concat(-f, "px")) : "top" === p ? (g = c ? m : "".concat(h, "px"), x = "".concat(s.floating.height + f, "px")) : "right" === p ? (g = "".concat(-f, "px"), x = c ? m : "".concat(y, "px")) : "left" === p && (g = "".concat(s.floating.width + f, "px"), x = c ? m : "".concat(y, "px")), {
                data: {
                    x: g,
                    y: x
                }
            }
        }
    });

    function K(e) {
        let [t, n = "center"] = e.split("-");
        return [t, n]
    }
    var Z = o.forwardRef((e, t) => {
        var n, r;
        let {
            container: i,
            ...l
        } = e, [a, s] = o.useState(!1);
        T(() => s(!0), []);
        let u = i || a && (null == (r = globalThis) || null == (n = r.document) ? void 0 : n.body);
        return u ? f.default.createPortal((0, c.jsx)(y.div, {
            ...l,
            ref: t
        }), u) : null
    });
    Z.displayName = "Portal";
    var q = e => {
        var t, n, r;
        let i, l, {
                present: a,
                children: s
            } = e,
            c = function(e) {
                var t, n;
                let [r, i] = o.useState(), l = o.useRef({}), a = o.useRef(e), s = o.useRef("none"), [u, c] = (t = e ? "mounted" : "unmounted", n = {
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
                    let e = G(l.current);
                    s.current = "mounted" === u ? e : "none"
                }, [u]), T(() => {
                    let t = l.current,
                        n = a.current;
                    if (n !== e) {
                        let r = s.current,
                            o = G(t);
                        e ? c("MOUNT") : "none" === o || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : n && r !== o ? c("ANIMATION_OUT") : c("UNMOUNT"), a.current = e
                    }
                }, [e, c]), T(() => {
                    if (r) {
                        var e;
                        let t, n = null != (e = r.ownerDocument.defaultView) ? e : window,
                            o = e => {
                                let o = G(l.current).includes(e.animationName);
                                if (e.target === r && o && (c("ANIMATION_END"), !a.current)) {
                                    let e = r.style.animationFillMode;
                                    r.style.animationFillMode = "forwards", t = n.setTimeout(() => {
                                        "forwards" === r.style.animationFillMode && (r.style.animationFillMode = e)
                                    })
                                }
                            },
                            i = e => {
                                e.target === r && (s.current = G(l.current))
                            };
                        return r.addEventListener("animationstart", i), r.addEventListener("animationcancel", o), r.addEventListener("animationend", o), () => {
                            n.clearTimeout(t), r.removeEventListener("animationstart", i), r.removeEventListener("animationcancel", o), r.removeEventListener("animationend", o)
                        }
                    }
                    c("ANIMATION_END")
                }, [r, c]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(u),
                    ref: o.useCallback(e => {
                        e && (l.current = getComputedStyle(e)), i(e)
                    }, [])
                }
            }(a),
            d = "function" == typeof s ? s({
                present: c.isPresent
            }) : o.Children.only(s),
            f = u(c.ref, (l = (i = null == (n = Object.getOwnPropertyDescriptor((t = d).props, "ref")) ? void 0 : n.get) && "isReactWarning" in i && i.isReactWarning) ? t.ref : (l = (i = null == (r = Object.getOwnPropertyDescriptor(t, "ref")) ? void 0 : r.get) && "isReactWarning" in i && i.isReactWarning) ? t.props.ref : t.props.ref || t.ref);
        return "function" == typeof s || c.isPresent ? o.cloneElement(d, {
            ref: f
        }) : null
    };

    function G(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    q.displayName = "Presence";
    var J = o.forwardRef((e, t) => (0, c.jsx)(y.span, {
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
    J.displayName = "VisuallyHidden";
    var [Q, $] = d("Tooltip", [S]), ee = S(), et = "TooltipProvider", en = "tooltip.open", [er, eo] = Q(et), ei = e => {
        let {
            __scopeTooltip: t,
            delayDuration: n = 700,
            skipDelayDuration: r = 300,
            disableHoverableContent: i = !1,
            children: l
        } = e, [a, s] = o.useState(!0), u = o.useRef(!1), d = o.useRef(0);
        return o.useEffect(() => {
            let e = d.current;
            return () => window.clearTimeout(e)
        }, []), (0, c.jsx)(er, {
            scope: t,
            isOpenDelayed: a,
            delayDuration: n,
            onOpen: o.useCallback(() => {
                window.clearTimeout(d.current), s(!1)
            }, []),
            onClose: o.useCallback(() => {
                window.clearTimeout(d.current), d.current = window.setTimeout(() => s(!0), r)
            }, [r]),
            isPointerInTransitRef: u,
            onPointerInTransitChange: o.useCallback(e => {
                u.current = e
            }, []),
            disableHoverableContent: i,
            children: l
        })
    };
    ei.displayName = et;
    var el = "Tooltip",
        [ea, es] = Q(el),
        eu = e => {
            let {
                __scopeTooltip: t,
                children: n,
                open: r,
                defaultOpen: i = !1,
                onOpenChange: l,
                disableHoverableContent: a,
                delayDuration: s
            } = e, u = eo(el, e.__scopeTooltip), d = ee(t), [f, p] = o.useState(null), v = function() {
                let [e, t] = o.useState(N());
                return T(() => {
                    t(e => null != e ? e : String(O++))
                }, [void 0]), e ? "radix-".concat(e) : ""
            }(), m = o.useRef(0), h = null != a ? a : u.disableHoverableContent, y = null != s ? s : u.delayDuration, x = o.useRef(!1), [w = !1, b] = function(e) {
                let {
                    prop: t,
                    defaultProp: n,
                    onChange: r = () => {}
                } = e, [i, l] = function(e) {
                    let {
                        defaultProp: t,
                        onChange: n
                    } = e, r = o.useState(t), [i] = r, l = o.useRef(i), a = g(n);
                    return o.useEffect(() => {
                        l.current !== i && (a(i), l.current = i)
                    }, [i, l, a]), r
                }({
                    defaultProp: n,
                    onChange: r
                }), a = void 0 !== t, s = a ? t : i, u = g(r);
                return [s, o.useCallback(e => {
                    if (a) {
                        let n = "function" == typeof e ? e(t) : e;
                        n !== t && u(n)
                    } else l(e)
                }, [a, t, l, u])]
            }({
                prop: r,
                defaultProp: i,
                onChange: e => {
                    e ? (u.onOpen(), document.dispatchEvent(new CustomEvent(en))) : u.onClose(), null == l || l(e)
                }
            }), E = o.useMemo(() => w ? x.current ? "delayed-open" : "instant-open" : "closed", [w]), C = o.useCallback(() => {
                window.clearTimeout(m.current), m.current = 0, x.current = !1, b(!0)
            }, [b]), P = o.useCallback(() => {
                window.clearTimeout(m.current), m.current = 0, b(!1)
            }, [b]), R = o.useCallback(() => {
                window.clearTimeout(m.current), m.current = window.setTimeout(() => {
                    x.current = !0, b(!0), m.current = 0
                }, y)
            }, [y, b]);
            return o.useEffect(() => () => {
                m.current && (window.clearTimeout(m.current), m.current = 0)
            }, []), (0, c.jsx)(M, {
                ...d,
                children: (0, c.jsx)(ea, {
                    scope: t,
                    contentId: v,
                    open: w,
                    stateAttribute: E,
                    trigger: f,
                    onTriggerChange: p,
                    onTriggerEnter: o.useCallback(() => {
                        u.isOpenDelayed ? R() : C()
                    }, [u.isOpenDelayed, R, C]),
                    onTriggerLeave: o.useCallback(() => {
                        h ? P() : (window.clearTimeout(m.current), m.current = 0)
                    }, [P, h]),
                    onOpen: C,
                    onClose: P,
                    disableHoverableContent: h,
                    children: n
                })
            })
        };
    eu.displayName = el;
    var ec = "TooltipTrigger",
        ed = o.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                ...r
            } = e, i = es(ec, n), a = eo(ec, n), s = ee(n), d = u(t, o.useRef(null), i.onTriggerChange), f = o.useRef(!1), p = o.useRef(!1), v = o.useCallback(() => f.current = !1, []);
            return o.useEffect(() => () => document.removeEventListener("pointerup", v), [v]), (0, c.jsx)(I, {
                asChild: !0,
                ...s,
                children: (0, c.jsx)(y.button, {
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
                        f.current = !0, document.addEventListener("pointerup", v, {
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
    ed.displayName = ec;
    var ef = "TooltipPortal",
        [ep, ev] = Q(ef, {
            forceMount: void 0
        }),
        em = e => {
            let {
                __scopeTooltip: t,
                forceMount: n,
                children: r,
                container: o
            } = e, i = es(ef, t);
            return (0, c.jsx)(ep, {
                scope: t,
                forceMount: n,
                children: (0, c.jsx)(q, {
                    present: n || i.open,
                    children: (0, c.jsx)(Z, {
                        asChild: !0,
                        container: o,
                        children: r
                    })
                })
            })
        };
    em.displayName = ef;
    var eh = "TooltipContent",
        ey = o.forwardRef((e, t) => {
            let n = ev(eh, e.__scopeTooltip),
                {
                    forceMount: r = n.forceMount,
                    side: o = "top",
                    ...i
                } = e,
                l = es(eh, e.__scopeTooltip);
            return (0, c.jsx)(q, {
                present: r || l.open,
                children: l.disableHoverableContent ? (0, c.jsx)(eb, {
                    side: o,
                    ...i,
                    ref: t
                }) : (0, c.jsx)(eg, {
                    side: o,
                    ...i,
                    ref: t
                })
            })
        }),
        eg = o.forwardRef((e, t) => {
            let n = es(eh, e.__scopeTooltip),
                r = eo(eh, e.__scopeTooltip),
                i = o.useRef(null),
                l = u(t, i),
                [a, s] = o.useState(null),
                {
                    trigger: d,
                    onClose: f
                } = n,
                p = i.current,
                {
                    onPointerInTransitChange: v
                } = r,
                m = o.useCallback(() => {
                    s(null), v(!1)
                }, [v]),
                h = o.useCallback((e, t) => {
                    let n, r = e.currentTarget,
                        o = {
                            x: e.clientX,
                            y: e.clientY
                        },
                        i = function(e, t) {
                            let n = Math.abs(t.top - e.y),
                                r = Math.abs(t.bottom - e.y),
                                o = Math.abs(t.right - e.x),
                                i = Math.abs(t.left - e.x);
                            switch (Math.min(n, r, o, i)) {
                                case i:
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
                    s(((n = [... function(e, t) {
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
                    }(o, i), ... function(e) {
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
                    }(n))), v(!0)
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
                                for (let e = 0, i = t.length - 1; e < t.length; i = e++) {
                                    let l = t[e].x,
                                        a = t[e].y,
                                        s = t[i].x,
                                        u = t[i].y;
                                    a > r != u > r && n < (s - l) * (r - a) / (u - a) + l && (o = !o)
                                }
                                return o
                            }(n, a);
                        r ? m() : o && (m(), f())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [d, p, a, f, m]), (0, c.jsx)(eb, {
                ...e,
                ref: l
            })
        }),
        [ex, ew] = Q(el, {
            isInside: !1
        }),
        eb = o.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                children: r,
                "aria-label": i,
                onEscapeKeyDown: l,
                onPointerDownOutside: a,
                ...s
            } = e, u = es(eh, n), d = ee(n), {
                onClose: f
            } = u;
            return o.useEffect(() => (document.addEventListener(en, f), () => document.removeEventListener(en, f)), [f]), o.useEffect(() => {
                if (u.trigger) {
                    let e = e => {
                        let t = e.target;
                        (null == t ? void 0 : t.contains(u.trigger)) && f()
                    };
                    return window.addEventListener("scroll", e, {
                        capture: !0
                    }), () => window.removeEventListener("scroll", e, {
                        capture: !0
                    })
                }
            }, [u.trigger, f]), (0, c.jsx)(b, {
                asChild: !0,
                disableOutsidePointerEvents: !1,
                onEscapeKeyDown: l,
                onPointerDownOutside: a,
                onFocusOutside: e => e.preventDefault(),
                onDismiss: f,
                children: (0, c.jsxs)(F, {
                    "data-state": u.stateAttribute,
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
                    children: [(0, c.jsx)(m, {
                        children: r
                    }), (0, c.jsx)(ex, {
                        scope: n,
                        isInside: !0,
                        children: (0, c.jsx)(J, {
                            id: u.contentId,
                            role: "tooltip",
                            children: i || r
                        })
                    })]
                })
            })
        });
    ey.displayName = eh;
    var eE = "TooltipArrow",
        eC = o.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                ...r
            } = e, o = ee(n);
            return ew(eE, n).isInside ? null : (0, c.jsx)(V, {
                ...o,
                ...r,
                ref: t
            })
        });
    eC.displayName = eE, e.s(["Tooltip", 0, function(e) {
        let {
            position: t,
            hasBeak: n = !0,
            title: l,
            description: a,
            ariaLabel: s,
            delayDurationMs: u = 500,
            children: c,
            open: d,
            onOpenChange: f,
            contentClassName: p
        } = e, [v, m] = t.split("-"), h = null != s ? s : "string" == typeof l && null == a ? l : void 0;
        return o.createElement(ei, {
            delayDuration: u
        }, o.createElement(eu, {
            open: d,
            onOpenChange: f
        }, c, o.createElement(em, null, o.createElement(ey, {
            side: v,
            align: m,
            "aria-label": h,
            className: (0, r.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", p),
            sideOffset: 5
        }, n && o.createElement(eC, {
            asChild: !0
        }, o.createElement(i, {
            className: "content-[var(--inverse-surface-0)]"
        })), o.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, o.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, l), a && o.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, a))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: n,
            className: r
        } = e;
        return o.createElement(ed, {
            asChild: n,
            className: r
        }, t)
    }], 516674)
}]);

//# debugId=4a120655-da30-bc11-4cf8-8422549f6394
//# sourceMappingURL=0e0obn3-bchpq.js.map
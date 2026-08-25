;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "d4c63ee5-8041-f5f4-9b63-d0a9d5a42545")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 668314, e => {
    "use strict";
    (0, e.i(791345).s)(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}:root{--light-mode-stroke-contrast-alpha:rgba(27,37,75,.5);--dark-mode-stroke-contrast-alpha:rgba(208,217,251,.4);--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-light-mode-shadow-subtle:rgba(0,0,0,.08);--alpha-dark-mode-shadow-subtle:rgba(4,4,8,.25);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){:root{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.light-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}.dark-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}.system-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){.system-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.stroke-contrast-alpha{border-color:var(--color-stroke-contrast-alpha)}.foundation-web-input.focus-within\\:stroke-system-emphasis:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-emphasis)}.foundation-web-input.focus-within\\:stroke-system-alert:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-alert)}"), e.s([])
}, 216458, e => {
    "use strict";
    var t, r = e.i(197649),
        n = e.i(416340),
        l = e.i(149285),
        o = e.i(675038),
        a = e.i(674023),
        i = e.i(221628),
        s = e.i(932157),
        u = e.i(926396),
        c = e.i(647409),
        d = e.i(127962),
        f = e.i(994530),
        p = e.i(300765);
    e.i(668314);
    var m = e.i(791345),
        h = e.i(912056),
        v = e.i(59952),
        g = e.i(766335);

    function y(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(n) {
            if (null == e || e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
        }
    }

    function w(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function x() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return e => {
            let r = !1,
                n = t.map(t => {
                    let n = w(t, e);
                    return r || "function" != typeof n || (r = !0), n
                });
            if (r) return () => {
                for (let e = 0; e < n.length; e++) {
                    let r = n[e];
                    "function" == typeof r ? r() : w(t[e], null)
                }
            }
        }
    }

    function b() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return n.useCallback(x(...t), t)
    }

    function C(e) {
        var t;
        let r, l = (t = e, (r = n.forwardRef((e, t) => {
                let {
                    children: r,
                    ...l
                } = e;
                if (n.isValidElement(r)) {
                    var o, a;
                    let e, i = (e = null == (o = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? r.ref : (e = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                        s = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let l = e[n],
                                    o = t[n];
                                /^on[A-Z]/.test(n) ? l && o ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    o(...t), l(...t)
                                } : l && (r[n] = l) : "style" === n ? r[n] = {
                                    ...l,
                                    ...o
                                } : "className" === n && (r[n] = [l, o].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(l, r.props);
                    return r.type !== n.Fragment && (s.ref = t ? x(t, i) : i), n.cloneElement(r, s)
                }
                return n.Children.count(r) > 1 ? n.Children.only(null) : null
            })).displayName = "".concat(t, ".SlotClone"), r),
            o = n.forwardRef((e, t) => {
                let {
                    children: r,
                    ...o
                } = e, a = n.Children.toArray(r), s = a.find(S);
                if (s) {
                    let e = s.props.children,
                        r = a.map(t => t === s ? n.Children.count(e) > 1 ? n.Children.only(null) : n.isValidElement(e) ? e.props.children : null : t);
                    return (0, i.jsx)(l, {
                        ...o,
                        ref: t,
                        children: n.isValidElement(e) ? n.cloneElement(e, void 0, r) : null
                    })
                }
                return (0, i.jsx)(l, {
                    ...o,
                    ref: t,
                    children: r
                })
            });
        return o.displayName = "".concat(e, ".Slot"), o
    }
    var E = Symbol("radix.slottable");

    function S(e) {
        return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === E
    }
    var R = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
        let r = C("Primitive.".concat(t)),
            l = n.forwardRef((e, n) => {
                let {
                    asChild: l,
                    ...o
                } = e;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, i.jsx)(l ? r : t, {
                    ...o,
                    ref: n
                })
            });
        return l.displayName = "Primitive.".concat(t), {
            ...e,
            [t]: l
        }
    }, {});

    function N(e) {
        let t = n.useRef(e);
        return n.useEffect(() => {
            t.current = e
        }), n.useMemo(() => function() {
            for (var e, r = arguments.length, n = Array(r), l = 0; l < r; l++) n[l] = arguments[l];
            return null == (e = t.current) ? void 0 : e.call(t, ...n)
        }, [])
    }

    function P(e) {
        let {
            prop: t,
            defaultProp: r,
            onChange: l = () => {}
        } = e, [o, a] = function(e) {
            let {
                defaultProp: t,
                onChange: r
            } = e, l = n.useState(t), [o] = l, a = n.useRef(o), i = N(r);
            return n.useEffect(() => {
                a.current !== o && (i(o), a.current = o)
            }, [o, a, i]), l
        }({
            defaultProp: r,
            onChange: l
        }), i = void 0 !== t, s = i ? t : o, u = N(l);
        return [s, n.useCallback(e => {
            if (i) {
                let r = "function" == typeof e ? e(t) : e;
                r !== t && u(r)
            } else a(e)
        }, [i, t, a, u])]
    }
    var O = (null == (t = globalThis) ? void 0 : t.document) ? n.useLayoutEffect : () => {},
        A = n.forwardRef((e, t) => (0, i.jsx)(R.span, {
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
    A.displayName = "VisuallyHidden";
    var T = [" ", "Enter", "ArrowUp", "ArrowDown"],
        _ = [" ", "Enter"],
        j = "Select",
        [k, D, M] = (0, a.c)(j),
        [L, I] = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                r = [],
                l = () => {
                    let t = r.map(e => n.createContext(e));
                    return function(r) {
                        let l = (null == r ? void 0 : r[e]) || t;
                        return n.useMemo(() => ({
                            ["__scope".concat(e)]: {
                                ...r,
                                [e]: l
                            }
                        }), [r, l])
                    }
                };
            return l.scopeName = e, [function(t, l) {
                let o = n.createContext(l),
                    a = r.length;
                r = [...r, l];
                let s = t => {
                    var r;
                    let {
                        scope: l,
                        children: s,
                        ...u
                    } = t, c = (null == l || null == (r = l[e]) ? void 0 : r[a]) || o, d = n.useMemo(() => u, Object.values(u));
                    return (0, i.jsx)(c.Provider, {
                        value: d,
                        children: s
                    })
                };
                return s.displayName = t + "Provider", [s, function(r, i) {
                    var s;
                    let u = (null == i || null == (s = i[e]) ? void 0 : s[a]) || o,
                        c = n.useContext(u);
                    if (c) return c;
                    if (void 0 !== l) return l;
                    throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                }]
            }, function() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                let l = t[0];
                if (1 === t.length) return l;
                let o = () => {
                    let e = t.map(e => ({
                        useScope: e(),
                        scopeName: e.scopeName
                    }));
                    return function(t) {
                        let r = e.reduce((e, r) => {
                            let {
                                useScope: n,
                                scopeName: l
                            } = r;
                            return {
                                ...e,
                                ...n(t)["__scope".concat(l)]
                            }
                        }, {});
                        return n.useMemo(() => ({
                            ["__scope".concat(l.scopeName)]: r
                        }), [r])
                    }
                };
                return o.scopeName = l.scopeName, o
            }(l, ...t)]
        }(j, [M, d.c]),
        F = (0, d.c)(),
        [W, z] = L(j),
        [B, V] = L(j),
        H = e => {
            let {
                __scopeSelect: t,
                children: r,
                open: l,
                defaultOpen: o,
                onOpenChange: a,
                value: u,
                defaultValue: f,
                onValueChange: p,
                dir: m,
                name: h,
                autoComplete: v,
                disabled: g,
                required: y,
                form: w
            } = e, x = F(t), [b, C] = n.useState(null), [E, S] = n.useState(null), [R, N] = n.useState(!1), O = (0, s.u)(m), [A = !1, T] = P({
                prop: l,
                defaultProp: o,
                onChange: a
            }), [_, j] = P({
                prop: u,
                defaultProp: f,
                onChange: p
            }), D = n.useRef(null), M = !b || w || !!b.closest("form"), [L, I] = n.useState(new Set), z = Array.from(L).map(e => e.props.value).join(";");
            return (0, i.jsx)(d.R, {
                ...x,
                children: (0, i.jsxs)(W, {
                    required: y,
                    scope: t,
                    trigger: b,
                    onTriggerChange: C,
                    valueNode: E,
                    onValueNodeChange: S,
                    valueNodeHasChildren: R,
                    onValueNodeHasChildrenChange: N,
                    contentId: (0, c.u)(),
                    value: _,
                    onValueChange: j,
                    open: A,
                    onOpenChange: T,
                    dir: O,
                    triggerPointerDownPosRef: D,
                    disabled: g,
                    children: [(0, i.jsx)(k.Provider, {
                        scope: t,
                        children: (0, i.jsx)(B, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: n.useCallback(e => {
                                I(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: n.useCallback(e => {
                                I(t => {
                                    let r = new Set(t);
                                    return r.delete(e), r
                                })
                            }, []),
                            children: r
                        })
                    }), M ? (0, i.jsxs)(eS, {
                        "aria-hidden": !0,
                        required: y,
                        tabIndex: -1,
                        name: h,
                        autoComplete: v,
                        value: _,
                        onChange: e => j(e.target.value),
                        disabled: g,
                        form: w,
                        children: [void 0 === _ ? (0, i.jsx)("option", {
                            value: ""
                        }) : null, Array.from(L)]
                    }, z) : null]
                })
            })
        };
    H.displayName = j;
    var U = "SelectTrigger",
        K = n.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                disabled: l = !1,
                ...o
            } = e, a = F(r), s = z(U, r), u = s.disabled || l, c = b(t, s.onTriggerChange), f = D(r), p = n.useRef("touch"), [m, h, v] = eR(e => {
                let t = f().filter(e => !e.disabled),
                    r = t.find(e => e.value === s.value),
                    n = eN(t, e, r);
                void 0 !== n && s.onValueChange(n.value)
            }), g = e => {
                u || (s.onOpenChange(!0), v()), e && (s.triggerPointerDownPosRef.current = {
                    x: Math.round(e.pageX),
                    y: Math.round(e.pageY)
                })
            };
            return (0, i.jsx)(d.A, {
                asChild: !0,
                ...a,
                children: (0, i.jsx)(R.button, {
                    type: "button",
                    role: "combobox",
                    "aria-controls": s.contentId,
                    "aria-expanded": s.open,
                    "aria-required": s.required,
                    "aria-autocomplete": "none",
                    dir: s.dir,
                    "data-state": s.open ? "open" : "closed",
                    disabled: u,
                    "data-disabled": u ? "" : void 0,
                    "data-placeholder": eE(s.value) ? "" : void 0,
                    ...o,
                    ref: c,
                    onClick: y(o.onClick, e => {
                        e.currentTarget.focus(), "mouse" !== p.current && g(e)
                    }),
                    onPointerDown: y(o.onPointerDown, e => {
                        p.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (g(e), e.preventDefault())
                    }),
                    onKeyDown: y(o.onKeyDown, e => {
                        let t = "" !== m.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || h(e.key), t && " " === e.key || T.includes(e.key) && (g(), e.preventDefault())
                    })
                })
            })
        });
    K.displayName = U;
    var X = "SelectValue",
        Y = n.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: n,
                style: l,
                children: o,
                placeholder: a = "",
                ...s
            } = e, u = z(X, r), {
                onValueNodeHasChildrenChange: c
            } = u, d = void 0 !== o, f = b(t, u.onValueNodeChange);
            return O(() => {
                c(d)
            }, [c, d]), (0, i.jsx)(R.span, {
                ...s,
                ref: f,
                style: {
                    pointerEvents: "none"
                },
                children: eE(u.value) ? (0, i.jsx)(i.Fragment, {
                    children: a
                }) : o
            })
        });
    Y.displayName = X;
    var q = n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            children: n,
            ...l
        } = e;
        return (0, i.jsx)(R.span, {
            "aria-hidden": !0,
            ...l,
            ref: t,
            children: n || "▼"
        })
    });
    q.displayName = "SelectIcon";
    var G = e => (0, i.jsx)(u.P, {
        asChild: !0,
        ...e
    });
    G.displayName = "SelectPortal";
    var Z = "SelectContent",
        $ = n.forwardRef((e, t) => {
            let r = z(Z, e.__scopeSelect),
                [o, a] = n.useState();
            return (O(() => {
                a(new DocumentFragment)
            }, []), r.open) ? (0, i.jsx)(et, {
                ...e,
                ref: t
            }) : o ? l.createPortal((0, i.jsx)(J, {
                scope: e.__scopeSelect,
                children: (0, i.jsx)(k.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, i.jsx)("div", {
                        children: e.children
                    })
                })
            }), o) : null
        });
    $.displayName = Z;
    var [J, Q] = L(Z), ee = C("SelectContent.RemoveScroll"), et = n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            position: l = "item-aligned",
            onCloseAutoFocus: o,
            onEscapeKeyDown: a,
            onPointerDownOutside: s,
            side: c,
            sideOffset: d,
            align: f,
            alignOffset: p,
            arrowPadding: m,
            collisionBoundary: h,
            collisionPadding: v,
            sticky: g,
            hideWhenDetached: w,
            avoidCollisions: x,
            ...C
        } = e, E = z(Z, r), [S, R] = n.useState(null), [N, P] = n.useState(null), O = b(t, e => R(e)), [A, T] = n.useState(null), [_, j] = n.useState(null), k = D(r), [M, L] = n.useState(!1), I = n.useRef(!1);
        n.useEffect(() => {
            if (S) return (0, u.h)(S)
        }, [S]), (0, u.u)();
        let F = n.useCallback(e => {
                let [t, ...r] = k().map(e => e.ref.current), [n] = r.slice(-1), l = document.activeElement;
                for (let r of e)
                    if (r === l || (null == r || r.scrollIntoView({
                            block: "nearest"
                        }), r === t && N && (N.scrollTop = 0), r === n && N && (N.scrollTop = N.scrollHeight), null == r || r.focus(), document.activeElement !== l)) return
            }, [k, N]),
            W = n.useCallback(() => F([A, S]), [F, A, S]);
        n.useEffect(() => {
            M && W()
        }, [M, W]);
        let {
            onOpenChange: B,
            triggerPointerDownPosRef: V
        } = E;
        n.useEffect(() => {
            if (S) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        var r, n, l, o;
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (null != (r = null == (l = V.current) ? void 0 : l.x) ? r : 0)),
                            y: Math.abs(Math.round(t.pageY) - (null != (n = null == (o = V.current) ? void 0 : o.y) ? n : 0))
                        }
                    },
                    r = r => {
                        e.x <= 10 && e.y <= 10 ? r.preventDefault() : S.contains(r.target) || B(!1), document.removeEventListener("pointermove", t), V.current = null
                    };
                return null !== V.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                        capture: !0
                    })
                }
            }
        }, [S, B, V]), n.useEffect(() => {
            let e = () => B(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [B]);
        let [H, U] = eR(e => {
            let t = k().filter(e => !e.disabled),
                r = t.find(e => e.ref.current === document.activeElement),
                n = eN(t, e, r);
            n && setTimeout(() => n.ref.current.focus())
        }), K = n.useCallback((e, t, r) => {
            let n = !I.current && !r;
            (void 0 !== E.value && E.value === t || n) && (T(e), n && (I.current = !0))
        }, [E.value]), X = n.useCallback(() => null == S ? void 0 : S.focus(), [S]), Y = n.useCallback((e, t, r) => {
            let n = !I.current && !r;
            (void 0 !== E.value && E.value === t || n) && j(e)
        }, [E.value]), q = "popper" === l ? en : er, G = q === en ? {
            side: c,
            sideOffset: d,
            align: f,
            alignOffset: p,
            arrowPadding: m,
            collisionBoundary: h,
            collisionPadding: v,
            sticky: g,
            hideWhenDetached: w,
            avoidCollisions: x
        } : {};
        return (0, i.jsx)(J, {
            scope: r,
            content: S,
            viewport: N,
            onViewportChange: P,
            itemRefCallback: K,
            selectedItem: A,
            onItemLeave: X,
            itemTextRefCallback: Y,
            focusSelectedItem: W,
            selectedItemText: _,
            position: l,
            isPositioned: M,
            searchRef: H,
            children: (0, i.jsx)(u.R, {
                as: ee,
                allowPinchZoom: !0,
                children: (0, i.jsx)(u.F, {
                    asChild: !0,
                    trapped: E.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: y(o, e => {
                        var t;
                        null == (t = E.trigger) || t.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, i.jsx)(u.D, {
                        asChild: !0,
                        disableOutsidePointerEvents: !0,
                        onEscapeKeyDown: a,
                        onPointerDownOutside: s,
                        onFocusOutside: e => e.preventDefault(),
                        onDismiss: () => E.onOpenChange(!1),
                        children: (0, i.jsx)(q, {
                            role: "listbox",
                            id: E.contentId,
                            "data-state": E.open ? "open" : "closed",
                            dir: E.dir,
                            onContextMenu: e => e.preventDefault(),
                            ...C,
                            ...G,
                            onPlaced: () => L(!0),
                            ref: O,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...C.style
                            },
                            onKeyDown: y(C.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || U(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = k().filter(e => !e.disabled).map(e => e.ref.current);
                                    if (["ArrowUp", "End"].includes(e.key) && (t = t.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                        let r = e.target,
                                            n = t.indexOf(r);
                                        t = t.slice(n + 1)
                                    }
                                    setTimeout(() => F(t)), e.preventDefault()
                                }
                            })
                        })
                    })
                })
            })
        })
    });
    et.displayName = "SelectContentImpl";
    var er = n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onPlaced: l,
            ...a
        } = e, s = z(Z, r), u = Q(Z, r), [c, d] = n.useState(null), [f, p] = n.useState(null), m = b(t, e => p(e)), h = D(r), v = n.useRef(!1), g = n.useRef(!0), {
            viewport: y,
            selectedItem: w,
            selectedItemText: x,
            focusSelectedItem: C
        } = u, E = n.useCallback(() => {
            if (s.trigger && s.valueNode && c && f && y && w && x) {
                let e = s.trigger.getBoundingClientRect(),
                    t = f.getBoundingClientRect(),
                    r = s.valueNode.getBoundingClientRect(),
                    n = x.getBoundingClientRect();
                if ("rtl" !== s.dir) {
                    let l = n.left - t.left,
                        a = r.left - l,
                        i = e.left - a,
                        s = e.width + i,
                        u = Math.max(s, t.width),
                        d = window.innerWidth - 10,
                        f = (0, o.c)(a, [10, Math.max(10, d - u)]);
                    c.style.minWidth = s + "px", c.style.left = f + "px"
                } else {
                    let l = t.right - n.right,
                        a = window.innerWidth - r.right - l,
                        i = window.innerWidth - e.right - a,
                        s = e.width + i,
                        u = Math.max(s, t.width),
                        d = window.innerWidth - 10,
                        f = (0, o.c)(a, [10, Math.max(10, d - u)]);
                    c.style.minWidth = s + "px", c.style.right = f + "px"
                }
                let a = h(),
                    i = window.innerHeight - 20,
                    u = y.scrollHeight,
                    d = window.getComputedStyle(f),
                    p = parseInt(d.borderTopWidth, 10),
                    m = parseInt(d.paddingTop, 10),
                    g = parseInt(d.borderBottomWidth, 10),
                    b = p + m + u + parseInt(d.paddingBottom, 10) + g,
                    C = Math.min(5 * w.offsetHeight, b),
                    E = window.getComputedStyle(y),
                    S = parseInt(E.paddingTop, 10),
                    R = parseInt(E.paddingBottom, 10),
                    N = e.top + e.height / 2 - 10,
                    P = w.offsetHeight / 2,
                    O = p + m + (w.offsetTop + P);
                if (O <= N) {
                    let e = a.length > 0 && w === a[a.length - 1].ref.current;
                    c.style.bottom = "0px";
                    let t = O + Math.max(i - N, P + (e ? R : 0) + (f.clientHeight - y.offsetTop - y.offsetHeight) + g);
                    c.style.height = t + "px"
                } else {
                    let e = a.length > 0 && w === a[0].ref.current;
                    c.style.top = "0px";
                    let t = Math.max(N, p + y.offsetTop + (e ? S : 0) + P) + (b - O);
                    c.style.height = t + "px", y.scrollTop = O - N + y.offsetTop
                }
                c.style.margin = "".concat(10, "px 0"), c.style.minHeight = C + "px", c.style.maxHeight = i + "px", null == l || l(), requestAnimationFrame(() => v.current = !0)
            }
        }, [h, s.trigger, s.valueNode, c, f, y, w, x, s.dir, l]);
        O(() => E(), [E]);
        let [S, N] = n.useState();
        O(() => {
            f && N(window.getComputedStyle(f).zIndex)
        }, [f]);
        let P = n.useCallback(e => {
            e && !0 === g.current && (E(), null == C || C(), g.current = !1)
        }, [E, C]);
        return (0, i.jsx)(el, {
            scope: r,
            contentWrapper: c,
            shouldExpandOnScrollRef: v,
            onScrollButtonChange: P,
            children: (0, i.jsx)("div", {
                ref: d,
                style: {
                    display: "flex",
                    flexDirection: "column",
                    position: "fixed",
                    zIndex: S
                },
                children: (0, i.jsx)(R.div, {
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
    er.displayName = "SelectItemAlignedPosition";
    var en = n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            align: n = "start",
            collisionPadding: l = 10,
            ...o
        } = e, a = F(r);
        return (0, i.jsx)(d.C, {
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
    en.displayName = "SelectPopperPosition";
    var [el, eo] = L(Z, {}), ea = "SelectViewport", ei = n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            nonce: l,
            ...o
        } = e, a = Q(ea, r), s = eo(ea, r), u = b(t, a.onViewportChange), c = n.useRef(0);
        return (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: l
            }), (0, i.jsx)(k.Slot, {
                scope: r,
                children: (0, i.jsx)(R.div, {
                    "data-radix-select-viewport": "",
                    role: "presentation",
                    ...o,
                    ref: u,
                    style: {
                        position: "relative",
                        flex: 1,
                        overflow: "hidden auto",
                        ...o.style
                    },
                    onScroll: y(o.onScroll, e => {
                        let t = e.currentTarget,
                            {
                                contentWrapper: r,
                                shouldExpandOnScrollRef: n
                            } = s;
                        if ((null == n ? void 0 : n.current) && r) {
                            let e = Math.abs(c.current - t.scrollTop);
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
                        c.current = t.scrollTop
                    })
                })
            })]
        })
    });
    ei.displayName = ea;
    var es = "SelectGroup",
        [eu, ec] = L(es);
    n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, l = (0, c.u)();
        return (0, i.jsx)(eu, {
            scope: r,
            id: l,
            children: (0, i.jsx)(R.div, {
                role: "group",
                "aria-labelledby": l,
                ...n,
                ref: t
            })
        })
    }).displayName = es;
    var ed = "SelectLabel";
    n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, l = ec(ed, r);
        return (0, i.jsx)(R.div, {
            id: l.id,
            ...n,
            ref: t
        })
    }).displayName = ed;
    var ef = "SelectItem",
        [ep, em] = L(ef),
        eh = n.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                value: l,
                disabled: o = !1,
                textValue: a,
                ...s
            } = e, u = z(ef, r), d = Q(ef, r), f = u.value === l, [p, m] = n.useState(null != a ? a : ""), [h, v] = n.useState(!1), g = b(t, e => {
                var t;
                return null == (t = d.itemRefCallback) ? void 0 : t.call(d, e, l, o)
            }), w = (0, c.u)(), x = n.useRef("touch"), C = () => {
                o || (u.onValueChange(l), u.onOpenChange(!1))
            };
            if ("" === l) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, i.jsx)(ep, {
                scope: r,
                value: l,
                disabled: o,
                textId: w,
                isSelected: f,
                onItemTextChange: n.useCallback(e => {
                    m(t => {
                        var r;
                        return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                    })
                }, []),
                children: (0, i.jsx)(k.ItemSlot, {
                    scope: r,
                    value: l,
                    disabled: o,
                    textValue: p,
                    children: (0, i.jsx)(R.div, {
                        role: "option",
                        "aria-labelledby": w,
                        "data-highlighted": h ? "" : void 0,
                        "aria-selected": f && h,
                        "data-state": f ? "checked" : "unchecked",
                        "aria-disabled": o || void 0,
                        "data-disabled": o ? "" : void 0,
                        tabIndex: o ? void 0 : -1,
                        ...s,
                        ref: g,
                        onFocus: y(s.onFocus, () => v(!0)),
                        onBlur: y(s.onBlur, () => v(!1)),
                        onClick: y(s.onClick, () => {
                            "mouse" !== x.current && C()
                        }),
                        onPointerUp: y(s.onPointerUp, () => {
                            "mouse" === x.current && C()
                        }),
                        onPointerDown: y(s.onPointerDown, e => {
                            x.current = e.pointerType
                        }),
                        onPointerMove: y(s.onPointerMove, e => {
                            var t;
                            x.current = e.pointerType, o ? null == (t = d.onItemLeave) || t.call(d) : "mouse" === x.current && e.currentTarget.focus({
                                preventScroll: !0
                            })
                        }),
                        onPointerLeave: y(s.onPointerLeave, e => {
                            var t;
                            e.currentTarget === document.activeElement && (null == (t = d.onItemLeave) || t.call(d))
                        }),
                        onKeyDown: y(s.onKeyDown, e => {
                            var t;
                            "" !== (null == (t = d.searchRef) ? void 0 : t.current) && " " === e.key || (_.includes(e.key) && C(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    eh.displayName = ef;
    var ev = "SelectItemText",
        eg = n.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: o,
                style: a,
                ...s
            } = e, u = z(ev, r), c = Q(ev, r), d = em(ev, r), f = V(ev, r), [p, m] = n.useState(null), h = b(t, e => m(e), d.onItemTextChange, e => {
                var t;
                return null == (t = c.itemTextRefCallback) ? void 0 : t.call(c, e, d.value, d.disabled)
            }), v = null == p ? void 0 : p.textContent, g = n.useMemo(() => (0, i.jsx)("option", {
                value: d.value,
                disabled: d.disabled,
                children: v
            }, d.value), [d.disabled, d.value, v]), {
                onNativeOptionAdd: y,
                onNativeOptionRemove: w
            } = f;
            return O(() => (y(g), () => w(g)), [y, w, g]), (0, i.jsxs)(i.Fragment, {
                children: [(0, i.jsx)(R.span, {
                    id: d.textId,
                    ...s,
                    ref: h
                }), d.isSelected && u.valueNode && !u.valueNodeHasChildren ? l.createPortal(s.children, u.valueNode) : null]
            })
        });
    eg.displayName = ev;
    var ey = "SelectItemIndicator";
    n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e;
        return em(ey, r).isSelected ? (0, i.jsx)(R.span, {
            "aria-hidden": !0,
            ...n,
            ref: t
        }) : null
    }).displayName = ey;
    var ew = "SelectScrollUpButton";
    n.forwardRef((e, t) => {
        let r = Q(ew, e.__scopeSelect),
            l = eo(ew, e.__scopeSelect),
            [o, a] = n.useState(!1),
            s = b(t, l.onScrollButtonChange);
        return O(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        a(t.scrollTop > 0)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), o ? (0, i.jsx)(eb, {
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
    }).displayName = ew;
    var ex = "SelectScrollDownButton";
    n.forwardRef((e, t) => {
        let r = Q(ex, e.__scopeSelect),
            l = eo(ex, e.__scopeSelect),
            [o, a] = n.useState(!1),
            s = b(t, l.onScrollButtonChange);
        return O(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        a(Math.ceil(t.scrollTop) < e)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), o ? (0, i.jsx)(eb, {
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
    }).displayName = ex;
    var eb = n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onAutoScroll: l,
            ...o
        } = e, a = Q("SelectScrollButton", r), s = n.useRef(null), u = D(r), c = n.useCallback(() => {
            null !== s.current && (window.clearInterval(s.current), s.current = null)
        }, []);
        return n.useEffect(() => () => c(), [c]), O(() => {
            var e, t;
            null == (t = u().find(e => e.ref.current === document.activeElement)) || null == (e = t.ref.current) || e.scrollIntoView({
                block: "nearest"
            })
        }, [u]), (0, i.jsx)(R.div, {
            "aria-hidden": !0,
            ...o,
            ref: t,
            style: {
                flexShrink: 0,
                ...o.style
            },
            onPointerDown: y(o.onPointerDown, () => {
                null === s.current && (s.current = window.setInterval(l, 50))
            }),
            onPointerMove: y(o.onPointerMove, () => {
                var e;
                null == (e = a.onItemLeave) || e.call(a), null === s.current && (s.current = window.setInterval(l, 50))
            }),
            onPointerLeave: y(o.onPointerLeave, () => {
                c()
            })
        })
    });
    n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e;
        return (0, i.jsx)(R.div, {
            "aria-hidden": !0,
            ...n,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var eC = "SelectArrow";

    function eE(e) {
        return "" === e || void 0 === e
    }
    n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, l = F(r), o = z(eC, r), a = Q(eC, r);
        return o.open && "popper" === a.position ? (0, i.jsx)(d.a, {
            ...l,
            ...n,
            ref: t
        }) : null
    }).displayName = eC;
    var eS = n.forwardRef((e, t) => {
        let r, {
                value: l,
                ...o
            } = e,
            a = n.useRef(null),
            s = b(t, a),
            u = (r = n.useRef({
                value: l,
                previous: l
            }), n.useMemo(() => (r.current.value !== l && (r.current.previous = r.current.value, r.current.value = l), r.current.previous), [l]));
        return n.useEffect(() => {
            let e = a.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
            if (u !== l && t) {
                let r = new Event("change", {
                    bubbles: !0
                });
                t.call(e, l), e.dispatchEvent(r)
            }
        }, [u, l]), (0, i.jsx)(A, {
            asChild: !0,
            children: (0, i.jsx)("select", {
                ...o,
                ref: s,
                defaultValue: l
            })
        })
    });

    function eR(e) {
        let t = N(e),
            r = n.useRef(""),
            l = n.useRef(0),
            o = n.useCallback(e => {
                let n = r.current + e;
                t(n),
                    function e(t) {
                        r.current = t, window.clearTimeout(l.current), "" !== t && (l.current = window.setTimeout(() => e(""), 1e3))
                    }(n)
            }, [t]),
            a = n.useCallback(() => {
                r.current = "", window.clearTimeout(l.current)
            }, []);
        return n.useEffect(() => () => window.clearTimeout(l.current), []), [r, o, a]
    }

    function eN(e, t, r) {
        var n;
        let l = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            o = (n = Math.max(r ? e.indexOf(r) : -1, 0), e.map((t, r) => e[(n + r) % e.length]));
        1 === l.length && (o = o.filter(e => e !== r));
        let a = o.find(e => e.textValue.toLowerCase().startsWith(l.toLowerCase()));
        return a !== r ? a : void 0
    }
    eS.displayName = "BubbleSelect", (0, m.s)(".foundation-web-menu-separator{border-top:1px solid var(--color-stroke-default)}");
    let eP = (0, n.createContext)(null),
        eO = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        eA = {
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
        e_ = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        ej = {
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
        eD = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        eM = (0, n.forwardRef)((e, t) => {
            let {
                label: l,
                labelTooltip: o,
                ariaLabelledBy: a,
                ariaLabel: i,
                className: s,
                size: u,
                variant: c = "Standard",
                value: d,
                placeholder: m,
                isDisabled: y,
                hasError: w,
                hint: x,
                onValueChange: b,
                onOpenChange: C,
                children: E
            } = e, S = (0, h.default)(), R = (0, n.useMemo)(() => ({
                size: u
            }), [u]), N = l ? n.default.createElement("span", {
                id: S,
                className: (0, r.default)(eT[u], "content-emphasis")
            }, l) : null;
            return n.default.createElement(eP.Provider, {
                value: R
            }, n.default.createElement("div", {
                className: (0, r.default)("flex flex-col", y && [p.disabledOpacity, "pointer-events-none"], ej[u], s)
            }, N && (o ? n.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, N, n.default.createElement(v.LabelTooltip, Object.assign({}, o))) : N), n.default.createElement(H, {
                value: d,
                disabled: y,
                onValueChange: b,
                onOpenChange: C
            }, n.default.createElement(K, {
                className: (0, r.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", g.INPUT_BACKGROUND_BY_VARIANT[c], g.INPUT_STROKE_BY_VARIANT[c], ek[u], eD[u], eA[u], e_[u], w ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === d ? "content-muted" : "content-default"),
                ref: t,
                "aria-labelledby": l ? S : a,
                "aria-label": i
            }, n.default.createElement(f.StateLayer, null), n.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, n.default.createElement(Y, {
                placeholder: m
            })), n.default.createElement(q, {
                className: (0, r.default)(eO[u], "icon icon-regular-chevron-large-down content-default")
            })), n.default.createElement(G, null, n.default.createElement($, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, E))), x && n.default.createElement("span", {
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": w,
                    "content-default": !w
                })
            }, x)))
        });
    eM.displayName = "Dropdown", e.s(["D", 0, eM, "I", 0, eg, "V", 0, ei, "a", 0, eP, "b", 0, eh])
}, 349377, e => {
    "use strict";
    var t = e.i(592822),
        r = e.i(197649),
        n = e.i(416340);
    let l = (0, n.forwardRef)((e, l) => {
        var {
            className: o,
            style: a,
            orientation: i = "horizontal",
            variant: s = "Standard"
        } = e, u = (0, t._)(e, ["className", "style", "orientation", "variant"]);
        let c = "vertical" === i,
            d = {};
        return c || "Inset" !== s ? c || "InsetLeft" !== s ? c || "InsetRight" !== s || (d = {
            marginRight: "var(--padding-xlarge)"
        }) : d = {
            marginLeft: "var(--padding-xlarge)"
        } : d = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, n.default.createElement("div", Object.assign({
            ref: l
        }, u, {
            role: "separator",
            "data-orientation": i,
            "aria-orientation": i,
            style: Object.assign(Object.assign(Object.assign({
                borderRightWidth: 0,
                borderBottomWidth: 0,
                boxSizing: "border-box",
                borderStyle: "solid"
            }, c ? {
                height: "100%",
                width: 0,
                borderLeftWidth: "var(--stroke-standard)",
                borderTopWidth: 0
            } : "Thick" === s ? {
                height: "var(--size-250)",
                borderTop: "var(--stroke-standard)",
                borderLeftWidth: 0,
                background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
            } : {
                height: 0,
                borderTopWidth: "var(--stroke-standard)",
                borderLeftWidth: 0
            }), d), a),
            className: (0, r.default)("stroke-default self-stretch", o)
        }))
    });
    l.displayName = "Divider", e.s(["Divider", 0, l])
}, 175793, e => {
    "use strict";
    var t = e.i(592822),
        r = e.i(197649),
        n = e.i(416340),
        l = e.i(439889),
        o = e.i(994530),
        a = e.i(300765);
    e.i(221628);
    let i = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        s = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        u = {
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
        f = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        p = {
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
        m = {
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
        h = (0, n.forwardRef)((e, h) => {
            let v;
            var {
                className: g,
                icon: y,
                ariaLabel: w,
                isDisabled: x = !1,
                isCircular: b = !1,
                isSelected: C = !1,
                size: E = "Large",
                variant: S = "Emphasis",
                iconColor: R = "Default",
                asChild: N,
                children: P
            } = e, O = (0, t._)(e, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]);
            v = x ? d[S] : C ? f[S] : c[S];
            let A = (0, r.default)("foundation-web-icon-button", x ? a.disabledOpacity : [o.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", i[E], u[E][b ? "circular" : "square"], v, g),
                T = n.default.createElement(n.default.Fragment, null, n.default.createElement(o.StateLayer, null), n.default.createElement("span", {
                    className: (0, r.default)("icon", y, s[E], x ? m[R][S] : p[R][S])
                }));
            if (N) {
                let e = (0, t._)(O, ["as"]),
                    r = n.default.Children.only(P);
                return n.default.createElement(l.S, Object.assign({
                    ref: h
                }, e, {
                    className: A,
                    "aria-label": w,
                    "aria-disabled": x || void 0
                }), n.default.cloneElement(r, {}, T))
            }
            if ("a" === O.as) {
                let {
                    as: e,
                    href: r
                } = O, l = (0, t._)(O, ["as", "href"]);
                return n.default.createElement("a", Object.assign({
                    ref: h
                }, l, {
                    "aria-label": w,
                    "aria-disabled": x,
                    href: x ? void 0 : r,
                    className: A
                }), T)
            }
            let _ = (0, t._)(O, ["as"]);
            return n.default.createElement("button", Object.assign({
                ref: h,
                type: "button"
            }, _, {
                "aria-label": w,
                disabled: x,
                className: A
            }), T)
        });
    e.s(["IconButton", 0, h])
}, 480904, e => {
    "use strict";
    var t = e.i(592822),
        r = e.i(197649),
        n = e.i(416340),
        l = e.i(439889),
        o = e.i(216458),
        a = e.i(571926),
        i = e.i(994530),
        s = e.i(300765);
    e.i(221628), e.i(149285), e.i(668314), e.i(766335);
    let u = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        c = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        d = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        f = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        p = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        m = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        h = {
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
        g = (0, n.createContext)(null),
        y = () => {
            let e = (0, n.useContext)(g);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        var t;
        let {
            children: l,
            className: i,
            size: s
        } = e, c = (0, n.useContext)(o.a), d = c ? "dropdown" : "standalone", f = null != (t = null != s ? s : null == c ? void 0 : c.size) ? t : "Medium", p = (0, n.useMemo)(() => ({
            size: f,
            mode: d
        }), [f, d]), m = (0, r.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", u[f], i), h = "standalone" === d ? n.default.createElement(a.R, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, n.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: m
        }, l)) : n.default.createElement("div", {
            className: m
        }, l);
        return n.default.createElement(g.Provider, {
            value: p
        }, "dropdown" === d ? n.default.createElement(o.V, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, h) : h)
    }, "MenuItem", 0, e => {
        let u;
        var {
            value: c,
            leading: g,
            title: w,
            description: x,
            trailing: b,
            disabled: C,
            className: E,
            onSelect: S,
            asChild: R,
            children: N
        } = e, P = (0, t._)(e, ["value", "leading", "title", "description", "trailing", "disabled", "className", "onSelect", "asChild", "children"]);
        let {
            size: O,
            mode: A
        } = y(), T = (0, r.default)(i.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", h[O], d[O], f[O], p[O], v[O], C && s.disabledOpacity, C && "pointer-events-none", E), _ = n.default.createElement("span", {
            className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
        }, w);
        switch (A) {
            case "dropdown":
                _ = n.default.createElement(o.I, {
                    asChild: !0
                }, _);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", A)
        }
        let j = n.default.createElement(n.default.Fragment, null, !C && n.default.createElement(i.StateLayer, null), g, n.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", m[O])
        }, _, x && n.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, x)), b);
        if (R) {
            let e = (0, t._)(P, ["as"]),
                r = n.default.Children.only(N),
                o = void 0 === w && r.props.children;
            u = n.default.createElement(l.S, Object.assign({}, e, {
                role: "standalone" === A ? "menuitem" : void 0,
                "aria-disabled": C || void 0,
                className: T,
                style: {
                    outlineOffset: 0
                },
                onClick: C ? void 0 : S
            }), o ? n.default.cloneElement(r, {}, n.default.createElement(n.default.Fragment, null, !C && n.default.createElement(i.StateLayer, null), r.props.children)) : n.default.cloneElement(r, {}, j))
        } else if ("a" === P.as) {
            let {
                as: e,
                href: r
            } = P, l = (0, t._)(P, ["as", "href"]);
            u = n.default.createElement("a", Object.assign({}, l, {
                role: "standalone" === A ? "menuitem" : void 0,
                "aria-disabled": C,
                href: C ? void 0 : r,
                className: T,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: C ? void 0 : S
            }), j)
        } else {
            let e = (0, t._)(P, ["as"]);
            u = n.default.createElement("button", Object.assign({
                type: "button"
            }, e, {
                role: "standalone" === A ? "menuitem" : void 0,
                "aria-disabled": C,
                className: T,
                style: {
                    outlineOffset: 0
                },
                onClick: C ? void 0 : S
            }), j)
        }
        return "dropdown" === A ? n.default.createElement(o.b, {
            value: c,
            disabled: C,
            asChild: !0
        }, u) : n.default.createElement(a.I, {
            asChild: !0,
            focusable: !0,
            tabStopId: c
        }, u)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: l,
            leading: o,
            trailing: a,
            disabled: i,
            className: u
        } = e, {
            size: c
        } = y(), v = (0, r.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", h[c], d[c], f[c], p[c], i && s.disabledOpacity, u);
        return n.default.createElement("div", {
            role: "none",
            className: v
        }, o, n.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", m[c])
        }, n.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), l && n.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, l)), a)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: l
        } = e, {
            size: o
        } = y();
        return n.default.createElement("div", {
            role: "group",
            className: (0, r.default)(c[o], l)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return n.default.createElement("div", {
            role: "separator",
            className: (0, r.default)("foundation-web-menu-separator", t)
        })
    }])
}, 605741, e => {
    "use strict";
    var t = e.i(592822),
        r = e.i(416340),
        n = e.i(197649),
        l = e.i(810510);
    e.i(668314), e.i(221628), e.i(149285);
    let o = e => {
        var t, r, n, l;
        let o = null != (n = null == (r = null == (t = window.matchMedia) ? void 0 : t.call(window, "(pointer: coarse)")) ? void 0 : r.matches) && n,
            a = null == (l = document.activeElement) ? void 0 : l.matches(":focus-visible");
        if (o && !a) return void e.preventDefault();
        let i = e.currentTarget,
            s = null == i ? void 0 : i.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        s && (e.preventDefault(), s.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: n,
            onOpenChange: o,
            children: a
        } = e;
        return r.createElement(l.R, {
            open: t,
            defaultOpen: n,
            onOpenChange: o
        }, a)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: t,
            className: n,
            children: o
        } = e;
        return r.createElement(l.b, {
            asChild: t,
            className: n
        }, o)
    }, "PopoverClose", 0, function(e) {
        var {
            children: n
        } = e, o = (0, t._)(e, ["children"]);
        return r.createElement(l.a, Object.assign({}, o), n)
    }, "PopoverContent", 0, function(e) {
        var {
            side: a = "bottom",
            align: i = "center",
            sideOffset: s = 4,
            className: u,
            children: c,
            ariaLabel: d,
            onOpenAutoFocus: f
        } = e, p = (0, t._)(e, ["side", "align", "sideOffset", "className", "children", "ariaLabel", "onOpenAutoFocus"]);
        return r.createElement(l.P, null, r.createElement(l.C, Object.assign({
            side: a,
            align: i,
            sideOffset: s
        }, p, {
            "aria-label": null != d ? d : p["aria-label"],
            onOpenAutoFocus: null != f ? f : o,
            className: (0, n.default)("foundation-web-portal-zindex", u)
        }), c))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: n,
            className: o,
            children: a
        } = e;
        return r.createElement(l.T, {
            asChild: t,
            disabled: n,
            className: o
        }, a)
    }])
}, 552258, e => {
    "use strict";
    var t = e.i(592822),
        r = e.i(197649),
        n = e.i(416340),
        l = e.i(791345);
    e.i(668314), (0, l.s)("@keyframes progress-circle-rotate{0%{transform:rotate(0deg)}to{transform:rotate(1turn)}}.foundation-web-progress-circle-indeterminate{animation:progress-circle-rotate 1.4s linear infinite;transform-origin:50% 50%}");
    let o = {
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
        a = n.default.forwardRef((e, l) => {
            var {
                className: a,
                size: i = "Large",
                variant: s = "Determinate",
                value: u = 0,
                showValue: c = !1,
                ariaLabel: d
            } = e, f = (0, t._)(e, ["className", "size", "variant", "value", "showValue", "ariaLabel"]);
            let {
                dimension: p,
                strokeWidth: m,
                textClass: h,
                valueContainerSize: v
            } = o[i], g = (p - m) / 2, y = 2 * Math.PI * g, w = p / 2, x = Math.min(100, Math.max(0, u)), b = c && void 0 !== v ? v : p, C = "Determinate" === s;
            return n.default.createElement("div", Object.assign({
                ref: l,
                className: (0, r.default)("foundation-web-progress-circle inline-flex items-center justify-center", a),
                role: "progressbar",
                "aria-label": d,
                "aria-valuemin": C ? 0 : void 0,
                "aria-valuemax": C ? 100 : void 0,
                "aria-valuenow": C ? x : void 0,
                style: {
                    width: b,
                    height: b
                }
            }, f), n.default.createElement("svg", {
                width: p,
                height: p,
                viewBox: "0 0 ".concat(p, " ").concat(p),
                className: "relative"
            }, n.default.createElement("circle", {
                cx: w,
                cy: w,
                r: g,
                fill: "none",
                strokeWidth: m,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), n.default.createElement("circle", {
                cx: w,
                cy: w,
                r: g,
                fill: "none",
                strokeWidth: m,
                strokeDasharray: C ? y : "".concat(.75 * y, " ").concat(.25 * y),
                strokeDashoffset: C ? y * (1 - x / 100) : 0,
                strokeLinecap: "round",
                className: (0, r.default)(!C && "foundation-web-progress-circle-indeterminate"),
                style: C ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), C && c && "Large" === i && n.default.createElement("div", {
                className: (0, r.default)("absolute content-emphasis flex items-center justify-center", h),
                "aria-hidden": "true"
            }, n.default.createElement("span", null, Math.round(x)), n.default.createElement("span", null, "%")))
        });
    a.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, a])
}, 343915, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(197649),
        n = e.i(660531),
        l = e.i(149285),
        o = e.i(221628),
        a = e.i(830999),
        i = e.i(901599);
    e.i(668314);
    var s = t.forwardRef((e, r) => {
        let {
            children: n,
            ...l
        } = e, a = t.Children.toArray(n), i = a.find(d);
        if (i) {
            let e = i.props.children,
                n = a.map(r => r === i ? t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null : r);
            return (0, o.jsx)(u, {
                ...l,
                ref: r,
                children: t.isValidElement(e) ? t.cloneElement(e, void 0, n) : null
            })
        }
        return (0, o.jsx)(u, {
            ...l,
            ref: r,
            children: n
        })
    });
    s.displayName = "Slot";
    var u = t.forwardRef((e, r) => {
        let {
            children: l,
            ...o
        } = e;
        if (t.isValidElement(l)) {
            var a, i;
            let e, s = (e = null == (a = Object.getOwnPropertyDescriptor(l.props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning ? l.ref : (e = null == (i = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : i.get) && "isReactWarning" in e && e.isReactWarning ? l.props.ref : l.props.ref || l.ref;
            return t.cloneElement(l, {
                ... function(e, t) {
                    let r = {
                        ...t
                    };
                    for (let n in t) {
                        let l = e[n],
                            o = t[n];
                        /^on[A-Z]/.test(n) ? l && o ? r[n] = function() {
                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                            o(...t), l(...t)
                        } : l && (r[n] = l) : "style" === n ? r[n] = {
                            ...l,
                            ...o
                        } : "className" === n && (r[n] = [l, o].filter(Boolean).join(" "))
                    }
                    return {
                        ...e,
                        ...r
                    }
                }(o, l.props),
                ref: r ? (0, n.c)(r, s) : s
            })
        }
        return t.Children.count(l) > 1 ? t.Children.only(null) : null
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
    var f, p = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, r) => {
            let n = t.forwardRef((e, t) => {
                let {
                    asChild: n,
                    ...l
                } = e, a = n ? s : r;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(a, {
                    ...l,
                    ref: t
                })
            });
            return n.displayName = "Primitive.".concat(r), {
                ...e,
                [r]: n
            }
        }, {}),
        m = "dismissableLayer.update",
        h = t.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        v = t.forwardRef((e, r) => {
            var l, a;
            let {
                disableOutsidePointerEvents: i = !1,
                onEscapeKeyDown: s,
                onPointerDownOutside: u,
                onFocusOutside: c,
                onInteractOutside: d,
                onDismiss: v,
                ...w
            } = e, x = t.useContext(h), [b, C] = t.useState(null), E = null != (l = null == b ? void 0 : b.ownerDocument) ? l : null == (a = globalThis) ? void 0 : a.document, [, S] = t.useState({}), R = (0, n.u)(r, e => C(e)), N = Array.from(x.layers), [P] = [...x.layersWithOutsidePointerEventsDisabled].slice(-1), O = N.indexOf(P), A = b ? N.indexOf(b) : -1, T = x.layersWithOutsidePointerEventsDisabled.size > 0, _ = A >= O, j = function(e) {
                var r;
                let l = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (r = globalThis) ? void 0 : r.document,
                    o = (0, n.f)(e),
                    a = t.useRef(!1),
                    i = t.useRef(() => {});
                return t.useEffect(() => {
                    let e = e => {
                            if (e.target && !a.current) {
                                let t = function() {
                                        y("dismissableLayer.pointerDownOutside", o, r, {
                                            discrete: !0
                                        })
                                    },
                                    r = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (l.removeEventListener("click", i.current), i.current = t, l.addEventListener("click", i.current, {
                                    once: !0
                                })) : t()
                            } else l.removeEventListener("click", i.current);
                            a.current = !1
                        },
                        t = window.setTimeout(() => {
                            l.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(t), l.removeEventListener("pointerdown", e), l.removeEventListener("click", i.current)
                    }
                }, [l, o]), {
                    onPointerDownCapture: () => a.current = !0
                }
            }(e => {
                let t = e.target,
                    r = [...x.branches].some(e => e.contains(t));
                _ && !r && (null == u || u(e), null == d || d(e), e.defaultPrevented || null == v || v())
            }, E), k = function(e) {
                var r;
                let l = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (r = globalThis) ? void 0 : r.document,
                    o = (0, n.f)(e),
                    a = t.useRef(!1);
                return t.useEffect(() => {
                    let e = e => {
                        e.target && !a.current && y("dismissableLayer.focusOutside", o, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return l.addEventListener("focusin", e), () => l.removeEventListener("focusin", e)
                }, [l, o]), {
                    onFocusCapture: () => a.current = !0,
                    onBlurCapture: () => a.current = !1
                }
            }(e => {
                let t = e.target;
                [...x.branches].some(e => e.contains(t)) || (null == c || c(e), null == d || d(e), e.defaultPrevented || null == v || v())
            }, E);
            return function(e) {
                var r;
                let l = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (r = globalThis) ? void 0 : r.document,
                    o = (0, n.f)(e);
                t.useEffect(() => {
                    let e = e => {
                        "Escape" === e.key && o(e)
                    };
                    return l.addEventListener("keydown", e, {
                        capture: !0
                    }), () => l.removeEventListener("keydown", e, {
                        capture: !0
                    })
                }, [o, l])
            }(e => {
                A === x.layers.size - 1 && (null == s || s(e), !e.defaultPrevented && v && (e.preventDefault(), v()))
            }, E), t.useEffect(() => {
                if (b) return i && (0 === x.layersWithOutsidePointerEventsDisabled.size && (f = E.body.style.pointerEvents, E.body.style.pointerEvents = "none"), x.layersWithOutsidePointerEventsDisabled.add(b)), x.layers.add(b), g(), () => {
                    i && 1 === x.layersWithOutsidePointerEventsDisabled.size && (E.body.style.pointerEvents = f)
                }
            }, [b, E, i, x]), t.useEffect(() => () => {
                b && (x.layers.delete(b), x.layersWithOutsidePointerEventsDisabled.delete(b), g())
            }, [b, x]), t.useEffect(() => {
                let e = () => S({});
                return document.addEventListener(m, e), () => document.removeEventListener(m, e)
            }, []), (0, o.jsx)(p.div, {
                ...w,
                ref: R,
                style: {
                    pointerEvents: T ? _ ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: (0, n.d)(e.onFocusCapture, k.onFocusCapture),
                onBlurCapture: (0, n.d)(e.onBlurCapture, k.onBlurCapture),
                onPointerDownCapture: (0, n.d)(e.onPointerDownCapture, j.onPointerDownCapture)
            })
        });

    function g() {
        let e = new CustomEvent(m);
        document.dispatchEvent(e)
    }

    function y(e, t, r, n) {
        let {
            discrete: o
        } = n, a = r.originalEvent.target, i = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: r
        });
        t && a.addEventListener(e, t, {
            once: !0
        }), o ? a && l.flushSync(() => a.dispatchEvent(i)) : a.dispatchEvent(i)
    }
    v.displayName = "DismissableLayer", t.forwardRef((e, r) => {
        let l = t.useContext(h),
            a = t.useRef(null),
            i = (0, n.u)(r, a);
        return t.useEffect(() => {
            let e = a.current;
            if (e) return l.branches.add(e), () => {
                l.branches.delete(e)
            }
        }, [l.branches]), (0, o.jsx)(p.div, {
            ...e,
            ref: i
        })
    }).displayName = "DismissableLayerBranch";
    var w = t["useId".toString()] || (() => {}),
        x = 0,
        b = t.forwardRef((e, t) => {
            let {
                children: r,
                width: n = 10,
                height: l = 5,
                ...a
            } = e;
            return (0, o.jsx)(p.svg, {
                ...a,
                ref: t,
                width: n,
                height: l,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? r : (0, o.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    b.displayName = "Arrow";
    var C = "Popper",
        [E, S] = (0, n.a)(C),
        [R, N] = E(C),
        P = e => {
            let {
                __scopePopper: r,
                children: n
            } = e, [l, a] = t.useState(null);
            return (0, o.jsx)(R, {
                scope: r,
                anchor: l,
                onAnchorChange: a,
                children: n
            })
        };
    P.displayName = C;
    var O = "PopperAnchor",
        A = t.forwardRef((e, r) => {
            let {
                __scopePopper: l,
                virtualRef: a,
                ...i
            } = e, s = N(O, l), u = t.useRef(null), c = (0, n.u)(r, u);
            return t.useEffect(() => {
                s.onAnchorChange((null == a ? void 0 : a.current) || u.current)
            }), a ? null : (0, o.jsx)(p.div, {
                ...i,
                ref: c
            })
        });
    A.displayName = O;
    var T = "PopperContent",
        [_, j] = E(T),
        k = t.forwardRef((e, r) => {
            var l, i, s, u, c, d, f, m;
            let {
                __scopePopper: h,
                side: v = "bottom",
                sideOffset: g = 0,
                align: y = "center",
                alignOffset: w = 0,
                arrowPadding: x = 0,
                avoidCollisions: b = !0,
                collisionBoundary: C = [],
                collisionPadding: E = 0,
                sticky: S = "partial",
                hideWhenDetached: R = !1,
                updatePositionStrategy: P = "optimized",
                onPlaced: O,
                ...A
            } = e, j = N(T, h), [k, D] = t.useState(null), M = (0, n.u)(r, e => D(e)), [L, z] = t.useState(null), B = (0, n.e)(L), V = null != (l = null == B ? void 0 : B.width) ? l : 0, H = null != (i = null == B ? void 0 : B.height) ? i : 0, U = "number" == typeof E ? E : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...E
            }, K = Array.isArray(C) ? C : [C], X = K.length > 0, Y = {
                padding: U,
                boundary: K.filter(I),
                altBoundary: X
            }, {
                refs: q,
                floatingStyles: G,
                placement: Z,
                isPositioned: $,
                middlewareData: J
            } = (0, a.u)({
                strategy: "fixed",
                placement: v + ("center" !== y ? "-" + y : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, a.a)(...t, {
                        animationFrame: "always" === P
                    })
                },
                elements: {
                    reference: j.anchor
                },
                middleware: [(0, a.o)({
                    mainAxis: g + H,
                    alignmentAxis: w
                }), b && (0, a.s)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === S ? (0, a.l)() : void 0,
                    ...Y
                }), b && (0, a.f)({
                    ...Y
                }), (0, a.b)({
                    ...Y,
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
                }), L && (0, a.c)({
                    element: L,
                    padding: x
                }), F({
                    arrowWidth: V,
                    arrowHeight: H
                }), R && (0, a.h)({
                    strategy: "referenceHidden",
                    ...Y
                })]
            }), [Q, ee] = W(Z), et = (0, n.f)(O);
            (0, n.g)(() => {
                $ && (null == et || et())
            }, [$, et]);
            let er = null == (s = J.arrow) ? void 0 : s.x,
                en = null == (u = J.arrow) ? void 0 : u.y,
                el = 0 !== (null == (c = J.arrow) ? void 0 : c.centerOffset),
                [eo, ea] = t.useState();
            return (0, n.g)(() => {
                k && ea(window.getComputedStyle(k).zIndex)
            }, [k]), (0, o.jsx)("div", {
                ref: q.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...G,
                    transform: $ ? G.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: eo,
                    "--radix-popper-transform-origin": [null == (d = J.transformOrigin) ? void 0 : d.x, null == (f = J.transformOrigin) ? void 0 : f.y].join(" "),
                    ...(null == (m = J.hide) ? void 0 : m.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, o.jsx)(_, {
                    scope: h,
                    placedSide: Q,
                    onArrowChange: z,
                    arrowX: er,
                    arrowY: en,
                    shouldHideArrow: el,
                    children: (0, o.jsx)(p.div, {
                        "data-side": Q,
                        "data-align": ee,
                        ...A,
                        ref: M,
                        style: {
                            ...A.style,
                            animation: $ ? void 0 : "none"
                        }
                    })
                })
            })
        });
    k.displayName = T;
    var D = "PopperArrow",
        M = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        L = t.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, l = j(D, r), a = M[l.placedSide];
            return (0, o.jsx)("span", {
                ref: l.onArrowChange,
                style: {
                    position: "absolute",
                    left: l.arrowX,
                    top: l.arrowY,
                    [a]: 0,
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
                children: (0, o.jsx)(b, {
                    ...n,
                    ref: t,
                    style: {
                        ...n.style,
                        display: "block"
                    }
                })
            })
        });

    function I(e) {
        return null !== e
    }
    L.displayName = D;
    var F = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, n, l, o, a;
            let {
                placement: i,
                rects: s,
                middlewareData: u
            } = t, c = 0 !== (null == (l = u.arrow) ? void 0 : l.centerOffset), d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, m] = W(i), h = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], v = (null != (r = null == (o = u.arrow) ? void 0 : o.x) ? r : 0) + d / 2, g = (null != (n = null == (a = u.arrow) ? void 0 : a.y) ? n : 0) + f / 2, y = "", w = "";
            return "bottom" === p ? (y = c ? h : "".concat(v, "px"), w = -f + "px") : "top" === p ? (y = c ? h : "".concat(v, "px"), w = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = -f + "px", w = c ? h : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), w = c ? h : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: w
                }
            }
        }
    });

    function W(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    var z = t.forwardRef((e, r) => {
        var a, i;
        let {
            container: s,
            ...u
        } = e, [c, d] = t.useState(!1);
        (0, n.g)(() => d(!0), []);
        let f = s || c && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
        return f ? l.default.createPortal((0, o.jsx)(p.div, {
            ...u,
            ref: r
        }), f) : null
    });
    z.displayName = "Portal";
    var B = t.forwardRef((e, t) => (0, o.jsx)(p.span, {
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
    B.displayName = "VisuallyHidden";
    var [V, H] = (0, n.a)("Tooltip", [S]), U = S(), K = "TooltipProvider", X = "tooltip.open", [Y, q] = V(K), G = e => {
        let {
            __scopeTooltip: r,
            delayDuration: n = 700,
            skipDelayDuration: l = 300,
            disableHoverableContent: a = !1,
            children: i
        } = e, [s, u] = t.useState(!0), c = t.useRef(!1), d = t.useRef(0);
        return t.useEffect(() => {
            let e = d.current;
            return () => window.clearTimeout(e)
        }, []), (0, o.jsx)(Y, {
            scope: r,
            isOpenDelayed: s,
            delayDuration: n,
            onOpen: t.useCallback(() => {
                window.clearTimeout(d.current), u(!1)
            }, []),
            onClose: t.useCallback(() => {
                window.clearTimeout(d.current), d.current = window.setTimeout(() => u(!0), l)
            }, [l]),
            isPointerInTransitRef: c,
            onPointerInTransitChange: t.useCallback(e => {
                c.current = e
            }, []),
            disableHoverableContent: a,
            children: i
        })
    };
    G.displayName = K;
    var Z = "Tooltip",
        [$, J] = V(Z),
        Q = e => {
            let {
                __scopeTooltip: r,
                children: l,
                open: a,
                defaultOpen: i = !1,
                onOpenChange: s,
                disableHoverableContent: u,
                delayDuration: c
            } = e, d = q(Z, e.__scopeTooltip), f = U(r), [p, m] = t.useState(null), h = function() {
                let [e, r] = t.useState(w());
                return (0, n.g)(() => {
                    r(e => null != e ? e : String(x++))
                }, [void 0]), e ? "radix-".concat(e) : ""
            }(), v = t.useRef(0), g = null != u ? u : d.disableHoverableContent, y = null != c ? c : d.delayDuration, b = t.useRef(!1), [C = !1, E] = (0, n.b)({
                prop: a,
                defaultProp: i,
                onChange: e => {
                    e ? (d.onOpen(), document.dispatchEvent(new CustomEvent(X))) : d.onClose(), null == s || s(e)
                }
            }), S = t.useMemo(() => C ? b.current ? "delayed-open" : "instant-open" : "closed", [C]), R = t.useCallback(() => {
                window.clearTimeout(v.current), v.current = 0, b.current = !1, E(!0)
            }, [E]), N = t.useCallback(() => {
                window.clearTimeout(v.current), v.current = 0, E(!1)
            }, [E]), O = t.useCallback(() => {
                window.clearTimeout(v.current), v.current = window.setTimeout(() => {
                    b.current = !0, E(!0), v.current = 0
                }, y)
            }, [y, E]);
            return t.useEffect(() => () => {
                v.current && (window.clearTimeout(v.current), v.current = 0)
            }, []), (0, o.jsx)(P, {
                ...f,
                children: (0, o.jsx)($, {
                    scope: r,
                    contentId: h,
                    open: C,
                    stateAttribute: S,
                    trigger: p,
                    onTriggerChange: m,
                    onTriggerEnter: t.useCallback(() => {
                        d.isOpenDelayed ? O() : R()
                    }, [d.isOpenDelayed, O, R]),
                    onTriggerLeave: t.useCallback(() => {
                        g ? N() : (window.clearTimeout(v.current), v.current = 0)
                    }, [N, g]),
                    onOpen: R,
                    onClose: N,
                    disableHoverableContent: g,
                    children: l
                })
            })
        };
    Q.displayName = Z;
    var ee = "TooltipTrigger",
        et = t.forwardRef((e, r) => {
            let {
                __scopeTooltip: l,
                ...a
            } = e, i = J(ee, l), s = q(ee, l), u = U(l), c = t.useRef(null), d = (0, n.u)(r, c, i.onTriggerChange), f = t.useRef(!1), m = t.useRef(!1), h = t.useCallback(() => f.current = !1, []);
            return t.useEffect(() => () => document.removeEventListener("pointerup", h), [h]), (0, o.jsx)(A, {
                asChild: !0,
                ...u,
                children: (0, o.jsx)(p.button, {
                    "aria-describedby": i.open ? i.contentId : void 0,
                    "data-state": i.stateAttribute,
                    ...a,
                    ref: d,
                    onPointerMove: (0, n.d)(e.onPointerMove, e => {
                        "touch" !== e.pointerType && (m.current || s.isPointerInTransitRef.current || (i.onTriggerEnter(), m.current = !0))
                    }),
                    onPointerLeave: (0, n.d)(e.onPointerLeave, () => {
                        i.onTriggerLeave(), m.current = !1
                    }),
                    onPointerDown: (0, n.d)(e.onPointerDown, () => {
                        f.current = !0, document.addEventListener("pointerup", h, {
                            once: !0
                        })
                    }),
                    onFocus: (0, n.d)(e.onFocus, () => {
                        f.current || i.onOpen()
                    }),
                    onBlur: (0, n.d)(e.onBlur, i.onClose),
                    onClick: (0, n.d)(e.onClick, i.onClose)
                })
            })
        });
    et.displayName = ee;
    var er = "TooltipPortal",
        [en, el] = V(er, {
            forceMount: void 0
        }),
        eo = e => {
            let {
                __scopeTooltip: t,
                forceMount: r,
                children: l,
                container: a
            } = e, i = J(er, t);
            return (0, o.jsx)(en, {
                scope: t,
                forceMount: r,
                children: (0, o.jsx)(n.P, {
                    present: r || i.open,
                    children: (0, o.jsx)(z, {
                        asChild: !0,
                        container: a,
                        children: l
                    })
                })
            })
        };
    eo.displayName = er;
    var ea = "TooltipContent",
        ei = t.forwardRef((e, t) => {
            let r = el(ea, e.__scopeTooltip),
                {
                    forceMount: l = r.forceMount,
                    side: a = "top",
                    ...i
                } = e,
                s = J(ea, e.__scopeTooltip);
            return (0, o.jsx)(n.P, {
                present: l || s.open,
                children: s.disableHoverableContent ? (0, o.jsx)(ed, {
                    side: a,
                    ...i,
                    ref: t
                }) : (0, o.jsx)(es, {
                    side: a,
                    ...i,
                    ref: t
                })
            })
        }),
        es = t.forwardRef((e, r) => {
            let l = J(ea, e.__scopeTooltip),
                a = q(ea, e.__scopeTooltip),
                i = t.useRef(null),
                s = (0, n.u)(r, i),
                [u, c] = t.useState(null),
                {
                    trigger: d,
                    onClose: f
                } = l,
                p = i.current,
                {
                    onPointerInTransitChange: m
                } = a,
                h = t.useCallback(() => {
                    c(null), m(!1)
                }, [m]),
                v = t.useCallback((e, t) => {
                    let r, n = e.currentTarget,
                        l = {
                            x: e.clientX,
                            y: e.clientY
                        };
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
                    }(l, function(e, t) {
                        let r = Math.abs(t.top - e.y),
                            n = Math.abs(t.bottom - e.y),
                            l = Math.abs(t.right - e.x),
                            o = Math.abs(t.left - e.x);
                        switch (Math.min(r, n, l, o)) {
                            case o:
                                return "left";
                            case l:
                                return "right";
                            case r:
                                return "top";
                            case n:
                                return "bottom";
                            default:
                                throw Error("unreachable")
                        }
                    }(l, n.getBoundingClientRect())), ... function(e) {
                        let {
                            top: t,
                            right: r,
                            bottom: n,
                            left: l
                        } = e;
                        return [{
                            x: l,
                            y: t
                        }, {
                            x: r,
                            y: t
                        }, {
                            x: r,
                            y: n
                        }, {
                            x: l,
                            y: n
                        }]
                    }(t.getBoundingClientRect())].slice()).sort((e, t) => e.x < t.x ? -1 : e.x > t.x ? 1 : e.y < t.y ? -1 : +(e.y > t.y)), function(e) {
                        if (e.length <= 1) return e.slice();
                        let t = [];
                        for (let r = 0; r < e.length; r++) {
                            let n = e[r];
                            for (; t.length >= 2;) {
                                let e = t[t.length - 1],
                                    r = t[t.length - 2];
                                if (!((e.x - r.x) * (n.y - r.y) >= (e.y - r.y) * (n.x - r.x))) break;
                                t.pop()
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
                                if (!((e.x - t.x) * (n.y - t.y) >= (e.y - t.y) * (n.x - t.x))) break;
                                r.pop()
                            }
                            r.push(n)
                        }
                        return r.pop(), 1 === t.length && 1 === r.length && t[0].x === r[0].x && t[0].y === r[0].y ? t : t.concat(r)
                    }(r))), m(!0)
                }, [m]);
            return t.useEffect(() => () => h(), [h]), t.useEffect(() => {
                if (d && p) {
                    let e = e => v(e, p),
                        t = e => v(e, d);
                    return d.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t), () => {
                        d.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                    }
                }
            }, [d, p, v, h]), t.useEffect(() => {
                if (u) {
                    let e = e => {
                        let t = e.target,
                            r = {
                                x: e.clientX,
                                y: e.clientY
                            },
                            n = (null == d ? void 0 : d.contains(t)) || (null == p ? void 0 : p.contains(t)),
                            l = ! function(e, t) {
                                let {
                                    x: r,
                                    y: n
                                } = e, l = !1;
                                for (let e = 0, o = t.length - 1; e < t.length; o = e++) {
                                    let a = t[e].x,
                                        i = t[e].y,
                                        s = t[o].x,
                                        u = t[o].y;
                                    i > n != u > n && r < (s - a) * (n - i) / (u - i) + a && (l = !l)
                                }
                                return l
                            }(r, u);
                        n ? h() : l && (h(), f())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [d, p, u, f, h]), (0, o.jsx)(ed, {
                ...e,
                ref: s
            })
        }),
        [eu, ec] = V(Z, {
            isInside: !1
        }),
        ed = t.forwardRef((e, r) => {
            let {
                __scopeTooltip: n,
                children: l,
                "aria-label": a,
                onEscapeKeyDown: i,
                onPointerDownOutside: s,
                ...u
            } = e, d = J(ea, n), f = U(n), {
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
            }, [d.trigger, p]), (0, o.jsx)(v, {
                asChild: !0,
                disableOutsidePointerEvents: !1,
                onEscapeKeyDown: i,
                onPointerDownOutside: s,
                onFocusOutside: e => e.preventDefault(),
                onDismiss: p,
                children: (0, o.jsxs)(k, {
                    "data-state": d.stateAttribute,
                    ...f,
                    ...u,
                    ref: r,
                    style: {
                        ...u.style,
                        "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                        "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                        "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                        "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                        "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                    },
                    children: [(0, o.jsx)(c, {
                        children: l
                    }), (0, o.jsx)(eu, {
                        scope: n,
                        isInside: !0,
                        children: (0, o.jsx)(B, {
                            id: d.contentId,
                            role: "tooltip",
                            children: a || l
                        })
                    })]
                })
            })
        });
    ei.displayName = ea;
    var ef = "TooltipArrow",
        ep = t.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                ...n
            } = e, l = U(r);
            return ec(ef, r).isInside ? null : (0, o.jsx)(L, {
                ...l,
                ...n,
                ref: t
            })
        });
    ep.displayName = ef, e.s(["Tooltip", 0, function(e) {
        let {
            position: n,
            hasBeak: l = !0,
            title: o,
            description: a,
            ariaLabel: s,
            delayDurationMs: u = 500,
            children: c,
            open: d,
            onOpenChange: f,
            contentClassName: p
        } = e, [m, h] = n.split("-"), v = null != s ? s : "string" == typeof o && null == a ? o : void 0;
        return t.createElement(G, {
            delayDuration: u
        }, t.createElement(Q, {
            open: d,
            onOpenChange: f
        }, c, t.createElement(eo, null, t.createElement(ei, {
            side: m,
            align: h,
            "aria-label": v,
            className: (0, r.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", p),
            sideOffset: 5
        }, l && t.createElement(ep, {
            asChild: !0
        }, t.createElement(i.Beak, {
            className: "content-[var(--inverse-surface-0)]"
        })), t.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, t.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, o), a && t.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, a))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: r,
            asChild: n,
            className: l
        } = e;
        return t.createElement(et, {
            asChild: n,
            className: l
        }, r)
    }])
}, 901599, e => {
    "use strict";
    var t = e.i(197649),
        r = e.i(416340);
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
    }])
}, 59952, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(446955),
        n = e.i(343915);
    e.i(221628), e.i(149285), e.i(668314), e.s(["LabelTooltip", 0, e => {
        let {
            title: l,
            description: o,
            position: a = "top-center"
        } = e;
        return t.default.createElement(n.Tooltip, {
            position: a,
            title: l,
            description: o
        }, t.default.createElement(n.TooltipTrigger, {
            asChild: !0
        }, t.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": l,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, t.default.createElement(r.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }])
}, 766335, e => {
    "use strict";
    e.s(["INPUT_BACKGROUND_BY_VARIANT", 0, {
        Standard: "bg-none",
        Contrast: "bg-shift-200",
        Utility: "bg-none"
    }, "INPUT_STROKE_BY_VARIANT", 0, {
        Standard: "stroke-standard",
        Contrast: "stroke-none",
        Utility: "stroke-none"
    }])
}, 830999, e => {
    "use strict";
    let t;
    var r = e.i(416340),
        n = e.i(149285);
    let l = ["top", "right", "bottom", "left"],
        o = Math.min,
        a = Math.max,
        i = Math.round,
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

    function m(e) {
        return "x" === e ? "y" : "x"
    }

    function h(e) {
        return "y" === e ? "height" : "width"
    }

    function v(e) {
        let t = e[0];
        return "t" === t || "b" === t ? "y" : "x"
    }

    function g(e) {
        return e.includes("start") ? e.replace("start", "end") : e.replace("end", "start")
    }
    let y = ["left", "right"],
        w = ["right", "left"],
        x = ["top", "bottom"],
        b = ["bottom", "top"];

    function C(e) {
        let t = f(e);
        return c[t] + e.slice(t.length)
    }

    function E(e) {
        var t, r, n, l;
        return "number" != typeof e ? {
            top: null != (t = e.top) ? t : 0,
            right: null != (r = e.right) ? r : 0,
            bottom: null != (n = e.bottom) ? n : 0,
            left: null != (l = e.left) ? l : 0
        } : {
            top: e,
            right: e,
            bottom: e,
            left: e
        }
    }

    function S(e) {
        let {
            x: t,
            y: r,
            width: n,
            height: l
        } = e;
        return {
            width: n,
            height: l,
            top: r,
            left: t,
            right: t + n,
            bottom: r + l,
            x: t,
            y: r
        }
    }

    function R(e, t, r) {
        let n, {
                reference: l,
                floating: o
            } = e,
            a = v(t),
            i = m(v(t)),
            s = h(i),
            u = f(t),
            c = "y" === a,
            d = l.x + l.width / 2 - o.width / 2,
            g = l.y + l.height / 2 - o.height / 2,
            y = l[s] / 2 - o[s] / 2;
        switch (u) {
            case "top":
                n = {
                    x: d,
                    y: l.y - o.height
                };
                break;
            case "bottom":
                n = {
                    x: d,
                    y: l.y + l.height
                };
                break;
            case "right":
                n = {
                    x: l.x + l.width,
                    y: g
                };
                break;
            case "left":
                n = {
                    x: l.x - o.width,
                    y: g
                };
                break;
            default:
                n = {
                    x: l.x,
                    y: l.y
                }
        }
        switch (p(t)) {
            case "start":
                n[i] -= y * (r && c ? -1 : 1);
                break;
            case "end":
                n[i] += y * (r && c ? -1 : 1)
        }
        return n
    }
    async function N(e, t) {
        var r;
        void 0 === t && (t = {});
        let {
            x: n,
            y: l,
            platform: o,
            rects: a,
            elements: i,
            strategy: s
        } = e, {
            boundary: u = "clippingAncestors",
            rootBoundary: c = "viewport",
            elementContext: f = "floating",
            altBoundary: p = !1,
            padding: m = 0
        } = d(t, e), h = E(m), v = i[p ? "floating" === f ? "reference" : "floating" : f], g = S(await o.getClippingRect({
            element: null == (r = await (null == o.isElement ? void 0 : o.isElement(v))) || r ? v : v.contextElement || await (null == o.getDocumentElement ? void 0 : o.getDocumentElement(i.floating)),
            boundary: u,
            rootBoundary: c,
            strategy: s
        })), y = "floating" === f ? {
            x: n,
            y: l,
            width: a.floating.width,
            height: a.floating.height
        } : a.reference, w = await (null == o.getOffsetParent ? void 0 : o.getOffsetParent(i.floating)), x = await (null == o.isElement ? void 0 : o.isElement(w)) && await (null == o.getScale ? void 0 : o.getScale(w)) || {
            x: 1,
            y: 1
        }, b = S(o.convertOffsetParentRelativeRectToViewportRelativeRect ? await o.convertOffsetParentRelativeRectToViewportRelativeRect({
            elements: i,
            rect: y,
            offsetParent: w,
            strategy: s
        }) : y);
        return {
            top: (g.top - b.top + h.top) / x.y,
            bottom: (b.bottom - g.bottom + h.bottom) / x.y,
            left: (g.left - b.left + h.left) / x.x,
            right: (b.right - g.right + h.right) / x.x
        }
    }

    function P(e, t) {
        return {
            top: e.top - t.height,
            right: e.right - t.width,
            bottom: e.bottom - t.height,
            left: e.left - t.width
        }
    }

    function O(e) {
        return l.some(t => e[t] >= 0)
    }
    let A = new Set(["left", "top"]);

    function T() {
        return "u" > typeof window
    }

    function _(e) {
        return D(e) ? (e.nodeName || "").toLowerCase() : "#document"
    }

    function j(e) {
        var t;
        return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
    }

    function k(e) {
        var t;
        return null == (t = (D(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
    }

    function D(e) {
        return !!T() && (e instanceof Node || e instanceof j(e).Node)
    }

    function M(e) {
        return !!T() && (e instanceof Element || e instanceof j(e).Element)
    }

    function L(e) {
        return !!T() && (e instanceof HTMLElement || e instanceof j(e).HTMLElement)
    }

    function I(e) {
        return !(!T() || "u" < typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof j(e).ShadowRoot)
    }

    function F(e) {
        let {
            overflow: t,
            overflowX: r,
            overflowY: n,
            display: l
        } = X(e);
        return /auto|scroll|overlay|hidden|clip/.test(t + n + r) && "inline" !== l && "contents" !== l
    }

    function W(e) {
        try {
            if (e.matches(":popover-open")) return !0
        } catch (e) {}
        try {
            return e.matches(":modal")
        } catch (e) {
            return !1
        }
    }
    let z = /transform|translate|scale|rotate|perspective|filter/,
        B = /paint|layout|strict|content/,
        V = e => !!e && "none" !== e;

    function H(e) {
        let t = M(e) ? X(e) : e;
        return V(t.transform) || V(t.translate) || V(t.scale) || V(t.rotate) || V(t.perspective) || !U() && (V(t.backdropFilter) || V(t.filter)) || z.test(t.willChange || "") || B.test(t.contain || "")
    }

    function U() {
        return null == t && (t = "u" > typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), t
    }

    function K(e) {
        return /^(html|body|#document)$/.test(_(e))
    }

    function X(e) {
        return j(e).getComputedStyle(e)
    }

    function Y(e) {
        return M(e) ? {
            scrollLeft: e.scrollLeft,
            scrollTop: e.scrollTop
        } : {
            scrollLeft: e.scrollX,
            scrollTop: e.scrollY
        }
    }

    function q(e) {
        if ("html" === _(e)) return e;
        let t = e.assignedSlot || e.parentNode || I(e) && e.host || k(e);
        return I(t) ? t.host : t
    }

    function G(e, t, r) {
        var n;
        void 0 === t && (t = []), void 0 === r && (r = !0);
        let l = function e(t) {
                let r = q(t);
                return K(r) ? (t.ownerDocument || t).body : L(r) && F(r) ? r : e(r)
            }(e),
            o = l === (null == (n = e.ownerDocument) ? void 0 : n.body),
            a = j(l);
        if (o) {
            let e = Z(a);
            return t.concat(a, a.visualViewport || [], F(l) ? l : [], e && r ? G(e) : [])
        }
        return t.concat(l, G(l, [], r))
    }

    function Z(e) {
        return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
    }

    function $(e) {
        let t = X(e),
            r = parseFloat(t.width) || 0,
            n = parseFloat(t.height) || 0,
            l = L(e),
            o = l ? e.offsetWidth : r,
            a = l ? e.offsetHeight : n,
            s = i(r) !== o || i(n) !== a;
        return s && (r = o, n = a), {
            width: r,
            height: n,
            $: s
        }
    }

    function J(e) {
        return M(e) ? e : e.contextElement
    }

    function Q(e) {
        let t = J(e);
        if (!L(t)) return u(1);
        let r = t.getBoundingClientRect(),
            {
                width: n,
                height: l,
                $: o
            } = $(t),
            a = (o ? i(r.width) : r.width) / n,
            s = (o ? i(r.height) : r.height) / l;
        return a && Number.isFinite(a) || (a = 1), s && Number.isFinite(s) || (s = 1), {
            x: a,
            y: s
        }
    }
    let ee = u(0);

    function et(e) {
        let t = j(e);
        return U() && t.visualViewport ? {
            x: t.visualViewport.offsetLeft,
            y: t.visualViewport.offsetTop
        } : ee
    }

    function er(e, t, r, n) {
        var l;
        void 0 === t && (t = !1), void 0 === r && (r = !1);
        let o = e.getBoundingClientRect(),
            a = J(e),
            i = u(1);
        t && (n ? M(n) && (i = Q(n)) : i = Q(e));
        let s = (void 0 === (l = r) && (l = !1), !(!n || l && n !== j(a)) && l) ? et(a) : u(0),
            c = (o.left + s.x) / i.x,
            d = (o.top + s.y) / i.y,
            f = o.width / i.x,
            p = o.height / i.y;
        if (a) {
            let e = j(a),
                t = n && M(n) ? j(n) : n,
                r = e,
                l = Z(r);
            for (; l && n && t !== r;) {
                let e = Q(l),
                    t = l.getBoundingClientRect(),
                    n = X(l),
                    o = t.left + (l.clientLeft + parseFloat(n.paddingLeft)) * e.x,
                    a = t.top + (l.clientTop + parseFloat(n.paddingTop)) * e.y;
                c *= e.x, d *= e.y, f *= e.x, p *= e.y, c += o, d += a, l = Z(r = j(l))
            }
        }
        return S({
            width: f,
            height: p,
            x: c,
            y: d
        })
    }

    function en(e, t) {
        let r = Y(e).scrollLeft;
        return t ? t.left + r : er(k(e)).left + r
    }

    function el(e, t, r) {
        void 0 === r && (r = !1);
        let n = e.getBoundingClientRect();
        return {
            x: n.left + t.scrollLeft - (r ? 0 : en(e, n)),
            y: n.top + t.scrollTop
        }
    }
    let eo = new Set(["absolute", "fixed"]);

    function ea(e, t, r) {
        var n;
        let l;
        if ("viewport" === t) l = function(e, t) {
            let r = j(e),
                n = k(e),
                l = r.visualViewport,
                o = n.clientWidth,
                a = n.clientHeight,
                i = 0,
                s = 0;
            if (l) {
                o = l.width, a = l.height;
                let e = U();
                (!e || e && "fixed" === t) && (i = l.offsetLeft, s = l.offsetTop)
            }
            return {
                width: o,
                height: a,
                x: i,
                y: s
            }
        }(e, r);
        else if ("document" === t) {
            let t, r, o, i, s, u, c;
            n = k(e), t = k(n), r = Y(n), o = n.ownerDocument.body, i = a(t.scrollWidth, t.clientWidth, o.scrollWidth, o.clientWidth), s = a(t.scrollHeight, t.clientHeight, o.scrollHeight, o.clientHeight), u = -r.scrollLeft + en(n), c = -r.scrollTop, "rtl" === X(o).direction && (u += a(t.clientWidth, o.clientWidth) - i), l = {
                width: i,
                height: s,
                x: u,
                y: c
            }
        } else if (M(t)) {
            let e, n, o, a;
            n = (e = er(t, !0, "fixed" === r)).top + t.clientTop, o = e.left + t.clientLeft, a = L(t) ? Q(t) : u(1), l = {
                width: t.clientWidth * a.x,
                height: t.clientHeight * a.y,
                x: o * a.x,
                y: n * a.y
            }
        } else {
            let r = et(e);
            l = {
                x: t.x - r.x,
                y: t.y - r.y,
                width: t.width,
                height: t.height
            }
        }
        return S(l)
    }

    function ei(e) {
        return "static" === X(e).position
    }

    function es(e, t) {
        if (!L(e) || "fixed" === X(e).position) return null;
        if (t) return t(e);
        let r = e.offsetParent;
        return k(e) === r && (r = r.ownerDocument.body), r
    }

    function eu(e, t) {
        var r;
        let n = j(e);
        if (W(e)) return n;
        if (!L(e)) {
            let t = q(e);
            for (; t && !K(t);) {
                if (M(t) && !ei(t)) return t;
                t = q(t)
            }
            return n
        }
        let l = es(e, t);
        for (; l && (r = l, /^(table|td|th)$/.test(_(r))) && ei(l);) l = es(l, t);
        return l && K(l) && ei(l) && !H(l) ? n : l || function(e) {
            let t = q(e);
            for (; L(t) && !K(t);) {
                if (H(t)) return t;
                if (W(t)) break;
                t = q(t)
            }
            return null
        }(e) || n
    }
    let ec = {
        convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
            let {
                elements: t,
                rect: r,
                offsetParent: n,
                strategy: l
            } = e, o = "fixed" === l, a = k(n), i = !!t && W(t.floating);
            if (n === a || i && o) return r;
            let s = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                c = u(1),
                d = u(0),
                f = L(n);
            if ((f || !f && !o) && (("body" !== _(n) || F(a)) && (s = Y(n)), L(n))) {
                let e = er(n);
                c = Q(n), d.x = e.x + n.clientLeft, d.y = e.y + n.clientTop
            }
            let p = !a || f || o ? u(0) : el(a, s, !0);
            return {
                width: r.width * c.x,
                height: r.height * c.y,
                x: r.x * c.x - s.scrollLeft * c.x + d.x + p.x,
                y: r.y * c.y - s.scrollTop * c.y + d.y + p.y
            }
        },
        getDocumentElement: k,
        getClippingRect: function(e) {
            let {
                element: t,
                boundary: r,
                rootBoundary: n,
                strategy: l
            } = e, i = [..."clippingAncestors" === r ? W(t) ? [] : function(e, t) {
                let r = t.get(e);
                if (r) return r;
                let n = G(e, [], !1).filter(e => M(e) && "body" !== _(e)),
                    l = null,
                    o = "fixed" === X(e).position,
                    a = o ? q(e) : e;
                for (; M(a) && !K(a);) {
                    let t = X(a),
                        r = H(a);
                    r || "fixed" !== t.position || (l = null), (o ? !r && !l : !r && "static" === t.position && l && eo.has(l.position) || F(a) && !r && function e(t, r) {
                        let n = q(t);
                        return !(n === r || !M(n) || K(n)) && ("fixed" === X(n).position || e(n, r))
                    }(e, a)) ? n = n.filter(e => e !== a) : l = t, a = q(a)
                }
                return t.set(e, n), n
            }(t, this._c) : [].concat(r), n], s = i[0], u = i.reduce((e, r) => {
                let n = ea(t, r, l);
                return e.top = a(n.top, e.top), e.right = o(n.right, e.right), e.bottom = o(n.bottom, e.bottom), e.left = a(n.left, e.left), e
            }, ea(t, s, l));
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
                r = this.getDimensions,
                n = await r(e.floating);
            return {
                reference: function(e, t, r) {
                    let n = L(t),
                        l = k(t),
                        o = "fixed" === r,
                        a = er(e, !0, o, t),
                        i = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        s = u(0);
                    if (n || !n && !o)
                        if (("body" !== _(t) || F(l)) && (i = Y(t)), n) {
                            let e = er(t, !0, o, t);
                            s.x = e.x + t.clientLeft, s.y = e.y + t.clientTop
                        } else l && (s.x = en(l));
                    o && !n && l && (s.x = en(l));
                    let c = !l || n || o ? u(0) : el(l, i);
                    return {
                        x: a.left + i.scrollLeft - s.x - c.x,
                        y: a.top + i.scrollTop - s.y - c.y,
                        width: a.width,
                        height: a.height
                    }
                }(e.reference, await t(e.floating), e.strategy),
                floating: {
                    x: 0,
                    y: 0,
                    width: n.width,
                    height: n.height
                }
            }
        },
        getClientRects: function(e) {
            return Array.from(e.getClientRects())
        },
        getDimensions: function(e) {
            let {
                width: t,
                height: r
            } = $(e);
            return {
                width: t,
                height: r
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
                x: r,
                y: n,
                placement: l,
                rects: i,
                platform: s,
                elements: u,
                middlewareData: c
            } = t, {
                element: f,
                padding: g = 0
            } = d(e, t) || {};
            if (null == f) return {};
            let y = E(g),
                w = {
                    x: r,
                    y: n
                },
                x = m(v(l)),
                b = h(x),
                C = await s.getDimensions(f),
                S = "y" === x,
                R = S ? "clientHeight" : "clientWidth",
                N = i.reference[b] + i.reference[x] - w[x] - i.floating[b],
                P = w[x] - i.reference[x],
                O = await (null == s.getOffsetParent ? void 0 : s.getOffsetParent(f)),
                A = O ? O[R] : 0;
            A && await (null == s.isElement ? void 0 : s.isElement(O)) || (A = u.floating[R] || i.floating[b]);
            let T = A / 2 - C[b] / 2 - 1,
                _ = o(y[S ? "top" : "left"], T),
                j = o(y[S ? "bottom" : "right"], T),
                k = A - C[b] - j,
                D = A / 2 - C[b] / 2 + (N / 2 - P / 2),
                M = a(_, o(D, k)),
                L = !c.arrow && null != p(l) && D !== M && i.reference[b] / 2 - (D < _ ? _ : j) - C[b] / 2 < 0,
                I = L ? D < _ ? D - _ : D - k : 0;
            return {
                [x]: w[x] + I,
                data: {
                    [x]: M,
                    centerOffset: D - M - I,
                    ...L && {
                        alignmentOffset: I
                    }
                },
                reset: L
            }
        }
    });
    var ep = "u" > typeof document ? r.useLayoutEffect : function() {};

    function em(e, t) {
        let r, n, l;
        if (e === t) return !0;
        if (typeof e != typeof t) return !1;
        if ("function" == typeof e && e.toString() === t.toString()) return !0;
        if (e && t && "object" == typeof e) {
            if (Array.isArray(e)) {
                if ((r = e.length) !== t.length) return !1;
                for (n = r; 0 != n--;)
                    if (!em(e[n], t[n])) return !1;
                return !0
            }
            if ((r = (l = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (n = r; 0 != n--;)
                if (!({}).hasOwnProperty.call(t, l[n])) return !1;
            for (n = r; 0 != n--;) {
                let r = l[n];
                if (("_owner" !== r || !e.$$typeof) && !em(e[r], t[r])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function eh(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function ev(e, t) {
        let r = eh(e);
        return Math.round(t * r) / r
    }

    function eg(e) {
        let t = r.useRef(e);
        return ep(() => {
            t.current = e
        }), t
    }
    e.s(["a", 0, function(e, t, r, n) {
        void 0 === n && (n = {});
        let {
            ancestorScroll: l = !0,
            ancestorResize: i = !0,
            elementResize: u = "function" == typeof ResizeObserver,
            layoutShift: c = "function" == typeof IntersectionObserver,
            animationFrame: d = !1
        } = n, f = J(e), p = l || i ? [...f ? G(f) : [], ...G(t)] : [];
        p.forEach(e => {
            l && e.addEventListener("scroll", r, {
                passive: !0
            }), i && e.addEventListener("resize", r)
        });
        let m = f && c ? function(e, t) {
                let r, n = null,
                    l = k(e);

                function i() {
                    var e;
                    clearTimeout(r), null == (e = n) || e.disconnect(), n = null
                }
                return function u(c, d) {
                    void 0 === c && (c = !1), void 0 === d && (d = 1), i();
                    let f = e.getBoundingClientRect(),
                        {
                            left: p,
                            top: m,
                            width: h,
                            height: v
                        } = f;
                    if (c || t(), !h || !v) return;
                    let g = {
                            rootMargin: -s(m) + "px " + -s(l.clientWidth - (p + h)) + "px " + -s(l.clientHeight - (m + v)) + "px " + -s(p) + "px",
                            threshold: a(0, o(1, d)) || 1
                        },
                        y = !0;

                    function w(t) {
                        let n = t[0].intersectionRatio;
                        if (n !== d) {
                            if (!y) return u();
                            n ? u(!1, n) : r = setTimeout(() => {
                                u(!1, 1e-7)
                            }, 1e3)
                        }
                        1 !== n || ed(f, e.getBoundingClientRect()) || u(), y = !1
                    }
                    try {
                        n = new IntersectionObserver(w, {
                            ...g,
                            root: l.ownerDocument
                        })
                    } catch (e) {
                        n = new IntersectionObserver(w, g)
                    }
                    n.observe(e)
                }(!0), i
            }(f, r) : null,
            h, v = -1,
            g = null;
        u && (g = new ResizeObserver(e => {
            let [n] = e;
            n && n.target === f && g && (g.unobserve(t), cancelAnimationFrame(v), v = requestAnimationFrame(() => {
                var e;
                null == (e = g) || e.observe(t)
            })), r()
        }), f && !d && g.observe(f), g.observe(t));
        let y = d ? er(e) : null;
        return d && function t() {
            let n = er(e);
            y && !ed(y, n) && r(), y = n, h = requestAnimationFrame(t)
        }(), r(), () => {
            var e;
            p.forEach(e => {
                l && e.removeEventListener("scroll", r), i && e.removeEventListener("resize", r)
            }), null == m || m(), null == (e = g) || e.disconnect(), g = null, d && cancelAnimationFrame(h)
        }
    }, "b", 0, (e, t) => {
        var r;
        return {
            ...(void 0 === (r = e) && (r = {}), {
                name: "size",
                options: r,
                async fn(e) {
                    var t, n;
                    let l, i, {
                            placement: s,
                            rects: u,
                            platform: c,
                            elements: m
                        } = e,
                        {
                            apply: h = () => {},
                            ...g
                        } = d(r, e),
                        y = await N(e, g),
                        w = f(s),
                        x = p(s),
                        b = "y" === v(s),
                        {
                            width: C,
                            height: E
                        } = u.floating;
                    "top" === w || "bottom" === w ? (l = w, i = x === (await (null == c.isRTL ? void 0 : c.isRTL(m.floating)) ? "start" : "end") ? "left" : "right") : (i = w, l = "end" === x ? "top" : "bottom");
                    let S = E - y.top - y.bottom,
                        R = C - y.left - y.right,
                        P = o(E - y[l], S),
                        O = o(C - y[i], R),
                        A = !e.middlewareData.shift,
                        T = P,
                        _ = O;
                    if (null != (t = e.middlewareData.shift) && t.enabled.x && (_ = R), null != (n = e.middlewareData.shift) && n.enabled.y && (T = S), A && !x) {
                        let e = a(y.left, 0),
                            t = a(y.right, 0),
                            r = a(y.top, 0),
                            n = a(y.bottom, 0);
                        b ? _ = C - 2 * (0 !== e || 0 !== t ? e + t : a(y.left, y.right)) : T = E - 2 * (0 !== r || 0 !== n ? r + n : a(y.top, y.bottom))
                    }
                    await h({
                        ...e,
                        availableWidth: _,
                        availableHeight: T
                    });
                    let j = await c.getDimensions(m.floating);
                    return C !== j.width || E !== j.height ? {
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
                    element: r,
                    padding: n
                } = "function" == typeof e ? e(t) : e;
                return r && ({}).hasOwnProperty.call(r, "current") ? null != r.current ? ef({
                    element: r.current,
                    padding: n
                }).fn(t) : {} : r ? ef({
                    element: r,
                    padding: n
                }).fn(t) : {}
            }
        },
        options: [e, t]
    }), "f", 0, (e, t) => {
        var r;
        return {
            ...(void 0 === (r = e) && (r = {}), {
                name: "flip",
                options: r,
                async fn(e) {
                    var t, n, l, o, a, i;
                    let s, u, c, {
                            placement: E,
                            middlewareData: S,
                            rects: R,
                            initialPlacement: P,
                            platform: O,
                            elements: A
                        } = e,
                        {
                            mainAxis: T = !0,
                            crossAxis: _ = !0,
                            fallbackPlacements: j,
                            fallbackStrategy: k = "bestFit",
                            fallbackAxisSideDirection: D = "none",
                            flipAlignment: M = !0,
                            ...L
                        } = d(r, e);
                    if (null != (t = S.arrow) && t.alignmentOffset) return {};
                    let I = f(E),
                        F = v(P),
                        W = f(P) === P,
                        z = await (null == O.isRTL ? void 0 : O.isRTL(A.floating)),
                        B = j || (W || !M ? [C(P)] : (s = C(P), [g(P), s, g(s)])),
                        V = "none" !== D;
                    !j && V && B.push(...(u = p(P), c = function(e, t, r) {
                        switch (e) {
                            case "top":
                            case "bottom":
                                return r ? t ? w : y : t ? y : w;
                            case "left":
                            case "right":
                                return t ? x : b;
                            default:
                                return []
                        }
                    }(f(P), "start" === D, z), u && (c = c.map(e => e + "-" + u), M && (c = c.concat(c.map(g)))), c));
                    let H = [P, ...B],
                        U = await N(e, L),
                        K = [],
                        X = (null == (n = S.flip) ? void 0 : n.overflows) || [];
                    if (T && K.push(U[I]), _) {
                        let e, t, r, n, l = (void 0 === (i = z) && (i = !1), e = p(E), r = h(t = m(v(E))), n = "x" === t ? e === (i ? "end" : "start") ? "right" : "left" : "start" === e ? "bottom" : "top", R.reference[r] > R.floating[r] && (n = C(n)), [n, C(n)]);
                        K.push(U[l[0]], U[l[1]])
                    }
                    if (X = [...X, {
                            placement: E,
                            overflows: K
                        }], !K.every(e => e <= 0)) {
                        let e = ((null == (l = S.flip) ? void 0 : l.index) || 0) + 1,
                            t = H[e];
                        if (t && ("alignment" !== _ || F === v(t) || X.every(e => v(e.placement) !== F || e.overflows[0] > 0))) return {
                            data: {
                                index: e,
                                overflows: X
                            },
                            reset: {
                                placement: t
                            }
                        };
                        let r = null == (o = X.filter(e => e.overflows[0] <= 0).sort((e, t) => e.overflows[1] - t.overflows[1])[0]) ? void 0 : o.placement;
                        if (!r) switch (k) {
                            case "bestFit": {
                                let e = null == (a = X.filter(e => {
                                    if (V) {
                                        let t = v(e.placement);
                                        return t === F || "y" === t
                                    }
                                    return !0
                                }).map(e => [e.placement, e.overflows.filter(e => e > 0).reduce((e, t) => e + t, 0)]).sort((e, t) => e[1] - t[1])[0]) ? void 0 : a[0];
                                e && (r = e);
                                break
                            }
                            case "initialPlacement":
                                r = P
                        }
                        if (E !== r) return {
                            reset: {
                                placement: r
                            }
                        }
                    }
                    return {}
                }
            }),
            options: [e, t]
        }
    }, "h", 0, (e, t) => {
        var r;
        return {
            ...(void 0 === (r = e) && (r = {}), {
                name: "hide",
                options: r,
                async fn(e) {
                    let {
                        rects: t
                    } = e, {
                        strategy: n = "referenceHidden",
                        ...l
                    } = d(r, e);
                    switch (n) {
                        case "referenceHidden": {
                            let r = P(await N(e, {
                                ...l,
                                elementContext: "reference"
                            }), t.reference);
                            return {
                                data: {
                                    referenceHiddenOffsets: r,
                                    referenceHidden: O(r)
                                }
                            }
                        }
                        case "escaped": {
                            let r = P(await N(e, {
                                ...l,
                                altBoundary: !0
                            }), t.floating);
                            return {
                                data: {
                                    escapedOffsets: r,
                                    escaped: O(r)
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
        var r;
        return {
            ...(void 0 === (r = e) && (r = {}), {
                options: r,
                fn(e) {
                    let {
                        x: t,
                        y: n,
                        placement: l,
                        rects: o,
                        middlewareData: a
                    } = e, {
                        offset: i = 0,
                        mainAxis: s = !0,
                        crossAxis: u = !0
                    } = d(r, e), c = {
                        x: t,
                        y: n
                    }, p = v(l), h = m(p), g = c[h], y = c[p], w = d(i, e), x = "number" == typeof w ? {
                        mainAxis: w,
                        crossAxis: 0
                    } : {
                        mainAxis: 0,
                        crossAxis: 0,
                        ...w
                    };
                    if (s) {
                        let e = "y" === h ? "height" : "width",
                            t = o.reference[h] - o.floating[e] + x.mainAxis,
                            r = o.reference[h] + o.reference[e] - x.mainAxis;
                        g < t ? g = t : g > r && (g = r)
                    }
                    if (u) {
                        var b, C;
                        let e = "y" === h ? "width" : "height",
                            t = A.has(f(l)),
                            r = o.reference[p] - o.floating[e] + (t && (null == (b = a.offset) ? void 0 : b[p]) || 0) + (t ? 0 : x.crossAxis),
                            n = o.reference[p] + o.reference[e] + (t ? 0 : (null == (C = a.offset) ? void 0 : C[p]) || 0) - (t ? x.crossAxis : 0);
                        y < r ? y = r : y > n && (y = n)
                    }
                    return {
                        [h]: g,
                        [p]: y
                    }
                }
            }),
            options: [e, t]
        }
    }, "o", 0, (e, t) => {
        var r;
        return {
            ...(void 0 === (r = e) && (r = 0), {
                name: "offset",
                options: r,
                async fn(e) {
                    var t, n;
                    let {
                        x: l,
                        y: o,
                        placement: a,
                        middlewareData: i
                    } = e, s = await async function(e, t) {
                        let {
                            placement: r,
                            platform: n,
                            elements: l
                        } = e, o = await (null == n.isRTL ? void 0 : n.isRTL(l.floating)), a = f(r), i = p(r), s = "y" === v(r), u = A.has(a) ? -1 : 1, c = o && s ? -1 : 1, m = d(t, e), {
                            mainAxis: h,
                            crossAxis: g,
                            alignmentAxis: y
                        } = "number" == typeof m ? {
                            mainAxis: m,
                            crossAxis: 0,
                            alignmentAxis: null
                        } : {
                            mainAxis: m.mainAxis || 0,
                            crossAxis: m.crossAxis || 0,
                            alignmentAxis: m.alignmentAxis
                        };
                        return i && "number" == typeof y && (g = "end" === i ? -1 * y : y), s ? {
                            x: g * c,
                            y: h * u
                        } : {
                            x: h * u,
                            y: g * c
                        }
                    }(e, r);
                    return a === (null == (t = i.offset) ? void 0 : t.placement) && null != (n = i.arrow) && n.alignmentOffset ? {} : {
                        x: l + s.x,
                        y: o + s.y,
                        data: {
                            ...s,
                            placement: a
                        }
                    }
                }
            }),
            options: [e, t]
        }
    }, "s", 0, (e, t) => {
        var r;
        return {
            ...(void 0 === (r = e) && (r = {}), {
                name: "shift",
                options: r,
                async fn(e) {
                    let {
                        x: t,
                        y: n,
                        placement: l
                    } = e, {
                        mainAxis: i = !0,
                        crossAxis: s = !1,
                        limiter: u = {
                            fn: e => {
                                let {
                                    x: t,
                                    y: r
                                } = e;
                                return {
                                    x: t,
                                    y: r
                                }
                            }
                        },
                        ...c
                    } = d(r, e), p = {
                        x: t,
                        y: n
                    }, h = await N(e, c), g = v(f(l)), y = m(g), w = p[y], x = p[g];
                    if (i) {
                        let e = "y" === y ? "bottom" : "right";
                        w = a(w + h["y" === y ? "top" : "left"], o(w, w - h[e]))
                    }
                    if (s) {
                        let e = "y" === g ? "bottom" : "right";
                        x = a(x + h["y" === g ? "top" : "left"], o(x, x - h[e]))
                    }
                    let b = u.fn({
                        ...e,
                        [y]: w,
                        [g]: x
                    });
                    return {
                        ...b,
                        data: {
                            x: b.x - t,
                            y: b.y - n,
                            enabled: {
                                [y]: i,
                                [g]: s
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
            strategy: l = "absolute",
            middleware: o = [],
            platform: a,
            elements: {
                reference: i,
                floating: s
            } = {},
            transform: u = !0,
            whileElementsMounted: c,
            open: d
        } = e, [f, p] = r.useState({
            x: 0,
            y: 0,
            strategy: l,
            placement: t,
            middlewareData: {},
            isPositioned: !1
        }), [m, h] = r.useState(o);
        em(m, o) || h(o);
        let [v, g] = r.useState(null), [y, w] = r.useState(null), x = r.useCallback(e => {
            e !== S.current && (S.current = e, g(e))
        }, []), b = r.useCallback(e => {
            e !== N.current && (N.current = e, w(e))
        }, []), C = i || v, E = s || y, S = r.useRef(null), N = r.useRef(null), P = r.useRef(f), O = null != c, A = eg(c), T = eg(a), _ = eg(d), j = r.useCallback(() => {
            var e, r;
            let o, a, i;
            if (!S.current || !N.current) return;
            let s = {
                placement: t,
                strategy: l,
                middleware: m
            };
            T.current && (s.platform = T.current), (e = S.current, r = N.current, o = new Map, i = {
                ...(a = {
                    platform: ec,
                    ...s
                }).platform,
                _c: o
            }, (async (e, t, r) => {
                let {
                    placement: n = "bottom",
                    strategy: l = "absolute",
                    middleware: o = [],
                    platform: a
                } = r, i = o.filter(Boolean), s = await (null == a.isRTL ? void 0 : a.isRTL(t)), u = await a.getElementRects({
                    reference: e,
                    floating: t,
                    strategy: l
                }), {
                    x: c,
                    y: d
                } = R(u, n, s), f = n, p = {}, m = 0;
                for (let r = 0; r < i.length; r++) {
                    let {
                        name: o,
                        fn: h
                    } = i[r], {
                        x: v,
                        y: g,
                        data: y,
                        reset: w
                    } = await h({
                        x: c,
                        y: d,
                        initialPlacement: n,
                        placement: f,
                        strategy: l,
                        middlewareData: p,
                        rects: u,
                        platform: a,
                        elements: {
                            reference: e,
                            floating: t
                        }
                    });
                    c = null != v ? v : c, d = null != g ? g : d, p = {
                        ...p,
                        [o]: {
                            ...p[o],
                            ...y
                        }
                    }, w && m <= 50 && (m++, "object" == typeof w && (w.placement && (f = w.placement), w.rects && (u = !0 === w.rects ? await a.getElementRects({
                        reference: e,
                        floating: t,
                        strategy: l
                    }) : w.rects), {
                        x: c,
                        y: d
                    } = R(u, f, s)), r = -1)
                }
                return {
                    x: c,
                    y: d,
                    placement: f,
                    strategy: l,
                    middlewareData: p
                }
            })(e, r, {
                ...a,
                platform: i
            })).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== _.current
                };
                k.current && !em(P.current, t) && (P.current = t, n.flushSync(() => {
                    p(t)
                }))
            })
        }, [m, t, l, T, _]);
        ep(() => {
            !1 === d && P.current.isPositioned && (P.current.isPositioned = !1, p(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [d]);
        let k = r.useRef(!1);
        ep(() => (k.current = !0, () => {
            k.current = !1
        }), []), ep(() => {
            if (C && (S.current = C), E && (N.current = E), C && E) {
                if (A.current) return A.current(C, E, j);
                j()
            }
        }, [C, E, j, A, O]);
        let D = r.useMemo(() => ({
                reference: S,
                floating: N,
                setReference: x,
                setFloating: b
            }), [x, b]),
            M = r.useMemo(() => ({
                reference: C,
                floating: E
            }), [C, E]),
            L = r.useMemo(() => {
                let e = {
                    position: l,
                    left: 0,
                    top: 0
                };
                if (!M.floating) return e;
                let t = ev(M.floating, f.x),
                    r = ev(M.floating, f.y);
                return u ? {
                    ...e,
                    transform: "translate(" + t + "px, " + r + "px)",
                    ...eh(M.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: l,
                    left: t,
                    top: r
                }
            }, [l, u, M.floating, f.x, f.y]);
        return r.useMemo(() => ({
            ...f,
            update: j,
            refs: D,
            elements: M,
            floatingStyles: L
        }), [f, j, D, M, L])
    }])
}, 675038, e => {
    "use strict";
    e.s(["c", 0, function(e, t) {
        let [r, n] = t;
        return Math.min(n, Math.max(r, e))
    }])
}, 127962, e => {
    "use strict";
    var t, r = e.i(416340),
        n = e.i(830999);
    e.i(149285);
    var l = e.i(221628);

    function o(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }
    var a = Symbol("radix.slottable");

    function i(e) {
        return r.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === a
    }
    var s = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
            var n, a;
            let s, u, c, d = (a = n = "Primitive.".concat(t), (s = r.forwardRef((e, t) => {
                    let {
                        children: n,
                        ...l
                    } = e;
                    if (r.isValidElement(n)) {
                        var a, i;
                        let e, s = (e = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning ? n.ref : (e = null == (i = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : i.get) && "isReactWarning" in e && e.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                            u = function(e, t) {
                                let r = {
                                    ...t
                                };
                                for (let n in t) {
                                    let l = e[n],
                                        o = t[n];
                                    /^on[A-Z]/.test(n) ? l && o ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        o(...t), l(...t)
                                    } : l && (r[n] = l) : "style" === n ? r[n] = {
                                        ...l,
                                        ...o
                                    } : "className" === n && (r[n] = [l, o].filter(Boolean).join(" "))
                                }
                                return {
                                    ...e,
                                    ...r
                                }
                            }(l, n.props);
                        return n.type !== r.Fragment && (u.ref = t ? function() {
                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                            return e => {
                                let r = !1,
                                    n = t.map(t => {
                                        let n = o(t, e);
                                        return r || "function" != typeof n || (r = !0), n
                                    });
                                if (r) return () => {
                                    for (let e = 0; e < n.length; e++) {
                                        let r = n[e];
                                        "function" == typeof r ? r() : o(t[e], null)
                                    }
                                }
                            }
                        }(t, s) : s), r.cloneElement(n, u)
                    }
                    return r.Children.count(n) > 1 ? r.Children.only(null) : null
                })).displayName = "".concat(a, ".SlotClone"), u = s, (c = r.forwardRef((e, t) => {
                    let {
                        children: n,
                        ...o
                    } = e, a = r.Children.toArray(n), s = a.find(i);
                    if (s) {
                        let e = s.props.children,
                            n = a.map(t => t === s ? r.Children.count(e) > 1 ? r.Children.only(null) : r.isValidElement(e) ? e.props.children : null : t);
                        return (0, l.jsx)(u, {
                            ...o,
                            ref: t,
                            children: r.isValidElement(e) ? r.cloneElement(e, void 0, n) : null
                        })
                    }
                    return (0, l.jsx)(u, {
                        ...o,
                        ref: t,
                        children: n
                    })
                })).displayName = "".concat(n, ".Slot"), c),
                f = r.forwardRef((e, r) => {
                    let {
                        asChild: n,
                        ...o
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, l.jsx)(n ? d : t, {
                        ...o,
                        ref: r
                    })
                });
            return f.displayName = "Primitive.".concat(t), {
                ...e,
                [t]: f
            }
        }, {}),
        u = r.forwardRef((e, t) => {
            let {
                children: r,
                width: n = 10,
                height: o = 5,
                ...a
            } = e;
            return (0, l.jsx)(s.svg, {
                ...a,
                ref: t,
                width: n,
                height: o,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? r : (0, l.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });

    function c(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function d() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return e => {
            let r = !1,
                n = t.map(t => {
                    let n = c(t, e);
                    return r || "function" != typeof n || (r = !0), n
                });
            if (r) return () => {
                for (let e = 0; e < n.length; e++) {
                    let r = n[e];
                    "function" == typeof r ? r() : c(t[e], null)
                }
            }
        }
    }

    function f() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return r.useCallback(d(...t), t)
    }
    u.displayName = "Arrow";
    var p = Symbol("radix.slottable");

    function m(e) {
        return r.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === p
    }
    var h = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
            var n, o;
            let a, i, s, u = (o = n = "Primitive.".concat(t), (a = r.forwardRef((e, t) => {
                    let {
                        children: n,
                        ...l
                    } = e;
                    if (r.isValidElement(n)) {
                        var o, a;
                        let e, i = (e = null == (o = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? n.ref : (e = null == (a = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                            s = function(e, t) {
                                let r = {
                                    ...t
                                };
                                for (let n in t) {
                                    let l = e[n],
                                        o = t[n];
                                    /^on[A-Z]/.test(n) ? l && o ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        o(...t), l(...t)
                                    } : l && (r[n] = l) : "style" === n ? r[n] = {
                                        ...l,
                                        ...o
                                    } : "className" === n && (r[n] = [l, o].filter(Boolean).join(" "))
                                }
                                return {
                                    ...e,
                                    ...r
                                }
                            }(l, n.props);
                        return n.type !== r.Fragment && (s.ref = t ? d(t, i) : i), r.cloneElement(n, s)
                    }
                    return r.Children.count(n) > 1 ? r.Children.only(null) : null
                })).displayName = "".concat(o, ".SlotClone"), i = a, (s = r.forwardRef((e, t) => {
                    let {
                        children: n,
                        ...o
                    } = e, a = r.Children.toArray(n), s = a.find(m);
                    if (s) {
                        let e = s.props.children,
                            n = a.map(t => t === s ? r.Children.count(e) > 1 ? r.Children.only(null) : r.isValidElement(e) ? e.props.children : null : t);
                        return (0, l.jsx)(i, {
                            ...o,
                            ref: t,
                            children: r.isValidElement(e) ? r.cloneElement(e, void 0, n) : null
                        })
                    }
                    return (0, l.jsx)(i, {
                        ...o,
                        ref: t,
                        children: n
                    })
                })).displayName = "".concat(n, ".Slot"), s),
                c = r.forwardRef((e, r) => {
                    let {
                        asChild: n,
                        ...o
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, l.jsx)(n ? u : t, {
                        ...o,
                        ref: r
                    })
                });
            return c.displayName = "Primitive.".concat(t), {
                ...e,
                [t]: c
            }
        }, {}),
        v = (null == (t = globalThis) ? void 0 : t.document) ? r.useLayoutEffect : () => {},
        g = "Popper",
        [y, w] = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                n = [],
                o = () => {
                    let t = n.map(e => r.createContext(e));
                    return function(n) {
                        let l = (null == n ? void 0 : n[e]) || t;
                        return r.useMemo(() => ({
                            ["__scope".concat(e)]: {
                                ...n,
                                [e]: l
                            }
                        }), [n, l])
                    }
                };
            return o.scopeName = e, [function(t, o) {
                let a = r.createContext(o),
                    i = n.length;
                n = [...n, o];
                let s = t => {
                    var n;
                    let {
                        scope: o,
                        children: s,
                        ...u
                    } = t, c = (null == o || null == (n = o[e]) ? void 0 : n[i]) || a, d = r.useMemo(() => u, Object.values(u));
                    return (0, l.jsx)(c.Provider, {
                        value: d,
                        children: s
                    })
                };
                return s.displayName = t + "Provider", [s, function(n, l) {
                    var s;
                    let u = (null == l || null == (s = l[e]) ? void 0 : s[i]) || a,
                        c = r.useContext(u);
                    if (c) return c;
                    if (void 0 !== o) return o;
                    throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                }]
            }, function() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                let l = t[0];
                if (1 === t.length) return l;
                let o = () => {
                    let e = t.map(e => ({
                        useScope: e(),
                        scopeName: e.scopeName
                    }));
                    return function(t) {
                        let n = e.reduce((e, r) => {
                            let {
                                useScope: n,
                                scopeName: l
                            } = r;
                            return {
                                ...e,
                                ...n(t)["__scope".concat(l)]
                            }
                        }, {});
                        return r.useMemo(() => ({
                            ["__scope".concat(l.scopeName)]: n
                        }), [n])
                    }
                };
                return o.scopeName = l.scopeName, o
            }(o, ...t)]
        }(g),
        [x, b] = y(g),
        C = e => {
            let {
                __scopePopper: t,
                children: n
            } = e, [o, a] = r.useState(null);
            return (0, l.jsx)(x, {
                scope: t,
                anchor: o,
                onAnchorChange: a,
                children: n
            })
        };
    C.displayName = g;
    var E = "PopperAnchor",
        S = r.forwardRef((e, t) => {
            let {
                __scopePopper: n,
                virtualRef: o,
                ...a
            } = e, i = b(E, n), s = r.useRef(null), u = f(t, s);
            return r.useEffect(() => {
                i.onAnchorChange((null == o ? void 0 : o.current) || s.current)
            }), o ? null : (0, l.jsx)(h.div, {
                ...a,
                ref: u
            })
        });
    S.displayName = E;
    var R = "PopperContent",
        [N, P] = y(R),
        O = r.forwardRef((e, t) => {
            var o, a, i, s, u, c, d, p;
            let m, {
                    __scopePopper: g,
                    side: y = "bottom",
                    sideOffset: w = 0,
                    align: x = "center",
                    alignOffset: C = 0,
                    arrowPadding: E = 0,
                    avoidCollisions: S = !0,
                    collisionBoundary: P = [],
                    collisionPadding: O = 0,
                    sticky: A = "partial",
                    hideWhenDetached: T = !1,
                    updatePositionStrategy: _ = "optimized",
                    onPlaced: M,
                    ...L
                } = e,
                I = b(R, g),
                [F, W] = r.useState(null),
                z = f(t, e => W(e)),
                [B, V] = r.useState(null),
                H = function(e) {
                    let [t, n] = r.useState(void 0);
                    return v(() => {
                        if (e) {
                            n({
                                width: e.offsetWidth,
                                height: e.offsetHeight
                            });
                            let t = new ResizeObserver(t => {
                                let r, l;
                                if (!Array.isArray(t) || !t.length) return;
                                let o = t[0];
                                if ("borderBoxSize" in o) {
                                    let e = o.borderBoxSize,
                                        t = Array.isArray(e) ? e[0] : e;
                                    r = t.inlineSize, l = t.blockSize
                                } else r = e.offsetWidth, l = e.offsetHeight;
                                n({
                                    width: r,
                                    height: l
                                })
                            });
                            return t.observe(e, {
                                box: "border-box"
                            }), () => t.unobserve(e)
                        }
                        n(void 0)
                    }, [e]), t
                }(B),
                U = null != (o = null == H ? void 0 : H.width) ? o : 0,
                K = null != (a = null == H ? void 0 : H.height) ? a : 0,
                X = "number" == typeof O ? O : {
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    ...O
                },
                Y = Array.isArray(P) ? P : [P],
                q = Y.length > 0,
                G = {
                    padding: X,
                    boundary: Y.filter(j),
                    altBoundary: q
                },
                {
                    refs: Z,
                    floatingStyles: $,
                    placement: J,
                    isPositioned: Q,
                    middlewareData: ee
                } = (0, n.u)({
                    strategy: "fixed",
                    placement: y + ("center" !== x ? "-" + x : ""),
                    whileElementsMounted: function() {
                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        return (0, n.a)(...t, {
                            animationFrame: "always" === _
                        })
                    },
                    elements: {
                        reference: I.anchor
                    },
                    middleware: [(0, n.o)({
                        mainAxis: w + K,
                        alignmentAxis: C
                    }), S && (0, n.s)({
                        mainAxis: !0,
                        crossAxis: !1,
                        limiter: "partial" === A ? (0, n.l)() : void 0,
                        ...G
                    }), S && (0, n.f)({
                        ...G
                    }), (0, n.b)({
                        ...G,
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
                    }), B && (0, n.c)({
                        element: B,
                        padding: E
                    }), k({
                        arrowWidth: U,
                        arrowHeight: K
                    }), T && (0, n.h)({
                        strategy: "referenceHidden",
                        ...G
                    })]
                }),
                [et, er] = D(J),
                en = (m = r.useRef(M), r.useEffect(() => {
                    m.current = M
                }), r.useMemo(() => function() {
                    for (var e, t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    return null == (e = m.current) ? void 0 : e.call(m, ...r)
                }, []));
            v(() => {
                Q && (null == en || en())
            }, [Q, en]);
            let el = null == (i = ee.arrow) ? void 0 : i.x,
                eo = null == (s = ee.arrow) ? void 0 : s.y,
                ea = 0 !== (null == (u = ee.arrow) ? void 0 : u.centerOffset),
                [ei, es] = r.useState();
            return v(() => {
                F && es(window.getComputedStyle(F).zIndex)
            }, [F]), (0, l.jsx)("div", {
                ref: Z.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...$,
                    transform: Q ? $.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: ei,
                    "--radix-popper-transform-origin": [null == (c = ee.transformOrigin) ? void 0 : c.x, null == (d = ee.transformOrigin) ? void 0 : d.y].join(" "),
                    ...(null == (p = ee.hide) ? void 0 : p.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, l.jsx)(N, {
                    scope: g,
                    placedSide: et,
                    onArrowChange: V,
                    arrowX: el,
                    arrowY: eo,
                    shouldHideArrow: ea,
                    children: (0, l.jsx)(h.div, {
                        "data-side": et,
                        "data-align": er,
                        ...L,
                        ref: z,
                        style: {
                            ...L.style,
                            animation: Q ? void 0 : "none"
                        }
                    })
                })
            })
        });
    O.displayName = R;
    var A = "PopperArrow",
        T = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        _ = r.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, o = P(A, r), a = T[o.placedSide];
            return (0, l.jsx)("span", {
                ref: o.onArrowChange,
                style: {
                    position: "absolute",
                    left: o.arrowX,
                    top: o.arrowY,
                    [a]: 0,
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
                children: (0, l.jsx)(u, {
                    ...n,
                    ref: t,
                    style: {
                        ...n.style,
                        display: "block"
                    }
                })
            })
        });

    function j(e) {
        return null !== e
    }
    _.displayName = A;
    var k = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, n, l, o, a;
            let {
                placement: i,
                rects: s,
                middlewareData: u
            } = t, c = 0 !== (null == (l = u.arrow) ? void 0 : l.centerOffset), d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, m] = D(i), h = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], v = (null != (r = null == (o = u.arrow) ? void 0 : o.x) ? r : 0) + d / 2, g = (null != (n = null == (a = u.arrow) ? void 0 : a.y) ? n : 0) + f / 2, y = "", w = "";
            return "bottom" === p ? (y = c ? h : "".concat(v, "px"), w = -f + "px") : "top" === p ? (y = c ? h : "".concat(v, "px"), w = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = -f + "px", w = c ? h : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), w = c ? h : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: w
                }
            }
        }
    });

    function D(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["A", 0, S, "C", 0, O, "R", 0, C, "a", 0, _, "c", 0, w])
}, 932157, e => {
    "use strict";
    var t = e.i(416340);
    e.i(221628);
    var r = t.createContext(void 0);
    e.s(["u", 0, function(e) {
        let n = t.useContext(r);
        return e || n || "ltr"
    }])
}, 810510, e => {
    "use strict";
    var t, r = e.i(416340),
        n = e.i(221628),
        l = e.i(926396),
        o = e.i(647409),
        a = e.i(127962);

    function i(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(n) {
            if (null == e || e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
        }
    }

    function s(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function u() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return e => {
            let r = !1,
                n = t.map(t => {
                    let n = s(t, e);
                    return r || "function" != typeof n || (r = !0), n
                });
            if (r) return () => {
                for (let e = 0; e < n.length; e++) {
                    let r = n[e];
                    "function" == typeof r ? r() : s(t[e], null)
                }
            }
        }
    }

    function c() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return r.useCallback(u(...t), t)
    }
    e.i(149285);
    var d = (null == (t = globalThis) ? void 0 : t.document) ? r.useLayoutEffect : () => {},
        f = e => {
            var t, n;
            let l, {
                    present: o,
                    children: a
                } = e,
                i = function(e) {
                    var t, n;
                    let [l, o] = r.useState(), a = r.useRef({}), i = r.useRef(e), s = r.useRef("none"), [u, c] = (t = e ? "mounted" : "unmounted", n = {
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
                    }, r.useReducer((e, t) => {
                        var r;
                        return null != (r = n[e][t]) ? r : e
                    }, t));
                    return r.useEffect(() => {
                        let e = p(a.current);
                        s.current = "mounted" === u ? e : "none"
                    }, [u]), d(() => {
                        let t = a.current,
                            r = i.current;
                        if (r !== e) {
                            let n = s.current,
                                l = p(t);
                            e ? c("MOUNT") : "none" === l || "none" === (null == t ? void 0 : t.display) ? c("UNMOUNT") : c(r && n !== l ? "ANIMATION_OUT" : "UNMOUNT"), i.current = e
                        }
                    }, [e, c]), d(() => {
                        if (l) {
                            var e;
                            let t, r = null != (e = l.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = p(a.current).includes(e.animationName);
                                    if (e.target === l && n && (c("ANIMATION_END"), !i.current)) {
                                        let e = l.style.animationFillMode;
                                        l.style.animationFillMode = "forwards", t = r.setTimeout(() => {
                                            "forwards" === l.style.animationFillMode && (l.style.animationFillMode = e)
                                        })
                                    }
                                },
                                o = e => {
                                    e.target === l && (s.current = p(a.current))
                                };
                            return l.addEventListener("animationstart", o), l.addEventListener("animationcancel", n), l.addEventListener("animationend", n), () => {
                                r.clearTimeout(t), l.removeEventListener("animationstart", o), l.removeEventListener("animationcancel", n), l.removeEventListener("animationend", n)
                            }
                        }
                        c("ANIMATION_END")
                    }, [l, c]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(u),
                        ref: r.useCallback(e => {
                            e && (a.current = getComputedStyle(e)), o(e)
                        }, [])
                    }
                }(o),
                s = "function" == typeof a ? a({
                    present: i.isPresent
                }) : r.Children.only(a),
                u = c(i.ref, (l = null == (t = Object.getOwnPropertyDescriptor(s.props, "ref")) ? void 0 : t.get) && "isReactWarning" in l && l.isReactWarning ? s.ref : (l = null == (n = Object.getOwnPropertyDescriptor(s, "ref")) ? void 0 : n.get) && "isReactWarning" in l && l.isReactWarning ? s.props.ref : s.props.ref || s.ref);
            return "function" == typeof a || i.isPresent ? r.cloneElement(s, {
                ref: u
            }) : null
        };

    function p(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }

    function m(e) {
        var t;
        let l, o = (t = e, (l = r.forwardRef((e, t) => {
                let {
                    children: n,
                    ...l
                } = e;
                if (r.isValidElement(n)) {
                    var o, a;
                    let e, i = (e = null == (o = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? n.ref : (e = null == (a = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                        s = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let l = e[n],
                                    o = t[n];
                                /^on[A-Z]/.test(n) ? l && o ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    o(...t), l(...t)
                                } : l && (r[n] = l) : "style" === n ? r[n] = {
                                    ...l,
                                    ...o
                                } : "className" === n && (r[n] = [l, o].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(l, n.props);
                    return n.type !== r.Fragment && (s.ref = t ? u(t, i) : i), r.cloneElement(n, s)
                }
                return r.Children.count(n) > 1 ? r.Children.only(null) : null
            })).displayName = "".concat(t, ".SlotClone"), l),
            a = r.forwardRef((e, t) => {
                let {
                    children: l,
                    ...a
                } = e, i = r.Children.toArray(l), s = i.find(v);
                if (s) {
                    let e = s.props.children,
                        l = i.map(t => t === s ? r.Children.count(e) > 1 ? r.Children.only(null) : r.isValidElement(e) ? e.props.children : null : t);
                    return (0, n.jsx)(o, {
                        ...a,
                        ref: t,
                        children: r.isValidElement(e) ? r.cloneElement(e, void 0, l) : null
                    })
                }
                return (0, n.jsx)(o, {
                    ...a,
                    ref: t,
                    children: l
                })
            });
        return a.displayName = "".concat(e, ".Slot"), a
    }
    f.displayName = "Presence";
    var h = Symbol("radix.slottable");

    function v(e) {
        return r.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === h
    }
    var g = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
        let l = m("Primitive.".concat(t)),
            o = r.forwardRef((e, r) => {
                let {
                    asChild: o,
                    ...a
                } = e;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, n.jsx)(o ? l : t, {
                    ...a,
                    ref: r
                })
            });
        return o.displayName = "Primitive.".concat(t), {
            ...e,
            [t]: o
        }
    }, {});

    function y(e) {
        let t = r.useRef(e);
        return r.useEffect(() => {
            t.current = e
        }), r.useMemo(() => function() {
            for (var e, r = arguments.length, n = Array(r), l = 0; l < r; l++) n[l] = arguments[l];
            return null == (e = t.current) ? void 0 : e.call(t, ...n)
        }, [])
    }
    var w = "Popover",
        [x, b] = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                l = [],
                o = () => {
                    let t = l.map(e => r.createContext(e));
                    return function(n) {
                        let l = (null == n ? void 0 : n[e]) || t;
                        return r.useMemo(() => ({
                            ["__scope".concat(e)]: {
                                ...n,
                                [e]: l
                            }
                        }), [n, l])
                    }
                };
            return o.scopeName = e, [function(t, o) {
                let a = r.createContext(o),
                    i = l.length;
                l = [...l, o];
                let s = t => {
                    var l;
                    let {
                        scope: o,
                        children: s,
                        ...u
                    } = t, c = (null == o || null == (l = o[e]) ? void 0 : l[i]) || a, d = r.useMemo(() => u, Object.values(u));
                    return (0, n.jsx)(c.Provider, {
                        value: d,
                        children: s
                    })
                };
                return s.displayName = t + "Provider", [s, function(n, l) {
                    var s;
                    let u = (null == l || null == (s = l[e]) ? void 0 : s[i]) || a,
                        c = r.useContext(u);
                    if (c) return c;
                    if (void 0 !== o) return o;
                    throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                }]
            }, function() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                let l = t[0];
                if (1 === t.length) return l;
                let o = () => {
                    let e = t.map(e => ({
                        useScope: e(),
                        scopeName: e.scopeName
                    }));
                    return function(t) {
                        let n = e.reduce((e, r) => {
                            let {
                                useScope: n,
                                scopeName: l
                            } = r;
                            return {
                                ...e,
                                ...n(t)["__scope".concat(l)]
                            }
                        }, {});
                        return r.useMemo(() => ({
                            ["__scope".concat(l.scopeName)]: n
                        }), [n])
                    }
                };
                return o.scopeName = l.scopeName, o
            }(o, ...t)]
        }(w, [a.c]),
        C = (0, a.c)(),
        [E, S] = x(w),
        R = e => {
            let {
                __scopePopover: t,
                children: l,
                open: i,
                defaultOpen: s,
                onOpenChange: u,
                modal: c = !1
            } = e, d = C(t), f = r.useRef(null), [p, m] = r.useState(!1), [h = !1, v] = function(e) {
                let {
                    prop: t,
                    defaultProp: n,
                    onChange: l = () => {}
                } = e, [o, a] = function(e) {
                    let {
                        defaultProp: t,
                        onChange: n
                    } = e, l = r.useState(t), [o] = l, a = r.useRef(o), i = y(n);
                    return r.useEffect(() => {
                        a.current !== o && (i(o), a.current = o)
                    }, [o, a, i]), l
                }({
                    defaultProp: n,
                    onChange: l
                }), i = void 0 !== t, s = i ? t : o, u = y(l);
                return [s, r.useCallback(e => {
                    if (i) {
                        let r = "function" == typeof e ? e(t) : e;
                        r !== t && u(r)
                    } else a(e)
                }, [i, t, a, u])]
            }({
                prop: i,
                defaultProp: s,
                onChange: u
            });
            return (0, n.jsx)(a.R, {
                ...d,
                children: (0, n.jsx)(E, {
                    scope: t,
                    contentId: (0, o.u)(),
                    triggerRef: f,
                    open: h,
                    onOpenChange: v,
                    onOpenToggle: r.useCallback(() => v(e => !e), [v]),
                    hasCustomAnchor: p,
                    onCustomAnchorAdd: r.useCallback(() => m(!0), []),
                    onCustomAnchorRemove: r.useCallback(() => m(!1), []),
                    modal: c,
                    children: l
                })
            })
        };
    R.displayName = w;
    var N = "PopoverAnchor",
        P = r.forwardRef((e, t) => {
            let {
                __scopePopover: l,
                ...o
            } = e, i = S(N, l), s = C(l), {
                onCustomAnchorAdd: u,
                onCustomAnchorRemove: c
            } = i;
            return r.useEffect(() => (u(), () => c()), [u, c]), (0, n.jsx)(a.A, {
                ...s,
                ...o,
                ref: t
            })
        });
    P.displayName = N;
    var O = "PopoverTrigger",
        A = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...l
            } = e, o = S(O, r), s = C(r), u = c(t, o.triggerRef), d = (0, n.jsx)(g.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": o.open,
                "aria-controls": o.contentId,
                "data-state": H(o.open),
                ...l,
                ref: u,
                onClick: i(e.onClick, o.onOpenToggle)
            });
            return o.hasCustomAnchor ? d : (0, n.jsx)(a.A, {
                asChild: !0,
                ...s,
                children: d
            })
        });
    A.displayName = O;
    var T = "PopoverPortal",
        [_, j] = x(T, {
            forceMount: void 0
        }),
        k = e => {
            let {
                __scopePopover: t,
                forceMount: r,
                children: o,
                container: a
            } = e, i = S(T, t);
            return (0, n.jsx)(_, {
                scope: t,
                forceMount: r,
                children: (0, n.jsx)(f, {
                    present: r || i.open,
                    children: (0, n.jsx)(l.P, {
                        asChild: !0,
                        container: a,
                        children: o
                    })
                })
            })
        };
    k.displayName = T;
    var D = "PopoverContent",
        M = r.forwardRef((e, t) => {
            let r = j(D, e.__scopePopover),
                {
                    forceMount: l = r.forceMount,
                    ...o
                } = e,
                a = S(D, e.__scopePopover);
            return (0, n.jsx)(f, {
                present: l || a.open,
                children: a.modal ? (0, n.jsx)(I, {
                    ...o,
                    ref: t
                }) : (0, n.jsx)(F, {
                    ...o,
                    ref: t
                })
            })
        });
    M.displayName = D;
    var L = m("PopoverContent.RemoveScroll"),
        I = r.forwardRef((e, t) => {
            let o = S(D, e.__scopePopover),
                a = r.useRef(null),
                s = c(t, a),
                u = r.useRef(!1);
            return r.useEffect(() => {
                let e = a.current;
                if (e) return (0, l.h)(e)
            }, []), (0, n.jsx)(l.R, {
                as: L,
                allowPinchZoom: !0,
                children: (0, n.jsx)(W, {
                    ...e,
                    ref: s,
                    trapFocus: o.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: i(e.onCloseAutoFocus, e => {
                        var t;
                        e.preventDefault(), u.current || null == (t = o.triggerRef.current) || t.focus()
                    }),
                    onPointerDownOutside: i(e.onPointerDownOutside, e => {
                        let t = e.detail.originalEvent,
                            r = 0 === t.button && !0 === t.ctrlKey;
                        u.current = 2 === t.button || r
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: i(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        F = r.forwardRef((e, t) => {
            let l = S(D, e.__scopePopover),
                o = r.useRef(!1),
                a = r.useRef(!1);
            return (0, n.jsx)(W, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var r, n;
                    null == (r = e.onCloseAutoFocus) || r.call(e, t), t.defaultPrevented || (o.current || null == (n = l.triggerRef.current) || n.focus(), t.preventDefault()), o.current = !1, a.current = !1
                },
                onInteractOutside: t => {
                    var r, n;
                    null == (r = e.onInteractOutside) || r.call(e, t), t.defaultPrevented || (o.current = !0, "pointerdown" === t.detail.originalEvent.type && (a.current = !0));
                    let i = t.target;
                    (null == (n = l.triggerRef.current) ? void 0 : n.contains(i)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && a.current && t.preventDefault()
                }
            })
        }),
        W = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                trapFocus: o,
                onOpenAutoFocus: i,
                onCloseAutoFocus: s,
                disableOutsidePointerEvents: u,
                onEscapeKeyDown: c,
                onPointerDownOutside: d,
                onFocusOutside: f,
                onInteractOutside: p,
                ...m
            } = e, h = S(D, r), v = C(r);
            return (0, l.u)(), (0, n.jsx)(l.F, {
                asChild: !0,
                loop: !0,
                trapped: o,
                onMountAutoFocus: i,
                onUnmountAutoFocus: s,
                children: (0, n.jsx)(l.D, {
                    asChild: !0,
                    disableOutsidePointerEvents: u,
                    onInteractOutside: p,
                    onEscapeKeyDown: c,
                    onPointerDownOutside: d,
                    onFocusOutside: f,
                    onDismiss: () => h.onOpenChange(!1),
                    children: (0, n.jsx)(a.C, {
                        "data-state": H(h.open),
                        role: "dialog",
                        id: h.contentId,
                        ...v,
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
        z = "PopoverClose",
        B = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...l
            } = e, o = S(z, r);
            return (0, n.jsx)(g.button, {
                type: "button",
                ...l,
                ref: t,
                onClick: i(e.onClick, () => o.onOpenChange(!1))
            })
        });
    B.displayName = z;
    var V = r.forwardRef((e, t) => {
        let {
            __scopePopover: r,
            ...l
        } = e, o = C(r);
        return (0, n.jsx)(a.a, {
            ...o,
            ...l,
            ref: t
        })
    });

    function H(e) {
        return e ? "open" : "closed"
    }
    V.displayName = "PopoverArrow", e.s(["A", 0, V, "C", 0, M, "P", 0, k, "R", 0, R, "T", 0, A, "a", 0, B, "b", 0, P])
}, 571926, e => {
    "use strict";
    var t, r = e.i(416340),
        n = e.i(221628),
        l = e.i(647409);
    e.i(149285);
    var o = e.i(932157);

    function a(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(n) {
            if (null == e || e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
        }
    }

    function i(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            l = [],
            o = () => {
                let t = l.map(e => r.createContext(e));
                return function(n) {
                    let l = (null == n ? void 0 : n[e]) || t;
                    return r.useMemo(() => ({
                        ["__scope".concat(e)]: {
                            ...n,
                            [e]: l
                        }
                    }), [n, l])
                }
            };
        return o.scopeName = e, [function(t, o) {
            let a = r.createContext(o),
                i = l.length;
            l = [...l, o];
            let s = t => {
                var l;
                let {
                    scope: o,
                    children: s,
                    ...u
                } = t, c = (null == o || null == (l = o[e]) ? void 0 : l[i]) || a, d = r.useMemo(() => u, Object.values(u));
                return (0, n.jsx)(c.Provider, {
                    value: d,
                    children: s
                })
            };
            return s.displayName = t + "Provider", [s, function(n, l) {
                var s;
                let u = (null == l || null == (s = l[e]) ? void 0 : s[i]) || a,
                    c = r.useContext(u);
                if (c) return c;
                if (void 0 !== o) return o;
                throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            let l = t[0];
            if (1 === t.length) return l;
            let o = () => {
                let e = t.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(t) {
                    let n = e.reduce((e, r) => {
                        let {
                            useScope: n,
                            scopeName: l
                        } = r;
                        return {
                            ...e,
                            ...n(t)["__scope".concat(l)]
                        }
                    }, {});
                    return r.useMemo(() => ({
                        ["__scope".concat(l.scopeName)]: n
                    }), [n])
                }
            };
            return o.scopeName = l.scopeName, o
        }(o, ...t)]
    }

    function s(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function u() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return e => {
            let r = !1,
                n = t.map(t => {
                    let n = s(t, e);
                    return r || "function" != typeof n || (r = !0), n
                });
            if (r) return () => {
                for (let e = 0; e < n.length; e++) {
                    let r = n[e];
                    "function" == typeof r ? r() : s(t[e], null)
                }
            }
        }
    }

    function c() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return r.useCallback(u(...t), t)
    }

    function d(e) {
        var t;
        let l, o = (t = e, (l = r.forwardRef((e, t) => {
                let {
                    children: n,
                    ...l
                } = e;
                if (r.isValidElement(n)) {
                    var o, a;
                    let e, i = (e = null == (o = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? n.ref : (e = null == (a = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                        s = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let l = e[n],
                                    o = t[n];
                                /^on[A-Z]/.test(n) ? l && o ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    let n = o(...t);
                                    return l(...t), n
                                } : l && (r[n] = l) : "style" === n ? r[n] = {
                                    ...l,
                                    ...o
                                } : "className" === n && (r[n] = [l, o].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(l, n.props);
                    return n.type !== r.Fragment && (s.ref = t ? u(t, i) : i), r.cloneElement(n, s)
                }
                return r.Children.count(n) > 1 ? r.Children.only(null) : null
            })).displayName = "".concat(t, ".SlotClone"), l),
            a = r.forwardRef((e, t) => {
                let {
                    children: l,
                    ...a
                } = e, i = r.Children.toArray(l), s = i.find(p);
                if (s) {
                    let e = s.props.children,
                        l = i.map(t => t === s ? r.Children.count(e) > 1 ? r.Children.only(null) : r.isValidElement(e) ? e.props.children : null : t);
                    return (0, n.jsx)(o, {
                        ...a,
                        ref: t,
                        children: r.isValidElement(e) ? r.cloneElement(e, void 0, l) : null
                    })
                }
                return (0, n.jsx)(o, {
                    ...a,
                    ref: t,
                    children: l
                })
            });
        return a.displayName = "".concat(e, ".Slot"), a
    }
    var f = Symbol("radix.slottable");

    function p(e) {
        return r.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === f
    }
    var m = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, t) => {
            let l = d("Primitive.".concat(t)),
                o = r.forwardRef((e, r) => {
                    let {
                        asChild: o,
                        ...a
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, n.jsx)(o ? l : t, {
                        ...a,
                        ref: r
                    })
                });
            return o.displayName = "Primitive.".concat(t), {
                ...e,
                [t]: o
            }
        }, {}),
        h = (null == (t = globalThis) ? void 0 : t.document) ? r.useLayoutEffect : () => {},
        v = r[" useInsertionEffect ".trim().toString()] || h,
        g = "rovingFocusGroup.onEntryFocus",
        y = {
            bubbles: !1,
            cancelable: !0
        },
        w = "RovingFocusGroup",
        [x, b, C] = function(e) {
            let t = e + "CollectionProvider",
                [l, o] = i(t),
                [a, s] = l(t, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }),
                u = e => {
                    let {
                        scope: t,
                        children: l
                    } = e, o = r.default.useRef(null), i = r.default.useRef(new Map).current;
                    return (0, n.jsx)(a, {
                        scope: t,
                        itemMap: i,
                        collectionRef: o,
                        children: l
                    })
                };
            u.displayName = t;
            let f = e + "CollectionSlot",
                p = d(f),
                m = r.default.forwardRef((e, t) => {
                    let {
                        scope: r,
                        children: l
                    } = e, o = c(t, s(f, r).collectionRef);
                    return (0, n.jsx)(p, {
                        ref: o,
                        children: l
                    })
                });
            m.displayName = f;
            let h = e + "CollectionItemSlot",
                v = "data-radix-collection-item",
                g = d(h),
                y = r.default.forwardRef((e, t) => {
                    let {
                        scope: l,
                        children: o,
                        ...a
                    } = e, i = r.default.useRef(null), u = c(t, i), d = s(h, l);
                    return r.default.useEffect(() => (d.itemMap.set(i, {
                        ref: i,
                        ...a
                    }), () => {
                        d.itemMap.delete(i)
                    })), (0, n.jsx)(g, {
                        [v]: "",
                        ref: u,
                        children: o
                    })
                });
            return y.displayName = h, [{
                Provider: u,
                Slot: m,
                ItemSlot: y
            }, function(t) {
                let n = s(e + "CollectionConsumer", t);
                return r.default.useCallback(() => {
                    let e = n.collectionRef.current;
                    if (!e) return [];
                    let t = Array.from(e.querySelectorAll("[".concat(v, "]")));
                    return Array.from(n.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
                }, [n.collectionRef, n.itemMap])
            }, o]
        }(w),
        [E, S] = i(w, [C]),
        [R, N] = E(w),
        P = r.forwardRef((e, t) => (0, n.jsx)(x.Provider, {
            scope: e.__scopeRovingFocusGroup,
            children: (0, n.jsx)(x.Slot, {
                scope: e.__scopeRovingFocusGroup,
                children: (0, n.jsx)(O, {
                    ...e,
                    ref: t
                })
            })
        }));
    P.displayName = w;
    var O = r.forwardRef((e, t) => {
            let l, {
                    __scopeRovingFocusGroup: i,
                    orientation: s,
                    loop: u = !1,
                    dir: d,
                    currentTabStopId: f,
                    defaultCurrentTabStopId: p,
                    onCurrentTabStopIdChange: h,
                    onEntryFocus: x,
                    preventScrollOnEntryFocus: C = !1,
                    ...E
                } = e,
                S = r.useRef(null),
                N = c(t, S),
                P = (0, o.u)(d),
                [O, A] = function(e) {
                    let {
                        prop: t,
                        defaultProp: n,
                        onChange: l = () => {},
                        caller: o
                    } = e, [a, i, s] = function(e) {
                        let {
                            defaultProp: t,
                            onChange: n
                        } = e, [l, o] = r.useState(t), a = r.useRef(l), i = r.useRef(n);
                        return v(() => {
                            i.current = n
                        }, [n]), r.useEffect(() => {
                            var e;
                            a.current !== l && (null == (e = i.current) || e.call(i, l), a.current = l)
                        }, [l, a]), [l, o, i]
                    }({
                        defaultProp: n,
                        onChange: l
                    }), u = void 0 !== t, c = u ? t : a;
                    {
                        let e = r.useRef(void 0 !== t);
                        r.useEffect(() => {
                            let t = e.current;
                            if (t !== u) {
                                let e = u ? "controlled" : "uncontrolled";
                                console.warn("".concat(o, " is changing from ").concat(t ? "controlled" : "uncontrolled", " to ").concat(e, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                            }
                            e.current = u
                        }, [u, o])
                    }
                    return [c, r.useCallback(e => {
                        if (u) {
                            var r;
                            let n = "function" == typeof e ? e(t) : e;
                            n !== t && (null == (r = s.current) || r.call(s, n))
                        } else i(e)
                    }, [u, t, i, s])]
                }({
                    prop: f,
                    defaultProp: null != p ? p : null,
                    onChange: h,
                    caller: w
                }),
                [T, _] = r.useState(!1),
                k = (l = r.useRef(x), r.useEffect(() => {
                    l.current = x
                }), r.useMemo(() => function() {
                    for (var e, t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    return null == (e = l.current) ? void 0 : e.call(l, ...r)
                }, [])),
                D = b(i),
                M = r.useRef(!1),
                [L, I] = r.useState(0);
            return r.useEffect(() => {
                let e = S.current;
                if (e) return e.addEventListener(g, k), () => e.removeEventListener(g, k)
            }, [k]), (0, n.jsx)(R, {
                scope: i,
                orientation: s,
                dir: P,
                loop: u,
                currentTabStopId: O,
                onItemFocus: r.useCallback(e => A(e), [A]),
                onItemShiftTab: r.useCallback(() => _(!0), []),
                onFocusableItemAdd: r.useCallback(() => I(e => e + 1), []),
                onFocusableItemRemove: r.useCallback(() => I(e => e - 1), []),
                children: (0, n.jsx)(m.div, {
                    tabIndex: T || 0 === L ? -1 : 0,
                    "data-orientation": s,
                    ...E,
                    ref: N,
                    style: {
                        outline: "none",
                        ...e.style
                    },
                    onMouseDown: a(e.onMouseDown, () => {
                        M.current = !0
                    }),
                    onFocus: a(e.onFocus, e => {
                        let t = !M.current;
                        if (e.target === e.currentTarget && t && !T) {
                            let t = new CustomEvent(g, y);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = D().filter(e => e.focusable);
                                j([e.find(e => e.active), e.find(e => e.id === O), ...e].filter(Boolean).map(e => e.ref.current), C)
                            }
                        }
                        M.current = !1
                    }),
                    onBlur: a(e.onBlur, () => _(!1))
                })
            })
        }),
        A = "RovingFocusGroupItem",
        T = r.forwardRef((e, t) => {
            let {
                __scopeRovingFocusGroup: o,
                focusable: i = !0,
                active: s = !1,
                tabStopId: u,
                children: c,
                ...d
            } = e, f = (0, l.u)(), p = u || f, h = N(A, o), v = h.currentTabStopId === p, g = b(o), {
                onFocusableItemAdd: y,
                onFocusableItemRemove: w,
                currentTabStopId: C
            } = h;
            return r.useEffect(() => {
                if (i) return y(), () => w()
            }, [i, y, w]), (0, n.jsx)(x.ItemSlot, {
                scope: o,
                id: p,
                focusable: i,
                active: s,
                children: (0, n.jsx)(m.span, {
                    tabIndex: v ? 0 : -1,
                    "data-orientation": h.orientation,
                    ...d,
                    ref: t,
                    onMouseDown: a(e.onMouseDown, e => {
                        i ? h.onItemFocus(p) : e.preventDefault()
                    }),
                    onFocus: a(e.onFocus, () => h.onItemFocus(p)),
                    onKeyDown: a(e.onKeyDown, e => {
                        var t, r, n, l, o;
                        let a;
                        if ("Tab" === e.key && e.shiftKey) return void h.onItemShiftTab();
                        if (e.target !== e.currentTarget) return;
                        let i = (n = h.orientation, l = h.dir, o = e.key, a = "rtl" !== l ? o : "ArrowLeft" === o ? "ArrowRight" : "ArrowRight" === o ? "ArrowLeft" : o, "vertical" === n && ["ArrowLeft", "ArrowRight"].includes(a) || "horizontal" === n && ["ArrowUp", "ArrowDown"].includes(a) ? void 0 : _[a]);
                        if (void 0 !== i) {
                            if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                            e.preventDefault();
                            let n = g().filter(e => e.focusable).map(e => e.ref.current);
                            if ("last" === i) n.reverse();
                            else if ("prev" === i || "next" === i) {
                                "prev" === i && n.reverse();
                                let l = n.indexOf(e.currentTarget);
                                n = h.loop ? (r = l + 1, (t = n).map((e, n) => t[(r + n) % t.length])) : n.slice(l + 1)
                            }
                            setTimeout(() => j(n))
                        }
                    }),
                    children: "function" == typeof c ? c({
                        isCurrentTabStop: v,
                        hasTabStop: null != C
                    }) : c
                })
            })
        });
    T.displayName = A;
    var _ = {
        ArrowLeft: "prev",
        ArrowUp: "prev",
        ArrowRight: "next",
        ArrowDown: "next",
        PageUp: "first",
        Home: "first",
        PageDown: "last",
        End: "last"
    };

    function j(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            r = document.activeElement;
        for (let n of e)
            if (n === r || (n.focus({
                    preventScroll: t
                }), document.activeElement !== r)) return
    }
    e.s(["I", 0, T, "R", 0, P, "c", 0, S])
}, 660531, e => {
    "use strict";
    var t, r = e.i(416340),
        n = e.i(221628);

    function l(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function o() {
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

    function a() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return r.useCallback(o(...t), t)
    }

    function i(e) {
        let t = r.useRef(e);
        return r.useEffect(() => {
            t.current = e
        }), r.useMemo(() => function() {
            for (var e, r = arguments.length, n = Array(r), l = 0; l < r; l++) n[l] = arguments[l];
            return null == (e = t.current) ? void 0 : e.call(t, ...n)
        }, [])
    }
    var s = (null == (t = globalThis) ? void 0 : t.document) ? r.useLayoutEffect : () => {},
        u = e => {
            var t, n;
            let l, {
                    present: o,
                    children: i
                } = e,
                u = function(e) {
                    var t, n;
                    let [l, o] = r.useState(), a = r.useRef({}), i = r.useRef(e), u = r.useRef("none"), [d, f] = (t = e ? "mounted" : "unmounted", n = {
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
                    }, r.useReducer((e, t) => {
                        var r;
                        return null != (r = n[e][t]) ? r : e
                    }, t));
                    return r.useEffect(() => {
                        let e = c(a.current);
                        u.current = "mounted" === d ? e : "none"
                    }, [d]), s(() => {
                        let t = a.current,
                            r = i.current;
                        if (r !== e) {
                            let n = u.current,
                                l = c(t);
                            e ? f("MOUNT") : "none" === l || "none" === (null == t ? void 0 : t.display) ? f("UNMOUNT") : f(r && n !== l ? "ANIMATION_OUT" : "UNMOUNT"), i.current = e
                        }
                    }, [e, f]), s(() => {
                        if (l) {
                            var e;
                            let t, r = null != (e = l.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = c(a.current).includes(e.animationName);
                                    if (e.target === l && n && (f("ANIMATION_END"), !i.current)) {
                                        let e = l.style.animationFillMode;
                                        l.style.animationFillMode = "forwards", t = r.setTimeout(() => {
                                            "forwards" === l.style.animationFillMode && (l.style.animationFillMode = e)
                                        })
                                    }
                                },
                                o = e => {
                                    e.target === l && (u.current = c(a.current))
                                };
                            return l.addEventListener("animationstart", o), l.addEventListener("animationcancel", n), l.addEventListener("animationend", n), () => {
                                r.clearTimeout(t), l.removeEventListener("animationstart", o), l.removeEventListener("animationcancel", n), l.removeEventListener("animationend", n)
                            }
                        }
                        f("ANIMATION_END")
                    }, [l, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: r.useCallback(e => {
                            e && (a.current = getComputedStyle(e)), o(e)
                        }, [])
                    }
                }(o),
                d = "function" == typeof i ? i({
                    present: u.isPresent
                }) : r.Children.only(i),
                f = a(u.ref, (l = null == (t = Object.getOwnPropertyDescriptor(d.props, "ref")) ? void 0 : t.get) && "isReactWarning" in l && l.isReactWarning ? d.ref : (l = null == (n = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : n.get) && "isReactWarning" in l && l.isReactWarning ? d.props.ref : d.props.ref || d.ref);
            return "function" == typeof i || u.isPresent ? r.cloneElement(d, {
                ref: f
            }) : null
        };

    function c(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    u.displayName = "Presence", e.s(["P", 0, u, "a", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            l = [],
            o = () => {
                let t = l.map(e => r.createContext(e));
                return function(n) {
                    let l = (null == n ? void 0 : n[e]) || t;
                    return r.useMemo(() => ({
                        ["__scope".concat(e)]: {
                            ...n,
                            [e]: l
                        }
                    }), [n, l])
                }
            };
        return o.scopeName = e, [function(t, o) {
            let a = r.createContext(o),
                i = l.length;
            l = [...l, o];
            let s = t => {
                var l;
                let {
                    scope: o,
                    children: s,
                    ...u
                } = t, c = (null == o || null == (l = o[e]) ? void 0 : l[i]) || a, d = r.useMemo(() => u, Object.values(u));
                return (0, n.jsx)(c.Provider, {
                    value: d,
                    children: s
                })
            };
            return s.displayName = t + "Provider", [s, function(n, l) {
                var s;
                let u = (null == l || null == (s = l[e]) ? void 0 : s[i]) || a,
                    c = r.useContext(u);
                if (c) return c;
                if (void 0 !== o) return o;
                throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            let l = t[0];
            if (1 === t.length) return l;
            let o = () => {
                let e = t.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(t) {
                    let n = e.reduce((e, r) => {
                        let {
                            useScope: n,
                            scopeName: l
                        } = r;
                        return {
                            ...e,
                            ...n(t)["__scope".concat(l)]
                        }
                    }, {});
                    return r.useMemo(() => ({
                        ["__scope".concat(l.scopeName)]: n
                    }), [n])
                }
            };
            return o.scopeName = l.scopeName, o
        }(o, ...t)]
    }, "b", 0, function(e) {
        let {
            prop: t,
            defaultProp: n,
            onChange: l = () => {}
        } = e, [o, a] = function(e) {
            let {
                defaultProp: t,
                onChange: n
            } = e, l = r.useState(t), [o] = l, a = r.useRef(o), s = i(n);
            return r.useEffect(() => {
                a.current !== o && (s(o), a.current = o)
            }, [o, a, s]), l
        }({
            defaultProp: n,
            onChange: l
        }), s = void 0 !== t, u = s ? t : o, c = i(l);
        return [u, r.useCallback(e => {
            if (s) {
                let r = "function" == typeof e ? e(t) : e;
                r !== t && c(r)
            } else a(e)
        }, [s, t, a, c])]
    }, "c", 0, o, "d", 0, function(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(n) {
            if (null == e || e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
        }
    }, "e", 0, function(e) {
        let [t, n] = r.useState(void 0);
        return s(() => {
            if (e) {
                n({
                    width: e.offsetWidth,
                    height: e.offsetHeight
                });
                let t = new ResizeObserver(t => {
                    let r, l;
                    if (!Array.isArray(t) || !t.length) return;
                    let o = t[0];
                    if ("borderBoxSize" in o) {
                        let e = o.borderBoxSize,
                            t = Array.isArray(e) ? e[0] : e;
                        r = t.inlineSize, l = t.blockSize
                    } else r = e.offsetWidth, l = e.offsetHeight;
                    n({
                        width: r,
                        height: l
                    })
                });
                return t.observe(e, {
                    box: "border-box"
                }), () => t.unobserve(e)
            }
            n(void 0)
        }, [e]), t
    }, "f", 0, i, "g", 0, s, "u", 0, a])
}, 636282, e => {
    "use strict";
    var t = e.i(416340),
        r = "u" > typeof globalThis ? globalThis : "u" > typeof window ? window : e.g,
        n = "object" == typeof r && r && r.Object === Object && r,
        l = "object" == typeof self && self && self.Object === Object && self;
    n || l || Function("return this")();
    var o = "u" > typeof window ? t.useLayoutEffect : t.useEffect,
        a = "u" < typeof window;
    e.s(["u", 0, function(e) {
        let {
            defaultValue: r = !1,
            initializeWithValue: n = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, l = e => a ? r : window.matchMedia(e).matches, [i, s] = (0, t.useState)(() => n ? l(e) : r);

        function u() {
            s(l(e))
        }
        return o(() => {
            let t = window.matchMedia(e);
            return u(), t.addListener ? t.addListener(u) : t.addEventListener("change", u), () => {
                t.removeListener ? t.removeListener(u) : t.removeEventListener("change", u)
            }
        }, [e]), i
    }])
}, 674023, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(221628);

    function n(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function l() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return e => {
            let r = !1,
                l = t.map(t => {
                    let l = n(t, e);
                    return r || "function" != typeof l || (r = !0), l
                });
            if (r) return () => {
                for (let e = 0; e < l.length; e++) {
                    let r = l[e];
                    "function" == typeof r ? r() : n(t[e], null)
                }
            }
        }
    }

    function o() {
        for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
        return t.useCallback(l(...r), r)
    }

    function a(e) {
        var n;
        let o, a = (n = e, (o = t.forwardRef((e, r) => {
                let {
                    children: n,
                    ...o
                } = e;
                if (t.isValidElement(n)) {
                    var a, i;
                    let e, s = (e = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning ? n.ref : (e = null == (i = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : i.get) && "isReactWarning" in e && e.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                        u = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let l = e[n],
                                    o = t[n];
                                /^on[A-Z]/.test(n) ? l && o ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    o(...t), l(...t)
                                } : l && (r[n] = l) : "style" === n ? r[n] = {
                                    ...l,
                                    ...o
                                } : "className" === n && (r[n] = [l, o].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(o, n.props);
                    return n.type !== t.Fragment && (u.ref = r ? l(r, s) : s), t.cloneElement(n, u)
                }
                return t.Children.count(n) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(n, ".SlotClone"), o),
            i = t.forwardRef((e, n) => {
                let {
                    children: l,
                    ...o
                } = e, i = t.Children.toArray(l), u = i.find(s);
                if (u) {
                    let e = u.props.children,
                        l = i.map(r => r === u ? t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null : r);
                    return (0, r.jsx)(a, {
                        ...o,
                        ref: n,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, l) : null
                    })
                }
                return (0, r.jsx)(a, {
                    ...o,
                    ref: n,
                    children: l
                })
            });
        return i.displayName = "".concat(e, ".Slot"), i
    }
    var i = Symbol("radix.slottable");

    function s(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === i
    }
    e.s(["c", 0, function(e) {
        let n = e + "CollectionProvider",
            [l, i] = function(e) {
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    l = [],
                    o = () => {
                        let r = l.map(e => t.createContext(e));
                        return function(n) {
                            let l = (null == n ? void 0 : n[e]) || r;
                            return t.useMemo(() => ({
                                ["__scope".concat(e)]: {
                                    ...n,
                                    [e]: l
                                }
                            }), [n, l])
                        }
                    };
                return o.scopeName = e, [function(n, o) {
                    let a = t.createContext(o),
                        i = l.length;
                    l = [...l, o];
                    let s = n => {
                        var l;
                        let {
                            scope: o,
                            children: s,
                            ...u
                        } = n, c = (null == o || null == (l = o[e]) ? void 0 : l[i]) || a, d = t.useMemo(() => u, Object.values(u));
                        return (0, r.jsx)(c.Provider, {
                            value: d,
                            children: s
                        })
                    };
                    return s.displayName = n + "Provider", [s, function(r, l) {
                        var s;
                        let u = (null == l || null == (s = l[e]) ? void 0 : s[i]) || a,
                            c = t.useContext(u);
                        if (c) return c;
                        if (void 0 !== o) return o;
                        throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                    }]
                }, function() {
                    for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                    let l = r[0];
                    if (1 === r.length) return l;
                    let o = () => {
                        let e = r.map(e => ({
                            useScope: e(),
                            scopeName: e.scopeName
                        }));
                        return function(r) {
                            let n = e.reduce((e, t) => {
                                let {
                                    useScope: n,
                                    scopeName: l
                                } = t;
                                return {
                                    ...e,
                                    ...n(r)["__scope".concat(l)]
                                }
                            }, {});
                            return t.useMemo(() => ({
                                ["__scope".concat(l.scopeName)]: n
                            }), [n])
                        }
                    };
                    return o.scopeName = l.scopeName, o
                }(o, ...n)]
            }(n),
            [s, u] = l(n, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            c = e => {
                let {
                    scope: n,
                    children: l
                } = e, o = t.default.useRef(null), a = t.default.useRef(new Map).current;
                return (0, r.jsx)(s, {
                    scope: n,
                    itemMap: a,
                    collectionRef: o,
                    children: l
                })
            };
        c.displayName = n;
        let d = e + "CollectionSlot",
            f = a(d),
            p = t.default.forwardRef((e, t) => {
                let {
                    scope: n,
                    children: l
                } = e, a = o(t, u(d, n).collectionRef);
                return (0, r.jsx)(f, {
                    ref: a,
                    children: l
                })
            });
        p.displayName = d;
        let m = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            v = a(m),
            g = t.default.forwardRef((e, n) => {
                let {
                    scope: l,
                    children: a,
                    ...i
                } = e, s = t.default.useRef(null), c = o(n, s), d = u(m, l);
                return t.default.useEffect(() => (d.itemMap.set(s, {
                    ref: s,
                    ...i
                }), () => {
                    d.itemMap.delete(s)
                })), (0, r.jsx)(v, {
                    [h]: "",
                    ref: c,
                    children: a
                })
            });
        return g.displayName = m, [{
            Provider: c,
            Slot: p,
            ItemSlot: g
        }, function(r) {
            let n = u(e + "CollectionConsumer", r);
            return t.default.useCallback(() => {
                let e = n.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                return Array.from(n.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [n.collectionRef, n.itemMap])
        }, i]
    }])
}, 912056, e => {
    "use strict";
    var t = e.i(416340);
    let r = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            n = (0, t.useRef)();
        return n.current || (r += 1, n.current = "".concat(e).concat(r)), n.current
    }])
}]);

//# debugId=d4c63ee5-8041-f5f4-9b63-d0a9d5a42545
//# sourceMappingURL=1bsc75jnlr98o.js.map
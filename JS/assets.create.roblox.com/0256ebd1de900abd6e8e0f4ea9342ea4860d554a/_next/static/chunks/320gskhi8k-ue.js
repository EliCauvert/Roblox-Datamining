;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "5ac8091e-45df-6fd5-6c6e-d089d4991963")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 511952, e => {
    "use strict";
    (0, e.i(422711).s)(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}:root{--light-mode-stroke-contrast-alpha:rgba(27,37,75,.5);--dark-mode-stroke-contrast-alpha:rgba(208,217,251,.4);--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-light-mode-shadow-subtle:rgba(0,0,0,.08);--alpha-dark-mode-shadow-subtle:rgba(4,4,8,.25);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){:root{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.light-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}.dark-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}.system-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){.system-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.stroke-contrast-alpha{border-color:var(--color-stroke-contrast-alpha)}.foundation-web-input.focus-within\\:stroke-system-emphasis:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-emphasis)}.foundation-web-input.focus-within\\:stroke-system-alert:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-alert)}"), e.s([])
}, 131079, e => {
    "use strict";
    var t, r = e.i(197649),
        n = e.i(416340),
        l = e.i(149285),
        a = e.i(321774),
        o = e.i(975980),
        i = e.i(221628),
        s = e.i(70370),
        u = e.i(708788),
        c = e.i(474522),
        d = e.i(443372),
        f = e.i(46079),
        p = e.i(183906);
    e.i(511952);
    var m = e.i(422711),
        h = e.i(610160),
        v = e.i(637310),
        g = e.i(878382);

    function y(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(n) {
            if (null == e || e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
        }
    }

    function b(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function w() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return e => {
            let r = !1,
                n = t.map(t => {
                    let n = b(t, e);
                    return r || "function" != typeof n || (r = !0), n
                });
            if (r) return () => {
                for (let e = 0; e < n.length; e++) {
                    let r = n[e];
                    "function" == typeof r ? r() : b(t[e], null)
                }
            }
        }
    }

    function x() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return n.useCallback(w(...t), t)
    }

    function C(e) {
        var t;
        let r, l = (t = e, (r = n.forwardRef((e, t) => {
                let {
                    children: r,
                    ...l
                } = e;
                if (n.isValidElement(r)) {
                    var a, o;
                    let e, i = (e = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning ? r.ref : (e = null == (o = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                        s = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let l = e[n],
                                    a = t[n];
                                /^on[A-Z]/.test(n) ? l && a ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    a(...t), l(...t)
                                } : l && (r[n] = l) : "style" === n ? r[n] = {
                                    ...l,
                                    ...a
                                } : "className" === n && (r[n] = [l, a].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(l, r.props);
                    return r.type !== n.Fragment && (s.ref = t ? w(t, i) : i), n.cloneElement(r, s)
                }
                return n.Children.count(r) > 1 ? n.Children.only(null) : null
            })).displayName = "".concat(t, ".SlotClone"), r),
            a = n.forwardRef((e, t) => {
                let {
                    children: r,
                    ...a
                } = e, o = n.Children.toArray(r), s = o.find(E);
                if (s) {
                    let e = s.props.children,
                        r = o.map(t => t === s ? n.Children.count(e) > 1 ? n.Children.only(null) : n.isValidElement(e) ? e.props.children : null : t);
                    return (0, i.jsx)(l, {
                        ...a,
                        ref: t,
                        children: n.isValidElement(e) ? n.cloneElement(e, void 0, r) : null
                    })
                }
                return (0, i.jsx)(l, {
                    ...a,
                    ref: t,
                    children: r
                })
            });
        return a.displayName = "".concat(e, ".Slot"), a
    }
    var S = Symbol("radix.slottable");

    function E(e) {
        return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === S
    }
    var N = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
        let r = C("Primitive.".concat(t)),
            l = n.forwardRef((e, n) => {
                let {
                    asChild: l,
                    ...a
                } = e;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, i.jsx)(l ? r : t, {
                    ...a,
                    ref: n
                })
            });
        return l.displayName = "Primitive.".concat(t), {
            ...e,
            [t]: l
        }
    }, {});

    function R(e) {
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
        } = e, [a, o] = function(e) {
            let {
                defaultProp: t,
                onChange: r
            } = e, l = n.useState(t), [a] = l, o = n.useRef(a), i = R(r);
            return n.useEffect(() => {
                o.current !== a && (i(a), o.current = a)
            }, [a, o, i]), l
        }({
            defaultProp: r,
            onChange: l
        }), i = void 0 !== t, s = i ? t : a, u = R(l);
        return [s, n.useCallback(e => {
            if (i) {
                let r = "function" == typeof e ? e(t) : e;
                r !== t && u(r)
            } else o(e)
        }, [i, t, o, u])]
    }
    var _ = (null == (t = globalThis) ? void 0 : t.document) ? n.useLayoutEffect : () => {},
        j = n.forwardRef((e, t) => (0, i.jsx)(N.span, {
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
    j.displayName = "VisuallyHidden";
    var O = [" ", "Enter", "ArrowUp", "ArrowDown"],
        A = [" ", "Enter"],
        k = "Select",
        [M, I, T] = (0, o.c)(k),
        [D, L] = function(e) {
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
                let a = n.createContext(l),
                    o = r.length;
                r = [...r, l];
                let s = t => {
                    var r;
                    let {
                        scope: l,
                        children: s,
                        ...u
                    } = t, c = (null == l || null == (r = l[e]) ? void 0 : r[o]) || a, d = n.useMemo(() => u, Object.values(u));
                    return (0, i.jsx)(c.Provider, {
                        value: d,
                        children: s
                    })
                };
                return s.displayName = t + "Provider", [s, function(r, i) {
                    var s;
                    let u = (null == i || null == (s = i[e]) ? void 0 : s[o]) || a,
                        c = n.useContext(u);
                    if (c) return c;
                    if (void 0 !== l) return l;
                    throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                }]
            }, function() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                let l = t[0];
                if (1 === t.length) return l;
                let a = () => {
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
                return a.scopeName = l.scopeName, a
            }(l, ...t)]
        }(k, [T, d.c]),
        F = (0, d.c)(),
        [z, W] = D(k),
        [V, B] = D(k),
        U = e => {
            let {
                __scopeSelect: t,
                children: r,
                open: l,
                defaultOpen: a,
                onOpenChange: o,
                value: u,
                defaultValue: f,
                onValueChange: p,
                dir: m,
                name: h,
                autoComplete: v,
                disabled: g,
                required: y,
                form: b
            } = e, w = F(t), [x, C] = n.useState(null), [S, E] = n.useState(null), [N, R] = n.useState(!1), _ = (0, s.u)(m), [j = !1, O] = P({
                prop: l,
                defaultProp: a,
                onChange: o
            }), [A, k] = P({
                prop: u,
                defaultProp: f,
                onChange: p
            }), I = n.useRef(null), T = !x || b || !!x.closest("form"), [D, L] = n.useState(new Set), W = Array.from(D).map(e => e.props.value).join(";");
            return (0, i.jsx)(d.R, {
                ...w,
                children: (0, i.jsxs)(z, {
                    required: y,
                    scope: t,
                    trigger: x,
                    onTriggerChange: C,
                    valueNode: S,
                    onValueNodeChange: E,
                    valueNodeHasChildren: N,
                    onValueNodeHasChildrenChange: R,
                    contentId: (0, c.u)(),
                    value: A,
                    onValueChange: k,
                    open: j,
                    onOpenChange: O,
                    dir: _,
                    triggerPointerDownPosRef: I,
                    disabled: g,
                    children: [(0, i.jsx)(M.Provider, {
                        scope: t,
                        children: (0, i.jsx)(V, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: n.useCallback(e => {
                                L(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: n.useCallback(e => {
                                L(t => {
                                    let r = new Set(t);
                                    return r.delete(e), r
                                })
                            }, []),
                            children: r
                        })
                    }), T ? (0, i.jsxs)(eE, {
                        "aria-hidden": !0,
                        required: y,
                        tabIndex: -1,
                        name: h,
                        autoComplete: v,
                        value: A,
                        onChange: e => k(e.target.value),
                        disabled: g,
                        form: b,
                        children: [void 0 === A ? (0, i.jsx)("option", {
                            value: ""
                        }) : null, Array.from(D)]
                    }, W) : null]
                })
            })
        };
    U.displayName = k;
    var H = "SelectTrigger",
        K = n.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                disabled: l = !1,
                ...a
            } = e, o = F(r), s = W(H, r), u = s.disabled || l, c = x(t, s.onTriggerChange), f = I(r), p = n.useRef("touch"), [m, h, v] = eN(e => {
                let t = f().filter(e => !e.disabled),
                    r = t.find(e => e.value === s.value),
                    n = eR(t, e, r);
                void 0 !== n && s.onValueChange(n.value)
            }), g = e => {
                u || (s.onOpenChange(!0), v()), e && (s.triggerPointerDownPosRef.current = {
                    x: Math.round(e.pageX),
                    y: Math.round(e.pageY)
                })
            };
            return (0, i.jsx)(d.A, {
                asChild: !0,
                ...o,
                children: (0, i.jsx)(N.button, {
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
                    "data-placeholder": eS(s.value) ? "" : void 0,
                    ...a,
                    ref: c,
                    onClick: y(a.onClick, e => {
                        e.currentTarget.focus(), "mouse" !== p.current && g(e)
                    }),
                    onPointerDown: y(a.onPointerDown, e => {
                        p.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (g(e), e.preventDefault())
                    }),
                    onKeyDown: y(a.onKeyDown, e => {
                        let t = "" !== m.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || h(e.key), t && " " === e.key || O.includes(e.key) && (g(), e.preventDefault())
                    })
                })
            })
        });
    K.displayName = H;
    var X = "SelectValue",
        q = n.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: n,
                style: l,
                children: a,
                placeholder: o = "",
                ...s
            } = e, u = W(X, r), {
                onValueNodeHasChildrenChange: c
            } = u, d = void 0 !== a, f = x(t, u.onValueNodeChange);
            return _(() => {
                c(d)
            }, [c, d]), (0, i.jsx)(N.span, {
                ...s,
                ref: f,
                style: {
                    pointerEvents: "none"
                },
                children: eS(u.value) ? (0, i.jsx)(i.Fragment, {
                    children: o
                }) : a
            })
        });
    q.displayName = X;
    var Y = n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            children: n,
            ...l
        } = e;
        return (0, i.jsx)(N.span, {
            "aria-hidden": !0,
            ...l,
            ref: t,
            children: n || "▼"
        })
    });
    Y.displayName = "SelectIcon";
    var G = e => (0, i.jsx)(u.P, {
        asChild: !0,
        ...e
    });
    G.displayName = "SelectPortal";
    var Z = "SelectContent",
        J = n.forwardRef((e, t) => {
            let r = W(Z, e.__scopeSelect),
                [a, o] = n.useState();
            return (_(() => {
                o(new DocumentFragment)
            }, []), r.open) ? (0, i.jsx)(et, {
                ...e,
                ref: t
            }) : a ? l.createPortal((0, i.jsx)(Q, {
                scope: e.__scopeSelect,
                children: (0, i.jsx)(M.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, i.jsx)("div", {
                        children: e.children
                    })
                })
            }), a) : null
        });
    J.displayName = Z;
    var [Q, $] = D(Z), ee = C("SelectContent.RemoveScroll"), et = n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            position: l = "item-aligned",
            onCloseAutoFocus: a,
            onEscapeKeyDown: o,
            onPointerDownOutside: s,
            side: c,
            sideOffset: d,
            align: f,
            alignOffset: p,
            arrowPadding: m,
            collisionBoundary: h,
            collisionPadding: v,
            sticky: g,
            hideWhenDetached: b,
            avoidCollisions: w,
            ...C
        } = e, S = W(Z, r), [E, N] = n.useState(null), [R, P] = n.useState(null), _ = x(t, e => N(e)), [j, O] = n.useState(null), [A, k] = n.useState(null), M = I(r), [T, D] = n.useState(!1), L = n.useRef(!1);
        n.useEffect(() => {
            if (E) return (0, u.h)(E)
        }, [E]), (0, u.u)();
        let F = n.useCallback(e => {
                let [t, ...r] = M().map(e => e.ref.current), [n] = r.slice(-1), l = document.activeElement;
                for (let r of e)
                    if (r === l || (null == r || r.scrollIntoView({
                            block: "nearest"
                        }), r === t && R && (R.scrollTop = 0), r === n && R && (R.scrollTop = R.scrollHeight), null == r || r.focus(), document.activeElement !== l)) return
            }, [M, R]),
            z = n.useCallback(() => F([j, E]), [F, j, E]);
        n.useEffect(() => {
            T && z()
        }, [T, z]);
        let {
            onOpenChange: V,
            triggerPointerDownPosRef: B
        } = S;
        n.useEffect(() => {
            if (E) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        var r, n, l, a;
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (null != (r = null == (l = B.current) ? void 0 : l.x) ? r : 0)),
                            y: Math.abs(Math.round(t.pageY) - (null != (n = null == (a = B.current) ? void 0 : a.y) ? n : 0))
                        }
                    },
                    r = r => {
                        e.x <= 10 && e.y <= 10 ? r.preventDefault() : E.contains(r.target) || V(!1), document.removeEventListener("pointermove", t), B.current = null
                    };
                return null !== B.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                        capture: !0
                    })
                }
            }
        }, [E, V, B]), n.useEffect(() => {
            let e = () => V(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [V]);
        let [U, H] = eN(e => {
            let t = M().filter(e => !e.disabled),
                r = t.find(e => e.ref.current === document.activeElement),
                n = eR(t, e, r);
            n && setTimeout(() => n.ref.current.focus())
        }), K = n.useCallback((e, t, r) => {
            let n = !L.current && !r;
            (void 0 !== S.value && S.value === t || n) && (O(e), n && (L.current = !0))
        }, [S.value]), X = n.useCallback(() => null == E ? void 0 : E.focus(), [E]), q = n.useCallback((e, t, r) => {
            let n = !L.current && !r;
            (void 0 !== S.value && S.value === t || n) && k(e)
        }, [S.value]), Y = "popper" === l ? en : er, G = Y === en ? {
            side: c,
            sideOffset: d,
            align: f,
            alignOffset: p,
            arrowPadding: m,
            collisionBoundary: h,
            collisionPadding: v,
            sticky: g,
            hideWhenDetached: b,
            avoidCollisions: w
        } : {};
        return (0, i.jsx)(Q, {
            scope: r,
            content: E,
            viewport: R,
            onViewportChange: P,
            itemRefCallback: K,
            selectedItem: j,
            onItemLeave: X,
            itemTextRefCallback: q,
            focusSelectedItem: z,
            selectedItemText: A,
            position: l,
            isPositioned: T,
            searchRef: U,
            children: (0, i.jsx)(u.R, {
                as: ee,
                allowPinchZoom: !0,
                children: (0, i.jsx)(u.F, {
                    asChild: !0,
                    trapped: S.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: y(a, e => {
                        var t;
                        null == (t = S.trigger) || t.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, i.jsx)(u.D, {
                        asChild: !0,
                        disableOutsidePointerEvents: !0,
                        onEscapeKeyDown: o,
                        onPointerDownOutside: s,
                        onFocusOutside: e => e.preventDefault(),
                        onDismiss: () => S.onOpenChange(!1),
                        children: (0, i.jsx)(Y, {
                            role: "listbox",
                            id: S.contentId,
                            "data-state": S.open ? "open" : "closed",
                            dir: S.dir,
                            onContextMenu: e => e.preventDefault(),
                            ...C,
                            ...G,
                            onPlaced: () => D(!0),
                            ref: _,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...C.style
                            },
                            onKeyDown: y(C.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || H(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = M().filter(e => !e.disabled).map(e => e.ref.current);
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
            ...o
        } = e, s = W(Z, r), u = $(Z, r), [c, d] = n.useState(null), [f, p] = n.useState(null), m = x(t, e => p(e)), h = I(r), v = n.useRef(!1), g = n.useRef(!0), {
            viewport: y,
            selectedItem: b,
            selectedItemText: w,
            focusSelectedItem: C
        } = u, S = n.useCallback(() => {
            if (s.trigger && s.valueNode && c && f && y && b && w) {
                let e = s.trigger.getBoundingClientRect(),
                    t = f.getBoundingClientRect(),
                    r = s.valueNode.getBoundingClientRect(),
                    n = w.getBoundingClientRect();
                if ("rtl" !== s.dir) {
                    let l = n.left - t.left,
                        o = r.left - l,
                        i = e.left - o,
                        s = e.width + i,
                        u = Math.max(s, t.width),
                        d = window.innerWidth - 10,
                        f = (0, a.c)(o, [10, Math.max(10, d - u)]);
                    c.style.minWidth = s + "px", c.style.left = f + "px"
                } else {
                    let l = t.right - n.right,
                        o = window.innerWidth - r.right - l,
                        i = window.innerWidth - e.right - o,
                        s = e.width + i,
                        u = Math.max(s, t.width),
                        d = window.innerWidth - 10,
                        f = (0, a.c)(o, [10, Math.max(10, d - u)]);
                    c.style.minWidth = s + "px", c.style.right = f + "px"
                }
                let o = h(),
                    i = window.innerHeight - 20,
                    u = y.scrollHeight,
                    d = window.getComputedStyle(f),
                    p = parseInt(d.borderTopWidth, 10),
                    m = parseInt(d.paddingTop, 10),
                    g = parseInt(d.borderBottomWidth, 10),
                    x = p + m + u + parseInt(d.paddingBottom, 10) + g,
                    C = Math.min(5 * b.offsetHeight, x),
                    S = window.getComputedStyle(y),
                    E = parseInt(S.paddingTop, 10),
                    N = parseInt(S.paddingBottom, 10),
                    R = e.top + e.height / 2 - 10,
                    P = b.offsetHeight / 2,
                    _ = p + m + (b.offsetTop + P);
                if (_ <= R) {
                    let e = o.length > 0 && b === o[o.length - 1].ref.current;
                    c.style.bottom = "0px";
                    let t = _ + Math.max(i - R, P + (e ? N : 0) + (f.clientHeight - y.offsetTop - y.offsetHeight) + g);
                    c.style.height = t + "px"
                } else {
                    let e = o.length > 0 && b === o[0].ref.current;
                    c.style.top = "0px";
                    let t = Math.max(R, p + y.offsetTop + (e ? E : 0) + P) + (x - _);
                    c.style.height = t + "px", y.scrollTop = _ - R + y.offsetTop
                }
                c.style.margin = "".concat(10, "px 0"), c.style.minHeight = C + "px", c.style.maxHeight = i + "px", null == l || l(), requestAnimationFrame(() => v.current = !0)
            }
        }, [h, s.trigger, s.valueNode, c, f, y, b, w, s.dir, l]);
        _(() => S(), [S]);
        let [E, R] = n.useState();
        _(() => {
            f && R(window.getComputedStyle(f).zIndex)
        }, [f]);
        let P = n.useCallback(e => {
            e && !0 === g.current && (S(), null == C || C(), g.current = !1)
        }, [S, C]);
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
                    zIndex: E
                },
                children: (0, i.jsx)(N.div, {
                    ...o,
                    ref: m,
                    style: {
                        boxSizing: "border-box",
                        maxHeight: "100%",
                        ...o.style
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
            ...a
        } = e, o = F(r);
        return (0, i.jsx)(d.C, {
            ...o,
            ...a,
            ref: t,
            align: n,
            collisionPadding: l,
            style: {
                boxSizing: "border-box",
                ...a.style,
                "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
            }
        })
    });
    en.displayName = "SelectPopperPosition";
    var [el, ea] = D(Z, {}), eo = "SelectViewport", ei = n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            nonce: l,
            ...a
        } = e, o = $(eo, r), s = ea(eo, r), u = x(t, o.onViewportChange), c = n.useRef(0);
        return (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: l
            }), (0, i.jsx)(M.Slot, {
                scope: r,
                children: (0, i.jsx)(N.div, {
                    "data-radix-select-viewport": "",
                    role: "presentation",
                    ...a,
                    ref: u,
                    style: {
                        position: "relative",
                        flex: 1,
                        overflow: "hidden auto",
                        ...a.style
                    },
                    onScroll: y(a.onScroll, e => {
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
                                    let a = l + e,
                                        o = Math.min(n, a),
                                        i = a - o;
                                    r.style.height = o + "px", "0px" === r.style.bottom && (t.scrollTop = i > 0 ? i : 0, r.style.justifyContent = "flex-end")
                                }
                            }
                        }
                        c.current = t.scrollTop
                    })
                })
            })]
        })
    });
    ei.displayName = eo;
    var es = "SelectGroup",
        [eu, ec] = D(es);
    n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, l = (0, c.u)();
        return (0, i.jsx)(eu, {
            scope: r,
            id: l,
            children: (0, i.jsx)(N.div, {
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
        return (0, i.jsx)(N.div, {
            id: l.id,
            ...n,
            ref: t
        })
    }).displayName = ed;
    var ef = "SelectItem",
        [ep, em] = D(ef),
        eh = n.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                value: l,
                disabled: a = !1,
                textValue: o,
                ...s
            } = e, u = W(ef, r), d = $(ef, r), f = u.value === l, [p, m] = n.useState(null != o ? o : ""), [h, v] = n.useState(!1), g = x(t, e => {
                var t;
                return null == (t = d.itemRefCallback) ? void 0 : t.call(d, e, l, a)
            }), b = (0, c.u)(), w = n.useRef("touch"), C = () => {
                a || (u.onValueChange(l), u.onOpenChange(!1))
            };
            if ("" === l) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, i.jsx)(ep, {
                scope: r,
                value: l,
                disabled: a,
                textId: b,
                isSelected: f,
                onItemTextChange: n.useCallback(e => {
                    m(t => {
                        var r;
                        return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                    })
                }, []),
                children: (0, i.jsx)(M.ItemSlot, {
                    scope: r,
                    value: l,
                    disabled: a,
                    textValue: p,
                    children: (0, i.jsx)(N.div, {
                        role: "option",
                        "aria-labelledby": b,
                        "data-highlighted": h ? "" : void 0,
                        "aria-selected": f && h,
                        "data-state": f ? "checked" : "unchecked",
                        "aria-disabled": a || void 0,
                        "data-disabled": a ? "" : void 0,
                        tabIndex: a ? void 0 : -1,
                        ...s,
                        ref: g,
                        onFocus: y(s.onFocus, () => v(!0)),
                        onBlur: y(s.onBlur, () => v(!1)),
                        onClick: y(s.onClick, () => {
                            "mouse" !== w.current && C()
                        }),
                        onPointerUp: y(s.onPointerUp, () => {
                            "mouse" === w.current && C()
                        }),
                        onPointerDown: y(s.onPointerDown, e => {
                            w.current = e.pointerType
                        }),
                        onPointerMove: y(s.onPointerMove, e => {
                            var t;
                            w.current = e.pointerType, a ? null == (t = d.onItemLeave) || t.call(d) : "mouse" === w.current && e.currentTarget.focus({
                                preventScroll: !0
                            })
                        }),
                        onPointerLeave: y(s.onPointerLeave, e => {
                            var t;
                            e.currentTarget === document.activeElement && (null == (t = d.onItemLeave) || t.call(d))
                        }),
                        onKeyDown: y(s.onKeyDown, e => {
                            var t;
                            "" !== (null == (t = d.searchRef) ? void 0 : t.current) && " " === e.key || (A.includes(e.key) && C(), " " === e.key && e.preventDefault())
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
                className: a,
                style: o,
                ...s
            } = e, u = W(ev, r), c = $(ev, r), d = em(ev, r), f = B(ev, r), [p, m] = n.useState(null), h = x(t, e => m(e), d.onItemTextChange, e => {
                var t;
                return null == (t = c.itemTextRefCallback) ? void 0 : t.call(c, e, d.value, d.disabled)
            }), v = null == p ? void 0 : p.textContent, g = n.useMemo(() => (0, i.jsx)("option", {
                value: d.value,
                disabled: d.disabled,
                children: v
            }, d.value), [d.disabled, d.value, v]), {
                onNativeOptionAdd: y,
                onNativeOptionRemove: b
            } = f;
            return _(() => (y(g), () => b(g)), [y, b, g]), (0, i.jsxs)(i.Fragment, {
                children: [(0, i.jsx)(N.span, {
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
        return em(ey, r).isSelected ? (0, i.jsx)(N.span, {
            "aria-hidden": !0,
            ...n,
            ref: t
        }) : null
    }).displayName = ey;
    var eb = "SelectScrollUpButton";
    n.forwardRef((e, t) => {
        let r = $(eb, e.__scopeSelect),
            l = ea(eb, e.__scopeSelect),
            [a, o] = n.useState(!1),
            s = x(t, l.onScrollButtonChange);
        return _(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        o(t.scrollTop > 0)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), a ? (0, i.jsx)(ex, {
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
    }).displayName = eb;
    var ew = "SelectScrollDownButton";
    n.forwardRef((e, t) => {
        let r = $(ew, e.__scopeSelect),
            l = ea(ew, e.__scopeSelect),
            [a, o] = n.useState(!1),
            s = x(t, l.onScrollButtonChange);
        return _(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        o(Math.ceil(t.scrollTop) < e)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), a ? (0, i.jsx)(ex, {
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
    }).displayName = ew;
    var ex = n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onAutoScroll: l,
            ...a
        } = e, o = $("SelectScrollButton", r), s = n.useRef(null), u = I(r), c = n.useCallback(() => {
            null !== s.current && (window.clearInterval(s.current), s.current = null)
        }, []);
        return n.useEffect(() => () => c(), [c]), _(() => {
            var e, t;
            null == (t = u().find(e => e.ref.current === document.activeElement)) || null == (e = t.ref.current) || e.scrollIntoView({
                block: "nearest"
            })
        }, [u]), (0, i.jsx)(N.div, {
            "aria-hidden": !0,
            ...a,
            ref: t,
            style: {
                flexShrink: 0,
                ...a.style
            },
            onPointerDown: y(a.onPointerDown, () => {
                null === s.current && (s.current = window.setInterval(l, 50))
            }),
            onPointerMove: y(a.onPointerMove, () => {
                var e;
                null == (e = o.onItemLeave) || e.call(o), null === s.current && (s.current = window.setInterval(l, 50))
            }),
            onPointerLeave: y(a.onPointerLeave, () => {
                c()
            })
        })
    });
    n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e;
        return (0, i.jsx)(N.div, {
            "aria-hidden": !0,
            ...n,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var eC = "SelectArrow";

    function eS(e) {
        return "" === e || void 0 === e
    }
    n.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, l = F(r), a = W(eC, r), o = $(eC, r);
        return a.open && "popper" === o.position ? (0, i.jsx)(d.a, {
            ...l,
            ...n,
            ref: t
        }) : null
    }).displayName = eC;
    var eE = n.forwardRef((e, t) => {
        let r, {
                value: l,
                ...a
            } = e,
            o = n.useRef(null),
            s = x(t, o),
            u = (r = n.useRef({
                value: l,
                previous: l
            }), n.useMemo(() => (r.current.value !== l && (r.current.previous = r.current.value, r.current.value = l), r.current.previous), [l]));
        return n.useEffect(() => {
            let e = o.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
            if (u !== l && t) {
                let r = new Event("change", {
                    bubbles: !0
                });
                t.call(e, l), e.dispatchEvent(r)
            }
        }, [u, l]), (0, i.jsx)(j, {
            asChild: !0,
            children: (0, i.jsx)("select", {
                ...a,
                ref: s,
                defaultValue: l
            })
        })
    });

    function eN(e) {
        let t = R(e),
            r = n.useRef(""),
            l = n.useRef(0),
            a = n.useCallback(e => {
                let n = r.current + e;
                t(n),
                    function e(t) {
                        r.current = t, window.clearTimeout(l.current), "" !== t && (l.current = window.setTimeout(() => e(""), 1e3))
                    }(n)
            }, [t]),
            o = n.useCallback(() => {
                r.current = "", window.clearTimeout(l.current)
            }, []);
        return n.useEffect(() => () => window.clearTimeout(l.current), []), [r, a, o]
    }

    function eR(e, t, r) {
        var n;
        let l = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            a = (n = Math.max(r ? e.indexOf(r) : -1, 0), e.map((t, r) => e[(n + r) % e.length]));
        1 === l.length && (a = a.filter(e => e !== r));
        let o = a.find(e => e.textValue.toLowerCase().startsWith(l.toLowerCase()));
        return o !== r ? o : void 0
    }
    eE.displayName = "BubbleSelect", (0, m.s)(".foundation-web-menu-separator{border-top:1px solid var(--color-stroke-default)}");
    let eP = (0, n.createContext)(null),
        e_ = {
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
        eO = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        eA = {
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
        eM = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        eI = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        eT = (0, n.forwardRef)((e, t) => {
            let {
                label: l,
                labelTooltip: a,
                ariaLabelledBy: o,
                ariaLabel: i,
                className: s,
                size: u,
                variant: c = "Standard",
                value: d,
                placeholder: m,
                isDisabled: y,
                hasError: b,
                hint: w,
                onValueChange: x,
                onOpenChange: C,
                children: S
            } = e, E = (0, h.default)(), N = (0, n.useMemo)(() => ({
                size: u
            }), [u]), R = l ? n.default.createElement("span", {
                id: E,
                className: (0, r.default)(eO[u], "content-emphasis")
            }, l) : null;
            return n.default.createElement(eP.Provider, {
                value: N
            }, n.default.createElement("div", {
                className: (0, r.default)("flex flex-col", y && [p.disabledOpacity, "pointer-events-none"], ek[u], s)
            }, R && (a ? n.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, R, n.default.createElement(v.LabelTooltip, Object.assign({}, a))) : R), n.default.createElement(U, {
                value: d,
                disabled: y,
                onValueChange: x,
                onOpenChange: C
            }, n.default.createElement(K, {
                className: (0, r.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", g.INPUT_BACKGROUND_BY_VARIANT[c], g.INPUT_STROKE_BY_VARIANT[c], eM[u], eI[u], ej[u], eA[u], b ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === d ? "content-muted" : "content-default"),
                ref: t,
                "aria-labelledby": l ? E : o,
                "aria-label": i
            }, n.default.createElement(f.StateLayer, null), n.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, n.default.createElement(q, {
                placeholder: m
            })), n.default.createElement(Y, {
                className: (0, r.default)(e_[u], "icon icon-regular-chevron-large-down content-default")
            })), n.default.createElement(G, null, n.default.createElement(J, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, S))), w && n.default.createElement("span", {
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": b,
                    "content-default": !b
                })
            }, w)))
        });
    eT.displayName = "Dropdown", e.s(["D", 0, eT, "I", 0, eg, "V", 0, ei, "a", 0, eP, "b", 0, eh])
}, 532491, e => {
    "use strict";
    var t = e.i(443967),
        r = e.i(197649),
        n = e.i(416340);
    let l = (0, n.forwardRef)((e, l) => {
        var {
            className: a,
            style: o,
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
            }), d), o),
            className: (0, r.default)("stroke-default self-stretch", a)
        }))
    });
    l.displayName = "Divider", e.s(["Divider", 0, l])
}, 634851, e => {
    "use strict";
    var t = e.i(443967),
        r = e.i(197649),
        n = e.i(416340),
        l = e.i(353108),
        a = e.i(46079),
        o = e.i(183906);
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
                ariaLabel: b,
                isDisabled: w = !1,
                isCircular: x = !1,
                isSelected: C = !1,
                size: S = "Large",
                variant: E = "Emphasis",
                iconColor: N = "Default",
                asChild: R,
                children: P
            } = e, _ = (0, t._)(e, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]);
            v = w ? d[E] : C ? f[E] : c[E];
            let j = (0, r.default)("foundation-web-icon-button", w ? o.disabledOpacity : [a.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", i[S], u[S][x ? "circular" : "square"], v, g),
                O = n.default.createElement(n.default.Fragment, null, n.default.createElement(a.StateLayer, null), n.default.createElement("span", {
                    className: (0, r.default)("icon", y, s[S], w ? m[N][E] : p[N][E])
                }));
            if (R) {
                let e = (0, t._)(_, ["as"]),
                    r = n.default.Children.only(P);
                return n.default.createElement(l.S, Object.assign({
                    ref: h
                }, e, {
                    className: j,
                    "aria-label": b,
                    "aria-disabled": w || void 0
                }), n.default.cloneElement(r, {}, O))
            }
            if ("a" === _.as) {
                let {
                    as: e,
                    href: r
                } = _, l = (0, t._)(_, ["as", "href"]);
                return n.default.createElement("a", Object.assign({
                    ref: h
                }, l, {
                    "aria-label": b,
                    "aria-disabled": w,
                    href: w ? void 0 : r,
                    className: j
                }), O)
            }
            let A = (0, t._)(_, ["as"]);
            return n.default.createElement("button", Object.assign({
                ref: h,
                type: "button"
            }, A, {
                "aria-label": b,
                disabled: w,
                className: j
            }), O)
        });
    e.s(["IconButton", 0, h])
}, 110273, e => {
    "use strict";
    var t = e.i(443967),
        r = e.i(197649),
        n = e.i(416340),
        l = e.i(353108),
        a = e.i(131079),
        o = e.i(172367),
        i = e.i(46079),
        s = e.i(183906);
    e.i(221628), e.i(149285), e.i(511952), e.i(878382);
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
        } = e, c = (0, n.useContext)(a.a), d = c ? "dropdown" : "standalone", f = null != (t = null != s ? s : null == c ? void 0 : c.size) ? t : "Medium", p = (0, n.useMemo)(() => ({
            size: f,
            mode: d
        }), [f, d]), m = (0, r.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", u[f], i), h = "standalone" === d ? n.default.createElement(o.R, {
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
        }, "dropdown" === d ? n.default.createElement(a.V, {
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
            title: b,
            description: w,
            trailing: x,
            disabled: C,
            className: S,
            onSelect: E,
            asChild: N,
            children: R
        } = e, P = (0, t._)(e, ["value", "leading", "title", "description", "trailing", "disabled", "className", "onSelect", "asChild", "children"]);
        let {
            size: _,
            mode: j
        } = y(), O = (0, r.default)(i.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", h[_], d[_], f[_], p[_], v[_], C && s.disabledOpacity, C && "pointer-events-none", S), A = n.default.createElement("span", {
            className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
        }, b);
        switch (j) {
            case "dropdown":
                A = n.default.createElement(a.I, {
                    asChild: !0
                }, A);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", j)
        }
        let k = n.default.createElement(n.default.Fragment, null, !C && n.default.createElement(i.StateLayer, null), g, n.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", m[_])
        }, A, w && n.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, w)), x);
        if (N) {
            let e = (0, t._)(P, ["as"]),
                r = n.default.Children.only(R),
                a = void 0 === b && r.props.children;
            u = n.default.createElement(l.S, Object.assign({}, e, {
                role: "standalone" === j ? "menuitem" : void 0,
                "aria-disabled": C || void 0,
                className: O,
                style: {
                    outlineOffset: 0
                },
                onClick: C ? void 0 : E
            }), a ? n.default.cloneElement(r, {}, n.default.createElement(n.default.Fragment, null, !C && n.default.createElement(i.StateLayer, null), r.props.children)) : n.default.cloneElement(r, {}, k))
        } else if ("a" === P.as) {
            let {
                as: e,
                href: r
            } = P, l = (0, t._)(P, ["as", "href"]);
            u = n.default.createElement("a", Object.assign({}, l, {
                role: "standalone" === j ? "menuitem" : void 0,
                "aria-disabled": C,
                href: C ? void 0 : r,
                className: O,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: C ? void 0 : E
            }), k)
        } else {
            let e = (0, t._)(P, ["as"]);
            u = n.default.createElement("button", Object.assign({
                type: "button"
            }, e, {
                role: "standalone" === j ? "menuitem" : void 0,
                "aria-disabled": C,
                className: O,
                style: {
                    outlineOffset: 0
                },
                onClick: C ? void 0 : E
            }), k)
        }
        return "dropdown" === j ? n.default.createElement(a.b, {
            value: c,
            disabled: C,
            asChild: !0
        }, u) : n.default.createElement(o.I, {
            asChild: !0,
            focusable: !0,
            tabStopId: c
        }, u)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: l,
            leading: a,
            trailing: o,
            disabled: i,
            className: u
        } = e, {
            size: c
        } = y(), v = (0, r.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", h[c], d[c], f[c], p[c], i && s.disabledOpacity, u);
        return n.default.createElement("div", {
            role: "none",
            className: v
        }, a, n.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", m[c])
        }, n.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), l && n.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, l)), o)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: l
        } = e, {
            size: a
        } = y();
        return n.default.createElement("div", {
            role: "group",
            className: (0, r.default)(c[a], l)
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
}, 977690, e => {
    "use strict";
    var t = e.i(443967),
        r = e.i(416340),
        n = e.i(197649),
        l = e.i(647084);
    e.i(511952), e.i(221628), e.i(149285);
    let a = e => {
        var t, r, n, l;
        let a = null != (n = null == (r = null == (t = window.matchMedia) ? void 0 : t.call(window, "(pointer: coarse)")) ? void 0 : r.matches) && n,
            o = null == (l = document.activeElement) ? void 0 : l.matches(":focus-visible");
        if (a && !o) return void e.preventDefault();
        let i = e.currentTarget,
            s = null == i ? void 0 : i.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        s && (e.preventDefault(), s.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: n,
            onOpenChange: a,
            children: o
        } = e;
        return r.createElement(l.R, {
            open: t,
            defaultOpen: n,
            onOpenChange: a
        }, o)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: t,
            className: n,
            children: a
        } = e;
        return r.createElement(l.b, {
            asChild: t,
            className: n
        }, a)
    }, "PopoverClose", 0, function(e) {
        var {
            children: n
        } = e, a = (0, t._)(e, ["children"]);
        return r.createElement(l.a, Object.assign({}, a), n)
    }, "PopoverContent", 0, function(e) {
        var {
            side: o = "bottom",
            align: i = "center",
            sideOffset: s = 4,
            className: u,
            children: c,
            ariaLabel: d,
            onOpenAutoFocus: f
        } = e, p = (0, t._)(e, ["side", "align", "sideOffset", "className", "children", "ariaLabel", "onOpenAutoFocus"]);
        return r.createElement(l.P, null, r.createElement(l.C, Object.assign({
            side: o,
            align: i,
            sideOffset: s
        }, p, {
            "aria-label": null != d ? d : p["aria-label"],
            onOpenAutoFocus: null != f ? f : a,
            className: (0, n.default)("foundation-web-portal-zindex", u)
        }), c))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: n,
            className: a,
            children: o
        } = e;
        return r.createElement(l.T, {
            asChild: t,
            disabled: n,
            className: a
        }, o)
    }])
}, 660882, e => {
    "use strict";
    var t = e.i(443967),
        r = e.i(197649),
        n = e.i(416340),
        l = e.i(422711);
    e.i(511952), (0, l.s)("@keyframes progress-circle-rotate{0%{transform:rotate(0deg)}to{transform:rotate(1turn)}}.foundation-web-progress-circle-indeterminate{animation:progress-circle-rotate 1.4s linear infinite;transform-origin:50% 50%}");
    let a = {
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
        o = n.default.forwardRef((e, l) => {
            var {
                className: o,
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
            } = a[i], g = (p - m) / 2, y = 2 * Math.PI * g, b = p / 2, w = Math.min(100, Math.max(0, u)), x = c && void 0 !== v ? v : p, C = "Determinate" === s;
            return n.default.createElement("div", Object.assign({
                ref: l,
                className: (0, r.default)("foundation-web-progress-circle inline-flex items-center justify-center", o),
                role: "progressbar",
                "aria-label": d,
                "aria-valuemin": C ? 0 : void 0,
                "aria-valuemax": C ? 100 : void 0,
                "aria-valuenow": C ? w : void 0,
                style: {
                    width: x,
                    height: x
                }
            }, f), n.default.createElement("svg", {
                width: p,
                height: p,
                viewBox: "0 0 ".concat(p, " ").concat(p),
                className: "relative"
            }, n.default.createElement("circle", {
                cx: b,
                cy: b,
                r: g,
                fill: "none",
                strokeWidth: m,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), n.default.createElement("circle", {
                cx: b,
                cy: b,
                r: g,
                fill: "none",
                strokeWidth: m,
                strokeDasharray: C ? y : "".concat(.75 * y, " ").concat(.25 * y),
                strokeDashoffset: C ? y * (1 - w / 100) : 0,
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
            }, n.default.createElement("span", null, Math.round(w)), n.default.createElement("span", null, "%")))
        });
    o.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, o])
}, 637310, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(278705),
        n = e.i(799724);
    e.i(221628), e.i(149285), e.i(511952), e.s(["LabelTooltip", 0, e => {
        let {
            title: l,
            description: a,
            position: o = "top-center"
        } = e;
        return t.default.createElement(n.Tooltip, {
            position: o,
            title: l,
            description: a
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
}, 878382, e => {
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
}, 321774, e => {
    "use strict";
    e.s(["c", 0, function(e, t) {
        let [r, n] = t;
        return Math.min(n, Math.max(r, e))
    }])
}, 443372, e => {
    "use strict";
    var t, r = e.i(416340),
        n = e.i(924175);
    e.i(149285);
    var l = e.i(221628);

    function a(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }
    var o = Symbol("radix.slottable");

    function i(e) {
        return r.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === o
    }
    var s = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
            var n, o;
            let s, u, c, d = (o = n = "Primitive.".concat(t), (s = r.forwardRef((e, t) => {
                    let {
                        children: n,
                        ...l
                    } = e;
                    if (r.isValidElement(n)) {
                        var o, i;
                        let e, s = (e = null == (o = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? n.ref : (e = null == (i = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : i.get) && "isReactWarning" in e && e.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                            u = function(e, t) {
                                let r = {
                                    ...t
                                };
                                for (let n in t) {
                                    let l = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? l && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        a(...t), l(...t)
                                    } : l && (r[n] = l) : "style" === n ? r[n] = {
                                        ...l,
                                        ...a
                                    } : "className" === n && (r[n] = [l, a].filter(Boolean).join(" "))
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
                                        let n = a(t, e);
                                        return r || "function" != typeof n || (r = !0), n
                                    });
                                if (r) return () => {
                                    for (let e = 0; e < n.length; e++) {
                                        let r = n[e];
                                        "function" == typeof r ? r() : a(t[e], null)
                                    }
                                }
                            }
                        }(t, s) : s), r.cloneElement(n, u)
                    }
                    return r.Children.count(n) > 1 ? r.Children.only(null) : null
                })).displayName = "".concat(o, ".SlotClone"), u = s, (c = r.forwardRef((e, t) => {
                    let {
                        children: n,
                        ...a
                    } = e, o = r.Children.toArray(n), s = o.find(i);
                    if (s) {
                        let e = s.props.children,
                            n = o.map(t => t === s ? r.Children.count(e) > 1 ? r.Children.only(null) : r.isValidElement(e) ? e.props.children : null : t);
                        return (0, l.jsx)(u, {
                            ...a,
                            ref: t,
                            children: r.isValidElement(e) ? r.cloneElement(e, void 0, n) : null
                        })
                    }
                    return (0, l.jsx)(u, {
                        ...a,
                        ref: t,
                        children: n
                    })
                })).displayName = "".concat(n, ".Slot"), c),
                f = r.forwardRef((e, r) => {
                    let {
                        asChild: n,
                        ...a
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, l.jsx)(n ? d : t, {
                        ...a,
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
                height: a = 5,
                ...o
            } = e;
            return (0, l.jsx)(s.svg, {
                ...o,
                ref: t,
                width: n,
                height: a,
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
            var n, a;
            let o, i, s, u = (a = n = "Primitive.".concat(t), (o = r.forwardRef((e, t) => {
                    let {
                        children: n,
                        ...l
                    } = e;
                    if (r.isValidElement(n)) {
                        var a, o;
                        let e, i = (e = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning ? n.ref : (e = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                            s = function(e, t) {
                                let r = {
                                    ...t
                                };
                                for (let n in t) {
                                    let l = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? l && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        a(...t), l(...t)
                                    } : l && (r[n] = l) : "style" === n ? r[n] = {
                                        ...l,
                                        ...a
                                    } : "className" === n && (r[n] = [l, a].filter(Boolean).join(" "))
                                }
                                return {
                                    ...e,
                                    ...r
                                }
                            }(l, n.props);
                        return n.type !== r.Fragment && (s.ref = t ? d(t, i) : i), r.cloneElement(n, s)
                    }
                    return r.Children.count(n) > 1 ? r.Children.only(null) : null
                })).displayName = "".concat(a, ".SlotClone"), i = o, (s = r.forwardRef((e, t) => {
                    let {
                        children: n,
                        ...a
                    } = e, o = r.Children.toArray(n), s = o.find(m);
                    if (s) {
                        let e = s.props.children,
                            n = o.map(t => t === s ? r.Children.count(e) > 1 ? r.Children.only(null) : r.isValidElement(e) ? e.props.children : null : t);
                        return (0, l.jsx)(i, {
                            ...a,
                            ref: t,
                            children: r.isValidElement(e) ? r.cloneElement(e, void 0, n) : null
                        })
                    }
                    return (0, l.jsx)(i, {
                        ...a,
                        ref: t,
                        children: n
                    })
                })).displayName = "".concat(n, ".Slot"), s),
                c = r.forwardRef((e, r) => {
                    let {
                        asChild: n,
                        ...a
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, l.jsx)(n ? u : t, {
                        ...a,
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
        [y, b] = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                n = [],
                a = () => {
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
            return a.scopeName = e, [function(t, a) {
                let o = r.createContext(a),
                    i = n.length;
                n = [...n, a];
                let s = t => {
                    var n;
                    let {
                        scope: a,
                        children: s,
                        ...u
                    } = t, c = (null == a || null == (n = a[e]) ? void 0 : n[i]) || o, d = r.useMemo(() => u, Object.values(u));
                    return (0, l.jsx)(c.Provider, {
                        value: d,
                        children: s
                    })
                };
                return s.displayName = t + "Provider", [s, function(n, l) {
                    var s;
                    let u = (null == l || null == (s = l[e]) ? void 0 : s[i]) || o,
                        c = r.useContext(u);
                    if (c) return c;
                    if (void 0 !== a) return a;
                    throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                }]
            }, function() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                let l = t[0];
                if (1 === t.length) return l;
                let a = () => {
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
                return a.scopeName = l.scopeName, a
            }(a, ...t)]
        }(g),
        [w, x] = y(g),
        C = e => {
            let {
                __scopePopper: t,
                children: n
            } = e, [a, o] = r.useState(null);
            return (0, l.jsx)(w, {
                scope: t,
                anchor: a,
                onAnchorChange: o,
                children: n
            })
        };
    C.displayName = g;
    var S = "PopperAnchor",
        E = r.forwardRef((e, t) => {
            let {
                __scopePopper: n,
                virtualRef: a,
                ...o
            } = e, i = x(S, n), s = r.useRef(null), u = f(t, s);
            return r.useEffect(() => {
                i.onAnchorChange((null == a ? void 0 : a.current) || s.current)
            }), a ? null : (0, l.jsx)(h.div, {
                ...o,
                ref: u
            })
        });
    E.displayName = S;
    var N = "PopperContent",
        [R, P] = y(N),
        _ = r.forwardRef((e, t) => {
            var a, o, i, s, u, c, d, p;
            let m, {
                    __scopePopper: g,
                    side: y = "bottom",
                    sideOffset: b = 0,
                    align: w = "center",
                    alignOffset: C = 0,
                    arrowPadding: S = 0,
                    avoidCollisions: E = !0,
                    collisionBoundary: P = [],
                    collisionPadding: _ = 0,
                    sticky: j = "partial",
                    hideWhenDetached: O = !1,
                    updatePositionStrategy: A = "optimized",
                    onPlaced: T,
                    ...D
                } = e,
                L = x(N, g),
                [F, z] = r.useState(null),
                W = f(t, e => z(e)),
                [V, B] = r.useState(null),
                U = function(e) {
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
                                let a = t[0];
                                if ("borderBoxSize" in a) {
                                    let e = a.borderBoxSize,
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
                }(V),
                H = null != (a = null == U ? void 0 : U.width) ? a : 0,
                K = null != (o = null == U ? void 0 : U.height) ? o : 0,
                X = "number" == typeof _ ? _ : {
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    ..._
                },
                q = Array.isArray(P) ? P : [P],
                Y = q.length > 0,
                G = {
                    padding: X,
                    boundary: q.filter(k),
                    altBoundary: Y
                },
                {
                    refs: Z,
                    floatingStyles: J,
                    placement: Q,
                    isPositioned: $,
                    middlewareData: ee
                } = (0, n.u)({
                    strategy: "fixed",
                    placement: y + ("center" !== w ? "-" + w : ""),
                    whileElementsMounted: function() {
                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        return (0, n.a)(...t, {
                            animationFrame: "always" === A
                        })
                    },
                    elements: {
                        reference: L.anchor
                    },
                    middleware: [(0, n.o)({
                        mainAxis: b + K,
                        alignmentAxis: C
                    }), E && (0, n.s)({
                        mainAxis: !0,
                        crossAxis: !1,
                        limiter: "partial" === j ? (0, n.l)() : void 0,
                        ...G
                    }), E && (0, n.f)({
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
                                width: a,
                                height: o
                            } = r.reference, i = t.floating.style;
                            i.setProperty("--radix-popper-available-width", "".concat(n, "px")), i.setProperty("--radix-popper-available-height", "".concat(l, "px")), i.setProperty("--radix-popper-anchor-width", "".concat(a, "px")), i.setProperty("--radix-popper-anchor-height", "".concat(o, "px"))
                        }
                    }), V && (0, n.c)({
                        element: V,
                        padding: S
                    }), M({
                        arrowWidth: H,
                        arrowHeight: K
                    }), O && (0, n.h)({
                        strategy: "referenceHidden",
                        ...G
                    })]
                }),
                [et, er] = I(Q),
                en = (m = r.useRef(T), r.useEffect(() => {
                    m.current = T
                }), r.useMemo(() => function() {
                    for (var e, t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    return null == (e = m.current) ? void 0 : e.call(m, ...r)
                }, []));
            v(() => {
                $ && (null == en || en())
            }, [$, en]);
            let el = null == (i = ee.arrow) ? void 0 : i.x,
                ea = null == (s = ee.arrow) ? void 0 : s.y,
                eo = 0 !== (null == (u = ee.arrow) ? void 0 : u.centerOffset),
                [ei, es] = r.useState();
            return v(() => {
                F && es(window.getComputedStyle(F).zIndex)
            }, [F]), (0, l.jsx)("div", {
                ref: Z.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...J,
                    transform: $ ? J.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: ei,
                    "--radix-popper-transform-origin": [null == (c = ee.transformOrigin) ? void 0 : c.x, null == (d = ee.transformOrigin) ? void 0 : d.y].join(" "),
                    ...(null == (p = ee.hide) ? void 0 : p.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, l.jsx)(R, {
                    scope: g,
                    placedSide: et,
                    onArrowChange: B,
                    arrowX: el,
                    arrowY: ea,
                    shouldHideArrow: eo,
                    children: (0, l.jsx)(h.div, {
                        "data-side": et,
                        "data-align": er,
                        ...D,
                        ref: W,
                        style: {
                            ...D.style,
                            animation: $ ? void 0 : "none"
                        }
                    })
                })
            })
        });
    _.displayName = N;
    var j = "PopperArrow",
        O = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        A = r.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, a = P(j, r), o = O[a.placedSide];
            return (0, l.jsx)("span", {
                ref: a.onArrowChange,
                style: {
                    position: "absolute",
                    left: a.arrowX,
                    top: a.arrowY,
                    [o]: 0,
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

    function k(e) {
        return null !== e
    }
    A.displayName = j;
    var M = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, n, l, a, o;
            let {
                placement: i,
                rects: s,
                middlewareData: u
            } = t, c = 0 !== (null == (l = u.arrow) ? void 0 : l.centerOffset), d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, m] = I(i), h = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], v = (null != (r = null == (a = u.arrow) ? void 0 : a.x) ? r : 0) + d / 2, g = (null != (n = null == (o = u.arrow) ? void 0 : o.y) ? n : 0) + f / 2, y = "", b = "";
            return "bottom" === p ? (y = c ? h : "".concat(v, "px"), b = -f + "px") : "top" === p ? (y = c ? h : "".concat(v, "px"), b = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = -f + "px", b = c ? h : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), b = c ? h : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: b
                }
            }
        }
    });

    function I(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["A", 0, E, "C", 0, _, "R", 0, C, "a", 0, A, "c", 0, b])
}, 70370, e => {
    "use strict";
    var t = e.i(416340);
    e.i(221628);
    var r = t.createContext(void 0);
    e.s(["u", 0, function(e) {
        let n = t.useContext(r);
        return e || n || "ltr"
    }])
}, 647084, e => {
    "use strict";
    var t, r = e.i(416340),
        n = e.i(221628),
        l = e.i(708788),
        a = e.i(474522),
        o = e.i(443372);

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
                    present: a,
                    children: o
                } = e,
                i = function(e) {
                    var t, n;
                    let [l, a] = r.useState(), o = r.useRef({}), i = r.useRef(e), s = r.useRef("none"), [u, c] = (t = e ? "mounted" : "unmounted", n = {
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
                        let e = p(o.current);
                        s.current = "mounted" === u ? e : "none"
                    }, [u]), d(() => {
                        let t = o.current,
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
                                    let n = p(o.current).includes(e.animationName);
                                    if (e.target === l && n && (c("ANIMATION_END"), !i.current)) {
                                        let e = l.style.animationFillMode;
                                        l.style.animationFillMode = "forwards", t = r.setTimeout(() => {
                                            "forwards" === l.style.animationFillMode && (l.style.animationFillMode = e)
                                        })
                                    }
                                },
                                a = e => {
                                    e.target === l && (s.current = p(o.current))
                                };
                            return l.addEventListener("animationstart", a), l.addEventListener("animationcancel", n), l.addEventListener("animationend", n), () => {
                                r.clearTimeout(t), l.removeEventListener("animationstart", a), l.removeEventListener("animationcancel", n), l.removeEventListener("animationend", n)
                            }
                        }
                        c("ANIMATION_END")
                    }, [l, c]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(u),
                        ref: r.useCallback(e => {
                            e && (o.current = getComputedStyle(e)), a(e)
                        }, [])
                    }
                }(a),
                s = "function" == typeof o ? o({
                    present: i.isPresent
                }) : r.Children.only(o),
                u = c(i.ref, (l = null == (t = Object.getOwnPropertyDescriptor(s.props, "ref")) ? void 0 : t.get) && "isReactWarning" in l && l.isReactWarning ? s.ref : (l = null == (n = Object.getOwnPropertyDescriptor(s, "ref")) ? void 0 : n.get) && "isReactWarning" in l && l.isReactWarning ? s.props.ref : s.props.ref || s.ref);
            return "function" == typeof o || i.isPresent ? r.cloneElement(s, {
                ref: u
            }) : null
        };

    function p(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }

    function m(e) {
        var t;
        let l, a = (t = e, (l = r.forwardRef((e, t) => {
                let {
                    children: n,
                    ...l
                } = e;
                if (r.isValidElement(n)) {
                    var a, o;
                    let e, i = (e = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning ? n.ref : (e = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                        s = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let l = e[n],
                                    a = t[n];
                                /^on[A-Z]/.test(n) ? l && a ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    a(...t), l(...t)
                                } : l && (r[n] = l) : "style" === n ? r[n] = {
                                    ...l,
                                    ...a
                                } : "className" === n && (r[n] = [l, a].filter(Boolean).join(" "))
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
            o = r.forwardRef((e, t) => {
                let {
                    children: l,
                    ...o
                } = e, i = r.Children.toArray(l), s = i.find(v);
                if (s) {
                    let e = s.props.children,
                        l = i.map(t => t === s ? r.Children.count(e) > 1 ? r.Children.only(null) : r.isValidElement(e) ? e.props.children : null : t);
                    return (0, n.jsx)(a, {
                        ...o,
                        ref: t,
                        children: r.isValidElement(e) ? r.cloneElement(e, void 0, l) : null
                    })
                }
                return (0, n.jsx)(a, {
                    ...o,
                    ref: t,
                    children: l
                })
            });
        return o.displayName = "".concat(e, ".Slot"), o
    }
    f.displayName = "Presence";
    var h = Symbol("radix.slottable");

    function v(e) {
        return r.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === h
    }
    var g = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
        let l = m("Primitive.".concat(t)),
            a = r.forwardRef((e, r) => {
                let {
                    asChild: a,
                    ...o
                } = e;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, n.jsx)(a ? l : t, {
                    ...o,
                    ref: r
                })
            });
        return a.displayName = "Primitive.".concat(t), {
            ...e,
            [t]: a
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
    var b = "Popover",
        [w, x] = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                l = [],
                a = () => {
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
            return a.scopeName = e, [function(t, a) {
                let o = r.createContext(a),
                    i = l.length;
                l = [...l, a];
                let s = t => {
                    var l;
                    let {
                        scope: a,
                        children: s,
                        ...u
                    } = t, c = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o, d = r.useMemo(() => u, Object.values(u));
                    return (0, n.jsx)(c.Provider, {
                        value: d,
                        children: s
                    })
                };
                return s.displayName = t + "Provider", [s, function(n, l) {
                    var s;
                    let u = (null == l || null == (s = l[e]) ? void 0 : s[i]) || o,
                        c = r.useContext(u);
                    if (c) return c;
                    if (void 0 !== a) return a;
                    throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                }]
            }, function() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                let l = t[0];
                if (1 === t.length) return l;
                let a = () => {
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
                return a.scopeName = l.scopeName, a
            }(a, ...t)]
        }(b, [o.c]),
        C = (0, o.c)(),
        [S, E] = w(b),
        N = e => {
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
                } = e, [a, o] = function(e) {
                    let {
                        defaultProp: t,
                        onChange: n
                    } = e, l = r.useState(t), [a] = l, o = r.useRef(a), i = y(n);
                    return r.useEffect(() => {
                        o.current !== a && (i(a), o.current = a)
                    }, [a, o, i]), l
                }({
                    defaultProp: n,
                    onChange: l
                }), i = void 0 !== t, s = i ? t : a, u = y(l);
                return [s, r.useCallback(e => {
                    if (i) {
                        let r = "function" == typeof e ? e(t) : e;
                        r !== t && u(r)
                    } else o(e)
                }, [i, t, o, u])]
            }({
                prop: i,
                defaultProp: s,
                onChange: u
            });
            return (0, n.jsx)(o.R, {
                ...d,
                children: (0, n.jsx)(S, {
                    scope: t,
                    contentId: (0, a.u)(),
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
    N.displayName = b;
    var R = "PopoverAnchor",
        P = r.forwardRef((e, t) => {
            let {
                __scopePopover: l,
                ...a
            } = e, i = E(R, l), s = C(l), {
                onCustomAnchorAdd: u,
                onCustomAnchorRemove: c
            } = i;
            return r.useEffect(() => (u(), () => c()), [u, c]), (0, n.jsx)(o.A, {
                ...s,
                ...a,
                ref: t
            })
        });
    P.displayName = R;
    var _ = "PopoverTrigger",
        j = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...l
            } = e, a = E(_, r), s = C(r), u = c(t, a.triggerRef), d = (0, n.jsx)(g.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": a.open,
                "aria-controls": a.contentId,
                "data-state": U(a.open),
                ...l,
                ref: u,
                onClick: i(e.onClick, a.onOpenToggle)
            });
            return a.hasCustomAnchor ? d : (0, n.jsx)(o.A, {
                asChild: !0,
                ...s,
                children: d
            })
        });
    j.displayName = _;
    var O = "PopoverPortal",
        [A, k] = w(O, {
            forceMount: void 0
        }),
        M = e => {
            let {
                __scopePopover: t,
                forceMount: r,
                children: a,
                container: o
            } = e, i = E(O, t);
            return (0, n.jsx)(A, {
                scope: t,
                forceMount: r,
                children: (0, n.jsx)(f, {
                    present: r || i.open,
                    children: (0, n.jsx)(l.P, {
                        asChild: !0,
                        container: o,
                        children: a
                    })
                })
            })
        };
    M.displayName = O;
    var I = "PopoverContent",
        T = r.forwardRef((e, t) => {
            let r = k(I, e.__scopePopover),
                {
                    forceMount: l = r.forceMount,
                    ...a
                } = e,
                o = E(I, e.__scopePopover);
            return (0, n.jsx)(f, {
                present: l || o.open,
                children: o.modal ? (0, n.jsx)(L, {
                    ...a,
                    ref: t
                }) : (0, n.jsx)(F, {
                    ...a,
                    ref: t
                })
            })
        });
    T.displayName = I;
    var D = m("PopoverContent.RemoveScroll"),
        L = r.forwardRef((e, t) => {
            let a = E(I, e.__scopePopover),
                o = r.useRef(null),
                s = c(t, o),
                u = r.useRef(!1);
            return r.useEffect(() => {
                let e = o.current;
                if (e) return (0, l.h)(e)
            }, []), (0, n.jsx)(l.R, {
                as: D,
                allowPinchZoom: !0,
                children: (0, n.jsx)(z, {
                    ...e,
                    ref: s,
                    trapFocus: a.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: i(e.onCloseAutoFocus, e => {
                        var t;
                        e.preventDefault(), u.current || null == (t = a.triggerRef.current) || t.focus()
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
            let l = E(I, e.__scopePopover),
                a = r.useRef(!1),
                o = r.useRef(!1);
            return (0, n.jsx)(z, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var r, n;
                    null == (r = e.onCloseAutoFocus) || r.call(e, t), t.defaultPrevented || (a.current || null == (n = l.triggerRef.current) || n.focus(), t.preventDefault()), a.current = !1, o.current = !1
                },
                onInteractOutside: t => {
                    var r, n;
                    null == (r = e.onInteractOutside) || r.call(e, t), t.defaultPrevented || (a.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                    let i = t.target;
                    (null == (n = l.triggerRef.current) ? void 0 : n.contains(i)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                }
            })
        }),
        z = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                trapFocus: a,
                onOpenAutoFocus: i,
                onCloseAutoFocus: s,
                disableOutsidePointerEvents: u,
                onEscapeKeyDown: c,
                onPointerDownOutside: d,
                onFocusOutside: f,
                onInteractOutside: p,
                ...m
            } = e, h = E(I, r), v = C(r);
            return (0, l.u)(), (0, n.jsx)(l.F, {
                asChild: !0,
                loop: !0,
                trapped: a,
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
                    children: (0, n.jsx)(o.C, {
                        "data-state": U(h.open),
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
        W = "PopoverClose",
        V = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...l
            } = e, a = E(W, r);
            return (0, n.jsx)(g.button, {
                type: "button",
                ...l,
                ref: t,
                onClick: i(e.onClick, () => a.onOpenChange(!1))
            })
        });
    V.displayName = W;
    var B = r.forwardRef((e, t) => {
        let {
            __scopePopover: r,
            ...l
        } = e, a = C(r);
        return (0, n.jsx)(o.a, {
            ...a,
            ...l,
            ref: t
        })
    });

    function U(e) {
        return e ? "open" : "closed"
    }
    B.displayName = "PopoverArrow", e.s(["A", 0, B, "C", 0, T, "P", 0, M, "R", 0, N, "T", 0, j, "a", 0, V, "b", 0, P])
}, 172367, e => {
    "use strict";
    var t, r = e.i(416340),
        n = e.i(221628),
        l = e.i(474522);
    e.i(149285);
    var a = e.i(70370);

    function o(e, t) {
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
            a = () => {
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
        return a.scopeName = e, [function(t, a) {
            let o = r.createContext(a),
                i = l.length;
            l = [...l, a];
            let s = t => {
                var l;
                let {
                    scope: a,
                    children: s,
                    ...u
                } = t, c = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o, d = r.useMemo(() => u, Object.values(u));
                return (0, n.jsx)(c.Provider, {
                    value: d,
                    children: s
                })
            };
            return s.displayName = t + "Provider", [s, function(n, l) {
                var s;
                let u = (null == l || null == (s = l[e]) ? void 0 : s[i]) || o,
                    c = r.useContext(u);
                if (c) return c;
                if (void 0 !== a) return a;
                throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            let l = t[0];
            if (1 === t.length) return l;
            let a = () => {
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
            return a.scopeName = l.scopeName, a
        }(a, ...t)]
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
        let l, a = (t = e, (l = r.forwardRef((e, t) => {
                let {
                    children: n,
                    ...l
                } = e;
                if (r.isValidElement(n)) {
                    var a, o;
                    let e, i = (e = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning ? n.ref : (e = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                        s = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let l = e[n],
                                    a = t[n];
                                /^on[A-Z]/.test(n) ? l && a ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    let n = a(...t);
                                    return l(...t), n
                                } : l && (r[n] = l) : "style" === n ? r[n] = {
                                    ...l,
                                    ...a
                                } : "className" === n && (r[n] = [l, a].filter(Boolean).join(" "))
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
            o = r.forwardRef((e, t) => {
                let {
                    children: l,
                    ...o
                } = e, i = r.Children.toArray(l), s = i.find(p);
                if (s) {
                    let e = s.props.children,
                        l = i.map(t => t === s ? r.Children.count(e) > 1 ? r.Children.only(null) : r.isValidElement(e) ? e.props.children : null : t);
                    return (0, n.jsx)(a, {
                        ...o,
                        ref: t,
                        children: r.isValidElement(e) ? r.cloneElement(e, void 0, l) : null
                    })
                }
                return (0, n.jsx)(a, {
                    ...o,
                    ref: t,
                    children: l
                })
            });
        return o.displayName = "".concat(e, ".Slot"), o
    }
    var f = Symbol("radix.slottable");

    function p(e) {
        return r.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === f
    }
    var m = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, t) => {
            let l = d("Primitive.".concat(t)),
                a = r.forwardRef((e, r) => {
                    let {
                        asChild: a,
                        ...o
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, n.jsx)(a ? l : t, {
                        ...o,
                        ref: r
                    })
                });
            return a.displayName = "Primitive.".concat(t), {
                ...e,
                [t]: a
            }
        }, {}),
        h = (null == (t = globalThis) ? void 0 : t.document) ? r.useLayoutEffect : () => {},
        v = r[" useInsertionEffect ".trim().toString()] || h,
        g = "rovingFocusGroup.onEntryFocus",
        y = {
            bubbles: !1,
            cancelable: !0
        },
        b = "RovingFocusGroup",
        [w, x, C] = function(e) {
            let t = e + "CollectionProvider",
                [l, a] = i(t),
                [o, s] = l(t, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }),
                u = e => {
                    let {
                        scope: t,
                        children: l
                    } = e, a = r.default.useRef(null), i = r.default.useRef(new Map).current;
                    return (0, n.jsx)(o, {
                        scope: t,
                        itemMap: i,
                        collectionRef: a,
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
                    } = e, a = c(t, s(f, r).collectionRef);
                    return (0, n.jsx)(p, {
                        ref: a,
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
                        children: a,
                        ...o
                    } = e, i = r.default.useRef(null), u = c(t, i), d = s(h, l);
                    return r.default.useEffect(() => (d.itemMap.set(i, {
                        ref: i,
                        ...o
                    }), () => {
                        d.itemMap.delete(i)
                    })), (0, n.jsx)(g, {
                        [v]: "",
                        ref: u,
                        children: a
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
            }, a]
        }(b),
        [S, E] = i(b, [C]),
        [N, R] = S(b),
        P = r.forwardRef((e, t) => (0, n.jsx)(w.Provider, {
            scope: e.__scopeRovingFocusGroup,
            children: (0, n.jsx)(w.Slot, {
                scope: e.__scopeRovingFocusGroup,
                children: (0, n.jsx)(_, {
                    ...e,
                    ref: t
                })
            })
        }));
    P.displayName = b;
    var _ = r.forwardRef((e, t) => {
            let l, {
                    __scopeRovingFocusGroup: i,
                    orientation: s,
                    loop: u = !1,
                    dir: d,
                    currentTabStopId: f,
                    defaultCurrentTabStopId: p,
                    onCurrentTabStopIdChange: h,
                    onEntryFocus: w,
                    preventScrollOnEntryFocus: C = !1,
                    ...S
                } = e,
                E = r.useRef(null),
                R = c(t, E),
                P = (0, a.u)(d),
                [_, j] = function(e) {
                    let {
                        prop: t,
                        defaultProp: n,
                        onChange: l = () => {},
                        caller: a
                    } = e, [o, i, s] = function(e) {
                        let {
                            defaultProp: t,
                            onChange: n
                        } = e, [l, a] = r.useState(t), o = r.useRef(l), i = r.useRef(n);
                        return v(() => {
                            i.current = n
                        }, [n]), r.useEffect(() => {
                            var e;
                            o.current !== l && (null == (e = i.current) || e.call(i, l), o.current = l)
                        }, [l, o]), [l, a, i]
                    }({
                        defaultProp: n,
                        onChange: l
                    }), u = void 0 !== t, c = u ? t : o;
                    {
                        let e = r.useRef(void 0 !== t);
                        r.useEffect(() => {
                            let t = e.current;
                            if (t !== u) {
                                let e = u ? "controlled" : "uncontrolled";
                                console.warn("".concat(a, " is changing from ").concat(t ? "controlled" : "uncontrolled", " to ").concat(e, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                            }
                            e.current = u
                        }, [u, a])
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
                    caller: b
                }),
                [O, A] = r.useState(!1),
                M = (l = r.useRef(w), r.useEffect(() => {
                    l.current = w
                }), r.useMemo(() => function() {
                    for (var e, t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    return null == (e = l.current) ? void 0 : e.call(l, ...r)
                }, [])),
                I = x(i),
                T = r.useRef(!1),
                [D, L] = r.useState(0);
            return r.useEffect(() => {
                let e = E.current;
                if (e) return e.addEventListener(g, M), () => e.removeEventListener(g, M)
            }, [M]), (0, n.jsx)(N, {
                scope: i,
                orientation: s,
                dir: P,
                loop: u,
                currentTabStopId: _,
                onItemFocus: r.useCallback(e => j(e), [j]),
                onItemShiftTab: r.useCallback(() => A(!0), []),
                onFocusableItemAdd: r.useCallback(() => L(e => e + 1), []),
                onFocusableItemRemove: r.useCallback(() => L(e => e - 1), []),
                children: (0, n.jsx)(m.div, {
                    tabIndex: O || 0 === D ? -1 : 0,
                    "data-orientation": s,
                    ...S,
                    ref: R,
                    style: {
                        outline: "none",
                        ...e.style
                    },
                    onMouseDown: o(e.onMouseDown, () => {
                        T.current = !0
                    }),
                    onFocus: o(e.onFocus, e => {
                        let t = !T.current;
                        if (e.target === e.currentTarget && t && !O) {
                            let t = new CustomEvent(g, y);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = I().filter(e => e.focusable);
                                k([e.find(e => e.active), e.find(e => e.id === _), ...e].filter(Boolean).map(e => e.ref.current), C)
                            }
                        }
                        T.current = !1
                    }),
                    onBlur: o(e.onBlur, () => A(!1))
                })
            })
        }),
        j = "RovingFocusGroupItem",
        O = r.forwardRef((e, t) => {
            let {
                __scopeRovingFocusGroup: a,
                focusable: i = !0,
                active: s = !1,
                tabStopId: u,
                children: c,
                ...d
            } = e, f = (0, l.u)(), p = u || f, h = R(j, a), v = h.currentTabStopId === p, g = x(a), {
                onFocusableItemAdd: y,
                onFocusableItemRemove: b,
                currentTabStopId: C
            } = h;
            return r.useEffect(() => {
                if (i) return y(), () => b()
            }, [i, y, b]), (0, n.jsx)(w.ItemSlot, {
                scope: a,
                id: p,
                focusable: i,
                active: s,
                children: (0, n.jsx)(m.span, {
                    tabIndex: v ? 0 : -1,
                    "data-orientation": h.orientation,
                    ...d,
                    ref: t,
                    onMouseDown: o(e.onMouseDown, e => {
                        i ? h.onItemFocus(p) : e.preventDefault()
                    }),
                    onFocus: o(e.onFocus, () => h.onItemFocus(p)),
                    onKeyDown: o(e.onKeyDown, e => {
                        var t, r, n, l, a;
                        let o;
                        if ("Tab" === e.key && e.shiftKey) return void h.onItemShiftTab();
                        if (e.target !== e.currentTarget) return;
                        let i = (n = h.orientation, l = h.dir, a = e.key, o = "rtl" !== l ? a : "ArrowLeft" === a ? "ArrowRight" : "ArrowRight" === a ? "ArrowLeft" : a, "vertical" === n && ["ArrowLeft", "ArrowRight"].includes(o) || "horizontal" === n && ["ArrowUp", "ArrowDown"].includes(o) ? void 0 : A[o]);
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
                            setTimeout(() => k(n))
                        }
                    }),
                    children: "function" == typeof c ? c({
                        isCurrentTabStop: v,
                        hasTabStop: null != C
                    }) : c
                })
            })
        });
    O.displayName = j;
    var A = {
        ArrowLeft: "prev",
        ArrowUp: "prev",
        ArrowRight: "next",
        ArrowDown: "next",
        PageUp: "first",
        Home: "first",
        PageDown: "last",
        End: "last"
    };

    function k(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            r = document.activeElement;
        for (let n of e)
            if (n === r || (n.focus({
                    preventScroll: t
                }), document.activeElement !== r)) return
    }
    e.s(["I", 0, O, "R", 0, P, "c", 0, E])
}, 749633, e => {
    "use strict";
    var t = e.i(416340),
        r = "u" > typeof globalThis ? globalThis : "u" > typeof window ? window : e.g,
        n = "object" == typeof r && r && r.Object === Object && r,
        l = "object" == typeof self && self && self.Object === Object && self;
    n || l || Function("return this")();
    var a = "u" > typeof window ? t.useLayoutEffect : t.useEffect,
        o = "u" < typeof window;
    e.s(["u", 0, function(e) {
        let {
            defaultValue: r = !1,
            initializeWithValue: n = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, l = e => o ? r : window.matchMedia(e).matches, [i, s] = (0, t.useState)(() => n ? l(e) : r);

        function u() {
            s(l(e))
        }
        return a(() => {
            let t = window.matchMedia(e);
            return u(), t.addListener ? t.addListener(u) : t.addEventListener("change", u), () => {
                t.removeListener ? t.removeListener(u) : t.removeEventListener("change", u)
            }
        }, [e]), i
    }])
}, 975980, e => {
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

    function a() {
        for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
        return t.useCallback(l(...r), r)
    }

    function o(e) {
        var n;
        let a, o = (n = e, (a = t.forwardRef((e, r) => {
                let {
                    children: n,
                    ...a
                } = e;
                if (t.isValidElement(n)) {
                    var o, i;
                    let e, s = (e = null == (o = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? n.ref : (e = null == (i = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : i.get) && "isReactWarning" in e && e.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                        u = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let l = e[n],
                                    a = t[n];
                                /^on[A-Z]/.test(n) ? l && a ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    a(...t), l(...t)
                                } : l && (r[n] = l) : "style" === n ? r[n] = {
                                    ...l,
                                    ...a
                                } : "className" === n && (r[n] = [l, a].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(a, n.props);
                    return n.type !== t.Fragment && (u.ref = r ? l(r, s) : s), t.cloneElement(n, u)
                }
                return t.Children.count(n) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(n, ".SlotClone"), a),
            i = t.forwardRef((e, n) => {
                let {
                    children: l,
                    ...a
                } = e, i = t.Children.toArray(l), u = i.find(s);
                if (u) {
                    let e = u.props.children,
                        l = i.map(r => r === u ? t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null : r);
                    return (0, r.jsx)(o, {
                        ...a,
                        ref: n,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, l) : null
                    })
                }
                return (0, r.jsx)(o, {
                    ...a,
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
                    a = () => {
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
                return a.scopeName = e, [function(n, a) {
                    let o = t.createContext(a),
                        i = l.length;
                    l = [...l, a];
                    let s = n => {
                        var l;
                        let {
                            scope: a,
                            children: s,
                            ...u
                        } = n, c = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o, d = t.useMemo(() => u, Object.values(u));
                        return (0, r.jsx)(c.Provider, {
                            value: d,
                            children: s
                        })
                    };
                    return s.displayName = n + "Provider", [s, function(r, l) {
                        var s;
                        let u = (null == l || null == (s = l[e]) ? void 0 : s[i]) || o,
                            c = t.useContext(u);
                        if (c) return c;
                        if (void 0 !== a) return a;
                        throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                    }]
                }, function() {
                    for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                    let l = r[0];
                    if (1 === r.length) return l;
                    let a = () => {
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
                    return a.scopeName = l.scopeName, a
                }(a, ...n)]
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
                } = e, a = t.default.useRef(null), o = t.default.useRef(new Map).current;
                return (0, r.jsx)(s, {
                    scope: n,
                    itemMap: o,
                    collectionRef: a,
                    children: l
                })
            };
        c.displayName = n;
        let d = e + "CollectionSlot",
            f = o(d),
            p = t.default.forwardRef((e, t) => {
                let {
                    scope: n,
                    children: l
                } = e, o = a(t, u(d, n).collectionRef);
                return (0, r.jsx)(f, {
                    ref: o,
                    children: l
                })
            });
        p.displayName = d;
        let m = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            v = o(m),
            g = t.default.forwardRef((e, n) => {
                let {
                    scope: l,
                    children: o,
                    ...i
                } = e, s = t.default.useRef(null), c = a(n, s), d = u(m, l);
                return t.default.useEffect(() => (d.itemMap.set(s, {
                    ref: s,
                    ...i
                }), () => {
                    d.itemMap.delete(s)
                })), (0, r.jsx)(v, {
                    [h]: "",
                    ref: c,
                    children: o
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
}, 610160, e => {
    "use strict";
    var t = e.i(416340);
    let r = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            n = (0, t.useRef)();
        return n.current || (r += 1, n.current = "".concat(e).concat(r)), n.current
    }])
}]);

//# debugId=5ac8091e-45df-6fd5-6c6e-d089d4991963
//# sourceMappingURL=1ozjnxdejdl1r.js.map
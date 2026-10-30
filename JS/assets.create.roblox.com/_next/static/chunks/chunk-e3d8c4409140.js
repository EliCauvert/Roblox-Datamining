;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b3192c53-e7af-2c38-8ea2-93452b7556fe")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 19655, e => {
    "use strict";
    e.s(["composeEventHandlers", 0, function(e, t) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (null == e || e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }])
}, 608652, 723570, e => {
    "use strict";
    var t, n = e.i(416340),
        r = e.i(221628);
    e.s(["createContext", 0, function(e, t) {
        let o = n.createContext(t),
            i = e => {
                let {
                    children: t,
                    ...i
                } = e, a = n.useMemo(() => i, Object.values(i));
                return (0, r.jsx)(o.Provider, {
                    value: a,
                    children: t
                })
            };
        return i.displayName = e + "Provider", [i, function(r) {
            let i = n.useContext(o);
            if (i) return i;
            if (void 0 !== t) return t;
            throw Error("`".concat(r, "` must be used within `").concat(e, "`"))
        }]
    }, "createContextScope", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            o = [],
            i = () => {
                let t = o.map(e => n.createContext(e));
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
        return i.scopeName = e, [function(t, i) {
            let a = n.createContext(i),
                u = o.length;
            o = [...o, i];
            let l = t => {
                var o;
                let {
                    scope: i,
                    children: l,
                    ...c
                } = t, s = (null == i || null == (o = i[e]) ? void 0 : o[u]) || a, d = n.useMemo(() => c, Object.values(c));
                return (0, r.jsx)(s.Provider, {
                    value: d,
                    children: l
                })
            };
            return l.displayName = t + "Provider", [l, function(r, o) {
                var l;
                let c = (null == o || null == (l = o[e]) ? void 0 : l[u]) || a,
                    s = n.useContext(c);
                if (s) return s;
                if (void 0 !== i) return i;
                throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            let o = t[0];
            if (1 === t.length) return o;
            let i = () => {
                let e = t.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(t) {
                    let r = e.reduce((e, n) => {
                        let {
                            useScope: r,
                            scopeName: o
                        } = n, i = r(t)["__scope".concat(o)];
                        return {
                            ...e,
                            ...i
                        }
                    }, {});
                    return n.useMemo(() => ({
                        ["__scope".concat(o.scopeName)]: r
                    }), [r])
                }
            };
            return i.scopeName = o.scopeName, i
        }(i, ...t)]
    }], 608652);
    var o = (null == (t = globalThis) ? void 0 : t.document) ? n.useLayoutEffect : () => {};
    e.s(["useLayoutEffect", 0, o], 723570)
}, 598943, e => {
    "use strict";
    var t, n = e.i(416340),
        r = e.i(19655),
        o = e.i(594278),
        i = e.i(78892),
        a = e.i(886449),
        u = e.i(221628),
        l = "dismissableLayer.update",
        c = n.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        s = n.forwardRef((e, s) => {
            var p, v;
            let {
                disableOutsidePointerEvents: m = !1,
                onEscapeKeyDown: y,
                onPointerDownOutside: h,
                onFocusOutside: g,
                onInteractOutside: E,
                onDismiss: b,
                ...w
            } = e, S = n.useContext(c), [C, R] = n.useState(null), O = null != (p = null == C ? void 0 : C.ownerDocument) ? p : null == (v = globalThis) ? void 0 : v.document, [, N] = n.useState({}), _ = (0, i.useComposedRefs)(s, e => R(e)), T = Array.from(S.layers), [P] = [...S.layersWithOutsidePointerEventsDisabled].slice(-1), L = T.indexOf(P), A = C ? T.indexOf(C) : -1, M = S.layersWithOutsidePointerEventsDisabled.size > 0, x = A >= L, k = function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    o = (0, a.useCallbackRef)(e),
                    i = n.useRef(!1),
                    u = n.useRef(() => {});
                return n.useEffect(() => {
                    let e = e => {
                            if (e.target && !i.current) {
                                let t = function() {
                                        f("dismissableLayer.pointerDownOutside", o, n, {
                                            discrete: !0
                                        })
                                    },
                                    n = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (r.removeEventListener("click", u.current), u.current = t, r.addEventListener("click", u.current, {
                                    once: !0
                                })) : t()
                            } else r.removeEventListener("click", u.current);
                            i.current = !1
                        },
                        t = window.setTimeout(() => {
                            r.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(t), r.removeEventListener("pointerdown", e), r.removeEventListener("click", u.current)
                    }
                }, [r, o]), {
                    onPointerDownCapture: () => i.current = !0
                }
            }(e => {
                let t = e.target,
                    n = [...S.branches].some(e => e.contains(t));
                x && !n && (null == h || h(e), null == E || E(e), e.defaultPrevented || null == b || b())
            }, O), D = function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    o = (0, a.useCallbackRef)(e),
                    i = n.useRef(!1);
                return n.useEffect(() => {
                    let e = e => {
                        e.target && !i.current && f("dismissableLayer.focusOutside", o, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return r.addEventListener("focusin", e), () => r.removeEventListener("focusin", e)
                }, [r, o]), {
                    onFocusCapture: () => i.current = !0,
                    onBlurCapture: () => i.current = !1
                }
            }(e => {
                let t = e.target;
                ![...S.branches].some(e => e.contains(t)) && (null == g || g(e), null == E || E(e), e.defaultPrevented || null == b || b())
            }, O);
            return ! function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    o = (0, a.useCallbackRef)(e);
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
                A === S.layers.size - 1 && (null == y || y(e), !e.defaultPrevented && b && (e.preventDefault(), b()))
            }, O), n.useEffect(() => {
                if (C) return m && (0 === S.layersWithOutsidePointerEventsDisabled.size && (t = O.body.style.pointerEvents, O.body.style.pointerEvents = "none"), S.layersWithOutsidePointerEventsDisabled.add(C)), S.layers.add(C), d(), () => {
                    m && 1 === S.layersWithOutsidePointerEventsDisabled.size && (O.body.style.pointerEvents = t)
                }
            }, [C, O, m, S]), n.useEffect(() => () => {
                C && (S.layers.delete(C), S.layersWithOutsidePointerEventsDisabled.delete(C), d())
            }, [C, S]), n.useEffect(() => {
                let e = () => N({});
                return document.addEventListener(l, e), () => document.removeEventListener(l, e)
            }, []), (0, u.jsx)(o.Primitive.div, {
                ...w,
                ref: _,
                style: {
                    pointerEvents: M ? x ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: (0, r.composeEventHandlers)(e.onFocusCapture, D.onFocusCapture),
                onBlurCapture: (0, r.composeEventHandlers)(e.onBlurCapture, D.onBlurCapture),
                onPointerDownCapture: (0, r.composeEventHandlers)(e.onPointerDownCapture, k.onPointerDownCapture)
            })
        });

    function d() {
        let e = new CustomEvent(l);
        document.dispatchEvent(e)
    }

    function f(e, t, n, r) {
        let {
            discrete: i
        } = r, a = n.originalEvent.target, u = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: n
        });
        t && a.addEventListener(e, t, {
            once: !0
        }), i ? (0, o.dispatchDiscreteCustomEvent)(a, u) : a.dispatchEvent(u)
    }
    s.displayName = "DismissableLayer", n.forwardRef((e, t) => {
        let r = n.useContext(c),
            a = n.useRef(null),
            l = (0, i.useComposedRefs)(t, a);
        return n.useEffect(() => {
            let e = a.current;
            if (e) return r.branches.add(e), () => {
                r.branches.delete(e)
            }
        }, [r.branches]), (0, u.jsx)(o.Primitive.div, {
            ...e,
            ref: l
        })
    }).displayName = "DismissableLayerBranch", e.s(["DismissableLayer", 0, s], 598943)
}, 793808, e => {
    "use strict";
    var t = e.i(416340),
        n = 0;

    function r() {
        let e = document.createElement("span");
        return e.setAttribute("data-radix-focus-guard", ""), e.tabIndex = 0, e.style.outline = "none", e.style.opacity = "0", e.style.position = "fixed", e.style.pointerEvents = "none", e
    }
    e.s(["useFocusGuards", 0, function() {
        t.useEffect(() => {
            var e, t;
            let o = document.querySelectorAll("[data-radix-focus-guard]");
            return document.body.insertAdjacentElement("afterbegin", null != (e = o[0]) ? e : r()), document.body.insertAdjacentElement("beforeend", null != (t = o[1]) ? t : r()), n++, () => {
                1 === n && document.querySelectorAll("[data-radix-focus-guard]").forEach(e => e.remove()), n--
            }
        }, [])
    }])
}, 44265, e => {
    "use strict";
    let t;
    var n = e.i(416340),
        r = e.i(78892),
        o = e.i(594278),
        i = e.i(886449),
        a = e.i(221628),
        u = "focusScope.autoFocusOnMount",
        l = "focusScope.autoFocusOnUnmount",
        c = {
            bubbles: !1,
            cancelable: !0
        },
        s = n.forwardRef((e, t) => {
            let {
                loop: s = !1,
                trapped: m = !1,
                onMountAutoFocus: y,
                onUnmountAutoFocus: h,
                ...g
            } = e, [E, b] = n.useState(null), w = (0, i.useCallbackRef)(y), S = (0, i.useCallbackRef)(h), C = n.useRef(null), R = (0, r.useComposedRefs)(t, e => b(e)), O = n.useRef({
                paused: !1,
                pause() {
                    this.paused = !0
                },
                resume() {
                    this.paused = !1
                }
            }).current;
            n.useEffect(() => {
                if (m) {
                    let e = function(e) {
                            if (O.paused || !E) return;
                            let t = e.target;
                            E.contains(t) ? C.current = t : p(C.current, {
                                select: !0
                            })
                        },
                        t = function(e) {
                            if (O.paused || !E) return;
                            let t = e.relatedTarget;
                            null !== t && (E.contains(t) || p(C.current, {
                                select: !0
                            }))
                        };
                    document.addEventListener("focusin", e), document.addEventListener("focusout", t);
                    let n = new MutationObserver(function(e) {
                        if (document.activeElement === document.body)
                            for (let t of e) t.removedNodes.length > 0 && p(E)
                    });
                    return E && n.observe(E, {
                        childList: !0,
                        subtree: !0
                    }), () => {
                        document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), n.disconnect()
                    }
                }
            }, [m, E, O.paused]), n.useEffect(() => {
                if (E) {
                    v.add(O);
                    let e = document.activeElement;
                    if (!E.contains(e)) {
                        let t = new CustomEvent(u, c);
                        E.addEventListener(u, w), E.dispatchEvent(t), t.defaultPrevented || (function(e) {
                            let {
                                select: t = !1
                            } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, n = document.activeElement;
                            for (let r of e)
                                if (p(r, {
                                        select: t
                                    }), document.activeElement !== n) return
                        }(d(E).filter(e => "A" !== e.tagName), {
                            select: !0
                        }), document.activeElement === e && p(E))
                    }
                    return () => {
                        E.removeEventListener(u, w), setTimeout(() => {
                            let t = new CustomEvent(l, c);
                            E.addEventListener(l, S), E.dispatchEvent(t), t.defaultPrevented || p(null != e ? e : document.body, {
                                select: !0
                            }), E.removeEventListener(l, S), v.remove(O)
                        }, 0)
                    }
                }
            }, [E, w, S, O]);
            let N = n.useCallback(e => {
                if (!s && !m || O.paused) return;
                let t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                    n = document.activeElement;
                if (t && n) {
                    var r;
                    let t, o = e.currentTarget,
                        [i, a] = [f(t = d(r = o), r), f(t.reverse(), r)];
                    i && a ? e.shiftKey || n !== a ? e.shiftKey && n === i && (e.preventDefault(), s && p(a, {
                        select: !0
                    })) : (e.preventDefault(), s && p(i, {
                        select: !0
                    })) : n === o && e.preventDefault()
                }
            }, [s, m, O.paused]);
            return (0, a.jsx)(o.Primitive.div, {
                tabIndex: -1,
                ...g,
                ref: R,
                onKeyDown: N
            })
        });

    function d(e) {
        let t = [],
            n = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                acceptNode: e => {
                    let t = "INPUT" === e.tagName && "hidden" === e.type;
                    return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                }
            });
        for (; n.nextNode();) t.push(n.currentNode);
        return t
    }

    function f(e, t) {
        for (let n of e)
            if (! function(e, t) {
                    let {
                        upTo: n
                    } = t;
                    if ("hidden" === getComputedStyle(e).visibility) return !0;
                    for (; e && (void 0 === n || e !== n);) {
                        if ("none" === getComputedStyle(e).display) return !0;
                        e = e.parentElement
                    }
                    return !1
                }(n, {
                    upTo: t
                })) return n
    }

    function p(e) {
        let {
            select: t = !1
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        if (e && e.focus) {
            var n;
            let r = document.activeElement;
            e.focus({
                preventScroll: !0
            }), e !== r && (n = e) instanceof HTMLInputElement && "select" in n && t && e.select()
        }
    }
    s.displayName = "FocusScope";
    var v = (t = [], {
        add(e) {
            let n = t[0];
            e !== n && (null == n || n.pause()), (t = m(t, e)).unshift(e)
        },
        remove(e) {
            var n;
            null == (n = (t = m(t, e))[0]) || n.resume()
        }
    });

    function m(e, t) {
        let n = [...e],
            r = n.indexOf(t);
        return -1 !== r && n.splice(r, 1), n
    }
    e.s(["FocusScope", 0, s])
}, 40266, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(723570),
        r = t[" useId ".trim().toString()] || (() => void 0),
        o = 0;
    e.s(["useId", 0, function(e) {
        let [i, a] = t.useState(r());
        return (0, n.useLayoutEffect)(() => {
            e || a(e => null != e ? e : String(o++))
        }, [e]), e || (i ? "radix-".concat(i) : "")
    }])
}, 763960, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(149285),
        r = e.i(594278),
        o = e.i(723570),
        i = e.i(221628),
        a = t.forwardRef((e, a) => {
            var u, l;
            let {
                container: c,
                ...s
            } = e, [d, f] = t.useState(!1);
            (0, o.useLayoutEffect)(() => f(!0), []);
            let p = c || d && (null == (l = globalThis) || null == (u = l.document) ? void 0 : u.body);
            return p ? n.default.createPortal((0, i.jsx)(r.Primitive.div, {
                ...s,
                ref: a
            }), p) : null
        });
    a.displayName = "Portal", e.s(["Portal", 0, a])
}, 226972, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(78892),
        r = e.i(723570),
        o = e => {
            var o, a, u;
            let l, c, {
                    present: s,
                    children: d
                } = e,
                f = function(e) {
                    var n, o;
                    let [a, u] = t.useState(), l = t.useRef({}), c = t.useRef(e), s = t.useRef("none"), [d, f] = (n = e ? "mounted" : "unmounted", o = {
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
                    }, t.useReducer((e, t) => {
                        let n = o[e][t];
                        return null != n ? n : e
                    }, n));
                    return t.useEffect(() => {
                        let e = i(l.current);
                        s.current = "mounted" === d ? e : "none"
                    }, [d]), (0, r.useLayoutEffect)(() => {
                        let t = l.current,
                            n = c.current;
                        if (n !== e) {
                            let r = s.current,
                                o = i(t);
                            e ? f("MOUNT") : "none" === o || (null == t ? void 0 : t.display) === "none" ? f("UNMOUNT") : n && r !== o ? f("ANIMATION_OUT") : f("UNMOUNT"), c.current = e
                        }
                    }, [e, f]), (0, r.useLayoutEffect)(() => {
                        if (a) {
                            var e;
                            let t, n = null != (e = a.ownerDocument.defaultView) ? e : window,
                                r = e => {
                                    let r = i(l.current).includes(e.animationName);
                                    if (e.target === a && r && (f("ANIMATION_END"), !c.current)) {
                                        let e = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = n.setTimeout(() => {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = e)
                                        })
                                    }
                                },
                                o = e => {
                                    e.target === a && (s.current = i(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", r), a.addEventListener("animationend", r), () => {
                                n.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", r), a.removeEventListener("animationend", r)
                            }
                        }
                        f("ANIMATION_END")
                    }, [a, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: t.useCallback(e => {
                            e && (l.current = getComputedStyle(e)), u(e)
                        }, [])
                    }
                }(s),
                p = "function" == typeof d ? d({
                    present: f.isPresent
                }) : t.Children.only(d),
                v = (0, n.useComposedRefs)(f.ref, (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = p).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (u = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : u.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref);
            return "function" == typeof d || f.isPresent ? t.cloneElement(p, {
                ref: v
            }) : null
        };

    function i(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    o.displayName = "Presence", e.s(["Presence", 0, o])
}, 594278, 699704, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(149285),
        r = e.i(78892),
        o = e.i(221628);

    function i(e) {
        var n;
        let i, a = (n = e, (i = t.forwardRef((e, n) => {
                let {
                    children: o,
                    ...i
                } = e;
                if (t.isValidElement(o)) {
                    var a, u, l;
                    let e, c, s = (c = (e = null == (u = Object.getOwnPropertyDescriptor((a = o).props, "ref")) ? void 0 : u.get) && "isReactWarning" in e && e.isReactWarning) ? a.ref : (c = (e = null == (l = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : l.get) && "isReactWarning" in e && e.isReactWarning) ? a.props.ref : a.props.ref || a.ref,
                        d = function(e, t) {
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
                        }(i, o.props);
                    return o.type !== t.Fragment && (d.ref = n ? (0, r.composeRefs)(n, s) : s), t.cloneElement(o, d)
                }
                return t.Children.count(o) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(n, ".SlotClone"), i),
            l = t.forwardRef((e, n) => {
                let {
                    children: r,
                    ...i
                } = e, l = t.Children.toArray(r), c = l.find(u);
                if (c) {
                    let e = c.props.children,
                        r = l.map(n => n !== c ? n : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, o.jsx)(a, {
                        ...i,
                        ref: n,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, r) : null
                    })
                }
                return (0, o.jsx)(a, {
                    ...i,
                    ref: n,
                    children: r
                })
            });
        return l.displayName = "".concat(e, ".Slot"), l
    }
    var a = Symbol("radix.slottable");

    function u(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === a
    }
    e.s(["createSlot", 0, i], 699704);
    var l = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, n) => {
        let r = i("Primitive.".concat(n)),
            a = t.forwardRef((e, t) => {
                let {
                    asChild: i,
                    ...a
                } = e;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(i ? r : n, {
                    ...a,
                    ref: t
                })
            });
        return a.displayName = "Primitive.".concat(n), {
            ...e,
            [n]: a
        }
    }, {});
    e.s(["Primitive", 0, l, "dispatchDiscreteCustomEvent", 0, function(e, t) {
        e && n.flushSync(() => e.dispatchEvent(t))
    }], 594278)
}, 23342, 78892, e => {
    "use strict";
    var t = e.i(416340);

    function n(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function r() {
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
    e.s(["composeRefs", 0, r, "useComposedRefs", 0, function() {
        for (var e = arguments.length, n = Array(e), o = 0; o < e; o++) n[o] = arguments[o];
        return t.useCallback(r(...n), n)
    }], 78892);
    var o = e.i(221628),
        i = Symbol.for("react.lazy"),
        a = t[" use ".trim().toString()];

    function u(e) {
        var t;
        return null != e && "object" == typeof e && "$$typeof" in e && e.$$typeof === i && "_payload" in e && "object" == typeof(t = e._payload) && null !== t && "then" in t
    }

    function l(e) {
        var n;
        let i, l = (n = e, (i = t.forwardRef((e, n) => {
                let {
                    children: o,
                    ...i
                } = e;
                if (u(o) && "function" == typeof a && (o = a(o._payload)), t.isValidElement(o)) {
                    var l, c, s;
                    let e, a, u = (a = (e = null == (c = Object.getOwnPropertyDescriptor((l = o).props, "ref")) ? void 0 : c.get) && "isReactWarning" in e && e.isReactWarning) ? l.ref : (a = (e = null == (s = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? l.props.ref : l.props.ref || l.ref,
                        d = function(e, t) {
                            let n = {
                                ...t
                            };
                            for (let r in t) {
                                let o = e[r],
                                    i = t[r];
                                /^on[A-Z]/.test(r) ? o && i ? n[r] = function() {
                                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                    let r = i(...t);
                                    return o(...t), r
                                } : o && (n[r] = o) : "style" === r ? n[r] = {
                                    ...o,
                                    ...i
                                } : "className" === r && (n[r] = [o, i].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...n
                            }
                        }(i, o.props);
                    return o.type !== t.Fragment && (d.ref = n ? r(n, u) : u), t.cloneElement(o, d)
                }
                return t.Children.count(o) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(n, ".SlotClone"), i),
            c = t.forwardRef((e, n) => {
                let {
                    children: r,
                    ...i
                } = e;
                u(r) && "function" == typeof a && (r = a(r._payload));
                let c = t.Children.toArray(r),
                    s = c.find(d);
                if (s) {
                    let e = s.props.children,
                        r = c.map(n => n !== s ? n : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, o.jsx)(l, {
                        ...i,
                        ref: n,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, r) : null
                    })
                }
                return (0, o.jsx)(l, {
                    ...i,
                    ref: n,
                    children: r
                })
            });
        return c.displayName = "".concat(e, ".Slot"), c
    }
    var c = l("Slot"),
        s = Symbol("radix.slottable");

    function d(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === s
    }
    e.s(["Slot", 0, c, "createSlot", 0, l], 23342)
}, 886449, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["useCallbackRef", 0, function(e) {
        let n = t.useRef(e);
        return t.useEffect(() => {
            n.current = e
        }), t.useMemo(() => function() {
            for (var e, t = arguments.length, r = Array(t), o = 0; o < t; o++) r[o] = arguments[o];
            return null == (e = n.current) ? void 0 : e.call(n, ...r)
        }, [])
    }])
}, 428156, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(886449);
    e.s(["useControllableState", 0, function(e) {
        let {
            prop: r,
            defaultProp: o,
            onChange: i = () => {}
        } = e, [a, u] = function(e) {
            let {
                defaultProp: r,
                onChange: o
            } = e, i = t.useState(r), [a] = i, u = t.useRef(a), l = (0, n.useCallbackRef)(o);
            return t.useEffect(() => {
                u.current !== a && (l(a), u.current = a)
            }, [a, u, l]), i
        }({
            defaultProp: o,
            onChange: i
        }), l = void 0 !== r, c = l ? r : a, s = (0, n.useCallbackRef)(i);
        return [c, t.useCallback(e => {
            if (l) {
                let t = "function" == typeof e ? e(r) : e;
                t !== r && s(t)
            } else u(e)
        }, [l, r, u, s])]
    }])
}, 3300, e => {
    "use strict";
    var t = new WeakMap,
        n = new WeakMap,
        r = {},
        o = 0,
        i = function(e) {
            return e && (e.host || i(e.parentNode))
        },
        a = function(e, a, u, l) {
            var c = (Array.isArray(e) ? e : [e]).map(function(e) {
                if (a.contains(e)) return e;
                var t = i(e);
                return t && a.contains(t) ? t : (console.error("aria-hidden", e, "in not contained inside", a, ". Doing nothing"), null)
            }).filter(function(e) {
                return !!e
            });
            r[u] || (r[u] = new WeakMap);
            var s = r[u],
                d = [],
                f = new Set,
                p = new Set(c),
                v = function(e) {
                    !e || f.has(e) || (f.add(e), v(e.parentNode))
                };
            c.forEach(v);
            var m = function(e) {
                !e || p.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                    if (f.has(e)) m(e);
                    else try {
                        var r = e.getAttribute(l),
                            o = null !== r && "false" !== r,
                            i = (t.get(e) || 0) + 1,
                            a = (s.get(e) || 0) + 1;
                        t.set(e, i), s.set(e, a), d.push(e), 1 === i && o && n.set(e, !0), 1 === a && e.setAttribute(u, "true"), o || e.setAttribute(l, "true")
                    } catch (t) {
                        console.error("aria-hidden: cannot operate on ", e, t)
                    }
                })
            };
            return m(a), f.clear(), o++,
                function() {
                    d.forEach(function(e) {
                        var r = t.get(e) - 1,
                            o = s.get(e) - 1;
                        t.set(e, r), s.set(e, o), r || (n.has(e) || e.removeAttribute(l), n.delete(e)), o || e.removeAttribute(u)
                    }), --o || (t = new WeakMap, t = new WeakMap, n = new WeakMap, r = {})
                }
        };
    e.s(["hideOthers", 0, function(e, t, n) {
        void 0 === n && (n = "data-aria-hidden");
        var r = Array.from(Array.isArray(e) ? e : [e]),
            o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
        return o ? (r.push.apply(r, Array.from(o.querySelectorAll("[aria-live], script"))), a(r, o, n, "aria-hidden")) : function() {
            return null
        }
    }])
}, 197649, e => {
    "use strict";

    function t() {
        for (var e, t, n = 0, r = "", o = arguments.length; n < o; n++)(e = arguments[n]) && (t = function e(t) {
            var n, r, o = "";
            if ("string" == typeof t || "number" == typeof t) o += t;
            else if ("object" == typeof t)
                if (Array.isArray(t)) {
                    var i = t.length;
                    for (n = 0; n < i; n++) t[n] && (r = e(t[n])) && (o && (o += " "), o += r)
                } else
                    for (r in t) t[r] && (o && (o += " "), o += r);
            return o
        }(e)) && (r && (r += " "), r += t);
        return r
    }
    e.s(["clsx", 0, t, "default", 0, t])
}, 678604, (e, t, n) => {
    "use strict";
    var r = e.r(416340);

    function o(e) {
        var t = "https://react.dev/errors/" + e;
        if (1 < arguments.length) {
            t += "?args[]=" + encodeURIComponent(arguments[1]);
            for (var n = 2; n < arguments.length; n++) t += "&args[]=" + encodeURIComponent(arguments[n])
        }
        return "Minified React error #" + e + "; visit " + t + " for the full message or use the non-minified dev environment for full errors and additional helpful warnings."
    }

    function i() {}
    var a = {
            d: {
                f: i,
                r: function() {
                    throw Error(o(522))
                },
                D: i,
                C: i,
                L: i,
                m: i,
                X: i,
                S: i,
                M: i
            },
            p: 0,
            findDOMNode: null
        },
        u = Symbol.for("react.portal"),
        l = r.__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE;

    function c(e, t) {
        return "font" === e ? "" : "string" == typeof t ? "use-credentials" === t ? t : "" : void 0
    }
    n.__DOM_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE = a, n.createPortal = function(e, t) {
        var n = 2 < arguments.length && void 0 !== arguments[2] ? arguments[2] : null;
        if (!t || 1 !== t.nodeType && 9 !== t.nodeType && 11 !== t.nodeType) throw Error(o(299));
        return function(e, t, n) {
            var r = 3 < arguments.length && void 0 !== arguments[3] ? arguments[3] : null;
            return {
                $$typeof: u,
                key: null == r ? null : "" + r,
                children: e,
                containerInfo: t,
                implementation: n
            }
        }(e, t, null, n)
    }, n.flushSync = function(e) {
        var t = l.T,
            n = a.p;
        try {
            if (l.T = null, a.p = 2, e) return e()
        } finally {
            l.T = t, a.p = n, a.d.f()
        }
    }, n.preconnect = function(e, t) {
        "string" == typeof e && (t = t ? "string" == typeof(t = t.crossOrigin) ? "use-credentials" === t ? t : "" : void 0 : null, a.d.C(e, t))
    }, n.prefetchDNS = function(e) {
        "string" == typeof e && a.d.D(e)
    }, n.preinit = function(e, t) {
        if ("string" == typeof e && t && "string" == typeof t.as) {
            var n = t.as,
                r = c(n, t.crossOrigin),
                o = "string" == typeof t.integrity ? t.integrity : void 0,
                i = "string" == typeof t.fetchPriority ? t.fetchPriority : void 0;
            "style" === n ? a.d.S(e, "string" == typeof t.precedence ? t.precedence : void 0, {
                crossOrigin: r,
                integrity: o,
                fetchPriority: i
            }) : "script" === n && a.d.X(e, {
                crossOrigin: r,
                integrity: o,
                fetchPriority: i,
                nonce: "string" == typeof t.nonce ? t.nonce : void 0
            })
        }
    }, n.preinitModule = function(e, t) {
        if ("string" == typeof e)
            if ("object" == typeof t && null !== t) {
                if (null == t.as || "script" === t.as) {
                    var n = c(t.as, t.crossOrigin);
                    a.d.M(e, {
                        crossOrigin: n,
                        integrity: "string" == typeof t.integrity ? t.integrity : void 0,
                        nonce: "string" == typeof t.nonce ? t.nonce : void 0
                    })
                }
            } else null == t && a.d.M(e)
    }, n.preload = function(e, t) {
        if ("string" == typeof e && "object" == typeof t && null !== t && "string" == typeof t.as) {
            var n = t.as,
                r = c(n, t.crossOrigin);
            a.d.L(e, n, {
                crossOrigin: r,
                integrity: "string" == typeof t.integrity ? t.integrity : void 0,
                nonce: "string" == typeof t.nonce ? t.nonce : void 0,
                type: "string" == typeof t.type ? t.type : void 0,
                fetchPriority: "string" == typeof t.fetchPriority ? t.fetchPriority : void 0,
                referrerPolicy: "string" == typeof t.referrerPolicy ? t.referrerPolicy : void 0,
                imageSrcSet: "string" == typeof t.imageSrcSet ? t.imageSrcSet : void 0,
                imageSizes: "string" == typeof t.imageSizes ? t.imageSizes : void 0,
                media: "string" == typeof t.media ? t.media : void 0
            })
        }
    }, n.preloadModule = function(e, t) {
        if ("string" == typeof e)
            if (t) {
                var n = c(t.as, t.crossOrigin);
                a.d.m(e, {
                    as: "string" == typeof t.as && "script" !== t.as ? t.as : void 0,
                    crossOrigin: n,
                    integrity: "string" == typeof t.integrity ? t.integrity : void 0
                })
            } else a.d.m(e)
    }, n.requestFormReset = function(e) {
        a.d.r(e)
    }, n.unstable_batchedUpdates = function(e, t) {
        return e(t)
    }, n.useFormState = function(e, t, n) {
        return l.H.useFormState(e, t, n)
    }, n.useFormStatus = function() {
        return l.H.useHostTransitionStatus()
    }, n.version = "19.2.6"
}, 149285, (e, t, n) => {
    "use strict";
    ! function e() {
        if ("u" > typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ && "function" == typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE) try {
            __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(e)
        } catch (e) {
            console.error(e)
        }
    }(), t.exports = e.r(678604)
}, 813593, e => {
    "use strict";
    var t, n, r, o, i, a, u, l = function() {
        return (l = Object.assign || function(e) {
            for (var t, n = 1, r = arguments.length; n < r; n++)
                for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
            return e
        }).apply(this, arguments)
    };

    function c(e, t) {
        var n = {};
        for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
        if (null != e && "function" == typeof Object.getOwnPropertySymbols)
            for (var o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) 0 > t.indexOf(r[o]) && Object.prototype.propertyIsEnumerable.call(e, r[o]) && (n[r[o]] = e[r[o]]);
        return n
    }
    var s = ("function" == typeof SuppressedError && SuppressedError, e.i(416340)),
        d = "right-scroll-bar-position",
        f = "width-before-scroll-bar";

    function p(e, t) {
        return "function" == typeof e ? e(t) : e && (e.current = t), e
    }
    var v = "u" > typeof window ? s.useLayoutEffect : s.useEffect,
        m = new WeakMap,
        y = (void 0 === t && (t = {}), (void 0 === n && (n = function(e) {
            return e
        }), r = [], o = !1, i = {
            read: function() {
                if (o) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                return r.length ? r[r.length - 1] : null
            },
            useMedium: function(e) {
                var t = n(e, o);
                return r.push(t),
                    function() {
                        r = r.filter(function(e) {
                            return e !== t
                        })
                    }
            },
            assignSyncMedium: function(e) {
                for (o = !0; r.length;) {
                    var t = r;
                    r = [], t.forEach(e)
                }
                r = {
                    push: function(t) {
                        return e(t)
                    },
                    filter: function() {
                        return r
                    }
                }
            },
            assignMedium: function(e) {
                o = !0;
                var t = [];
                if (r.length) {
                    var n = r;
                    r = [], n.forEach(e), t = r
                }
                var i = function() {
                        var n = t;
                        t = [], n.forEach(e)
                    },
                    a = function() {
                        return Promise.resolve().then(i)
                    };
                a(), r = {
                    push: function(e) {
                        t.push(e), a()
                    },
                    filter: function(e) {
                        return t = t.filter(e), r
                    }
                }
            }
        }).options = l({
            async: !0,
            ssr: !1
        }, t), i),
        h = function() {},
        g = s.forwardRef(function(e, t) {
            var n, r, o, i, a = s.useRef(null),
                u = s.useState({
                    onScrollCapture: h,
                    onWheelCapture: h,
                    onTouchMoveCapture: h
                }),
                d = u[0],
                f = u[1],
                g = e.forwardProps,
                E = e.children,
                b = e.className,
                w = e.removeScrollBar,
                S = e.enabled,
                C = e.shards,
                R = e.sideCar,
                O = e.noRelative,
                N = e.noIsolation,
                _ = e.inert,
                T = e.allowPinchZoom,
                P = e.as,
                L = e.gapMode,
                A = c(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                M = (n = [a, t], r = function(e) {
                    return n.forEach(function(t) {
                        return p(t, e)
                    })
                }, (o = (0, s.useState)(function() {
                    return {
                        value: null,
                        callback: r,
                        facade: {
                            get current() {
                                return o.value
                            },
                            set current(value) {
                                var e = o.value;
                                e !== value && (o.value = value, o.callback(value, e))
                            }
                        }
                    }
                })[0]).callback = r, i = o.facade, v(function() {
                    var e = m.get(i);
                    if (e) {
                        var t = new Set(e),
                            r = new Set(n),
                            o = i.current;
                        t.forEach(function(e) {
                            r.has(e) || p(e, null)
                        }), r.forEach(function(e) {
                            t.has(e) || p(e, o)
                        })
                    }
                    m.set(i, n)
                }, [n]), i),
                x = l(l({}, A), d);
            return s.createElement(s.Fragment, null, S && s.createElement(R, {
                sideCar: y,
                removeScrollBar: w,
                shards: C,
                noRelative: O,
                noIsolation: N,
                inert: _,
                setCallbacks: f,
                allowPinchZoom: !!T,
                lockRef: a,
                gapMode: L
            }), g ? s.cloneElement(s.Children.only(E), l(l({}, x), {
                ref: M
            })) : s.createElement(void 0 === P ? "div" : P, l({}, x, {
                className: b,
                ref: M
            }), E))
        });
    g.defaultProps = {
        enabled: !0,
        removeScrollBar: !0,
        inert: !1
    }, g.classNames = {
        fullWidth: f,
        zeroRight: d
    };
    var E = function(e) {
        var t = e.sideCar,
            n = c(e, ["sideCar"]);
        if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
        var r = t.read();
        if (!r) throw Error("Sidecar medium not found");
        return s.createElement(r, l({}, n))
    };
    E.isSideCarExport = !0;
    var b = function() {
            var e = 0,
                t = null;
            return {
                add: function(n) {
                    if (0 == e && (t = function() {
                            if (!document) return null;
                            var e = document.createElement("style");
                            e.type = "text/css";
                            var t = u || ("u" > typeof __webpack_nonce__ ? __webpack_nonce__ : void 0);
                            return t && e.setAttribute("nonce", t), e
                        }())) {
                        var r, o;
                        (r = t).styleSheet ? r.styleSheet.cssText = n : r.appendChild(document.createTextNode(n)), o = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(o)
                    }
                    e++
                },
                remove: function() {
                    --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                }
            }
        },
        w = function() {
            var e = b();
            return function(t, n) {
                s.useEffect(function() {
                    return e.add(t),
                        function() {
                            e.remove()
                        }
                }, [t && n])
            }
        },
        S = function() {
            var e = w();
            return function(t) {
                return e(t.styles, t.dynamic), null
            }
        },
        C = {
            left: 0,
            top: 0,
            right: 0,
            gap: 0
        },
        R = function(e) {
            return parseInt(e || "", 10) || 0
        },
        O = function(e) {
            var t = window.getComputedStyle(document.body),
                n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                r = t["padding" === e ? "paddingTop" : "marginTop"],
                o = t["padding" === e ? "paddingRight" : "marginRight"];
            return [R(n), R(r), R(o)]
        },
        N = function(e) {
            if (void 0 === e && (e = "margin"), "u" < typeof window) return C;
            var t = O(e),
                n = document.documentElement.clientWidth,
                r = window.innerWidth;
            return {
                left: t[0],
                top: t[1],
                right: t[2],
                gap: Math.max(0, r - n + t[2] - t[0])
            }
        },
        _ = S(),
        T = "data-scroll-locked",
        P = function(e, t, n, r) {
            var o = e.left,
                i = e.top,
                a = e.right,
                u = e.gap;
            return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(u, "px ").concat(r, ";\n  }\n  body[").concat(T, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(u, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(u, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(d, " {\n    right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(f, " {\n    margin-right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(d, " .").concat(d, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(f, " .").concat(f, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(T, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(u, "px;\n  }\n")
        },
        L = function() {
            var e = parseInt(document.body.getAttribute(T) || "0", 10);
            return isFinite(e) ? e : 0
        },
        A = function() {
            s.useEffect(function() {
                return document.body.setAttribute(T, (L() + 1).toString()),
                    function() {
                        var e = L() - 1;
                        e <= 0 ? document.body.removeAttribute(T) : document.body.setAttribute(T, e.toString())
                    }
            }, [])
        },
        M = function(e) {
            var t = e.noRelative,
                n = e.noImportant,
                r = e.gapMode,
                o = void 0 === r ? "margin" : r;
            A();
            var i = s.useMemo(function() {
                return N(o)
            }, [o]);
            return s.createElement(_, {
                styles: P(i, !t, o, n ? "" : "!important")
            })
        },
        x = !1;
    if ("u" > typeof window) try {
        var k = Object.defineProperty({}, "passive", {
            get: function() {
                return x = !0, !0
            }
        });
        window.addEventListener("test", k, k), window.removeEventListener("test", k, k)
    } catch (e) {
        x = !1
    }
    var D = !!x && {
            passive: !1
        },
        I = function(e, t) {
            if (!(e instanceof Element)) return !1;
            var n = window.getComputedStyle(e);
            return "hidden" !== n[t] && (n.overflowY !== n.overflowX || "TEXTAREA" === e.tagName || "visible" !== n[t])
        },
        j = function(e, t) {
            var n = t.ownerDocument,
                r = t;
            do {
                if ("u" > typeof ShadowRoot && r instanceof ShadowRoot && (r = r.host), W(e, r)) {
                    var o = F(e, r);
                    if (o[1] > o[2]) return !0
                }
                r = r.parentNode
            } while (r && r !== n.body) return !1
        },
        W = function(e, t) {
            return "v" === e ? I(t, "overflowY") : I(t, "overflowX")
        },
        F = function(e, t) {
            return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
        },
        U = function(e, t, n, r, o) {
            var i, a = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                u = a * r,
                l = n.target,
                c = t.contains(l),
                s = !1,
                d = u > 0,
                f = 0,
                p = 0;
            do {
                if (!l) break;
                var v = F(e, l),
                    m = v[0],
                    y = v[1] - v[2] - a * m;
                (m || y) && W(e, l) && (f += y, p += m);
                var h = l.parentNode;
                l = h && h.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? h.host : h
            } while (!c && l !== document.body || c && (t.contains(l) || t === l)) return d && (o && 1 > Math.abs(f) || !o && u > f) ? s = !0 : !d && (o && 1 > Math.abs(p) || !o && -u > p) && (s = !0), s
        },
        B = function(e) {
            return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
        },
        H = function(e) {
            return [e.deltaX, e.deltaY]
        },
        K = function(e) {
            return e && "current" in e ? e.current : e
        },
        V = 0,
        z = [];
    let X = (a = function(e) {
        var t = s.useRef([]),
            n = s.useRef([0, 0]),
            r = s.useRef(),
            o = s.useState(V++)[0],
            i = s.useState(S)[0],
            a = s.useRef(e);
        s.useEffect(function() {
            a.current = e
        }, [e]), s.useEffect(function() {
            if (e.inert) {
                document.body.classList.add("block-interactivity-".concat(o));
                var t = (function(e, t, n) {
                    if (n || 2 == arguments.length)
                        for (var r, o = 0, i = t.length; o < i; o++) !r && o in t || (r || (r = Array.prototype.slice.call(t, 0, o)), r[o] = t[o]);
                    return e.concat(r || Array.prototype.slice.call(t))
                })([e.lockRef.current], (e.shards || []).map(K), !0).filter(Boolean);
                return t.forEach(function(e) {
                        return e.classList.add("allow-interactivity-".concat(o))
                    }),
                    function() {
                        document.body.classList.remove("block-interactivity-".concat(o)), t.forEach(function(e) {
                            return e.classList.remove("allow-interactivity-".concat(o))
                        })
                    }
            }
        }, [e.inert, e.lockRef.current, e.shards]);
        var u = s.useCallback(function(e, t) {
                if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                var o, i = B(e),
                    u = n.current,
                    l = "deltaX" in e ? e.deltaX : u[0] - i[0],
                    c = "deltaY" in e ? e.deltaY : u[1] - i[1],
                    s = e.target,
                    d = Math.abs(l) > Math.abs(c) ? "h" : "v";
                if ("touches" in e && "h" === d && "range" === s.type) return !1;
                var f = window.getSelection(),
                    p = f && f.anchorNode;
                if (p && (p === s || p.contains(s))) return !1;
                var v = j(d, s);
                if (!v) return !0;
                if (v ? o = d : (o = "v" === d ? "h" : "v", v = j(d, s)), !v) return !1;
                if (!r.current && "changedTouches" in e && (l || c) && (r.current = o), !o) return !0;
                var m = r.current || o;
                return U(m, t, e, "h" === m ? l : c, !0)
            }, []),
            l = s.useCallback(function(e) {
                if (z.length && z[z.length - 1] === i) {
                    var n = "deltaY" in e ? H(e) : B(e),
                        r = t.current.filter(function(t) {
                            var r;
                            return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (r = t.delta, r[0] === n[0] && r[1] === n[1])
                        })[0];
                    if (r && r.should) {
                        e.cancelable && e.preventDefault();
                        return
                    }
                    if (!r) {
                        var o = (a.current.shards || []).map(K).filter(Boolean).filter(function(t) {
                            return t.contains(e.target)
                        });
                        (o.length > 0 ? u(e, o[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                    }
                }
            }, []),
            c = s.useCallback(function(e, n, r, o) {
                var i = {
                    name: e,
                    delta: n,
                    target: r,
                    should: o,
                    shadowParent: function(e) {
                        for (var t = null; null !== e;) e instanceof ShadowRoot && (t = e.host, e = e.host), e = e.parentNode;
                        return t
                    }(r)
                };
                t.current.push(i), setTimeout(function() {
                    t.current = t.current.filter(function(e) {
                        return e !== i
                    })
                }, 1)
            }, []),
            d = s.useCallback(function(e) {
                n.current = B(e), r.current = void 0
            }, []),
            f = s.useCallback(function(t) {
                c(t.type, H(t), t.target, u(t, e.lockRef.current))
            }, []),
            p = s.useCallback(function(t) {
                c(t.type, B(t), t.target, u(t, e.lockRef.current))
            }, []);
        s.useEffect(function() {
            return z.push(i), e.setCallbacks({
                    onScrollCapture: f,
                    onWheelCapture: f,
                    onTouchMoveCapture: p
                }), document.addEventListener("wheel", l, D), document.addEventListener("touchmove", l, D), document.addEventListener("touchstart", d, D),
                function() {
                    z = z.filter(function(e) {
                        return e !== i
                    }), document.removeEventListener("wheel", l, D), document.removeEventListener("touchmove", l, D), document.removeEventListener("touchstart", d, D)
                }
        }, []);
        var v = e.removeScrollBar,
            m = e.inert;
        return s.createElement(s.Fragment, null, m ? s.createElement(i, {
            styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
        }) : null, v ? s.createElement(M, {
            noRelative: e.noRelative,
            gapMode: e.gapMode
        }) : null)
    }, y.useMedium(a), E);
    var Y = s.forwardRef(function(e, t) {
        return s.createElement(g, l({}, e, {
            ref: t,
            sideCar: X
        }))
    });
    Y.classNames = g.classNames, e.s(["RemoveScroll", 0, Y], 813593)
}]);

//# debugId=b3192c53-e7af-2c38-8ea2-93452b7556fe
//# sourceMappingURL=25hc1vlgt8eg2.js.map
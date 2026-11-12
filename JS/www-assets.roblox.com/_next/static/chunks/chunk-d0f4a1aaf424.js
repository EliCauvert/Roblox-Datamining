;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1f6581f4-0593-b144-5c62-2efcbaa59462")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 158051, 178511, e => {
    "use strict";
    var t = e.i(420482),
        n = e.i(301775),
        r = e.i(922353),
        o = e.i(19836);

    function i(e) {
        var n;
        let i, a = (n = e, (i = t.forwardRef((e, n) => {
                let {
                    children: o,
                    ...i
                } = e;
                if (t.isValidElement(o)) {
                    var a;
                    let e, u, c = (a = o, (u = (e = Object.getOwnPropertyDescriptor(a.props, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? a.ref : (u = (e = Object.getOwnPropertyDescriptor(a, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? a.props.ref : a.props.ref || a.ref),
                        l = function(e, t) {
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
                    return o.type !== t.Fragment && (l.ref = n ? (0, r.composeRefs)(n, c) : c), t.cloneElement(o, l)
                }
                return t.Children.count(o) > 1 ? t.Children.only(null) : null
            })).displayName = `${n}.SlotClone`, i),
            c = t.forwardRef((e, n) => {
                let {
                    children: r,
                    ...i
                } = e, c = t.Children.toArray(r), l = c.find(u);
                if (l) {
                    let e = l.props.children,
                        r = c.map(n => n !== l ? n : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
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
        return c.displayName = `${e}.Slot`, c
    }
    var a = Symbol("radix.slottable");

    function u(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === a
    }
    e.s(["createSlot", 0, i], 178511);
    var c = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, n) => {
        let r = i(`Primitive.${n}`),
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
        return a.displayName = `Primitive.${n}`, {
            ...e,
            [n]: a
        }
    }, {});
    e.s(["Primitive", 0, c, "dispatchDiscreteCustomEvent", 0, function(e, t) {
        e && n.flushSync(() => e.dispatchEvent(t))
    }], 158051)
}, 488248, e => {
    "use strict";
    var t = e.i(420482);
    e.s(["useCallbackRef", 0, function(e) {
        let n = t.useRef(e);
        return t.useEffect(() => {
            n.current = e
        }), t.useMemo(() => function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            return n.current?.(...t)
        }, [])
    }])
}, 783660, e => {
    "use strict";
    var t, n = e.i(420482),
        r = e.i(775453),
        o = e.i(158051),
        i = e.i(922353),
        a = e.i(488248),
        u = e.i(19836),
        c = "dismissableLayer.update",
        l = n.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        s = n.forwardRef((e, s) => {
            let {
                disableOutsidePointerEvents: v = !1,
                onEscapeKeyDown: m,
                onPointerDownOutside: p,
                onFocusOutside: h,
                onInteractOutside: g,
                onDismiss: y,
                ...E
            } = e, b = n.useContext(l), [w, C] = n.useState(null), R = w?.ownerDocument ?? globalThis?.document, [, S] = n.useState({}), x = (0, i.useComposedRefs)(s, e => C(e)), P = Array.from(b.layers), [L] = [...b.layersWithOutsidePointerEventsDisabled].slice(-1), N = P.indexOf(L), T = w ? P.indexOf(w) : -1, _ = b.layersWithOutsidePointerEventsDisabled.size > 0, k = T >= N, D = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : globalThis?.document,
                    r = (0, a.useCallbackRef)(e),
                    o = n.useRef(!1),
                    i = n.useRef(() => {});
                return n.useEffect(() => {
                    let e = e => {
                            if (e.target && !o.current) {
                                let n = function() {
                                        f("dismissableLayer.pointerDownOutside", r, o, {
                                            discrete: !0
                                        })
                                    },
                                    o = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (t.removeEventListener("click", i.current), i.current = n, t.addEventListener("click", i.current, {
                                    once: !0
                                })) : n()
                            } else t.removeEventListener("click", i.current);
                            o.current = !1
                        },
                        n = window.setTimeout(() => {
                            t.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(n), t.removeEventListener("pointerdown", e), t.removeEventListener("click", i.current)
                    }
                }, [t, r]), {
                    onPointerDownCapture: () => o.current = !0
                }
            }(e => {
                let t = e.target,
                    n = [...b.branches].some(e => e.contains(t));
                k && !n && (p?.(e), g?.(e), e.defaultPrevented || y?.())
            }, R), M = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : globalThis?.document,
                    r = (0, a.useCallbackRef)(e),
                    o = n.useRef(!1);
                return n.useEffect(() => {
                    let e = e => {
                        e.target && !o.current && f("dismissableLayer.focusOutside", r, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return t.addEventListener("focusin", e), () => t.removeEventListener("focusin", e)
                }, [t, r]), {
                    onFocusCapture: () => o.current = !0,
                    onBlurCapture: () => o.current = !1
                }
            }(e => {
                let t = e.target;
                ![...b.branches].some(e => e.contains(t)) && (h?.(e), g?.(e), e.defaultPrevented || y?.())
            }, R);
            return ! function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : globalThis?.document,
                    r = (0, a.useCallbackRef)(e);
                n.useEffect(() => {
                    let e = e => {
                        "Escape" === e.key && r(e)
                    };
                    return t.addEventListener("keydown", e, {
                        capture: !0
                    }), () => t.removeEventListener("keydown", e, {
                        capture: !0
                    })
                }, [r, t])
            }(e => {
                T === b.layers.size - 1 && (m?.(e), !e.defaultPrevented && y && (e.preventDefault(), y()))
            }, R), n.useEffect(() => {
                if (w) return v && (0 === b.layersWithOutsidePointerEventsDisabled.size && (t = R.body.style.pointerEvents, R.body.style.pointerEvents = "none"), b.layersWithOutsidePointerEventsDisabled.add(w)), b.layers.add(w), d(), () => {
                    v && 1 === b.layersWithOutsidePointerEventsDisabled.size && (R.body.style.pointerEvents = t)
                }
            }, [w, R, v, b]), n.useEffect(() => () => {
                w && (b.layers.delete(w), b.layersWithOutsidePointerEventsDisabled.delete(w), d())
            }, [w, b]), n.useEffect(() => {
                let e = () => S({});
                return document.addEventListener(c, e), () => document.removeEventListener(c, e)
            }, []), (0, u.jsx)(o.Primitive.div, {
                ...E,
                ref: x,
                style: {
                    pointerEvents: _ ? k ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: (0, r.composeEventHandlers)(e.onFocusCapture, M.onFocusCapture),
                onBlurCapture: (0, r.composeEventHandlers)(e.onBlurCapture, M.onBlurCapture),
                onPointerDownCapture: (0, r.composeEventHandlers)(e.onPointerDownCapture, D.onPointerDownCapture)
            })
        });

    function d() {
        let e = new CustomEvent(c);
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
        let r = n.useContext(l),
            a = n.useRef(null),
            c = (0, i.useComposedRefs)(t, a);
        return n.useEffect(() => {
            let e = a.current;
            if (e) return r.branches.add(e), () => {
                r.branches.delete(e)
            }
        }, [r.branches]), (0, u.jsx)(o.Primitive.div, {
            ...e,
            ref: c
        })
    }).displayName = "DismissableLayerBranch", e.s(["DismissableLayer", 0, s], 783660)
}, 9413, e => {
    "use strict";
    var t = e.i(420482),
        n = e.i(19836);
    e.s(["createContext", 0, function(e, r) {
        let o = t.createContext(r),
            i = e => {
                let {
                    children: r,
                    ...i
                } = e, a = t.useMemo(() => i, Object.values(i));
                return (0, n.jsx)(o.Provider, {
                    value: a,
                    children: r
                })
            };
        return i.displayName = e + "Provider", [i, function(n) {
            let i = t.useContext(o);
            if (i) return i;
            if (void 0 !== r) return r;
            throw Error(`\`${n}\` must be used within \`${e}\``)
        }]
    }, "createContextScope", 0, function(e) {
        let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            o = [],
            i = () => {
                let n = o.map(e => t.createContext(e));
                return function(r) {
                    let o = r?.[e] || n;
                    return t.useMemo(() => ({
                        [`__scope${e}`]: {
                            ...r,
                            [e]: o
                        }
                    }), [r, o])
                }
            };
        return i.scopeName = e, [function(r, i) {
            let a = t.createContext(i),
                u = o.length;
            o = [...o, i];
            let c = r => {
                let {
                    scope: o,
                    children: i,
                    ...c
                } = r, l = o?.[e]?.[u] || a, s = t.useMemo(() => c, Object.values(c));
                return (0, n.jsx)(l.Provider, {
                    value: s,
                    children: i
                })
            };
            return c.displayName = r + "Provider", [c, function(n, o) {
                let c = o?.[e]?.[u] || a,
                    l = t.useContext(c);
                if (l) return l;
                if (void 0 !== i) return i;
                throw Error(`\`${n}\` must be used within \`${r}\``)
            }]
        }, function() {
            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
            let o = n[0];
            if (1 === n.length) return o;
            let i = () => {
                let e = n.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(n) {
                    let r = e.reduce((e, t) => {
                        let {
                            useScope: r,
                            scopeName: o
                        } = t, i = r(n)[`__scope${o}`];
                        return {
                            ...e,
                            ...i
                        }
                    }, {});
                    return t.useMemo(() => ({
                        [`__scope${o.scopeName}`]: r
                    }), [r])
                }
            };
            return i.scopeName = o.scopeName, i
        }(i, ...r)]
    }])
}, 634918, e => {
    "use strict";
    var t = e.i(420482),
        n = 0;

    function r() {
        let e = document.createElement("span");
        return e.setAttribute("data-radix-focus-guard", ""), e.tabIndex = 0, e.style.outline = "none", e.style.opacity = "0", e.style.position = "fixed", e.style.pointerEvents = "none", e
    }
    e.s(["useFocusGuards", 0, function() {
        t.useEffect(() => {
            let e = document.querySelectorAll("[data-radix-focus-guard]");
            return document.body.insertAdjacentElement("afterbegin", e[0] ?? r()), document.body.insertAdjacentElement("beforeend", e[1] ?? r()), n++, () => {
                1 === n && document.querySelectorAll("[data-radix-focus-guard]").forEach(e => e.remove()), n--
            }
        }, [])
    }])
}, 721988, e => {
    "use strict";
    let t;
    var n = e.i(420482),
        r = e.i(922353),
        o = e.i(158051),
        i = e.i(488248),
        a = e.i(19836),
        u = "focusScope.autoFocusOnMount",
        c = "focusScope.autoFocusOnUnmount",
        l = {
            bubbles: !1,
            cancelable: !0
        },
        s = n.forwardRef((e, t) => {
            let {
                loop: s = !1,
                trapped: p = !1,
                onMountAutoFocus: h,
                onUnmountAutoFocus: g,
                ...y
            } = e, [E, b] = n.useState(null), w = (0, i.useCallbackRef)(h), C = (0, i.useCallbackRef)(g), R = n.useRef(null), S = (0, r.useComposedRefs)(t, e => b(e)), x = n.useRef({
                paused: !1,
                pause() {
                    this.paused = !0
                },
                resume() {
                    this.paused = !1
                }
            }).current;
            n.useEffect(() => {
                if (p) {
                    let e = function(e) {
                            if (x.paused || !E) return;
                            let t = e.target;
                            E.contains(t) ? R.current = t : v(R.current, {
                                select: !0
                            })
                        },
                        t = function(e) {
                            if (x.paused || !E) return;
                            let t = e.relatedTarget;
                            null !== t && (E.contains(t) || v(R.current, {
                                select: !0
                            }))
                        };
                    document.addEventListener("focusin", e), document.addEventListener("focusout", t);
                    let n = new MutationObserver(function(e) {
                        if (document.activeElement === document.body)
                            for (let t of e) t.removedNodes.length > 0 && v(E)
                    });
                    return E && n.observe(E, {
                        childList: !0,
                        subtree: !0
                    }), () => {
                        document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), n.disconnect()
                    }
                }
            }, [p, E, x.paused]), n.useEffect(() => {
                if (E) {
                    m.add(x);
                    let e = document.activeElement;
                    if (!E.contains(e)) {
                        let t = new CustomEvent(u, l);
                        E.addEventListener(u, w), E.dispatchEvent(t), t.defaultPrevented || (function(e) {
                            let {
                                select: t = !1
                            } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, n = document.activeElement;
                            for (let r of e)
                                if (v(r, {
                                        select: t
                                    }), document.activeElement !== n) return
                        }(d(E).filter(e => "A" !== e.tagName), {
                            select: !0
                        }), document.activeElement === e && v(E))
                    }
                    return () => {
                        E.removeEventListener(u, w), setTimeout(() => {
                            let t = new CustomEvent(c, l);
                            E.addEventListener(c, C), E.dispatchEvent(t), t.defaultPrevented || v(e ?? document.body, {
                                select: !0
                            }), E.removeEventListener(c, C), m.remove(x)
                        }, 0)
                    }
                }
            }, [E, w, C, x]);
            let P = n.useCallback(e => {
                if (!s && !p || x.paused) return;
                let t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                    n = document.activeElement;
                if (t && n) {
                    var r;
                    let t, o = e.currentTarget,
                        [i, a] = [f(t = d(r = o), r), f(t.reverse(), r)];
                    i && a ? e.shiftKey || n !== a ? e.shiftKey && n === i && (e.preventDefault(), s && v(a, {
                        select: !0
                    })) : (e.preventDefault(), s && v(i, {
                        select: !0
                    })) : n === o && e.preventDefault()
                }
            }, [s, p, x.paused]);
            return (0, a.jsx)(o.Primitive.div, {
                tabIndex: -1,
                ...y,
                ref: S,
                onKeyDown: P
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

    function v(e) {
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
    var m = (t = [], {
        add(e) {
            let n = t[0];
            e !== n && n?.pause(), (t = p(t, e)).unshift(e)
        },
        remove(e) {
            t = p(t, e), t[0]?.resume()
        }
    });

    function p(e, t) {
        let n = [...e],
            r = n.indexOf(t);
        return -1 !== r && n.splice(r, 1), n
    }
    e.s(["FocusScope", 0, s])
}, 411207, 18731, e => {
    "use strict";
    var t = e.i(420482),
        n = globalThis?.document ? t.useLayoutEffect : () => {};
    e.s(["useLayoutEffect", 0, n], 18731);
    var r = t[" useId ".trim().toString()] || (() => void 0),
        o = 0;
    e.s(["useId", 0, function(e) {
        let [i, a] = t.useState(r());
        return n(() => {
            e || a(e => e ?? String(o++))
        }, [e]), e || (i ? `radix-${i}` : "")
    }], 411207)
}, 199794, e => {
    "use strict";
    var t = e.i(420482),
        n = e.i(301775),
        r = e.i(158051),
        o = e.i(18731),
        i = e.i(19836),
        a = t.forwardRef((e, a) => {
            let {
                container: u,
                ...c
            } = e, [l, s] = t.useState(!1);
            (0, o.useLayoutEffect)(() => s(!0), []);
            let d = u || l && globalThis?.document?.body;
            return d ? n.default.createPortal((0, i.jsx)(r.Primitive.div, {
                ...c,
                ref: a
            }), d) : null
        });
    a.displayName = "Portal", e.s(["Portal", 0, a])
}, 584537, e => {
    "use strict";
    var t = e.i(420482),
        n = e.i(488248);
    e.s(["useControllableState", 0, function(e) {
        let {
            prop: r,
            defaultProp: o,
            onChange: i = () => {}
        } = e, [a, u] = function(e) {
            let {
                defaultProp: r,
                onChange: o
            } = e, i = t.useState(r), [a] = i, u = t.useRef(a), c = (0, n.useCallbackRef)(o);
            return t.useEffect(() => {
                u.current !== a && (c(a), u.current = a)
            }, [a, u, c]), i
        }({
            defaultProp: o,
            onChange: i
        }), c = void 0 !== r, l = c ? r : a, s = (0, n.useCallbackRef)(i);
        return [l, t.useCallback(e => {
            if (c) {
                let t = "function" == typeof e ? e(r) : e;
                t !== r && s(t)
            } else u(e)
        }, [c, r, u, s])]
    }])
}, 700312, e => {
    "use strict";
    var t, n, r, o, i, a, u = e.i(824627),
        c = e.i(420482),
        l = "right-scroll-bar-position",
        s = "width-before-scroll-bar";

    function d(e, t) {
        return "function" == typeof e ? e(t) : e && (e.current = t), e
    }
    var f = "u" > typeof window ? c.useLayoutEffect : c.useEffect,
        v = new WeakMap,
        m = (void 0 === t && (t = {}), (void 0 === n && (n = function(e) {
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
        }).options = (0, u.__assign)({
            async: !0,
            ssr: !1
        }, t), i),
        p = function() {},
        h = c.forwardRef(function(e, t) {
            var n, r, o, i, a = c.useRef(null),
                l = c.useState({
                    onScrollCapture: p,
                    onWheelCapture: p,
                    onTouchMoveCapture: p
                }),
                s = l[0],
                h = l[1],
                g = e.forwardProps,
                y = e.children,
                E = e.className,
                b = e.removeScrollBar,
                w = e.enabled,
                C = e.shards,
                R = e.sideCar,
                S = e.noRelative,
                x = e.noIsolation,
                P = e.inert,
                L = e.allowPinchZoom,
                N = e.as,
                T = e.gapMode,
                _ = (0, u.__rest)(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                k = (n = [a, t], r = function(e) {
                    return n.forEach(function(t) {
                        return d(t, e)
                    })
                }, (o = (0, c.useState)(function() {
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
                })[0]).callback = r, i = o.facade, f(function() {
                    var e = v.get(i);
                    if (e) {
                        var t = new Set(e),
                            r = new Set(n),
                            o = i.current;
                        t.forEach(function(e) {
                            r.has(e) || d(e, null)
                        }), r.forEach(function(e) {
                            t.has(e) || d(e, o)
                        })
                    }
                    v.set(i, n)
                }, [n]), i),
                D = (0, u.__assign)((0, u.__assign)({}, _), s);
            return c.createElement(c.Fragment, null, w && c.createElement(R, {
                sideCar: m,
                removeScrollBar: b,
                shards: C,
                noRelative: S,
                noIsolation: x,
                inert: P,
                setCallbacks: h,
                allowPinchZoom: !!L,
                lockRef: a,
                gapMode: T
            }), g ? c.cloneElement(c.Children.only(y), (0, u.__assign)((0, u.__assign)({}, D), {
                ref: k
            })) : c.createElement(void 0 === N ? "div" : N, (0, u.__assign)({}, D, {
                className: E,
                ref: k
            }), y))
        });
    h.defaultProps = {
        enabled: !0,
        removeScrollBar: !0,
        inert: !1
    }, h.classNames = {
        fullWidth: s,
        zeroRight: l
    };
    var g = function(e) {
        var t = e.sideCar,
            n = (0, u.__rest)(e, ["sideCar"]);
        if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
        var r = t.read();
        if (!r) throw Error("Sidecar medium not found");
        return c.createElement(r, (0, u.__assign)({}, n))
    };
    g.isSideCarExport = !0;
    var y = e.i(422197),
        E = function() {
            var e = 0,
                t = null;
            return {
                add: function(n) {
                    if (0 == e && (t = function() {
                            if (!document) return null;
                            var e = document.createElement("style");
                            e.type = "text/css";
                            var t = (0, y.getNonce)();
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
        b = function() {
            var e = E();
            return function(t, n) {
                c.useEffect(function() {
                    return e.add(t),
                        function() {
                            e.remove()
                        }
                }, [t && n])
            }
        },
        w = function() {
            var e = b();
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
        S = function(e) {
            var t = window.getComputedStyle(document.body),
                n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                r = t["padding" === e ? "paddingTop" : "marginTop"],
                o = t["padding" === e ? "paddingRight" : "marginRight"];
            return [R(n), R(r), R(o)]
        },
        x = function(e) {
            if (void 0 === e && (e = "margin"), "u" < typeof window) return C;
            var t = S(e),
                n = document.documentElement.clientWidth,
                r = window.innerWidth;
            return {
                left: t[0],
                top: t[1],
                right: t[2],
                gap: Math.max(0, r - n + t[2] - t[0])
            }
        },
        P = w(),
        L = "data-scroll-locked",
        N = function(e, t, n, r) {
            var o = e.left,
                i = e.top,
                a = e.right,
                u = e.gap;
            return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(u, "px ").concat(r, ";\n  }\n  body[").concat(L, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(u, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(u, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(l, " {\n    right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(s, " {\n    margin-right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(l, " .").concat(l, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(s, " .").concat(s, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(L, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(u, "px;\n  }\n")
        },
        T = function() {
            var e = parseInt(document.body.getAttribute(L) || "0", 10);
            return isFinite(e) ? e : 0
        },
        _ = function() {
            c.useEffect(function() {
                return document.body.setAttribute(L, (T() + 1).toString()),
                    function() {
                        var e = T() - 1;
                        e <= 0 ? document.body.removeAttribute(L) : document.body.setAttribute(L, e.toString())
                    }
            }, [])
        },
        k = function(e) {
            var t = e.noRelative,
                n = e.noImportant,
                r = e.gapMode,
                o = void 0 === r ? "margin" : r;
            _();
            var i = c.useMemo(function() {
                return x(o)
            }, [o]);
            return c.createElement(P, {
                styles: N(i, !t, o, n ? "" : "!important")
            })
        },
        D = !1;
    if ("u" > typeof window) try {
        var M = Object.defineProperty({}, "passive", {
            get: function() {
                return D = !0, !0
            }
        });
        window.addEventListener("test", M, M), window.removeEventListener("test", M, M)
    } catch (e) {
        D = !1
    }
    var O = !!D && {
            passive: !1
        },
        A = function(e, t) {
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
            return "v" === e ? A(t, "overflowY") : A(t, "overflowX")
        },
        F = function(e, t) {
            return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
        },
        I = function(e, t, n, r, o) {
            var i, a = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                u = a * r,
                c = n.target,
                l = t.contains(c),
                s = !1,
                d = u > 0,
                f = 0,
                v = 0;
            do {
                if (!c) break;
                var m = F(e, c),
                    p = m[0],
                    h = m[1] - m[2] - a * p;
                (p || h) && W(e, c) && (f += h, v += p);
                var g = c.parentNode;
                c = g && g.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? g.host : g
            } while (!l && c !== document.body || l && (t.contains(c) || t === c)) return d && (o && 1 > Math.abs(f) || !o && u > f) ? s = !0 : !d && (o && 1 > Math.abs(v) || !o && -u > v) && (s = !0), s
        },
        B = function(e) {
            return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
        },
        $ = function(e) {
            return [e.deltaX, e.deltaY]
        },
        K = function(e) {
            return e && "current" in e ? e.current : e
        },
        V = 0,
        H = [];
    let X = (a = function(e) {
        var t = c.useRef([]),
            n = c.useRef([0, 0]),
            r = c.useRef(),
            o = c.useState(V++)[0],
            i = c.useState(w)[0],
            a = c.useRef(e);
        c.useEffect(function() {
            a.current = e
        }, [e]), c.useEffect(function() {
            if (e.inert) {
                document.body.classList.add("block-interactivity-".concat(o));
                var t = (0, u.__spreadArray)([e.lockRef.current], (e.shards || []).map(K), !0).filter(Boolean);
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
        var l = c.useCallback(function(e, t) {
                if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                var o, i = B(e),
                    u = n.current,
                    c = "deltaX" in e ? e.deltaX : u[0] - i[0],
                    l = "deltaY" in e ? e.deltaY : u[1] - i[1],
                    s = e.target,
                    d = Math.abs(c) > Math.abs(l) ? "h" : "v";
                if ("touches" in e && "h" === d && "range" === s.type) return !1;
                var f = j(d, s);
                if (!f) return !0;
                if (f ? o = d : (o = "v" === d ? "h" : "v", f = j(d, s)), !f) return !1;
                if (!r.current && "changedTouches" in e && (c || l) && (r.current = o), !o) return !0;
                var v = r.current || o;
                return I(v, t, e, "h" === v ? c : l, !0)
            }, []),
            s = c.useCallback(function(e) {
                if (H.length && H[H.length - 1] === i) {
                    var n = "deltaY" in e ? $(e) : B(e),
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
                        (o.length > 0 ? l(e, o[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                    }
                }
            }, []),
            d = c.useCallback(function(e, n, r, o) {
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
            f = c.useCallback(function(e) {
                n.current = B(e), r.current = void 0
            }, []),
            v = c.useCallback(function(t) {
                d(t.type, $(t), t.target, l(t, e.lockRef.current))
            }, []),
            m = c.useCallback(function(t) {
                d(t.type, B(t), t.target, l(t, e.lockRef.current))
            }, []);
        c.useEffect(function() {
            return H.push(i), e.setCallbacks({
                    onScrollCapture: v,
                    onWheelCapture: v,
                    onTouchMoveCapture: m
                }), document.addEventListener("wheel", s, O), document.addEventListener("touchmove", s, O), document.addEventListener("touchstart", f, O),
                function() {
                    H = H.filter(function(e) {
                        return e !== i
                    }), document.removeEventListener("wheel", s, O), document.removeEventListener("touchmove", s, O), document.removeEventListener("touchstart", f, O)
                }
        }, []);
        var p = e.removeScrollBar,
            h = e.inert;
        return c.createElement(c.Fragment, null, h ? c.createElement(i, {
            styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
        }) : null, p ? c.createElement(k, {
            noRelative: e.noRelative,
            gapMode: e.gapMode
        }) : null)
    }, m.useMedium(a), g);
    var Y = c.forwardRef(function(e, t) {
        return c.createElement(h, (0, u.__assign)({}, e, {
            ref: t,
            sideCar: X
        }))
    });
    Y.classNames = h.classNames, e.s(["RemoveScroll", 0, Y], 700312)
}, 285565, 160310, e => {
    "use strict";
    var t = e.i(420482);
    e.i(301775);
    var n = e.i(922353),
        r = e.i(19836);

    function o(e) {
        var o;
        let i, u = (o = e, (i = t.forwardRef((e, r) => {
                let {
                    children: o,
                    ...i
                } = e;
                if (t.isValidElement(o)) {
                    var a;
                    let e, u, c = (a = o, (u = (e = Object.getOwnPropertyDescriptor(a.props, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? a.ref : (u = (e = Object.getOwnPropertyDescriptor(a, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? a.props.ref : a.props.ref || a.ref),
                        l = function(e, t) {
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
                    return o.type !== t.Fragment && (l.ref = r ? (0, n.composeRefs)(r, c) : c), t.cloneElement(o, l)
                }
                return t.Children.count(o) > 1 ? t.Children.only(null) : null
            })).displayName = `${o}.SlotClone`, i),
            c = t.forwardRef((e, n) => {
                let {
                    children: o,
                    ...i
                } = e, c = t.Children.toArray(o), l = c.find(a);
                if (l) {
                    let e = l.props.children,
                        o = c.map(n => n !== l ? n : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, r.jsx)(u, {
                        ...i,
                        ref: n,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, o) : null
                    })
                }
                return (0, r.jsx)(u, {
                    ...i,
                    ref: n,
                    children: o
                })
            });
        return c.displayName = `${e}.Slot`, c
    }
    var i = Symbol("radix.slottable");

    function a(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === i
    }
    e.s(["createSlot", 0, o], 160310);
    var u = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, n) => {
        let i = o(`Primitive.${n}`),
            a = t.forwardRef((e, t) => {
                let {
                    asChild: o,
                    ...a
                } = e;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, r.jsx)(o ? i : n, {
                    ...a,
                    ref: t
                })
            });
        return a.displayName = `Primitive.${n}`, {
            ...e,
            [n]: a
        }
    }, {});
    e.s(["Primitive", 0, u], 285565)
}]);

//# debugId=1f6581f4-0593-b144-5c62-2efcbaa59462
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0.3r5u1mi6s.f.js.map
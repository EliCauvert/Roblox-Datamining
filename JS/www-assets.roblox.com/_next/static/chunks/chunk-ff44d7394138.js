;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "bfd95d99-bbe1-a04b-3bd0-71093d1fc3be")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 513443, 494334, 354981, 434205, 430781, 5872, 337537, 396012, 653279, 641501, 806887, e => {
    "use strict";
    let t;
    var n, r, o, a, i, u, s, l = e.i(420482),
        c = e.i(775453),
        d = e.i(539181),
        f = e.i(734988),
        p = e.i(481010),
        m = e.i(823499);

    function v(e) {
        let {
            prop: t,
            defaultProp: n,
            onChange: r = () => {}
        } = e, [o, a] = function(e) {
            let {
                defaultProp: t,
                onChange: n
            } = e, r = l.useState(t), [o] = r, a = l.useRef(o), i = (0, m.useCallbackRef)(n);
            return l.useEffect(() => {
                a.current !== o && (i(o), a.current = o)
            }, [o, a, i]), r
        }({
            defaultProp: n,
            onChange: r
        }), i = void 0 !== t, u = i ? t : o, s = (0, m.useCallbackRef)(r);
        return [u, l.useCallback(e => {
            if (i) {
                let n = "function" == typeof e ? e(t) : e;
                n !== t && s(n)
            } else a(e)
        }, [i, t, a, s])]
    }
    e.s(["useControllableState", 0, v], 494334);
    var h = e.i(301775),
        g = e.i(19836);

    function y(e) {
        var t;
        let n, r = (t = e, (n = l.forwardRef((e, t) => {
                let {
                    children: n,
                    ...r
                } = e;
                if (l.isValidElement(n)) {
                    var o;
                    let e, a, i = (o = n, (a = (e = Object.getOwnPropertyDescriptor(o.props, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? o.ref : (a = (e = Object.getOwnPropertyDescriptor(o, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? o.props.ref : o.props.ref || o.ref),
                        u = function(e, t) {
                            let n = {
                                ...t
                            };
                            for (let r in t) {
                                let o = e[r],
                                    a = t[r];
                                /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                    a(...t), o(...t)
                                } : o && (n[r] = o) : "style" === r ? n[r] = {
                                    ...o,
                                    ...a
                                } : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...n
                            }
                        }(r, n.props);
                    return n.type !== l.Fragment && (u.ref = t ? (0, d.composeRefs)(t, i) : i), l.cloneElement(n, u)
                }
                return l.Children.count(n) > 1 ? l.Children.only(null) : null
            })).displayName = `${t}.SlotClone`, n),
            o = l.forwardRef((e, t) => {
                let {
                    children: n,
                    ...o
                } = e, a = l.Children.toArray(n), i = a.find(b);
                if (i) {
                    let e = i.props.children,
                        n = a.map(t => t !== i ? t : l.Children.count(e) > 1 ? l.Children.only(null) : l.isValidElement(e) ? e.props.children : null);
                    return (0, g.jsx)(r, {
                        ...o,
                        ref: t,
                        children: l.isValidElement(e) ? l.cloneElement(e, void 0, n) : null
                    })
                }
                return (0, g.jsx)(r, {
                    ...o,
                    ref: t,
                    children: n
                })
            });
        return o.displayName = `${e}.Slot`, o
    }
    var E = Symbol("radix.slottable");

    function b(e) {
        return l.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === E
    }
    e.s(["createSlot", 0, y], 354981);
    var w = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
        let n = y(`Primitive.${t}`),
            r = l.forwardRef((e, r) => {
                let {
                    asChild: o,
                    ...a
                } = e;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, g.jsx)(o ? n : t, {
                    ...a,
                    ref: r
                })
            });
        return r.displayName = `Primitive.${t}`, {
            ...e,
            [t]: r
        }
    }, {});

    function C(e, t) {
        e && h.flushSync(() => e.dispatchEvent(t))
    }
    e.s(["Primitive", 0, w, "dispatchDiscreteCustomEvent", 0, C], 434205);
    var R = "dismissableLayer.update",
        N = l.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        x = l.forwardRef((e, t) => {
            let {
                disableOutsidePointerEvents: n = !1,
                onEscapeKeyDown: r,
                onPointerDownOutside: o,
                onFocusOutside: a,
                onInteractOutside: i,
                onDismiss: u,
                ...f
            } = e, p = l.useContext(N), [v, h] = l.useState(null), y = v?.ownerDocument ?? globalThis?.document, [, E] = l.useState({}), b = (0, d.useComposedRefs)(t, e => h(e)), C = Array.from(p.layers), [x] = [...p.layersWithOutsidePointerEventsDisabled].slice(-1), T = C.indexOf(x), O = v ? C.indexOf(v) : -1, P = p.layersWithOutsidePointerEventsDisabled.size > 0, L = O >= T, I = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : globalThis?.document,
                    n = (0, m.useCallbackRef)(e),
                    r = l.useRef(!1),
                    o = l.useRef(() => {});
                return l.useEffect(() => {
                    let e = e => {
                            if (e.target && !r.current) {
                                let r = function() {
                                        D("dismissableLayer.pointerDownOutside", n, a, {
                                            discrete: !0
                                        })
                                    },
                                    a = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (t.removeEventListener("click", o.current), o.current = r, t.addEventListener("click", o.current, {
                                    once: !0
                                })) : r()
                            } else t.removeEventListener("click", o.current);
                            r.current = !1
                        },
                        a = window.setTimeout(() => {
                            t.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(a), t.removeEventListener("pointerdown", e), t.removeEventListener("click", o.current)
                    }
                }, [t, n]), {
                    onPointerDownCapture: () => r.current = !0
                }
            }(e => {
                let t = e.target,
                    n = [...p.branches].some(e => e.contains(t));
                L && !n && (o?.(e), i?.(e), e.defaultPrevented || u?.())
            }, y), _ = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : globalThis?.document,
                    n = (0, m.useCallbackRef)(e),
                    r = l.useRef(!1);
                return l.useEffect(() => {
                    let e = e => {
                        e.target && !r.current && D("dismissableLayer.focusOutside", n, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return t.addEventListener("focusin", e), () => t.removeEventListener("focusin", e)
                }, [t, n]), {
                    onFocusCapture: () => r.current = !0,
                    onBlurCapture: () => r.current = !1
                }
            }(e => {
                let t = e.target;
                ![...p.branches].some(e => e.contains(t)) && (a?.(e), i?.(e), e.defaultPrevented || u?.())
            }, y);
            return ! function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : globalThis?.document,
                    n = (0, m.useCallbackRef)(e);
                l.useEffect(() => {
                    let e = e => {
                        "Escape" === e.key && n(e)
                    };
                    return t.addEventListener("keydown", e, {
                        capture: !0
                    }), () => t.removeEventListener("keydown", e, {
                        capture: !0
                    })
                }, [n, t])
            }(e => {
                O === p.layers.size - 1 && (r?.(e), !e.defaultPrevented && u && (e.preventDefault(), u()))
            }, y), l.useEffect(() => {
                if (v) return n && (0 === p.layersWithOutsidePointerEventsDisabled.size && (s = y.body.style.pointerEvents, y.body.style.pointerEvents = "none"), p.layersWithOutsidePointerEventsDisabled.add(v)), p.layers.add(v), S(), () => {
                    n && 1 === p.layersWithOutsidePointerEventsDisabled.size && (y.body.style.pointerEvents = s)
                }
            }, [v, y, n, p]), l.useEffect(() => () => {
                v && (p.layers.delete(v), p.layersWithOutsidePointerEventsDisabled.delete(v), S())
            }, [v, p]), l.useEffect(() => {
                let e = () => E({});
                return document.addEventListener(R, e), () => document.removeEventListener(R, e)
            }, []), (0, g.jsx)(w.div, {
                ...f,
                ref: b,
                style: {
                    pointerEvents: P ? L ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: (0, c.composeEventHandlers)(e.onFocusCapture, _.onFocusCapture),
                onBlurCapture: (0, c.composeEventHandlers)(e.onBlurCapture, _.onBlurCapture),
                onPointerDownCapture: (0, c.composeEventHandlers)(e.onPointerDownCapture, I.onPointerDownCapture)
            })
        });

    function S() {
        let e = new CustomEvent(R);
        document.dispatchEvent(e)
    }

    function D(e, t, n, r) {
        let {
            discrete: o
        } = r, a = n.originalEvent.target, i = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: n
        });
        t && a.addEventListener(e, t, {
            once: !0
        }), o ? C(a, i) : a.dispatchEvent(i)
    }
    x.displayName = "DismissableLayer", l.forwardRef((e, t) => {
        let n = l.useContext(N),
            r = l.useRef(null),
            o = (0, d.useComposedRefs)(t, r);
        return l.useEffect(() => {
            let e = r.current;
            if (e) return n.branches.add(e), () => {
                n.branches.delete(e)
            }
        }, [n.branches]), (0, g.jsx)(w.div, {
            ...e,
            ref: o
        })
    }).displayName = "DismissableLayerBranch", e.s(["DismissableLayer", 0, x], 430781);
    var T = "focusScope.autoFocusOnMount",
        O = "focusScope.autoFocusOnUnmount",
        P = {
            bubbles: !1,
            cancelable: !0
        },
        L = l.forwardRef((e, t) => {
            let {
                loop: n = !1,
                trapped: r = !1,
                onMountAutoFocus: o,
                onUnmountAutoFocus: a,
                ...i
            } = e, [u, s] = l.useState(null), c = (0, m.useCallbackRef)(o), f = (0, m.useCallbackRef)(a), p = l.useRef(null), v = (0, d.useComposedRefs)(t, e => s(e)), h = l.useRef({
                paused: !1,
                pause() {
                    this.paused = !0
                },
                resume() {
                    this.paused = !1
                }
            }).current;
            l.useEffect(() => {
                if (r) {
                    let e = function(e) {
                            if (h.paused || !u) return;
                            let t = e.target;
                            u.contains(t) ? p.current = t : M(p.current, {
                                select: !0
                            })
                        },
                        t = function(e) {
                            if (h.paused || !u) return;
                            let t = e.relatedTarget;
                            null !== t && (u.contains(t) || M(p.current, {
                                select: !0
                            }))
                        };
                    document.addEventListener("focusin", e), document.addEventListener("focusout", t);
                    let n = new MutationObserver(function(e) {
                        if (document.activeElement === document.body)
                            for (let t of e) t.removedNodes.length > 0 && M(u)
                    });
                    return u && n.observe(u, {
                        childList: !0,
                        subtree: !0
                    }), () => {
                        document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), n.disconnect()
                    }
                }
            }, [r, u, h.paused]), l.useEffect(() => {
                if (u) {
                    k.add(h);
                    let e = document.activeElement;
                    if (!u.contains(e)) {
                        let t = new CustomEvent(T, P);
                        u.addEventListener(T, c), u.dispatchEvent(t), t.defaultPrevented || (function(e) {
                            let {
                                select: t = !1
                            } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, n = document.activeElement;
                            for (let r of e)
                                if (M(r, {
                                        select: t
                                    }), document.activeElement !== n) return
                        }(I(u).filter(e => "A" !== e.tagName), {
                            select: !0
                        }), document.activeElement === e && M(u))
                    }
                    return () => {
                        u.removeEventListener(T, c), setTimeout(() => {
                            let t = new CustomEvent(O, P);
                            u.addEventListener(O, f), u.dispatchEvent(t), t.defaultPrevented || M(e ?? document.body, {
                                select: !0
                            }), u.removeEventListener(O, f), k.remove(h)
                        }, 0)
                    }
                }
            }, [u, c, f, h]);
            let y = l.useCallback(e => {
                if (!n && !r || h.paused) return;
                let t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                    o = document.activeElement;
                if (t && o) {
                    var a;
                    let t, r = e.currentTarget,
                        [i, u] = [_(t = I(a = r), a), _(t.reverse(), a)];
                    i && u ? e.shiftKey || o !== u ? e.shiftKey && o === i && (e.preventDefault(), n && M(u, {
                        select: !0
                    })) : (e.preventDefault(), n && M(i, {
                        select: !0
                    })) : o === r && e.preventDefault()
                }
            }, [n, r, h.paused]);
            return (0, g.jsx)(w.div, {
                tabIndex: -1,
                ...i,
                ref: v,
                onKeyDown: y
            })
        });

    function I(e) {
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

    function _(e, t) {
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

    function M(e) {
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
    L.displayName = "FocusScope";
    var k = (t = [], {
        add(e) {
            let n = t[0];
            e !== n && n?.pause(), (t = j(t, e)).unshift(e)
        },
        remove(e) {
            t = j(t, e), t[0]?.resume()
        }
    });

    function j(e, t) {
        let n = [...e],
            r = n.indexOf(t);
        return -1 !== r && n.splice(r, 1), n
    }
    e.s(["FocusScope", 0, L], 5872);
    var A = e.i(13522),
        F = l.forwardRef((e, t) => {
            let {
                container: n,
                ...r
            } = e, [o, a] = l.useState(!1);
            (0, A.useLayoutEffect)(() => a(!0), []);
            let i = n || o && globalThis?.document?.body;
            return i ? h.default.createPortal((0, g.jsx)(w.div, {
                ...r,
                ref: t
            }), i) : null
        });
    F.displayName = "Portal", e.s(["Portal", 0, F], 337537);
    var W = e => {
        var t;
        let n, r, {
                present: o,
                children: a
            } = e,
            i = function(e) {
                var t, n;
                let [r, o] = l.useState(), a = l.useRef({}), i = l.useRef(e), u = l.useRef("none"), [s, c] = (t = e ? "mounted" : "unmounted", n = {
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
                }, l.useReducer((e, t) => n[e][t] ?? e, t));
                return l.useEffect(() => {
                    let e = B(a.current);
                    u.current = "mounted" === s ? e : "none"
                }, [s]), (0, A.useLayoutEffect)(() => {
                    let t = a.current,
                        n = i.current;
                    if (n !== e) {
                        let r = u.current,
                            o = B(t);
                        e ? c("MOUNT") : "none" === o || t?.display === "none" ? c("UNMOUNT") : n && r !== o ? c("ANIMATION_OUT") : c("UNMOUNT"), i.current = e
                    }
                }, [e, c]), (0, A.useLayoutEffect)(() => {
                    if (r) {
                        let e, t = r.ownerDocument.defaultView ?? window,
                            n = n => {
                                let o = B(a.current).includes(n.animationName);
                                if (n.target === r && o && (c("ANIMATION_END"), !i.current)) {
                                    let n = r.style.animationFillMode;
                                    r.style.animationFillMode = "forwards", e = t.setTimeout(() => {
                                        "forwards" === r.style.animationFillMode && (r.style.animationFillMode = n)
                                    })
                                }
                            },
                            o = e => {
                                e.target === r && (u.current = B(a.current))
                            };
                        return r.addEventListener("animationstart", o), r.addEventListener("animationcancel", n), r.addEventListener("animationend", n), () => {
                            t.clearTimeout(e), r.removeEventListener("animationstart", o), r.removeEventListener("animationcancel", n), r.removeEventListener("animationend", n)
                        }
                    }
                    c("ANIMATION_END")
                }, [r, c]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(s),
                    ref: l.useCallback(e => {
                        e && (a.current = getComputedStyle(e)), o(e)
                    }, [])
                }
            }(o),
            u = "function" == typeof a ? a({
                present: i.isPresent
            }) : l.Children.only(a),
            s = (0, d.useComposedRefs)(i.ref, (t = u, (r = (n = Object.getOwnPropertyDescriptor(t.props, "ref")?.get) && "isReactWarning" in n && n.isReactWarning) ? t.ref : (r = (n = Object.getOwnPropertyDescriptor(t, "ref")?.get) && "isReactWarning" in n && n.isReactWarning) ? t.props.ref : t.props.ref || t.ref));
        return "function" == typeof a || i.isPresent ? l.cloneElement(u, {
            ref: s
        }) : null
    };

    function B(e) {
        return e?.animationName || "none"
    }
    W.displayName = "Presence", e.s(["Presence", 0, W], 396012);
    var U = 0;

    function H() {
        l.useEffect(() => {
            let e = document.querySelectorAll("[data-radix-focus-guard]");
            return document.body.insertAdjacentElement("afterbegin", e[0] ?? K()), document.body.insertAdjacentElement("beforeend", e[1] ?? K()), U++, () => {
                1 === U && document.querySelectorAll("[data-radix-focus-guard]").forEach(e => e.remove()), U--
            }
        }, [])
    }

    function K() {
        let e = document.createElement("span");
        return e.setAttribute("data-radix-focus-guard", ""), e.tabIndex = 0, e.style.outline = "none", e.style.opacity = "0", e.style.position = "fixed", e.style.pointerEvents = "none", e
    }
    e.s(["useFocusGuards", 0, H], 653279);
    var $ = e.i(824627),
        V = "right-scroll-bar-position",
        z = "width-before-scroll-bar";

    function X(e, t) {
        return "function" == typeof e ? e(t) : e && (e.current = t), e
    }
    var Y = "u" > typeof window ? l.useLayoutEffect : l.useEffect,
        Z = new WeakMap,
        q = (void 0 === n && (n = {}), (void 0 === r && (r = function(e) {
            return e
        }), o = [], a = !1, i = {
            read: function() {
                if (a) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                return o.length ? o[o.length - 1] : null
            },
            useMedium: function(e) {
                var t = r(e, a);
                return o.push(t),
                    function() {
                        o = o.filter(function(e) {
                            return e !== t
                        })
                    }
            },
            assignSyncMedium: function(e) {
                for (a = !0; o.length;) {
                    var t = o;
                    o = [], t.forEach(e)
                }
                o = {
                    push: function(t) {
                        return e(t)
                    },
                    filter: function() {
                        return o
                    }
                }
            },
            assignMedium: function(e) {
                a = !0;
                var t = [];
                if (o.length) {
                    var n = o;
                    o = [], n.forEach(e), t = o
                }
                var r = function() {
                        var n = t;
                        t = [], n.forEach(e)
                    },
                    i = function() {
                        return Promise.resolve().then(r)
                    };
                i(), o = {
                    push: function(e) {
                        t.push(e), i()
                    },
                    filter: function(e) {
                        return t = t.filter(e), o
                    }
                }
            }
        }).options = (0, $.__assign)({
            async: !0,
            ssr: !1
        }, n), i),
        G = function() {},
        J = l.forwardRef(function(e, t) {
            var n, r, o, a, i = l.useRef(null),
                u = l.useState({
                    onScrollCapture: G,
                    onWheelCapture: G,
                    onTouchMoveCapture: G
                }),
                s = u[0],
                c = u[1],
                d = e.forwardProps,
                f = e.children,
                p = e.className,
                m = e.removeScrollBar,
                v = e.enabled,
                h = e.shards,
                g = e.sideCar,
                y = e.noRelative,
                E = e.noIsolation,
                b = e.inert,
                w = e.allowPinchZoom,
                C = e.as,
                R = e.gapMode,
                N = (0, $.__rest)(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                x = (n = [i, t], r = function(e) {
                    return n.forEach(function(t) {
                        return X(t, e)
                    })
                }, (o = (0, l.useState)(function() {
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
                })[0]).callback = r, a = o.facade, Y(function() {
                    var e = Z.get(a);
                    if (e) {
                        var t = new Set(e),
                            r = new Set(n),
                            o = a.current;
                        t.forEach(function(e) {
                            r.has(e) || X(e, null)
                        }), r.forEach(function(e) {
                            t.has(e) || X(e, o)
                        })
                    }
                    Z.set(a, n)
                }, [n]), a),
                S = (0, $.__assign)((0, $.__assign)({}, N), s);
            return l.createElement(l.Fragment, null, v && l.createElement(g, {
                sideCar: q,
                removeScrollBar: m,
                shards: h,
                noRelative: y,
                noIsolation: E,
                inert: b,
                setCallbacks: c,
                allowPinchZoom: !!w,
                lockRef: i,
                gapMode: R
            }), d ? l.cloneElement(l.Children.only(f), (0, $.__assign)((0, $.__assign)({}, S), {
                ref: x
            })) : l.createElement(void 0 === C ? "div" : C, (0, $.__assign)({}, S, {
                className: p,
                ref: x
            }), f))
        });
    J.defaultProps = {
        enabled: !0,
        removeScrollBar: !0,
        inert: !1
    }, J.classNames = {
        fullWidth: z,
        zeroRight: V
    };
    var Q = function(e) {
        var t = e.sideCar,
            n = (0, $.__rest)(e, ["sideCar"]);
        if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
        var r = t.read();
        if (!r) throw Error("Sidecar medium not found");
        return l.createElement(r, (0, $.__assign)({}, n))
    };
    Q.isSideCarExport = !0;
    var ee = e.i(422197),
        et = function() {
            var e = 0,
                t = null;
            return {
                add: function(n) {
                    if (0 == e && (t = function() {
                            if (!document) return null;
                            var e = document.createElement("style");
                            e.type = "text/css";
                            var t = (0, ee.getNonce)();
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
        en = function() {
            var e = et();
            return function(t, n) {
                l.useEffect(function() {
                    return e.add(t),
                        function() {
                            e.remove()
                        }
                }, [t && n])
            }
        },
        er = function() {
            var e = en();
            return function(t) {
                return e(t.styles, t.dynamic), null
            }
        },
        eo = {
            left: 0,
            top: 0,
            right: 0,
            gap: 0
        },
        ea = function(e) {
            return parseInt(e || "", 10) || 0
        },
        ei = function(e) {
            var t = window.getComputedStyle(document.body),
                n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                r = t["padding" === e ? "paddingTop" : "marginTop"],
                o = t["padding" === e ? "paddingRight" : "marginRight"];
            return [ea(n), ea(r), ea(o)]
        },
        eu = function(e) {
            if (void 0 === e && (e = "margin"), "u" < typeof window) return eo;
            var t = ei(e),
                n = document.documentElement.clientWidth,
                r = window.innerWidth;
            return {
                left: t[0],
                top: t[1],
                right: t[2],
                gap: Math.max(0, r - n + t[2] - t[0])
            }
        },
        es = er(),
        el = "data-scroll-locked",
        ec = function(e, t, n, r) {
            var o = e.left,
                a = e.top,
                i = e.right,
                u = e.gap;
            return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(u, "px ").concat(r, ";\n  }\n  body[").concat(el, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(i, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(u, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(u, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(V, " {\n    right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(z, " {\n    margin-right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(V, " .").concat(V, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(z, " .").concat(z, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(el, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(u, "px;\n  }\n")
        },
        ed = function() {
            var e = parseInt(document.body.getAttribute(el) || "0", 10);
            return isFinite(e) ? e : 0
        },
        ef = function() {
            l.useEffect(function() {
                return document.body.setAttribute(el, (ed() + 1).toString()),
                    function() {
                        var e = ed() - 1;
                        e <= 0 ? document.body.removeAttribute(el) : document.body.setAttribute(el, e.toString())
                    }
            }, [])
        },
        ep = function(e) {
            var t = e.noRelative,
                n = e.noImportant,
                r = e.gapMode,
                o = void 0 === r ? "margin" : r;
            ef();
            var a = l.useMemo(function() {
                return eu(o)
            }, [o]);
            return l.createElement(es, {
                styles: ec(a, !t, o, n ? "" : "!important")
            })
        },
        em = !1;
    if ("u" > typeof window) try {
        var ev = Object.defineProperty({}, "passive", {
            get: function() {
                return em = !0, !0
            }
        });
        window.addEventListener("test", ev, ev), window.removeEventListener("test", ev, ev)
    } catch (e) {
        em = !1
    }
    var eh = !!em && {
            passive: !1
        },
        eg = function(e, t) {
            if (!(e instanceof Element)) return !1;
            var n = window.getComputedStyle(e);
            return "hidden" !== n[t] && (n.overflowY !== n.overflowX || "TEXTAREA" === e.tagName || "visible" !== n[t])
        },
        ey = function(e, t) {
            var n = t.ownerDocument,
                r = t;
            do {
                if ("u" > typeof ShadowRoot && r instanceof ShadowRoot && (r = r.host), eE(e, r)) {
                    var o = eb(e, r);
                    if (o[1] > o[2]) return !0
                }
                r = r.parentNode
            } while (r && r !== n.body) return !1
        },
        eE = function(e, t) {
            return "v" === e ? eg(t, "overflowY") : eg(t, "overflowX")
        },
        eb = function(e, t) {
            return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
        },
        ew = function(e, t, n, r, o) {
            var a, i = (a = window.getComputedStyle(t).direction, "h" === e && "rtl" === a ? -1 : 1),
                u = i * r,
                s = n.target,
                l = t.contains(s),
                c = !1,
                d = u > 0,
                f = 0,
                p = 0;
            do {
                if (!s) break;
                var m = eb(e, s),
                    v = m[0],
                    h = m[1] - m[2] - i * v;
                (v || h) && eE(e, s) && (f += h, p += v);
                var g = s.parentNode;
                s = g && g.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? g.host : g
            } while (!l && s !== document.body || l && (t.contains(s) || t === s)) return d && (o && 1 > Math.abs(f) || !o && u > f) ? c = !0 : !d && (o && 1 > Math.abs(p) || !o && -u > p) && (c = !0), c
        },
        eC = function(e) {
            return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
        },
        eR = function(e) {
            return [e.deltaX, e.deltaY]
        },
        eN = function(e) {
            return e && "current" in e ? e.current : e
        },
        ex = 0,
        eS = [];
    let eD = (u = function(e) {
        var t = l.useRef([]),
            n = l.useRef([0, 0]),
            r = l.useRef(),
            o = l.useState(ex++)[0],
            a = l.useState(er)[0],
            i = l.useRef(e);
        l.useEffect(function() {
            i.current = e
        }, [e]), l.useEffect(function() {
            if (e.inert) {
                document.body.classList.add("block-interactivity-".concat(o));
                var t = (0, $.__spreadArray)([e.lockRef.current], (e.shards || []).map(eN), !0).filter(Boolean);
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
        var u = l.useCallback(function(e, t) {
                if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !i.current.allowPinchZoom;
                var o, a = eC(e),
                    u = n.current,
                    s = "deltaX" in e ? e.deltaX : u[0] - a[0],
                    l = "deltaY" in e ? e.deltaY : u[1] - a[1],
                    c = e.target,
                    d = Math.abs(s) > Math.abs(l) ? "h" : "v";
                if ("touches" in e && "h" === d && "range" === c.type) return !1;
                var f = ey(d, c);
                if (!f) return !0;
                if (f ? o = d : (o = "v" === d ? "h" : "v", f = ey(d, c)), !f) return !1;
                if (!r.current && "changedTouches" in e && (s || l) && (r.current = o), !o) return !0;
                var p = r.current || o;
                return ew(p, t, e, "h" === p ? s : l, !0)
            }, []),
            s = l.useCallback(function(e) {
                if (eS.length && eS[eS.length - 1] === a) {
                    var n = "deltaY" in e ? eR(e) : eC(e),
                        r = t.current.filter(function(t) {
                            var r;
                            return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (r = t.delta, r[0] === n[0] && r[1] === n[1])
                        })[0];
                    if (r && r.should) {
                        e.cancelable && e.preventDefault();
                        return
                    }
                    if (!r) {
                        var o = (i.current.shards || []).map(eN).filter(Boolean).filter(function(t) {
                            return t.contains(e.target)
                        });
                        (o.length > 0 ? u(e, o[0]) : !i.current.noIsolation) && e.cancelable && e.preventDefault()
                    }
                }
            }, []),
            c = l.useCallback(function(e, n, r, o) {
                var a = {
                    name: e,
                    delta: n,
                    target: r,
                    should: o,
                    shadowParent: function(e) {
                        for (var t = null; null !== e;) e instanceof ShadowRoot && (t = e.host, e = e.host), e = e.parentNode;
                        return t
                    }(r)
                };
                t.current.push(a), setTimeout(function() {
                    t.current = t.current.filter(function(e) {
                        return e !== a
                    })
                }, 1)
            }, []),
            d = l.useCallback(function(e) {
                n.current = eC(e), r.current = void 0
            }, []),
            f = l.useCallback(function(t) {
                c(t.type, eR(t), t.target, u(t, e.lockRef.current))
            }, []),
            p = l.useCallback(function(t) {
                c(t.type, eC(t), t.target, u(t, e.lockRef.current))
            }, []);
        l.useEffect(function() {
            return eS.push(a), e.setCallbacks({
                    onScrollCapture: f,
                    onWheelCapture: f,
                    onTouchMoveCapture: p
                }), document.addEventListener("wheel", s, eh), document.addEventListener("touchmove", s, eh), document.addEventListener("touchstart", d, eh),
                function() {
                    eS = eS.filter(function(e) {
                        return e !== a
                    }), document.removeEventListener("wheel", s, eh), document.removeEventListener("touchmove", s, eh), document.removeEventListener("touchstart", d, eh)
                }
        }, []);
        var m = e.removeScrollBar,
            v = e.inert;
        return l.createElement(l.Fragment, null, v ? l.createElement(a, {
            styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
        }) : null, m ? l.createElement(ep, {
            noRelative: e.noRelative,
            gapMode: e.gapMode
        }) : null)
    }, q.useMedium(u), Q);
    var eT = l.forwardRef(function(e, t) {
        return l.createElement(J, (0, $.__assign)({}, e, {
            ref: t,
            sideCar: eD
        }))
    });
    eT.classNames = J.classNames, e.s(["RemoveScroll", 0, eT], 641501);
    var eO = e.i(73772),
        eP = "Dialog",
        [eL, eI] = (0, f.createContextScope)(eP),
        [e_, eM] = eL(eP),
        ek = e => {
            let {
                __scopeDialog: t,
                children: n,
                open: r,
                defaultOpen: o,
                onOpenChange: a,
                modal: i = !0
            } = e, u = l.useRef(null), s = l.useRef(null), [c = !1, d] = v({
                prop: r,
                defaultProp: o,
                onChange: a
            });
            return (0, g.jsx)(e_, {
                scope: t,
                triggerRef: u,
                contentRef: s,
                contentId: (0, p.useId)(),
                titleId: (0, p.useId)(),
                descriptionId: (0, p.useId)(),
                open: c,
                onOpenChange: d,
                onOpenToggle: l.useCallback(() => d(e => !e), [d]),
                modal: i,
                children: n
            })
        };
    ek.displayName = eP;
    var ej = "DialogTrigger",
        eA = l.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                ...r
            } = e, o = eM(ej, n), a = (0, d.useComposedRefs)(t, o.triggerRef);
            return (0, g.jsx)(w.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": o.open,
                "aria-controls": o.contentId,
                "data-state": e4(o.open),
                ...r,
                ref: a,
                onClick: (0, c.composeEventHandlers)(e.onClick, o.onOpenToggle)
            })
        });
    eA.displayName = ej;
    var eF = "DialogPortal",
        [eW, eB] = eL(eF, {
            forceMount: void 0
        }),
        eU = e => {
            let {
                __scopeDialog: t,
                forceMount: n,
                children: r,
                container: o
            } = e, a = eM(eF, t);
            return (0, g.jsx)(eW, {
                scope: t,
                forceMount: n,
                children: l.Children.map(r, e => (0, g.jsx)(W, {
                    present: n || a.open,
                    children: (0, g.jsx)(F, {
                        asChild: !0,
                        container: o,
                        children: e
                    })
                }))
            })
        };
    eU.displayName = eF;
    var eH = "DialogOverlay",
        eK = l.forwardRef((e, t) => {
            let n = eB(eH, e.__scopeDialog),
                {
                    forceMount: r = n.forceMount,
                    ...o
                } = e,
                a = eM(eH, e.__scopeDialog);
            return a.modal ? (0, g.jsx)(W, {
                present: r || a.open,
                children: (0, g.jsx)(eV, {
                    ...o,
                    ref: t
                })
            }) : null
        });
    eK.displayName = eH;
    var e$ = y("DialogOverlay.RemoveScroll"),
        eV = l.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                ...r
            } = e, o = eM(eH, n);
            return (0, g.jsx)(eT, {
                as: e$,
                allowPinchZoom: !0,
                shards: [o.contentRef],
                children: (0, g.jsx)(w.div, {
                    "data-state": e4(o.open),
                    ...r,
                    ref: t,
                    style: {
                        pointerEvents: "auto",
                        ...r.style
                    }
                })
            })
        }),
        ez = "DialogContent",
        eX = l.forwardRef((e, t) => {
            let n = eB(ez, e.__scopeDialog),
                {
                    forceMount: r = n.forceMount,
                    ...o
                } = e,
                a = eM(ez, e.__scopeDialog);
            return (0, g.jsx)(W, {
                present: r || a.open,
                children: a.modal ? (0, g.jsx)(eY, {
                    ...o,
                    ref: t
                }) : (0, g.jsx)(eZ, {
                    ...o,
                    ref: t
                })
            })
        });
    eX.displayName = ez;
    var eY = l.forwardRef((e, t) => {
            let n = eM(ez, e.__scopeDialog),
                r = l.useRef(null),
                o = (0, d.useComposedRefs)(t, n.contentRef, r);
            return l.useEffect(() => {
                let e = r.current;
                if (e) return (0, eO.hideOthers)(e)
            }, []), (0, g.jsx)(eq, {
                ...e,
                ref: o,
                trapFocus: n.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: (0, c.composeEventHandlers)(e.onCloseAutoFocus, e => {
                    e.preventDefault(), n.triggerRef.current?.focus()
                }),
                onPointerDownOutside: (0, c.composeEventHandlers)(e.onPointerDownOutside, e => {
                    let t = e.detail.originalEvent,
                        n = 0 === t.button && !0 === t.ctrlKey;
                    (2 === t.button || n) && e.preventDefault()
                }),
                onFocusOutside: (0, c.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault())
            })
        }),
        eZ = l.forwardRef((e, t) => {
            let n = eM(ez, e.__scopeDialog),
                r = l.useRef(!1),
                o = l.useRef(!1);
            return (0, g.jsx)(eq, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    e.onCloseAutoFocus?.(t), t.defaultPrevented || (r.current || n.triggerRef.current?.focus(), t.preventDefault()), r.current = !1, o.current = !1
                },
                onInteractOutside: t => {
                    e.onInteractOutside?.(t), t.defaultPrevented || (r.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                    let a = t.target;
                    n.triggerRef.current?.contains(a) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                }
            })
        }),
        eq = l.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                trapFocus: r,
                onOpenAutoFocus: o,
                onCloseAutoFocus: a,
                ...i
            } = e, u = eM(ez, n), s = l.useRef(null), c = (0, d.useComposedRefs)(t, s);
            return H(), (0, g.jsxs)(g.Fragment, {
                children: [(0, g.jsx)(L, {
                    asChild: !0,
                    loop: !0,
                    trapped: r,
                    onMountAutoFocus: o,
                    onUnmountAutoFocus: a,
                    children: (0, g.jsx)(x, {
                        role: "dialog",
                        id: u.contentId,
                        "aria-describedby": u.descriptionId,
                        "aria-labelledby": u.titleId,
                        "data-state": e4(u.open),
                        ...i,
                        ref: c,
                        onDismiss: () => u.onOpenChange(!1)
                    })
                }), (0, g.jsxs)(g.Fragment, {
                    children: [(0, g.jsx)(e5, {
                        titleId: u.titleId
                    }), (0, g.jsx)(e9, {
                        contentRef: s,
                        descriptionId: u.descriptionId
                    })]
                })]
            })
        }),
        eG = "DialogTitle",
        eJ = l.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                ...r
            } = e, o = eM(eG, n);
            return (0, g.jsx)(w.h2, {
                id: o.titleId,
                ...r,
                ref: t
            })
        });
    eJ.displayName = eG;
    var eQ = "DialogDescription",
        e0 = l.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                ...r
            } = e, o = eM(eQ, n);
            return (0, g.jsx)(w.p, {
                id: o.descriptionId,
                ...r,
                ref: t
            })
        });
    e0.displayName = eQ;
    var e1 = "DialogClose",
        e3 = l.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                ...r
            } = e, o = eM(e1, n);
            return (0, g.jsx)(w.button, {
                type: "button",
                ...r,
                ref: t,
                onClick: (0, c.composeEventHandlers)(e.onClick, () => o.onOpenChange(!1))
            })
        });

    function e4(e) {
        return e ? "open" : "closed"
    }
    e3.displayName = e1;
    var e2 = "DialogTitleWarning",
        [e7, e8] = (0, f.createContext)(e2, {
            contentName: ez,
            titleName: eG,
            docsSlug: "dialog"
        }),
        e5 = e => {
            let {
                titleId: t
            } = e, n = e8(e2), r = `\`${n.contentName}\` requires a \`${n.titleName}\` for the component to be accessible for screen reader users.

If you want to hide the \`${n.titleName}\`, you can wrap it with our VisuallyHidden component.

For more information, see https://radix-ui.com/primitives/docs/components/${n.docsSlug}`;
            return l.useEffect(() => {
                t && (document.getElementById(t) || console.error(r))
            }, [r, t]), null
        },
        e9 = e => {
            let {
                contentRef: t,
                descriptionId: n
            } = e, r = e8("DialogDescriptionWarning"), o = `Warning: Missing \`Description\` or \`aria-describedby={undefined}\` for {${r.contentName}}.`;
            return l.useEffect(() => {
                let e = t.current?.getAttribute("aria-describedby");
                n && e && (document.getElementById(n) || console.warn(o))
            }, [o, t, n]), null
        };
    e.s(["Close", 0, e3, "Content", 0, eX, "Description", 0, e0, "Overlay", 0, eK, "Portal", 0, eU, "Root", 0, ek, "Title", 0, eJ, "Trigger", 0, eA], 513443);
    var e6 = e.i(743682),
        te = Object.freeze({
            position: "absolute",
            border: 0,
            width: 1,
            height: 1,
            padding: 0,
            margin: -1,
            overflow: "hidden",
            clip: "rect(0, 0, 0, 0)",
            whiteSpace: "nowrap",
            wordWrap: "normal"
        }),
        tt = l.forwardRef((e, t) => (0, g.jsx)(e6.Primitive.span, {
            ...e,
            ref: t,
            style: {
                ...te,
                ...e.style
            }
        }));
    tt.displayName = "VisuallyHidden", e.s(["VisuallyHidden", 0, tt], 806887)
}]);

//# debugId=bfd95d99-bbe1-a04b-3bd0-71093d1fc3be
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0z8dbp1a66_s~.js.map
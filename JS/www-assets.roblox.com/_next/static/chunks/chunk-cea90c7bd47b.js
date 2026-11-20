;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "eaadd273-c5ad-8152-876f-130271069891")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 494334, e => {
    "use strict";
    var t = e.i(371847),
        n = e.i(823499);
    e.s(["useControllableState", 0, function(e) {
        let {
            prop: r,
            defaultProp: o,
            onChange: i = () => {}
        } = e, [a, u] = function(e) {
            let {
                defaultProp: r,
                onChange: o
            } = e, i = t.useState(r), [a] = i, u = t.useRef(a), s = (0, n.useCallbackRef)(o);
            return t.useEffect(() => {
                u.current !== a && (s(a), u.current = a)
            }, [a, u, s]), i
        }({
            defaultProp: o,
            onChange: i
        }), s = void 0 !== r, l = s ? r : a, c = (0, n.useCallbackRef)(i);
        return [l, t.useCallback(e => {
            if (s) {
                let t = "function" == typeof e ? e(r) : e;
                t !== r && c(t)
            } else u(e)
        }, [s, r, u, c])]
    }])
}, 430781, 354981, 434205, e => {
    "use strict";
    var t, n = e.i(371847),
        r = e.i(775453),
        o = e.i(652447),
        i = e.i(539181),
        a = e.i(809804);

    function u(e) {
        var t;
        let r, o = (t = e, (r = n.forwardRef((e, t) => {
                let {
                    children: r,
                    ...o
                } = e;
                if (n.isValidElement(r)) {
                    var a;
                    let e, u, s = (a = r, (u = (e = Object.getOwnPropertyDescriptor(a.props, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? a.ref : (u = (e = Object.getOwnPropertyDescriptor(a, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? a.props.ref : a.props.ref || a.ref),
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
                        }(o, r.props);
                    return r.type !== n.Fragment && (l.ref = t ? (0, i.composeRefs)(t, s) : s), n.cloneElement(r, l)
                }
                return n.Children.count(r) > 1 ? n.Children.only(null) : null
            })).displayName = `${t}.SlotClone`, r),
            u = n.forwardRef((e, t) => {
                let {
                    children: r,
                    ...i
                } = e, u = n.Children.toArray(r), s = u.find(l);
                if (s) {
                    let e = s.props.children,
                        r = u.map(t => t !== s ? t : n.Children.count(e) > 1 ? n.Children.only(null) : n.isValidElement(e) ? e.props.children : null);
                    return (0, a.jsx)(o, {
                        ...i,
                        ref: t,
                        children: n.isValidElement(e) ? n.cloneElement(e, void 0, r) : null
                    })
                }
                return (0, a.jsx)(o, {
                    ...i,
                    ref: t,
                    children: r
                })
            });
        return u.displayName = `${e}.Slot`, u
    }
    var s = Symbol("radix.slottable");

    function l(e) {
        return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === s
    }
    e.s(["createSlot", 0, u], 354981);
    var c = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
        let r = u(`Primitive.${t}`),
            o = n.forwardRef((e, n) => {
                let {
                    asChild: o,
                    ...i
                } = e;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, a.jsx)(o ? r : t, {
                    ...i,
                    ref: n
                })
            });
        return o.displayName = `Primitive.${t}`, {
            ...e,
            [t]: o
        }
    }, {});

    function d(e, t) {
        e && o.flushSync(() => e.dispatchEvent(t))
    }
    e.s(["Primitive", 0, c, "dispatchDiscreteCustomEvent", 0, d], 434205);
    var f = e.i(823499),
        p = "dismissableLayer.update",
        m = n.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        v = n.forwardRef((e, o) => {
            let {
                disableOutsidePointerEvents: u = !1,
                onEscapeKeyDown: s,
                onPointerDownOutside: l,
                onFocusOutside: d,
                onInteractOutside: v,
                onDismiss: y,
                ...E
            } = e, b = n.useContext(m), [w, C] = n.useState(null), R = w?.ownerDocument ?? globalThis?.document, [, N] = n.useState({}), S = (0, i.useComposedRefs)(o, e => C(e)), x = Array.from(b.layers), [D] = [...b.layersWithOutsidePointerEventsDisabled].slice(-1), P = x.indexOf(D), T = w ? x.indexOf(w) : -1, L = b.layersWithOutsidePointerEventsDisabled.size > 0, O = T >= P, I = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : globalThis?.document,
                    r = (0, f.useCallbackRef)(e),
                    o = n.useRef(!1),
                    i = n.useRef(() => {});
                return n.useEffect(() => {
                    let e = e => {
                            if (e.target && !o.current) {
                                let n = function() {
                                        g("dismissableLayer.pointerDownOutside", r, o, {
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
                O && !n && (l?.(e), v?.(e), e.defaultPrevented || y?.())
            }, R), _ = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : globalThis?.document,
                    r = (0, f.useCallbackRef)(e),
                    o = n.useRef(!1);
                return n.useEffect(() => {
                    let e = e => {
                        e.target && !o.current && g("dismissableLayer.focusOutside", r, {
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
                ![...b.branches].some(e => e.contains(t)) && (d?.(e), v?.(e), e.defaultPrevented || y?.())
            }, R);
            return ! function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : globalThis?.document,
                    r = (0, f.useCallbackRef)(e);
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
                T === b.layers.size - 1 && (s?.(e), !e.defaultPrevented && y && (e.preventDefault(), y()))
            }, R), n.useEffect(() => {
                if (w) return u && (0 === b.layersWithOutsidePointerEventsDisabled.size && (t = R.body.style.pointerEvents, R.body.style.pointerEvents = "none"), b.layersWithOutsidePointerEventsDisabled.add(w)), b.layers.add(w), h(), () => {
                    u && 1 === b.layersWithOutsidePointerEventsDisabled.size && (R.body.style.pointerEvents = t)
                }
            }, [w, R, u, b]), n.useEffect(() => () => {
                w && (b.layers.delete(w), b.layersWithOutsidePointerEventsDisabled.delete(w), h())
            }, [w, b]), n.useEffect(() => {
                let e = () => N({});
                return document.addEventListener(p, e), () => document.removeEventListener(p, e)
            }, []), (0, a.jsx)(c.div, {
                ...E,
                ref: S,
                style: {
                    pointerEvents: L ? O ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: (0, r.composeEventHandlers)(e.onFocusCapture, _.onFocusCapture),
                onBlurCapture: (0, r.composeEventHandlers)(e.onBlurCapture, _.onBlurCapture),
                onPointerDownCapture: (0, r.composeEventHandlers)(e.onPointerDownCapture, I.onPointerDownCapture)
            })
        });

    function h() {
        let e = new CustomEvent(p);
        document.dispatchEvent(e)
    }

    function g(e, t, n, r) {
        let {
            discrete: o
        } = r, i = n.originalEvent.target, a = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: n
        });
        t && i.addEventListener(e, t, {
            once: !0
        }), o ? d(i, a) : i.dispatchEvent(a)
    }
    v.displayName = "DismissableLayer", n.forwardRef((e, t) => {
        let r = n.useContext(m),
            o = n.useRef(null),
            u = (0, i.useComposedRefs)(t, o);
        return n.useEffect(() => {
            let e = o.current;
            if (e) return r.branches.add(e), () => {
                r.branches.delete(e)
            }
        }, [r.branches]), (0, a.jsx)(c.div, {
            ...e,
            ref: u
        })
    }).displayName = "DismissableLayerBranch", e.s(["DismissableLayer", 0, v], 430781)
}, 513443, 5872, 337537, 396012, 653279, 641501, e => {
    "use strict";
    let t;
    var n, r, o, i, a, u, s = e.i(371847),
        l = e.i(775453),
        c = e.i(539181),
        d = e.i(734988),
        f = e.i(481010),
        p = e.i(494334),
        m = e.i(430781),
        v = e.i(434205),
        h = e.i(823499),
        g = e.i(809804),
        y = "focusScope.autoFocusOnMount",
        E = "focusScope.autoFocusOnUnmount",
        b = {
            bubbles: !1,
            cancelable: !0
        },
        w = s.forwardRef((e, t) => {
            let {
                loop: n = !1,
                trapped: r = !1,
                onMountAutoFocus: o,
                onUnmountAutoFocus: i,
                ...a
            } = e, [u, l] = s.useState(null), d = (0, h.useCallbackRef)(o), f = (0, h.useCallbackRef)(i), p = s.useRef(null), m = (0, c.useComposedRefs)(t, e => l(e)), w = s.useRef({
                paused: !1,
                pause() {
                    this.paused = !0
                },
                resume() {
                    this.paused = !1
                }
            }).current;
            s.useEffect(() => {
                if (r) {
                    let e = function(e) {
                            if (w.paused || !u) return;
                            let t = e.target;
                            u.contains(t) ? p.current = t : N(p.current, {
                                select: !0
                            })
                        },
                        t = function(e) {
                            if (w.paused || !u) return;
                            let t = e.relatedTarget;
                            null !== t && (u.contains(t) || N(p.current, {
                                select: !0
                            }))
                        };
                    document.addEventListener("focusin", e), document.addEventListener("focusout", t);
                    let n = new MutationObserver(function(e) {
                        if (document.activeElement === document.body)
                            for (let t of e) t.removedNodes.length > 0 && N(u)
                    });
                    return u && n.observe(u, {
                        childList: !0,
                        subtree: !0
                    }), () => {
                        document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), n.disconnect()
                    }
                }
            }, [r, u, w.paused]), s.useEffect(() => {
                if (u) {
                    S.add(w);
                    let e = document.activeElement;
                    if (!u.contains(e)) {
                        let t = new CustomEvent(y, b);
                        u.addEventListener(y, d), u.dispatchEvent(t), t.defaultPrevented || (function(e) {
                            let {
                                select: t = !1
                            } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, n = document.activeElement;
                            for (let r of e)
                                if (N(r, {
                                        select: t
                                    }), document.activeElement !== n) return
                        }(C(u).filter(e => "A" !== e.tagName), {
                            select: !0
                        }), document.activeElement === e && N(u))
                    }
                    return () => {
                        u.removeEventListener(y, d), setTimeout(() => {
                            let t = new CustomEvent(E, b);
                            u.addEventListener(E, f), u.dispatchEvent(t), t.defaultPrevented || N(e ?? document.body, {
                                select: !0
                            }), u.removeEventListener(E, f), S.remove(w)
                        }, 0)
                    }
                }
            }, [u, d, f, w]);
            let x = s.useCallback(e => {
                if (!n && !r || w.paused) return;
                let t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                    o = document.activeElement;
                if (t && o) {
                    var i;
                    let t, r = e.currentTarget,
                        [a, u] = [R(t = C(i = r), i), R(t.reverse(), i)];
                    a && u ? e.shiftKey || o !== u ? e.shiftKey && o === a && (e.preventDefault(), n && N(u, {
                        select: !0
                    })) : (e.preventDefault(), n && N(a, {
                        select: !0
                    })) : o === r && e.preventDefault()
                }
            }, [n, r, w.paused]);
            return (0, g.jsx)(v.Primitive.div, {
                tabIndex: -1,
                ...a,
                ref: m,
                onKeyDown: x
            })
        });

    function C(e) {
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

    function R(e, t) {
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

    function N(e) {
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
    w.displayName = "FocusScope";
    var S = (t = [], {
        add(e) {
            let n = t[0];
            e !== n && n?.pause(), (t = x(t, e)).unshift(e)
        },
        remove(e) {
            t = x(t, e), t[0]?.resume()
        }
    });

    function x(e, t) {
        let n = [...e],
            r = n.indexOf(t);
        return -1 !== r && n.splice(r, 1), n
    }
    e.s(["FocusScope", 0, w], 5872);
    var D = e.i(652447),
        P = e.i(13522),
        T = s.forwardRef((e, t) => {
            let {
                container: n,
                ...r
            } = e, [o, i] = s.useState(!1);
            (0, P.useLayoutEffect)(() => i(!0), []);
            let a = n || o && globalThis?.document?.body;
            return a ? D.default.createPortal((0, g.jsx)(v.Primitive.div, {
                ...r,
                ref: t
            }), a) : null
        });
    T.displayName = "Portal", e.s(["Portal", 0, T], 337537);
    var L = e => {
        var t;
        let n, r, {
                present: o,
                children: i
            } = e,
            a = function(e) {
                var t, n;
                let [r, o] = s.useState(), i = s.useRef({}), a = s.useRef(e), u = s.useRef("none"), [l, c] = (t = e ? "mounted" : "unmounted", n = {
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
                }, s.useReducer((e, t) => n[e][t] ?? e, t));
                return s.useEffect(() => {
                    let e = O(i.current);
                    u.current = "mounted" === l ? e : "none"
                }, [l]), (0, P.useLayoutEffect)(() => {
                    let t = i.current,
                        n = a.current;
                    if (n !== e) {
                        let r = u.current,
                            o = O(t);
                        e ? c("MOUNT") : "none" === o || t?.display === "none" ? c("UNMOUNT") : n && r !== o ? c("ANIMATION_OUT") : c("UNMOUNT"), a.current = e
                    }
                }, [e, c]), (0, P.useLayoutEffect)(() => {
                    if (r) {
                        let e, t = r.ownerDocument.defaultView ?? window,
                            n = n => {
                                let o = O(i.current).includes(n.animationName);
                                if (n.target === r && o && (c("ANIMATION_END"), !a.current)) {
                                    let n = r.style.animationFillMode;
                                    r.style.animationFillMode = "forwards", e = t.setTimeout(() => {
                                        "forwards" === r.style.animationFillMode && (r.style.animationFillMode = n)
                                    })
                                }
                            },
                            o = e => {
                                e.target === r && (u.current = O(i.current))
                            };
                        return r.addEventListener("animationstart", o), r.addEventListener("animationcancel", n), r.addEventListener("animationend", n), () => {
                            t.clearTimeout(e), r.removeEventListener("animationstart", o), r.removeEventListener("animationcancel", n), r.removeEventListener("animationend", n)
                        }
                    }
                    c("ANIMATION_END")
                }, [r, c]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(l),
                    ref: s.useCallback(e => {
                        e && (i.current = getComputedStyle(e)), o(e)
                    }, [])
                }
            }(o),
            u = "function" == typeof i ? i({
                present: a.isPresent
            }) : s.Children.only(i),
            l = (0, c.useComposedRefs)(a.ref, (t = u, (r = (n = Object.getOwnPropertyDescriptor(t.props, "ref")?.get) && "isReactWarning" in n && n.isReactWarning) ? t.ref : (r = (n = Object.getOwnPropertyDescriptor(t, "ref")?.get) && "isReactWarning" in n && n.isReactWarning) ? t.props.ref : t.props.ref || t.ref));
        return "function" == typeof i || a.isPresent ? s.cloneElement(u, {
            ref: l
        }) : null
    };

    function O(e) {
        return e?.animationName || "none"
    }
    L.displayName = "Presence", e.s(["Presence", 0, L], 396012);
    var I = 0;

    function _() {
        s.useEffect(() => {
            let e = document.querySelectorAll("[data-radix-focus-guard]");
            return document.body.insertAdjacentElement("afterbegin", e[0] ?? M()), document.body.insertAdjacentElement("beforeend", e[1] ?? M()), I++, () => {
                1 === I && document.querySelectorAll("[data-radix-focus-guard]").forEach(e => e.remove()), I--
            }
        }, [])
    }

    function M() {
        let e = document.createElement("span");
        return e.setAttribute("data-radix-focus-guard", ""), e.tabIndex = 0, e.style.outline = "none", e.style.opacity = "0", e.style.position = "fixed", e.style.pointerEvents = "none", e
    }
    e.s(["useFocusGuards", 0, _], 653279);
    var k = e.i(824627),
        A = "right-scroll-bar-position",
        j = "width-before-scroll-bar";

    function F(e, t) {
        return "function" == typeof e ? e(t) : e && (e.current = t), e
    }
    var W = "u" > typeof window ? s.useLayoutEffect : s.useEffect,
        B = new WeakMap,
        U = (void 0 === n && (n = {}), (void 0 === r && (r = function(e) {
            return e
        }), o = [], i = !1, a = {
            read: function() {
                if (i) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                return o.length ? o[o.length - 1] : null
            },
            useMedium: function(e) {
                var t = r(e, i);
                return o.push(t),
                    function() {
                        o = o.filter(function(e) {
                            return e !== t
                        })
                    }
            },
            assignSyncMedium: function(e) {
                for (i = !0; o.length;) {
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
                i = !0;
                var t = [];
                if (o.length) {
                    var n = o;
                    o = [], n.forEach(e), t = o
                }
                var r = function() {
                        var n = t;
                        t = [], n.forEach(e)
                    },
                    a = function() {
                        return Promise.resolve().then(r)
                    };
                a(), o = {
                    push: function(e) {
                        t.push(e), a()
                    },
                    filter: function(e) {
                        return t = t.filter(e), o
                    }
                }
            }
        }).options = (0, k.__assign)({
            async: !0,
            ssr: !1
        }, n), a),
        H = function() {},
        K = s.forwardRef(function(e, t) {
            var n, r, o, i, a = s.useRef(null),
                u = s.useState({
                    onScrollCapture: H,
                    onWheelCapture: H,
                    onTouchMoveCapture: H
                }),
                l = u[0],
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
                N = (0, k.__rest)(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                S = (n = [a, t], r = function(e) {
                    return n.forEach(function(t) {
                        return F(t, e)
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
                })[0]).callback = r, i = o.facade, W(function() {
                    var e = B.get(i);
                    if (e) {
                        var t = new Set(e),
                            r = new Set(n),
                            o = i.current;
                        t.forEach(function(e) {
                            r.has(e) || F(e, null)
                        }), r.forEach(function(e) {
                            t.has(e) || F(e, o)
                        })
                    }
                    B.set(i, n)
                }, [n]), i),
                x = (0, k.__assign)((0, k.__assign)({}, N), l);
            return s.createElement(s.Fragment, null, v && s.createElement(g, {
                sideCar: U,
                removeScrollBar: m,
                shards: h,
                noRelative: y,
                noIsolation: E,
                inert: b,
                setCallbacks: c,
                allowPinchZoom: !!w,
                lockRef: a,
                gapMode: R
            }), d ? s.cloneElement(s.Children.only(f), (0, k.__assign)((0, k.__assign)({}, x), {
                ref: S
            })) : s.createElement(void 0 === C ? "div" : C, (0, k.__assign)({}, x, {
                className: p,
                ref: S
            }), f))
        });
    K.defaultProps = {
        enabled: !0,
        removeScrollBar: !0,
        inert: !1
    }, K.classNames = {
        fullWidth: j,
        zeroRight: A
    };
    var $ = function(e) {
        var t = e.sideCar,
            n = (0, k.__rest)(e, ["sideCar"]);
        if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
        var r = t.read();
        if (!r) throw Error("Sidecar medium not found");
        return s.createElement(r, (0, k.__assign)({}, n))
    };
    $.isSideCarExport = !0;
    var X = e.i(422197),
        Y = function() {
            var e = 0,
                t = null;
            return {
                add: function(n) {
                    if (0 == e && (t = function() {
                            if (!document) return null;
                            var e = document.createElement("style");
                            e.type = "text/css";
                            var t = (0, X.getNonce)();
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
        z = function() {
            var e = Y();
            return function(t, n) {
                s.useEffect(function() {
                    return e.add(t),
                        function() {
                            e.remove()
                        }
                }, [t && n])
            }
        },
        V = function() {
            var e = z();
            return function(t) {
                return e(t.styles, t.dynamic), null
            }
        },
        Z = {
            left: 0,
            top: 0,
            right: 0,
            gap: 0
        },
        q = function(e) {
            return parseInt(e || "", 10) || 0
        },
        G = function(e) {
            var t = window.getComputedStyle(document.body),
                n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                r = t["padding" === e ? "paddingTop" : "marginTop"],
                o = t["padding" === e ? "paddingRight" : "marginRight"];
            return [q(n), q(r), q(o)]
        },
        J = function(e) {
            if (void 0 === e && (e = "margin"), "u" < typeof window) return Z;
            var t = G(e),
                n = document.documentElement.clientWidth,
                r = window.innerWidth;
            return {
                left: t[0],
                top: t[1],
                right: t[2],
                gap: Math.max(0, r - n + t[2] - t[0])
            }
        },
        Q = V(),
        ee = "data-scroll-locked",
        et = function(e, t, n, r) {
            var o = e.left,
                i = e.top,
                a = e.right,
                u = e.gap;
            return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(u, "px ").concat(r, ";\n  }\n  body[").concat(ee, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(u, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(u, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(A, " {\n    right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(j, " {\n    margin-right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(A, " .").concat(A, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(j, " .").concat(j, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(ee, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(u, "px;\n  }\n")
        },
        en = function() {
            var e = parseInt(document.body.getAttribute(ee) || "0", 10);
            return isFinite(e) ? e : 0
        },
        er = function() {
            s.useEffect(function() {
                return document.body.setAttribute(ee, (en() + 1).toString()),
                    function() {
                        var e = en() - 1;
                        e <= 0 ? document.body.removeAttribute(ee) : document.body.setAttribute(ee, e.toString())
                    }
            }, [])
        },
        eo = function(e) {
            var t = e.noRelative,
                n = e.noImportant,
                r = e.gapMode,
                o = void 0 === r ? "margin" : r;
            er();
            var i = s.useMemo(function() {
                return J(o)
            }, [o]);
            return s.createElement(Q, {
                styles: et(i, !t, o, n ? "" : "!important")
            })
        },
        ei = !1;
    if ("u" > typeof window) try {
        var ea = Object.defineProperty({}, "passive", {
            get: function() {
                return ei = !0, !0
            }
        });
        window.addEventListener("test", ea, ea), window.removeEventListener("test", ea, ea)
    } catch (e) {
        ei = !1
    }
    var eu = !!ei && {
            passive: !1
        },
        es = function(e, t) {
            if (!(e instanceof Element)) return !1;
            var n = window.getComputedStyle(e);
            return "hidden" !== n[t] && (n.overflowY !== n.overflowX || "TEXTAREA" === e.tagName || "visible" !== n[t])
        },
        el = function(e, t) {
            var n = t.ownerDocument,
                r = t;
            do {
                if ("u" > typeof ShadowRoot && r instanceof ShadowRoot && (r = r.host), ec(e, r)) {
                    var o = ed(e, r);
                    if (o[1] > o[2]) return !0
                }
                r = r.parentNode
            } while (r && r !== n.body) return !1
        },
        ec = function(e, t) {
            return "v" === e ? es(t, "overflowY") : es(t, "overflowX")
        },
        ed = function(e, t) {
            return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
        },
        ef = function(e, t, n, r, o) {
            var i, a = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                u = a * r,
                s = n.target,
                l = t.contains(s),
                c = !1,
                d = u > 0,
                f = 0,
                p = 0;
            do {
                if (!s) break;
                var m = ed(e, s),
                    v = m[0],
                    h = m[1] - m[2] - a * v;
                (v || h) && ec(e, s) && (f += h, p += v);
                var g = s.parentNode;
                s = g && g.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? g.host : g
            } while (!l && s !== document.body || l && (t.contains(s) || t === s)) return d && (o && 1 > Math.abs(f) || !o && u > f) ? c = !0 : !d && (o && 1 > Math.abs(p) || !o && -u > p) && (c = !0), c
        },
        ep = function(e) {
            return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
        },
        em = function(e) {
            return [e.deltaX, e.deltaY]
        },
        ev = function(e) {
            return e && "current" in e ? e.current : e
        },
        eh = 0,
        eg = [];
    let ey = (u = function(e) {
        var t = s.useRef([]),
            n = s.useRef([0, 0]),
            r = s.useRef(),
            o = s.useState(eh++)[0],
            i = s.useState(V)[0],
            a = s.useRef(e);
        s.useEffect(function() {
            a.current = e
        }, [e]), s.useEffect(function() {
            if (e.inert) {
                document.body.classList.add("block-interactivity-".concat(o));
                var t = (0, k.__spreadArray)([e.lockRef.current], (e.shards || []).map(ev), !0).filter(Boolean);
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
                var o, i = ep(e),
                    u = n.current,
                    s = "deltaX" in e ? e.deltaX : u[0] - i[0],
                    l = "deltaY" in e ? e.deltaY : u[1] - i[1],
                    c = e.target,
                    d = Math.abs(s) > Math.abs(l) ? "h" : "v";
                if ("touches" in e && "h" === d && "range" === c.type) return !1;
                var f = el(d, c);
                if (!f) return !0;
                if (f ? o = d : (o = "v" === d ? "h" : "v", f = el(d, c)), !f) return !1;
                if (!r.current && "changedTouches" in e && (s || l) && (r.current = o), !o) return !0;
                var p = r.current || o;
                return ef(p, t, e, "h" === p ? s : l, !0)
            }, []),
            l = s.useCallback(function(e) {
                if (eg.length && eg[eg.length - 1] === i) {
                    var n = "deltaY" in e ? em(e) : ep(e),
                        r = t.current.filter(function(t) {
                            var r;
                            return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (r = t.delta, r[0] === n[0] && r[1] === n[1])
                        })[0];
                    if (r && r.should) {
                        e.cancelable && e.preventDefault();
                        return
                    }
                    if (!r) {
                        var o = (a.current.shards || []).map(ev).filter(Boolean).filter(function(t) {
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
                n.current = ep(e), r.current = void 0
            }, []),
            f = s.useCallback(function(t) {
                c(t.type, em(t), t.target, u(t, e.lockRef.current))
            }, []),
            p = s.useCallback(function(t) {
                c(t.type, ep(t), t.target, u(t, e.lockRef.current))
            }, []);
        s.useEffect(function() {
            return eg.push(i), e.setCallbacks({
                    onScrollCapture: f,
                    onWheelCapture: f,
                    onTouchMoveCapture: p
                }), document.addEventListener("wheel", l, eu), document.addEventListener("touchmove", l, eu), document.addEventListener("touchstart", d, eu),
                function() {
                    eg = eg.filter(function(e) {
                        return e !== i
                    }), document.removeEventListener("wheel", l, eu), document.removeEventListener("touchmove", l, eu), document.removeEventListener("touchstart", d, eu)
                }
        }, []);
        var m = e.removeScrollBar,
            v = e.inert;
        return s.createElement(s.Fragment, null, v ? s.createElement(i, {
            styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
        }) : null, m ? s.createElement(eo, {
            noRelative: e.noRelative,
            gapMode: e.gapMode
        }) : null)
    }, U.useMedium(u), $);
    var eE = s.forwardRef(function(e, t) {
        return s.createElement(K, (0, k.__assign)({}, e, {
            ref: t,
            sideCar: ey
        }))
    });
    eE.classNames = K.classNames, e.s(["RemoveScroll", 0, eE], 641501);
    var eb = e.i(73772),
        ew = e.i(354981),
        eC = "Dialog",
        [eR, eN] = (0, d.createContextScope)(eC),
        [eS, ex] = eR(eC),
        eD = e => {
            let {
                __scopeDialog: t,
                children: n,
                open: r,
                defaultOpen: o,
                onOpenChange: i,
                modal: a = !0
            } = e, u = s.useRef(null), l = s.useRef(null), [c = !1, d] = (0, p.useControllableState)({
                prop: r,
                defaultProp: o,
                onChange: i
            });
            return (0, g.jsx)(eS, {
                scope: t,
                triggerRef: u,
                contentRef: l,
                contentId: (0, f.useId)(),
                titleId: (0, f.useId)(),
                descriptionId: (0, f.useId)(),
                open: c,
                onOpenChange: d,
                onOpenToggle: s.useCallback(() => d(e => !e), [d]),
                modal: a,
                children: n
            })
        };
    eD.displayName = eC;
    var eP = "DialogTrigger",
        eT = s.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                ...r
            } = e, o = ex(eP, n), i = (0, c.useComposedRefs)(t, o.triggerRef);
            return (0, g.jsx)(v.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": o.open,
                "aria-controls": o.contentId,
                "data-state": eZ(o.open),
                ...r,
                ref: i,
                onClick: (0, l.composeEventHandlers)(e.onClick, o.onOpenToggle)
            })
        });
    eT.displayName = eP;
    var eL = "DialogPortal",
        [eO, eI] = eR(eL, {
            forceMount: void 0
        }),
        e_ = e => {
            let {
                __scopeDialog: t,
                forceMount: n,
                children: r,
                container: o
            } = e, i = ex(eL, t);
            return (0, g.jsx)(eO, {
                scope: t,
                forceMount: n,
                children: s.Children.map(r, e => (0, g.jsx)(L, {
                    present: n || i.open,
                    children: (0, g.jsx)(T, {
                        asChild: !0,
                        container: o,
                        children: e
                    })
                }))
            })
        };
    e_.displayName = eL;
    var eM = "DialogOverlay",
        ek = s.forwardRef((e, t) => {
            let n = eI(eM, e.__scopeDialog),
                {
                    forceMount: r = n.forceMount,
                    ...o
                } = e,
                i = ex(eM, e.__scopeDialog);
            return i.modal ? (0, g.jsx)(L, {
                present: r || i.open,
                children: (0, g.jsx)(ej, {
                    ...o,
                    ref: t
                })
            }) : null
        });
    ek.displayName = eM;
    var eA = (0, ew.createSlot)("DialogOverlay.RemoveScroll"),
        ej = s.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                ...r
            } = e, o = ex(eM, n);
            return (0, g.jsx)(eE, {
                as: eA,
                allowPinchZoom: !0,
                shards: [o.contentRef],
                children: (0, g.jsx)(v.Primitive.div, {
                    "data-state": eZ(o.open),
                    ...r,
                    ref: t,
                    style: {
                        pointerEvents: "auto",
                        ...r.style
                    }
                })
            })
        }),
        eF = "DialogContent",
        eW = s.forwardRef((e, t) => {
            let n = eI(eF, e.__scopeDialog),
                {
                    forceMount: r = n.forceMount,
                    ...o
                } = e,
                i = ex(eF, e.__scopeDialog);
            return (0, g.jsx)(L, {
                present: r || i.open,
                children: i.modal ? (0, g.jsx)(eB, {
                    ...o,
                    ref: t
                }) : (0, g.jsx)(eU, {
                    ...o,
                    ref: t
                })
            })
        });
    eW.displayName = eF;
    var eB = s.forwardRef((e, t) => {
            let n = ex(eF, e.__scopeDialog),
                r = s.useRef(null),
                o = (0, c.useComposedRefs)(t, n.contentRef, r);
            return s.useEffect(() => {
                let e = r.current;
                if (e) return (0, eb.hideOthers)(e)
            }, []), (0, g.jsx)(eH, {
                ...e,
                ref: o,
                trapFocus: n.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: (0, l.composeEventHandlers)(e.onCloseAutoFocus, e => {
                    e.preventDefault(), n.triggerRef.current?.focus()
                }),
                onPointerDownOutside: (0, l.composeEventHandlers)(e.onPointerDownOutside, e => {
                    let t = e.detail.originalEvent,
                        n = 0 === t.button && !0 === t.ctrlKey;
                    (2 === t.button || n) && e.preventDefault()
                }),
                onFocusOutside: (0, l.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault())
            })
        }),
        eU = s.forwardRef((e, t) => {
            let n = ex(eF, e.__scopeDialog),
                r = s.useRef(!1),
                o = s.useRef(!1);
            return (0, g.jsx)(eH, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    e.onCloseAutoFocus?.(t), t.defaultPrevented || (r.current || n.triggerRef.current?.focus(), t.preventDefault()), r.current = !1, o.current = !1
                },
                onInteractOutside: t => {
                    e.onInteractOutside?.(t), t.defaultPrevented || (r.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                    let i = t.target;
                    n.triggerRef.current?.contains(i) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                }
            })
        }),
        eH = s.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                trapFocus: r,
                onOpenAutoFocus: o,
                onCloseAutoFocus: i,
                ...a
            } = e, u = ex(eF, n), l = s.useRef(null), d = (0, c.useComposedRefs)(t, l);
            return _(), (0, g.jsxs)(g.Fragment, {
                children: [(0, g.jsx)(w, {
                    asChild: !0,
                    loop: !0,
                    trapped: r,
                    onMountAutoFocus: o,
                    onUnmountAutoFocus: i,
                    children: (0, g.jsx)(m.DismissableLayer, {
                        role: "dialog",
                        id: u.contentId,
                        "aria-describedby": u.descriptionId,
                        "aria-labelledby": u.titleId,
                        "data-state": eZ(u.open),
                        ...a,
                        ref: d,
                        onDismiss: () => u.onOpenChange(!1)
                    })
                }), (0, g.jsxs)(g.Fragment, {
                    children: [(0, g.jsx)(eQ, {
                        titleId: u.titleId
                    }), (0, g.jsx)(e0, {
                        contentRef: l,
                        descriptionId: u.descriptionId
                    })]
                })]
            })
        }),
        eK = "DialogTitle",
        e$ = s.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                ...r
            } = e, o = ex(eK, n);
            return (0, g.jsx)(v.Primitive.h2, {
                id: o.titleId,
                ...r,
                ref: t
            })
        });
    e$.displayName = eK;
    var eX = "DialogDescription",
        eY = s.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                ...r
            } = e, o = ex(eX, n);
            return (0, g.jsx)(v.Primitive.p, {
                id: o.descriptionId,
                ...r,
                ref: t
            })
        });
    eY.displayName = eX;
    var ez = "DialogClose",
        eV = s.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                ...r
            } = e, o = ex(ez, n);
            return (0, g.jsx)(v.Primitive.button, {
                type: "button",
                ...r,
                ref: t,
                onClick: (0, l.composeEventHandlers)(e.onClick, () => o.onOpenChange(!1))
            })
        });

    function eZ(e) {
        return e ? "open" : "closed"
    }
    eV.displayName = ez;
    var eq = "DialogTitleWarning",
        [eG, eJ] = (0, d.createContext)(eq, {
            contentName: eF,
            titleName: eK,
            docsSlug: "dialog"
        }),
        eQ = e => {
            let {
                titleId: t
            } = e, n = eJ(eq), r = `\`${n.contentName}\` requires a \`${n.titleName}\` for the component to be accessible for screen reader users.

If you want to hide the \`${n.titleName}\`, you can wrap it with our VisuallyHidden component.

For more information, see https://radix-ui.com/primitives/docs/components/${n.docsSlug}`;
            return s.useEffect(() => {
                t && (document.getElementById(t) || console.error(r))
            }, [r, t]), null
        },
        e0 = e => {
            let {
                contentRef: t,
                descriptionId: n
            } = e, r = eJ("DialogDescriptionWarning"), o = `Warning: Missing \`Description\` or \`aria-describedby={undefined}\` for {${r.contentName}}.`;
            return s.useEffect(() => {
                let e = t.current?.getAttribute("aria-describedby");
                n && e && (document.getElementById(n) || console.warn(o))
            }, [o, t, n]), null
        };
    e.s(["Close", 0, eV, "Content", 0, eW, "Description", 0, eY, "Overlay", 0, ek, "Portal", 0, e_, "Root", 0, eD, "Title", 0, e$, "Trigger", 0, eT], 513443)
}]);

//# debugId=eaadd273-c5ad-8152-876f-130271069891
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/1363v9azjxcpf.js.map
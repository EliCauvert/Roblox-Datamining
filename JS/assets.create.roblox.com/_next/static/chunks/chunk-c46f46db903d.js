;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "25a58776-e1b1-3c86-3af5-ab498310f242")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 926396, t => {
    "use strict";
    let n;
    var r = t.i(416340),
        o = t.i(149285),
        i = t.i(221628),
        l = t.i(592822);

    function a(t, n) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(o) {
            if (null == t || t(o), !1 === r || !o.defaultPrevented) return null == n ? void 0 : n(o)
        }
    }

    function u(t, n) {
        if ("function" == typeof t) return t(n);
        null != t && (t.current = n)
    }

    function c() {
        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
        return t => {
            let r = !1,
                o = n.map(n => {
                    let o = u(n, t);
                    return r || "function" != typeof o || (r = !0), o
                });
            if (r) return () => {
                for (let t = 0; t < o.length; t++) {
                    let r = o[t];
                    "function" == typeof r ? r() : u(n[t], null)
                }
            }
        }
    }

    function s() {
        for (var t = arguments.length, n = Array(t), o = 0; o < t; o++) n[o] = arguments[o];
        return r.useCallback(c(...n), n)
    }
    var d = Symbol("radix.slottable");

    function f(t) {
        return r.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === d
    }
    var p = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, n) => {
        var o, l;
        let a, u, s, d = (l = o = "Primitive.".concat(n), (a = r.forwardRef((t, n) => {
                let {
                    children: o,
                    ...i
                } = t;
                if (r.isValidElement(o)) {
                    var l, a;
                    let t, u = (t = null == (l = Object.getOwnPropertyDescriptor(o.props, "ref")) ? void 0 : l.get) && "isReactWarning" in t && t.isReactWarning ? o.ref : (t = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in t && t.isReactWarning ? o.props.ref : o.props.ref || o.ref,
                        s = function(t, n) {
                            let r = {
                                ...n
                            };
                            for (let o in n) {
                                let i = t[o],
                                    l = n[o];
                                /^on[A-Z]/.test(o) ? i && l ? r[o] = function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    l(...n), i(...n)
                                } : i && (r[o] = i) : "style" === o ? r[o] = {
                                    ...i,
                                    ...l
                                } : "className" === o && (r[o] = [i, l].filter(Boolean).join(" "))
                            }
                            return {
                                ...t,
                                ...r
                            }
                        }(i, o.props);
                    return o.type !== r.Fragment && (s.ref = n ? c(n, u) : u), r.cloneElement(o, s)
                }
                return r.Children.count(o) > 1 ? r.Children.only(null) : null
            })).displayName = "".concat(l, ".SlotClone"), u = a, (s = r.forwardRef((t, n) => {
                let {
                    children: o,
                    ...l
                } = t, a = r.Children.toArray(o), c = a.find(f);
                if (c) {
                    let t = c.props.children,
                        o = a.map(n => n === c ? r.Children.count(t) > 1 ? r.Children.only(null) : r.isValidElement(t) ? t.props.children : null : n);
                    return (0, i.jsx)(u, {
                        ...l,
                        ref: n,
                        children: r.isValidElement(t) ? r.cloneElement(t, void 0, o) : null
                    })
                }
                return (0, i.jsx)(u, {
                    ...l,
                    ref: n,
                    children: o
                })
            })).displayName = "".concat(o, ".Slot"), s),
            p = r.forwardRef((t, r) => {
                let {
                    asChild: o,
                    ...l
                } = t;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, i.jsx)(o ? d : n, {
                    ...l,
                    ref: r
                })
            });
        return p.displayName = "Primitive.".concat(n), {
            ...t,
            [n]: p
        }
    }, {});

    function v(t) {
        let n = r.useRef(t);
        return r.useEffect(() => {
            n.current = t
        }), r.useMemo(() => function() {
            for (var t, r = arguments.length, o = Array(r), i = 0; i < r; i++) o[i] = arguments[i];
            return null == (t = n.current) ? void 0 : t.call(n, ...o)
        }, [])
    }
    var m, h, g = "dismissableLayer.update",
        y = r.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        b = r.forwardRef((t, n) => {
            var o, l;
            let {
                disableOutsidePointerEvents: u = !1,
                onEscapeKeyDown: c,
                onPointerDownOutside: d,
                onFocusOutside: f,
                onInteractOutside: m,
                onDismiss: b,
                ...C
            } = t, R = r.useContext(y), [x, N] = r.useState(null), S = null != (o = null == x ? void 0 : x.ownerDocument) ? o : null == (l = globalThis) ? void 0 : l.document, [, D] = r.useState({}), P = s(n, t => N(t)), O = Array.from(R.layers), [A] = [...R.layersWithOutsidePointerEventsDisabled].slice(-1), _ = O.indexOf(A), j = x ? O.indexOf(x) : -1, M = R.layersWithOutsidePointerEventsDisabled.size > 0, T = j >= _, I = function(t) {
                var n;
                let o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                    i = v(t),
                    l = r.useRef(!1),
                    a = r.useRef(() => {});
                return r.useEffect(() => {
                    let t = t => {
                            if (t.target && !l.current) {
                                let n = function() {
                                        w("dismissableLayer.pointerDownOutside", i, r, {
                                            discrete: !0
                                        })
                                    },
                                    r = {
                                        originalEvent: t
                                    };
                                "touch" === t.pointerType ? (o.removeEventListener("click", a.current), a.current = n, o.addEventListener("click", a.current, {
                                    once: !0
                                })) : n()
                            } else o.removeEventListener("click", a.current);
                            l.current = !1
                        },
                        n = window.setTimeout(() => {
                            o.addEventListener("pointerdown", t)
                        }, 0);
                    return () => {
                        window.clearTimeout(n), o.removeEventListener("pointerdown", t), o.removeEventListener("click", a.current)
                    }
                }, [o, i]), {
                    onPointerDownCapture: () => l.current = !0
                }
            }(t => {
                let n = t.target,
                    r = [...R.branches].some(t => t.contains(n));
                T && !r && (null == d || d(t), null == m || m(t), t.defaultPrevented || null == b || b())
            }, S), L = function(t) {
                var n;
                let o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                    i = v(t),
                    l = r.useRef(!1);
                return r.useEffect(() => {
                    let t = t => {
                        t.target && !l.current && w("dismissableLayer.focusOutside", i, {
                            originalEvent: t
                        }, {
                            discrete: !1
                        })
                    };
                    return o.addEventListener("focusin", t), () => o.removeEventListener("focusin", t)
                }, [o, i]), {
                    onFocusCapture: () => l.current = !0,
                    onBlurCapture: () => l.current = !1
                }
            }(t => {
                let n = t.target;
                [...R.branches].some(t => t.contains(n)) || (null == f || f(t), null == m || m(t), t.defaultPrevented || null == b || b())
            }, S);
            return function(t) {
                var n;
                let o, i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                    l = (o = r.useRef(t), r.useEffect(() => {
                        o.current = t
                    }), r.useMemo(() => function() {
                        for (var t, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                        return null == (t = o.current) ? void 0 : t.call(o, ...r)
                    }, []));
                r.useEffect(() => {
                    let t = t => {
                        "Escape" === t.key && l(t)
                    };
                    return i.addEventListener("keydown", t, {
                        capture: !0
                    }), () => i.removeEventListener("keydown", t, {
                        capture: !0
                    })
                }, [l, i])
            }(t => {
                j === R.layers.size - 1 && (null == c || c(t), !t.defaultPrevented && b && (t.preventDefault(), b()))
            }, S), r.useEffect(() => {
                if (x) return u && (0 === R.layersWithOutsidePointerEventsDisabled.size && (h = S.body.style.pointerEvents, S.body.style.pointerEvents = "none"), R.layersWithOutsidePointerEventsDisabled.add(x)), R.layers.add(x), E(), () => {
                    u && 1 === R.layersWithOutsidePointerEventsDisabled.size && (S.body.style.pointerEvents = h)
                }
            }, [x, S, u, R]), r.useEffect(() => () => {
                x && (R.layers.delete(x), R.layersWithOutsidePointerEventsDisabled.delete(x), E())
            }, [x, R]), r.useEffect(() => {
                let t = () => D({});
                return document.addEventListener(g, t), () => document.removeEventListener(g, t)
            }, []), (0, i.jsx)(p.div, {
                ...C,
                ref: P,
                style: {
                    pointerEvents: M ? T ? "auto" : "none" : void 0,
                    ...t.style
                },
                onFocusCapture: a(t.onFocusCapture, L.onFocusCapture),
                onBlurCapture: a(t.onBlurCapture, L.onBlurCapture),
                onPointerDownCapture: a(t.onPointerDownCapture, I.onPointerDownCapture)
            })
        });

    function E() {
        let t = new CustomEvent(g);
        document.dispatchEvent(t)
    }

    function w(t, n, r, i) {
        let {
            discrete: l
        } = i, a = r.originalEvent.target, u = new CustomEvent(t, {
            bubbles: !1,
            cancelable: !0,
            detail: r
        });
        n && a.addEventListener(t, n, {
            once: !0
        }), l ? a && o.flushSync(() => a.dispatchEvent(u)) : a.dispatchEvent(u)
    }
    b.displayName = "DismissableLayer", r.forwardRef((t, n) => {
        let o = r.useContext(y),
            l = r.useRef(null),
            a = s(n, l);
        return r.useEffect(() => {
            let t = l.current;
            if (t) return o.branches.add(t), () => {
                o.branches.delete(t)
            }
        }, [o.branches]), (0, i.jsx)(p.div, {
            ...t,
            ref: a
        })
    }).displayName = "DismissableLayerBranch";
    var C = 0;

    function R() {
        let t = document.createElement("span");
        return t.setAttribute("data-radix-focus-guard", ""), t.tabIndex = 0, t.style.outline = "none", t.style.opacity = "0", t.style.position = "fixed", t.style.pointerEvents = "none", t
    }

    function x(t, n) {
        if ("function" == typeof t) return t(n);
        null != t && (t.current = n)
    }

    function N() {
        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
        return t => {
            let r = !1,
                o = n.map(n => {
                    let o = x(n, t);
                    return r || "function" != typeof o || (r = !0), o
                });
            if (r) return () => {
                for (let t = 0; t < o.length; t++) {
                    let r = o[t];
                    "function" == typeof r ? r() : x(n[t], null)
                }
            }
        }
    }
    var S = Symbol("radix.slottable");

    function D(t) {
        return r.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === S
    }
    var P = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, n) => {
        var o, l;
        let a, u, c, s = (l = o = "Primitive.".concat(n), (a = r.forwardRef((t, n) => {
                let {
                    children: o,
                    ...i
                } = t;
                if (r.isValidElement(o)) {
                    var l, a;
                    let t, u = (t = null == (l = Object.getOwnPropertyDescriptor(o.props, "ref")) ? void 0 : l.get) && "isReactWarning" in t && t.isReactWarning ? o.ref : (t = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in t && t.isReactWarning ? o.props.ref : o.props.ref || o.ref,
                        c = function(t, n) {
                            let r = {
                                ...n
                            };
                            for (let o in n) {
                                let i = t[o],
                                    l = n[o];
                                /^on[A-Z]/.test(o) ? i && l ? r[o] = function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    l(...n), i(...n)
                                } : i && (r[o] = i) : "style" === o ? r[o] = {
                                    ...i,
                                    ...l
                                } : "className" === o && (r[o] = [i, l].filter(Boolean).join(" "))
                            }
                            return {
                                ...t,
                                ...r
                            }
                        }(i, o.props);
                    return o.type !== r.Fragment && (c.ref = n ? N(n, u) : u), r.cloneElement(o, c)
                }
                return r.Children.count(o) > 1 ? r.Children.only(null) : null
            })).displayName = "".concat(l, ".SlotClone"), u = a, (c = r.forwardRef((t, n) => {
                let {
                    children: o,
                    ...l
                } = t, a = r.Children.toArray(o), c = a.find(D);
                if (c) {
                    let t = c.props.children,
                        o = a.map(n => n === c ? r.Children.count(t) > 1 ? r.Children.only(null) : r.isValidElement(t) ? t.props.children : null : n);
                    return (0, i.jsx)(u, {
                        ...l,
                        ref: n,
                        children: r.isValidElement(t) ? r.cloneElement(t, void 0, o) : null
                    })
                }
                return (0, i.jsx)(u, {
                    ...l,
                    ref: n,
                    children: o
                })
            })).displayName = "".concat(o, ".Slot"), c),
            d = r.forwardRef((t, r) => {
                let {
                    asChild: o,
                    ...l
                } = t;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, i.jsx)(o ? s : n, {
                    ...l,
                    ref: r
                })
            });
        return d.displayName = "Primitive.".concat(n), {
            ...t,
            [n]: d
        }
    }, {});

    function O(t) {
        let n = r.useRef(t);
        return r.useEffect(() => {
            n.current = t
        }), r.useMemo(() => function() {
            for (var t, r = arguments.length, o = Array(r), i = 0; i < r; i++) o[i] = arguments[i];
            return null == (t = n.current) ? void 0 : t.call(n, ...o)
        }, [])
    }
    var A = "focusScope.autoFocusOnMount",
        _ = "focusScope.autoFocusOnUnmount",
        j = {
            bubbles: !1,
            cancelable: !0
        },
        M = r.forwardRef((t, n) => {
            let {
                loop: o = !1,
                trapped: l = !1,
                onMountAutoFocus: a,
                onUnmountAutoFocus: u,
                ...c
            } = t, [s, d] = r.useState(null), f = O(a), p = O(u), v = r.useRef(null), m = function() {
                for (var t = arguments.length, n = Array(t), o = 0; o < t; o++) n[o] = arguments[o];
                return r.useCallback(N(...n), n)
            }(n, t => d(t)), h = r.useRef({
                paused: !1,
                pause() {
                    this.paused = !0
                },
                resume() {
                    this.paused = !1
                }
            }).current;
            r.useEffect(() => {
                if (l) {
                    let t = function(t) {
                            if (h.paused || !s) return;
                            let n = t.target;
                            s.contains(n) ? v.current = n : L(v.current, {
                                select: !0
                            })
                        },
                        n = function(t) {
                            if (h.paused || !s) return;
                            let n = t.relatedTarget;
                            null !== n && (s.contains(n) || L(v.current, {
                                select: !0
                            }))
                        };
                    document.addEventListener("focusin", t), document.addEventListener("focusout", n);
                    let r = new MutationObserver(function(t) {
                        if (document.activeElement === document.body)
                            for (let n of t) n.removedNodes.length > 0 && L(s)
                    });
                    return s && r.observe(s, {
                        childList: !0,
                        subtree: !0
                    }), () => {
                        document.removeEventListener("focusin", t), document.removeEventListener("focusout", n), r.disconnect()
                    }
                }
            }, [l, s, h.paused]), r.useEffect(() => {
                if (s) {
                    k.add(h);
                    let t = document.activeElement;
                    if (!s.contains(t)) {
                        let n = new CustomEvent(A, j);
                        s.addEventListener(A, f), s.dispatchEvent(n), n.defaultPrevented || (! function(t) {
                            let {
                                select: n = !1
                            } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, r = document.activeElement;
                            for (let o of t)
                                if (L(o, {
                                        select: n
                                    }), document.activeElement !== r) return
                        }(T(s).filter(t => "A" !== t.tagName), {
                            select: !0
                        }), document.activeElement === t && L(s))
                    }
                    return () => {
                        s.removeEventListener(A, f), setTimeout(() => {
                            let n = new CustomEvent(_, j);
                            s.addEventListener(_, p), s.dispatchEvent(n), n.defaultPrevented || L(null != t ? t : document.body, {
                                select: !0
                            }), s.removeEventListener(_, p), k.remove(h)
                        }, 0)
                    }
                }
            }, [s, f, p, h]);
            let g = r.useCallback(t => {
                if (!o && !l || h.paused) return;
                let n = "Tab" === t.key && !t.altKey && !t.ctrlKey && !t.metaKey,
                    r = document.activeElement;
                if (n && r) {
                    let n, i = t.currentTarget,
                        [l, a] = [I(n = T(i), i), I(n.reverse(), i)];
                    l && a ? t.shiftKey || r !== a ? t.shiftKey && r === l && (t.preventDefault(), o && L(a, {
                        select: !0
                    })) : (t.preventDefault(), o && L(l, {
                        select: !0
                    })) : r === i && t.preventDefault()
                }
            }, [o, l, h.paused]);
            return (0, i.jsx)(P.div, {
                tabIndex: -1,
                ...c,
                ref: m,
                onKeyDown: g
            })
        });

    function T(t) {
        let n = [],
            r = document.createTreeWalker(t, NodeFilter.SHOW_ELEMENT, {
                acceptNode: t => {
                    let n = "INPUT" === t.tagName && "hidden" === t.type;
                    return t.disabled || t.hidden || n ? NodeFilter.FILTER_SKIP : t.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                }
            });
        for (; r.nextNode();) n.push(r.currentNode);
        return n
    }

    function I(t, n) {
        for (let r of t)
            if (! function(t, n) {
                    let {
                        upTo: r
                    } = n;
                    if ("hidden" === getComputedStyle(t).visibility) return !0;
                    for (; t && (void 0 === r || t !== r);) {
                        if ("none" === getComputedStyle(t).display) return !0;
                        t = t.parentElement
                    }
                    return !1
                }(r, {
                    upTo: n
                })) return r
    }

    function L(t) {
        let {
            select: n = !1
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        if (t && t.focus) {
            var r;
            let o = document.activeElement;
            t.focus({
                preventScroll: !0
            }), t !== o && (r = t) instanceof HTMLInputElement && "select" in r && n && t.select()
        }
    }
    M.displayName = "FocusScope";
    var k = (n = [], {
        add(t) {
            let r = n[0];
            t !== r && (null == r || r.pause()), (n = W(n, t)).unshift(t)
        },
        remove(t) {
            var r;
            null == (r = (n = W(n, t))[0]) || r.resume()
        }
    });

    function W(t, n) {
        let r = [...t],
            o = r.indexOf(n);
        return -1 !== o && r.splice(o, 1), r
    }

    function F(t, n) {
        if ("function" == typeof t) return t(n);
        null != t && (t.current = n)
    }
    var V = Symbol("radix.slottable");

    function B(t) {
        return r.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === V
    }
    var U = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, n) => {
            var o, l;
            let a, u, c, s = (l = o = "Primitive.".concat(n), (a = r.forwardRef((t, n) => {
                    let {
                        children: o,
                        ...i
                    } = t;
                    if (r.isValidElement(o)) {
                        var l, a;
                        let t, u = (t = null == (l = Object.getOwnPropertyDescriptor(o.props, "ref")) ? void 0 : l.get) && "isReactWarning" in t && t.isReactWarning ? o.ref : (t = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in t && t.isReactWarning ? o.props.ref : o.props.ref || o.ref,
                            c = function(t, n) {
                                let r = {
                                    ...n
                                };
                                for (let o in n) {
                                    let i = t[o],
                                        l = n[o];
                                    /^on[A-Z]/.test(o) ? i && l ? r[o] = function() {
                                        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                        l(...n), i(...n)
                                    } : i && (r[o] = i) : "style" === o ? r[o] = {
                                        ...i,
                                        ...l
                                    } : "className" === o && (r[o] = [i, l].filter(Boolean).join(" "))
                                }
                                return {
                                    ...t,
                                    ...r
                                }
                            }(i, o.props);
                        return o.type !== r.Fragment && (c.ref = n ? function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return t => {
                                let r = !1,
                                    o = n.map(n => {
                                        let o = F(n, t);
                                        return r || "function" != typeof o || (r = !0), o
                                    });
                                if (r) return () => {
                                    for (let t = 0; t < o.length; t++) {
                                        let r = o[t];
                                        "function" == typeof r ? r() : F(n[t], null)
                                    }
                                }
                            }
                        }(n, u) : u), r.cloneElement(o, c)
                    }
                    return r.Children.count(o) > 1 ? r.Children.only(null) : null
                })).displayName = "".concat(l, ".SlotClone"), u = a, (c = r.forwardRef((t, n) => {
                    let {
                        children: o,
                        ...l
                    } = t, a = r.Children.toArray(o), c = a.find(B);
                    if (c) {
                        let t = c.props.children,
                            o = a.map(n => n === c ? r.Children.count(t) > 1 ? r.Children.only(null) : r.isValidElement(t) ? t.props.children : null : n);
                        return (0, i.jsx)(u, {
                            ...l,
                            ref: n,
                            children: r.isValidElement(t) ? r.cloneElement(t, void 0, o) : null
                        })
                    }
                    return (0, i.jsx)(u, {
                        ...l,
                        ref: n,
                        children: o
                    })
                })).displayName = "".concat(o, ".Slot"), c),
                d = r.forwardRef((t, r) => {
                    let {
                        asChild: o,
                        ...l
                    } = t;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, i.jsx)(o ? s : n, {
                        ...l,
                        ref: r
                    })
                });
            return d.displayName = "Primitive.".concat(n), {
                ...t,
                [n]: d
            }
        }, {}),
        K = (null == (m = globalThis) ? void 0 : m.document) ? r.useLayoutEffect : () => {},
        z = r.forwardRef((t, n) => {
            var l, a;
            let {
                container: u,
                ...c
            } = t, [s, d] = r.useState(!1);
            K(() => d(!0), []);
            let f = u || s && (null == (a = globalThis) || null == (l = a.document) ? void 0 : l.body);
            return f ? o.default.createPortal((0, i.jsx)(U.div, {
                ...c,
                ref: n
            }), f) : null
        });
    z.displayName = "Portal";
    var Z = new WeakMap,
        X = new WeakMap,
        Y = {},
        H = 0,
        q = function(t) {
            return t && (t.host || q(t.parentNode))
        },
        G = function(t, n, r, o) {
            var i = (Array.isArray(t) ? t : [t]).map(function(t) {
                if (n.contains(t)) return t;
                var r = q(t);
                return r && n.contains(r) ? r : (console.error("aria-hidden", t, "in not contained inside", n, ". Doing nothing"), null)
            }).filter(function(t) {
                return !!t
            });
            Y[r] || (Y[r] = new WeakMap);
            var l = Y[r],
                a = [],
                u = new Set,
                c = new Set(i),
                s = function(t) {
                    t && !u.has(t) && (u.add(t), s(t.parentNode))
                };
            i.forEach(s);
            var d = function(t) {
                t && !c.has(t) && Array.prototype.forEach.call(t.children, function(t) {
                    if (u.has(t)) d(t);
                    else try {
                        var n = t.getAttribute(o),
                            i = null !== n && "false" !== n,
                            c = (Z.get(t) || 0) + 1,
                            s = (l.get(t) || 0) + 1;
                        Z.set(t, c), l.set(t, s), a.push(t), 1 === c && i && X.set(t, !0), 1 === s && t.setAttribute(r, "true"), i || t.setAttribute(o, "true")
                    } catch (n) {
                        console.error("aria-hidden: cannot operate on ", t, n)
                    }
                })
            };
            return d(n), u.clear(), H++,
                function() {
                    a.forEach(function(t) {
                        var n = Z.get(t) - 1,
                            i = l.get(t) - 1;
                        Z.set(t, n), l.set(t, i), n || (X.has(t) || t.removeAttribute(o), X.delete(t)), i || t.removeAttribute(r)
                    }), --H || (Z = new WeakMap, Z = new WeakMap, X = new WeakMap, Y = {})
                }
        },
        J = "right-scroll-bar-position",
        Q = "width-before-scroll-bar";

    function $(t, n) {
        return "function" == typeof t ? t(n) : t && (t.current = n), t
    }
    var ee = "u" > typeof window ? r.useLayoutEffect : r.useEffect,
        et = new WeakMap,
        en = function(t) {
            var n = t.sideCar,
                o = (0, l._)(t, ["sideCar"]);
            if (!n) throw Error("Sidecar: please provide `sideCar` property to import the right car");
            var i = n.read();
            if (!i) throw Error("Sidecar medium not found");
            return r.createElement(i, (0, l.a)({}, o))
        };
    en.isSideCarExport = !0;
    var er = (void 0 === eb && (eb = {}), (void 0 === eE && (eE = function(t) {
            return t
        }), ew = [], eC = !1, eR = {
            read: function() {
                if (eC) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                return ew.length ? ew[ew.length - 1] : null
            },
            useMedium: function(t) {
                var n = eE(t, eC);
                return ew.push(n),
                    function() {
                        ew = ew.filter(function(t) {
                            return t !== n
                        })
                    }
            },
            assignSyncMedium: function(t) {
                for (eC = !0; ew.length;) {
                    var n = ew;
                    ew = [], n.forEach(t)
                }
                ew = {
                    push: function(n) {
                        return t(n)
                    },
                    filter: function() {
                        return ew
                    }
                }
            },
            assignMedium: function(t) {
                eC = !0;
                var n = [];
                if (ew.length) {
                    var r = ew;
                    ew = [], r.forEach(t), n = ew
                }
                var o = function() {
                        var r = n;
                        n = [], r.forEach(t)
                    },
                    i = function() {
                        return Promise.resolve().then(o)
                    };
                i(), ew = {
                    push: function(t) {
                        n.push(t), i()
                    },
                    filter: function(t) {
                        return n = n.filter(t), ew
                    }
                }
            }
        }).options = (0, l.a)({
            async: !0,
            ssr: !1
        }, eb), eR),
        eo = function() {},
        ei = r.forwardRef(function(t, n) {
            var o, i, a, u, c = r.useRef(null),
                s = r.useState({
                    onScrollCapture: eo,
                    onWheelCapture: eo,
                    onTouchMoveCapture: eo
                }),
                d = s[0],
                f = s[1],
                p = t.forwardProps,
                v = t.children,
                m = t.className,
                h = t.removeScrollBar,
                g = t.enabled,
                y = t.shards,
                b = t.sideCar,
                E = t.noIsolation,
                w = t.inert,
                C = t.allowPinchZoom,
                R = t.as,
                x = t.gapMode,
                N = (0, l._)(t, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                S = (o = [c, n], i = function(t) {
                    return o.forEach(function(n) {
                        return $(n, t)
                    })
                }, (a = (0, r.useState)(function() {
                    return {
                        value: null,
                        callback: i,
                        facade: {
                            get current() {
                                return a.value
                            },
                            set current(e) {
                                var t = a.value;
                                t !== e && (a.value = e, a.callback(e, t))
                            }
                        }
                    }
                })[0]).callback = i, u = a.facade, ee(function() {
                    var t = et.get(u);
                    if (t) {
                        var n = new Set(t),
                            r = new Set(o),
                            i = u.current;
                        n.forEach(function(t) {
                            r.has(t) || $(t, null)
                        }), r.forEach(function(t) {
                            n.has(t) || $(t, i)
                        })
                    }
                    et.set(u, o)
                }, [o]), u),
                D = (0, l.a)((0, l.a)({}, N), d);
            return r.createElement(r.Fragment, null, g && r.createElement(b, {
                sideCar: er,
                removeScrollBar: h,
                shards: y,
                noIsolation: E,
                inert: w,
                setCallbacks: f,
                allowPinchZoom: !!C,
                lockRef: c,
                gapMode: x
            }), p ? r.cloneElement(r.Children.only(v), (0, l.a)((0, l.a)({}, D), {
                ref: S
            })) : r.createElement(void 0 === R ? "div" : R, (0, l.a)({}, D, {
                className: m,
                ref: S
            }), v))
        });
    ei.defaultProps = {
        enabled: !0,
        removeScrollBar: !0,
        inert: !1
    }, ei.classNames = {
        fullWidth: Q,
        zeroRight: J
    };
    var el = function() {
            if ("u" > typeof __webpack_nonce__) return __webpack_nonce__
        },
        ea = function() {
            var t = 0,
                n = null;
            return {
                add: function(r) {
                    var o, i;
                    0 == t && (n = function() {
                        if (!document) return null;
                        var t = document.createElement("style");
                        t.type = "text/css";
                        var n = el();
                        return n && t.setAttribute("nonce", n), t
                    }()) && ((o = n).styleSheet ? o.styleSheet.cssText = r : o.appendChild(document.createTextNode(r)), i = n, (document.head || document.getElementsByTagName("head")[0]).appendChild(i)), t++
                },
                remove: function() {
                    --t || !n || (n.parentNode && n.parentNode.removeChild(n), n = null)
                }
            }
        },
        eu = function() {
            var t, n = (t = ea(), function(n, o) {
                r.useEffect(function() {
                    return t.add(n),
                        function() {
                            t.remove()
                        }
                }, [n && o])
            });
            return function(t) {
                return n(t.styles, t.dynamic), null
            }
        },
        ec = {
            left: 0,
            top: 0,
            right: 0,
            gap: 0
        },
        es = function(t) {
            return parseInt(t || "", 10) || 0
        },
        ed = function(t) {
            if (void 0 === t && (t = "margin"), "u" < typeof window) return ec;
            var n, r, o, i, l, a = (n = t, o = (r = window.getComputedStyle(document.body))["padding" === n ? "paddingLeft" : "marginLeft"], i = r["padding" === n ? "paddingTop" : "marginTop"], l = r["padding" === n ? "paddingRight" : "marginRight"], [es(o), es(i), es(l)]),
                u = document.documentElement.clientWidth,
                c = window.innerWidth;
            return {
                left: a[0],
                top: a[1],
                right: a[2],
                gap: Math.max(0, c - u + a[2] - a[0])
            }
        },
        ef = eu(),
        ep = "data-scroll-locked",
        ev = function(t, n, r, o) {
            var i = t.left,
                l = t.top,
                a = t.right,
                u = t.gap;
            return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(o, ";\n   padding-right: ").concat(u, "px ").concat(o, ";\n  }\n  body[").concat(ep, "] {\n    overflow: hidden ").concat(o, ";\n    overscroll-behavior: contain;\n    ").concat([n && "position: relative ".concat(o, ";"), "margin" === r && "\n    padding-left: ".concat(i, "px;\n    padding-top: ").concat(l, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(u, "px ").concat(o, ";\n    "), "padding" === r && "padding-right: ".concat(u, "px ").concat(o, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(J, " {\n    right: ").concat(u, "px ").concat(o, ";\n  }\n  \n  .").concat(Q, " {\n    margin-right: ").concat(u, "px ").concat(o, ";\n  }\n  \n  .").concat(J, " .").concat(J, " {\n    right: 0 ").concat(o, ";\n  }\n  \n  .").concat(Q, " .").concat(Q, " {\n    margin-right: 0 ").concat(o, ";\n  }\n  \n  body[").concat(ep, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(u, "px;\n  }\n")
        },
        em = function() {
            var t = parseInt(document.body.getAttribute(ep) || "0", 10);
            return isFinite(t) ? t : 0
        },
        eh = function(t) {
            var n = t.noRelative,
                o = t.noImportant,
                i = t.gapMode,
                l = void 0 === i ? "margin" : i;
            r.useEffect(function() {
                return document.body.setAttribute(ep, (em() + 1).toString()),
                    function() {
                        var t = em() - 1;
                        t <= 0 ? document.body.removeAttribute(ep) : document.body.setAttribute(ep, t.toString())
                    }
            }, []);
            var a = r.useMemo(function() {
                return ed(l)
            }, [l]);
            return r.createElement(ef, {
                styles: ev(a, !n, l, o ? "" : "!important")
            })
        },
        eg = !1;
    if ("u" > typeof window) try {
        var ey = Object.defineProperty({}, "passive", {
            get: function() {
                return eg = !0, !0
            }
        });
        window.addEventListener("test", ey, ey), window.removeEventListener("test", ey, ey)
    } catch (t) {
        eg = !1
    }
    var eb, eE, ew, eC, eR, ex, eN = !!eg && {
            passive: !1
        },
        eS = function(t, n) {
            if (!(t instanceof Element)) return !1;
            var r = window.getComputedStyle(t);
            return "hidden" !== r[n] && (r.overflowY !== r.overflowX || "TEXTAREA" === t.tagName || "visible" !== r[n])
        },
        eD = function(t, n) {
            var r = n.ownerDocument,
                o = n;
            do {
                if ("u" > typeof ShadowRoot && o instanceof ShadowRoot && (o = o.host), eP(t, o)) {
                    var i = eO(t, o);
                    if (i[1] > i[2]) return !0
                }
                o = o.parentNode
            } while (o && o !== r.body) return !1
        },
        eP = function(t, n) {
            return "v" === t ? eS(n, "overflowY") : eS(n, "overflowX")
        },
        eO = function(t, n) {
            return "v" === t ? [n.scrollTop, n.scrollHeight, n.clientHeight] : [n.scrollLeft, n.scrollWidth, n.clientWidth]
        },
        eA = function(t, n, r, o, i) {
            var l, a = (l = window.getComputedStyle(n).direction, "h" === t && "rtl" === l ? -1 : 1),
                u = a * o,
                c = r.target,
                s = n.contains(c),
                d = !1,
                f = u > 0,
                p = 0,
                v = 0;
            do {
                var m = eO(t, c),
                    h = m[0],
                    g = m[1] - m[2] - a * h;
                (h || g) && eP(t, c) && (p += g, v += h), c = c instanceof ShadowRoot ? c.host : c.parentNode
            } while (!s && c !== document.body || s && (n.contains(c) || n === c)) return (f && (i && 1 > Math.abs(p) || !i && u > p) || !f && (i && 1 > Math.abs(v) || !i && -u > v)) && (d = !0), d
        },
        e_ = function(t) {
            return "changedTouches" in t ? [t.changedTouches[0].clientX, t.changedTouches[0].clientY] : [0, 0]
        },
        ej = function(t) {
            return [t.deltaX, t.deltaY]
        },
        eM = function(t) {
            return t && "current" in t ? t.current : t
        },
        eT = 0,
        eI = [],
        eL = (ex = function(t) {
            var n = r.useRef([]),
                o = r.useRef([0, 0]),
                i = r.useRef(),
                a = r.useState(eT++)[0],
                u = r.useState(eu)[0],
                c = r.useRef(t);
            r.useEffect(function() {
                c.current = t
            }, [t]), r.useEffect(function() {
                if (t.inert) {
                    document.body.classList.add("block-interactivity-".concat(a));
                    var n = (0, l.b)([t.lockRef.current], (t.shards || []).map(eM), !0).filter(Boolean);
                    return n.forEach(function(t) {
                            return t.classList.add("allow-interactivity-".concat(a))
                        }),
                        function() {
                            document.body.classList.remove("block-interactivity-".concat(a)), n.forEach(function(t) {
                                return t.classList.remove("allow-interactivity-".concat(a))
                            })
                        }
                }
            }, [t.inert, t.lockRef.current, t.shards]);
            var s = r.useCallback(function(t, n) {
                    if ("touches" in t && 2 === t.touches.length || "wheel" === t.type && t.ctrlKey) return !c.current.allowPinchZoom;
                    var r, l = e_(t),
                        a = o.current,
                        u = "deltaX" in t ? t.deltaX : a[0] - l[0],
                        s = "deltaY" in t ? t.deltaY : a[1] - l[1],
                        d = t.target,
                        f = Math.abs(u) > Math.abs(s) ? "h" : "v";
                    if ("touches" in t && "h" === f && "range" === d.type) return !1;
                    var p = eD(f, d);
                    if (!p) return !0;
                    if (p ? r = f : (r = "v" === f ? "h" : "v", p = eD(f, d)), !p) return !1;
                    if (!i.current && "changedTouches" in t && (u || s) && (i.current = r), !r) return !0;
                    var v = i.current || r;
                    return eA(v, n, t, "h" === v ? u : s, !0)
                }, []),
                d = r.useCallback(function(t) {
                    if (eI.length && eI[eI.length - 1] === u) {
                        var r = "deltaY" in t ? ej(t) : e_(t),
                            o = n.current.filter(function(n) {
                                var o;
                                return n.name === t.type && (n.target === t.target || t.target === n.shadowParent) && (o = n.delta, o[0] === r[0] && o[1] === r[1])
                            })[0];
                        if (o && o.should) t.cancelable && t.preventDefault();
                        else if (!o) {
                            var i = (c.current.shards || []).map(eM).filter(Boolean).filter(function(n) {
                                return n.contains(t.target)
                            });
                            (i.length > 0 ? s(t, i[0]) : !c.current.noIsolation) && t.cancelable && t.preventDefault()
                        }
                    }
                }, []),
                f = r.useCallback(function(t, r, o, i) {
                    var l = {
                        name: t,
                        delta: r,
                        target: o,
                        should: i,
                        shadowParent: function(t) {
                            for (var n = null; null !== t;) t instanceof ShadowRoot && (n = t.host, t = t.host), t = t.parentNode;
                            return n
                        }(o)
                    };
                    n.current.push(l), setTimeout(function() {
                        n.current = n.current.filter(function(t) {
                            return t !== l
                        })
                    }, 1)
                }, []),
                p = r.useCallback(function(t) {
                    o.current = e_(t), i.current = void 0
                }, []),
                v = r.useCallback(function(n) {
                    f(n.type, ej(n), n.target, s(n, t.lockRef.current))
                }, []),
                m = r.useCallback(function(n) {
                    f(n.type, e_(n), n.target, s(n, t.lockRef.current))
                }, []);
            r.useEffect(function() {
                return eI.push(u), t.setCallbacks({
                        onScrollCapture: v,
                        onWheelCapture: v,
                        onTouchMoveCapture: m
                    }), document.addEventListener("wheel", d, eN), document.addEventListener("touchmove", d, eN), document.addEventListener("touchstart", p, eN),
                    function() {
                        eI = eI.filter(function(t) {
                            return t !== u
                        }), document.removeEventListener("wheel", d, eN), document.removeEventListener("touchmove", d, eN), document.removeEventListener("touchstart", p, eN)
                    }
            }, []);
            var h = t.removeScrollBar,
                g = t.inert;
            return r.createElement(r.Fragment, null, g ? r.createElement(u, {
                styles: "\n  .block-interactivity-".concat(a, " {pointer-events: none;}\n  .allow-interactivity-").concat(a, " {pointer-events: all;}\n")
            }) : null, h ? r.createElement(eh, {
                gapMode: t.gapMode
            }) : null)
        }, er.useMedium(ex), en),
        ek = r.forwardRef(function(t, n) {
            return r.createElement(ei, (0, l.a)({}, t, {
                ref: n,
                sideCar: eL
            }))
        });
    ek.classNames = ei.classNames, t.s(["D", 0, b, "F", 0, M, "P", 0, z, "R", 0, ek, "h", 0, function(t, n, r) {
        void 0 === r && (r = "data-aria-hidden");
        var o = Array.from(Array.isArray(t) ? t : [t]),
            i = n || ("u" < typeof document ? null : (Array.isArray(t) ? t[0] : t).ownerDocument.body);
        return i ? (o.push.apply(o, Array.from(i.querySelectorAll("[aria-live]"))), G(o, i, r, "aria-hidden")) : function() {
            return null
        }
    }, "u", 0, function() {
        r.useEffect(() => {
            var t, n;
            let r = document.querySelectorAll("[data-radix-focus-guard]");
            return document.body.insertAdjacentElement("afterbegin", null != (t = r[0]) ? t : R()), document.body.insertAdjacentElement("beforeend", null != (n = r[1]) ? n : R()), C++, () => {
                1 === C && document.querySelectorAll("[data-radix-focus-guard]").forEach(t => t.remove()), C--
            }
        }, [])
    }])
}, 895004, t => {
    "use strict";
    var n = t.i(592822),
        r = t.i(197649),
        o = t.i(416340),
        i = t.i(446955),
        l = t.i(994530);
    let a = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-medium"
        },
        u = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        };
    t.s(["CloseAffordance", 0, t => {
        var {
            variant: c,
            size: s,
            isCircular: d,
            className: f
        } = t, p = (0, n._)(t, ["variant", "size", "isCircular", "className"]);
        return o.default.createElement("button", Object.assign({
            type: "button",
            className: (0, r.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", l.interactable, u[c], a[s], d && "radius-circle", f)
        }, p), o.default.createElement(l.StateLayer, null), o.default.createElement(i.Icon, {
            name: "icon-regular-x",
            size: s
        }))
    }])
}, 647409, t => {
    "use strict";
    var n, r = t.i(416340),
        o = (null == (n = globalThis) ? void 0 : n.document) ? r.useLayoutEffect : () => {},
        i = r[" useId ".trim().toString()] || (() => {}),
        l = 0;
    t.s(["u", 0, function(t) {
        let [n, a] = r.useState(i());
        return o(() => {
            t || a(t => null != t ? t : String(l++))
        }, [t]), t || (n ? "radix-".concat(n) : "")
    }])
}, 620088, 978352, t => {
    "use strict";
    let n, r;
    var o, i, l = t.i(416340),
        a = t.i(221628),
        u = t.i(647409),
        c = t.i(926396);

    function s(t, n) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(o) {
            if (null == t || t(o), !1 === r || !o.defaultPrevented) return null == n ? void 0 : n(o)
        }
    }

    function d(t, n) {
        if ("function" == typeof t) return t(n);
        null != t && (t.current = n)
    }

    function f() {
        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
        return t => {
            let r = !1,
                o = n.map(n => {
                    let o = d(n, t);
                    return r || "function" != typeof o || (r = !0), o
                });
            if (r) return () => {
                for (let t = 0; t < o.length; t++) {
                    let r = o[t];
                    "function" == typeof r ? r() : d(n[t], null)
                }
            }
        }
    }

    function p() {
        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
        return l.useCallback(f(...n), n)
    }

    function v(t) {
        let n = l.useRef(t);
        return l.useEffect(() => {
            n.current = t
        }), l.useMemo(() => function() {
            for (var t, r = arguments.length, o = Array(r), i = 0; i < r; i++) o[i] = arguments[i];
            return null == (t = n.current) ? void 0 : t.call(n, ...o)
        }, [])
    }
    t.i(149285);
    var m = (null == (i = globalThis) ? void 0 : i.document) ? l.useLayoutEffect : () => {},
        h = t => {
            var n, r;
            let o, {
                    present: i,
                    children: a
                } = t,
                u = function(t) {
                    var n, r;
                    let [o, i] = l.useState(), a = l.useRef({}), u = l.useRef(t), c = l.useRef("none"), [s, d] = (n = t ? "mounted" : "unmounted", r = {
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
                    }, l.useReducer((t, n) => {
                        var o;
                        return null != (o = r[t][n]) ? o : t
                    }, n));
                    return l.useEffect(() => {
                        let t = g(a.current);
                        c.current = "mounted" === s ? t : "none"
                    }, [s]), m(() => {
                        let n = a.current,
                            r = u.current;
                        if (r !== t) {
                            let o = c.current,
                                i = g(n);
                            t ? d("MOUNT") : "none" === i || "none" === (null == n ? void 0 : n.display) ? d("UNMOUNT") : d(r && o !== i ? "ANIMATION_OUT" : "UNMOUNT"), u.current = t
                        }
                    }, [t, d]), m(() => {
                        if (o) {
                            var t;
                            let n, r = null != (t = o.ownerDocument.defaultView) ? t : window,
                                i = t => {
                                    let i = g(a.current).includes(t.animationName);
                                    if (t.target === o && i && (d("ANIMATION_END"), !u.current)) {
                                        let t = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", n = r.setTimeout(() => {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = t)
                                        })
                                    }
                                },
                                l = t => {
                                    t.target === o && (c.current = g(a.current))
                                };
                            return o.addEventListener("animationstart", l), o.addEventListener("animationcancel", i), o.addEventListener("animationend", i), () => {
                                r.clearTimeout(n), o.removeEventListener("animationstart", l), o.removeEventListener("animationcancel", i), o.removeEventListener("animationend", i)
                            }
                        }
                        d("ANIMATION_END")
                    }, [o, d]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(s),
                        ref: l.useCallback(t => {
                            t && (a.current = getComputedStyle(t)), i(t)
                        }, [])
                    }
                }(i),
                c = "function" == typeof a ? a({
                    present: u.isPresent
                }) : l.Children.only(a),
                s = p(u.ref, (o = null == (n = Object.getOwnPropertyDescriptor(c.props, "ref")) ? void 0 : n.get) && "isReactWarning" in o && o.isReactWarning ? c.ref : (o = null == (r = Object.getOwnPropertyDescriptor(c, "ref")) ? void 0 : r.get) && "isReactWarning" in o && o.isReactWarning ? c.props.ref : c.props.ref || c.ref);
            return "function" == typeof a || u.isPresent ? l.cloneElement(c, {
                ref: s
            }) : null
        };

    function g(t) {
        return (null == t ? void 0 : t.animationName) || "none"
    }

    function y(t) {
        var n;
        let r, o = (n = t, (r = l.forwardRef((t, n) => {
                let {
                    children: r,
                    ...o
                } = t;
                if (l.isValidElement(r)) {
                    var i, a;
                    let t, u = (t = null == (i = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : i.get) && "isReactWarning" in t && t.isReactWarning ? r.ref : (t = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in t && t.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                        c = function(t, n) {
                            let r = {
                                ...n
                            };
                            for (let o in n) {
                                let i = t[o],
                                    l = n[o];
                                /^on[A-Z]/.test(o) ? i && l ? r[o] = function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    l(...n), i(...n)
                                } : i && (r[o] = i) : "style" === o ? r[o] = {
                                    ...i,
                                    ...l
                                } : "className" === o && (r[o] = [i, l].filter(Boolean).join(" "))
                            }
                            return {
                                ...t,
                                ...r
                            }
                        }(o, r.props);
                    return r.type !== l.Fragment && (c.ref = n ? f(n, u) : u), l.cloneElement(r, c)
                }
                return l.Children.count(r) > 1 ? l.Children.only(null) : null
            })).displayName = "".concat(n, ".SlotClone"), r),
            i = l.forwardRef((t, n) => {
                let {
                    children: r,
                    ...i
                } = t, u = l.Children.toArray(r), c = u.find(E);
                if (c) {
                    let t = c.props.children,
                        r = u.map(n => n === c ? l.Children.count(t) > 1 ? l.Children.only(null) : l.isValidElement(t) ? t.props.children : null : n);
                    return (0, a.jsx)(o, {
                        ...i,
                        ref: n,
                        children: l.isValidElement(t) ? l.cloneElement(t, void 0, r) : null
                    })
                }
                return (0, a.jsx)(o, {
                    ...i,
                    ref: n,
                    children: r
                })
            });
        return i.displayName = "".concat(t, ".Slot"), i
    }
    h.displayName = "Presence";
    var b = Symbol("radix.slottable");

    function E(t) {
        return l.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === b
    }
    var w = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, n) => {
            let r = y("Primitive.".concat(n)),
                o = l.forwardRef((t, o) => {
                    let {
                        asChild: i,
                        ...l
                    } = t;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, a.jsx)(i ? r : n, {
                        ...l,
                        ref: o
                    })
                });
            return o.displayName = "Primitive.".concat(n), {
                ...t,
                [n]: o
            }
        }, {}),
        C = "Dialog",
        [R, x] = function(t) {
            let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                r = [],
                o = () => {
                    let n = r.map(t => l.createContext(t));
                    return function(r) {
                        let o = (null == r ? void 0 : r[t]) || n;
                        return l.useMemo(() => ({
                            ["__scope".concat(t)]: {
                                ...r,
                                [t]: o
                            }
                        }), [r, o])
                    }
                };
            return o.scopeName = t, [function(n, o) {
                let i = l.createContext(o),
                    u = r.length;
                r = [...r, o];
                let c = n => {
                    var r;
                    let {
                        scope: o,
                        children: c,
                        ...s
                    } = n, d = (null == o || null == (r = o[t]) ? void 0 : r[u]) || i, f = l.useMemo(() => s, Object.values(s));
                    return (0, a.jsx)(d.Provider, {
                        value: f,
                        children: c
                    })
                };
                return c.displayName = n + "Provider", [c, function(r, a) {
                    var c;
                    let s = (null == a || null == (c = a[t]) ? void 0 : c[u]) || i,
                        d = l.useContext(s);
                    if (d) return d;
                    if (void 0 !== o) return o;
                    throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                }]
            }, function() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                let o = n[0];
                if (1 === n.length) return o;
                let i = () => {
                    let t = n.map(t => ({
                        useScope: t(),
                        scopeName: t.scopeName
                    }));
                    return function(n) {
                        let r = t.reduce((t, r) => {
                            let {
                                useScope: o,
                                scopeName: i
                            } = r;
                            return {
                                ...t,
                                ...o(n)["__scope".concat(i)]
                            }
                        }, {});
                        return l.useMemo(() => ({
                            ["__scope".concat(o.scopeName)]: r
                        }), [r])
                    }
                };
                return i.scopeName = o.scopeName, i
            }(o, ...n)]
        }(C),
        [N, S] = R(C),
        D = t => {
            let {
                __scopeDialog: n,
                children: r,
                open: o,
                defaultOpen: i,
                onOpenChange: c,
                modal: s = !0
            } = t, d = l.useRef(null), f = l.useRef(null), [p = !1, m] = function(t) {
                let {
                    prop: n,
                    defaultProp: r,
                    onChange: o = () => {}
                } = t, [i, a] = function(t) {
                    let {
                        defaultProp: n,
                        onChange: r
                    } = t, o = l.useState(n), [i] = o, a = l.useRef(i), u = v(r);
                    return l.useEffect(() => {
                        a.current !== i && (u(i), a.current = i)
                    }, [i, a, u]), o
                }({
                    defaultProp: r,
                    onChange: o
                }), u = void 0 !== n, c = u ? n : i, s = v(o);
                return [c, l.useCallback(t => {
                    if (u) {
                        let r = "function" == typeof t ? t(n) : t;
                        r !== n && s(r)
                    } else a(t)
                }, [u, n, a, s])]
            }({
                prop: o,
                defaultProp: i,
                onChange: c
            });
            return (0, a.jsx)(N, {
                scope: n,
                triggerRef: d,
                contentRef: f,
                contentId: (0, u.u)(),
                titleId: (0, u.u)(),
                descriptionId: (0, u.u)(),
                open: p,
                onOpenChange: m,
                onOpenToggle: l.useCallback(() => m(t => !t), [m]),
                modal: s,
                children: r
            })
        };
    D.displayName = C;
    var P = "DialogTrigger",
        O = l.forwardRef((t, n) => {
            let {
                __scopeDialog: r,
                ...o
            } = t, i = S(P, r), l = p(n, i.triggerRef);
            return (0, a.jsx)(w.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": i.open,
                "aria-controls": i.contentId,
                "data-state": q(i.open),
                ...o,
                ref: l,
                onClick: s(t.onClick, i.onOpenToggle)
            })
        });
    O.displayName = P;
    var A = "DialogPortal",
        [_, j] = R(A, {
            forceMount: void 0
        }),
        M = t => {
            let {
                __scopeDialog: n,
                forceMount: r,
                children: o,
                container: i
            } = t, u = S(A, n);
            return (0, a.jsx)(_, {
                scope: n,
                forceMount: r,
                children: l.Children.map(o, t => (0, a.jsx)(h, {
                    present: r || u.open,
                    children: (0, a.jsx)(c.P, {
                        asChild: !0,
                        container: i,
                        children: t
                    })
                }))
            })
        };
    M.displayName = A;
    var T = "DialogOverlay",
        I = l.forwardRef((t, n) => {
            let r = j(T, t.__scopeDialog),
                {
                    forceMount: o = r.forceMount,
                    ...i
                } = t,
                l = S(T, t.__scopeDialog);
            return l.modal ? (0, a.jsx)(h, {
                present: o || l.open,
                children: (0, a.jsx)(k, {
                    ...i,
                    ref: n
                })
            }) : null
        });
    I.displayName = T;
    var L = y("DialogOverlay.RemoveScroll"),
        k = l.forwardRef((t, n) => {
            let {
                __scopeDialog: r,
                ...o
            } = t, i = S(T, r);
            return (0, a.jsx)(c.R, {
                as: L,
                allowPinchZoom: !0,
                shards: [i.contentRef],
                children: (0, a.jsx)(w.div, {
                    "data-state": q(i.open),
                    ...o,
                    ref: n,
                    style: {
                        pointerEvents: "auto",
                        ...o.style
                    }
                })
            })
        }),
        W = "DialogContent",
        F = l.forwardRef((t, n) => {
            let r = j(W, t.__scopeDialog),
                {
                    forceMount: o = r.forceMount,
                    ...i
                } = t,
                l = S(W, t.__scopeDialog);
            return (0, a.jsx)(h, {
                present: o || l.open,
                children: l.modal ? (0, a.jsx)(V, {
                    ...i,
                    ref: n
                }) : (0, a.jsx)(B, {
                    ...i,
                    ref: n
                })
            })
        });
    F.displayName = W;
    var V = l.forwardRef((t, n) => {
            let r = S(W, t.__scopeDialog),
                o = l.useRef(null),
                i = p(n, r.contentRef, o);
            return l.useEffect(() => {
                let t = o.current;
                if (t) return (0, c.h)(t)
            }, []), (0, a.jsx)(U, {
                ...t,
                ref: i,
                trapFocus: r.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: s(t.onCloseAutoFocus, t => {
                    var n;
                    t.preventDefault(), null == (n = r.triggerRef.current) || n.focus()
                }),
                onPointerDownOutside: s(t.onPointerDownOutside, t => {
                    let n = t.detail.originalEvent,
                        r = 0 === n.button && !0 === n.ctrlKey;
                    (2 === n.button || r) && t.preventDefault()
                }),
                onFocusOutside: s(t.onFocusOutside, t => t.preventDefault())
            })
        }),
        B = l.forwardRef((t, n) => {
            let r = S(W, t.__scopeDialog),
                o = l.useRef(!1),
                i = l.useRef(!1);
            return (0, a.jsx)(U, {
                ...t,
                ref: n,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: n => {
                    var l, a;
                    null == (l = t.onCloseAutoFocus) || l.call(t, n), n.defaultPrevented || (o.current || null == (a = r.triggerRef.current) || a.focus(), n.preventDefault()), o.current = !1, i.current = !1
                },
                onInteractOutside: n => {
                    var l, a;
                    null == (l = t.onInteractOutside) || l.call(t, n), n.defaultPrevented || (o.current = !0, "pointerdown" === n.detail.originalEvent.type && (i.current = !0));
                    let u = n.target;
                    (null == (a = r.triggerRef.current) ? void 0 : a.contains(u)) && n.preventDefault(), "focusin" === n.detail.originalEvent.type && i.current && n.preventDefault()
                }
            })
        }),
        U = l.forwardRef((t, n) => {
            let {
                __scopeDialog: r,
                trapFocus: o,
                onOpenAutoFocus: i,
                onCloseAutoFocus: u,
                ...s
            } = t, d = S(W, r), f = l.useRef(null), v = p(n, f);
            return (0, c.u)(), (0, a.jsxs)(a.Fragment, {
                children: [(0, a.jsx)(c.F, {
                    asChild: !0,
                    loop: !0,
                    trapped: o,
                    onMountAutoFocus: i,
                    onUnmountAutoFocus: u,
                    children: (0, a.jsx)(c.D, {
                        role: "dialog",
                        id: d.contentId,
                        "aria-describedby": d.descriptionId,
                        "aria-labelledby": d.titleId,
                        "data-state": q(d.open),
                        ...s,
                        ref: v,
                        onDismiss: () => d.onOpenChange(!1)
                    })
                }), (0, a.jsxs)(a.Fragment, {
                    children: [(0, a.jsx)($, {
                        titleId: d.titleId
                    }), (0, a.jsx)(ee, {
                        contentRef: f,
                        descriptionId: d.descriptionId
                    })]
                })]
            })
        }),
        K = "DialogTitle",
        z = l.forwardRef((t, n) => {
            let {
                __scopeDialog: r,
                ...o
            } = t, i = S(K, r);
            return (0, a.jsx)(w.h2, {
                id: i.titleId,
                ...o,
                ref: n
            })
        });
    z.displayName = K;
    var Z = "DialogDescription",
        X = l.forwardRef((t, n) => {
            let {
                __scopeDialog: r,
                ...o
            } = t, i = S(Z, r);
            return (0, a.jsx)(w.p, {
                id: i.descriptionId,
                ...o,
                ref: n
            })
        });
    X.displayName = Z;
    var Y = "DialogClose",
        H = l.forwardRef((t, n) => {
            let {
                __scopeDialog: r,
                ...o
            } = t, i = S(Y, r);
            return (0, a.jsx)(w.button, {
                type: "button",
                ...o,
                ref: n,
                onClick: s(t.onClick, () => i.onOpenChange(!1))
            })
        });

    function q(t) {
        return t ? "open" : "closed"
    }
    H.displayName = Y;
    var G = "DialogTitleWarning",
        [J, Q] = (o = {
            contentName: W,
            titleName: K,
            docsSlug: "dialog"
        }, n = l.createContext(o), (r = t => {
            let {
                children: r,
                ...o
            } = t, i = l.useMemo(() => o, Object.values(o));
            return (0, a.jsx)(n.Provider, {
                value: i,
                children: r
            })
        }).displayName = G + "Provider", [r, function(t) {
            let r = l.useContext(n);
            if (r) return r;
            if (void 0 !== o) return o;
            throw Error("`".concat(t, "` must be used within `").concat(G, "`"))
        }]),
        $ = t => {
            let {
                titleId: n
            } = t, r = Q(G), o = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
            return l.useEffect(() => {
                n && (document.getElementById(n) || console.error(o))
            }, [o, n]), null
        },
        ee = t => {
            let {
                contentRef: n,
                descriptionId: r
            } = t, o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(Q("DialogDescriptionWarning").contentName, "}.");
            return l.useEffect(() => {
                var t;
                let i = null == (t = n.current) ? void 0 : t.getAttribute("aria-describedby");
                r && i && (document.getElementById(r) || console.warn(o))
            }, [o, n, r]), null
        };

    function et(t, n) {
        if ("function" == typeof t) return t(n);
        null != t && (t.current = n)
    }
    t.s(["C", 0, H, "D", 0, X, "O", 0, I, "P", 0, M, "R", 0, D, "T", 0, z, "a", 0, O, "b", 0, F], 620088);
    var en = Symbol("radix.slottable");

    function er(t) {
        return l.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === en
    }
    var eo = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((t, n) => {
            var r, o;
            let i, u, c, s = (o = r = "Primitive.".concat(n), (i = l.forwardRef((t, n) => {
                    let {
                        children: r,
                        ...o
                    } = t;
                    if (l.isValidElement(r)) {
                        var i, a;
                        let t, u = (t = null == (i = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : i.get) && "isReactWarning" in t && t.isReactWarning ? r.ref : (t = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in t && t.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                            c = function(t, n) {
                                let r = {
                                    ...n
                                };
                                for (let o in n) {
                                    let i = t[o],
                                        l = n[o];
                                    /^on[A-Z]/.test(o) ? i && l ? r[o] = function() {
                                        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                        let o = l(...n);
                                        return i(...n), o
                                    } : i && (r[o] = i) : "style" === o ? r[o] = {
                                        ...i,
                                        ...l
                                    } : "className" === o && (r[o] = [i, l].filter(Boolean).join(" "))
                                }
                                return {
                                    ...t,
                                    ...r
                                }
                            }(o, r.props);
                        return r.type !== l.Fragment && (c.ref = n ? function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return t => {
                                let r = !1,
                                    o = n.map(n => {
                                        let o = et(n, t);
                                        return r || "function" != typeof o || (r = !0), o
                                    });
                                if (r) return () => {
                                    for (let t = 0; t < o.length; t++) {
                                        let r = o[t];
                                        "function" == typeof r ? r() : et(n[t], null)
                                    }
                                }
                            }
                        }(n, u) : u), l.cloneElement(r, c)
                    }
                    return l.Children.count(r) > 1 ? l.Children.only(null) : null
                })).displayName = "".concat(o, ".SlotClone"), u = i, (c = l.forwardRef((t, n) => {
                    let {
                        children: r,
                        ...o
                    } = t, i = l.Children.toArray(r), c = i.find(er);
                    if (c) {
                        let t = c.props.children,
                            r = i.map(n => n === c ? l.Children.count(t) > 1 ? l.Children.only(null) : l.isValidElement(t) ? t.props.children : null : n);
                        return (0, a.jsx)(u, {
                            ...o,
                            ref: n,
                            children: l.isValidElement(t) ? l.cloneElement(t, void 0, r) : null
                        })
                    }
                    return (0, a.jsx)(u, {
                        ...o,
                        ref: n,
                        children: r
                    })
                })).displayName = "".concat(r, ".Slot"), c),
                d = l.forwardRef((t, r) => {
                    let {
                        asChild: o,
                        ...i
                    } = t;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, a.jsx)(o ? s : n, {
                        ...i,
                        ref: r
                    })
                });
            return d.displayName = "Primitive.".concat(n), {
                ...t,
                [n]: d
            }
        }, {}),
        ei = Object.freeze({
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
        el = l.forwardRef((t, n) => (0, a.jsx)(eo.span, {
            ...t,
            ref: n,
            style: {
                ...ei,
                ...t.style
            }
        }));
    el.displayName = "VisuallyHidden", t.s(["V", 0, el], 978352)
}]);

//# debugId=25a58776-e1b1-3c86-3af5-ab498310f242
//# sourceMappingURL=07sgnb1_i44zw.js.map
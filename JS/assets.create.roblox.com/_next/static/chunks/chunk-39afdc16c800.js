;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "cd7b0019-c311-365e-6203-27b8dab89b53")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 174617, e => {
    "use strict";
    "u" > typeof window && window.document && window.document.createElement, e.s(["composeEventHandlers", 0, function(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(n) {
            if (null == e || e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
        }
    }])
}, 508785, e => {
    "use strict";
    e.i(711300), e.i(634203), e.i(35877);
    var t = e.i(416340),
        r = e.i(608652),
        n = e.i(78892),
        o = e.i(76992),
        l = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let i = e + "CollectionProvider",
            [a, s] = (0, r.createContextScope)(i),
            [u, c] = a(i, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: r,
                    children: n
                } = e, o = t.default.useRef(null), i = t.default.useRef(new Map).current;
                return (0, l.jsx)(u, {
                    scope: r,
                    itemMap: i,
                    collectionRef: o,
                    children: n
                })
            };
        d.displayName = i;
        let f = e + "CollectionSlot",
            m = (0, o.createSlot)(f),
            p = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: o
                } = e, i = c(f, r), a = (0, n.useComposedRefs)(t, i.collectionRef);
                return (0, l.jsx)(m, {
                    ref: a,
                    children: o
                })
            });
        p.displayName = f;
        let v = e + "CollectionItemSlot",
            y = "data-radix-collection-item",
            b = (0, o.createSlot)(v),
            h = t.default.forwardRef((e, r) => {
                let {
                    scope: o,
                    children: i,
                    ...a
                } = e, s = t.default.useRef(null), u = (0, n.useComposedRefs)(r, s), d = c(v, o);
                return t.default.useEffect(() => (d.itemMap.set(s, {
                    ref: s,
                    ...a
                }), () => void d.itemMap.delete(s))), (0, l.jsx)(b, {
                    ...{
                        [y]: ""
                    },
                    ref: u,
                    children: i
                })
            });
        return h.displayName = v, [{
            Provider: d,
            Slot: p,
            ItemSlot: h
        }, function(r) {
            let n = c(e + "CollectionConsumer", r);
            return t.default.useCallback(() => {
                let e = n.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(y, "]")));
                return Array.from(n.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [n.collectionRef, n.itemMap])
        }, s]
    }])
}, 974539, e => {
    "use strict";
    var t = e.i(416340);
    e.i(221628);
    var r = t.createContext(void 0);
    e.s(["useDirection", 0, function(e) {
        let n = t.useContext(r);
        return e || n || "ltr"
    }])
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(78892),
        n = e.i(723570),
        o = e => {
            var o, i, a;
            let s, u, {
                    present: c,
                    children: d
                } = e,
                f = function(e) {
                    var r, o;
                    let [i, a] = t.useState(), s = t.useRef(null), u = t.useRef(e), c = t.useRef("none"), [d, f] = (r = e ? "mounted" : "unmounted", o = {
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
                        let r = o[e][t];
                        return null != r ? r : e
                    }, r));
                    return t.useEffect(() => {
                        let e = l(s.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), (0, n.useLayoutEffect)(() => {
                        let t = s.current,
                            r = u.current;
                        if (r !== e) {
                            let n = c.current,
                                o = l(t);
                            e ? f("MOUNT") : "none" === o || (null == t ? void 0 : t.display) === "none" ? f("UNMOUNT") : r && n !== o ? f("ANIMATION_OUT") : f("UNMOUNT"), u.current = e
                        }
                    }, [e, f]), (0, n.useLayoutEffect)(() => {
                        if (i) {
                            var e;
                            let t, r = null != (e = i.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = l(s.current).includes(CSS.escape(e.animationName));
                                    if (e.target === i && n && (f("ANIMATION_END"), !u.current)) {
                                        let e = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = r.setTimeout(() => {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = e)
                                        })
                                    }
                                },
                                o = e => {
                                    e.target === i && (c.current = l(s.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", n), i.addEventListener("animationend", n), () => {
                                r.clearTimeout(t), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", n), i.removeEventListener("animationend", n)
                            }
                        }
                        f("ANIMATION_END")
                    }, [i, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: t.useCallback(e => {
                            s.current = e ? getComputedStyle(e) : null, a(e)
                        }, [])
                    }
                }(c),
                m = "function" == typeof d ? d({
                    present: f.isPresent
                }) : t.Children.only(d),
                p = (0, r.useComposedRefs)(f.ref, (u = (s = null == (i = Object.getOwnPropertyDescriptor((o = m).props, "ref")) ? void 0 : i.get) && "isReactWarning" in s && s.isReactWarning) ? o.ref : (u = (s = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning) ? o.props.ref : o.props.ref || o.ref);
            return "function" == typeof d || f.isPresent ? t.cloneElement(m, {
                ref: p
            }) : null
        };

    function l(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    o.displayName = "Presence", e.s(["Presence", 0, o])
}, 600317, 76992, e => {
    "use strict";
    var t = e.i(416340);
    e.i(149285);
    var r = e.i(78892),
        n = e.i(221628);

    function o(e) {
        var o;
        let l, a = (o = e, (l = t.forwardRef((e, n) => {
                let {
                    children: o,
                    ...l
                } = e;
                if (t.isValidElement(o)) {
                    var i, a, s;
                    let e, u, c = (u = (e = null == (a = Object.getOwnPropertyDescriptor((i = o).props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning) ? i.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                        d = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let o = e[n],
                                    l = t[n];
                                /^on[A-Z]/.test(n) ? o && l ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    let n = l(...t);
                                    return o(...t), n
                                } : o && (r[n] = o) : "style" === n ? r[n] = {
                                    ...o,
                                    ...l
                                } : "className" === n && (r[n] = [o, l].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(l, o.props);
                    return o.type !== t.Fragment && (d.ref = n ? (0, r.composeRefs)(n, c) : c), t.cloneElement(o, d)
                }
                return t.Children.count(o) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(o, ".SlotClone"), l),
            s = t.forwardRef((e, r) => {
                let {
                    children: o,
                    ...l
                } = e, s = t.Children.toArray(o), u = s.find(i);
                if (u) {
                    let e = u.props.children,
                        o = s.map(r => r !== u ? r : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, n.jsx)(a, {
                        ...l,
                        ref: r,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, o) : null
                    })
                }
                return (0, n.jsx)(a, {
                    ...l,
                    ref: r,
                    children: o
                })
            });
        return s.displayName = "".concat(e, ".Slot"), s
    }
    var l = Symbol("radix.slottable");

    function i(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === l
    }
    e.s(["createSlot", 0, o], 76992);
    var a = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, r) => {
        let l = o("Primitive.".concat(r)),
            i = t.forwardRef((e, t) => {
                let {
                    asChild: o,
                    ...i
                } = e;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, n.jsx)(o ? l : r, {
                    ...i,
                    ref: t
                })
            });
        return i.displayName = "Primitive.".concat(r), {
            ...e,
            [r]: i
        }
    }, {});
    e.s(["Primitive", 0, a], 600317)
}, 142953, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(174617),
        n = e.i(508785),
        o = e.i(78892),
        l = e.i(608652),
        i = e.i(40266),
        a = e.i(600317),
        s = e.i(886449),
        u = e.i(199786),
        c = e.i(974539),
        d = e.i(221628),
        f = "rovingFocusGroup.onEntryFocus",
        m = {
            bubbles: !1,
            cancelable: !0
        },
        p = "RovingFocusGroup",
        [v, y, b] = (0, n.createCollection)(p),
        [h, g] = (0, l.createContextScope)(p, [b]),
        [x, E] = h(p),
        w = t.forwardRef((e, t) => (0, d.jsx)(v.Provider, {
            scope: e.__scopeRovingFocusGroup,
            children: (0, d.jsx)(v.Slot, {
                scope: e.__scopeRovingFocusGroup,
                children: (0, d.jsx)(R, {
                    ...e,
                    ref: t
                })
            })
        }));
    w.displayName = p;
    var R = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: l,
                orientation: i,
                loop: v = !1,
                dir: b,
                currentTabStopId: h,
                defaultCurrentTabStopId: g,
                onCurrentTabStopIdChange: E,
                onEntryFocus: w,
                preventScrollOnEntryFocus: R = !1,
                ...S
            } = e, C = t.useRef(null), N = (0, o.useComposedRefs)(n, C), I = (0, c.useDirection)(b), [T, A] = (0, u.useControllableState)({
                prop: h,
                defaultProp: null != g ? g : null,
                onChange: E,
                caller: p
            }), [P, M] = t.useState(!1), j = (0, s.useCallbackRef)(w), O = y(l), D = t.useRef(!1), [L, F] = t.useState(0);
            return t.useEffect(() => {
                let e = C.current;
                if (e) return e.addEventListener(f, j), () => e.removeEventListener(f, j)
            }, [j]), (0, d.jsx)(x, {
                scope: l,
                orientation: i,
                dir: I,
                loop: v,
                currentTabStopId: T,
                onItemFocus: t.useCallback(e => A(e), [A]),
                onItemShiftTab: t.useCallback(() => M(!0), []),
                onFocusableItemAdd: t.useCallback(() => F(e => e + 1), []),
                onFocusableItemRemove: t.useCallback(() => F(e => e - 1), []),
                children: (0, d.jsx)(a.Primitive.div, {
                    tabIndex: P || 0 === L ? -1 : 0,
                    "data-orientation": i,
                    ...S,
                    ref: N,
                    style: {
                        outline: "none",
                        ...e.style
                    },
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, () => {
                        D.current = !0
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, e => {
                        let t = !D.current;
                        if (e.target === e.currentTarget && t && !P) {
                            let t = new CustomEvent(f, m);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = O().filter(e => e.focusable);
                                k([e.find(e => e.active), e.find(e => e.id === T), ...e].filter(Boolean).map(e => e.ref.current), R)
                            }
                        }
                        D.current = !1
                    }),
                    onBlur: (0, r.composeEventHandlers)(e.onBlur, () => M(!1))
                })
            })
        }),
        S = "RovingFocusGroupItem",
        C = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: o,
                focusable: l = !0,
                active: s = !1,
                tabStopId: u,
                children: c,
                ...f
            } = e, m = (0, i.useId)(), p = u || m, b = E(S, o), h = b.currentTabStopId === p, g = y(o), {
                onFocusableItemAdd: x,
                onFocusableItemRemove: w,
                currentTabStopId: R
            } = b;
            return t.useEffect(() => {
                if (l) return x(), () => w()
            }, [l, x, w]), (0, d.jsx)(v.ItemSlot, {
                scope: o,
                id: p,
                focusable: l,
                active: s,
                children: (0, d.jsx)(a.Primitive.span, {
                    tabIndex: h ? 0 : -1,
                    "data-orientation": b.orientation,
                    ...f,
                    ref: n,
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, e => {
                        l ? b.onItemFocus(p) : e.preventDefault()
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, () => b.onItemFocus(p)),
                    onKeyDown: (0, r.composeEventHandlers)(e.onKeyDown, e => {
                        if ("Tab" === e.key && e.shiftKey) return void b.onItemShiftTab();
                        if (e.target !== e.currentTarget) return;
                        let t = function(e, t, r) {
                            var n;
                            let o = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                            if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return N[o]
                        }(e, b.orientation, b.dir);
                        if (void 0 !== t) {
                            if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                            e.preventDefault();
                            let o = g().filter(e => e.focusable).map(e => e.ref.current);
                            if ("last" === t) o.reverse();
                            else if ("prev" === t || "next" === t) {
                                var r, n;
                                "prev" === t && o.reverse();
                                let l = o.indexOf(e.currentTarget);
                                o = b.loop ? (r = o, n = l + 1, r.map((e, t) => r[(n + t) % r.length])) : o.slice(l + 1)
                            }
                            setTimeout(() => k(o))
                        }
                    }),
                    children: "function" == typeof c ? c({
                        isCurrentTabStop: h,
                        hasTabStop: null != R
                    }) : c
                })
            })
        });
    C.displayName = S;
    var N = {
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
    e.s(["Item", 0, C, "Root", 0, w, "createRovingFocusGroupScope", 0, g])
}, 199786, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(723570);
    t[" useEffectEvent ".trim().toString()], t[" useInsertionEffect ".trim().toString()];
    var n = t[" useInsertionEffect ".trim().toString()] || r.useLayoutEffect;
    Symbol("RADIX:SYNC_STATE"), e.s(["useControllableState", 0, function(e) {
        let {
            prop: r,
            defaultProp: o,
            onChange: l = () => {},
            caller: i
        } = e, [a, s, u] = function(e) {
            let {
                defaultProp: r,
                onChange: o
            } = e, [l, i] = t.useState(r), a = t.useRef(l), s = t.useRef(o);
            return n(() => {
                s.current = o
            }, [o]), t.useEffect(() => {
                if (a.current !== l) {
                    var e;
                    null == (e = s.current) || e.call(s, l), a.current = l
                }
            }, [l, a]), [l, i, s]
        }({
            defaultProp: o,
            onChange: l
        }), c = void 0 !== r, d = c ? r : a;
        {
            let e = t.useRef(void 0 !== r);
            t.useEffect(() => {
                let t = e.current;
                if (t !== c) {
                    let e = c ? "controlled" : "uncontrolled";
                    console.warn("".concat(i, " is changing from ").concat(t ? "controlled" : "uncontrolled", " to ").concat(e, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                }
                e.current = c
            }, [c, i])
        }
        return [d, t.useCallback(e => {
            if (c) {
                let n = "function" == typeof e ? e(r) : e;
                if (n !== r) {
                    var t;
                    null == (t = u.current) || t.call(u, n)
                }
            } else s(e)
        }, [c, r, s, u])]
    }], 199786)
}, 300792, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["usePrevious", 0, function(e) {
        let r = t.useRef({
            value: e,
            previous: e
        });
        return t.useMemo(() => (r.current.value !== e && (r.current.previous = r.current.value, r.current.value = e), r.current.previous), [e])
    }])
}, 692166, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(723570);
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
                    let l = t[0];
                    if ("borderBoxSize" in l) {
                        let e = l.borderBoxSize,
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
}, 685245, e => {
    "use strict";
    var t = e.i(253923),
        r = e.i(454778),
        n = e.i(197649),
        o = e.i(416340),
        l = e.i(78892),
        i = e.i(608652),
        a = e.i(174617),
        s = e.i(199786),
        u = e.i(300792),
        c = e.i(692166),
        d = e.i(169525),
        f = e.i(600317),
        m = e.i(221628),
        p = "Checkbox",
        [v, y] = (0, i.createContextScope)(p),
        [b, h] = v(p);

    function g(e) {
        let {
            __scopeCheckbox: t,
            checked: r,
            children: n,
            defaultChecked: l,
            disabled: i,
            form: a,
            name: u,
            onCheckedChange: c,
            required: d,
            value: f = "on",
            internal_do_not_use_render: v
        } = e, [y, h] = (0, s.useControllableState)({
            prop: r,
            defaultProp: null != l && l,
            onChange: c,
            caller: p
        }), [g, x] = o.useState(null), [E, w] = o.useState(null), R = o.useRef(!1), S = !g || !!a || !!g.closest("form"), C = {
            checked: y,
            disabled: i,
            setChecked: h,
            control: g,
            setControl: x,
            name: u,
            form: a,
            value: f,
            hasConsumerStoppedPropagationRef: R,
            required: d,
            defaultChecked: !k(l) && l,
            isFormControl: S,
            bubbleInput: E,
            setBubbleInput: w
        };
        return (0, m.jsx)(b, {
            scope: t,
            ...C,
            children: "function" == typeof v ? v(C) : n
        })
    }
    var x = "CheckboxTrigger",
        E = o.forwardRef((e, t) => {
            let {
                __scopeCheckbox: r,
                onKeyDown: n,
                onClick: i,
                ...s
            } = e, {
                control: u,
                value: c,
                disabled: d,
                checked: p,
                required: v,
                setControl: y,
                setChecked: b,
                hasConsumerStoppedPropagationRef: g,
                isFormControl: E,
                bubbleInput: w
            } = h(x, r), R = (0, l.useComposedRefs)(t, y), S = o.useRef(p);
            return o.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => b(S.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, b]), (0, m.jsx)(f.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": k(p) ? "mixed" : p,
                "aria-required": v,
                "data-state": I(p),
                "data-disabled": d ? "" : void 0,
                disabled: d,
                value: c,
                ...s,
                ref: R,
                onKeyDown: (0, a.composeEventHandlers)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, a.composeEventHandlers)(i, e => {
                    b(e => !!k(e) || !e), w && E && (g.current = e.isPropagationStopped(), g.current || e.stopPropagation())
                })
            })
        });
    E.displayName = x;
    var w = o.forwardRef((e, t) => {
        let {
            __scopeCheckbox: r,
            name: n,
            checked: o,
            defaultChecked: l,
            required: i,
            disabled: a,
            value: s,
            onCheckedChange: u,
            form: c,
            ...d
        } = e;
        return (0, m.jsx)(g, {
            __scopeCheckbox: r,
            checked: o,
            defaultChecked: l,
            disabled: a,
            required: i,
            onCheckedChange: u,
            name: n,
            form: c,
            value: s,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, m.jsxs)(m.Fragment, {
                    children: [(0, m.jsx)(E, {
                        ...d,
                        ref: t,
                        __scopeCheckbox: r
                    }), n && (0, m.jsx)(N, {
                        __scopeCheckbox: r
                    })]
                })
            }
        })
    });
    w.displayName = p;
    var R = "CheckboxIndicator",
        S = o.forwardRef((e, t) => {
            let {
                __scopeCheckbox: r,
                forceMount: n,
                ...o
            } = e, l = h(R, r);
            return (0, m.jsx)(d.Presence, {
                present: n || k(l.checked) || !0 === l.checked,
                children: (0, m.jsx)(f.Primitive.span, {
                    "data-state": I(l.checked),
                    "data-disabled": l.disabled ? "" : void 0,
                    ...o,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    S.displayName = R;
    var C = "CheckboxBubbleInput",
        N = o.forwardRef((e, t) => {
            let {
                __scopeCheckbox: r,
                ...n
            } = e, {
                control: i,
                hasConsumerStoppedPropagationRef: a,
                checked: s,
                defaultChecked: d,
                required: p,
                disabled: v,
                name: y,
                value: b,
                form: g,
                bubbleInput: x,
                setBubbleInput: E
            } = h(C, r), w = (0, l.useComposedRefs)(t, E), R = (0, u.usePrevious)(s), S = (0, c.useSize)(i);
            o.useEffect(() => {
                if (!x) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !a.current;
                if (R !== s && e) {
                    let r = new Event("click", {
                        bubbles: t
                    });
                    x.indeterminate = k(s), e.call(x, !k(s) && s), x.dispatchEvent(r)
                }
            }, [x, R, s, a]);
            let N = o.useRef(!k(s) && s);
            return (0, m.jsx)(f.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != d ? d : N.current,
                required: p,
                disabled: v,
                name: y,
                value: b,
                form: g,
                ...n,
                tabIndex: -1,
                ref: w,
                style: {
                    ...n.style,
                    ...S,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function k(e) {
        return "indeterminate" === e
    }

    function I(e) {
        return k(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    N.displayName = C;
    let T = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        A = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        P = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        M = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: l,
            className: i,
            isChecked: a,
            isDisabled: s,
            size: u,
            hint: c,
            placement: d,
            onCheckedChange: f,
            id: m,
            ...p
        } = e, v = (0, r.default)(), y = m || v, b = l && o.default.createElement("label", {
            htmlFor: y,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !s && "cursor-pointer")
        }, o.default.createElement("span", {
            className: (0, n.default)(P[u], M[u], "content-emphasis")
        }, l), c && o.default.createElement("span", {
            className: "text-body-medium content-default"
        }, c));
        return o.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", s && "opacity-[0.5]", !s && "cursor-pointer", i)
        }, "End" === d && b, o.default.createElement("div", {
            className: (0, n.default)(A[u])
        }, o.default.createElement(w, {
            "data-slot": "checkbox",
            className: (0, n.default)(T[u], t.interactable, !s && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: y,
            checked: a,
            disabled: s,
            onCheckedChange: f,
            "aria-label": l,
            ...p
        }, o.default.createElement(t.StateLayer, null), o.default.createElement(S, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(T[u], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === d && b)
    }], 685245)
}, 629016, e => {
    "use strict";
    var t = e.i(605836),
        r = e.i(516674),
        n = e.i(416340);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: o,
            description: l,
            position: i = "top-center"
        } = e;
        return n.default.createElement(r.Tooltip, {
            position: i,
            title: o,
            description: l
        }, n.default.createElement(r.TooltipTrigger, {
            asChild: !0
        }, n.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": o,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, n.default.createElement(t.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }])
}, 454778, e => {
    "use strict";
    var t = e.i(416340);
    let r = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            n = (0, t.useRef)();
        return n.current || (r += 1, n.current = "".concat(e).concat(r)), n.current
    }])
}]);

//# debugId=cd7b0019-c311-365e-6203-27b8dab89b53
//# sourceMappingURL=3jrd8kj0yl6iw.js.map
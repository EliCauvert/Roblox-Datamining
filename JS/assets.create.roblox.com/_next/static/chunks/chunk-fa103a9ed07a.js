;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "8fb2c41c-8769-ae72-fea2-e65bd51cce47")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 634130, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(120297),
        r = e.i(859726),
        a = e.i(950020),
        l = e.i(517952),
        i = e.i(179510),
        s = e.i(842769),
        o = e.i(989308),
        u = e.i(546633),
        c = e.i(785517),
        d = "Checkbox",
        [p, f] = (0, r.c)(d),
        [m, v] = p(d);

    function g(e) {
        let {
            __scopeCheckbox: n,
            checked: r,
            children: a,
            defaultChecked: i,
            disabled: s,
            form: o,
            name: u,
            onCheckedChange: p,
            required: f,
            value: v = "on",
            internal_do_not_use_render: g
        } = e, [h, y] = (0, l.f)({
            prop: r,
            defaultProp: null != i && i,
            onChange: p,
            caller: d
        }), [b, E] = t.useState(null), [w, x] = t.useState(null), P = t.useRef(!1), k = !b || !!o || !!b.closest("form"), C = {
            checked: h,
            disabled: s,
            setChecked: y,
            control: b,
            setControl: E,
            name: u,
            form: o,
            value: v,
            hasConsumerStoppedPropagationRef: P,
            required: f,
            defaultChecked: !S(i) && i,
            isFormControl: k,
            bubbleInput: w,
            setBubbleInput: x
        };
        return (0, c.jsx)(m, {
            scope: n,
            ...C,
            children: "function" == typeof g ? g(C) : a
        })
    }
    var h = "CheckboxTrigger",
        y = t.forwardRef((e, r) => {
            let {
                __scopeCheckbox: l,
                onKeyDown: i,
                onClick: s,
                ...o
            } = e, {
                control: d,
                value: p,
                disabled: f,
                checked: m,
                required: g,
                setControl: y,
                setChecked: b,
                hasConsumerStoppedPropagationRef: E,
                isFormControl: w,
                bubbleInput: x
            } = v(h, l), P = (0, n.j)(r, y), C = t.useRef(m);
            return t.useEffect(() => {
                let e = null == d ? void 0 : d.form;
                if (e) {
                    let t = () => b(C.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [d, b]), (0, c.jsx)(u.f.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": S(m) ? "mixed" : m,
                "aria-required": g,
                "data-state": k(m),
                "data-disabled": f ? "" : void 0,
                disabled: f,
                value: p,
                ...o,
                ref: P,
                onKeyDown: (0, a.f)(i, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, a.f)(s, e => {
                    b(e => !!S(e) || !e), x && w && (E.current = e.isPropagationStopped(), E.current || e.stopPropagation())
                })
            })
        });
    y.displayName = h;
    var b = t.forwardRef((e, t) => {
        let {
            __scopeCheckbox: n,
            name: r,
            checked: a,
            defaultChecked: l,
            required: i,
            disabled: s,
            value: o,
            onCheckedChange: u,
            form: d,
            ...p
        } = e;
        return (0, c.jsx)(g, {
            __scopeCheckbox: n,
            checked: a,
            defaultChecked: l,
            disabled: s,
            required: i,
            onCheckedChange: u,
            name: r,
            form: d,
            value: o,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: r
                } = e;
                return (0, c.jsxs)(c.Fragment, {
                    children: [(0, c.jsx)(y, {
                        ...p,
                        ref: t,
                        __scopeCheckbox: n
                    }), r && (0, c.jsx)(P, {
                        __scopeCheckbox: n
                    })]
                })
            }
        })
    });
    b.displayName = d;
    var E = "CheckboxIndicator",
        w = t.forwardRef((e, t) => {
            let {
                __scopeCheckbox: n,
                forceMount: r,
                ...a
            } = e, l = v(E, n);
            return (0, c.jsx)(o.f, {
                present: r || S(l.checked) || !0 === l.checked,
                children: (0, c.jsx)(u.f.span, {
                    "data-state": k(l.checked),
                    "data-disabled": l.disabled ? "" : void 0,
                    ...a,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    w.displayName = E;
    var x = "CheckboxBubbleInput",
        P = t.forwardRef((e, r) => {
            let {
                __scopeCheckbox: a,
                ...l
            } = e, {
                control: o,
                hasConsumerStoppedPropagationRef: d,
                checked: p,
                defaultChecked: f,
                required: m,
                disabled: g,
                name: h,
                value: y,
                form: b,
                bubbleInput: E,
                setBubbleInput: w
            } = v(x, a), P = (0, n.j)(r, w), k = (0, i.f)(p), C = (0, s.f)(o);
            t.useEffect(() => {
                if (!E) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !d.current;
                if (k !== p && e) {
                    let n = new Event("click", {
                        bubbles: t
                    });
                    E.indeterminate = S(p), e.call(E, !S(p) && p), E.dispatchEvent(n)
                }
            }, [E, k, p, d]);
            let T = t.useRef(!S(p) && p);
            return (0, c.jsx)(u.f.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != f ? f : T.current,
                required: m,
                disabled: g,
                name: h,
                value: y,
                form: b,
                ...l,
                tabIndex: -1,
                ref: P,
                style: {
                    ...l.style,
                    ...C,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function S(e) {
        return "indeterminate" === e
    }

    function k(e) {
        return S(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    P.displayName = x, e.s(["S", 0, w, "F", 0, b])
}, 989308, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(120297),
        r = e.i(206350),
        a = e => {
            var a, i, s;
            let o, u, {
                    present: c,
                    children: d
                } = e,
                p = function(e) {
                    var n, a;
                    let [i, s] = t.useState(), o = t.useRef(null), u = t.useRef(e), c = t.useRef("none"), [d, p] = (n = e ? "mounted" : "unmounted", a = {
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
                        let n = a[e][t];
                        return null != n ? n : e
                    }, n));
                    return t.useEffect(() => {
                        let e = l(o.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), (0, r.f)(() => {
                        let t = o.current,
                            n = u.current;
                        if (n !== e) {
                            let r = c.current,
                                a = l(t);
                            e ? p("MOUNT") : "none" === a || (null == t ? void 0 : t.display) === "none" ? p("UNMOUNT") : n && r !== a ? p("ANIMATION_OUT") : p("UNMOUNT"), u.current = e
                        }
                    }, [e, p]), (0, r.f)(() => {
                        if (i) {
                            var e;
                            let t, n = null != (e = i.ownerDocument.defaultView) ? e : window,
                                r = e => {
                                    let r = l(o.current).includes(CSS.escape(e.animationName));
                                    if (e.target === i && r && (p("ANIMATION_END"), !u.current)) {
                                        let e = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = n.setTimeout(() => {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = e)
                                        })
                                    }
                                },
                                a = e => {
                                    e.target === i && (c.current = l(o.current))
                                };
                            return i.addEventListener("animationstart", a), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r), () => {
                                n.clearTimeout(t), i.removeEventListener("animationstart", a), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                            }
                        }
                        p("ANIMATION_END")
                    }, [i, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: t.useCallback(e => {
                            o.current = e ? getComputedStyle(e) : null, s(e)
                        }, [])
                    }
                }(c),
                f = "function" == typeof d ? d({
                    present: p.isPresent
                }) : t.Children.only(d),
                m = (0, n.j)(p.ref, (u = (o = null == (i = Object.getOwnPropertyDescriptor((a = f).props, "ref")) ? void 0 : i.get) && "isReactWarning" in o && o.isReactWarning) ? a.ref : (u = (o = null == (s = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : s.get) && "isReactWarning" in o && o.isReactWarning) ? a.props.ref : a.props.ref || a.ref);
            return "function" == typeof d || p.isPresent ? t.cloneElement(f, {
                ref: m
            }) : null
        };

    function l(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    a.displayName = "Presence", e.s(["f", 0, a])
}, 336268, e => {
    "use strict";
    var t = e.i(415858);
    e.s(["f", () => t.a])
}, 330052, e => {
    "use strict";
    var t = e.i(820520),
        n = e.i(328535),
        r = e.i(526448),
        a = e.i(335020),
        l = e.i(643766),
        i = e.i(634130);
    let s = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        o = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        u = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        c = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["f", 0, e => {
        var d, p, f, m;
        let {
            label: v,
            className: g,
            isChecked: h,
            isDisabled: y,
            size: b,
            hint: E,
            placement: w,
            onCheckedChange: x,
            id: P,
            "aria-describedby": S,
            ...k
        } = e, C = (0, l.useContext)(r.i), T = null != (d = null != (p = null == C ? void 0 : C.size) ? p : b) ? d : "Medium", N = null != (f = null != (m = null == C ? void 0 : C.placement) ? m : w) ? f : "Start", L = y || (null == C ? void 0 : C.isDisabled), A = (0, n.f)(), O = P || A, M = C && v && E ? "".concat(O, "Hint") : void 0, F = v && l.default.createElement("label", {
            htmlFor: O,
            className: (0, a.U)("flex flex-col grow-1 gap-xsmall", !L && "cursor-pointer")
        }, l.default.createElement("span", {
            className: (0, a.U)(u[T], c[T], "content-emphasis")
        }, v), E && l.default.createElement("span", {
            id: M,
            className: (0, a.U)(C ? u[T] : "text-body-medium", "content-default")
        }, E));
        return l.default.createElement("div", {
            className: (0, a.U)("foundation-web-checkbox flex gap-medium", L && "opacity-[0.5]", !L && "cursor-pointer", g)
        }, "End" === N && F, l.default.createElement("div", {
            className: (0, a.U)(o[T])
        }, l.default.createElement(i.F, {
            "data-slot": "checkbox",
            className: (0, a.U)(s[T], t.Y, !L && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: O,
            checked: h,
            disabled: L,
            onCheckedChange: x,
            "aria-label": v,
            "aria-describedby": [S, M].filter(Boolean).join(" ") || void 0,
            ...k
        }, l.default.createElement(t.v, null), l.default.createElement(i.S, {
            "data-slot": "checkbox-indicator",
            className: (0, a.U)(s[T], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === N && F)
    }])
}, 466537, e => {
    "use strict";
    var t = e.i(335020),
        n = e.i(643766),
        r = e.i(637068);
    let a = new Set(["_self", "_parent", "_top"]),
        l = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        i = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        s = (0, n.forwardRef)((e, s) => {
            var o, u, c;
            let {
                children: d,
                className: p,
                size: f,
                color: m = "Emphasis",
                variant: v = "Standalone",
                underline: g = "hover",
                isExternal: h,
                asChild: y,
                ...b
            } = e, E = (u = null != (o = b.as) ? o : "a", c = "button" === b.as ? void 0 : b.target, void 0 !== h ? h : "button" !== u && void 0 !== c && !a.has(c)), w = (0, t.U)("foundation-web-link", "button" === b.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === v || E) && "inline-flex items-center gap-xsmall", void 0 !== f && l[f], i[m], "always" === g ? "underline" : "no-underline", "hover" === g && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", p), x = E ? n.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.U)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (y) {
                let {
                    as: e,
                    ...t
                } = b, a = n.default.Children.only(d);
                return n.default.isValidElement(a) ? n.default.createElement(r.M, {
                    ref: s,
                    ...t,
                    className: w
                }, n.default.cloneElement(a, {}, n.default.createElement(n.default.Fragment, null, a.props.children, x))) : null
            }
            if ("button" === b.as) {
                let {
                    as: e,
                    type: t,
                    ...r
                } = b;
                return n.default.createElement("button", {
                    ref: s,
                    type: null != t ? t : "button",
                    ...r,
                    className: w
                }, d, x)
            }
            let {
                as: P,
                ...S
            } = b;
            return n.default.createElement("a", {
                ref: s,
                ...S,
                className: w
            }, d, x)
        });
    s.displayName = "Link", e.s(["f", 0, s])
}, 526448, e => {
    "use strict";
    var t = e.i(643766);
    let n = (0, t.createContext)(null),
        r = (0, t.createContext)(null),
        a = (0, t.createContext)(null);
    e.s(["i", 0, n, "f", 0, a, "U", 0, r])
}, 12246, e => {
    "use strict";
    var t = e.i(225226),
        n = e.i(643766),
        r = e.i(26734);
    e.i(785517), e.i(860663);
    var a = (0, n.createContext)({
        ref: {
            current: null
        },
        enqueue: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        },
        close: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        }
    });
    e.s(["U", 0, function(e) {
        var l, i, s, o, u = e.children,
            c = (0, t.a)(e, ["children"]),
            d = (0, n.useRef)(null),
            p = (0, n.useState)(!1),
            f = p[0],
            m = p[1],
            v = (0, n.useState)([]),
            g = v[0],
            h = v[1],
            y = (0, n.useCallback)(function(e, n) {
                void 0 === e && (e = {}), void 0 === n && (n = function() {
                    return !0
                }), h(function(r) {
                    return (0, t.b)((0, t.b)([], r, !0), [{
                        props: e,
                        shouldClose: n
                    }], !1)
                })
            }, [h]),
            b = (0, n.useCallback)(function() {
                m(!1)
            }, [m]);
        (0, n.useEffect)(function() {
            g.length > 0 && m(!0)
        }, [g.length]);
        var E = (0, n.useMemo)(function() {
            return {
                ref: d,
                enqueue: y,
                close: b
            }
        }, [b, y]);
        return n.default.createElement(n.default.Fragment, null, n.default.createElement(a.Provider, {
            value: E
        }, u), n.default.createElement(r.S, (0, t._)({}, (null == (l = g[0]) ? void 0 : l.props) || {}, c, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (s = null == (i = g[0]) ? void 0 : i.props) ? void 0 : s.TransitionProps) || {}), {
                onExited: function(e) {
                    var n, r, a, l;
                    h(function(e) {
                        var n = e.slice(1);
                        return (0, t.b)([], n, !0)
                    }), (null == (r = null == (n = g[0]) ? void 0 : n.props.TransitionProps) ? void 0 : r.onExited) && (null == (l = null == (a = g[0]) ? void 0 : a.props.TransitionProps) || l.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var n, r, a;
                (null == (n = g[0]) ? void 0 : n.shouldClose(t)) && m(!1), (null == (r = g[0]) ? void 0 : r.props.onClose) && (null == (a = g[0]) || a.props.onClose(e, t))
            },
            open: f
        }), null == (o = g[0]) ? void 0 : o.props.children))
    }, "J", 0, function() {
        var e = (0, n.useContext)(a);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 719392, e => {
    "use strict";
    var t = e.i(463146);

    function n(e, t) {
        let {
            pages: n,
            pageParams: r
        } = t, a = n.length - 1;
        return n.length > 0 ? e.getNextPageParam(n[a], n, r[a], r) : void 0
    }

    function r(e, t) {
        var n;
        let {
            pages: r,
            pageParams: a
        } = t;
        return r.length > 0 ? null == (n = e.getPreviousPageParam) ? void 0 : n.call(e, r[0], r, a[0], a) : void 0
    }
    e.s(["B", 0, function(e, t) {
        return !!t && null != n(e, t)
    }, "u", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != r(e, t)
    }, "T", 0, function(e) {
        return {
            onFetch: (a, l) => {
                var i, s, o, u, c;
                let d = a.options,
                    p = null == (o = a.fetchOptions) || null == (s = o.meta) || null == (i = s.fetchMore) ? void 0 : i.direction,
                    f = (null == (u = a.state.data) ? void 0 : u.pages) || [],
                    m = (null == (c = a.state.data) ? void 0 : c.pageParams) || [],
                    v = {
                        pages: [],
                        pageParams: []
                    },
                    g = 0,
                    h = async () => {
                        let l = !1,
                            i = (0, t.W)(a.options, a.fetchOptions),
                            s = async (e, n, r) => {
                                let s;
                                if (l) return Promise.reject();
                                if (null == n && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(s = {
                                        client: a.client,
                                        queryKey: a.queryKey,
                                        pageParam: n,
                                        direction: r ? "backward" : "forward",
                                        meta: a.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (a.signal.aborted ? l = !0 : a.signal.addEventListener("abort", () => {
                                            l = !0
                                        }), a.signal)
                                    }), s),
                                    u = await i(o),
                                    {
                                        maxPages: c
                                    } = a.options,
                                    d = r ? t.R : t.E;
                                return {
                                    pages: d(e.pages, u, c),
                                    pageParams: d(e.pageParams, n, c)
                                }
                            };
                        if (p && f.length) {
                            let e = "backward" === p,
                                t = {
                                    pages: f,
                                    pageParams: m
                                },
                                a = (e ? r : n)(d, t);
                            v = await s(t, a, e)
                        } else {
                            let t = null != e ? e : f.length;
                            do {
                                var o;
                                let e = 0 === g ? null != (o = m[0]) ? o : d.initialPageParam : n(d, v);
                                if (g > 0 && null == e) break;
                                v = await s(v, e), g++
                            } while (g < t)
                        }
                        return v
                    };
                a.options.persister ? a.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = a.options).persister) ? void 0 : e.call(t, h, {
                        client: a.client,
                        queryKey: a.queryKey,
                        meta: a.options.meta,
                        signal: a.signal
                    }, l)
                } : a.fetchFn = h
            }
        }
    }])
}, 406407, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "advertiser-publisher-experience",
        name: "adsActivityAnnotationsEnabled",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 523426, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "anti-cheat",
        name: "enhancedAntiCheatAccess",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 245299, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "collaborative-tools",
        name: "enableEnvironments",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 159022, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "creator-compute",
        name: "enableComputeFunctions",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 846130, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportAccountTranslationPreference",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1
        }),
        a = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportTicketTranslation",
            defaultValue: !1
        }),
        l = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1
        }),
        i = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1
        }),
        s = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1
        }),
        o = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCategoryChange",
            defaultValue: !1
        }),
        u = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportSpamManagement",
            defaultValue: !1
        }),
        c = (0, t.e)({
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1
        });
    e.s(["E", 0, c, "w", 0, l, "k", 0, r, "Z", 0, n, "n", 0, s, "N", 0, o, "z", 0, i, "_", 0, u, "b", 0, a])
}, 787617, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.e)({
            namespace: "creator-platform",
            name: "isCreationsNavigationReorderEnabled",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "creator-platform",
            name: "tryOnWebButtonEnabled",
            defaultValue: !1
        });
    e.s(["a", 0, n, "K", 0, r])
}, 481186, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "extended-services",
        name: "isQueueServiceAnalyticsEnabled",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 886525, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "game-engine-streaming",
        name: "enableExperienceLaunchTimeChart",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 82899, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "leaderboards",
        name: "isLeaderboardConfigsEnabled",
        defaultValue: !0
    });
    e.s(["f", 0, t])
}, 494192, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "preset-chat",
        name: "presetChatEnabled",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 401263, 884213, e => {
    "use strict";
    var t = e.i(643766);
    let n = /{(.+?)}/g,
        r = (e, t) => void 0 === t || 0 === Object.keys(t).length ? e : e.replace(n, (e, n) => {
            var r;
            return null != (r = t[n]) ? r : "{".concat(n, "}")
        });
    e.s(["f", 0, r], 884213);
    let a = /{(.+?)}/,
        l = /({.+?})/g,
        i = /^[a-zA-Z0-9-]+\.(?:capture-loopback\.)?chromatic\.com$/,
        s = /(?:^|\.)robloxlabs\.com$/,
        o = () => {
            let e, t = i.test(window.location.hostname),
                n = window.location.hostname.includes("localhost"),
                r = "string" == typeof(e = window.location.hostname) && s.test(e);
            return {
                isSSR: !1,
                isAllowed: t || n || r,
                isDangerous: t || r,
                preferLoadedTranslations: r
            }
        },
        u = (e, t) => t.isDangerous ? "[!!".concat(e, "!!]") : e;
    var c = e.i(730530);
    e.s(["f", 0, e => {
        let {
            ready: n,
            translate: i,
            translateHTML: s,
            translateWithNamespace: d,
            translateWithNamespaceHTML: p
        } = e, f = (0, t.useMemo)(() => ({
            ready: n,
            translate: i,
            translateHTML: s,
            translateWithNamespace: d,
            translateWithNamespaceHTML: p
        }), [n, i, s, d, p]);
        return (0, t.useMemo)(() => {
            let e = {
                ready: f.ready,
                translate: (0, c.O)(f),
                translateHTML: (0, c.t)(f),
                translateWithNamespace: f.translateWithNamespace,
                translateWithNamespaceHTML: f.translateWithNamespaceHTML
            };
            return {
                ...e,
                tPendingTranslation: (e => {
                    let {
                        ready: t,
                        translate: n
                    } = e;
                    return (e, a, l, i, s) => {
                        let c = o();
                        if (!c.isAllowed) {
                            let t = n(l, i);
                            return t || ((null == s ? void 0 : s.fallbackToEnglishWhenMissing) ? r(e, i) : t)
                        }
                        if (c.preferLoadedTranslations && t) {
                            let e = n(l, i);
                            if (e.length > 0) return e
                        }
                        return r(c.preferLoadedTranslations && !t ? e : u(e, c), i)
                    }
                })(e),
                tPendingHtmlTranslation: (e => {
                    let {
                        ready: n,
                        translateHTML: i
                    } = e;
                    return (e, s, c, d, p) => {
                        let f = o();
                        if (!f.isAllowed) return i(c, d, p);
                        if (f.preferLoadedTranslations && n) {
                            let e = i(c, d, p);
                            if ("" !== e) return e
                        }
                        return ((e, n, i) => {
                            let s, o;
                            if (void 0 === n && void 0 === i) return e;
                            let {
                                stringArgs: u,
                                htmlArgs: c
                            } = (s = {}, o = {}, void 0 === i || Object.entries(i).forEach(e => {
                                let [t, n] = e;
                                "string" == typeof n ? s[t] = n : o[t] = n
                            }), {
                                stringArgs: s,
                                htmlArgs: o
                            }), d = r(e, u), p = d.split(l).filter(e => !!e);
                            if (1 === p.length) return d;
                            let f = [...p];
                            if (0 !== Object.keys(c).length) {
                                let e = p.reduce((e, t, n) => {
                                    let r = a.exec(t);
                                    if (r) {
                                        let t = r[1];
                                        if (Object.hasOwn(c, t)) {
                                            let r = e[t];
                                            if (!r) return Object.assign(e, {
                                                [t]: [n]
                                            });
                                            r.push(n)
                                        }
                                    }
                                    return e
                                }, {});
                                Object.entries(c).forEach(t => {
                                    let [n, r] = t, a = e[n];
                                    a && a.forEach(e => {
                                        f[e] = r
                                    })
                                })
                            }
                            if (!Array.isArray(n) || 0 === n.length) return (0, t.createElement)(t.Fragment, null, ...f);
                            let m = n.reduce((e, t) => {
                                    let {
                                        opening: n,
                                        closing: r,
                                        content: a
                                    } = t;
                                    return Object.assign(e, {
                                        ["{".concat(n, "}")]: {
                                            match: "{".concat(r, "}"),
                                            content: a
                                        }
                                    })
                                }, {}),
                                v = [],
                                g = [],
                                h = [];
                            for (let e = f.shift(); void 0 !== e; e = f.shift())
                                if ("string" == typeof e && a.test(e))
                                    if (Object.hasOwn(m, e)) g.push(e), h.push(e);
                                    else {
                                        let n = g.pop();
                                        if (void 0 !== n) {
                                            let {
                                                match: r,
                                                content: a
                                            } = m[n];
                                            if (e !== r) break;
                                            let l = [],
                                                i = !1;
                                            for (; h.length > 0 && !i;) {
                                                let e = h.pop();
                                                e === n ? i = !0 : l.unshift(e)
                                            }
                                            let s = a(l.every(e => "string" == typeof e) ? l : (0, t.createElement)(t.Fragment, null, ...l));
                                            0 === h.length ? v.push(s) : h.push(s)
                                        }
                                    }
                            else 0 === h.length ? v.push(e) : h.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...v)
                        })(f.preferLoadedTranslations && !n ? e : u(e, f), d, p)
                    }
                })(e)
            }
        }, [f])
    }], 401263)
}, 998683, e => {
    "use strict";
    var t = e.i(805290),
        n = e.i(658867),
        r = e.i(272593);
    let a = new class {
        async getLocale(e) {
            return this.localeApi.v1LocalesGet(e)
        }
        async getUserLocalizationLocusSupportedLocales() {
            return this.localeApi.v1LocalesUserLocalizationLocusSupportedLocalesGet()
        }
        async getSupportedLocalesForCreators(e) {
            return this.localeApi.v1LocalesSupportedLocalesForCreatorsGet(e)
        }
        async getSupportedLocalesForFeature(e) {
            return this.localeApi.v1LocalesSupportedLocalesForFeatureGet(e)
        }
        constructor() {
            (0, t._)(this, "localeApi", void 0), this.localeApi = new n.J((0, r.f)("locale", "bedev1"))
        }
    };
    e.s(["f", 0, a])
}, 927868, e => {
    "use strict";
    e.s(["h", 0, (e, t) => {
        let n = Object.entries(e).find(e => {
            let [, n] = e;
            return n === t
        });
        return n ? n[0] : null
    }, "I", 0, (e, t) => e.includes(t), "s", 0, (e, t) => Object.values(e).includes(t)])
}, 745873, 67262, e => {
    "use strict";
    var t = e.i(785517),
        n = e.i(643766),
        r = e.i(458451),
        a = e.i(533414),
        l = e.i(910272),
        i = e.i(947024),
        s = e.i(602635),
        o = e.i(814975);
    let u = (0, e.i(272593).f)("creator-home-api", "bedev2"),
        c = new i._(u),
        d = new i.k(u),
        p = {
            groupsApi: d,
            userScreenApi: c,
            creatorHomeContentApi: new i.D(u),
            signalsApi: new i.f(u)
        };
    e.s(["f", 0, p], 67262);
    let f = function() {
        let {
            user: e
        } = (0, o.f)();
        return (0, l.f)({
            queryKey: s.E,
            enabled: !!e,
            queryFn: () => {
                let e;
                return e = {
                    surface: i.j.CreatorHub
                }, p.groupsApi.groupsListGroups(e)
            }
        })
    };
    var m = e.i(809576);
    let v = (0, n.createContext)(null);
    e.s(["e", 0, e => {
        let {
            children: l
        } = e, {
            user: i
        } = (0, r.s)(), s = (0, m.h)(), {
            data: o,
            isLoading: u,
            refetch: c
        } = f(), [d, p] = (0, a.j)("creatorHubGroups.".concat(null == i ? void 0 : i.id), null), [g, h] = (0, a.j)("creatorHubGroup.".concat(null == i ? void 0 : i.id), null), [y, b] = (0, a.j)("creatorHubGroupData.".concat(null == i ? void 0 : i.id), {}), E = (0, n.useCallback)(e => {
            h(e);
            let t = null != e ? e : "user";
            b(e => {
                let n = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: r,
                        lastSelected: a
                    } = e[t];
                    "number" != typeof r || Number.isNaN(r) || "number" != typeof a || Number.isNaN(a) || (n.priority = r * (1 + Math.log10(1 + 10 / Math.max(Date.now() - a, 864e5))))
                }
                return {
                    ...e,
                    [t]: n
                }
            })
        }, [h, b]), w = (0, n.useMemo)(() => {
            if (null == o ? void 0 : o.groups) return null == o ? void 0 : o.groups;
            if (null === d) return [];
            try {
                let e = "string" == typeof d ? JSON.parse(d) : d;
                return Array.isArray(e) && e.every(e => "object" == typeof e && null !== e && "id" in e && "number" == typeof e.id && "name" in e && "string" == typeof e.name && "roleSetName" in e && "string" == typeof e.roleSetName) ? e : []
            } catch (e) {
                return []
            }
        }, [d, null == o ? void 0 : o.groups]), x = (0, n.useMemo)(() => {
            var e;
            return g && null != (e = w.find(e => {
                let {
                    id: t
                } = e;
                return t === g
            })) ? e : null
        }, [g, w]), P = null == x ? void 0 : x.id, S = null == i ? void 0 : i.id, {
            data: k,
            error: C,
            isPending: T,
            refetch: N
        } = (0, m.$)(P, S), {
            data: L,
            isPending: A,
            refetch: O
        } = (0, m.V)(P, S), M = (0, n.useCallback)(() => null == P || null == S ? Promise.resolve() : Promise.all([N(), O()]), [O, N, P, S]);
        (0, n.useEffect)(() => {
            (null == i ? void 0 : i.id) && (null == o ? void 0 : o.groups) && !u && p(null == o ? void 0 : o.groups)
        }, [null == o ? void 0 : o.groups, w, u, p, null == i ? void 0 : i.id]);
        let F = (0, n.useMemo)(() => {
            var e;
            return {
                groups: w,
                currentGroup: x,
                groupData: y,
                isFetched: !u && !!S,
                refreshGroups: c,
                setCurrentGroup: E,
                ...s,
                permissions: k,
                isOwner: null != S && (null == L || null == (e = L.owner) ? void 0 : e.userId) === S,
                isPermissionsLoading: null != x && (T || A),
                permissionsError: C,
                refreshPermissions: M
            }
        }, [x, y, w, u, A, T, L, s, k, C, c, M, E, S]);
        return (0, t.jsx)(v.Provider, {
            value: F,
            children: l
        })
    }, "W", 0, () => {
        let e = (0, n.useContext)(v);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "_", 0, () => {
        let e = (0, n.useContext)(v);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 809576, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(463146),
        r = e.i(910272),
        a = e.i(228096),
        l = e.i(458451),
        i = e.i(93714),
        s = e.i(272593);
    let o = new i.A((0, s.f)("groups", "bedev1"));
    async function u(e, t, n) {
        var r;
        return null != (r = (await o.v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet({
            groupId: e,
            entityType: t,
            entityId: n
        })).permissions) ? r : {}
    }
    async function c(e) {
        return u(e, "groups", String(e))
    }
    async function d(e) {
        let t, n = [];
        do {
            var r, a;
            let l = await o.v2GroupsGroupIdEntityTypePermissionsResolvedGet({
                groupId: e,
                entityType: "roles",
                cursor: t
            });
            n.push(...null != (r = l.data) ? r : []), t = null != (a = l.nextPageCursor) ? a : void 0
        } while (t) return n
    }
    var p = e.i(156071);
    let f = new i.A((0, s.f)("groups", "bedev1"));
    async function m(e) {
        var t;
        return null != (t = (await f.v2EntityTypeEntityIdPermissionsResolvedGet({
            entityType: "universes",
            entityId: String(e)
        })).permissions) ? t : {}
    }
    var v = e.i(759283);
    let g = (e, t) => ["groups", e, t, "resolved-permissions"],
        h = (e, t) => ["groups", e, t, "roles", "resolved-permissions"],
        y = (e, t) => ["universe-resolved-permissions", t, void 0 === e ? e : String(e)];
    e.s(["V", 0, function(e, t) {
        return (0, r.f)({
            queryKey: ["groups", e, t, "owner"],
            queryFn: e && t ? () => p.U.getGroupInfo(e) : n.V
        })
    }, "h", 0, function() {
        let {
            user: e
        } = (0, l.s)(), n = (0, a.d)(), r = null == e ? void 0 : e.id, i = (0, t.useCallback)(e => n.fetchQuery({
            queryKey: y(e, r),
            queryFn: () => m(e),
            staleTime: 6e4
        }), [n, r]), s = (0, t.useCallback)(e => n.fetchQuery({
            queryKey: g(e, r),
            queryFn: () => c(e),
            staleTime: 6e4
        }), [n, r]), o = (0, t.useCallback)(e => n.fetchQuery({
            queryKey: h(e, r),
            queryFn: () => d(e),
            staleTime: 6e4
        }), [n, r]);
        return (0, t.useMemo)(() => ({
            fetchGroupPermissions: s,
            fetchRolePermissions: o,
            fetchUniversePermissions: i
        }), [s, o, i])
    }, "$", 0, function(e, t) {
        return (0, r.f)({
            queryKey: g(e, t),
            queryFn: e && t ? () => c(e) : n.V,
            staleTime: 6e4
        })
    }, "K", 0, function(e) {
        let {
            user: t
        } = (0, l.s)(), a = null == t ? void 0 : t.id;
        return (0, r.f)({
            queryKey: h(e, a),
            queryFn: e && a ? () => d(e) : n.V,
            staleTime: 6e4
        })
    }, "v", 0, function(e) {
        let {
            user: t
        } = (0, l.s)(), a = null == t ? void 0 : t.id;
        return (0, r.f)({
            queryKey: y(e, a),
            queryFn: void 0 !== e && e !== v.h ? () => m(e) : n.V,
            staleTime: 6e4
        })
    }], 809576)
}, 250715, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(145724);
    let r = () => n.I,
        a = Symbol("unresolved-flag-context");
    e.s(["u", 0, function() {
        for (var e = arguments.length, l = Array(e), i = 0; i < e; i++) l[i] = arguments[i];
        let [s, o] = (0, t.useState)(!1), [u, c] = (0, t.useState)(null), [d, p] = (0, t.useState)(a), f = (0, t.useSyncExternalStore)(n.s, n.g, r), [m, v = {}] = l, g = Object.values(v).pop();
        return ((0, t.useEffect)(() => {
            let e = new AbortController;
            return async function() {
                try {
                    let t;
                    if (2 === l.length) {
                        let [e, n] = l;
                        t = await e(n)
                    } else {
                        let [e] = l;
                        t = await e()
                    }
                    if (e.signal.aborted) return;
                    c(t), p(g), o(!0)
                } catch (e) {}
            }(), () => {
                e.abort()
            }
        }, [m, g, f]), s && Object.is(d, g)) ? {
            ready: s,
            value: u
        } : {
            ready: !1,
            value: null
        }
    }])
}, 500758, e => {
    "use strict";
    var t = e.i(250715);
    e.s(["f", () => t.u])
}, 725924, e => {
    "use strict";
    let t, n;
    var r, a, l = e.i(643766);
    let i = "u" > typeof Intl,
        s = !i || void 0 === Intl.Locale,
        o = !i || void 0 === Intl.RelativeTimeFormat,
        u = !i || void 0 === Intl.PluralRules,
        c = !i || void 0 === Intl.DisplayNames,
        d = "function" != typeof window.ResizeObserver,
        p = (r = s || o || u || c || d, a = function() {
            return Promise.all([(s ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([o ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, u ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, c ? e.A(951862).then(() => e.A(890267)) : null])), d ? e.A(956827) : null])
        }, t = !1, n = r ? a().catch(() => {}).then(() => {
            t = !0
        }) : null, function() {
            let [e, r] = (0, l.useState)(!n || t);
            return (0, l.useEffect)(() => {
                n && !e && n.then(() => r(!0))
            }, [e]), e
        });
    e.s(["f", 0, p], 725924)
}, 823062, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(544761);
    let r = (0, t.createContext)(null),
        a = [],
        l = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        i = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);

    function s() {
        let e = (0, t.useContext)(r);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }
    let o = () => null;
    e.s(["d", 0, e => {
        var s;
        let {
            children: o,
            unifiedLogger: u,
            pageLoggerConfig: c,
            path: d,
            url: p,
            isReady: f = !0,
            getPageLoadPath: m
        } = e, v = null != (s = null == c ? void 0 : c.tags) ? s : a, g = null == c ? void 0 : c.rosId, h = (0, t.useMemo)(() => ({
            tags: v,
            rosId: g,
            path: d,
            url: p,
            isReady: f
        }), [v, g, d, p, f]), y = (0, t.useRef)(h), b = (0, t.useRef)(h), E = (0, t.useRef)(m);
        (0, t.useLayoutEffect)(() => {
            E.current = m
        }, [m]), (0, t.useLayoutEffect)(() => {
            b.current = h, void 0 === y.current.path && void 0 !== h.path && (y.current = {
                ...y.current,
                path: h.path
            })
        }, [h]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let r;
                if (e instanceof n.W && void 0 !== e.pageContext) return;
                let a = (r = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== r && i.has(r)) ? y.current : b.current,
                    l = "pageload" === e.eventType && E.current ? E.current() : a.path;
                void 0 !== l && (e.parameters = {
                    ...e.parameters,
                    path: l
                }), a.tags.forEach(t => e.addTag(t)), void 0 !== a.rosId && e.addTag("owner: ".concat(a.rosId))
            };
            return l.forEach(t => {
                u.events.on(t, e)
            }), () => {
                l.forEach(t => {
                    u.events.off(t, e)
                })
            }
        }, [u]);
        let w = (0, t.useMemo)(() => ({
            unifiedLogger: u,
            pageContext: h
        }), [u, h]);
        return t.default.createElement(r.Provider, {
            value: w
        }, o)
    }, "W", 0, function() {
        return (0, t.useContext)(r)
    }, "G", 0, e => {
        let {
            unifiedLogger: n,
            pageContext: r
        } = s(), {
            path: a,
            url: l,
            isReady: i
        } = r, u = n.pageSettledTracker, c = (0, t.useSyncExternalStore)(u.subscribe, u.getSnapshot, o);
        (0, t.useEffect)(() => {
            if (!c || c.isNavigating || !i || !a || !l || !e || c.url.split(/[?#]/)[0] !== l.split(/[?#]/)[0]) return;
            let t = new URL(a, window.location.origin).pathname,
                r = requestAnimationFrame(() => {
                    r = requestAnimationFrame(() => {
                        n.logPageSettledEvent({
                            navigationId: c.id,
                            page: t,
                            outcome: e
                        })
                    })
                });
            return () => cancelAnimationFrame(r)
        }, [c, i, l, a, e, n])
    }, "X", 0, s])
}]);

//# debugId=8fb2c41c-8769-ae72-fea2-e65bd51cce47
//# sourceMappingURL=3xi80qnffygjh.js.map
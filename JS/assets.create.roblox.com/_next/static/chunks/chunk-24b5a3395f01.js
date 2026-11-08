;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "55c27df5-b8df-6e75-0747-30cffaa85549")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 886525, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "game-engine-streaming",
        name: "enableExperienceLaunchTimeChart",
        defaultValue: !1
    });
    e.s(["enableExperienceLaunchTimeChart", 0, t])
}, 401263, 884213, e => {
    "use strict";
    var t = e.i(416340);
    let a = /{(.+?)}/g,
        n = (e, t) => void 0 === t || 0 === Object.keys(t).length ? e : e.replace(a, (e, a) => {
            var n;
            return null != (n = t[a]) ? n : "{".concat(a, "}")
        });
    e.s(["default", 0, n], 884213);
    let l = /{(.+?)}/,
        r = /({.+?})/g,
        i = /^[a-zA-Z0-9-]+\.(?:capture-loopback\.)?chromatic\.com$/,
        s = /(?:^|\.)robloxlabs\.com$/,
        o = () => {
            let e, t = i.test(window.location.hostname),
                a = window.location.hostname.includes("localhost"),
                n = "string" == typeof(e = window.location.hostname) && s.test(e);
            return {
                isSSR: !1,
                isAllowed: t || a || n,
                isDangerous: t || n,
                preferLoadedTranslations: n
            }
        },
        d = (e, t) => t.isDangerous ? "[!!".concat(e, "!!]") : e;
    var u = e.i(730530);
    e.s(["default", 0, e => {
        let {
            ready: a,
            translate: i,
            translateHTML: s,
            translateWithNamespace: c,
            translateWithNamespaceHTML: m
        } = e, f = (0, t.useMemo)(() => ({
            ready: a,
            translate: i,
            translateHTML: s,
            translateWithNamespace: c,
            translateWithNamespaceHTML: m
        }), [a, i, s, c, m]);
        return (0, t.useMemo)(() => {
            let e = {
                ready: f.ready,
                translate: (0, u.translationFn)(f),
                translateHTML: (0, u.translateHTMLFn)(f),
                translateWithNamespace: f.translateWithNamespace,
                translateWithNamespaceHTML: f.translateWithNamespaceHTML
            };
            return {
                ...e,
                tPendingTranslation: (e => {
                    let {
                        ready: t,
                        translate: a
                    } = e;
                    return (e, l, r, i) => {
                        let s = o();
                        if (!s.isAllowed) return a(r, i);
                        if (s.preferLoadedTranslations && t) {
                            let e = a(r, i);
                            if (e.length > 0) return e
                        }
                        return n(s.preferLoadedTranslations && !t ? e : d(e, s), i)
                    }
                })(e),
                tPendingHtmlTranslation: (e => {
                    let {
                        ready: a,
                        translateHTML: i
                    } = e;
                    return (e, s, u, c, m) => {
                        let f = o();
                        if (!f.isAllowed) return i(u, c, m);
                        if (f.preferLoadedTranslations && a) {
                            let e = i(u, c, m);
                            if ("" !== e) return e
                        }
                        return ((e, a, i) => {
                            let s, o;
                            if (void 0 === a && void 0 === i) return e;
                            let {
                                stringArgs: d,
                                htmlArgs: u
                            } = (s = {}, o = {}, void 0 === i || Object.entries(i).forEach(e => {
                                let [t, a] = e;
                                "string" == typeof a ? s[t] = a : o[t] = a
                            }), {
                                stringArgs: s,
                                htmlArgs: o
                            }), c = n(e, d), m = c.split(r).filter(e => !!e);
                            if (1 === m.length) return c;
                            let f = [...m];
                            if (0 !== Object.keys(u).length) {
                                let e = m.reduce((e, t, a) => {
                                    let n = l.exec(t);
                                    if (n) {
                                        let t = n[1];
                                        if (Object.hasOwn(u, t)) {
                                            let n = e[t];
                                            if (!n) return Object.assign(e, {
                                                [t]: [a]
                                            });
                                            n.push(a)
                                        }
                                    }
                                    return e
                                }, {});
                                Object.entries(u).forEach(t => {
                                    let [a, n] = t, l = e[a];
                                    l && l.forEach(e => {
                                        f[e] = n
                                    })
                                })
                            }
                            if (!Array.isArray(a) || 0 === a.length) return (0, t.createElement)(t.Fragment, null, ...f);
                            let p = a.reduce((e, t) => {
                                    let {
                                        opening: a,
                                        closing: n,
                                        content: l
                                    } = t;
                                    return Object.assign(e, {
                                        ["{".concat(a, "}")]: {
                                            match: "{".concat(n, "}"),
                                            content: l
                                        }
                                    })
                                }, {}),
                                g = [],
                                v = [],
                                h = [];
                            for (let e = f.shift(); void 0 !== e; e = f.shift())
                                if ("string" == typeof e && l.test(e))
                                    if (Object.hasOwn(p, e)) v.push(e), h.push(e);
                                    else {
                                        let a = v.pop();
                                        if (void 0 !== a) {
                                            let {
                                                match: n,
                                                content: l
                                            } = p[a];
                                            if (e !== n) break;
                                            let r = [],
                                                i = !1;
                                            for (; h.length > 0 && !i;) {
                                                let e = h.pop();
                                                e === a ? i = !0 : r.unshift(e)
                                            }
                                            let s = l(r.every(e => "string" == typeof e) ? r : (0, t.createElement)(t.Fragment, null, ...r));
                                            0 === h.length ? g.push(s) : h.push(s)
                                        }
                                    }
                            else 0 === h.length ? g.push(e) : h.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...g)
                        })(f.preferLoadedTranslations && !a ? e : d(e, f), c, m)
                    }
                })(e)
            }
        }, [f])
    }], 401263)
}, 836157, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        n = e.i(608652),
        l = e.i(174617),
        r = e.i(199786),
        i = e.i(300792),
        s = e.i(692166),
        o = e.i(169525),
        d = e.i(600317),
        u = e.i(221628),
        c = "Checkbox",
        [m, f] = (0, n.createContextScope)(c),
        [p, g] = m(c);

    function v(e) {
        let {
            __scopeCheckbox: a,
            checked: n,
            children: l,
            defaultChecked: i,
            disabled: s,
            form: o,
            name: d,
            onCheckedChange: m,
            required: f,
            value: g = "on",
            internal_do_not_use_render: v
        } = e, [h, b] = (0, r.useControllableState)({
            prop: n,
            defaultProp: null != i && i,
            onChange: m,
            caller: c
        }), [x, y] = t.useState(null), [E, w] = t.useState(null), N = t.useRef(!1), k = !x || !!o || !!x.closest("form"), T = {
            checked: h,
            disabled: s,
            setChecked: b,
            control: x,
            setControl: y,
            name: d,
            form: o,
            value: g,
            hasConsumerStoppedPropagationRef: N,
            required: f,
            defaultChecked: !S(i) && i,
            isFormControl: k,
            bubbleInput: E,
            setBubbleInput: w
        };
        return (0, u.jsx)(p, {
            scope: a,
            ...T,
            children: "function" == typeof v ? v(T) : l
        })
    }
    var h = "CheckboxTrigger",
        b = t.forwardRef((e, n) => {
            let {
                __scopeCheckbox: r,
                onKeyDown: i,
                onClick: s,
                ...o
            } = e, {
                control: c,
                value: m,
                disabled: f,
                checked: p,
                required: v,
                setControl: b,
                setChecked: x,
                hasConsumerStoppedPropagationRef: y,
                isFormControl: E,
                bubbleInput: w
            } = g(h, r), N = (0, a.useComposedRefs)(n, b), T = t.useRef(p);
            return t.useEffect(() => {
                let e = null == c ? void 0 : c.form;
                if (e) {
                    let t = () => x(T.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [c, x]), (0, u.jsx)(d.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": S(p) ? "mixed" : p,
                "aria-required": v,
                "data-state": k(p),
                "data-disabled": f ? "" : void 0,
                disabled: f,
                value: m,
                ...o,
                ref: N,
                onKeyDown: (0, l.composeEventHandlers)(i, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, l.composeEventHandlers)(s, e => {
                    x(e => !!S(e) || !e), w && E && (y.current = e.isPropagationStopped(), y.current || e.stopPropagation())
                })
            })
        });
    b.displayName = h;
    var x = t.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: n,
            checked: l,
            defaultChecked: r,
            required: i,
            disabled: s,
            value: o,
            onCheckedChange: d,
            form: c,
            ...m
        } = e;
        return (0, u.jsx)(v, {
            __scopeCheckbox: a,
            checked: l,
            defaultChecked: r,
            disabled: s,
            required: i,
            onCheckedChange: d,
            name: n,
            form: c,
            value: o,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, u.jsxs)(u.Fragment, {
                    children: [(0, u.jsx)(b, {
                        ...m,
                        ref: t,
                        __scopeCheckbox: a
                    }), n && (0, u.jsx)(N, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    x.displayName = c;
    var y = "CheckboxIndicator",
        E = t.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...l
            } = e, r = g(y, a);
            return (0, u.jsx)(o.Presence, {
                present: n || S(r.checked) || !0 === r.checked,
                children: (0, u.jsx)(d.Primitive.span, {
                    "data-state": k(r.checked),
                    "data-disabled": r.disabled ? "" : void 0,
                    ...l,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    E.displayName = y;
    var w = "CheckboxBubbleInput",
        N = t.forwardRef((e, n) => {
            let {
                __scopeCheckbox: l,
                ...r
            } = e, {
                control: o,
                hasConsumerStoppedPropagationRef: c,
                checked: m,
                defaultChecked: f,
                required: p,
                disabled: v,
                name: h,
                value: b,
                form: x,
                bubbleInput: y,
                setBubbleInput: E
            } = g(w, l), N = (0, a.useComposedRefs)(n, E), k = (0, i.usePrevious)(m), T = (0, s.useSize)(o);
            t.useEffect(() => {
                if (!y) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !c.current;
                if (k !== m && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    y.indeterminate = S(m), e.call(y, !S(m) && m), y.dispatchEvent(a)
                }
            }, [y, k, m, c]);
            let L = t.useRef(!S(m) && m);
            return (0, u.jsx)(d.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != f ? f : L.current,
                required: p,
                disabled: v,
                name: h,
                value: b,
                form: x,
                ...r,
                tabIndex: -1,
                ref: N,
                style: {
                    ...r.style,
                    ...T,
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
    N.displayName = w, e.s(["Indicator", 0, E, "Root", 0, x])
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        n = e.i(723570),
        l = e => {
            var l, i, s;
            let o, d, {
                    present: u,
                    children: c
                } = e,
                m = function(e) {
                    var a, l;
                    let [i, s] = t.useState(), o = t.useRef(null), d = t.useRef(e), u = t.useRef("none"), [c, m] = (a = e ? "mounted" : "unmounted", l = {
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
                        let a = l[e][t];
                        return null != a ? a : e
                    }, a));
                    return t.useEffect(() => {
                        let e = r(o.current);
                        u.current = "mounted" === c ? e : "none"
                    }, [c]), (0, n.useLayoutEffect)(() => {
                        let t = o.current,
                            a = d.current;
                        if (a !== e) {
                            let n = u.current,
                                l = r(t);
                            e ? m("MOUNT") : "none" === l || (null == t ? void 0 : t.display) === "none" ? m("UNMOUNT") : a && n !== l ? m("ANIMATION_OUT") : m("UNMOUNT"), d.current = e
                        }
                    }, [e, m]), (0, n.useLayoutEffect)(() => {
                        if (i) {
                            var e;
                            let t, a = null != (e = i.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = r(o.current).includes(CSS.escape(e.animationName));
                                    if (e.target === i && n && (m("ANIMATION_END"), !d.current)) {
                                        let e = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = e)
                                        })
                                    }
                                },
                                l = e => {
                                    e.target === i && (u.current = r(o.current))
                                };
                            return i.addEventListener("animationstart", l), i.addEventListener("animationcancel", n), i.addEventListener("animationend", n), () => {
                                a.clearTimeout(t), i.removeEventListener("animationstart", l), i.removeEventListener("animationcancel", n), i.removeEventListener("animationend", n)
                            }
                        }
                        m("ANIMATION_END")
                    }, [i, m]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(c),
                        ref: t.useCallback(e => {
                            o.current = e ? getComputedStyle(e) : null, s(e)
                        }, [])
                    }
                }(u),
                f = "function" == typeof c ? c({
                    present: m.isPresent
                }) : t.Children.only(c),
                p = (0, a.useComposedRefs)(m.ref, (d = (o = null == (i = Object.getOwnPropertyDescriptor((l = f).props, "ref")) ? void 0 : i.get) && "isReactWarning" in o && o.isReactWarning) ? l.ref : (d = (o = null == (s = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : s.get) && "isReactWarning" in o && o.isReactWarning) ? l.props.ref : l.props.ref || l.ref);
            return "function" == typeof c || m.isPresent ? t.cloneElement(f, {
                ref: p
            }) : null
        };

    function r(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    l.displayName = "Presence", e.s(["Presence", 0, l])
}, 202289, e => {
    "use strict";
    var t = e.i(737586),
        a = e.i(944821),
        n = e.i(197649),
        l = e.i(416340),
        r = e.i(836157);
    let i = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        s = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        o = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        d = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: u,
            className: c,
            isChecked: m,
            isDisabled: f,
            size: p,
            hint: g,
            placement: v,
            onCheckedChange: h,
            id: b,
            ...x
        } = e, y = (0, a.default)(), E = b || y, w = u && l.default.createElement("label", {
            htmlFor: E,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !f && "cursor-pointer")
        }, l.default.createElement("span", {
            className: (0, n.default)(o[p], d[p], "content-emphasis")
        }, u), g && l.default.createElement("span", {
            className: "text-body-medium content-default"
        }, g));
        return l.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", f && "opacity-[0.5]", !f && "cursor-pointer", c)
        }, "End" === v && w, l.default.createElement("div", {
            className: (0, n.default)(s[p])
        }, l.default.createElement(r.Root, {
            "data-slot": "checkbox",
            className: (0, n.default)(i[p], t.interactable, !f && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: E,
            checked: m,
            disabled: f,
            onCheckedChange: h,
            "aria-label": u,
            ...x
        }, l.default.createElement(t.StateLayer, null), l.default.createElement(r.Indicator, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(i[p], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === v && w)
    }])
}, 960916, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let n = (0, a.forwardRef)((e, n) => {
        let {
            className: l,
            style: r,
            orientation: i = "horizontal",
            variant: s = "Standard",
            ...o
        } = e, d = "vertical" === i, u = {};
        return d || "Inset" !== s ? d || "InsetLeft" !== s ? d || "InsetRight" !== s || (u = {
            marginRight: "var(--padding-xlarge)"
        }) : u = {
            marginLeft: "var(--padding-xlarge)"
        } : u = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, a.default.createElement("div", {
            ref: n,
            ...o,
            role: "separator",
            "data-orientation": i,
            "aria-orientation": i,
            style: {
                borderRightWidth: 0,
                borderBottomWidth: 0,
                boxSizing: "border-box",
                borderStyle: "solid",
                ...d ? {
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
                },
                ...u,
                ...r
            },
            className: (0, t.default)("stroke-default self-stretch", l)
        })
    });
    n.displayName = "Divider", e.s(["Divider", 0, n])
}, 494118, e => {
    "use strict";
    var t = e.i(737586),
        a = e.i(999544),
        n = e.i(197649),
        l = e.i(416340),
        r = e.i(23342);
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
        o = {
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
        d = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-alert",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        u = {
            Emphasis: "bg-action-standard",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        c = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        m = {
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
        f = {
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
        p = (0, l.forwardRef)((e, p) => {
            let g, {
                className: v,
                icon: h,
                ariaLabel: b,
                isDisabled: x = !1,
                isCircular: y = !1,
                isSelected: E = !1,
                size: w = "Large",
                variant: N = "Emphasis",
                iconColor: S = "Default",
                asChild: k,
                children: T,
                ...L
            } = e;
            g = x ? u[N] : E ? c[N] : d[N];
            let M = (0, n.default)("foundation-web-icon-button", x ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", i[w], o[w][y ? "circular" : "square"], g, v),
                C = l.default.createElement(l.default.Fragment, null, l.default.createElement(t.StateLayer, null), l.default.createElement("span", {
                    className: (0, n.default)("icon", h, s[w], x ? f[S][N] : m[S][N])
                }));
            if (k) {
                let {
                    as: e,
                    ...t
                } = L, a = l.default.Children.only(T);
                return l.default.createElement(r.Slot, {
                    ref: p,
                    ...t,
                    className: M,
                    "aria-label": b,
                    "aria-disabled": x || void 0
                }, l.default.cloneElement(a, {}, C))
            }
            if ("a" === L.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = L;
                return l.default.createElement("a", {
                    ref: p,
                    ...a,
                    "aria-label": b,
                    "aria-disabled": x,
                    href: x ? void 0 : t,
                    className: M
                }, C)
            }
            let {
                as: P,
                ...O
            } = L;
            return l.default.createElement("button", {
                ref: p,
                type: "button",
                ...O,
                "aria-label": b,
                disabled: x,
                className: M
            }, C)
        });
    e.s(["IconButton", 0, p])
}, 24286, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        n = e.i(23342);
    let l = new Set(["_self", "_parent", "_top"]),
        r = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        i = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        s = (0, a.forwardRef)((e, s) => {
            var o, d, u;
            let {
                children: c,
                className: m,
                size: f,
                color: p = "Emphasis",
                variant: g = "Standalone",
                underline: v = "hover",
                isExternal: h,
                asChild: b,
                ...x
            } = e, y = (d = null != (o = x.as) ? o : "a", u = "button" === x.as ? void 0 : x.target, void 0 !== h ? h : "button" !== d && void 0 !== u && !l.has(u)), E = (0, t.default)("foundation-web-link", "button" === x.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === g || y) && "inline-flex items-center gap-xsmall", void 0 !== f && r[f], i[p], "always" === v ? "underline" : "no-underline", "hover" === v && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", m), w = y ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (b) {
                let {
                    as: e,
                    ...t
                } = x, l = a.default.Children.only(c);
                return a.default.isValidElement(l) ? a.default.createElement(n.Slot, {
                    ref: s,
                    ...t,
                    className: E
                }, a.default.cloneElement(l, {}, a.default.createElement(a.default.Fragment, null, l.props.children, w))) : null
            }
            if ("button" === x.as) {
                let {
                    as: e,
                    type: t,
                    ...n
                } = x;
                return a.default.createElement("button", {
                    ref: s,
                    type: null != t ? t : "button",
                    ...n,
                    className: E
                }, c, w)
            }
            let {
                as: N,
                ...S
            } = x;
            return a.default.createElement("a", {
                ref: s,
                ...S,
                className: E
            }, c, w)
        });
    s.displayName = "Link", e.s(["Link", 0, s])
}, 732749, 222298, e => {
    "use strict";
    var t = e.i(737586),
        a = e.i(944821),
        n = e.i(461806),
        l = e.i(482076),
        r = e.i(197649),
        i = e.i(416340),
        s = e.i(563921);
    let o = (0, i.createContext)(null),
        d = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        u = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        c = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        m = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        f = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        p = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        g = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        v = (0, i.forwardRef)((e, v) => {
            let {
                label: h,
                labelTooltip: b,
                ariaLabelledBy: x,
                ariaLabel: y,
                className: E,
                size: w,
                variant: N = "Standard",
                value: S,
                placeholder: k,
                isDisabled: T,
                hasError: L,
                hint: M,
                onValueChange: C,
                onOpenChange: P,
                children: O
            } = e, R = (0, a.default)(), I = (0, i.useMemo)(() => ({
                size: w
            }), [w]), A = h ? i.default.createElement("span", {
                id: R,
                className: (0, r.default)(c[w], "content-emphasis")
            }, h) : null;
            return i.default.createElement(o.Provider, {
                value: I
            }, i.default.createElement("div", {
                className: (0, r.default)("flex flex-col", T && ["opacity-[0.5]", "pointer-events-none"], f[w], E)
            }, A && (b ? i.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, A, i.default.createElement(n.LabelTooltip, b)) : A), i.default.createElement(s.Root, {
                value: S,
                disabled: T,
                onValueChange: C,
                onOpenChange: P
            }, i.default.createElement(s.Trigger, {
                className: (0, r.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", l.INPUT_BACKGROUND_BY_VARIANT[N], l.INPUT_STROKE_BY_VARIANT[N], p[w], g[w], u[w], m[w], L ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === S ? "content-muted" : "content-default"),
                ref: v,
                "aria-labelledby": h ? R : x,
                "aria-label": y
            }, i.default.createElement(t.StateLayer, null), i.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, i.default.createElement(s.Value, {
                placeholder: k
            })), i.default.createElement(s.Icon, {
                className: (0, r.default)(d[w], "icon icon-regular-chevron-large-down content-default")
            })), i.default.createElement(s.Portal, null, i.default.createElement(s.Content, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, O))), M && i.default.createElement("span", {
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": L,
                    "content-default": !L
                })
            }, M)))
        });
    v.displayName = "Dropdown", e.s(["Dropdown", 0, v, "DropdownContext", 0, o], 222298);
    var h = e.i(23342),
        b = e.i(142953);
    let x = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        y = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        E = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        w = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        N = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        S = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        k = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        T = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        L = (0, i.createContext)(null),
        M = () => {
            let e = (0, i.useContext)(L);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        var t;
        let {
            children: a,
            className: n,
            size: l
        } = e, d = (0, i.useContext)(o), u = d ? "dropdown" : "standalone", c = null != (t = null != l ? l : null == d ? void 0 : d.size) ? t : "Medium", m = (0, i.useMemo)(() => ({
            size: c,
            mode: u
        }), [c, u]), f = (0, r.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", x[c], n), p = "standalone" === u ? i.default.createElement(b.Root, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, i.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: f
        }, a)) : i.default.createElement("div", {
            className: f
        }, a);
        return i.default.createElement(L.Provider, {
            value: m
        }, "dropdown" === u ? i.default.createElement(s.Viewport, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, p) : p)
    }, "MenuItem", 0, e => {
        let a, {
                value: n,
                leading: l,
                title: o,
                description: d,
                trailing: u,
                disabled: c,
                className: m,
                onSelect: f,
                asChild: p,
                children: g,
                ...v
            } = e,
            {
                size: x,
                mode: y
            } = M(),
            L = (0, r.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", k[x], E[x], w[x], N[x], T[x], c && "opacity-[0.5]", c && "pointer-events-none", m),
            C = i.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, o);
        switch (y) {
            case "dropdown":
                C = i.default.createElement(s.ItemText, {
                    asChild: !0
                }, C);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", y)
        }
        let P = i.default.createElement(i.default.Fragment, null, !c && i.default.createElement(t.StateLayer, null), l, i.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", S[x])
        }, C, d && i.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, d)), u);
        if (p) {
            let {
                as: e,
                ...n
            } = v, l = i.default.Children.only(g), r = void 0 === o && l.props.children;
            a = i.default.createElement(h.Slot, {
                ...n,
                role: "standalone" === y ? "menuitem" : void 0,
                "aria-disabled": c || void 0,
                className: L,
                style: {
                    outlineOffset: 0
                },
                onClick: c ? void 0 : f
            }, r ? i.default.cloneElement(l, {}, i.default.createElement(i.default.Fragment, null, !c && i.default.createElement(t.StateLayer, null), l.props.children)) : i.default.cloneElement(l, {}, P))
        } else if ("a" === v.as) {
            let {
                as: e,
                href: t,
                ...n
            } = v;
            a = i.default.createElement("a", {
                ...n,
                role: "standalone" === y ? "menuitem" : void 0,
                "aria-disabled": c,
                href: c ? void 0 : t,
                className: L,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: c ? void 0 : f
            }, P)
        } else {
            let {
                as: e,
                ...t
            } = v;
            a = i.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === y ? "menuitem" : void 0,
                "aria-disabled": c,
                className: L,
                style: {
                    outlineOffset: 0
                },
                onClick: c ? void 0 : f
            }, P)
        }
        return "dropdown" === y ? i.default.createElement(s.Item, {
            value: n,
            disabled: c,
            asChild: !0
        }, a) : i.default.createElement(b.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: n
        }, a)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: a,
            leading: n,
            trailing: l,
            disabled: s,
            className: o
        } = e, {
            size: d
        } = M(), u = (0, r.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", k[d], E[d], w[d], N[d], s && "opacity-[0.5]", o);
        return i.default.createElement("div", {
            role: "none",
            className: u
        }, n, i.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", S[d])
        }, i.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), a && i.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, a)), l)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: a
        } = e, {
            size: n
        } = M();
        return i.default.createElement("div", {
            role: "group",
            className: (0, r.default)(y[n], a)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return i.default.createElement("div", {
            role: "separator",
            className: (0, r.default)("foundation-web-menu-separator", t)
        })
    }], 732749)
}, 610932, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        n = e.i(734463);
    let l = e => {
        var t, a, n, l, r, i;
        let s = null != (t = null == (n = (l = window).matchMedia) || null == (a = n.call(l, "(pointer: coarse)")) ? void 0 : a.matches) && t,
            o = null == (r = document.activeElement) ? void 0 : r.matches(":focus-visible");
        if (s && !o) return void e.preventDefault();
        let d = null == (i = e.currentTarget) ? void 0 : i.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        d && (e.preventDefault(), d.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: l,
            onOpenChange: r,
            children: i
        } = e;
        return a.createElement(n.Root, {
            open: t,
            defaultOpen: l,
            onOpenChange: r
        }, i)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: t,
            className: l,
            children: r
        } = e;
        return a.createElement(n.Anchor, {
            asChild: t,
            className: l
        }, r)
    }, "PopoverContent", 0, function(e) {
        let {
            side: r = "bottom",
            align: i = "center",
            sideOffset: s = 4,
            className: o,
            children: d,
            ariaLabel: u,
            onOpenAutoFocus: c,
            ...m
        } = e;
        return a.createElement(n.Portal, null, a.createElement(n.Content, {
            side: r,
            align: i,
            sideOffset: s,
            ...m,
            "aria-label": null != u ? u : m["aria-label"],
            onOpenAutoFocus: null != c ? c : l,
            className: (0, t.default)("foundation-web-portal-zindex", o)
        }, d))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: l,
            className: r,
            children: i
        } = e;
        return a.createElement(n.Trigger, {
            asChild: t,
            disabled: l,
            className: r
        }, i)
    }])
}, 830655, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let n = {
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
        l = a.default.forwardRef((e, l) => {
            let {
                className: r,
                size: i = "Large",
                variant: s = "Determinate",
                value: o = 0,
                showValue: d = !1,
                ariaLabel: u,
                ...c
            } = e, {
                dimension: m,
                strokeWidth: f,
                textClass: p,
                valueContainerSize: g
            } = n[i], v = (m - f) / 2, h = 2 * Math.PI * v, b = m / 2, x = Math.min(100, Math.max(0, o)), y = d && void 0 !== g ? g : m, E = "Determinate" === s;
            return a.default.createElement("div", {
                ref: l,
                className: (0, t.default)("foundation-web-progress-circle inline-flex items-center justify-center", r),
                role: "progressbar",
                "aria-label": u,
                "aria-valuemin": E ? 0 : void 0,
                "aria-valuemax": E ? 100 : void 0,
                "aria-valuenow": E ? x : void 0,
                style: {
                    width: y,
                    height: y
                },
                ...c
            }, a.default.createElement("svg", {
                width: m,
                height: m,
                viewBox: "0 0 ".concat(m, " ").concat(m),
                className: "relative"
            }, a.default.createElement("circle", {
                cx: b,
                cy: b,
                r: v,
                fill: "none",
                strokeWidth: f,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), a.default.createElement("circle", {
                cx: b,
                cy: b,
                r: v,
                fill: "none",
                strokeWidth: f,
                strokeDasharray: E ? h : "".concat(.75 * h, " ").concat(.25 * h),
                strokeDashoffset: E ? h * (1 - x / 100) : 0,
                strokeLinecap: "round",
                className: (0, t.default)(!E && "foundation-web-progress-circle-indeterminate"),
                style: E ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), E && d && "Large" === i && a.default.createElement("div", {
                className: (0, t.default)("absolute content-emphasis flex items-center justify-center", p),
                "aria-hidden": "true"
            }, a.default.createElement("span", null, Math.round(x)), a.default.createElement("span", null, "%")))
        });
    l.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, l])
}, 842697, e => {
    "use strict";
    var t = e.i(880343),
        a = e.i(968892),
        n = e.i(247268),
        l = e.i(197649),
        r = e.i(416340);
    let i = (0, r.forwardRef)((e, i) => {
        let {
            title: s,
            icon: o,
            actionLabel: d,
            onAction: u,
            actions: c,
            onClose: m,
            closeIconAriaLabel: f = "Dismiss snackbar",
            shouldAutoDismiss: p,
            autoDismissDurationMs: g,
            className: v,
            ...h
        } = e, [b, x] = (0, r.useState)("enter"), y = (0, r.useRef)(void 0), E = (0, r.useRef)(void 0), w = (0, r.useRef)(void 0), N = (0, r.useRef)(null), S = null != c ? c : d && u && r.default.createElement(a.Button, {
            size: "Small",
            variant: "Utility",
            className: "content-inverse-emphasis",
            onClick: u,
            ref: N
        }, d), k = !!S, T = s.length > 80, L = null == p || p, M = 4e3;
        k && (M = T ? 1e4 : 7e3);
        let C = null != g ? g : M,
            P = (0, r.useCallback)(() => {
                "exit" !== b && (x("exit"), void 0 !== E.current && (window.clearTimeout(E.current), E.current = void 0), w.current = window.setTimeout(() => {
                    null == m || m()
                }, 150))
            }, [m, b]);
        (0, r.useEffect)(() => (y.current = window.requestAnimationFrame(() => {
            x("idle")
        }), () => {
            void 0 !== y.current && window.cancelAnimationFrame(y.current)
        }), []), (0, r.useEffect)(() => {
            void 0 !== E.current && (window.clearTimeout(E.current), E.current = void 0), L && "exit" !== b && (E.current = window.setTimeout(() => {
                P()
            }, C))
        }, [C, L, b, P]), (0, r.useEffect)(() => {
            var e;
            k && (null == (e = N.current) || e.focus())
        }, [k]), (0, r.useEffect)(() => () => {
            void 0 !== E.current && window.clearTimeout(E.current), void 0 !== w.current && window.clearTimeout(w.current), void 0 !== y.current && window.cancelAnimationFrame(y.current)
        }, []);
        let O = {
                position: "fixed",
                left: "50%",
                bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                transform: "translate(-50%, ".concat("idle" === b ? "0" : "120%", ")"),
                zIndex: "var(--foundation-portal-zindex, 9999)"
            },
            R = h.style ? {
                ...O,
                ...h.style
            } : O;
        return r.default.createElement("div", {
            ref: i,
            role: "status",
            "aria-live": "polite",
            className: (0, l.default)("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === b ? "ease-standard-in" : "ease-standard-out", v),
            style: {
                ...R,
                transitionDuration: "".concat("exit" === b ? 150 : 200, "ms"),
                transitionProperty: "transform"
            },
            ...h
        }, r.default.createElement("div", {
            className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
        }, o && r.default.createElement(t.Icon, {
            name: o,
            size: "Small",
            className: "shrink-0 content-inverse-emphasis"
        }), r.default.createElement("div", {
            className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
        }, s)), r.default.createElement("div", {
            className: "flex items-center justify-end gap-small shrink-0"
        }, S, m && r.default.createElement(n.CloseAffordance, {
            variant: "Utility",
            size: "Small",
            isCircular: !0,
            className: "content-inverse-emphasis",
            "aria-label": f,
            onClick: P
        })))
    });
    e.s(["Snackbar", 0, i])
}, 776569, 560130, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);

    function n(e) {
        let {
            className: n
        } = e;
        return a.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, t.default)("block", n),
            style: {
                marginTop: -1
            }
        }, a.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }
    e.s(["Beak", 0, n], 560130);
    var l = e.i(989665);
    e.s(["Tooltip", 0, function(e) {
        let {
            position: r,
            hasBeak: i = !0,
            title: s,
            description: o,
            ariaLabel: d,
            delayDurationMs: u = 500,
            children: c,
            open: m,
            onOpenChange: f,
            contentClassName: p
        } = e, [g, v] = r.split("-"), h = null != d ? d : "string" == typeof s && null == o ? s : void 0;
        return a.createElement(l.Provider, {
            delayDuration: u
        }, a.createElement(l.Root, {
            open: m,
            onOpenChange: f
        }, c, a.createElement(l.Portal, null, a.createElement(l.Content, {
            side: g,
            align: v,
            "aria-label": h,
            className: (0, t.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", p),
            sideOffset: 5
        }, i && a.createElement(l.Arrow, {
            asChild: !0
        }, a.createElement(n, {
            className: "content-[var(--inverse-surface-0)]"
        })), a.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, a.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, s), o && a.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, o))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: n,
            className: r
        } = e;
        return a.createElement(l.Trigger, {
            asChild: n,
            className: r
        }, t)
    }], 776569)
}, 461806, e => {
    "use strict";
    var t = e.i(880343),
        a = e.i(776569),
        n = e.i(416340);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: l,
            description: r,
            position: i = "top-center"
        } = e;
        return n.default.createElement(a.Tooltip, {
            position: i,
            title: l,
            description: r
        }, n.default.createElement(a.TooltipTrigger, {
            asChild: !0
        }, n.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": l,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, n.default.createElement(t.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }])
}, 482076, e => {
    "use strict";
    e.s(["INPUT_BACKGROUND_BY_VARIANT", 0, {
        Standard: "bg-none",
        Contrast: "bg-shift-200",
        Utility: "bg-none"
    }, "INPUT_STROKE_BY_VARIANT", 0, {
        Standard: "stroke-standard",
        Contrast: "stroke-none",
        Utility: "stroke-none"
    }, "INPUT_VARIANTS", 0, ["Standard", "Contrast", "Utility"]])
}, 944821, e => {
    "use strict";
    var t = e.i(416340);
    let a = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            n = (0, t.useRef)();
        return n.current || (a += 1, n.current = "".concat(e).concat(a)), n.current
    }])
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function a(e, t) {
        let {
            pages: a,
            pageParams: n
        } = t, l = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[l], a, n[l], n) : void 0
    }

    function n(e, t) {
        var a;
        let {
            pages: n,
            pageParams: l
        } = t;
        return n.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, n[0], n, l[0], l) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != n(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (l, r) => {
                var i, s, o, d, u;
                let c = l.options,
                    m = null == (o = l.fetchOptions) || null == (s = o.meta) || null == (i = s.fetchMore) ? void 0 : i.direction,
                    f = (null == (d = l.state.data) ? void 0 : d.pages) || [],
                    p = (null == (u = l.state.data) ? void 0 : u.pageParams) || [],
                    g = {
                        pages: [],
                        pageParams: []
                    },
                    v = 0,
                    h = async () => {
                        let r = !1,
                            i = (0, t.ensureQueryFn)(l.options, l.fetchOptions),
                            s = async (e, a, n) => {
                                let s;
                                if (r) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(s = {
                                        client: l.client,
                                        queryKey: l.queryKey,
                                        pageParam: a,
                                        direction: n ? "backward" : "forward",
                                        meta: l.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (l.signal.aborted ? r = !0 : l.signal.addEventListener("abort", () => {
                                            r = !0
                                        }), l.signal)
                                    }), s),
                                    d = await i(o),
                                    {
                                        maxPages: u
                                    } = l.options,
                                    c = n ? t.addToStart : t.addToEnd;
                                return {
                                    pages: c(e.pages, d, u),
                                    pageParams: c(e.pageParams, a, u)
                                }
                            };
                        if (m && f.length) {
                            let e = "backward" === m,
                                t = {
                                    pages: f,
                                    pageParams: p
                                },
                                l = (e ? n : a)(c, t);
                            g = await s(t, l, e)
                        } else {
                            let t = null != e ? e : f.length;
                            do {
                                var o;
                                let e = 0 === v ? null != (o = p[0]) ? o : c.initialPageParam : a(c, g);
                                if (v > 0 && null == e) break;
                                g = await s(g, e), v++
                            } while (v < t)
                        }
                        return g
                    };
                l.options.persister ? l.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = l.options).persister) ? void 0 : e.call(t, h, {
                        client: l.client,
                        queryKey: l.queryKey,
                        meta: l.options.meta,
                        signal: l.signal
                    }, r)
                } : l.fetchFn = h
            }
        }
    }])
}]);

//# debugId=55c27df5-b8df-6e75-0747-30cffaa85549
//# sourceMappingURL=2u13kdx0gbegi.js.map
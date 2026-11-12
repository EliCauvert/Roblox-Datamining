;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "da4697dd-f0f7-7260-cfb8-d329d0107fc5")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 634130, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(120297),
        n = e.i(859726),
        l = e.i(950020),
        i = e.i(517952),
        r = e.i(179510),
        s = e.i(842769),
        d = e.i(989308),
        o = e.i(546633),
        m = e.i(785517),
        u = "Checkbox",
        [c, f] = (0, n.c)(u),
        [p, g] = c(u);

    function h(e) {
        let {
            __scopeCheckbox: a,
            checked: n,
            children: l,
            defaultChecked: r,
            disabled: s,
            form: d,
            name: o,
            onCheckedChange: c,
            required: f,
            value: g = "on",
            internal_do_not_use_render: h
        } = e, [v, b] = (0, i.f)({
            prop: n,
            defaultProp: null != r && r,
            onChange: c,
            caller: u
        }), [x, w] = t.useState(null), [y, E] = t.useState(null), S = t.useRef(!1), N = !x || !!d || !!x.closest("form"), M = {
            checked: v,
            disabled: s,
            setChecked: b,
            control: x,
            setControl: w,
            name: o,
            form: d,
            value: g,
            hasConsumerStoppedPropagationRef: S,
            required: f,
            defaultChecked: !k(r) && r,
            isFormControl: N,
            bubbleInput: y,
            setBubbleInput: E
        };
        return (0, m.jsx)(p, {
            scope: a,
            ...M,
            children: "function" == typeof h ? h(M) : l
        })
    }
    var v = "CheckboxTrigger",
        b = t.forwardRef((e, n) => {
            let {
                __scopeCheckbox: i,
                onKeyDown: r,
                onClick: s,
                ...d
            } = e, {
                control: u,
                value: c,
                disabled: f,
                checked: p,
                required: h,
                setControl: b,
                setChecked: x,
                hasConsumerStoppedPropagationRef: w,
                isFormControl: y,
                bubbleInput: E
            } = g(v, i), S = (0, a.j)(n, b), M = t.useRef(p);
            return t.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => x(M.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, x]), (0, m.jsx)(o.f.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": k(p) ? "mixed" : p,
                "aria-required": h,
                "data-state": N(p),
                "data-disabled": f ? "" : void 0,
                disabled: f,
                value: c,
                ...d,
                ref: S,
                onKeyDown: (0, l.f)(r, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, l.f)(s, e => {
                    x(e => !!k(e) || !e), E && y && (w.current = e.isPropagationStopped(), w.current || e.stopPropagation())
                })
            })
        });
    b.displayName = v;
    var x = t.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: n,
            checked: l,
            defaultChecked: i,
            required: r,
            disabled: s,
            value: d,
            onCheckedChange: o,
            form: u,
            ...c
        } = e;
        return (0, m.jsx)(h, {
            __scopeCheckbox: a,
            checked: l,
            defaultChecked: i,
            disabled: s,
            required: r,
            onCheckedChange: o,
            name: n,
            form: u,
            value: d,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, m.jsxs)(m.Fragment, {
                    children: [(0, m.jsx)(b, {
                        ...c,
                        ref: t,
                        __scopeCheckbox: a
                    }), n && (0, m.jsx)(S, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    x.displayName = u;
    var w = "CheckboxIndicator",
        y = t.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...l
            } = e, i = g(w, a);
            return (0, m.jsx)(d.f, {
                present: n || k(i.checked) || !0 === i.checked,
                children: (0, m.jsx)(o.f.span, {
                    "data-state": N(i.checked),
                    "data-disabled": i.disabled ? "" : void 0,
                    ...l,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    y.displayName = w;
    var E = "CheckboxBubbleInput",
        S = t.forwardRef((e, n) => {
            let {
                __scopeCheckbox: l,
                ...i
            } = e, {
                control: d,
                hasConsumerStoppedPropagationRef: u,
                checked: c,
                defaultChecked: f,
                required: p,
                disabled: h,
                name: v,
                value: b,
                form: x,
                bubbleInput: w,
                setBubbleInput: y
            } = g(E, l), S = (0, a.j)(n, y), N = (0, r.f)(c), M = (0, s.f)(d);
            t.useEffect(() => {
                if (!w) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !u.current;
                if (N !== c && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    w.indeterminate = k(c), e.call(w, !k(c) && c), w.dispatchEvent(a)
                }
            }, [w, N, c, u]);
            let L = t.useRef(!k(c) && c);
            return (0, m.jsx)(o.f.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != f ? f : L.current,
                required: p,
                disabled: h,
                name: v,
                value: b,
                form: x,
                ...i,
                tabIndex: -1,
                ref: S,
                style: {
                    ...i.style,
                    ...M,
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

    function N(e) {
        return k(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    S.displayName = E, e.s(["S", 0, y, "F", 0, x])
}, 989308, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(120297),
        n = e.i(206350),
        l = e => {
            var l, r, s;
            let d, o, {
                    present: m,
                    children: u
                } = e,
                c = function(e) {
                    var a, l;
                    let [r, s] = t.useState(), d = t.useRef(null), o = t.useRef(e), m = t.useRef("none"), [u, c] = (a = e ? "mounted" : "unmounted", l = {
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
                        let e = i(d.current);
                        m.current = "mounted" === u ? e : "none"
                    }, [u]), (0, n.f)(() => {
                        let t = d.current,
                            a = o.current;
                        if (a !== e) {
                            let n = m.current,
                                l = i(t);
                            e ? c("MOUNT") : "none" === l || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : a && n !== l ? c("ANIMATION_OUT") : c("UNMOUNT"), o.current = e
                        }
                    }, [e, c]), (0, n.f)(() => {
                        if (r) {
                            var e;
                            let t, a = null != (e = r.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = i(d.current).includes(CSS.escape(e.animationName));
                                    if (e.target === r && n && (c("ANIMATION_END"), !o.current)) {
                                        let e = r.style.animationFillMode;
                                        r.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === r.style.animationFillMode && (r.style.animationFillMode = e)
                                        })
                                    }
                                },
                                l = e => {
                                    e.target === r && (m.current = i(d.current))
                                };
                            return r.addEventListener("animationstart", l), r.addEventListener("animationcancel", n), r.addEventListener("animationend", n), () => {
                                a.clearTimeout(t), r.removeEventListener("animationstart", l), r.removeEventListener("animationcancel", n), r.removeEventListener("animationend", n)
                            }
                        }
                        c("ANIMATION_END")
                    }, [r, c]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(u),
                        ref: t.useCallback(e => {
                            d.current = e ? getComputedStyle(e) : null, s(e)
                        }, [])
                    }
                }(m),
                f = "function" == typeof u ? u({
                    present: c.isPresent
                }) : t.Children.only(u),
                p = (0, a.j)(c.ref, (o = (d = null == (r = Object.getOwnPropertyDescriptor((l = f).props, "ref")) ? void 0 : r.get) && "isReactWarning" in d && d.isReactWarning) ? l.ref : (o = (d = null == (s = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : s.get) && "isReactWarning" in d && d.isReactWarning) ? l.props.ref : l.props.ref || l.ref);
            return "function" == typeof u || c.isPresent ? t.cloneElement(f, {
                ref: p
            }) : null
        };

    function i(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    l.displayName = "Presence", e.s(["f", 0, l])
}, 590252, e => {
    "use strict";
    var t = e.i(154570),
        a = e.i(335020),
        n = e.i(643766);
    let l = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600",
            XLarge: "size-700"
        },
        i = (0, n.forwardRef)((e, i) => {
            let {
                src: r,
                alt: s,
                initials: d,
                icon: o = "icon-filled-person",
                size: m = "Medium",
                className: u,
                ...c
            } = e, [f, p] = (0, n.useState)(), g = !!r && r !== f;
            return n.default.createElement("span", {
                ref: i,
                role: s ? "img" : void 0,
                "aria-label": s || void 0,
                "aria-hidden": !s || void 0,
                ...c,
                className: (0, a.U)("foundation-web-avatar-icon inline-flex items-center justify-center shrink-0 [overflow:hidden] radius-circle select-none bg-shift-200 content-emphasis", l[m], u)
            }, g ? n.default.createElement("img", {
                src: r,
                alt: "",
                className: "size-full [object-fit:cover]",
                onError: () => p(r)
            }) : n.default.createElement("span", {
                "aria-hidden": !0,
                className: "inline-flex items-center justify-center size-full"
            }, d ? n.default.createElement("span", {
                className: "text-caption-small text-no-wrap"
            }, d) : n.default.createElement(t.f, {
                name: o,
                className: "!size-[75%]"
            })))
        });
    i.displayName = "AvatarIcon", e.s(["f", 0, i])
}, 79533, e => {
    "use strict";
    var t = e.i(154570),
        a = e.i(335020),
        n = e.i(643766);
    let l = {
            Neutral: "bg-shift-200",
            Standard: "bg-shift-200",
            Contrast: "bg-system-contrast",
            Emphasis: "bg-system-emphasis",
            Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
            Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
            Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
            OverMediaLight: "bg-[var(--light-mode-over-media-0)]",
            OverMedia: "bg-over-media-0"
        },
        i = {
            Neutral: "content-emphasis",
            Standard: "content-emphasis",
            Contrast: "content-inverse-emphasis",
            Emphasis: "content-[var(--dark-mode-content-emphasis)]",
            Success: "content-emphasis",
            Warning: "content-emphasis",
            Alert: "content-emphasis",
            OverMediaLight: "content-[var(--light-mode-content-emphasis)]",
            OverMedia: "content-emphasis"
        },
        r = {
            Neutral: "content-emphasis",
            Standard: "content-emphasis",
            Contrast: "content-inverse-emphasis",
            Emphasis: "content-[var(--dark-mode-content-emphasis)]",
            Success: "content-system-success",
            Warning: "content-system-warning",
            Alert: "content-system-alert",
            OverMediaLight: "content-[var(--light-mode-content-emphasis)]",
            OverMedia: "content-emphasis"
        },
        s = {
            Neutral: "stroke-none",
            Standard: "stroke-none",
            Contrast: "stroke-none",
            Emphasis: "stroke-none",
            Success: "stroke-none",
            Warning: "stroke-none",
            Alert: "stroke-none",
            OverMediaLight: "stroke-none",
            OverMedia: "stroke-none"
        },
        d = {
            Small: "height-600",
            XSmall: "height-400"
        },
        o = {
            Small: "padding-x-small",
            XSmall: "padding-x-xsmall"
        },
        m = {
            Small: "width-600",
            XSmall: "width-400"
        },
        u = {
            Small: "text-label-small",
            XSmall: "text-caption-small"
        },
        c = {
            Small: "padding-y-xsmall",
            XSmall: "padding-y-none"
        },
        f = {
            Small: "XSmall",
            XSmall: "XSmall"
        },
        p = {
            Pill: "radius-circle",
            Box: "radius-small"
        },
        g = n.default.forwardRef((e, g) => {
            let {
                className: h,
                label: v,
                variant: b = "Standard",
                icon: x,
                iconPosition: w = "Leading",
                size: y = "Small",
                shape: E = "Pill",
                ...S
            } = e, k = x && !v, N = "padding-x-xxsmall";
            x && (N = "Leading" === w ? "padding-right-xxsmall" : "padding-left-xxsmall");
            let M = x && n.default.createElement(t.f, {
                name: x,
                size: f[y],
                className: r[b]
            });
            return n.default.createElement("div", {
                ref: g,
                ...S,
                className: (0, a.U)("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", p[E], d[y], k ? [m[y], "justify-center"] : ["width-[fit-content]", o[y]], l[b], i[b], s[b], h)
            }, "Leading" === w && M, v && n.default.createElement("span", {
                className: (0, a.U)("text-no-wrap text-truncate-split", u[y], c[y], N, i[b])
            }, v), "Trailing" === w && M)
        });
    g.displayName = "Badge", e.s(["t", 0, g, "y", 0, ["Neutral", "Standard", "Contrast", "Emphasis", "Success", "Warning", "Alert", "OverMediaLight", "OverMedia"]])
}, 147325, e => {
    "use strict";
    var t = e.i(27213),
        a = e.i(609454),
        n = e.i(397706),
        l = e.i(335020),
        i = e.i(643766),
        r = e.i(634130);
    let s = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        d = {
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
        m = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["f", 0, e => {
        var u, c, f, p;
        let {
            label: g,
            className: h,
            isChecked: v,
            isDisabled: b,
            size: x,
            hint: w,
            placement: y,
            onCheckedChange: E,
            id: S,
            "aria-describedby": k,
            ...N
        } = e, M = (0, i.useContext)(n.i), L = null != (u = null != (c = null == M ? void 0 : M.size) ? c : x) ? u : "Medium", C = null != (f = null != (p = null == M ? void 0 : M.placement) ? p : y) ? f : "Start", U = b || (null == M ? void 0 : M.isDisabled), z = (0, a.f)(), P = S || z, O = M && g && w ? "".concat(P, "Hint") : void 0, X = g && i.default.createElement("label", {
            htmlFor: P,
            className: (0, l.U)("flex flex-col grow-1 gap-xsmall", !U && "cursor-pointer")
        }, i.default.createElement("span", {
            className: (0, l.U)(o[L], m[L], "content-emphasis")
        }, g), w && i.default.createElement("span", {
            id: O,
            className: (0, l.U)(M ? o[L] : "text-body-medium", "content-default")
        }, w));
        return i.default.createElement("div", {
            className: (0, l.U)("foundation-web-checkbox flex gap-medium", U && "opacity-[0.5]", !U && "cursor-pointer", h)
        }, "End" === C && X, i.default.createElement("div", {
            className: (0, l.U)(d[L])
        }, i.default.createElement(r.F, {
            "data-slot": "checkbox",
            className: (0, l.U)(s[L], t.Y, !U && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: P,
            checked: v,
            disabled: U,
            onCheckedChange: E,
            "aria-label": g,
            "aria-describedby": [k, O].filter(Boolean).join(" ") || void 0,
            ...N
        }, i.default.createElement(t.v, null), i.default.createElement(r.S, {
            "data-slot": "checkbox-indicator",
            className: (0, l.U)(s[L], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === C && X)
    }])
}, 435431, e => {
    "use strict";
    var t = e.i(335020),
        a = e.i(643766);
    let n = (0, a.forwardRef)((e, n) => {
        let {
            className: l,
            style: i,
            orientation: r = "horizontal",
            variant: s = "Standard",
            ...d
        } = e, o = "vertical" === r, m = {};
        return o || "Inset" !== s ? o || "InsetLeft" !== s ? o || "InsetRight" !== s || (m = {
            marginRight: "var(--padding-xlarge)"
        }) : m = {
            marginLeft: "var(--padding-xlarge)"
        } : m = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, a.default.createElement("div", {
            ref: n,
            ...d,
            role: "separator",
            "data-orientation": r,
            "aria-orientation": r,
            style: {
                borderRightWidth: 0,
                borderBottomWidth: 0,
                boxSizing: "border-box",
                borderStyle: "solid",
                ...o ? {
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
                ...m,
                ...i
            },
            className: (0, t.U)("stroke-default self-stretch", l)
        })
    });
    n.displayName = "Divider", e.s(["f", 0, n])
}, 854145, e => {
    "use strict";
    var t = e.i(27213),
        a = e.i(609454),
        n = e.i(278178);
    let l = ["Alt", "Control", "Meta", "Shift"];
    var i = e.i(433945),
        r = e.i(335020),
        s = e.i(643766),
        d = e.i(548223);
    let o = (0, s.createContext)(null),
        m = {
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
        f = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        p = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        g = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        h = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        v = (0, s.forwardRef)((e, v) => {
            let {
                label: b,
                labelTooltip: x,
                ariaLabelledBy: w,
                ariaLabel: y,
                className: E,
                size: S,
                variant: k = "Standard",
                value: N,
                placeholder: M,
                isDisabled: L,
                hasError: C,
                hint: U,
                onValueChange: z,
                onOpenChange: P,
                children: O
            } = e, X = (0, a.f)(), [T, R] = (0, s.useState)(!1), [_, j] = (0, s.useState)(!1), D = void 0 !== N && "" !== N || T;
            (0, s.useEffect)(() => {
                let e = e => {
                        e.metaKey || e.ctrlKey || e.altKey || l.includes(e.key) || j(!0)
                    },
                    t = () => j(!1);
                return window.addEventListener("keydown", e, !0), window.addEventListener("pointerdown", t, !0), () => {
                    window.removeEventListener("keydown", e, !0), window.removeEventListener("pointerdown", t, !0)
                }
            }, []);
            let I = (0, s.useMemo)(() => ({
                    size: S,
                    hasSelection: D,
                    isKeyboardNavigation: _
                }), [S, D, _]),
                A = b ? s.default.createElement("span", {
                    id: X,
                    className: (0, r.U)(c[S], "content-emphasis")
                }, b) : null;
            return s.default.createElement(o.Provider, {
                value: I
            }, s.default.createElement("div", {
                className: (0, r.U)("flex flex-col", L && ["opacity-[0.5]", "pointer-events-none"], p[S], E)
            }, A && (x ? s.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, A, s.default.createElement(n.f, x)) : A), s.default.createElement(d.F, {
                value: N,
                disabled: L,
                onValueChange: e => {
                    void 0 === N && R(!0), null == z || z(e)
                },
                onOpenChange: P
            }, s.default.createElement(d.d, {
                onPointerDownCapture: () => j(!1),
                className: (0, r.U)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", i.L[k], i.U[k], g[S], h[S], u[S], f[S], C ? "stroke-system-alert" : "stroke-contrast-alpha", _ && (C ? "focus-visible:stroke-system-alert" : "focus-visible:stroke-system-emphasis"), D ? "content-emphasis" : "content-default"),
                ref: v,
                "aria-labelledby": b ? X : w,
                "aria-label": y
            }, s.default.createElement(t.v, null), s.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, s.default.createElement(d.A, {
                placeholder: M
            })), s.default.createElement(d.W, {
                className: (0, r.U)(m[S], "icon icon-regular-chevron-large-down")
            })), s.default.createElement(d.z, null, s.default.createElement(d.c, {
                position: "popper",
                onPointerMoveCapture: () => j(!1),
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, O))), U && s.default.createElement("span", {
                className: (0, r.U)("text-caption-small", {
                    "content-system-alert": C,
                    "content-default": !C
                })
            }, U)))
        });
    v.displayName = "Dropdown", e.s(["x", 0, v, "d", 0, o], 854145)
}, 882057, e => {
    "use strict";
    var t = e.i(335020),
        a = e.i(643766),
        n = e.i(637068);
    let l = new Set(["_self", "_parent", "_top"]),
        i = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        r = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        s = (0, a.forwardRef)((e, s) => {
            var d, o, m;
            let {
                children: u,
                className: c,
                size: f,
                color: p = "Emphasis",
                variant: g = "Standalone",
                underline: h = "hover",
                isExternal: v,
                asChild: b,
                ...x
            } = e, w = (o = null != (d = x.as) ? d : "a", m = "button" === x.as ? void 0 : x.target, void 0 !== v ? v : "button" !== o && void 0 !== m && !l.has(m)), y = (0, t.U)("foundation-web-link", "button" === x.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === g || w) && "inline-flex items-center gap-xsmall", void 0 !== f && i[f], r[p], "always" === h ? "underline" : "no-underline", "hover" === h && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", c), E = w ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.U)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (b) {
                let {
                    as: e,
                    ...t
                } = x, l = a.default.Children.only(u);
                return a.default.isValidElement(l) ? a.default.createElement(n.M, {
                    ref: s,
                    ...t,
                    className: y
                }, a.default.cloneElement(l, {}, a.default.createElement(a.default.Fragment, null, l.props.children, E))) : null
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
                    className: y
                }, u, E)
            }
            let {
                as: S,
                ...k
            } = x;
            return a.default.createElement("a", {
                ref: s,
                ...k,
                className: y
            }, u, E)
        });
    s.displayName = "Link", e.s(["f", 0, s])
}, 722027, e => {
    "use strict";
    var t = e.i(27213),
        a = e.i(154570),
        n = e.i(651235);
    e.i(79533);
    var l = e.i(590252),
        i = e.i(854145),
        r = e.i(335020),
        s = e.i(643766),
        d = e.i(637068),
        o = e.i(548223),
        m = e.i(114903);
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
        f = {
            XSmall: "[.foundation-web-menu-section+&]:[margin-block-start:calc(var(--padding-xsmall)*2)]",
            Small: "[.foundation-web-menu-section+&]:[margin-block-start:calc(var(--padding-small)*2)]",
            Medium: "[.foundation-web-menu-section+&]:[margin-block-start:calc(var(--padding-small)*2)]",
            Large: "[.foundation-web-menu-section+&]:[margin-block-start:calc(var(--padding-small)*2)]"
        },
        p = {
            XSmall: "[margin-inline:calc(var(--padding-xsmall)*-1)] [margin-block:var(--padding-xsmall)]",
            Small: "[margin-inline:calc(var(--padding-small)*-1)] [margin-block:var(--padding-small)]",
            Medium: "[margin-inline:calc(var(--padding-small)*-1)] [margin-block:var(--padding-small)]",
            Large: "[margin-inline:calc(var(--padding-small)*-1)] [margin-block:var(--padding-small)]"
        },
        g = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        h = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        v = {
            XSmall: "gap-x-[var(--size-150)]",
            Small: "gap-x-[var(--size-150)]",
            Medium: "gap-x-[var(--size-150)]",
            Large: "gap-x-small"
        },
        b = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-500",
            Large: "size-600"
        },
        x = {
            XSmall: "Small",
            Small: "Medium",
            Medium: "Medium",
            Large: "Large"
        },
        w = {
            XSmall: "Small",
            Small: "Medium",
            Medium: "Medium",
            Large: "Large"
        },
        y = {
            XSmall: "Small",
            Small: "Small",
            Medium: "Medium",
            Large: "Large"
        },
        E = {
            XSmall: "min-height-600",
            Small: "min-height-800",
            Medium: "min-height-1000",
            Large: "min-height-1200"
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
        N = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-small",
            Large: "text-body-medium"
        },
        M = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        L = {
            XSmall: "width-500",
            Small: "width-600",
            Medium: "width-700",
            Large: "width-800"
        },
        C = {
            XSmall: "height-400",
            Small: "height-400",
            Medium: "height-500",
            Large: "height-600"
        },
        U = "height-[1lh]",
        z = (e, t) => (0, r.U)(L[e], t ? U : C[e]),
        P = e => {
            let {
                children: t
            } = e;
            return s.default.createElement("span", {
                className: (0, r.U)("flex items-center shrink-0", U)
            }, t)
        },
        O = (e, t) => t && null != e ? s.default.createElement(P, null, e) : e,
        X = (e, t, n) => {
            if (null == e || !1 === e) return null;
            let l = s.default.isValidElement(e) && (e.type === F || e.type === a.f),
                i = s.default.isValidElement(e) && e.type === a.f ? s.default.cloneElement(e, {
                    size: w[t]
                }) : e,
                d = s.default.createElement("span", {
                    "data-testid": "foundation-web-menu-leading",
                    className: (0, r.U)("inline-flex shrink-0 items-center justify-center", l && b[t])
                }, i);
            return n ? s.default.createElement(P, null, d) : d
        },
        T = {
            XSmall: "Small",
            Small: "Small",
            Medium: "Medium",
            Large: "Large"
        },
        R = s.default.forwardRef((e, t) => {
            let {
                size: n,
                className: l,
                ...i
            } = e;
            return s.default.createElement(a.f, {
                ref: t,
                name: "icon-regular-check",
                size: T[n],
                className: (0, r.U)("content-emphasis", l),
                ...i
            })
        });
    R.displayName = "CheckIcon";
    let _ = e => {
            let {
                size: t,
                mode: a,
                checked: n,
                hasDescription: l
            } = e;
            return s.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-menu-item-check",
                className: (0, r.U)("flex items-center justify-center shrink-0", z(t, l))
            }, "dropdown" === a ? s.default.createElement(o.j, {
                asChild: !0
            }, s.default.createElement(R, {
                size: t
            })) : n && s.default.createElement(R, {
                size: t
            }))
        },
        j = (0, s.createContext)(null),
        D = (0, s.createContext)(null),
        I = (0, s.createContext)(!1),
        A = () => {
            let e = (0, s.useContext)(j);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        },
        F = e => {
            let {
                type: t,
                src: a,
                alt: n
            } = e, {
                size: i
            } = A(), [d, o] = (0, s.useState)();
            if ("Media" === t) {
                let e = !!a && a !== d;
                return s.default.createElement("span", {
                    "data-testid": "foundation-web-menu-leading-media",
                    className: (0, r.U)("inline-flex shrink-0 [overflow:hidden] radius-xsmall bg-shift-200", b[i])
                }, e ? s.default.createElement("img", {
                    alt: null != n ? n : "",
                    className: "size-full [object-fit:cover]",
                    src: a,
                    onError: () => o(a)
                }) : null)
            }
            return s.default.createElement(l.f, {
                alt: n,
                size: x[i],
                src: a
            })
        };
    e.s(["k", 0, e => {
        var t;
        let {
            children: a,
            className: n,
            size: l
        } = e, d = (0, s.useContext)(i.d), f = d ? "dropdown" : "standalone", p = null != (t = null != l ? l : null == d ? void 0 : d.size) ? t : "Medium", [g, h] = (0, s.useState)(0), v = (0, s.useCallback)(() => (h(e => e + 1), () => h(e => e - 1)), []), b = "standalone" === f && g > 0, x = (0, s.useContext)(I), w = (0, s.useMemo)(() => ({
            size: p,
            mode: f,
            hasCheckedItem: b,
            registerCheckedItem: v
        }), [p, f, b, v]), y = (0, r.U)("foundation-web-menu bg-surface-200 stroke-standard stroke-default shadow-transient-high", u[p], c[p], "[box-sizing:border-box]", n), E = "standalone" === f ? s.default.createElement(m.F, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, s.default.createElement("div", {
            role: x ? "none" : "menu",
            tabIndex: -1,
            className: y
        }, a)) : s.default.createElement("div", {
            className: y
        }, a);
        return s.default.createElement(j.Provider, {
            value: w
        }, "dropdown" === f ? s.default.createElement(o.n, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, E) : E)
    }, "d", 0, e => {
        let l, u, {
                value: c,
                leading: f,
                title: p,
                description: b,
                submenu: x,
                trailing: w,
                isChecked: L = !1,
                disabled: C,
                className: U,
                onSelect: z,
                asChild: P,
                children: T,
                ...R
            } = e,
            {
                size: j,
                mode: F,
                hasCheckedItem: W,
                registerCheckedItem: K
            } = A(),
            B = (0, s.useContext)(i.d);
        (0, s.useLayoutEffect)(() => {
            if ("standalone" === F && L) return K()
        }, [F, L, K]);
        let q = void 0 !== x,
            V = "standalone" === F && q,
            H = (0, s.useContext)(D),
            [J, Y] = (0, s.useState)(!1),
            Z = (0, s.useCallback)(() => {
                Y(!1), null == H || H()
            }, [H]);
        if ("dropdown" === F && q) throw Error("MenuItem `submenu` is only supported in a standalone Menu.");
        let G = "dropdown" === F && (null == B ? void 0 : B.hasSelection) === !0 || "standalone" === F && W,
            Q = (0, r.U)(t.Y, "foundation-web-menu-item flex content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full [box-sizing:border-box]", b ? "items-start" : "items-center", "dropdown" === F && !(null == B ? void 0 : B.isKeyboardNavigation) && "focus-visible:outline-none", k[j], E[j], G ? "padding-left-none" : g[j], G && ("Large" === j ? "padding-right-large" : "padding-right-medium"), h[j], G ? void 0 : v[j], M[j], C && "opacity-[0.5]", C && "pointer-events-none", U),
            $ = "dropdown" === F ? "group-data-[highlighted]/interactable:bg-[var(--color-state-hover)]" : void 0,
            ee = s.default.createElement("span", {
                className: "foundation-web-menu-item-title min-width-0 text-no-wrap text-truncate-split content-emphasis"
            }, p);
        switch (F) {
            case "dropdown":
                ee = s.default.createElement(o.s, {
                    asChild: !0
                }, ee);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", F)
        }
        let et = s.default.createElement(s.default.Fragment, null, X(f, j, !!b), s.default.createElement("div", {
                className: (0, r.U)("grow-1 min-width-0 flex flex-col", S[j])
            }, ee, b && s.default.createElement("div", {
                className: (0, r.U)("foundation-web-menu-item-description content-muted min-width-0", N[j])
            }, b)), O(V ? s.default.createElement(a.f, {
                className: "content-emphasis",
                "data-testid": "foundation-web-menu-item-chevron",
                name: "icon-regular-chevron-small-right",
                size: y[j]
            }) : w, !!b)),
            ea = e => s.default.createElement(s.default.Fragment, null, !C && s.default.createElement(t.v, {
                className: $
            }), G && s.default.createElement(_, {
                size: j,
                mode: F,
                checked: L,
                hasDescription: !!b
            }), G ? s.default.createElement("div", {
                "data-testid": "foundation-web-menu-item-row",
                className: (0, r.U)("flex grow-1 min-width-0", b ? "items-start" : "items-center", v[j])
            }, e) : e),
            en = ea(et);
        "standalone" === F && (l = W ? "menuitemcheckbox" : "menuitem");
        let el = "standalone" === F && W ? L : void 0,
            ei = e => {
                if (!C) {
                    if (V) {
                        e.preventDefault(), Y(e => !e);
                        return
                    }
                    null == z || z(), null == H || H()
                }
            },
            er = e => {
                var t;
                null == (t = R.onKeyDown) || t.call(R, e), e.defaultPrevented || C || !V || "ArrowRight" !== e.key || (e.preventDefault(), Y(!0))
            };
        if (P) {
            let {
                as: e,
                ...t
            } = R, a = s.default.Children.only(T), n = void 0 === p && a.props.children;
            u = s.default.createElement(d.M, {
                ...t,
                role: l,
                "aria-checked": el,
                "aria-disabled": C || void 0,
                "aria-haspopup": V ? "menu" : void 0,
                className: Q,
                style: {
                    outlineOffset: 0
                },
                onClick: C ? void 0 : ei,
                onKeyDown: er
            }, n ? s.default.cloneElement(a, {}, ea(a.props.children)) : s.default.cloneElement(a, {}, en))
        } else if ("a" === R.as) {
            let {
                as: e,
                href: t,
                ...a
            } = R;
            u = s.default.createElement("a", {
                ...a,
                role: l,
                "aria-checked": el,
                "aria-disabled": C,
                "aria-haspopup": V ? "menu" : void 0,
                href: C || V ? void 0 : t,
                className: Q,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: C ? void 0 : ei,
                onKeyDown: er
            }, en)
        } else {
            let {
                as: e,
                ...t
            } = R;
            u = s.default.createElement("button", {
                type: "button",
                ...t,
                role: l,
                "aria-checked": el,
                "aria-disabled": C,
                "aria-haspopup": V ? "menu" : void 0,
                className: Q,
                style: {
                    outlineOffset: 0
                },
                onClick: C ? void 0 : ei,
                onKeyDown: er
            }, en)
        }
        if ("dropdown" === F) return s.default.createElement(o.M, {
            value: c,
            disabled: C,
            asChild: !0
        }, u);
        let es = s.default.createElement(m.M, {
            asChild: !0,
            focusable: !C,
            tabStopId: c
        }, u);
        return V && !C ? s.default.createElement(n.V, {
            open: J,
            onOpenChange: Y
        }, s.default.createElement(n.J, {
            asChild: !0
        }, es), s.default.createElement(n.T, {
            side: "right",
            align: "start",
            role: "menu",
            "aria-label": null != p ? p : c,
            onKeyDown: e => {
                "ArrowLeft" === e.key && (e.preventDefault(), e.stopPropagation(), Y(!1))
            }
        }, s.default.createElement(I.Provider, {
            value: !0
        }, s.default.createElement(D.Provider, {
            value: Z
        }, x)))) : es
    }, "U", 0, e => {
        let {
            title: t,
            description: a,
            leading: n,
            trailing: l,
            disabled: d,
            className: o
        } = e, {
            size: m,
            mode: u,
            hasCheckedItem: c
        } = A(), f = (0, s.useContext)(i.d), p = "dropdown" === u && (null == f ? void 0 : f.hasSelection) === !0 || "standalone" === u && c, b = (0, r.U)("foundation-web-menu-label flex content-default text-truncate-split text-align-x-left width-full [box-sizing:border-box]", a ? "items-start" : "items-center", k[m], E[m], p ? "padding-left-none" : g[m], p && ("Large" === m ? "padding-right-large" : "padding-right-medium"), h[m], p ? void 0 : v[m], d && "opacity-[0.5]", o), x = s.default.createElement(s.default.Fragment, null, X(n, m, !!a), s.default.createElement("div", {
            className: (0, r.U)("grow-1 min-width-0 flex flex-col", S[m])
        }, s.default.createElement("span", {
            className: "foundation-web-menu-label-title min-width-0 text-no-wrap text-truncate-split content-emphasis"
        }, t), a && s.default.createElement("div", {
            className: (0, r.U)("foundation-web-menu-label-description content-muted min-width-0", N[m])
        }, a)), O(l, !!a));
        return s.default.createElement("div", {
            role: "none",
            "data-testid": "foundation-web-menu-label",
            className: b
        }, p && s.default.createElement("span", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-menu-label-check-spacer",
            className: (0, r.U)("shrink-0", z(m, !!a))
        }), p ? s.default.createElement("div", {
            className: (0, r.U)("flex grow-1 min-width-0", a ? "items-start" : "items-center", v[m])
        }, x) : x)
    }, "T", 0, e => {
        let {
            children: t,
            className: a
        } = e, {
            size: n
        } = A();
        return s.default.createElement("div", {
            role: "group",
            className: (0, r.U)("foundation-web-menu-section", f[n], a)
        }, t)
    }, "Z", 0, e => {
        let {
            className: t
        } = e, {
            size: a
        } = A();
        return s.default.createElement("div", {
            role: "separator",
            className: (0, r.U)("foundation-web-menu-separator", p[a], t)
        })
    }])
}, 651235, e => {
    "use strict";
    var t = e.i(335020),
        a = e.i(643766),
        n = e.i(539377);
    let l = e => {
        var t, a, n, l, i, r;
        let s = null != (t = null == (n = (l = window).matchMedia) || null == (a = n.call(l, "(pointer: coarse)")) ? void 0 : a.matches) && t,
            d = null == (i = document.activeElement) ? void 0 : i.matches(":focus-visible");
        if (s && !d) return void e.preventDefault();
        let o = null == (r = e.currentTarget) ? void 0 : r.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        o && (e.preventDefault(), o.focus())
    };
    e.s(["V", 0, function(e) {
        let {
            open: t,
            defaultOpen: l,
            onOpenChange: i,
            children: r
        } = e;
        return a.createElement(n.F, {
            open: t,
            defaultOpen: l,
            onOpenChange: i
        }, r)
    }, "r", 0, function(e) {
        let {
            asChild: t,
            className: l,
            children: i
        } = e;
        return a.createElement(n.g, {
            asChild: t,
            className: l
        }, i)
    }, "T", 0, function(e) {
        let {
            side: i = "bottom",
            align: r = "center",
            sideOffset: s = 4,
            className: d,
            children: o,
            ariaLabel: m,
            onOpenAutoFocus: u,
            ...c
        } = e;
        return a.createElement(n.z, null, a.createElement(n.c, {
            side: i,
            align: r,
            sideOffset: s,
            ...c,
            "aria-label": null != m ? m : c["aria-label"],
            onOpenAutoFocus: null != u ? u : l,
            className: (0, t.U)("foundation-web-portal-zindex", d)
        }, o))
    }, "J", 0, function(e) {
        let {
            asChild: t,
            disabled: l,
            className: i,
            children: r
        } = e;
        return a.createElement(n.d, {
            asChild: t,
            disabled: l,
            className: i
        }, r)
    }])
}, 298176, e => {
    "use strict";
    var t = e.i(335020),
        a = e.i(643766);
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
                className: i,
                size: r = "Large",
                variant: s = "Determinate",
                value: d = 0,
                showValue: o = !1,
                ariaLabel: m,
                ...u
            } = e, {
                dimension: c,
                strokeWidth: f,
                textClass: p,
                valueContainerSize: g
            } = n[r], h = (c - f) / 2, v = 2 * Math.PI * h, b = c / 2, x = Math.min(100, Math.max(0, d)), w = o && void 0 !== g ? g : c, y = "Determinate" === s;
            return a.default.createElement("div", {
                ref: l,
                className: (0, t.U)("foundation-web-progress-circle inline-flex items-center justify-center", i),
                role: "progressbar",
                "aria-label": m,
                "aria-valuemin": y ? 0 : void 0,
                "aria-valuemax": y ? 100 : void 0,
                "aria-valuenow": y ? x : void 0,
                style: {
                    width: w,
                    height: w
                },
                ...u
            }, a.default.createElement("svg", {
                width: c,
                height: c,
                viewBox: "0 0 ".concat(c, " ").concat(c),
                className: "relative"
            }, a.default.createElement("circle", {
                cx: b,
                cy: b,
                r: h,
                fill: "none",
                strokeWidth: f,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), a.default.createElement("circle", {
                cx: b,
                cy: b,
                r: h,
                fill: "none",
                strokeWidth: f,
                strokeDasharray: y ? v : "".concat(.75 * v, " ").concat(.25 * v),
                strokeDashoffset: y ? v * (1 - x / 100) : 0,
                strokeLinecap: "round",
                className: (0, t.U)(!y && "foundation-web-progress-circle-indeterminate"),
                style: y ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), y && o && "Large" === r && a.default.createElement("div", {
                className: (0, t.U)("absolute content-emphasis flex items-center justify-center", p),
                "aria-hidden": "true"
            }, a.default.createElement("span", null, Math.round(x)), a.default.createElement("span", null, "%")))
        });
    l.displayName = "ProgressCircle", e.s(["f", 0, l])
}, 630232, e => {
    "use strict";
    var t = e.i(154570),
        a = e.i(661736),
        n = e.i(497698),
        l = e.i(335020),
        i = e.i(643766);
    let r = (0, i.forwardRef)((e, r) => {
        let {
            title: s,
            icon: d,
            actionLabel: o,
            onAction: m,
            actions: u,
            onClose: c,
            closeIconAriaLabel: f = "Dismiss snackbar",
            shouldAutoDismiss: p,
            autoDismissDurationMs: g,
            className: h,
            ...v
        } = e, [b, x] = (0, i.useState)("enter"), w = (0, i.useRef)(void 0), y = (0, i.useRef)(void 0), E = (0, i.useRef)(void 0), S = (0, i.useRef)(null), k = null != u ? u : o && m && i.default.createElement(a.f, {
            size: "Small",
            variant: "Utility",
            className: "content-inverse-emphasis",
            onClick: m,
            ref: S
        }, o), N = !!k, M = s.length > 80, L = null == p || p, C = 4e3;
        N && (C = M ? 1e4 : 7e3);
        let U = null != g ? g : C,
            z = (0, i.useCallback)(() => {
                "exit" !== b && (x("exit"), void 0 !== y.current && (window.clearTimeout(y.current), y.current = void 0), E.current = window.setTimeout(() => {
                    null == c || c()
                }, 150))
            }, [c, b]);
        (0, i.useEffect)(() => (w.current = window.requestAnimationFrame(() => {
            x("idle")
        }), () => {
            void 0 !== w.current && window.cancelAnimationFrame(w.current)
        }), []), (0, i.useEffect)(() => {
            void 0 !== y.current && (window.clearTimeout(y.current), y.current = void 0), L && "exit" !== b && (y.current = window.setTimeout(() => {
                z()
            }, U))
        }, [U, L, b, z]), (0, i.useEffect)(() => {
            var e;
            N && (null == (e = S.current) || e.focus())
        }, [N]), (0, i.useEffect)(() => () => {
            void 0 !== y.current && window.clearTimeout(y.current), void 0 !== E.current && window.clearTimeout(E.current), void 0 !== w.current && window.cancelAnimationFrame(w.current)
        }, []);
        let P = {
                position: "fixed",
                left: "50%",
                bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                transform: "translate(-50%, ".concat("idle" === b ? "0" : "120%", ")"),
                zIndex: "var(--foundation-portal-zindex, 9999)"
            },
            O = v.style ? {
                ...P,
                ...v.style
            } : P;
        return i.default.createElement("div", {
            ref: r,
            role: "status",
            "aria-live": "polite",
            className: (0, l.U)("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === b ? "ease-standard-in" : "ease-standard-out", h),
            style: {
                ...O,
                transitionDuration: "".concat("exit" === b ? 150 : 200, "ms"),
                transitionProperty: "transform"
            },
            ...v
        }, i.default.createElement("div", {
            className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
        }, d && i.default.createElement(t.f, {
            name: d,
            size: "Small",
            className: "shrink-0 content-inverse-emphasis"
        }), i.default.createElement("div", {
            className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
        }, s)), i.default.createElement("div", {
            className: "flex items-center justify-end gap-small shrink-0"
        }, k, c && i.default.createElement(n.f, {
            variant: "Utility",
            size: "Small",
            isCircular: !0,
            className: "content-inverse-emphasis",
            "aria-label": f,
            onClick: z
        })))
    });
    e.s(["f", 0, r])
}, 397706, e => {
    "use strict";
    var t = e.i(643766);
    let a = (0, t.createContext)(null),
        n = (0, t.createContext)(null),
        l = (0, t.createContext)(null);
    e.s(["i", 0, a, "f", 0, l, "U", 0, n])
}, 278178, e => {
    "use strict";
    var t = e.i(154570),
        a = e.i(134321),
        n = e.i(643766);
    e.s(["f", 0, e => {
        let {
            title: l,
            description: i,
            position: r = "top-center"
        } = e;
        return n.default.createElement(a.W, {
            position: r,
            title: l,
            description: i
        }, n.default.createElement(a.y, {
            asChild: !0
        }, n.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": l,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, n.default.createElement(t.f, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }])
}, 433945, e => {
    "use strict";
    e.s(["L", 0, {
        Standard: "bg-none",
        Contrast: "bg-shift-200",
        Utility: "bg-none"
    }, "U", 0, {
        Standard: "stroke-standard",
        Contrast: "stroke-none",
        Utility: "stroke-none"
    }, "_", 0, ["Standard", "Contrast", "Utility"]])
}, 609454, e => {
    "use strict";
    var t = e.i(643766);
    let a = 0;
    e.s(["f", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            n = (0, t.useRef)();
        return n.current || (a += 1, n.current = "".concat(e).concat(a)), n.current
    }])
}, 719392, e => {
    "use strict";
    var t = e.i(463146);

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
    e.s(["B", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "u", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != n(e, t)
    }, "T", 0, function(e) {
        return {
            onFetch: (l, i) => {
                var r, s, d, o, m;
                let u = l.options,
                    c = null == (d = l.fetchOptions) || null == (s = d.meta) || null == (r = s.fetchMore) ? void 0 : r.direction,
                    f = (null == (o = l.state.data) ? void 0 : o.pages) || [],
                    p = (null == (m = l.state.data) ? void 0 : m.pageParams) || [],
                    g = {
                        pages: [],
                        pageParams: []
                    },
                    h = 0,
                    v = async () => {
                        let i = !1,
                            r = (0, t.W)(l.options, l.fetchOptions),
                            s = async (e, a, n) => {
                                let s;
                                if (i) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let d = (Object.defineProperty(s = {
                                        client: l.client,
                                        queryKey: l.queryKey,
                                        pageParam: a,
                                        direction: n ? "backward" : "forward",
                                        meta: l.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (l.signal.aborted ? i = !0 : l.signal.addEventListener("abort", () => {
                                            i = !0
                                        }), l.signal)
                                    }), s),
                                    o = await r(d),
                                    {
                                        maxPages: m
                                    } = l.options,
                                    u = n ? t.R : t.E;
                                return {
                                    pages: u(e.pages, o, m),
                                    pageParams: u(e.pageParams, a, m)
                                }
                            };
                        if (c && f.length) {
                            let e = "backward" === c,
                                t = {
                                    pages: f,
                                    pageParams: p
                                },
                                l = (e ? n : a)(u, t);
                            g = await s(t, l, e)
                        } else {
                            let t = null != e ? e : f.length;
                            do {
                                var d;
                                let e = 0 === h ? null != (d = p[0]) ? d : u.initialPageParam : a(u, g);
                                if (h > 0 && null == e) break;
                                g = await s(g, e), h++
                            } while (h < t)
                        }
                        return g
                    };
                l.options.persister ? l.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = l.options).persister) ? void 0 : e.call(t, v, {
                        client: l.client,
                        queryKey: l.queryKey,
                        meta: l.options.meta,
                        signal: l.signal
                    }, i)
                } : l.fetchFn = v
            }
        }
    }])
}, 886525, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "game-engine-streaming",
        name: "enableExperienceLaunchTimeChart",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}]);

//# debugId=da4697dd-f0f7-7260-cfb8-d329d0107fc5
//# sourceMappingURL=3-stvs4a8k0lb.js.map
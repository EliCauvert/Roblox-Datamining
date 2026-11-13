;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "4ad8cfb1-4a3b-3f26-084c-dc8b960cf4cf")
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
        [g, p] = c(u);

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
            value: p = "on",
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
            value: p,
            hasConsumerStoppedPropagationRef: S,
            required: f,
            defaultChecked: !k(r) && r,
            isFormControl: N,
            bubbleInput: y,
            setBubbleInput: E
        };
        return (0, m.jsx)(g, {
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
                checked: g,
                required: h,
                setControl: b,
                setChecked: x,
                hasConsumerStoppedPropagationRef: w,
                isFormControl: y,
                bubbleInput: E
            } = p(v, i), S = (0, a.j)(n, b), M = t.useRef(g);
            return t.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => x(M.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, x]), (0, m.jsx)(o.f.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": k(g) ? "mixed" : g,
                "aria-required": h,
                "data-state": N(g),
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
            } = e, i = p(w, a);
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
                required: g,
                disabled: h,
                name: v,
                value: b,
                form: x,
                bubbleInput: w,
                setBubbleInput: y
            } = p(E, l), S = (0, a.j)(n, y), N = (0, r.f)(c), M = (0, s.f)(d);
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
                required: g,
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
                g = (0, a.j)(c.ref, (o = (d = null == (r = Object.getOwnPropertyDescriptor((l = f).props, "ref")) ? void 0 : r.get) && "isReactWarning" in d && d.isReactWarning) ? l.ref : (o = (d = null == (s = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : s.get) && "isReactWarning" in d && d.isReactWarning) ? l.props.ref : l.props.ref || l.ref);
            return "function" == typeof u || c.isPresent ? t.cloneElement(f, {
                ref: g
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
            } = e, [f, g] = (0, n.useState)(), p = !!r && r !== f;
            return n.default.createElement("span", {
                ref: i,
                role: s ? "img" : void 0,
                "aria-label": s || void 0,
                "aria-hidden": !s || void 0,
                ...c,
                className: (0, a.U)("foundation-web-avatar-icon inline-flex items-center justify-center shrink-0 [overflow:hidden] radius-circle select-none bg-shift-200 content-emphasis", l[m], u)
            }, p ? n.default.createElement("img", {
                src: r,
                alt: "",
                className: "size-full [object-fit:cover]",
                onError: () => g(r)
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
        g = {
            Pill: "radius-circle",
            Box: "radius-small"
        },
        p = n.default.forwardRef((e, p) => {
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
                ref: p,
                ...S,
                className: (0, a.U)("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", g[E], d[y], k ? [m[y], "justify-center"] : ["width-[fit-content]", o[y]], l[b], i[b], s[b], h)
            }, "Leading" === w && M, v && n.default.createElement("span", {
                className: (0, a.U)("text-no-wrap text-truncate-split", u[y], c[y], N, i[b])
            }, v), "Trailing" === w && M)
        });
    p.displayName = "Badge", e.s(["t", 0, p, "y", 0, ["Neutral", "Standard", "Contrast", "Emphasis", "Success", "Warning", "Alert", "OverMediaLight", "OverMedia"]])
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
        var u, c, f, g;
        let {
            label: p,
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
        } = e, M = (0, i.useContext)(n.i), L = null != (u = null != (c = null == M ? void 0 : M.size) ? c : x) ? u : "Medium", C = null != (f = null != (g = null == M ? void 0 : M.placement) ? g : y) ? f : "Start", U = b || (null == M ? void 0 : M.isDisabled), z = (0, a.f)(), X = S || z, P = M && p && w ? "".concat(X, "Hint") : void 0, O = p && i.default.createElement("label", {
            htmlFor: X,
            className: (0, l.U)("flex flex-col grow-1 gap-xsmall", !U && "cursor-pointer")
        }, i.default.createElement("span", {
            className: (0, l.U)(o[L], m[L], "content-emphasis")
        }, p), w && i.default.createElement("span", {
            id: P,
            className: (0, l.U)(M ? o[L] : "text-body-medium", "content-default")
        }, w));
        return i.default.createElement("div", {
            className: (0, l.U)("foundation-web-checkbox flex gap-medium", U && "opacity-[0.5]", !U && "cursor-pointer", h)
        }, "End" === C && O, i.default.createElement("div", {
            className: (0, l.U)(d[L])
        }, i.default.createElement(r.F, {
            "data-slot": "checkbox",
            className: (0, l.U)(s[L], t.Y, !U && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: X,
            checked: v,
            disabled: U,
            onCheckedChange: E,
            "aria-label": p,
            "aria-describedby": [k, P].filter(Boolean).join(" ") || void 0,
            ...N
        }, i.default.createElement(t.v, null), i.default.createElement(r.S, {
            "data-slot": "checkbox-indicator",
            className: (0, l.U)(s[L], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === C && O)
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
        g = {
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
                onOpenChange: X,
                children: P
            } = e, O = (0, a.f)(), [T, R] = (0, s.useState)(!1), [j, _] = (0, s.useState)(!1), D = void 0 !== N && "" !== N || T;
            (0, s.useEffect)(() => {
                let e = e => {
                        e.metaKey || e.ctrlKey || e.altKey || l.includes(e.key) || _(!0)
                    },
                    t = () => _(!1);
                return window.addEventListener("keydown", e, !0), window.addEventListener("pointerdown", t, !0), () => {
                    window.removeEventListener("keydown", e, !0), window.removeEventListener("pointerdown", t, !0)
                }
            }, []);
            let I = (0, s.useMemo)(() => ({
                    size: S,
                    hasSelection: D,
                    isKeyboardNavigation: j
                }), [S, D, j]),
                A = b ? s.default.createElement("span", {
                    id: O,
                    className: (0, r.U)(c[S], "content-emphasis")
                }, b) : null;
            return s.default.createElement(o.Provider, {
                value: I
            }, s.default.createElement("div", {
                className: (0, r.U)("flex flex-col", L && ["opacity-[0.5]", "pointer-events-none"], g[S], E)
            }, A && (x ? s.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, A, s.default.createElement(n.f, x)) : A), s.default.createElement(d.F, {
                value: N,
                disabled: L,
                onValueChange: e => {
                    void 0 === N && R(!0), null == z || z(e)
                },
                onOpenChange: X
            }, s.default.createElement(d.d, {
                onPointerDownCapture: () => _(!1),
                className: (0, r.U)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", i.L[k], i.U[k], p[S], h[S], u[S], f[S], C ? "stroke-system-alert" : "stroke-contrast-alpha", j && (C ? "focus-visible:stroke-system-alert" : "focus-visible:stroke-system-emphasis"), D ? "content-emphasis" : "content-default"),
                ref: v,
                "aria-labelledby": b ? O : w,
                "aria-label": y
            }, s.default.createElement(t.v, null), s.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, s.default.createElement(d.A, {
                placeholder: M
            })), s.default.createElement(d.W, {
                className: (0, r.U)(m[S], "icon icon-regular-chevron-large-down")
            })), s.default.createElement(d.z, null, s.default.createElement(d.c, {
                position: "popper",
                onPointerMoveCapture: () => _(!1),
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, P))), U && s.default.createElement("span", {
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
                color: g = "Emphasis",
                variant: p = "Standalone",
                underline: h = "hover",
                isExternal: v,
                asChild: b,
                ...x
            } = e, w = (o = null != (d = x.as) ? d : "a", m = "button" === x.as ? void 0 : x.target, void 0 !== v ? v : "button" !== o && void 0 !== m && !l.has(m)), y = (0, t.U)("foundation-web-link", "button" === x.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === p || w) && "inline-flex items-center gap-xsmall", void 0 !== f && i[f], r[g], "always" === h ? "underline" : "no-underline", "hover" === h && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", c), E = w ? a.default.createElement("span", {
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
        n = e.i(651235),
        l = e.i(79533),
        i = e.i(590252),
        r = e.i(854145),
        s = e.i(335020),
        d = e.i(643766),
        o = e.i(637068),
        m = e.i(548223),
        u = e.i(114903);
    let c = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        f = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        g = {
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
        h = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        v = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        b = {
            XSmall: "gap-x-[var(--size-150)]",
            Small: "gap-x-[var(--size-150)]",
            Medium: "gap-x-[var(--size-150)]",
            Large: "gap-x-small"
        },
        x = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-500",
            Large: "size-600"
        },
        w = {
            XSmall: "Small",
            Small: "Medium",
            Medium: "Medium",
            Large: "Large"
        },
        y = {
            XSmall: "Small",
            Small: "Medium",
            Medium: "Medium",
            Large: "Large"
        },
        E = {
            XSmall: "XSmall",
            Small: "Small",
            Medium: "Medium",
            Large: "Large"
        },
        S = {
            XSmall: "Small",
            Small: "Small",
            Medium: "Medium",
            Large: "Large"
        },
        k = {
            XSmall: "XSmall",
            Small: "XSmall",
            Medium: "XSmall",
            Large: "Small"
        },
        N = {
            XSmall: "min-height-600",
            Small: "min-height-800",
            Medium: "min-height-1000",
            Large: "min-height-1200"
        },
        M = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        L = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        C = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-small",
            Large: "text-body-medium"
        },
        U = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        z = {
            XSmall: "width-500",
            Small: "width-600",
            Medium: "width-700",
            Large: "width-800"
        },
        X = {
            XSmall: "height-400",
            Small: "height-400",
            Medium: "height-500",
            Large: "height-600"
        },
        P = "height-[1lh]",
        O = (e, t) => (0, s.U)(z[e], t ? P : X[e]),
        T = e => {
            let {
                children: t
            } = e;
            return d.default.createElement("span", {
                className: (0, s.U)("flex items-center shrink-0", P)
            }, t)
        },
        R = (e, t) => t && null != e ? d.default.createElement(T, null, e) : e,
        j = (e, t, n) => {
            if (null == e || !1 === e) return null;
            let l = d.default.isValidElement(e) && (e.type === B || e.type === a.f),
                i = d.default.isValidElement(e) && e.type === a.f ? d.default.cloneElement(e, {
                    size: y[t]
                }) : e,
                r = d.default.createElement("span", {
                    "data-testid": "foundation-web-menu-leading",
                    className: (0, s.U)("inline-flex shrink-0 items-center justify-center", l && x[t])
                }, i);
            return n ? d.default.createElement(T, null, r) : r
        },
        _ = {
            XSmall: "Small",
            Small: "Small",
            Medium: "Medium",
            Large: "Large"
        },
        D = d.default.forwardRef((e, t) => {
            let {
                size: n,
                className: l,
                ...i
            } = e;
            return d.default.createElement(a.f, {
                ref: t,
                name: "icon-regular-check",
                size: _[n],
                className: (0, s.U)("content-emphasis", l),
                ...i
            })
        });
    D.displayName = "CheckIcon";
    let I = e => {
            let {
                size: t,
                mode: a,
                checked: n,
                hasDescription: l
            } = e;
            return d.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-menu-item-check",
                className: (0, s.U)("flex items-center justify-center shrink-0", O(t, l))
            }, "dropdown" === a ? d.default.createElement(m.j, {
                asChild: !0
            }, d.default.createElement(D, {
                size: t
            })) : n && d.default.createElement(D, {
                size: t
            }))
        },
        A = (0, d.createContext)(null),
        F = (0, d.createContext)(null),
        W = (0, d.createContext)(!1),
        K = () => {
            let e = (0, d.useContext)(A);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        },
        B = e => {
            let {
                type: t,
                src: a,
                alt: n
            } = e, {
                size: l
            } = K(), [r, o] = (0, d.useState)();
            if ("Media" === t) {
                let e = !!a && a !== r;
                return d.default.createElement("span", {
                    "data-testid": "foundation-web-menu-leading-media",
                    className: (0, s.U)("inline-flex shrink-0 [overflow:hidden] radius-xsmall bg-shift-200", x[l])
                }, e ? d.default.createElement("img", {
                    alt: null != n ? n : "",
                    className: "size-full [object-fit:cover]",
                    src: a,
                    onError: () => o(a)
                }) : null)
            }
            return d.default.createElement(i.f, {
                alt: n,
                size: w[l],
                src: a
            })
        };
    e.s(["k", 0, e => {
        var t;
        let {
            children: a,
            className: n,
            size: l
        } = e, i = (0, d.useContext)(r.d), o = i ? "dropdown" : "standalone", g = null != (t = null != l ? l : null == i ? void 0 : i.size) ? t : "Medium", [p, h] = (0, d.useState)(0), v = (0, d.useCallback)(() => (h(e => e + 1), () => h(e => e - 1)), []), b = "standalone" === o && p > 0, x = (0, d.useContext)(W), w = (0, d.useMemo)(() => ({
            size: g,
            mode: o,
            hasCheckedItem: b,
            registerCheckedItem: v
        }), [g, o, b, v]), y = (0, s.U)("foundation-web-menu bg-surface-200 stroke-standard stroke-default shadow-transient-high", c[g], f[g], "[box-sizing:border-box]", n), E = "standalone" === o ? d.default.createElement(u.F, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, d.default.createElement("div", {
            role: x ? "none" : "menu",
            tabIndex: -1,
            className: y
        }, a)) : d.default.createElement("div", {
            className: y
        }, a);
        return d.default.createElement(A.Provider, {
            value: w
        }, "dropdown" === o ? d.default.createElement(m.n, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, E) : E)
    }, "d", 0, e => {
        let l, i, {
                value: c,
                leading: f,
                title: g,
                description: p,
                submenu: x,
                trailing: w,
                isChecked: y = !1,
                disabled: E,
                className: k,
                onSelect: z,
                asChild: X,
                children: P,
                ...O
            } = e,
            {
                size: T,
                mode: _,
                hasCheckedItem: D,
                registerCheckedItem: A
            } = K(),
            B = (0, d.useContext)(r.d);
        (0, d.useLayoutEffect)(() => {
            if ("standalone" === _ && y) return A()
        }, [_, y, A]);
        let q = void 0 !== x,
            V = "standalone" === _ && q,
            H = (0, d.useContext)(F),
            [J, Y] = (0, d.useState)(!1),
            Z = (0, d.useCallback)(() => {
                Y(!1), null == H || H()
            }, [H]);
        if ("dropdown" === _ && q) throw Error("MenuItem `submenu` is only supported in a standalone Menu.");
        let G = "dropdown" === _ && (null == B ? void 0 : B.hasSelection) === !0 || "standalone" === _ && D,
            Q = (0, s.U)(t.Y, "foundation-web-menu-item flex content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full [box-sizing:border-box]", p ? "items-start" : "items-center", "dropdown" === _ && !(null == B ? void 0 : B.isKeyboardNavigation) && "focus-visible:outline-none", L[T], N[T], G ? "padding-left-none" : h[T], G && ("Large" === T ? "padding-right-large" : "padding-right-medium"), v[T], G ? void 0 : b[T], U[T], E && "opacity-[0.5]", E && "pointer-events-none", k),
            $ = "dropdown" === _ ? "group-data-[highlighted]/interactable:bg-[var(--color-state-hover)]" : void 0,
            ee = d.default.createElement("span", {
                className: "foundation-web-menu-item-title min-width-0 text-no-wrap text-truncate-split content-emphasis"
            }, g);
        switch (_) {
            case "dropdown":
                ee = d.default.createElement(m.s, {
                    asChild: !0
                }, ee);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", _)
        }
        let et = d.default.createElement(d.default.Fragment, null, j(f, T, !!p), d.default.createElement("div", {
                className: (0, s.U)("grow-1 min-width-0 flex flex-col", M[T])
            }, ee, p && d.default.createElement("div", {
                className: (0, s.U)("foundation-web-menu-item-description content-muted min-width-0", C[T])
            }, p)), R(V ? d.default.createElement(a.f, {
                className: "content-emphasis",
                "data-testid": "foundation-web-menu-item-chevron",
                name: "icon-regular-chevron-small-right",
                size: S[T]
            }) : w, !!p)),
            ea = e => d.default.createElement(d.default.Fragment, null, !E && d.default.createElement(t.v, {
                className: $
            }), G && d.default.createElement(I, {
                size: T,
                mode: _,
                checked: y,
                hasDescription: !!p
            }), G ? d.default.createElement("div", {
                "data-testid": "foundation-web-menu-item-row",
                className: (0, s.U)("flex grow-1 min-width-0", p ? "items-start" : "items-center", b[T])
            }, e) : e),
            en = ea(et);
        "standalone" === _ && (l = D ? "menuitemcheckbox" : "menuitem");
        let el = "standalone" === _ && D ? y : void 0,
            ei = e => {
                if (!E) {
                    if (V) {
                        e.preventDefault(), Y(e => !e);
                        return
                    }
                    null == z || z(), null == H || H()
                }
            },
            er = e => {
                var t;
                null == (t = O.onKeyDown) || t.call(O, e), e.defaultPrevented || E || !V || "ArrowRight" !== e.key || (e.preventDefault(), Y(!0))
            };
        if (X) {
            let {
                as: e,
                ...t
            } = O, a = d.default.Children.only(P), n = void 0 === g && a.props.children;
            i = d.default.createElement(o.M, {
                ...t,
                role: l,
                "aria-checked": el,
                "aria-disabled": E || void 0,
                "aria-haspopup": V ? "menu" : void 0,
                className: Q,
                style: {
                    outlineOffset: 0
                },
                onClick: E ? void 0 : ei,
                onKeyDown: er
            }, n ? d.default.cloneElement(a, {}, ea(a.props.children)) : d.default.cloneElement(a, {}, en))
        } else if ("a" === O.as) {
            let {
                as: e,
                href: t,
                ...a
            } = O;
            i = d.default.createElement("a", {
                ...a,
                role: l,
                "aria-checked": el,
                "aria-disabled": E,
                "aria-haspopup": V ? "menu" : void 0,
                href: E || V ? void 0 : t,
                className: Q,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: E ? void 0 : ei,
                onKeyDown: er
            }, en)
        } else {
            let {
                as: e,
                ...t
            } = O;
            i = d.default.createElement("button", {
                type: "button",
                ...t,
                role: l,
                "aria-checked": el,
                "aria-disabled": E,
                "aria-haspopup": V ? "menu" : void 0,
                className: Q,
                style: {
                    outlineOffset: 0
                },
                onClick: E ? void 0 : ei,
                onKeyDown: er
            }, en)
        }
        if ("dropdown" === _) return d.default.createElement(m.M, {
            value: c,
            disabled: E,
            asChild: !0
        }, i);
        let es = d.default.createElement(u.M, {
            asChild: !0,
            focusable: !E,
            tabStopId: c
        }, i);
        return V && !E ? d.default.createElement(n.V, {
            open: J,
            onOpenChange: Y
        }, d.default.createElement(n.J, {
            asChild: !0
        }, es), d.default.createElement(n.T, {
            side: "right",
            align: "start",
            role: "menu",
            "aria-label": null != g ? g : c,
            onKeyDown: e => {
                "ArrowLeft" === e.key && (e.preventDefault(), e.stopPropagation(), Y(!1))
            }
        }, d.default.createElement(W.Provider, {
            value: !0
        }, d.default.createElement(F.Provider, {
            value: Z
        }, x)))) : es
    }, "U", 0, e => {
        let {
            title: t,
            description: a,
            leading: n,
            trailing: l,
            disabled: i,
            className: o
        } = e, {
            size: m,
            mode: u,
            hasCheckedItem: c
        } = K(), f = (0, d.useContext)(r.d), g = "dropdown" === u && (null == f ? void 0 : f.hasSelection) === !0 || "standalone" === u && c, p = (0, s.U)("foundation-web-menu-label flex content-default text-truncate-split text-align-x-left width-full [box-sizing:border-box]", a ? "items-start" : "items-center", L[m], N[m], g ? "padding-left-none" : h[m], g && ("Large" === m ? "padding-right-large" : "padding-right-medium"), v[m], g ? void 0 : b[m], i && "opacity-[0.5]", o), x = d.default.createElement(d.default.Fragment, null, j(n, m, !!a), d.default.createElement("div", {
            className: (0, s.U)("grow-1 min-width-0 flex flex-col", M[m])
        }, d.default.createElement("span", {
            className: "foundation-web-menu-label-title min-width-0 text-no-wrap text-truncate-split content-emphasis"
        }, t), a && d.default.createElement("div", {
            className: (0, s.U)("foundation-web-menu-label-description content-muted min-width-0", C[m])
        }, a)), R(l, !!a));
        return d.default.createElement("div", {
            role: "none",
            "data-testid": "foundation-web-menu-label",
            className: p
        }, g && d.default.createElement("span", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-menu-label-check-spacer",
            className: (0, s.U)("shrink-0", O(m, !!a))
        }), g ? d.default.createElement("div", {
            className: (0, s.U)("flex grow-1 min-width-0", a ? "items-start" : "items-center", b[m])
        }, x) : x)
    }, "T", 0, e => {
        let {
            children: t,
            className: a
        } = e, {
            size: n
        } = K();
        return d.default.createElement("div", {
            role: "group",
            className: (0, s.U)("foundation-web-menu-section", g[n], a)
        }, t)
    }, "Z", 0, e => {
        let {
            className: t
        } = e, {
            size: a
        } = K();
        return d.default.createElement("div", {
            role: "separator",
            className: (0, s.U)("foundation-web-menu-separator", p[a], t)
        })
    }, "K", 0, e => {
        let {
            size: t
        } = K(), {
            type: n
        } = e;
        if ("Hint" === n) {
            let {
                text: t
            } = e;
            return d.default.createElement("span", {
                "data-testid": "foundation-web-menu-trailing-hint",
                className: "inline-flex items-center shrink-0 padding-x-xsmall radius-small bg-shift-200 text-caption-medium content-muted"
            }, t)
        }
        if ("Badge" === n) {
            let {
                icon: a,
                label: n,
                variant: i = "Contrast"
            } = e;
            return d.default.createElement(l.t, {
                className: "shrink-0",
                "data-testid": "foundation-web-menu-trailing-badge",
                icon: a,
                label: n,
                size: k[t],
                variant: i
            })
        }
        let {
            name: i
        } = e;
        return d.default.createElement("span", {
            "data-testid": "foundation-web-menu-trailing",
            className: (0, s.U)("inline-flex shrink-0 items-center justify-center", x[t])
        }, d.default.createElement(a.f, {
            className: "content-emphasis",
            name: i,
            size: E[t]
        }))
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
                textClass: g,
                valueContainerSize: p
            } = n[r], h = (c - f) / 2, v = 2 * Math.PI * h, b = c / 2, x = Math.min(100, Math.max(0, d)), w = o && void 0 !== p ? p : c, y = "Determinate" === s;
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
                className: (0, t.U)("absolute content-emphasis flex items-center justify-center", g),
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
            shouldAutoDismiss: g,
            autoDismissDurationMs: p,
            className: h,
            ...v
        } = e, [b, x] = (0, i.useState)("enter"), w = (0, i.useRef)(void 0), y = (0, i.useRef)(void 0), E = (0, i.useRef)(void 0), S = (0, i.useRef)(null), k = null != u ? u : o && m && i.default.createElement(a.f, {
            size: "Small",
            variant: "Utility",
            className: "content-inverse-emphasis",
            onClick: m,
            ref: S
        }, o), N = !!k, M = s.length > 80, L = null == g || g, C = 4e3;
        N && (C = M ? 1e4 : 7e3);
        let U = null != p ? p : C,
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
        let X = {
                position: "fixed",
                left: "50%",
                bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                transform: "translate(-50%, ".concat("idle" === b ? "0" : "120%", ")"),
                zIndex: "var(--foundation-portal-zindex, 9999)"
            },
            P = v.style ? {
                ...X,
                ...v.style
            } : X;
        return i.default.createElement("div", {
            ref: r,
            role: "status",
            "aria-live": "polite",
            className: (0, l.U)("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === b ? "ease-standard-in" : "ease-standard-out", h),
            style: {
                ...P,
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
                    g = (null == (m = l.state.data) ? void 0 : m.pageParams) || [],
                    p = {
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
                                    pageParams: g
                                },
                                l = (e ? n : a)(u, t);
                            p = await s(t, l, e)
                        } else {
                            let t = null != e ? e : f.length;
                            do {
                                var d;
                                let e = 0 === h ? null != (d = g[0]) ? d : u.initialPageParam : a(u, p);
                                if (h > 0 && null == e) break;
                                p = await s(p, e), h++
                            } while (h < t)
                        }
                        return p
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

//# debugId=4ad8cfb1-4a3b-3f26-084c-dc8b960cf4cf
//# sourceMappingURL=20i8h3yvwz0wh.js.map
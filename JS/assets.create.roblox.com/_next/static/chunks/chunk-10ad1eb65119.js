;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "6220dfa6-549d-1e5f-8543-c4c060155827")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 634130, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(120297),
        n = e.i(859726),
        r = e.i(950020),
        l = e.i(517952),
        i = e.i(179510),
        s = e.i(842769),
        o = e.i(989308),
        u = e.i(546633),
        d = e.i(785517),
        c = "Checkbox",
        [m, f] = (0, n.c)(c),
        [p, v] = m(c);

    function g(e) {
        let {
            __scopeCheckbox: a,
            checked: n,
            children: r,
            defaultChecked: i,
            disabled: s,
            form: o,
            name: u,
            onCheckedChange: m,
            required: f,
            value: v = "on",
            internal_do_not_use_render: g
        } = e, [h, y] = (0, l.f)({
            prop: n,
            defaultProp: null != i && i,
            onChange: m,
            caller: c
        }), [b, x] = t.useState(null), [w, E] = t.useState(null), S = t.useRef(!1), N = !b || !!o || !!b.closest("form"), C = {
            checked: h,
            disabled: s,
            setChecked: y,
            control: b,
            setControl: x,
            name: u,
            form: o,
            value: v,
            hasConsumerStoppedPropagationRef: S,
            required: f,
            defaultChecked: !k(i) && i,
            isFormControl: N,
            bubbleInput: w,
            setBubbleInput: E
        };
        return (0, d.jsx)(p, {
            scope: a,
            ...C,
            children: "function" == typeof g ? g(C) : r
        })
    }
    var h = "CheckboxTrigger",
        y = t.forwardRef((e, n) => {
            let {
                __scopeCheckbox: l,
                onKeyDown: i,
                onClick: s,
                ...o
            } = e, {
                control: c,
                value: m,
                disabled: f,
                checked: p,
                required: g,
                setControl: y,
                setChecked: b,
                hasConsumerStoppedPropagationRef: x,
                isFormControl: w,
                bubbleInput: E
            } = v(h, l), S = (0, a.j)(n, y), C = t.useRef(p);
            return t.useEffect(() => {
                let e = null == c ? void 0 : c.form;
                if (e) {
                    let t = () => b(C.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [c, b]), (0, d.jsx)(u.f.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": k(p) ? "mixed" : p,
                "aria-required": g,
                "data-state": N(p),
                "data-disabled": f ? "" : void 0,
                disabled: f,
                value: m,
                ...o,
                ref: S,
                onKeyDown: (0, r.f)(i, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, r.f)(s, e => {
                    b(e => !!k(e) || !e), E && w && (x.current = e.isPropagationStopped(), x.current || e.stopPropagation())
                })
            })
        });
    y.displayName = h;
    var b = t.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: n,
            checked: r,
            defaultChecked: l,
            required: i,
            disabled: s,
            value: o,
            onCheckedChange: u,
            form: c,
            ...m
        } = e;
        return (0, d.jsx)(g, {
            __scopeCheckbox: a,
            checked: r,
            defaultChecked: l,
            disabled: s,
            required: i,
            onCheckedChange: u,
            name: n,
            form: c,
            value: o,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, d.jsxs)(d.Fragment, {
                    children: [(0, d.jsx)(y, {
                        ...m,
                        ref: t,
                        __scopeCheckbox: a
                    }), n && (0, d.jsx)(S, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    b.displayName = c;
    var x = "CheckboxIndicator",
        w = t.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...r
            } = e, l = v(x, a);
            return (0, d.jsx)(o.f, {
                present: n || k(l.checked) || !0 === l.checked,
                children: (0, d.jsx)(u.f.span, {
                    "data-state": N(l.checked),
                    "data-disabled": l.disabled ? "" : void 0,
                    ...r,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    w.displayName = x;
    var E = "CheckboxBubbleInput",
        S = t.forwardRef((e, n) => {
            let {
                __scopeCheckbox: r,
                ...l
            } = e, {
                control: o,
                hasConsumerStoppedPropagationRef: c,
                checked: m,
                defaultChecked: f,
                required: p,
                disabled: g,
                name: h,
                value: y,
                form: b,
                bubbleInput: x,
                setBubbleInput: w
            } = v(E, r), S = (0, a.j)(n, w), N = (0, i.f)(m), C = (0, s.f)(o);
            t.useEffect(() => {
                if (!x) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !c.current;
                if (N !== m && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    x.indeterminate = k(m), e.call(x, !k(m) && m), x.dispatchEvent(a)
                }
            }, [x, N, m, c]);
            let L = t.useRef(!k(m) && m);
            return (0, d.jsx)(u.f.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != f ? f : L.current,
                required: p,
                disabled: g,
                name: h,
                value: y,
                form: b,
                ...l,
                tabIndex: -1,
                ref: S,
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

    function k(e) {
        return "indeterminate" === e
    }

    function N(e) {
        return k(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    S.displayName = E, e.s(["S", 0, w, "F", 0, b])
}, 989308, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(120297),
        n = e.i(206350),
        r = e => {
            var r, i, s;
            let o, u, {
                    present: d,
                    children: c
                } = e,
                m = function(e) {
                    var a, r;
                    let [i, s] = t.useState(), o = t.useRef(null), u = t.useRef(e), d = t.useRef("none"), [c, m] = (a = e ? "mounted" : "unmounted", r = {
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
                        let a = r[e][t];
                        return null != a ? a : e
                    }, a));
                    return t.useEffect(() => {
                        let e = l(o.current);
                        d.current = "mounted" === c ? e : "none"
                    }, [c]), (0, n.f)(() => {
                        let t = o.current,
                            a = u.current;
                        if (a !== e) {
                            let n = d.current,
                                r = l(t);
                            e ? m("MOUNT") : "none" === r || (null == t ? void 0 : t.display) === "none" ? m("UNMOUNT") : a && n !== r ? m("ANIMATION_OUT") : m("UNMOUNT"), u.current = e
                        }
                    }, [e, m]), (0, n.f)(() => {
                        if (i) {
                            var e;
                            let t, a = null != (e = i.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = l(o.current).includes(CSS.escape(e.animationName));
                                    if (e.target === i && n && (m("ANIMATION_END"), !u.current)) {
                                        let e = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = e)
                                        })
                                    }
                                },
                                r = e => {
                                    e.target === i && (d.current = l(o.current))
                                };
                            return i.addEventListener("animationstart", r), i.addEventListener("animationcancel", n), i.addEventListener("animationend", n), () => {
                                a.clearTimeout(t), i.removeEventListener("animationstart", r), i.removeEventListener("animationcancel", n), i.removeEventListener("animationend", n)
                            }
                        }
                        m("ANIMATION_END")
                    }, [i, m]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(c),
                        ref: t.useCallback(e => {
                            o.current = e ? getComputedStyle(e) : null, s(e)
                        }, [])
                    }
                }(d),
                f = "function" == typeof c ? c({
                    present: m.isPresent
                }) : t.Children.only(c),
                p = (0, a.j)(m.ref, (u = (o = null == (i = Object.getOwnPropertyDescriptor((r = f).props, "ref")) ? void 0 : i.get) && "isReactWarning" in o && o.isReactWarning) ? r.ref : (u = (o = null == (s = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : s.get) && "isReactWarning" in o && o.isReactWarning) ? r.props.ref : r.props.ref || r.ref);
            return "function" == typeof c || m.isPresent ? t.cloneElement(f, {
                ref: p
            }) : null
        };

    function l(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    r.displayName = "Presence", e.s(["f", 0, r])
}, 327449, e => {
    "use strict";
    var t = e.i(206241),
        a = e.i(524586),
        n = e.i(335020),
        r = e.i(643766),
        l = e.i(634130);
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
        u = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["f", 0, e => {
        let {
            label: d,
            className: c,
            isChecked: m,
            isDisabled: f,
            size: p,
            hint: v,
            placement: g,
            onCheckedChange: h,
            id: y,
            ...b
        } = e, x = (0, a.f)(), w = y || x, E = d && r.default.createElement("label", {
            htmlFor: w,
            className: (0, n.U)("flex flex-col grow-1 gap-xsmall", !f && "cursor-pointer")
        }, r.default.createElement("span", {
            className: (0, n.U)(o[p], u[p], "content-emphasis")
        }, d), v && r.default.createElement("span", {
            className: "text-body-medium content-default"
        }, v));
        return r.default.createElement("div", {
            className: (0, n.U)("foundation-web-checkbox flex gap-medium", f && "opacity-[0.5]", !f && "cursor-pointer", c)
        }, "End" === g && E, r.default.createElement("div", {
            className: (0, n.U)(s[p])
        }, r.default.createElement(l.F, {
            "data-slot": "checkbox",
            className: (0, n.U)(i[p], t.Y, !f && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: w,
            checked: m,
            disabled: f,
            onCheckedChange: h,
            "aria-label": d,
            ...b
        }, r.default.createElement(t.v, null), r.default.createElement(l.S, {
            "data-slot": "checkbox-indicator",
            className: (0, n.U)(i[p], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === g && E)
    }])
}, 198566, e => {
    "use strict";
    var t = e.i(335020),
        a = e.i(643766);
    let n = (0, a.forwardRef)((e, n) => {
        let {
            className: r,
            style: l,
            orientation: i = "horizontal",
            variant: s = "Standard",
            ...o
        } = e, u = "vertical" === i, d = {};
        return u || "Inset" !== s ? u || "InsetLeft" !== s ? u || "InsetRight" !== s || (d = {
            marginRight: "var(--padding-xlarge)"
        }) : d = {
            marginLeft: "var(--padding-xlarge)"
        } : d = {
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
                ...u ? {
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
                ...d,
                ...l
            },
            className: (0, t.U)("stroke-default self-stretch", r)
        })
    });
    n.displayName = "Divider", e.s(["f", 0, n])
}, 561178, e => {
    "use strict";
    var t = e.i(335020),
        a = e.i(643766),
        n = e.i(637068);
    let r = new Set(["_self", "_parent", "_top"]),
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
        s = (0, a.forwardRef)((e, s) => {
            var o, u, d;
            let {
                children: c,
                className: m,
                size: f,
                color: p = "Emphasis",
                variant: v = "Standalone",
                underline: g = "hover",
                isExternal: h,
                asChild: y,
                ...b
            } = e, x = (u = null != (o = b.as) ? o : "a", d = "button" === b.as ? void 0 : b.target, void 0 !== h ? h : "button" !== u && void 0 !== d && !r.has(d)), w = (0, t.U)("foundation-web-link", "button" === b.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === v || x) && "inline-flex items-center gap-xsmall", void 0 !== f && l[f], i[p], "always" === g ? "underline" : "no-underline", "hover" === g && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", m), E = x ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.U)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (y) {
                let {
                    as: e,
                    ...t
                } = b, r = a.default.Children.only(c);
                return a.default.isValidElement(r) ? a.default.createElement(n.M, {
                    ref: s,
                    ...t,
                    className: w
                }, a.default.cloneElement(r, {}, a.default.createElement(a.default.Fragment, null, r.props.children, E))) : null
            }
            if ("button" === b.as) {
                let {
                    as: e,
                    type: t,
                    ...n
                } = b;
                return a.default.createElement("button", {
                    ref: s,
                    type: null != t ? t : "button",
                    ...n,
                    className: w
                }, c, E)
            }
            let {
                as: S,
                ...k
            } = b;
            return a.default.createElement("a", {
                ref: s,
                ...k,
                className: w
            }, c, E)
        });
    s.displayName = "Link", e.s(["f", 0, s])
}, 879224, 748595, e => {
    "use strict";
    var t = e.i(206241),
        a = e.i(524586),
        n = e.i(752048),
        r = e.i(464627),
        l = e.i(335020),
        i = e.i(643766),
        s = e.i(548223);
    let o = (0, i.createContext)(null),
        u = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        d = {
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
        v = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        g = (0, i.forwardRef)((e, g) => {
            let {
                label: h,
                labelTooltip: y,
                ariaLabelledBy: b,
                ariaLabel: x,
                className: w,
                size: E,
                variant: S = "Standard",
                value: k,
                placeholder: N,
                isDisabled: C,
                hasError: L,
                hint: P,
                onValueChange: T,
                onOpenChange: M,
                children: U
            } = e, A = (0, a.f)(), O = (0, i.useMemo)(() => ({
                size: E
            }), [E]), R = h ? i.default.createElement("span", {
                id: A,
                className: (0, l.U)(c[E], "content-emphasis")
            }, h) : null;
            return i.default.createElement(o.Provider, {
                value: O
            }, i.default.createElement("div", {
                className: (0, l.U)("flex flex-col", C && ["opacity-[0.5]", "pointer-events-none"], f[E], w)
            }, R && (y ? i.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, R, i.default.createElement(n.f, y)) : R), i.default.createElement(s.F, {
                value: k,
                disabled: C,
                onValueChange: T,
                onOpenChange: M
            }, i.default.createElement(s.d, {
                className: (0, l.U)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", r.L[S], r.U[S], p[E], v[E], d[E], m[E], L ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === k ? "content-muted" : "content-default"),
                ref: g,
                "aria-labelledby": h ? A : b,
                "aria-label": x
            }, i.default.createElement(t.v, null), i.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, i.default.createElement(s.A, {
                placeholder: N
            })), i.default.createElement(s.W, {
                className: (0, l.U)(u[E], "icon icon-regular-chevron-large-down content-default")
            })), i.default.createElement(s.z, null, i.default.createElement(s.c, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, U))), P && i.default.createElement("span", {
                className: (0, l.U)("text-caption-small", {
                    "content-system-alert": L,
                    "content-default": !L
                })
            }, P)))
        });
    g.displayName = "Dropdown", e.s(["x", 0, g, "d", 0, o], 748595);
    var h = e.i(637068),
        y = e.i(114903);
    let b = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        x = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        w = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        E = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        S = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        k = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        N = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        C = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        L = (0, i.createContext)(null),
        P = () => {
            let e = (0, i.useContext)(L);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["k", 0, e => {
        var t;
        let {
            children: a,
            className: n,
            size: r
        } = e, u = (0, i.useContext)(o), d = u ? "dropdown" : "standalone", c = null != (t = null != r ? r : null == u ? void 0 : u.size) ? t : "Medium", m = (0, i.useMemo)(() => ({
            size: c,
            mode: d
        }), [c, d]), f = (0, l.U)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", b[c], n), p = "standalone" === d ? i.default.createElement(y.F, {
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
        }, "dropdown" === d ? i.default.createElement(s.n, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, p) : p)
    }, "d", 0, e => {
        let a, {
                value: n,
                leading: r,
                title: o,
                description: u,
                trailing: d,
                disabled: c,
                className: m,
                onSelect: f,
                asChild: p,
                children: v,
                ...g
            } = e,
            {
                size: b,
                mode: x
            } = P(),
            L = (0, l.U)(t.Y, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", N[b], w[b], E[b], S[b], C[b], c && "opacity-[0.5]", c && "pointer-events-none", m),
            T = i.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, o);
        switch (x) {
            case "dropdown":
                T = i.default.createElement(s.s, {
                    asChild: !0
                }, T);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", x)
        }
        let M = i.default.createElement(i.default.Fragment, null, !c && i.default.createElement(t.v, null), r, i.default.createElement("div", {
            className: (0, l.U)("grow-1 text-truncate-split flex flex-col", k[b])
        }, T, u && i.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, u)), d);
        if (p) {
            let {
                as: e,
                ...n
            } = g, r = i.default.Children.only(v), l = void 0 === o && r.props.children;
            a = i.default.createElement(h.M, {
                ...n,
                role: "standalone" === x ? "menuitem" : void 0,
                "aria-disabled": c || void 0,
                className: L,
                style: {
                    outlineOffset: 0
                },
                onClick: c ? void 0 : f
            }, l ? i.default.cloneElement(r, {}, i.default.createElement(i.default.Fragment, null, !c && i.default.createElement(t.v, null), r.props.children)) : i.default.cloneElement(r, {}, M))
        } else if ("a" === g.as) {
            let {
                as: e,
                href: t,
                ...n
            } = g;
            a = i.default.createElement("a", {
                ...n,
                role: "standalone" === x ? "menuitem" : void 0,
                "aria-disabled": c,
                href: c ? void 0 : t,
                className: L,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: c ? void 0 : f
            }, M)
        } else {
            let {
                as: e,
                ...t
            } = g;
            a = i.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === x ? "menuitem" : void 0,
                "aria-disabled": c,
                className: L,
                style: {
                    outlineOffset: 0
                },
                onClick: c ? void 0 : f
            }, M)
        }
        return "dropdown" === x ? i.default.createElement(s.M, {
            value: n,
            disabled: c,
            asChild: !0
        }, a) : i.default.createElement(y.M, {
            asChild: !0,
            focusable: !0,
            tabStopId: n
        }, a)
    }, "U", 0, e => {
        let {
            title: t,
            description: a,
            leading: n,
            trailing: r,
            disabled: s,
            className: o
        } = e, {
            size: u
        } = P(), d = (0, l.U)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", N[u], w[u], E[u], S[u], s && "opacity-[0.5]", o);
        return i.default.createElement("div", {
            role: "none",
            className: d
        }, n, i.default.createElement("div", {
            className: (0, l.U)("grow-1 text-truncate-split flex flex-col", k[u])
        }, i.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), a && i.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, a)), r)
    }, "T", 0, e => {
        let {
            children: t,
            className: a
        } = e, {
            size: n
        } = P();
        return i.default.createElement("div", {
            role: "group",
            className: (0, l.U)(x[n], a)
        }, t)
    }, "Z", 0, e => {
        let {
            className: t
        } = e;
        return i.default.createElement("div", {
            role: "separator",
            className: (0, l.U)("foundation-web-menu-separator", t)
        })
    }], 879224)
}, 43594, e => {
    "use strict";
    var t = e.i(335020),
        a = e.i(643766),
        n = e.i(539377);
    let r = e => {
        var t, a, n, r, l, i;
        let s = null != (t = null == (n = (r = window).matchMedia) || null == (a = n.call(r, "(pointer: coarse)")) ? void 0 : a.matches) && t,
            o = null == (l = document.activeElement) ? void 0 : l.matches(":focus-visible");
        if (s && !o) return void e.preventDefault();
        let u = null == (i = e.currentTarget) ? void 0 : i.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        u && (e.preventDefault(), u.focus())
    };
    e.s(["V", 0, function(e) {
        let {
            open: t,
            defaultOpen: r,
            onOpenChange: l,
            children: i
        } = e;
        return a.createElement(n.F, {
            open: t,
            defaultOpen: r,
            onOpenChange: l
        }, i)
    }, "r", 0, function(e) {
        let {
            asChild: t,
            className: r,
            children: l
        } = e;
        return a.createElement(n.g, {
            asChild: t,
            className: r
        }, l)
    }, "T", 0, function(e) {
        let {
            side: l = "bottom",
            align: i = "center",
            sideOffset: s = 4,
            className: o,
            children: u,
            ariaLabel: d,
            onOpenAutoFocus: c,
            ...m
        } = e;
        return a.createElement(n.z, null, a.createElement(n.c, {
            side: l,
            align: i,
            sideOffset: s,
            ...m,
            "aria-label": null != d ? d : m["aria-label"],
            onOpenAutoFocus: null != c ? c : r,
            className: (0, t.U)("foundation-web-portal-zindex", o)
        }, u))
    }, "J", 0, function(e) {
        let {
            asChild: t,
            disabled: r,
            className: l,
            children: i
        } = e;
        return a.createElement(n.d, {
            asChild: t,
            disabled: r,
            className: l
        }, i)
    }])
}, 69230, e => {
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
        r = a.default.forwardRef((e, r) => {
            let {
                className: l,
                size: i = "Large",
                variant: s = "Determinate",
                value: o = 0,
                showValue: u = !1,
                ariaLabel: d,
                ...c
            } = e, {
                dimension: m,
                strokeWidth: f,
                textClass: p,
                valueContainerSize: v
            } = n[i], g = (m - f) / 2, h = 2 * Math.PI * g, y = m / 2, b = Math.min(100, Math.max(0, o)), x = u && void 0 !== v ? v : m, w = "Determinate" === s;
            return a.default.createElement("div", {
                ref: r,
                className: (0, t.U)("foundation-web-progress-circle inline-flex items-center justify-center", l),
                role: "progressbar",
                "aria-label": d,
                "aria-valuemin": w ? 0 : void 0,
                "aria-valuemax": w ? 100 : void 0,
                "aria-valuenow": w ? b : void 0,
                style: {
                    width: x,
                    height: x
                },
                ...c
            }, a.default.createElement("svg", {
                width: m,
                height: m,
                viewBox: "0 0 ".concat(m, " ").concat(m),
                className: "relative"
            }, a.default.createElement("circle", {
                cx: y,
                cy: y,
                r: g,
                fill: "none",
                strokeWidth: f,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), a.default.createElement("circle", {
                cx: y,
                cy: y,
                r: g,
                fill: "none",
                strokeWidth: f,
                strokeDasharray: w ? h : "".concat(.75 * h, " ").concat(.25 * h),
                strokeDashoffset: w ? h * (1 - b / 100) : 0,
                strokeLinecap: "round",
                className: (0, t.U)(!w && "foundation-web-progress-circle-indeterminate"),
                style: w ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), w && u && "Large" === i && a.default.createElement("div", {
                className: (0, t.U)("absolute content-emphasis flex items-center justify-center", p),
                "aria-hidden": "true"
            }, a.default.createElement("span", null, Math.round(b)), a.default.createElement("span", null, "%")))
        });
    r.displayName = "ProgressCircle", e.s(["f", 0, r])
}, 428505, e => {
    "use strict";
    var t = e.i(746878),
        a = e.i(609305),
        n = e.i(315738),
        r = e.i(335020),
        l = e.i(643766);
    let i = (0, l.forwardRef)((e, i) => {
        let {
            title: s,
            icon: o,
            actionLabel: u,
            onAction: d,
            actions: c,
            onClose: m,
            closeIconAriaLabel: f = "Dismiss snackbar",
            shouldAutoDismiss: p,
            autoDismissDurationMs: v,
            className: g,
            ...h
        } = e, [y, b] = (0, l.useState)("enter"), x = (0, l.useRef)(void 0), w = (0, l.useRef)(void 0), E = (0, l.useRef)(void 0), S = (0, l.useRef)(null), k = null != c ? c : u && d && l.default.createElement(a.f, {
            size: "Small",
            variant: "Utility",
            className: "content-inverse-emphasis",
            onClick: d,
            ref: S
        }, u), N = !!k, C = s.length > 80, L = null == p || p, P = 4e3;
        N && (P = C ? 1e4 : 7e3);
        let T = null != v ? v : P,
            M = (0, l.useCallback)(() => {
                "exit" !== y && (b("exit"), void 0 !== w.current && (window.clearTimeout(w.current), w.current = void 0), E.current = window.setTimeout(() => {
                    null == m || m()
                }, 150))
            }, [m, y]);
        (0, l.useEffect)(() => (x.current = window.requestAnimationFrame(() => {
            b("idle")
        }), () => {
            void 0 !== x.current && window.cancelAnimationFrame(x.current)
        }), []), (0, l.useEffect)(() => {
            void 0 !== w.current && (window.clearTimeout(w.current), w.current = void 0), L && "exit" !== y && (w.current = window.setTimeout(() => {
                M()
            }, T))
        }, [T, L, y, M]), (0, l.useEffect)(() => {
            var e;
            N && (null == (e = S.current) || e.focus())
        }, [N]), (0, l.useEffect)(() => () => {
            void 0 !== w.current && window.clearTimeout(w.current), void 0 !== E.current && window.clearTimeout(E.current), void 0 !== x.current && window.cancelAnimationFrame(x.current)
        }, []);
        let U = {
                position: "fixed",
                left: "50%",
                bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                transform: "translate(-50%, ".concat("idle" === y ? "0" : "120%", ")"),
                zIndex: "var(--foundation-portal-zindex, 9999)"
            },
            A = h.style ? {
                ...U,
                ...h.style
            } : U;
        return l.default.createElement("div", {
            ref: i,
            role: "status",
            "aria-live": "polite",
            className: (0, r.U)("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === y ? "ease-standard-in" : "ease-standard-out", g),
            style: {
                ...A,
                transitionDuration: "".concat("exit" === y ? 150 : 200, "ms"),
                transitionProperty: "transform"
            },
            ...h
        }, l.default.createElement("div", {
            className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
        }, o && l.default.createElement(t.f, {
            name: o,
            size: "Small",
            className: "shrink-0 content-inverse-emphasis"
        }), l.default.createElement("div", {
            className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
        }, s)), l.default.createElement("div", {
            className: "flex items-center justify-end gap-small shrink-0"
        }, k, m && l.default.createElement(n.f, {
            variant: "Utility",
            size: "Small",
            isCircular: !0,
            className: "content-inverse-emphasis",
            "aria-label": f,
            onClick: M
        })))
    });
    e.s(["f", 0, i])
}, 752048, e => {
    "use strict";
    var t = e.i(746878),
        a = e.i(910281),
        n = e.i(643766);
    e.s(["f", 0, e => {
        let {
            title: r,
            description: l,
            position: i = "top-center"
        } = e;
        return n.default.createElement(a.W, {
            position: i,
            title: r,
            description: l
        }, n.default.createElement(a.y, {
            asChild: !0
        }, n.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": r,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, n.default.createElement(t.f, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }])
}, 464627, e => {
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
}, 524586, e => {
    "use strict";
    var t = e.i(643766);
    let a = 0;
    e.s(["f", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            n = (0, t.useRef)();
        return n.current || (a += 1, n.current = "".concat(e).concat(a)), n.current
    }])
}, 12246, e => {
    "use strict";
    var t = e.i(225226),
        a = e.i(643766),
        n = e.i(26734);
    e.i(785517), e.i(860663);
    var r = (0, a.createContext)({
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
            d = (0, t.a)(e, ["children"]),
            c = (0, a.useRef)(null),
            m = (0, a.useState)(!1),
            f = m[0],
            p = m[1],
            v = (0, a.useState)([]),
            g = v[0],
            h = v[1],
            y = (0, a.useCallback)(function(e, a) {
                void 0 === e && (e = {}), void 0 === a && (a = function() {
                    return !0
                }), h(function(n) {
                    return (0, t.b)((0, t.b)([], n, !0), [{
                        props: e,
                        shouldClose: a
                    }], !1)
                })
            }, [h]),
            b = (0, a.useCallback)(function() {
                p(!1)
            }, [p]);
        (0, a.useEffect)(function() {
            g.length > 0 && p(!0)
        }, [g.length]);
        var x = (0, a.useMemo)(function() {
            return {
                ref: c,
                enqueue: y,
                close: b
            }
        }, [b, y]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(r.Provider, {
            value: x
        }, u), a.default.createElement(n.S, (0, t._)({}, (null == (l = g[0]) ? void 0 : l.props) || {}, d, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (s = null == (i = g[0]) ? void 0 : i.props) ? void 0 : s.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, n, r, l;
                    h(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (n = null == (a = g[0]) ? void 0 : a.props.TransitionProps) ? void 0 : n.onExited) && (null == (l = null == (r = g[0]) ? void 0 : r.props.TransitionProps) || l.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, n, r;
                (null == (a = g[0]) ? void 0 : a.shouldClose(t)) && p(!1), (null == (n = g[0]) ? void 0 : n.props.onClose) && (null == (r = g[0]) || r.props.onClose(e, t))
            },
            open: f
        }), null == (o = g[0]) ? void 0 : o.props.children))
    }, "J", 0, function() {
        var e = (0, a.useContext)(r);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 719392, e => {
    "use strict";
    var t = e.i(463146);

    function a(e, t) {
        let {
            pages: a,
            pageParams: n
        } = t, r = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[r], a, n[r], n) : void 0
    }

    function n(e, t) {
        var a;
        let {
            pages: n,
            pageParams: r
        } = t;
        return n.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, n[0], n, r[0], r) : void 0
    }
    e.s(["B", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "u", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != n(e, t)
    }, "T", 0, function(e) {
        return {
            onFetch: (r, l) => {
                var i, s, o, u, d;
                let c = r.options,
                    m = null == (o = r.fetchOptions) || null == (s = o.meta) || null == (i = s.fetchMore) ? void 0 : i.direction,
                    f = (null == (u = r.state.data) ? void 0 : u.pages) || [],
                    p = (null == (d = r.state.data) ? void 0 : d.pageParams) || [],
                    v = {
                        pages: [],
                        pageParams: []
                    },
                    g = 0,
                    h = async () => {
                        let l = !1,
                            i = (0, t.W)(r.options, r.fetchOptions),
                            s = async (e, a, n) => {
                                let s;
                                if (l) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(s = {
                                        client: r.client,
                                        queryKey: r.queryKey,
                                        pageParam: a,
                                        direction: n ? "backward" : "forward",
                                        meta: r.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (r.signal.aborted ? l = !0 : r.signal.addEventListener("abort", () => {
                                            l = !0
                                        }), r.signal)
                                    }), s),
                                    u = await i(o),
                                    {
                                        maxPages: d
                                    } = r.options,
                                    c = n ? t.R : t.E;
                                return {
                                    pages: c(e.pages, u, d),
                                    pageParams: c(e.pageParams, a, d)
                                }
                            };
                        if (m && f.length) {
                            let e = "backward" === m,
                                t = {
                                    pages: f,
                                    pageParams: p
                                },
                                r = (e ? n : a)(c, t);
                            v = await s(t, r, e)
                        } else {
                            let t = null != e ? e : f.length;
                            do {
                                var o;
                                let e = 0 === g ? null != (o = p[0]) ? o : c.initialPageParam : a(c, v);
                                if (g > 0 && null == e) break;
                                v = await s(v, e), g++
                            } while (g < t)
                        }
                        return v
                    };
                r.options.persister ? r.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = r.options).persister) ? void 0 : e.call(t, h, {
                        client: r.client,
                        queryKey: r.queryKey,
                        meta: r.options.meta,
                        signal: r.signal
                    }, l)
                } : r.fetchFn = h
            }
        }
    }])
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
}, 846130, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportAccountTranslationPreference",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1
        }),
        r = (0, t.e)({
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
        d = (0, t.e)({
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1
        });
    e.s(["E", 0, d, "w", 0, l, "k", 0, n, "Z", 0, a, "n", 0, s, "N", 0, o, "z", 0, i, "_", 0, u, "b", 0, r])
}, 787617, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "creator-platform",
            name: "isCreationsNavigationReorderEnabled",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "creator-platform",
            name: "tryOnWebButtonEnabled",
            defaultValue: !1
        });
    e.s(["a", 0, a, "K", 0, n])
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
    let a = /{(.+?)}/g,
        n = (e, t) => void 0 === t || 0 === Object.keys(t).length ? e : e.replace(a, (e, a) => {
            var n;
            return null != (n = t[a]) ? n : "{".concat(a, "}")
        });
    e.s(["f", 0, n], 884213);
    let r = /{(.+?)}/,
        l = /({.+?})/g,
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
        u = (e, t) => t.isDangerous ? "[!!".concat(e, "!!]") : e;
    var d = e.i(730530);
    e.s(["f", 0, e => {
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
                translate: (0, d.O)(f),
                translateHTML: (0, d.t)(f),
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
                    return (e, r, l, i) => {
                        let s = o();
                        if (!s.isAllowed) return a(l, i);
                        if (s.preferLoadedTranslations && t) {
                            let e = a(l, i);
                            if (e.length > 0) return e
                        }
                        return n(s.preferLoadedTranslations && !t ? e : u(e, s), i)
                    }
                })(e),
                tPendingHtmlTranslation: (e => {
                    let {
                        ready: a,
                        translateHTML: i
                    } = e;
                    return (e, s, d, c, m) => {
                        let f = o();
                        if (!f.isAllowed) return i(d, c, m);
                        if (f.preferLoadedTranslations && a) {
                            let e = i(d, c, m);
                            if ("" !== e) return e
                        }
                        return ((e, a, i) => {
                            let s, o;
                            if (void 0 === a && void 0 === i) return e;
                            let {
                                stringArgs: u,
                                htmlArgs: d
                            } = (s = {}, o = {}, void 0 === i || Object.entries(i).forEach(e => {
                                let [t, a] = e;
                                "string" == typeof a ? s[t] = a : o[t] = a
                            }), {
                                stringArgs: s,
                                htmlArgs: o
                            }), c = n(e, u), m = c.split(l).filter(e => !!e);
                            if (1 === m.length) return c;
                            let f = [...m];
                            if (0 !== Object.keys(d).length) {
                                let e = m.reduce((e, t, a) => {
                                    let n = r.exec(t);
                                    if (n) {
                                        let t = n[1];
                                        if (Object.hasOwn(d, t)) {
                                            let n = e[t];
                                            if (!n) return Object.assign(e, {
                                                [t]: [a]
                                            });
                                            n.push(a)
                                        }
                                    }
                                    return e
                                }, {});
                                Object.entries(d).forEach(t => {
                                    let [a, n] = t, r = e[a];
                                    r && r.forEach(e => {
                                        f[e] = n
                                    })
                                })
                            }
                            if (!Array.isArray(a) || 0 === a.length) return (0, t.createElement)(t.Fragment, null, ...f);
                            let p = a.reduce((e, t) => {
                                    let {
                                        opening: a,
                                        closing: n,
                                        content: r
                                    } = t;
                                    return Object.assign(e, {
                                        ["{".concat(a, "}")]: {
                                            match: "{".concat(n, "}"),
                                            content: r
                                        }
                                    })
                                }, {}),
                                v = [],
                                g = [],
                                h = [];
                            for (let e = f.shift(); void 0 !== e; e = f.shift())
                                if ("string" == typeof e && r.test(e))
                                    if (Object.hasOwn(p, e)) g.push(e), h.push(e);
                                    else {
                                        let a = g.pop();
                                        if (void 0 !== a) {
                                            let {
                                                match: n,
                                                content: r
                                            } = p[a];
                                            if (e !== n) break;
                                            let l = [],
                                                i = !1;
                                            for (; h.length > 0 && !i;) {
                                                let e = h.pop();
                                                e === a ? i = !0 : l.unshift(e)
                                            }
                                            let s = r(l.every(e => "string" == typeof e) ? l : (0, t.createElement)(t.Fragment, null, ...l));
                                            0 === h.length ? v.push(s) : h.push(s)
                                        }
                                    }
                            else 0 === h.length ? v.push(e) : h.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...v)
                        })(f.preferLoadedTranslations && !a ? e : u(e, f), c, m)
                    }
                })(e)
            }
        }, [f])
    }], 401263)
}, 998683, e => {
    "use strict";
    var t = e.i(805290),
        a = e.i(658867),
        n = e.i(272593);
    let r = new class {
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
            (0, t._)(this, "localeApi", void 0), this.localeApi = new a.J((0, n.f)("locale", "bedev1"))
        }
    };
    e.s(["f", 0, r])
}, 927868, e => {
    "use strict";
    e.s(["h", 0, (e, t) => {
        let a = Object.entries(e).find(e => {
            let [, a] = e;
            return a === t
        });
        return a ? a[0] : null
    }, "I", 0, (e, t) => e.includes(t), "s", 0, (e, t) => Object.values(e).includes(t)])
}, 745873, 67262, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        n = e.i(458451),
        r = e.i(533414),
        l = e.i(910272),
        i = e.i(947024),
        s = e.i(602635),
        o = e.i(814975);
    let u = (0, e.i(272593).f)("creator-home-api", "bedev2"),
        d = new i._(u),
        c = new i.k(u),
        m = {
            groupsApi: c,
            userScreenApi: d,
            creatorHomeContentApi: new i.D(u),
            signalsApi: new i.f(u)
        };
    e.s(["f", 0, m], 67262);
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
                }, m.groupsApi.groupsListGroups(e)
            }
        })
    };
    var p = e.i(809576);
    let v = (0, a.createContext)(null);
    e.s(["e", 0, e => {
        let {
            children: l
        } = e, {
            user: i
        } = (0, n.s)(), s = (0, p.h)(), {
            data: o,
            isLoading: u,
            refetch: d
        } = f(), [c, m] = (0, r.j)("creatorHubGroups.".concat(null == i ? void 0 : i.id), null), [g, h] = (0, r.j)("creatorHubGroup.".concat(null == i ? void 0 : i.id), null), [y, b] = (0, r.j)("creatorHubGroupData.".concat(null == i ? void 0 : i.id), {}), x = (0, a.useCallback)(e => {
            h(e);
            let t = null != e ? e : "user";
            b(e => {
                let a = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: n,
                        lastSelected: r
                    } = e[t];
                    "number" != typeof n || Number.isNaN(n) || "number" != typeof r || Number.isNaN(r) || (a.priority = n * (1 + Math.log10(1 + 10 / Math.max(Date.now() - r, 864e5))))
                }
                return {
                    ...e,
                    [t]: a
                }
            })
        }, [h, b]), w = (0, a.useMemo)(() => {
            if (null == o ? void 0 : o.groups) return null == o ? void 0 : o.groups;
            if (null === c) return [];
            try {
                let e = "string" == typeof c ? JSON.parse(c) : c;
                return Array.isArray(e) && e.every(e => "object" == typeof e && null !== e && "id" in e && "number" == typeof e.id && "name" in e && "string" == typeof e.name && "roleSetName" in e && "string" == typeof e.roleSetName) ? e : []
            } catch (e) {
                return []
            }
        }, [c, null == o ? void 0 : o.groups]), E = (0, a.useMemo)(() => {
            var e;
            return g && null != (e = w.find(e => {
                let {
                    id: t
                } = e;
                return t === g
            })) ? e : null
        }, [g, w]), S = null == E ? void 0 : E.id, k = null == i ? void 0 : i.id, {
            data: N,
            error: C,
            isPending: L,
            refetch: P
        } = (0, p.$)(S, k), {
            data: T,
            isPending: M,
            refetch: U
        } = (0, p.V)(S, k), A = (0, a.useCallback)(() => null == S || null == k ? Promise.resolve() : Promise.all([P(), U()]), [U, P, S, k]);
        (0, a.useEffect)(() => {
            (null == i ? void 0 : i.id) && (null == o ? void 0 : o.groups) && !u && m(null == o ? void 0 : o.groups)
        }, [null == o ? void 0 : o.groups, w, u, m, null == i ? void 0 : i.id]);
        let O = (0, a.useMemo)(() => {
            var e;
            return {
                groups: w,
                currentGroup: E,
                groupData: y,
                isFetched: !u && !!k,
                refreshGroups: d,
                setCurrentGroup: x,
                ...s,
                permissions: N,
                isOwner: null != k && (null == T || null == (e = T.owner) ? void 0 : e.userId) === k,
                isPermissionsLoading: null != E && (L || M),
                permissionsError: C,
                refreshPermissions: A
            }
        }, [E, y, w, u, M, L, T, s, N, C, d, A, x, k]);
        return (0, t.jsx)(v.Provider, {
            value: O,
            children: l
        })
    }, "W", 0, () => {
        let e = (0, a.useContext)(v);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "_", 0, () => {
        let e = (0, a.useContext)(v);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 809576, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(463146),
        n = e.i(910272),
        r = e.i(228096),
        l = e.i(458451),
        i = e.i(93714),
        s = e.i(272593);
    let o = new i.A((0, s.f)("groups", "bedev1"));
    async function u(e, t, a) {
        var n;
        return null != (n = (await o.v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet({
            groupId: e,
            entityType: t,
            entityId: a
        })).permissions) ? n : {}
    }
    async function d(e) {
        return u(e, "groups", String(e))
    }
    async function c(e) {
        let t, a = [];
        do {
            var n, r;
            let l = await o.v2GroupsGroupIdEntityTypePermissionsResolvedGet({
                groupId: e,
                entityType: "roles",
                cursor: t
            });
            a.push(...null != (n = l.data) ? n : []), t = null != (r = l.nextPageCursor) ? r : void 0
        } while (t) return a
    }
    var m = e.i(156071);
    let f = new i.A((0, s.f)("groups", "bedev1"));
    async function p(e) {
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
        return (0, n.f)({
            queryKey: ["groups", e, t, "owner"],
            queryFn: e && t ? () => m.U.getGroupInfo(e) : a.V
        })
    }, "h", 0, function() {
        let {
            user: e
        } = (0, l.s)(), a = (0, r.d)(), n = null == e ? void 0 : e.id, i = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: y(e, n),
            queryFn: () => p(e),
            staleTime: 6e4
        }), [a, n]), s = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: g(e, n),
            queryFn: () => d(e),
            staleTime: 6e4
        }), [a, n]), o = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: h(e, n),
            queryFn: () => c(e),
            staleTime: 6e4
        }), [a, n]);
        return (0, t.useMemo)(() => ({
            fetchGroupPermissions: s,
            fetchRolePermissions: o,
            fetchUniversePermissions: i
        }), [s, o, i])
    }, "$", 0, function(e, t) {
        return (0, n.f)({
            queryKey: g(e, t),
            queryFn: e && t ? () => d(e) : a.V,
            staleTime: 6e4
        })
    }, "K", 0, function(e) {
        let {
            user: t
        } = (0, l.s)(), r = null == t ? void 0 : t.id;
        return (0, n.f)({
            queryKey: h(e, r),
            queryFn: e && r ? () => c(e) : a.V,
            staleTime: 6e4
        })
    }, "v", 0, function(e) {
        let {
            user: t
        } = (0, l.s)(), r = null == t ? void 0 : t.id;
        return (0, n.f)({
            queryKey: y(e, r),
            queryFn: void 0 !== e && e !== v.h ? () => p(e) : a.V,
            staleTime: 6e4
        })
    }], 809576)
}, 725924, e => {
    "use strict";
    let t, a;
    var n, r, l = e.i(643766);
    let i = "u" > typeof Intl,
        s = !i || void 0 === Intl.Locale,
        o = !i || void 0 === Intl.RelativeTimeFormat,
        u = !i || void 0 === Intl.PluralRules,
        d = !i || void 0 === Intl.DisplayNames,
        c = "function" != typeof window.ResizeObserver,
        m = (n = s || o || u || d || c, r = function() {
            return Promise.all([(s ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([o ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, u ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, d ? e.A(951862).then(() => e.A(890267)) : null])), c ? e.A(956827) : null])
        }, t = !1, a = n ? r().catch(() => {}).then(() => {
            t = !0
        }) : null, function() {
            let [e, n] = (0, l.useState)(!a || t);
            return (0, l.useEffect)(() => {
                a && !e && a.then(() => n(!0))
            }, [e]), e
        });
    e.s(["f", 0, m], 725924)
}, 823062, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(230644);
    let n = (0, t.createContext)(null),
        r = [],
        l = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        i = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);

    function s() {
        let e = (0, t.useContext)(n);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }
    let o = () => null;
    e.s(["d", 0, e => {
        var s;
        let {
            children: o,
            unifiedLogger: u,
            pageLoggerConfig: d,
            path: c,
            url: m,
            isReady: f = !0
        } = e, p = null != (s = null == d ? void 0 : d.tags) ? s : r, v = null == d ? void 0 : d.rosId, g = (0, t.useMemo)(() => ({
            tags: p,
            rosId: v,
            path: c,
            url: m,
            isReady: f
        }), [p, v, c, m, f]), h = (0, t.useRef)(g), y = (0, t.useRef)(g);
        (0, t.useLayoutEffect)(() => {
            y.current = g, void 0 === h.current.path && void 0 !== g.path && (h.current = {
                ...h.current,
                path: g.path
            })
        }, [g]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let n;
                if (e instanceof a.W && void 0 !== e.pageContext) return;
                let r = (n = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== n && i.has(n)) ? h.current : y.current;
                void 0 !== r.path && (e.parameters = {
                    ...e.parameters,
                    path: r.path
                }), r.tags.forEach(t => e.addTag(t)), void 0 !== r.rosId && e.addTag("owner: ".concat(r.rosId))
            };
            return l.forEach(t => {
                u.events.on(t, e)
            }), () => {
                l.forEach(t => {
                    u.events.off(t, e)
                })
            }
        }, [u]);
        let b = (0, t.useMemo)(() => ({
            unifiedLogger: u,
            pageContext: g
        }), [u, g]);
        return t.default.createElement(n.Provider, {
            value: b
        }, o)
    }, "W", 0, function() {
        return (0, t.useContext)(n)
    }, "G", 0, e => {
        let {
            unifiedLogger: a,
            pageContext: n
        } = s(), {
            path: r,
            url: l,
            isReady: i
        } = n, u = a.pageSettledTracker, d = (0, t.useSyncExternalStore)(u.subscribe, u.getSnapshot, o);
        (0, t.useEffect)(() => {
            if (!d || d.isNavigating || !i || !r || !l || !e || d.url.split(/[?#]/)[0] !== l.split(/[?#]/)[0]) return;
            let t = new URL(r, window.location.origin).pathname,
                n = requestAnimationFrame(() => {
                    n = requestAnimationFrame(() => {
                        a.logPageSettledEvent({
                            navigationId: d.id,
                            page: t,
                            outcome: e
                        })
                    })
                });
            return () => cancelAnimationFrame(n)
        }, [d, i, l, r, e, a])
    }, "X", 0, s])
}]);

//# debugId=6220dfa6-549d-1e5f-8543-c4c060155827
//# sourceMappingURL=3wr9k0gfsdcrc.js.map
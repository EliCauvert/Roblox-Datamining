;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "5aaf253a-b15c-b4f1-1160-5266a69fcf42")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 756568, e => {
    "use strict";
    var t = e.i(776344);
    e.s(["Flex", () => t.default])
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        n = e.i(723570),
        l = e => {
            var l, r, d;
            let s, o, {
                    present: u,
                    children: c
                } = e,
                m = function(e) {
                    var a, l;
                    let [r, d] = t.useState(), s = t.useRef(null), o = t.useRef(e), u = t.useRef("none"), [c, m] = (a = e ? "mounted" : "unmounted", l = {
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
                        let e = i(s.current);
                        u.current = "mounted" === c ? e : "none"
                    }, [c]), (0, n.useLayoutEffect)(() => {
                        let t = s.current,
                            a = o.current;
                        if (a !== e) {
                            let n = u.current,
                                l = i(t);
                            e ? m("MOUNT") : "none" === l || (null == t ? void 0 : t.display) === "none" ? m("UNMOUNT") : a && n !== l ? m("ANIMATION_OUT") : m("UNMOUNT"), o.current = e
                        }
                    }, [e, m]), (0, n.useLayoutEffect)(() => {
                        if (r) {
                            var e;
                            let t, a = null != (e = r.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = i(s.current).includes(CSS.escape(e.animationName));
                                    if (e.target === r && n && (m("ANIMATION_END"), !o.current)) {
                                        let e = r.style.animationFillMode;
                                        r.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === r.style.animationFillMode && (r.style.animationFillMode = e)
                                        })
                                    }
                                },
                                l = e => {
                                    e.target === r && (u.current = i(s.current))
                                };
                            return r.addEventListener("animationstart", l), r.addEventListener("animationcancel", n), r.addEventListener("animationend", n), () => {
                                a.clearTimeout(t), r.removeEventListener("animationstart", l), r.removeEventListener("animationcancel", n), r.removeEventListener("animationend", n)
                            }
                        }
                        m("ANIMATION_END")
                    }, [r, m]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(c),
                        ref: t.useCallback(e => {
                            s.current = e ? getComputedStyle(e) : null, d(e)
                        }, [])
                    }
                }(u),
                f = "function" == typeof c ? c({
                    present: m.isPresent
                }) : t.Children.only(c),
                p = (0, a.useComposedRefs)(m.ref, (o = (s = null == (r = Object.getOwnPropertyDescriptor((l = f).props, "ref")) ? void 0 : r.get) && "isReactWarning" in s && s.isReactWarning) ? l.ref : (o = (s = null == (d = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : d.get) && "isReactWarning" in s && s.isReactWarning) ? l.props.ref : l.props.ref || l.ref);
            return "function" == typeof c || m.isPresent ? t.cloneElement(f, {
                ref: p
            }) : null
        };

    function i(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    l.displayName = "Presence", e.s(["Presence", 0, l])
}, 904451, e => {
    "use strict";
    var t = e.i(140625),
        a = e.i(408832),
        n = e.i(197649),
        l = e.i(416340),
        i = e.i(78892),
        r = e.i(608652),
        d = e.i(174617),
        s = e.i(199786),
        o = e.i(300792),
        u = e.i(692166),
        c = e.i(169525),
        m = e.i(600317),
        f = e.i(221628),
        p = "Checkbox",
        [g, h] = (0, r.createContextScope)(p),
        [v, x] = g(p);

    function y(e) {
        let {
            __scopeCheckbox: t,
            checked: a,
            children: n,
            defaultChecked: i,
            disabled: r,
            form: d,
            name: o,
            onCheckedChange: u,
            required: c,
            value: m = "on",
            internal_do_not_use_render: g
        } = e, [h, x] = (0, s.useControllableState)({
            prop: a,
            defaultProp: null != i && i,
            onChange: u,
            caller: p
        }), [y, b] = l.useState(null), [E, N] = l.useState(null), S = l.useRef(!1), w = !y || !!d || !!y.closest("form"), k = {
            checked: h,
            disabled: r,
            setChecked: x,
            control: y,
            setControl: b,
            name: o,
            form: d,
            value: m,
            hasConsumerStoppedPropagationRef: S,
            required: c,
            defaultChecked: !L(i) && i,
            isFormControl: w,
            bubbleInput: E,
            setBubbleInput: N
        };
        return (0, f.jsx)(v, {
            scope: t,
            ...k,
            children: "function" == typeof g ? g(k) : n
        })
    }
    var b = "CheckboxTrigger",
        E = l.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                onKeyDown: n,
                onClick: r,
                ...s
            } = e, {
                control: o,
                value: u,
                disabled: c,
                checked: p,
                required: g,
                setControl: h,
                setChecked: v,
                hasConsumerStoppedPropagationRef: y,
                isFormControl: E,
                bubbleInput: N
            } = x(b, a), S = (0, i.useComposedRefs)(t, h), w = l.useRef(p);
            return l.useEffect(() => {
                let e = null == o ? void 0 : o.form;
                if (e) {
                    let t = () => v(w.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [o, v]), (0, f.jsx)(m.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": L(p) ? "mixed" : p,
                "aria-required": g,
                "data-state": T(p),
                "data-disabled": c ? "" : void 0,
                disabled: c,
                value: u,
                ...s,
                ref: S,
                onKeyDown: (0, d.composeEventHandlers)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, d.composeEventHandlers)(r, e => {
                    v(e => !!L(e) || !e), N && E && (y.current = e.isPropagationStopped(), y.current || e.stopPropagation())
                })
            })
        });
    E.displayName = b;
    var N = l.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: n,
            checked: l,
            defaultChecked: i,
            required: r,
            disabled: d,
            value: s,
            onCheckedChange: o,
            form: u,
            ...c
        } = e;
        return (0, f.jsx)(y, {
            __scopeCheckbox: a,
            checked: l,
            defaultChecked: i,
            disabled: d,
            required: r,
            onCheckedChange: o,
            name: n,
            form: u,
            value: s,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, f.jsxs)(f.Fragment, {
                    children: [(0, f.jsx)(E, {
                        ...c,
                        ref: t,
                        __scopeCheckbox: a
                    }), n && (0, f.jsx)(M, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    N.displayName = p;
    var S = "CheckboxIndicator",
        w = l.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...l
            } = e, i = x(S, a);
            return (0, f.jsx)(c.Presence, {
                present: n || L(i.checked) || !0 === i.checked,
                children: (0, f.jsx)(m.Primitive.span, {
                    "data-state": T(i.checked),
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
    w.displayName = S;
    var k = "CheckboxBubbleInput",
        M = l.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                ...n
            } = e, {
                control: r,
                hasConsumerStoppedPropagationRef: d,
                checked: s,
                defaultChecked: c,
                required: p,
                disabled: g,
                name: h,
                value: v,
                form: y,
                bubbleInput: b,
                setBubbleInput: E
            } = x(k, a), N = (0, i.useComposedRefs)(t, E), S = (0, o.usePrevious)(s), w = (0, u.useSize)(r);
            l.useEffect(() => {
                if (!b) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !d.current;
                if (S !== s && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    b.indeterminate = L(s), e.call(b, !L(s) && s), b.dispatchEvent(a)
                }
            }, [b, S, s, d]);
            let M = l.useRef(!L(s) && s);
            return (0, f.jsx)(m.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != c ? c : M.current,
                required: p,
                disabled: g,
                name: h,
                value: v,
                form: y,
                ...n,
                tabIndex: -1,
                ref: N,
                style: {
                    ...n.style,
                    ...w,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function L(e) {
        return "indeterminate" === e
    }

    function T(e) {
        return L(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    M.displayName = k;
    let O = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        I = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        R = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        j = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: i,
            className: r,
            isChecked: d,
            isDisabled: s,
            size: o,
            hint: u,
            placement: c,
            onCheckedChange: m,
            id: f,
            ...p
        } = e, g = (0, a.default)(), h = f || g, v = i && l.default.createElement("label", {
            htmlFor: h,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !s && "cursor-pointer")
        }, l.default.createElement("span", {
            className: (0, n.default)(R[o], j[o], "content-emphasis")
        }, i), u && l.default.createElement("span", {
            className: "text-body-medium content-default"
        }, u));
        return l.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", s && "opacity-[0.5]", !s && "cursor-pointer", r)
        }, "End" === c && v, l.default.createElement("div", {
            className: (0, n.default)(I[o])
        }, l.default.createElement(N, {
            "data-slot": "checkbox",
            className: (0, n.default)(O[o], t.interactable, !s && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: h,
            checked: d,
            disabled: s,
            onCheckedChange: m,
            "aria-label": i,
            ...p
        }, l.default.createElement(t.StateLayer, null), l.default.createElement(w, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(O[o], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === c && v)
    }], 904451)
}, 836344, e => {
    "use strict";
    var t = e.i(140625),
        a = e.i(603955),
        n = e.i(75584),
        l = e.i(197649),
        i = e.i(416340);
    let r = {
            Small: "XSmall",
            Medium: "Small",
            Large: "Medium"
        },
        d = {
            Small: ["height-600", "text-label-small"],
            Medium: ["height-800", "text-label-medium"],
            Large: ["height-1000", "text-label-medium"]
        },
        s = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-large"
        },
        o = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-medium"
        },
        u = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-large"
        },
        c = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-medium"
        },
        m = {
            Small: "padding-left-xsmall",
            Medium: "padding-left-[var(--size-150)]",
            Large: "padding-left-small"
        },
        f = {
            Small: "padding-right-[var(--size-150)]",
            Medium: "padding-right-small",
            Large: "padding-right-[var(--size-250)]"
        },
        p = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        g = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        h = e => {
            let {
                iconName: t,
                node: a,
                size: d
            } = e;
            return null != t ? i.default.createElement(n.Icon, {
                name: t,
                size: r[d]
            }) : null != a ? i.default.createElement("span", {
                className: (0, l.default)("inline-flex items-center justify-center shrink-0", g[d])
            }, a) : null
        },
        v = (0, i.forwardRef)((e, n) => {
            let {
                className: r,
                style: g,
                text: v,
                isDisabled: x = !1,
                size: y = "Medium",
                variant: b = "Standard",
                leadingIconName: E,
                leadingIconNode: N,
                trailingIconName: S,
                trailingIconNode: w,
                ...k
            } = e, M = null != E || null != N, L = null != S || null != w, T = (0, l.default)(x ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", M ? o[y] : s[y], L ? c[y] : u[y], d[y], r), O = i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), i.default.createElement(h, {
                iconName: E,
                node: N,
                size: y
            }), i.default.createElement("span", {
                className: (0, l.default)("padding-y-xsmall text-no-wrap text-truncate-end", M && m[y], L && f[y])
            }, v), i.default.createElement(h, {
                iconName: S,
                node: w,
                size: y
            })), I = {
                textDecoration: "none",
                ...g
            };
            if ("a" === k.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = k;
                return i.default.createElement("a", {
                    ref: n,
                    ...a,
                    "aria-disabled": x,
                    href: x ? void 0 : t,
                    className: (0, l.default)(T, p[b], "content-action-utility"),
                    style: I
                }, O)
            }
            let {
                as: R,
                isChecked: j,
                onCheckedChange: C,
                ...A
            } = k;
            return i.default.createElement("button", {
                ref: n,
                type: "button",
                ...A,
                className: (0, l.default)(j ? "bg-inverse-surface-0" : p[b], j ? "content-inverse-emphasis" : "content-action-utility", T),
                style: I,
                "aria-pressed": j,
                disabled: x,
                onClick: null == C ? void 0 : () => C(!j)
            }, O)
        });
    e.s(["Chip", 0, v])
}, 395203, e => {
    "use strict";
    var t = e.i(603955),
        a = e.i(75584),
        n = e.i(408832),
        l = e.i(148380),
        i = e.i(750615),
        r = e.i(197649),
        d = e.i(416340);
    let s = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        o = {
            XSmall: "gap-x-xsmall",
            Small: "gap-x-small",
            Medium: "gap-x-small",
            Large: "gap-x-small"
        },
        u = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        c = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        m = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        f = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        p = (0, d.forwardRef)((e, p) => {
            let {
                label: g,
                labelTooltip: h,
                leadingIconName: v,
                trailingIconName: x,
                leadingIconNode: y,
                trailingIconNode: b,
                hasError: E,
                error: N,
                helperText: S,
                size: w,
                variant: k = "Standard",
                isRequired: M,
                isDisabled: L,
                className: T,
                style: O,
                inputContainerClassName: I,
                inputContainerClassStyle: R,
                id: j,
                ...C
            } = e, A = (0, n.default)(), P = j || A, U = "".concat(P, "-description"), z = null != w ? w : "Large", _ = E || !!N, D = N || S, X = (0, d.useMemo)(() => v ? d.default.createElement(a.Icon, {
                name: v,
                size: z,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : y, [v, y, z]), F = (0, d.useMemo)(() => x ? d.default.createElement(a.Icon, {
                name: x,
                size: z,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : b, [z, x, b]), B = g ? d.default.createElement("label", {
                htmlFor: P,
                className: (0, r.default)(m[z], "content-emphasis")
            }, g, M && d.default.createElement(d.default.Fragment, null, " ", d.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return d.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, r.default)("flex width-full flex-col gap-small ".concat(T), {
                    [t.disabledOpacity]: L
                }),
                style: O
            }, B && (h ? d.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, B, d.default.createElement(l.LabelTooltip, h)) : B), d.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, r.default)("foundation-web-input flex items-center width-full", i.INPUT_STROKE_BY_VARIANT[k], i.INPUT_BACKGROUND_BY_VARIANT[k], I, u[z], c[z], s[z], o[z], _ ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: R
            }, X, d.default.createElement("input", {
                type: "text",
                id: P,
                ref: p,
                className: (0, r.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", f[z]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": _,
                "aria-describedby": D ? U : void 0,
                required: M,
                ...C,
                disabled: L
            }), F), D && d.default.createElement("span", {
                id: U,
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": _,
                    "content-default": !_
                })
            }, D))
        });
    p.displayName = "TextInput", e.s(["TextInput", 0, p])
}, 763833, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["ArrowDownwardIcon", () => t.ArrowDownward])
}, 650642, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["ArrowUpwardIcon", () => t.ArrowUpward])
}, 223808, (e, t, a) => {
    var n = 0 / 0,
        l = /^\s+|\s+$/g,
        i = /^[-+]0x[0-9a-f]+$/i,
        r = /^0b[01]+$/i,
        d = /^0o[0-7]+$/i,
        s = parseInt,
        o = e.g && e.g.Object === Object && e.g,
        u = "object" == typeof self && self && self.Object === Object && self,
        c = o || u || Function("return this")(),
        m = Object.prototype.toString,
        f = Math.max,
        p = Math.min,
        g = function() {
            return c.Date.now()
        };

    function h(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function v(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == m.call(t)) return n;
        if (h(e)) {
            var t, a = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = h(a) ? a + "" : a
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(l, "");
        var o = r.test(e);
        return o || d.test(e) ? s(e.slice(2), o ? 2 : 8) : i.test(e) ? n : +e
    }
    t.exports = function(e, t, a) {
        var n, l, i, r, d, s, o = 0,
            u = !1,
            c = !1,
            m = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function x(t) {
            var a = n,
                i = l;
            return n = l = void 0, o = t, r = e.apply(i, a)
        }

        function y(e) {
            var a = e - s,
                n = e - o;
            return void 0 === s || a >= t || a < 0 || c && n >= i
        }

        function b() {
            var e, a, n, l = g();
            if (y(l)) return E(l);
            d = setTimeout(b, (e = l - s, a = l - o, n = t - e, c ? p(n, i - a) : n))
        }

        function E(e) {
            return (d = void 0, m && n) ? x(e) : (n = l = void 0, r)
        }

        function N() {
            var e, a = g(),
                i = y(a);
            if (n = arguments, l = this, s = a, i) {
                if (void 0 === d) return o = e = s, d = setTimeout(b, t), u ? x(e) : r;
                if (c) return d = setTimeout(b, t), x(s)
            }
            return void 0 === d && (d = setTimeout(b, t)), r
        }
        return t = v(t) || 0, h(a) && (u = !!a.leading, i = (c = "maxWait" in a) ? f(v(a.maxWait) || 0, t) : i, m = "trailing" in a ? !!a.trailing : m), N.cancel = function() {
            void 0 !== d && clearTimeout(d), o = 0, n = s = l = d = void 0
        }, N.flush = function() {
            return void 0 === d ? r : E(g())
        }, N
    }
}, 167878, e => {
    "use strict";
    var t = e.i(416340);
    e.i(223808);
    var a = "u" > typeof window ? t.useLayoutEffect : t.useEffect,
        n = "u" < typeof window;
    e.s(["useMediaQuery", 0, function(e) {
        let {
            defaultValue: l = !1,
            initializeWithValue: i = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, r = e => n ? l : window.matchMedia(e).matches, [d, s] = (0, t.useState)(() => i ? r(e) : l);

        function o() {
            s(r(e))
        }
        return a(() => {
            let t = window.matchMedia(e);
            return o(), t.addListener ? t.addListener(o) : t.addEventListener("change", o), () => {
                t.removeListener ? t.removeListener(o) : t.removeEventListener("change", o)
            }
        }, [e]), d
    }])
}]);

//# debugId=5aaf253a-b15c-b4f1-1160-5266a69fcf42
//# sourceMappingURL=1op98zpfr54fp.js.map
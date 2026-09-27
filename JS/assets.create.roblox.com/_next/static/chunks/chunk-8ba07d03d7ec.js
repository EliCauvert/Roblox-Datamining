;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "bf73a88c-df7c-eb48-bfec-69273b94a14b")
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
            let s, u, {
                    present: o,
                    children: c
                } = e,
                m = function(e) {
                    var a, l;
                    let [r, d] = t.useState(), s = t.useRef(null), u = t.useRef(e), o = t.useRef("none"), [c, m] = (a = e ? "mounted" : "unmounted", l = {
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
                        o.current = "mounted" === c ? e : "none"
                    }, [c]), (0, n.useLayoutEffect)(() => {
                        let t = s.current,
                            a = u.current;
                        if (a !== e) {
                            let n = o.current,
                                l = i(t);
                            e ? m("MOUNT") : "none" === l || (null == t ? void 0 : t.display) === "none" ? m("UNMOUNT") : a && n !== l ? m("ANIMATION_OUT") : m("UNMOUNT"), u.current = e
                        }
                    }, [e, m]), (0, n.useLayoutEffect)(() => {
                        if (r) {
                            var e;
                            let t, a = null != (e = r.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = i(s.current).includes(CSS.escape(e.animationName));
                                    if (e.target === r && n && (m("ANIMATION_END"), !u.current)) {
                                        let e = r.style.animationFillMode;
                                        r.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === r.style.animationFillMode && (r.style.animationFillMode = e)
                                        })
                                    }
                                },
                                l = e => {
                                    e.target === r && (o.current = i(s.current))
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
                }(o),
                f = "function" == typeof c ? c({
                    present: m.isPresent
                }) : t.Children.only(c),
                p = (0, a.useComposedRefs)(m.ref, (u = (s = null == (r = Object.getOwnPropertyDescriptor((l = f).props, "ref")) ? void 0 : r.get) && "isReactWarning" in s && s.isReactWarning) ? l.ref : (u = (s = null == (d = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : d.get) && "isReactWarning" in s && s.isReactWarning) ? l.props.ref : l.props.ref || l.ref);
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
        u = e.i(300792),
        o = e.i(692166),
        c = e.i(169525),
        m = e.i(600317),
        f = e.i(221628),
        p = "Checkbox",
        [g, h] = (0, r.createContextScope)(p),
        [x, v] = g(p);

    function y(e) {
        let {
            __scopeCheckbox: t,
            checked: a,
            children: n,
            defaultChecked: i,
            disabled: r,
            form: d,
            name: u,
            onCheckedChange: o,
            required: c,
            value: m = "on",
            internal_do_not_use_render: g
        } = e, [h, v] = (0, s.useControllableState)({
            prop: a,
            defaultProp: null != i && i,
            onChange: o,
            caller: p
        }), [y, b] = l.useState(null), [E, N] = l.useState(null), S = l.useRef(!1), k = !y || !!d || !!y.closest("form"), M = {
            checked: h,
            disabled: r,
            setChecked: v,
            control: y,
            setControl: b,
            name: u,
            form: d,
            value: m,
            hasConsumerStoppedPropagationRef: S,
            required: c,
            defaultChecked: !w(i) && i,
            isFormControl: k,
            bubbleInput: E,
            setBubbleInput: N
        };
        return (0, f.jsx)(x, {
            scope: t,
            ...M,
            children: "function" == typeof g ? g(M) : n
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
                control: u,
                value: o,
                disabled: c,
                checked: p,
                required: g,
                setControl: h,
                setChecked: x,
                hasConsumerStoppedPropagationRef: y,
                isFormControl: E,
                bubbleInput: N
            } = v(b, a), S = (0, i.useComposedRefs)(t, h), k = l.useRef(p);
            return l.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => x(k.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, x]), (0, f.jsx)(m.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": w(p) ? "mixed" : p,
                "aria-required": g,
                "data-state": T(p),
                "data-disabled": c ? "" : void 0,
                disabled: c,
                value: o,
                ...s,
                ref: S,
                onKeyDown: (0, d.composeEventHandlers)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, d.composeEventHandlers)(r, e => {
                    x(e => !!w(e) || !e), N && E && (y.current = e.isPropagationStopped(), y.current || e.stopPropagation())
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
            onCheckedChange: u,
            form: o,
            ...c
        } = e;
        return (0, f.jsx)(y, {
            __scopeCheckbox: a,
            checked: l,
            defaultChecked: i,
            disabled: d,
            required: r,
            onCheckedChange: u,
            name: n,
            form: o,
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
                    }), n && (0, f.jsx)(L, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    N.displayName = p;
    var S = "CheckboxIndicator",
        k = l.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...l
            } = e, i = v(S, a);
            return (0, f.jsx)(c.Presence, {
                present: n || w(i.checked) || !0 === i.checked,
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
    k.displayName = S;
    var M = "CheckboxBubbleInput",
        L = l.forwardRef((e, t) => {
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
                value: x,
                form: y,
                bubbleInput: b,
                setBubbleInput: E
            } = v(M, a), N = (0, i.useComposedRefs)(t, E), S = (0, u.usePrevious)(s), k = (0, o.useSize)(r);
            l.useEffect(() => {
                if (!b) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !d.current;
                if (S !== s && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    b.indeterminate = w(s), e.call(b, !w(s) && s), b.dispatchEvent(a)
                }
            }, [b, S, s, d]);
            let L = l.useRef(!w(s) && s);
            return (0, f.jsx)(m.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != c ? c : L.current,
                required: p,
                disabled: g,
                name: h,
                value: x,
                form: y,
                ...n,
                tabIndex: -1,
                ref: N,
                style: {
                    ...n.style,
                    ...k,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function w(e) {
        return "indeterminate" === e
    }

    function T(e) {
        return w(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    L.displayName = M;
    let O = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        R = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        j = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        I = {
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
            size: u,
            hint: o,
            placement: c,
            onCheckedChange: m,
            id: f,
            ...p
        } = e, g = (0, a.default)(), h = f || g, x = i && l.default.createElement("label", {
            htmlFor: h,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !s && "cursor-pointer")
        }, l.default.createElement("span", {
            className: (0, n.default)(j[u], I[u], "content-emphasis")
        }, i), o && l.default.createElement("span", {
            className: "text-body-medium content-default"
        }, o));
        return l.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", s && "opacity-[0.5]", !s && "cursor-pointer", r)
        }, "End" === c && x, l.default.createElement("div", {
            className: (0, n.default)(R[u])
        }, l.default.createElement(N, {
            "data-slot": "checkbox",
            className: (0, n.default)(O[u], t.interactable, !s && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: h,
            checked: d,
            disabled: s,
            onCheckedChange: m,
            "aria-label": i,
            ...p
        }, l.default.createElement(t.StateLayer, null), l.default.createElement(k, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(O[u], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === c && x)
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
        u = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-medium"
        },
        o = {
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
        x = (0, i.forwardRef)((e, n) => {
            let {
                className: r,
                style: g,
                text: x,
                isDisabled: v = !1,
                size: y = "Medium",
                variant: b = "Standard",
                leadingIconName: E,
                leadingIconNode: N,
                trailingIconName: S,
                trailingIconNode: k,
                ...M
            } = e, L = null != E || null != N, w = null != S || null != k, T = (0, l.default)(v ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", L ? u[y] : s[y], w ? c[y] : o[y], d[y], r), O = i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), i.default.createElement(h, {
                iconName: E,
                node: N,
                size: y
            }), i.default.createElement("span", {
                className: (0, l.default)("padding-y-xsmall text-no-wrap text-truncate-end", L && m[y], w && f[y])
            }, x), i.default.createElement(h, {
                iconName: S,
                node: k,
                size: y
            })), R = {
                textDecoration: "none",
                ...g
            };
            if ("a" === M.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = M;
                return i.default.createElement("a", {
                    ref: n,
                    ...a,
                    "aria-disabled": v,
                    href: v ? void 0 : t,
                    className: (0, l.default)(T, p[b], "content-action-utility"),
                    style: R
                }, O)
            }
            let {
                as: j,
                isChecked: I,
                onCheckedChange: C,
                ...P
            } = M;
            return i.default.createElement("button", {
                ref: n,
                type: "button",
                ...P,
                className: (0, l.default)(I ? "bg-inverse-surface-0" : p[b], I ? "content-inverse-emphasis" : "content-action-utility", T),
                style: R,
                "aria-pressed": I,
                disabled: v,
                onClick: null == C ? void 0 : () => C(!I)
            }, O)
        });
    e.s(["Chip", 0, x])
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
        u = {
            XSmall: "gap-x-xsmall",
            Small: "gap-x-small",
            Medium: "gap-x-small",
            Large: "gap-x-small"
        },
        o = {
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
                leadingIconName: x,
                trailingIconName: v,
                leadingIconNode: y,
                trailingIconNode: b,
                hasError: E,
                error: N,
                helperText: S,
                size: k,
                variant: M = "Standard",
                isRequired: L,
                isDisabled: w,
                className: T,
                style: O,
                inputContainerClassName: R,
                inputContainerClassStyle: j,
                id: I,
                ...C
            } = e, P = (0, n.default)(), z = I || P, A = "".concat(z, "-description"), U = null != k ? k : "Large", _ = E || !!N, D = N || S, X = (0, d.useMemo)(() => x ? d.default.createElement(a.Icon, {
                name: x,
                size: U,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : y, [x, y, U]), F = (0, d.useMemo)(() => v ? d.default.createElement(a.Icon, {
                name: v,
                size: U,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : b, [U, v, b]), B = g ? d.default.createElement("label", {
                htmlFor: z,
                className: (0, r.default)(m[U], "content-emphasis")
            }, g, L && d.default.createElement(d.default.Fragment, null, " ", d.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return d.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, r.default)("flex width-full flex-col gap-small ".concat(T), {
                    [t.disabledOpacity]: w
                }),
                style: O
            }, B && (h ? d.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, B, d.default.createElement(l.LabelTooltip, h)) : B), d.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, r.default)("foundation-web-input flex items-center width-full", i.INPUT_STROKE_BY_VARIANT[M], i.INPUT_BACKGROUND_BY_VARIANT[M], R, o[U], c[U], s[U], u[U], _ ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: j
            }, X, d.default.createElement("input", {
                type: "text",
                id: z,
                ref: p,
                className: (0, r.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", f[U]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": _,
                "aria-describedby": D ? A : void 0,
                required: L,
                ...C,
                disabled: w
            }), F), D && d.default.createElement("span", {
                id: A,
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": _,
                    "content-default": !_
                })
            }, D))
        });
    p.displayName = "TextInput", e.s(["TextInput", 0, p])
}, 223808, (e, t, a) => {
    var n = 0 / 0,
        l = /^\s+|\s+$/g,
        i = /^[-+]0x[0-9a-f]+$/i,
        r = /^0b[01]+$/i,
        d = /^0o[0-7]+$/i,
        s = parseInt,
        u = e.g && e.g.Object === Object && e.g,
        o = "object" == typeof self && self && self.Object === Object && self,
        c = u || o || Function("return this")(),
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

    function x(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == m.call(t)) return n;
        if (h(e)) {
            var t, a = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = h(a) ? a + "" : a
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(l, "");
        var u = r.test(e);
        return u || d.test(e) ? s(e.slice(2), u ? 2 : 8) : i.test(e) ? n : +e
    }
    t.exports = function(e, t, a) {
        var n, l, i, r, d, s, u = 0,
            o = !1,
            c = !1,
            m = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function v(t) {
            var a = n,
                i = l;
            return n = l = void 0, u = t, r = e.apply(i, a)
        }

        function y(e) {
            var a = e - s,
                n = e - u;
            return void 0 === s || a >= t || a < 0 || c && n >= i
        }

        function b() {
            var e, a, n, l = g();
            if (y(l)) return E(l);
            d = setTimeout(b, (e = l - s, a = l - u, n = t - e, c ? p(n, i - a) : n))
        }

        function E(e) {
            return (d = void 0, m && n) ? v(e) : (n = l = void 0, r)
        }

        function N() {
            var e, a = g(),
                i = y(a);
            if (n = arguments, l = this, s = a, i) {
                if (void 0 === d) return u = e = s, d = setTimeout(b, t), o ? v(e) : r;
                if (c) return d = setTimeout(b, t), v(s)
            }
            return void 0 === d && (d = setTimeout(b, t)), r
        }
        return t = x(t) || 0, h(a) && (o = !!a.leading, i = (c = "maxWait" in a) ? f(x(a.maxWait) || 0, t) : i, m = "trailing" in a ? !!a.trailing : m), N.cancel = function() {
            void 0 !== d && clearTimeout(d), u = 0, n = s = l = d = void 0
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

        function u() {
            s(r(e))
        }
        return a(() => {
            let t = window.matchMedia(e);
            return u(), t.addListener ? t.addListener(u) : t.addEventListener("change", u), () => {
                t.removeListener ? t.removeListener(u) : t.removeEventListener("change", u)
            }
        }, [e]), d
    }])
}]);

//# debugId=bf73a88c-df7c-eb48-bfec-69273b94a14b
//# sourceMappingURL=0yqambeo5xmh3.js.map
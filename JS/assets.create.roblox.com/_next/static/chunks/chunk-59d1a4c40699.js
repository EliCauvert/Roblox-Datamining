;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "814ef42f-d2fe-b9c7-46a7-53e2cc746e20")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 169525, e => {
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
}, 904451, e => {
    "use strict";
    var t = e.i(140625),
        a = e.i(408832),
        n = e.i(197649),
        l = e.i(416340),
        r = e.i(78892),
        i = e.i(608652),
        s = e.i(174617),
        o = e.i(199786),
        d = e.i(300792),
        u = e.i(692166),
        c = e.i(169525),
        m = e.i(600317),
        f = e.i(221628),
        p = "Checkbox",
        [x, h] = (0, i.createContextScope)(p),
        [g, v] = x(p);

    function y(e) {
        let {
            __scopeCheckbox: t,
            checked: a,
            children: n,
            defaultChecked: r,
            disabled: i,
            form: s,
            name: d,
            onCheckedChange: u,
            required: c,
            value: m = "on",
            internal_do_not_use_render: x
        } = e, [h, v] = (0, o.useControllableState)({
            prop: a,
            defaultProp: null != r && r,
            onChange: u,
            caller: p
        }), [y, b] = l.useState(null), [E, N] = l.useState(null), k = l.useRef(!1), S = !y || !!s || !!y.closest("form"), w = {
            checked: h,
            disabled: i,
            setChecked: v,
            control: y,
            setControl: b,
            name: d,
            form: s,
            value: m,
            hasConsumerStoppedPropagationRef: k,
            required: c,
            defaultChecked: !M(r) && r,
            isFormControl: S,
            bubbleInput: E,
            setBubbleInput: N
        };
        return (0, f.jsx)(g, {
            scope: t,
            ...w,
            children: "function" == typeof x ? x(w) : n
        })
    }
    var b = "CheckboxTrigger",
        E = l.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                onKeyDown: n,
                onClick: i,
                ...o
            } = e, {
                control: d,
                value: u,
                disabled: c,
                checked: p,
                required: x,
                setControl: h,
                setChecked: g,
                hasConsumerStoppedPropagationRef: y,
                isFormControl: E,
                bubbleInput: N
            } = v(b, a), k = (0, r.useComposedRefs)(t, h), S = l.useRef(p);
            return l.useEffect(() => {
                let e = null == d ? void 0 : d.form;
                if (e) {
                    let t = () => g(S.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [d, g]), (0, f.jsx)(m.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": M(p) ? "mixed" : p,
                "aria-required": x,
                "data-state": L(p),
                "data-disabled": c ? "" : void 0,
                disabled: c,
                value: u,
                ...o,
                ref: k,
                onKeyDown: (0, s.composeEventHandlers)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, s.composeEventHandlers)(i, e => {
                    g(e => !!M(e) || !e), N && E && (y.current = e.isPropagationStopped(), y.current || e.stopPropagation())
                })
            })
        });
    E.displayName = b;
    var N = l.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: n,
            checked: l,
            defaultChecked: r,
            required: i,
            disabled: s,
            value: o,
            onCheckedChange: d,
            form: u,
            ...c
        } = e;
        return (0, f.jsx)(y, {
            __scopeCheckbox: a,
            checked: l,
            defaultChecked: r,
            disabled: s,
            required: i,
            onCheckedChange: d,
            name: n,
            form: u,
            value: o,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, f.jsxs)(f.Fragment, {
                    children: [(0, f.jsx)(E, {
                        ...c,
                        ref: t,
                        __scopeCheckbox: a
                    }), n && (0, f.jsx)(T, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    N.displayName = p;
    var k = "CheckboxIndicator",
        S = l.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...l
            } = e, r = v(k, a);
            return (0, f.jsx)(c.Presence, {
                present: n || M(r.checked) || !0 === r.checked,
                children: (0, f.jsx)(m.Primitive.span, {
                    "data-state": L(r.checked),
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
    S.displayName = k;
    var w = "CheckboxBubbleInput",
        T = l.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                ...n
            } = e, {
                control: i,
                hasConsumerStoppedPropagationRef: s,
                checked: o,
                defaultChecked: c,
                required: p,
                disabled: x,
                name: h,
                value: g,
                form: y,
                bubbleInput: b,
                setBubbleInput: E
            } = v(w, a), N = (0, r.useComposedRefs)(t, E), k = (0, d.usePrevious)(o), S = (0, u.useSize)(i);
            l.useEffect(() => {
                if (!b) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !s.current;
                if (k !== o && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    b.indeterminate = M(o), e.call(b, !M(o) && o), b.dispatchEvent(a)
                }
            }, [b, k, o, s]);
            let T = l.useRef(!M(o) && o);
            return (0, f.jsx)(m.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != c ? c : T.current,
                required: p,
                disabled: x,
                name: h,
                value: g,
                form: y,
                ...n,
                tabIndex: -1,
                ref: N,
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

    function M(e) {
        return "indeterminate" === e
    }

    function L(e) {
        return M(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    T.displayName = w;
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
            label: r,
            className: i,
            isChecked: s,
            isDisabled: o,
            size: d,
            hint: u,
            placement: c,
            onCheckedChange: m,
            id: f,
            ...p
        } = e, x = (0, a.default)(), h = f || x, g = r && l.default.createElement("label", {
            htmlFor: h,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !o && "cursor-pointer")
        }, l.default.createElement("span", {
            className: (0, n.default)(j[d], I[d], "content-emphasis")
        }, r), u && l.default.createElement("span", {
            className: "text-body-medium content-default"
        }, u));
        return l.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", o && "opacity-[0.5]", !o && "cursor-pointer", i)
        }, "End" === c && g, l.default.createElement("div", {
            className: (0, n.default)(R[d])
        }, l.default.createElement(N, {
            "data-slot": "checkbox",
            className: (0, n.default)(O[d], t.interactable, !o && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: h,
            checked: s,
            disabled: o,
            onCheckedChange: m,
            "aria-label": r,
            ...p
        }, l.default.createElement(t.StateLayer, null), l.default.createElement(S, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(O[d], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === c && g)
    }], 904451)
}, 395203, e => {
    "use strict";
    var t = e.i(603955),
        a = e.i(75584),
        n = e.i(408832),
        l = e.i(148380),
        r = e.i(750615),
        i = e.i(197649),
        s = e.i(416340);
    let o = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        d = {
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
        p = (0, s.forwardRef)((e, p) => {
            let {
                label: x,
                labelTooltip: h,
                leadingIconName: g,
                trailingIconName: v,
                leadingIconNode: y,
                trailingIconNode: b,
                hasError: E,
                error: N,
                helperText: k,
                size: S,
                variant: w = "Standard",
                isRequired: T,
                isDisabled: M,
                className: L,
                style: O,
                inputContainerClassName: R,
                inputContainerClassStyle: j,
                id: I,
                ...C
            } = e, P = (0, n.default)(), A = I || P, U = "".concat(A, "-description"), _ = null != S ? S : "Large", D = E || !!N, X = N || k, F = (0, s.useMemo)(() => g ? s.default.createElement(a.Icon, {
                name: g,
                size: _,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : y, [g, y, _]), z = (0, s.useMemo)(() => v ? s.default.createElement(a.Icon, {
                name: v,
                size: _,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : b, [_, v, b]), B = x ? s.default.createElement("label", {
                htmlFor: A,
                className: (0, i.default)(m[_], "content-emphasis")
            }, x, T && s.default.createElement(s.default.Fragment, null, " ", s.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return s.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, i.default)("flex width-full flex-col gap-small ".concat(L), {
                    [t.disabledOpacity]: M
                }),
                style: O
            }, B && (h ? s.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, B, s.default.createElement(l.LabelTooltip, h)) : B), s.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, i.default)("foundation-web-input flex items-center width-full", r.INPUT_STROKE_BY_VARIANT[w], r.INPUT_BACKGROUND_BY_VARIANT[w], R, u[_], c[_], o[_], d[_], D ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: j
            }, F, s.default.createElement("input", {
                type: "text",
                id: A,
                ref: p,
                className: (0, i.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", f[_]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": D,
                "aria-describedby": X ? U : void 0,
                required: T,
                ...C,
                disabled: M
            }), z), X && s.default.createElement("span", {
                id: U,
                className: (0, i.default)("text-caption-small", {
                    "content-system-alert": D,
                    "content-default": !D
                })
            }, X))
        });
    p.displayName = "TextInput", e.s(["TextInput", 0, p])
}, 223808, (e, t, a) => {
    var n = 0 / 0,
        l = /^\s+|\s+$/g,
        r = /^[-+]0x[0-9a-f]+$/i,
        i = /^0b[01]+$/i,
        s = /^0o[0-7]+$/i,
        o = parseInt,
        d = e.g && e.g.Object === Object && e.g,
        u = "object" == typeof self && self && self.Object === Object && self,
        c = d || u || Function("return this")(),
        m = Object.prototype.toString,
        f = Math.max,
        p = Math.min,
        x = function() {
            return c.Date.now()
        };

    function h(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function g(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == m.call(t)) return n;
        if (h(e)) {
            var t, a = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = h(a) ? a + "" : a
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(l, "");
        var d = i.test(e);
        return d || s.test(e) ? o(e.slice(2), d ? 2 : 8) : r.test(e) ? n : +e
    }
    t.exports = function(e, t, a) {
        var n, l, r, i, s, o, d = 0,
            u = !1,
            c = !1,
            m = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function v(t) {
            var a = n,
                r = l;
            return n = l = void 0, d = t, i = e.apply(r, a)
        }

        function y(e) {
            var a = e - o,
                n = e - d;
            return void 0 === o || a >= t || a < 0 || c && n >= r
        }

        function b() {
            var e, a, n, l = x();
            if (y(l)) return E(l);
            s = setTimeout(b, (e = l - o, a = l - d, n = t - e, c ? p(n, r - a) : n))
        }

        function E(e) {
            return (s = void 0, m && n) ? v(e) : (n = l = void 0, i)
        }

        function N() {
            var e, a = x(),
                r = y(a);
            if (n = arguments, l = this, o = a, r) {
                if (void 0 === s) return d = e = o, s = setTimeout(b, t), u ? v(e) : i;
                if (c) return s = setTimeout(b, t), v(o)
            }
            return void 0 === s && (s = setTimeout(b, t)), i
        }
        return t = g(t) || 0, h(a) && (u = !!a.leading, r = (c = "maxWait" in a) ? f(g(a.maxWait) || 0, t) : r, m = "trailing" in a ? !!a.trailing : m), N.cancel = function() {
            void 0 !== s && clearTimeout(s), d = 0, n = o = l = s = void 0
        }, N.flush = function() {
            return void 0 === s ? i : E(x())
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
            initializeWithValue: r = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, i = e => n ? l : window.matchMedia(e).matches, [s, o] = (0, t.useState)(() => r ? i(e) : l);

        function d() {
            o(i(e))
        }
        return a(() => {
            let t = window.matchMedia(e);
            return d(), t.addListener ? t.addListener(d) : t.addEventListener("change", d), () => {
                t.removeListener ? t.removeListener(d) : t.removeEventListener("change", d)
            }
        }, [e]), s
    }])
}]);

//# debugId=814ef42f-d2fe-b9c7-46a7-53e2cc746e20
//# sourceMappingURL=32e64jkwylzqo.js.map
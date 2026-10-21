;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "5a6fd570-e473-46ad-29bd-896c76405176")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 756568, e => {
    "use strict";
    var t = e.i(776344);
    e.s(["Flex", () => t.default])
}, 614875, e => {
    "use strict";
    var t = e.i(999210),
        a = e.i(641659),
        r = e.i(197649),
        i = e.i(416340),
        n = e.i(78892),
        l = e.i(608652),
        d = e.i(174617),
        s = e.i(199786),
        o = e.i(300792),
        c = e.i(692166),
        u = e.i(169525),
        m = e.i(600317),
        f = e.i(221628),
        p = "Checkbox",
        [g, h] = (0, l.createContextScope)(p),
        [v, b] = g(p);

    function x(e) {
        let {
            __scopeCheckbox: t,
            checked: a,
            children: r,
            defaultChecked: n,
            disabled: l,
            form: d,
            name: o,
            onCheckedChange: c,
            required: u,
            value: m = "on",
            internal_do_not_use_render: g
        } = e, [h, b] = (0, s.useControllableState)({
            prop: a,
            defaultProp: null != n && n,
            onChange: c,
            caller: p
        }), [x, y] = i.useState(null), [k, E] = i.useState(null), S = i.useRef(!1), L = !x || !!d || !!x.closest("form"), w = {
            checked: h,
            disabled: l,
            setChecked: b,
            control: x,
            setControl: y,
            name: o,
            form: d,
            value: m,
            hasConsumerStoppedPropagationRef: S,
            required: u,
            defaultChecked: !j(n) && n,
            isFormControl: L,
            bubbleInput: k,
            setBubbleInput: E
        };
        return (0, f.jsx)(v, {
            scope: t,
            ...w,
            children: "function" == typeof g ? g(w) : r
        })
    }
    var y = "CheckboxTrigger",
        k = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                onKeyDown: r,
                onClick: l,
                ...s
            } = e, {
                control: o,
                value: c,
                disabled: u,
                checked: p,
                required: g,
                setControl: h,
                setChecked: v,
                hasConsumerStoppedPropagationRef: x,
                isFormControl: k,
                bubbleInput: E
            } = b(y, a), S = (0, n.useComposedRefs)(t, h), L = i.useRef(p);
            return i.useEffect(() => {
                let e = null == o ? void 0 : o.form;
                if (e) {
                    let t = () => v(L.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [o, v]), (0, f.jsx)(m.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": j(p) ? "mixed" : p,
                "aria-required": g,
                "data-state": M(p),
                "data-disabled": u ? "" : void 0,
                disabled: u,
                value: c,
                ...s,
                ref: S,
                onKeyDown: (0, d.composeEventHandlers)(r, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, d.composeEventHandlers)(l, e => {
                    v(e => !!j(e) || !e), E && k && (x.current = e.isPropagationStopped(), x.current || e.stopPropagation())
                })
            })
        });
    k.displayName = y;
    var E = i.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: r,
            checked: i,
            defaultChecked: n,
            required: l,
            disabled: d,
            value: s,
            onCheckedChange: o,
            form: c,
            ...u
        } = e;
        return (0, f.jsx)(x, {
            __scopeCheckbox: a,
            checked: i,
            defaultChecked: n,
            disabled: d,
            required: l,
            onCheckedChange: o,
            name: r,
            form: c,
            value: s,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: r
                } = e;
                return (0, f.jsxs)(f.Fragment, {
                    children: [(0, f.jsx)(k, {
                        ...u,
                        ref: t,
                        __scopeCheckbox: a
                    }), r && (0, f.jsx)(N, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    E.displayName = p;
    var S = "CheckboxIndicator",
        L = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: r,
                ...i
            } = e, n = b(S, a);
            return (0, f.jsx)(u.Presence, {
                present: r || j(n.checked) || !0 === n.checked,
                children: (0, f.jsx)(m.Primitive.span, {
                    "data-state": M(n.checked),
                    "data-disabled": n.disabled ? "" : void 0,
                    ...i,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    L.displayName = S;
    var w = "CheckboxBubbleInput",
        N = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                ...r
            } = e, {
                control: l,
                hasConsumerStoppedPropagationRef: d,
                checked: s,
                defaultChecked: u,
                required: p,
                disabled: g,
                name: h,
                value: v,
                form: x,
                bubbleInput: y,
                setBubbleInput: k
            } = b(w, a), E = (0, n.useComposedRefs)(t, k), S = (0, o.usePrevious)(s), L = (0, c.useSize)(l);
            i.useEffect(() => {
                if (!y) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !d.current;
                if (S !== s && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    y.indeterminate = j(s), e.call(y, !j(s) && s), y.dispatchEvent(a)
                }
            }, [y, S, s, d]);
            let N = i.useRef(!j(s) && s);
            return (0, f.jsx)(m.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != u ? u : N.current,
                required: p,
                disabled: g,
                name: h,
                value: v,
                form: x,
                ...r,
                tabIndex: -1,
                ref: E,
                style: {
                    ...r.style,
                    ...L,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function j(e) {
        return "indeterminate" === e
    }

    function M(e) {
        return j(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    N.displayName = w;
    let z = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        C = {
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
        T = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: n,
            className: l,
            isChecked: d,
            isDisabled: s,
            size: o,
            hint: c,
            placement: u,
            onCheckedChange: m,
            id: f,
            ...p
        } = e, g = (0, a.default)(), h = f || g, v = n && i.default.createElement("label", {
            htmlFor: h,
            className: (0, r.default)("flex flex-col grow-1 gap-xsmall", !s && "cursor-pointer")
        }, i.default.createElement("span", {
            className: (0, r.default)(R[o], T[o], "content-emphasis")
        }, n), c && i.default.createElement("span", {
            className: "text-body-medium content-default"
        }, c));
        return i.default.createElement("div", {
            className: (0, r.default)("foundation-web-checkbox flex gap-medium", s && "opacity-[0.5]", !s && "cursor-pointer", l)
        }, "End" === u && v, i.default.createElement("div", {
            className: (0, r.default)(C[o])
        }, i.default.createElement(E, {
            "data-slot": "checkbox",
            className: (0, r.default)(z[o], t.interactable, !s && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: h,
            checked: d,
            disabled: s,
            onCheckedChange: m,
            "aria-label": n,
            ...p
        }, i.default.createElement(t.StateLayer, null), i.default.createElement(L, {
            "data-slot": "checkbox-indicator",
            className: (0, r.default)(z[o], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === u && v)
    }], 614875)
}, 591012, e => {
    "use strict";
    var t = e.i(999210),
        a = e.i(640409),
        r = e.i(562991),
        i = e.i(197649),
        n = e.i(416340);
    let l = {
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
        c = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-large"
        },
        u = {
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
            return null != t ? n.default.createElement(r.Icon, {
                name: t,
                size: l[d]
            }) : null != a ? n.default.createElement("span", {
                className: (0, i.default)("inline-flex items-center justify-center shrink-0", g[d])
            }, a) : null
        },
        v = (0, n.forwardRef)((e, r) => {
            let {
                className: l,
                style: g,
                text: v,
                isDisabled: b = !1,
                size: x = "Medium",
                variant: y = "Standard",
                leadingIconName: k,
                leadingIconNode: E,
                trailingIconName: S,
                trailingIconNode: L,
                ...w
            } = e, N = null != k || null != E, j = null != S || null != L, M = (0, i.default)(b ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", N ? o[x] : s[x], j ? u[x] : c[x], d[x], l), z = n.default.createElement(n.default.Fragment, null, n.default.createElement(t.StateLayer, null), n.default.createElement(h, {
                iconName: k,
                node: E,
                size: x
            }), n.default.createElement("span", {
                className: (0, i.default)("padding-y-xsmall text-no-wrap text-truncate-end", N && m[x], j && f[x])
            }, v), n.default.createElement(h, {
                iconName: S,
                node: L,
                size: x
            })), C = {
                textDecoration: "none",
                ...g
            };
            if ("a" === w.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = w;
                return n.default.createElement("a", {
                    ref: r,
                    ...a,
                    "aria-disabled": b,
                    href: b ? void 0 : t,
                    className: (0, i.default)(M, p[y], "content-action-utility"),
                    style: C
                }, z)
            }
            let {
                as: R,
                isChecked: T,
                onCheckedChange: O,
                ...I
            } = w;
            return n.default.createElement("button", {
                ref: r,
                type: "button",
                ...I,
                className: (0, i.default)(T ? "bg-inverse-surface-0" : p[y], T ? "content-inverse-emphasis" : "content-action-utility", M),
                style: C,
                "aria-pressed": T,
                disabled: b,
                onClick: null == O ? void 0 : () => O(!T)
            }, z)
        });
    e.s(["Chip", 0, v])
}, 262069, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let r = (0, a.forwardRef)((e, r) => {
        let {
            className: i,
            style: n,
            orientation: l = "horizontal",
            variant: d = "Standard",
            ...s
        } = e, o = "vertical" === l, c = {};
        return o || "Inset" !== d ? o || "InsetLeft" !== d ? o || "InsetRight" !== d || (c = {
            marginRight: "var(--padding-xlarge)"
        }) : c = {
            marginLeft: "var(--padding-xlarge)"
        } : c = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, a.default.createElement("div", {
            ref: r,
            ...s,
            role: "separator",
            "data-orientation": l,
            "aria-orientation": l,
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
                } : "Thick" === d ? {
                    height: "var(--size-250)",
                    borderTop: "var(--stroke-standard)",
                    borderLeftWidth: 0,
                    background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                } : {
                    height: 0,
                    borderTopWidth: "var(--stroke-standard)",
                    borderLeftWidth: 0
                },
                ...c,
                ...n
            },
            className: (0, t.default)("stroke-default self-stretch", i)
        })
    });
    r.displayName = "Divider", e.s(["Divider", 0, r])
}, 16255, e => {
    "use strict";
    var t = e.i(788647);
    e.s(["NavigateNextIcon", () => t.N])
}, 883302, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["NavigateBeforeIcon", () => t.NavigateBefore])
}, 223808, (e, t, a) => {
    var r = 0 / 0,
        i = /^\s+|\s+$/g,
        n = /^[-+]0x[0-9a-f]+$/i,
        l = /^0b[01]+$/i,
        d = /^0o[0-7]+$/i,
        s = parseInt,
        o = e.g && e.g.Object === Object && e.g,
        c = "object" == typeof self && self && self.Object === Object && self,
        u = o || c || Function("return this")(),
        m = Object.prototype.toString,
        f = Math.max,
        p = Math.min,
        g = function() {
            return u.Date.now()
        };

    function h(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function v(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == m.call(t)) return r;
        if (h(e)) {
            var t, a = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = h(a) ? a + "" : a
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(i, "");
        var o = l.test(e);
        return o || d.test(e) ? s(e.slice(2), o ? 2 : 8) : n.test(e) ? r : +e
    }
    t.exports = function(e, t, a) {
        var r, i, n, l, d, s, o = 0,
            c = !1,
            u = !1,
            m = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function b(t) {
            var a = r,
                n = i;
            return r = i = void 0, o = t, l = e.apply(n, a)
        }

        function x(e) {
            var a = e - s,
                r = e - o;
            return void 0 === s || a >= t || a < 0 || u && r >= n
        }

        function y() {
            var e, a, r, i = g();
            if (x(i)) return k(i);
            d = setTimeout(y, (e = i - s, a = i - o, r = t - e, u ? p(r, n - a) : r))
        }

        function k(e) {
            return (d = void 0, m && r) ? b(e) : (r = i = void 0, l)
        }

        function E() {
            var e, a = g(),
                n = x(a);
            if (r = arguments, i = this, s = a, n) {
                if (void 0 === d) return o = e = s, d = setTimeout(y, t), c ? b(e) : l;
                if (u) return d = setTimeout(y, t), b(s)
            }
            return void 0 === d && (d = setTimeout(y, t)), l
        }
        return t = v(t) || 0, h(a) && (c = !!a.leading, n = (u = "maxWait" in a) ? f(v(a.maxWait) || 0, t) : n, m = "trailing" in a ? !!a.trailing : m), E.cancel = function() {
            void 0 !== d && clearTimeout(d), o = 0, r = s = i = d = void 0
        }, E.flush = function() {
            return void 0 === d ? l : k(g())
        }, E
    }
}, 167878, e => {
    "use strict";
    var t = e.i(416340);
    e.i(223808);
    var a = "u" > typeof window ? t.useLayoutEffect : t.useEffect,
        r = "u" < typeof window;
    e.s(["useMediaQuery", 0, function(e) {
        let {
            defaultValue: i = !1,
            initializeWithValue: n = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, l = e => r ? i : window.matchMedia(e).matches, [d, s] = (0, t.useState)(() => n ? l(e) : i);

        function o() {
            s(l(e))
        }
        return a(() => {
            let t = window.matchMedia(e);
            return o(), t.addListener ? t.addListener(o) : t.addEventListener("change", o), () => {
                t.removeListener ? t.removeListener(o) : t.removeEventListener("change", o)
            }
        }, [e]), d
    }])
}]);

//# debugId=5a6fd570-e473-46ad-29bd-896c76405176
//# sourceMappingURL=39dl0ghcvm881.js.map
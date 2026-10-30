;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "2a420c54-db1c-c62f-8e42-7842937075f8")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 203450, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        l = e.i(540459),
        i = e.i(79187),
        n = e.i(814975),
        r = e.i(156071),
        o = e.i(881670),
        d = e.i(745873),
        s = e.i(338653);
    let c = (0, a.createContext)({
        isAffiliateProgramLoading: !1,
        requiresActionToJoinProgram: void 0,
        compliantWithAllUserRequirements: void 0,
        creatorMetadata: void 0,
        isCurrentUserGroupOwner: void 0,
        isGroupEligible: void 0
    });
    c.displayName = "AffiliateProgram";
    let u = (0, i.withTranslation)(e => {
        let {
            children: i
        } = e, {
            user: o
        } = (0, n.useAuthentication)(), u = (0, d.useCurrentGroup)(), [m, f] = (0, a.useState)(void 0), [p, g] = (0, a.useState)(), [h, x] = (0, a.useState)(), [v, b] = (0, a.useState)(), [y, S] = (0, a.useState)(), E = (0, a.useMemo)(() => {
            var e;
            return (null != (e = null == u ? void 0 : u.id) ? e : 0) !== 0
        }, [u]), [k, w] = (0, a.useState)(void 0), N = void 0 === m || void 0 === p || void 0 === h && E, C = (0, a.useCallback)(async () => {
            try {
                if (E && (null == u ? void 0 : u.id)) {
                    let e = await (0, s.getGroupCreatorMetadata)(u.id);
                    f(e);
                    return
                }
                if (!E && (null == o ? void 0 : o.id)) {
                    let e = await (0, s.getUserCreatorMetadata)();
                    f(e);
                    return
                }
            } catch (e) {
                return
            }
            f(null)
        }, [null == u ? void 0 : u.id, E, null == o ? void 0 : o.id]), R = (0, a.useCallback)(async () => {
            if (E && k || !E) try {
                let e = await (0, s.getRequirements)();
                g(e.requirements);
                return
            } catch (e) {
                return
            }
            g(null)
        }, [k, E]), M = (0, a.useCallback)(async () => {
            if (E && (null == u ? void 0 : u.id)) try {
                let e = await (0, s.getGroupEligibility)(u.id);
                x(e.isEligible)
            } catch (e) {
                x(!1)
            }
        }, [u, E]);
        (0, a.useEffect)(() => {
            N ? S(void 0) : E && !k ? S(!1) : S(!1 === v)
        }, [E, k, v, N]), (0, a.useEffect)(() => {
            (async () => {
                if (E && (null == u ? void 0 : u.id)) {
                    var e;
                    return null == (e = (await r.default.getGroupInfo(u.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && o && w(e === o.id)
            })
        }, [null == u ? void 0 : u.id, E, o]), (0, a.useEffect)(() => {
            N || !p || E && !k ? b(void 0) : b((null == p ? void 0 : p.length) === 0 || (null == p ? void 0 : p.length) === 1 && p[0] === l.Requirements.Payable)
        }, [k, E, N, p]), (0, a.useEffect)(() => {
            C()
        }, [C]), (0, a.useEffect)(() => {
            R()
        }, [R]), (0, a.useEffect)(() => {
            M()
        }, [M]);
        let I = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: N,
            requiresActionToJoinProgram: y,
            compliantWithAllUserRequirements: v,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != p ? p : void 0,
            isCurrentUserGroupOwner: k,
            isGroupEligible: null != h ? h : void 0
        }), [N, y, v, m, p, k, h]);
        return (0, t.jsx)(c.Provider, {
            value: I,
            children: i
        })
    }, [o.TranslationNamespace.Organization]);
    e.s(["default", 0, u, "useAffiliateProgram", 0, function() {
        return (0, a.useContext)(c)
    }])
}, 756568, e => {
    "use strict";
    var t = e.i(776344);
    e.s(["Flex", () => t.default])
}, 836157, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        l = e.i(608652),
        i = e.i(174617),
        n = e.i(199786),
        r = e.i(300792),
        o = e.i(692166),
        d = e.i(169525),
        s = e.i(600317),
        c = e.i(221628),
        u = "Checkbox",
        [m, f] = (0, l.createContextScope)(u),
        [p, g] = m(u);

    function h(e) {
        let {
            __scopeCheckbox: a,
            checked: l,
            children: i,
            defaultChecked: r,
            disabled: o,
            form: d,
            name: s,
            onCheckedChange: m,
            required: f,
            value: g = "on",
            internal_do_not_use_render: h
        } = e, [x, v] = (0, n.useControllableState)({
            prop: l,
            defaultProp: null != r && r,
            onChange: m,
            caller: u
        }), [b, y] = t.useState(null), [S, E] = t.useState(null), k = t.useRef(!1), N = !b || !!d || !!b.closest("form"), C = {
            checked: x,
            disabled: o,
            setChecked: v,
            control: b,
            setControl: y,
            name: s,
            form: d,
            value: g,
            hasConsumerStoppedPropagationRef: k,
            required: f,
            defaultChecked: !w(r) && r,
            isFormControl: N,
            bubbleInput: S,
            setBubbleInput: E
        };
        return (0, c.jsx)(p, {
            scope: a,
            ...C,
            children: "function" == typeof h ? h(C) : i
        })
    }
    var x = "CheckboxTrigger",
        v = t.forwardRef((e, l) => {
            let {
                __scopeCheckbox: n,
                onKeyDown: r,
                onClick: o,
                ...d
            } = e, {
                control: u,
                value: m,
                disabled: f,
                checked: p,
                required: h,
                setControl: v,
                setChecked: b,
                hasConsumerStoppedPropagationRef: y,
                isFormControl: S,
                bubbleInput: E
            } = g(x, n), k = (0, a.useComposedRefs)(l, v), C = t.useRef(p);
            return t.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => b(C.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, b]), (0, c.jsx)(s.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": w(p) ? "mixed" : p,
                "aria-required": h,
                "data-state": N(p),
                "data-disabled": f ? "" : void 0,
                disabled: f,
                value: m,
                ...d,
                ref: k,
                onKeyDown: (0, i.composeEventHandlers)(r, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, i.composeEventHandlers)(o, e => {
                    b(e => !!w(e) || !e), E && S && (y.current = e.isPropagationStopped(), y.current || e.stopPropagation())
                })
            })
        });
    v.displayName = x;
    var b = t.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: l,
            checked: i,
            defaultChecked: n,
            required: r,
            disabled: o,
            value: d,
            onCheckedChange: s,
            form: u,
            ...m
        } = e;
        return (0, c.jsx)(h, {
            __scopeCheckbox: a,
            checked: i,
            defaultChecked: n,
            disabled: o,
            required: r,
            onCheckedChange: s,
            name: l,
            form: u,
            value: d,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: l
                } = e;
                return (0, c.jsxs)(c.Fragment, {
                    children: [(0, c.jsx)(v, {
                        ...m,
                        ref: t,
                        __scopeCheckbox: a
                    }), l && (0, c.jsx)(k, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    b.displayName = u;
    var y = "CheckboxIndicator",
        S = t.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: l,
                ...i
            } = e, n = g(y, a);
            return (0, c.jsx)(d.Presence, {
                present: l || w(n.checked) || !0 === n.checked,
                children: (0, c.jsx)(s.Primitive.span, {
                    "data-state": N(n.checked),
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
    S.displayName = y;
    var E = "CheckboxBubbleInput",
        k = t.forwardRef((e, l) => {
            let {
                __scopeCheckbox: i,
                ...n
            } = e, {
                control: d,
                hasConsumerStoppedPropagationRef: u,
                checked: m,
                defaultChecked: f,
                required: p,
                disabled: h,
                name: x,
                value: v,
                form: b,
                bubbleInput: y,
                setBubbleInput: S
            } = g(E, i), k = (0, a.useComposedRefs)(l, S), N = (0, r.usePrevious)(m), C = (0, o.useSize)(d);
            t.useEffect(() => {
                if (!y) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !u.current;
                if (N !== m && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    y.indeterminate = w(m), e.call(y, !w(m) && m), y.dispatchEvent(a)
                }
            }, [y, N, m, u]);
            let R = t.useRef(!w(m) && m);
            return (0, c.jsx)(s.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != f ? f : R.current,
                required: p,
                disabled: h,
                name: x,
                value: v,
                form: b,
                ...n,
                tabIndex: -1,
                ref: k,
                style: {
                    ...n.style,
                    ...C,
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

    function N(e) {
        return w(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    k.displayName = E, e.s(["Indicator", 0, S, "Root", 0, b])
}, 202289, e => {
    "use strict";
    var t = e.i(737586),
        a = e.i(944821),
        l = e.i(197649),
        i = e.i(416340),
        n = e.i(836157);
    let r = {
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
        d = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        s = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: c,
            className: u,
            isChecked: m,
            isDisabled: f,
            size: p,
            hint: g,
            placement: h,
            onCheckedChange: x,
            id: v,
            ...b
        } = e, y = (0, a.default)(), S = v || y, E = c && i.default.createElement("label", {
            htmlFor: S,
            className: (0, l.default)("flex flex-col grow-1 gap-xsmall", !f && "cursor-pointer")
        }, i.default.createElement("span", {
            className: (0, l.default)(d[p], s[p], "content-emphasis")
        }, c), g && i.default.createElement("span", {
            className: "text-body-medium content-default"
        }, g));
        return i.default.createElement("div", {
            className: (0, l.default)("foundation-web-checkbox flex gap-medium", f && "opacity-[0.5]", !f && "cursor-pointer", u)
        }, "End" === h && E, i.default.createElement("div", {
            className: (0, l.default)(o[p])
        }, i.default.createElement(n.Root, {
            "data-slot": "checkbox",
            className: (0, l.default)(r[p], t.interactable, !f && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: S,
            checked: m,
            disabled: f,
            onCheckedChange: x,
            "aria-label": c,
            ...b
        }, i.default.createElement(t.StateLayer, null), i.default.createElement(n.Indicator, {
            "data-slot": "checkbox-indicator",
            className: (0, l.default)(r[p], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === h && E)
    }])
}, 960916, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let l = (0, a.forwardRef)((e, l) => {
        let {
            className: i,
            style: n,
            orientation: r = "horizontal",
            variant: o = "Standard",
            ...d
        } = e, s = "vertical" === r, c = {};
        return s || "Inset" !== o ? s || "InsetLeft" !== o ? s || "InsetRight" !== o || (c = {
            marginRight: "var(--padding-xlarge)"
        }) : c = {
            marginLeft: "var(--padding-xlarge)"
        } : c = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, a.default.createElement("div", {
            ref: l,
            ...d,
            role: "separator",
            "data-orientation": r,
            "aria-orientation": r,
            style: {
                borderRightWidth: 0,
                borderBottomWidth: 0,
                boxSizing: "border-box",
                borderStyle: "solid",
                ...s ? {
                    height: "100%",
                    width: 0,
                    borderLeftWidth: "var(--stroke-standard)",
                    borderTopWidth: 0
                } : "Thick" === o ? {
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
    l.displayName = "Divider", e.s(["Divider", 0, l])
}, 732749, 222298, e => {
    "use strict";
    var t = e.i(737586),
        a = e.i(944821),
        l = e.i(461806),
        i = e.i(482076),
        n = e.i(197649),
        r = e.i(416340),
        o = e.i(563921);
    let d = (0, r.createContext)(null),
        s = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        c = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        u = {
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
        h = (0, r.forwardRef)((e, h) => {
            let {
                label: x,
                labelTooltip: v,
                ariaLabelledBy: b,
                ariaLabel: y,
                className: S,
                size: E,
                variant: k = "Standard",
                value: w,
                placeholder: N,
                isDisabled: C,
                hasError: R,
                hint: M,
                onValueChange: I,
                onOpenChange: L,
                children: T
            } = e, z = (0, a.default)(), P = (0, r.useMemo)(() => ({
                size: E
            }), [E]), _ = x ? r.default.createElement("span", {
                id: z,
                className: (0, n.default)(u[E], "content-emphasis")
            }, x) : null;
            return r.default.createElement(d.Provider, {
                value: P
            }, r.default.createElement("div", {
                className: (0, n.default)("flex flex-col", C && ["opacity-[0.5]", "pointer-events-none"], f[E], S)
            }, _ && (v ? r.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, _, r.default.createElement(l.LabelTooltip, v)) : _), r.default.createElement(o.Root, {
                value: w,
                disabled: C,
                onValueChange: I,
                onOpenChange: L
            }, r.default.createElement(o.Trigger, {
                className: (0, n.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", i.INPUT_BACKGROUND_BY_VARIANT[k], i.INPUT_STROKE_BY_VARIANT[k], p[E], g[E], c[E], m[E], R ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === w ? "content-muted" : "content-default"),
                ref: h,
                "aria-labelledby": x ? z : b,
                "aria-label": y
            }, r.default.createElement(t.StateLayer, null), r.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, r.default.createElement(o.Value, {
                placeholder: N
            })), r.default.createElement(o.Icon, {
                className: (0, n.default)(s[E], "icon icon-regular-chevron-large-down content-default")
            })), r.default.createElement(o.Portal, null, r.default.createElement(o.Content, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, T))), M && r.default.createElement("span", {
                className: (0, n.default)("text-caption-small", {
                    "content-system-alert": R,
                    "content-default": !R
                })
            }, M)))
        });
    h.displayName = "Dropdown", e.s(["Dropdown", 0, h, "DropdownContext", 0, d], 222298);
    var x = e.i(23342),
        v = e.i(142953);
    let b = {
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
        S = {
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
        k = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        w = {
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
        R = (0, r.createContext)(null),
        M = () => {
            let e = (0, r.useContext)(R);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        var t;
        let {
            children: a,
            className: l,
            size: i
        } = e, s = (0, r.useContext)(d), c = s ? "dropdown" : "standalone", u = null != (t = null != i ? i : null == s ? void 0 : s.size) ? t : "Medium", m = (0, r.useMemo)(() => ({
            size: u,
            mode: c
        }), [u, c]), f = (0, n.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", b[u], l), p = "standalone" === c ? r.default.createElement(v.Root, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, r.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: f
        }, a)) : r.default.createElement("div", {
            className: f
        }, a);
        return r.default.createElement(R.Provider, {
            value: m
        }, "dropdown" === c ? r.default.createElement(o.Viewport, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, p) : p)
    }, "MenuItem", 0, e => {
        let a, {
                value: l,
                leading: i,
                title: d,
                description: s,
                trailing: c,
                disabled: u,
                className: m,
                onSelect: f,
                asChild: p,
                children: g,
                ...h
            } = e,
            {
                size: b,
                mode: y
            } = M(),
            R = (0, n.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", N[b], S[b], E[b], k[b], C[b], u && "opacity-[0.5]", u && "pointer-events-none", m),
            I = r.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, d);
        switch (y) {
            case "dropdown":
                I = r.default.createElement(o.ItemText, {
                    asChild: !0
                }, I);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", y)
        }
        let L = r.default.createElement(r.default.Fragment, null, !u && r.default.createElement(t.StateLayer, null), i, r.default.createElement("div", {
            className: (0, n.default)("grow-1 text-truncate-split flex flex-col", w[b])
        }, I, s && r.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, s)), c);
        if (p) {
            let {
                as: e,
                ...l
            } = h, i = r.default.Children.only(g), n = void 0 === d && i.props.children;
            a = r.default.createElement(x.Slot, {
                ...l,
                role: "standalone" === y ? "menuitem" : void 0,
                "aria-disabled": u || void 0,
                className: R,
                style: {
                    outlineOffset: 0
                },
                onClick: u ? void 0 : f
            }, n ? r.default.cloneElement(i, {}, r.default.createElement(r.default.Fragment, null, !u && r.default.createElement(t.StateLayer, null), i.props.children)) : r.default.cloneElement(i, {}, L))
        } else if ("a" === h.as) {
            let {
                as: e,
                href: t,
                ...l
            } = h;
            a = r.default.createElement("a", {
                ...l,
                role: "standalone" === y ? "menuitem" : void 0,
                "aria-disabled": u,
                href: u ? void 0 : t,
                className: R,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: u ? void 0 : f
            }, L)
        } else {
            let {
                as: e,
                ...t
            } = h;
            a = r.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === y ? "menuitem" : void 0,
                "aria-disabled": u,
                className: R,
                style: {
                    outlineOffset: 0
                },
                onClick: u ? void 0 : f
            }, L)
        }
        return "dropdown" === y ? r.default.createElement(o.Item, {
            value: l,
            disabled: u,
            asChild: !0
        }, a) : r.default.createElement(v.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: l
        }, a)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: a,
            leading: l,
            trailing: i,
            disabled: o,
            className: d
        } = e, {
            size: s
        } = M(), c = (0, n.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", N[s], S[s], E[s], k[s], o && "opacity-[0.5]", d);
        return r.default.createElement("div", {
            role: "none",
            className: c
        }, l, r.default.createElement("div", {
            className: (0, n.default)("grow-1 text-truncate-split flex flex-col", w[s])
        }, r.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), a && r.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, a)), i)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: a
        } = e, {
            size: l
        } = M();
        return r.default.createElement("div", {
            role: "group",
            className: (0, n.default)(y[l], a)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return r.default.createElement("div", {
            role: "separator",
            className: (0, n.default)("foundation-web-menu-separator", t)
        })
    }], 732749)
}, 756199, e => {
    "use strict";
    var t = e.i(999544),
        a = e.i(880343),
        l = e.i(944821),
        i = e.i(461806),
        n = e.i(482076),
        r = e.i(197649),
        o = e.i(416340);
    let d = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        s = {
            XSmall: "gap-x-xsmall",
            Small: "gap-x-small",
            Medium: "gap-x-small",
            Large: "gap-x-small"
        },
        c = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        u = {
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
        p = (0, o.forwardRef)((e, p) => {
            let {
                label: g,
                labelTooltip: h,
                leadingIconName: x,
                trailingIconName: v,
                leadingIconNode: b,
                trailingIconNode: y,
                hasError: S,
                error: E,
                helperText: k,
                size: w,
                variant: N = "Standard",
                isRequired: C,
                isDisabled: R,
                className: M,
                style: I,
                inputContainerClassName: L,
                inputContainerClassStyle: T,
                id: z,
                ...P
            } = e, _ = (0, l.default)(), A = z || _, X = "".concat(A, "-description"), j = null != w ? w : "Large", B = S || !!E, O = E || k, U = (0, o.useMemo)(() => x ? o.default.createElement(a.Icon, {
                name: x,
                size: j,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : b, [x, b, j]), D = (0, o.useMemo)(() => v ? o.default.createElement(a.Icon, {
                name: v,
                size: j,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : y, [j, v, y]), V = g ? o.default.createElement("label", {
                htmlFor: A,
                className: (0, r.default)(m[j], "content-emphasis")
            }, g, C && o.default.createElement(o.default.Fragment, null, " ", o.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return o.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, r.default)("flex width-full flex-col gap-small ".concat(M), {
                    [t.disabledOpacity]: R
                }),
                style: I
            }, V && (h ? o.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, V, o.default.createElement(i.LabelTooltip, h)) : V), o.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, r.default)("foundation-web-input flex items-center width-full", n.INPUT_STROKE_BY_VARIANT[N], n.INPUT_BACKGROUND_BY_VARIANT[N], L, c[j], u[j], d[j], s[j], B ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: T
            }, U, o.default.createElement("input", {
                type: "text",
                id: A,
                ref: p,
                className: (0, r.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", f[j]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": B,
                "aria-describedby": O ? X : void 0,
                required: C,
                ...P,
                disabled: R
            }), D), O && o.default.createElement("span", {
                id: X,
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": B,
                    "content-default": !B
                })
            }, O))
        });
    p.displayName = "TextInput", e.s(["TextInput", 0, p])
}, 461806, e => {
    "use strict";
    var t = e.i(880343),
        a = e.i(776569),
        l = e.i(416340);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: i,
            description: n,
            position: r = "top-center"
        } = e;
        return l.default.createElement(a.Tooltip, {
            position: r,
            title: i,
            description: n
        }, l.default.createElement(a.TooltipTrigger, {
            asChild: !0
        }, l.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": i,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, l.default.createElement(t.Icon, {
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
            l = (0, t.useRef)();
        return l.current || (a += 1, l.current = "".concat(e).concat(a)), l.current
    }])
}, 525861, e => {
    "use strict";
    var t = e.i(30941),
        a = e.i(416340),
        l = e.i(936993),
        i = e.i(129210),
        n = e.i(928277),
        r = e.i(169336),
        o = e.i(477763),
        d = e.i(226319),
        s = e.i(425935),
        c = e.i(588393),
        u = e.i(221628),
        m = e.i(79888),
        f = e.i(442632),
        p = e.i(980514);
    e.i(333032);
    var g = (0, c.c)((0, u.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        h = (0, c.c)((0, u.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let x = (0, d.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: d.r
        })({
            position: "relative",
            display: "flex"
        }),
        v = (0, d.s)(g, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        b = (0, d.s)(h, {
            name: "MuiRadioButtonIcon"
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, o._)({
                left: 0,
                position: "absolute",
                transform: "scale(0)",
                transition: t.transitions.create("transform", {
                    easing: t.transitions.easing.easeIn,
                    duration: t.transitions.duration.shortest
                })
            }, a.checked && {
                transform: "scale(1)",
                transition: t.transitions.create("transform", {
                    easing: t.transitions.easing.easeOut,
                    duration: t.transitions.duration.shortest
                })
            })
        });

    function y(e) {
        let {
            checked: t = !1,
            classes: a = {},
            fontSize: l
        } = e, i = (0, o._)({}, e, {
            checked: t
        });
        return (0, u.jsxs)(x, {
            className: a.root,
            ownerState: i,
            children: [(0, u.jsx)(v, {
                fontSize: l,
                className: a.background,
                ownerState: i
            }), (0, u.jsx)(b, {
                fontSize: l,
                className: a.dot,
                ownerState: i
            })]
        })
    }

    function S(e) {
        return (0, r.g)("MuiRadio", e)
    }
    var E = (0, n.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let k = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        w = (0, d.s)(s.S, {
            shouldForwardProp: e => (0, d.r)(e) || "classes" === e,
            name: "MuiRadio",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, "medium" !== a.size && t["size".concat((0, r.a)(a.size))], t["color".concat((0, r.a)(a.color))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, o._)({
                color: (t.vars || t).palette.text.secondary
            }, !a.disableRipple && {
                "&:hover": {
                    backgroundColor: t.vars ? "rgba(".concat("default" === a.color ? t.vars.palette.action.activeChannel : t.vars.palette[a.color].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, r.b)("default" === a.color ? t.palette.action.active : t.palette[a.color].main, t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== a.color && {
                ["&.".concat(E.checked)]: {
                    color: (t.vars || t).palette[a.color].main
                }
            }, {
                ["&.".concat(E.disabled)]: {
                    color: (t.vars || t).palette.action.disabled
                }
            })
        }),
        N = (0, u.jsx)(y, {
            checked: !0
        }),
        C = (0, u.jsx)(y, {}),
        R = a.forwardRef(function(e, t) {
            var l, i, n, s;
            let c = (0, f.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: g,
                    checkedIcon: h = N,
                    color: x = "primary",
                    icon: v = C,
                    name: b,
                    onChange: y,
                    size: E = "medium",
                    className: R
                } = c,
                M = (0, r._)(c, k),
                I = (0, o._)({}, c, {
                    color: x,
                    size: E
                }),
                L = (e => {
                    let {
                        classes: t,
                        color: a,
                        size: l
                    } = e, i = {
                        root: ["root", "color".concat((0, r.a)(a)), "medium" !== l && "size".concat((0, r.a)(l))]
                    };
                    return (0, o._)({}, t, (0, d.a)(i, S, t))
                })(I),
                T = a.useContext(m.R),
                z = g,
                P = (0, p.c)(y, T && T.onChange),
                _ = b;
            return T && (void 0 === z && (n = T.value, z = "object" == typeof(s = c.value) && null !== s ? n === s : String(n) === String(s)), void 0 === _ && (_ = T.name)), (0, u.jsx)(w, (0, o._)({
                type: "radio",
                icon: a.cloneElement(v, {
                    fontSize: null != (l = C.props.fontSize) ? l : E
                }),
                checkedIcon: a.cloneElement(h, {
                    fontSize: null != (i = N.props.fontSize) ? i : E
                }),
                ownerState: I,
                classes: L,
                name: _,
                checked: z,
                onChange: P,
                ref: t,
                className: (0, d.c)(L.root, R)
            }, M))
        });
    var M = (0, l.default)({
            name: "Radio"
        })(function(e) {
            var t, a;
            return {
                root: {
                    color: e.palette.states.active
                },
                colorPrimary: ((t = {
                    color: e.palette.content.muted
                })["&.".concat(E.checked)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, t),
                colorSecondary: {
                    color: e.palette.actionV2.primary.fill
                },
                disabled: ((a = {
                    color: e.palette.states.disabled
                })["&.".concat(E.colorPrimary, ".").concat(E.checked)] = {
                    color: e.palette.states.disabled
                }, a)
            }
        }),
        I = (0, a.forwardRef)(function(e, l) {
            var n = e.classes,
                r = e.color,
                o = e.inputProps,
                d = e["aria-label"],
                s = e.className,
                c = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                u = M(void 0, {
                    props: {
                        classes: (0, i.default)(n, s)
                    }
                });
            return a.default.createElement(R, (0, t._)({}, c, {
                classes: u.classes,
                color: void 0 === r ? "primary" : r,
                ref: l,
                inputProps: (0, t._)({
                    "aria-label": d
                }, o)
            }))
        });
    e.s(["Radio", 0, I], 525861)
}, 79888, e => {
    "use strict";
    let t = e.i(416340).createContext(void 0);
    e.s(["R", 0, t])
}, 520091, e => {
    "use strict";
    e.s(["v", 0, {
        border: 0,
        clip: "rect(0 0 0 0)",
        height: "1px",
        margin: "-1px",
        overflow: "hidden",
        padding: 0,
        position: "absolute",
        whiteSpace: "nowrap",
        width: "1px"
    }])
}]);

//# debugId=2a420c54-db1c-c62f-8e42-7842937075f8
//# sourceMappingURL=13dom3gdcsg-r.js.map
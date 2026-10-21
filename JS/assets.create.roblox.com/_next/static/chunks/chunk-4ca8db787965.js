;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "66308a13-c914-d46f-3e91-3681eef820fd")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 523426, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "anti-cheat",
        name: "enhancedAntiCheatAccess",
        defaultValue: !1
    });
    e.s(["enhancedAntiCheatAccess", 0, t])
}, 245299, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "collaborative-tools",
        name: "enableEnvironments",
        defaultValue: !1
    });
    e.s(["enableEnvironments", 0, t])
}, 846130, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportTicketTranslation",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCategoryChange",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportSpamManagement",
            defaultValue: !1
        }),
        d = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1
        });
    e.s(["enableEarlyTestersUserOwnedGame", 0, d, "enablePlayerHostedEvents", 0, l, "enablePlayerSupport", 0, a, "enablePlayerSupportArchive", 0, i, "enablePlayerSupportCategoryChange", 0, s, "enablePlayerSupportCreatorTicketReroute", 0, r, "enablePlayerSupportSpamManagement", 0, o, "enablePlayerSupportTicketTranslation", 0, n])
}, 886525, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "game-engine-streaming",
        name: "enableExperienceLaunchTimeChart",
        defaultValue: !1
    });
    e.s(["enableExperienceLaunchTimeChart", 0, t])
}, 82899, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "leaderboards",
        name: "isLeaderboardConfigsEnabled",
        defaultValue: !0
    });
    e.s(["isLeaderboardConfigsEnabled", 0, t])
}, 494192, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "preset-chat",
        name: "presetChatEnabled",
        defaultValue: !1
    });
    e.s(["presetChatEnabled", 0, t])
}, 998683, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(502585),
        n = e.i(272593);
    let l = new class {
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
            (0, t._)(this, "localeApi", void 0), this.localeApi = new a.LocaleApi((0, n.createClientConfiguration)("locale", "bedev1"))
        }
    };
    e.s(["default", 0, l])
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
}, 614875, e => {
    "use strict";
    var t = e.i(999210),
        a = e.i(641659),
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
        [g, v] = (0, i.createContextScope)(p),
        [h, b] = g(p);

    function x(e) {
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
            internal_do_not_use_render: g
        } = e, [v, b] = (0, o.useControllableState)({
            prop: a,
            defaultProp: null != r && r,
            onChange: u,
            caller: p
        }), [x, y] = l.useState(null), [E, w] = l.useState(null), S = l.useRef(!1), N = !x || !!s || !!x.closest("form"), k = {
            checked: v,
            disabled: i,
            setChecked: b,
            control: x,
            setControl: y,
            name: d,
            form: s,
            value: m,
            hasConsumerStoppedPropagationRef: S,
            required: c,
            defaultChecked: !P(r) && r,
            isFormControl: N,
            bubbleInput: E,
            setBubbleInput: w
        };
        return (0, f.jsx)(h, {
            scope: t,
            ...k,
            children: "function" == typeof g ? g(k) : n
        })
    }
    var y = "CheckboxTrigger",
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
                required: g,
                setControl: v,
                setChecked: h,
                hasConsumerStoppedPropagationRef: x,
                isFormControl: E,
                bubbleInput: w
            } = b(y, a), S = (0, r.useComposedRefs)(t, v), N = l.useRef(p);
            return l.useEffect(() => {
                let e = null == d ? void 0 : d.form;
                if (e) {
                    let t = () => h(N.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [d, h]), (0, f.jsx)(m.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": P(p) ? "mixed" : p,
                "aria-required": g,
                "data-state": L(p),
                "data-disabled": c ? "" : void 0,
                disabled: c,
                value: u,
                ...o,
                ref: S,
                onKeyDown: (0, s.composeEventHandlers)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, s.composeEventHandlers)(i, e => {
                    h(e => !!P(e) || !e), w && E && (x.current = e.isPropagationStopped(), x.current || e.stopPropagation())
                })
            })
        });
    E.displayName = y;
    var w = l.forwardRef((e, t) => {
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
        return (0, f.jsx)(x, {
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
                    }), n && (0, f.jsx)(C, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    w.displayName = p;
    var S = "CheckboxIndicator",
        N = l.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...l
            } = e, r = b(S, a);
            return (0, f.jsx)(c.Presence, {
                present: n || P(r.checked) || !0 === r.checked,
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
    N.displayName = S;
    var k = "CheckboxBubbleInput",
        C = l.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                ...n
            } = e, {
                control: i,
                hasConsumerStoppedPropagationRef: s,
                checked: o,
                defaultChecked: c,
                required: p,
                disabled: g,
                name: v,
                value: h,
                form: x,
                bubbleInput: y,
                setBubbleInput: E
            } = b(k, a), w = (0, r.useComposedRefs)(t, E), S = (0, d.usePrevious)(o), N = (0, u.useSize)(i);
            l.useEffect(() => {
                if (!y) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !s.current;
                if (S !== o && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    y.indeterminate = P(o), e.call(y, !P(o) && o), y.dispatchEvent(a)
                }
            }, [y, S, o, s]);
            let C = l.useRef(!P(o) && o);
            return (0, f.jsx)(m.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != c ? c : C.current,
                required: p,
                disabled: g,
                name: v,
                value: h,
                form: x,
                ...n,
                tabIndex: -1,
                ref: w,
                style: {
                    ...n.style,
                    ...N,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function P(e) {
        return "indeterminate" === e
    }

    function L(e) {
        return P(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    C.displayName = k;
    let T = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        M = {
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
        A = {
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
        } = e, g = (0, a.default)(), v = f || g, h = r && l.default.createElement("label", {
            htmlFor: v,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !o && "cursor-pointer")
        }, l.default.createElement("span", {
            className: (0, n.default)(R[d], A[d], "content-emphasis")
        }, r), u && l.default.createElement("span", {
            className: "text-body-medium content-default"
        }, u));
        return l.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", o && "opacity-[0.5]", !o && "cursor-pointer", i)
        }, "End" === c && h, l.default.createElement("div", {
            className: (0, n.default)(M[d])
        }, l.default.createElement(w, {
            "data-slot": "checkbox",
            className: (0, n.default)(T[d], t.interactable, !o && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: v,
            checked: s,
            disabled: o,
            onCheckedChange: m,
            "aria-label": r,
            ...p
        }, l.default.createElement(t.StateLayer, null), l.default.createElement(N, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(T[d], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === c && h)
    }], 614875)
}, 262069, e => {
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
}, 927072, e => {
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
                as: S,
                ...N
            } = x;
            return a.default.createElement("a", {
                ref: s,
                ...N,
                className: E
            }, c, w)
        });
    s.displayName = "Link", e.s(["Link", 0, s])
}, 152324, 108872, e => {
    "use strict";
    var t = e.i(999210),
        a = e.i(641659),
        n = e.i(825942),
        l = e.i(753534),
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
                variant: S = "Standard",
                value: N,
                placeholder: k,
                isDisabled: C,
                hasError: P,
                hint: L,
                onValueChange: T,
                onOpenChange: M,
                children: R
            } = e, A = (0, a.default)(), I = (0, i.useMemo)(() => ({
                size: w
            }), [w]), F = h ? i.default.createElement("span", {
                id: A,
                className: (0, r.default)(c[w], "content-emphasis")
            }, h) : null;
            return i.default.createElement(o.Provider, {
                value: I
            }, i.default.createElement("div", {
                className: (0, r.default)("flex flex-col", C && ["opacity-[0.5]", "pointer-events-none"], f[w], E)
            }, F && (b ? i.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, F, i.default.createElement(n.LabelTooltip, b)) : F), i.default.createElement(s.Root, {
                value: N,
                disabled: C,
                onValueChange: T,
                onOpenChange: M
            }, i.default.createElement(s.Trigger, {
                className: (0, r.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", l.INPUT_BACKGROUND_BY_VARIANT[S], l.INPUT_STROKE_BY_VARIANT[S], p[w], g[w], u[w], m[w], P ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === N ? "content-muted" : "content-default"),
                ref: v,
                "aria-labelledby": h ? A : x,
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
            }, R))), L && i.default.createElement("span", {
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": P,
                    "content-default": !P
                })
            }, L)))
        });
    v.displayName = "Dropdown", e.s(["Dropdown", 0, v, "DropdownContext", 0, o], 108872);
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
        S = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        N = {
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
        C = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        P = (0, i.createContext)(null),
        L = () => {
            let e = (0, i.useContext)(P);
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
        return i.default.createElement(P.Provider, {
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
            } = L(),
            P = (0, r.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", k[x], E[x], w[x], S[x], C[x], c && "opacity-[0.5]", c && "pointer-events-none", m),
            T = i.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, o);
        switch (y) {
            case "dropdown":
                T = i.default.createElement(s.ItemText, {
                    asChild: !0
                }, T);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", y)
        }
        let M = i.default.createElement(i.default.Fragment, null, !c && i.default.createElement(t.StateLayer, null), l, i.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", N[x])
        }, T, d && i.default.createElement("div", {
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
                className: P,
                style: {
                    outlineOffset: 0
                },
                onClick: c ? void 0 : f
            }, r ? i.default.cloneElement(l, {}, i.default.createElement(i.default.Fragment, null, !c && i.default.createElement(t.StateLayer, null), l.props.children)) : i.default.cloneElement(l, {}, M))
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
                className: P,
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
            } = v;
            a = i.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === y ? "menuitem" : void 0,
                "aria-disabled": c,
                className: P,
                style: {
                    outlineOffset: 0
                },
                onClick: c ? void 0 : f
            }, M)
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
        } = L(), u = (0, r.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", k[d], E[d], w[d], S[d], s && "opacity-[0.5]", o);
        return i.default.createElement("div", {
            role: "none",
            className: u
        }, n, i.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", N[d])
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
        } = L();
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
    }], 152324)
}, 984863, e => {
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
    }, "PopoverClose", 0, function(e) {
        let {
            children: t,
            ...l
        } = e;
        return a.createElement(n.Close, l, t)
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
}, 580683, e => {
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
}, 600373, e => {
    "use strict";
    var t = e.i(562991),
        a = e.i(278862),
        n = e.i(805476),
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
        } = e, [b, x] = (0, r.useState)("enter"), y = (0, r.useRef)(void 0), E = (0, r.useRef)(void 0), w = (0, r.useRef)(void 0), S = (0, r.useRef)(null), N = null != c ? c : d && u && r.default.createElement(a.Button, {
            size: "Small",
            variant: "Utility",
            className: "content-inverse-emphasis",
            onClick: u,
            ref: S
        }, d), k = !!N, C = s.length > 80, P = null == p || p, L = 4e3;
        k && (L = C ? 1e4 : 7e3);
        let T = null != g ? g : L,
            M = (0, r.useCallback)(() => {
                "exit" !== b && (x("exit"), void 0 !== E.current && (window.clearTimeout(E.current), E.current = void 0), w.current = window.setTimeout(() => {
                    null == m || m()
                }, 150))
            }, [m, b]);
        (0, r.useEffect)(() => (y.current = window.requestAnimationFrame(() => {
            x("idle")
        }), () => {
            void 0 !== y.current && window.cancelAnimationFrame(y.current)
        }), []), (0, r.useEffect)(() => {
            void 0 !== E.current && (window.clearTimeout(E.current), E.current = void 0), P && "exit" !== b && (E.current = window.setTimeout(() => {
                M()
            }, T))
        }, [T, P, b, M]), (0, r.useEffect)(() => {
            var e;
            k && (null == (e = S.current) || e.focus())
        }, [k]), (0, r.useEffect)(() => () => {
            void 0 !== E.current && window.clearTimeout(E.current), void 0 !== w.current && window.clearTimeout(w.current), void 0 !== y.current && window.cancelAnimationFrame(y.current)
        }, []);
        let R = {
                position: "fixed",
                left: "50%",
                bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                transform: "translate(-50%, ".concat("idle" === b ? "0" : "120%", ")"),
                zIndex: "var(--foundation-portal-zindex, 9999)"
            },
            A = h.style ? {
                ...R,
                ...h.style
            } : R;
        return r.default.createElement("div", {
            ref: i,
            role: "status",
            "aria-live": "polite",
            className: (0, l.default)("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === b ? "ease-standard-in" : "ease-standard-out", v),
            style: {
                ...A,
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
        }, N, m && r.default.createElement(n.CloseAffordance, {
            variant: "Utility",
            size: "Small",
            isCircular: !0,
            className: "content-inverse-emphasis",
            "aria-label": f,
            onClick: M
        })))
    });
    e.s(["Snackbar", 0, i])
}, 825942, e => {
    "use strict";
    var t = e.i(562991),
        a = e.i(508019),
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
}, 753534, e => {
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
}, 641659, e => {
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

//# debugId=66308a13-c914-d46f-3e91-3681eef820fd
//# sourceMappingURL=0-0qmnd39yf8-.js.map
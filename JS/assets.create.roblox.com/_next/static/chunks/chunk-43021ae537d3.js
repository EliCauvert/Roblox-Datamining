;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "49e3bf09-4f33-75f8-13ac-90dea77ce165")
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
}, 481186, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "extended-services",
        name: "isQueueServiceAnalyticsEnabled",
        defaultValue: !1
    });
    e.s(["isQueueServiceAnalyticsEnabled", 0, t])
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
        }), [x, y] = t.useState(null), [E, S] = t.useState(null), w = t.useRef(!1), k = !x || !!o || !!x.closest("form"), L = {
            checked: h,
            disabled: s,
            setChecked: b,
            control: x,
            setControl: y,
            name: d,
            form: o,
            value: g,
            hasConsumerStoppedPropagationRef: w,
            required: f,
            defaultChecked: !N(i) && i,
            isFormControl: k,
            bubbleInput: E,
            setBubbleInput: S
        };
        return (0, u.jsx)(p, {
            scope: a,
            ...L,
            children: "function" == typeof v ? v(L) : l
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
                bubbleInput: S
            } = g(h, r), w = (0, a.useComposedRefs)(n, b), L = t.useRef(p);
            return t.useEffect(() => {
                let e = null == c ? void 0 : c.form;
                if (e) {
                    let t = () => x(L.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [c, x]), (0, u.jsx)(d.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": N(p) ? "mixed" : p,
                "aria-required": v,
                "data-state": k(p),
                "data-disabled": f ? "" : void 0,
                disabled: f,
                value: m,
                ...o,
                ref: w,
                onKeyDown: (0, l.composeEventHandlers)(i, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, l.composeEventHandlers)(s, e => {
                    x(e => !!N(e) || !e), S && E && (y.current = e.isPropagationStopped(), y.current || e.stopPropagation())
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
                    }), n && (0, u.jsx)(w, {
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
                present: n || N(r.checked) || !0 === r.checked,
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
    var S = "CheckboxBubbleInput",
        w = t.forwardRef((e, n) => {
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
            } = g(S, l), w = (0, a.useComposedRefs)(n, E), k = (0, i.usePrevious)(m), L = (0, s.useSize)(o);
            t.useEffect(() => {
                if (!y) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !c.current;
                if (k !== m && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    y.indeterminate = N(m), e.call(y, !N(m) && m), y.dispatchEvent(a)
                }
            }, [y, k, m, c]);
            let C = t.useRef(!N(m) && m);
            return (0, u.jsx)(d.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != f ? f : C.current,
                required: p,
                disabled: v,
                name: h,
                value: b,
                form: x,
                ...r,
                tabIndex: -1,
                ref: w,
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

    function N(e) {
        return "indeterminate" === e
    }

    function k(e) {
        return N(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    w.displayName = S, e.s(["Indicator", 0, E, "Root", 0, x])
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
        } = e, y = (0, a.default)(), E = b || y, S = u && l.default.createElement("label", {
            htmlFor: E,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !f && "cursor-pointer")
        }, l.default.createElement("span", {
            className: (0, n.default)(o[p], d[p], "content-emphasis")
        }, u), g && l.default.createElement("span", {
            className: "text-body-medium content-default"
        }, g));
        return l.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", f && "opacity-[0.5]", !f && "cursor-pointer", c)
        }, "End" === v && S, l.default.createElement("div", {
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
        }))), "Start" === v && S)
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
                size: S = "Large",
                variant: w = "Emphasis",
                iconColor: N = "Default",
                asChild: k,
                children: L,
                ...C
            } = e;
            g = x ? u[w] : E ? c[w] : d[w];
            let P = (0, n.default)("foundation-web-icon-button", x ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", i[S], o[S][y ? "circular" : "square"], g, v),
                T = l.default.createElement(l.default.Fragment, null, l.default.createElement(t.StateLayer, null), l.default.createElement("span", {
                    className: (0, n.default)("icon", h, s[S], x ? f[N][w] : m[N][w])
                }));
            if (k) {
                let {
                    as: e,
                    ...t
                } = C, a = l.default.Children.only(L);
                return l.default.createElement(r.Slot, {
                    ref: p,
                    ...t,
                    className: P,
                    "aria-label": b,
                    "aria-disabled": x || void 0
                }, l.default.cloneElement(a, {}, T))
            }
            if ("a" === C.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = C;
                return l.default.createElement("a", {
                    ref: p,
                    ...a,
                    "aria-label": b,
                    "aria-disabled": x,
                    href: x ? void 0 : t,
                    className: P
                }, T)
            }
            let {
                as: M,
                ...A
            } = C;
            return l.default.createElement("button", {
                ref: p,
                type: "button",
                ...A,
                "aria-label": b,
                disabled: x,
                className: P
            }, T)
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
            } = e, y = (d = null != (o = x.as) ? o : "a", u = "button" === x.as ? void 0 : x.target, void 0 !== h ? h : "button" !== d && void 0 !== u && !l.has(u)), E = (0, t.default)("foundation-web-link", "button" === x.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === g || y) && "inline-flex items-center gap-xsmall", void 0 !== f && r[f], i[p], "always" === v ? "underline" : "no-underline", "hover" === v && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", m), S = y ? a.default.createElement("span", {
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
                }, a.default.cloneElement(l, {}, a.default.createElement(a.default.Fragment, null, l.props.children, S))) : null
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
                }, c, S)
            }
            let {
                as: w,
                ...N
            } = x;
            return a.default.createElement("a", {
                ref: s,
                ...N,
                className: E
            }, c, S)
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
                size: S,
                variant: w = "Standard",
                value: N,
                placeholder: k,
                isDisabled: L,
                hasError: C,
                hint: P,
                onValueChange: T,
                onOpenChange: M,
                children: A
            } = e, R = (0, a.default)(), I = (0, i.useMemo)(() => ({
                size: S
            }), [S]), O = h ? i.default.createElement("span", {
                id: R,
                className: (0, r.default)(c[S], "content-emphasis")
            }, h) : null;
            return i.default.createElement(o.Provider, {
                value: I
            }, i.default.createElement("div", {
                className: (0, r.default)("flex flex-col", L && ["opacity-[0.5]", "pointer-events-none"], f[S], E)
            }, O && (b ? i.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, O, i.default.createElement(n.LabelTooltip, b)) : O), i.default.createElement(s.Root, {
                value: N,
                disabled: L,
                onValueChange: T,
                onOpenChange: M
            }, i.default.createElement(s.Trigger, {
                className: (0, r.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", l.INPUT_BACKGROUND_BY_VARIANT[w], l.INPUT_STROKE_BY_VARIANT[w], p[S], g[S], u[S], m[S], C ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === N ? "content-muted" : "content-default"),
                ref: v,
                "aria-labelledby": h ? R : x,
                "aria-label": y
            }, i.default.createElement(t.StateLayer, null), i.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, i.default.createElement(s.Value, {
                placeholder: k
            })), i.default.createElement(s.Icon, {
                className: (0, r.default)(d[S], "icon icon-regular-chevron-large-down content-default")
            })), i.default.createElement(s.Portal, null, i.default.createElement(s.Content, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, A))), P && i.default.createElement("span", {
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": C,
                    "content-default": !C
                })
            }, P)))
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
        S = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        w = {
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
        L = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        C = (0, i.createContext)(null),
        P = () => {
            let e = (0, i.useContext)(C);
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
        return i.default.createElement(C.Provider, {
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
            } = P(),
            C = (0, r.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", k[x], E[x], S[x], w[x], L[x], c && "opacity-[0.5]", c && "pointer-events-none", m),
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
                className: C,
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
                className: C,
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
                className: C,
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
        } = P(), u = (0, r.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", k[d], E[d], S[d], w[d], s && "opacity-[0.5]", o);
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
        } = P();
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
        } = e, [b, x] = (0, r.useState)("enter"), y = (0, r.useRef)(void 0), E = (0, r.useRef)(void 0), S = (0, r.useRef)(void 0), w = (0, r.useRef)(null), N = null != c ? c : d && u && r.default.createElement(a.Button, {
            size: "Small",
            variant: "Utility",
            className: "content-inverse-emphasis",
            onClick: u,
            ref: w
        }, d), k = !!N, L = s.length > 80, C = null == p || p, P = 4e3;
        k && (P = L ? 1e4 : 7e3);
        let T = null != g ? g : P,
            M = (0, r.useCallback)(() => {
                "exit" !== b && (x("exit"), void 0 !== E.current && (window.clearTimeout(E.current), E.current = void 0), S.current = window.setTimeout(() => {
                    null == m || m()
                }, 150))
            }, [m, b]);
        (0, r.useEffect)(() => (y.current = window.requestAnimationFrame(() => {
            x("idle")
        }), () => {
            void 0 !== y.current && window.cancelAnimationFrame(y.current)
        }), []), (0, r.useEffect)(() => {
            void 0 !== E.current && (window.clearTimeout(E.current), E.current = void 0), C && "exit" !== b && (E.current = window.setTimeout(() => {
                M()
            }, T))
        }, [T, C, b, M]), (0, r.useEffect)(() => {
            var e;
            k && (null == (e = w.current) || e.focus())
        }, [k]), (0, r.useEffect)(() => () => {
            void 0 !== E.current && window.clearTimeout(E.current), void 0 !== S.current && window.clearTimeout(S.current), void 0 !== y.current && window.cancelAnimationFrame(y.current)
        }, []);
        let A = {
                position: "fixed",
                left: "50%",
                bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                transform: "translate(-50%, ".concat("idle" === b ? "0" : "120%", ")"),
                zIndex: "var(--foundation-portal-zindex, 9999)"
            },
            R = h.style ? {
                ...A,
                ...h.style
            } : A;
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

//# debugId=49e3bf09-4f33-75f8-13ac-90dea77ce165
//# sourceMappingURL=3w06d3qkzgw92.js.map
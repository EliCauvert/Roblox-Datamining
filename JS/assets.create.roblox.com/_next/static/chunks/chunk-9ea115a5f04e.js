;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "0f77a0bc-5a6e-0891-d191-be1d3c560d3f")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 335681, 520, 692226, e => {
    "use strict";
    var o = e.i(194250),
        t = e.i(416340),
        r = e.i(863605),
        n = e.i(154502),
        a = e.i(787802),
        l = e.i(690569),
        i = e.i(472552),
        s = e.i(945146),
        c = e.i(251635),
        d = e.i(836108),
        u = e.i(634034),
        m = e.i(221628),
        k = (0, u.c)((0, m.jsx)("path", {
            d: "M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"
        }), "Close");
    e.s(["C", 0, k], 520);
    var p = e.i(770593),
        g = e.i(121880),
        h = e.i(576592);

    function f(e) {
        return (0, l.g)("MuiAlert", e)
    }
    var C = (0, a.g)("MuiAlert", ["root", "action", "icon", "message", "filled", "colorSuccess", "colorInfo", "colorWarning", "colorError", "filledSuccess", "filledInfo", "filledWarning", "filledError", "outlined", "outlinedSuccess", "outlinedInfo", "outlinedWarning", "outlinedError", "standard", "standardSuccess", "standardInfo", "standardWarning", "standardError"]),
        v = (0, u.c)((0, m.jsx)("path", {
            d: "M20,12A8,8 0 0,1 12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4C12.76,4 13.5,4.11 14.2, 4.31L15.77,2.74C14.61,2.26 13.34,2 12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0, 0 22,12M7.91,10.08L6.5,11.5L11,16L21,6L19.59,4.58L11,13.17L7.91,10.08Z"
        }), "SuccessOutlined"),
        b = (0, u.c)((0, m.jsx)("path", {
            d: "M12 5.99L19.53 19H4.47L12 5.99M12 2L1 21h22L12 2zm1 14h-2v2h2v-2zm0-6h-2v4h2v-4z"
        }), "ReportProblemOutlined"),
        S = (0, u.c)((0, m.jsx)("path", {
            d: "M11 15h2v2h-2zm0-8h2v6h-2zm.99-5C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "ErrorOutline"),
        T = (0, u.c)((0, m.jsx)("path", {
            d: "M11,9H13V7H11M12,20C7.59,20 4,16.41 4,12C4,7.59 7.59,4 12,4C16.41,4 20,7.59 20, 12C20,16.41 16.41,20 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10, 10 0 0,0 12,2M11,17H13V11H11V17Z"
        }), "InfoOutlined");
    let y = ["action", "children", "className", "closeText", "color", "components", "componentsProps", "icon", "iconMapping", "onClose", "role", "severity", "slotProps", "slots", "variant"],
        x = (0, c.s)(p.M, {
            name: "MuiAlert",
            slot: "Root",
            overridesResolver: (e, o) => {
                let {
                    ownerState: t
                } = e;
                return [o.root, o[t.variant], o["".concat(t.variant).concat((0, l.a)(t.color || t.severity))]]
            }
        })(e => {
            let {
                theme: o
            } = e, t = "light" === o.palette.mode ? l.j : l.l, r = "light" === o.palette.mode ? l.l : l.j;
            return (0, s._)({}, o.typography.body2, {
                backgroundColor: "transparent",
                display: "flex",
                padding: "6px 16px",
                variants: [...Object.entries(o.palette).filter(e => {
                    let [, o] = e;
                    return o.main && o.light
                }).map(e => {
                    let [n] = e;
                    return {
                        props: {
                            colorSeverity: n,
                            variant: "standard"
                        },
                        style: {
                            color: o.vars ? o.vars.palette.Alert["".concat(n, "Color")] : t(o.palette[n].light, .6),
                            backgroundColor: o.vars ? o.vars.palette.Alert["".concat(n, "StandardBg")] : r(o.palette[n].light, .9),
                            ["& .".concat(C.icon)]: o.vars ? {
                                color: o.vars.palette.Alert["".concat(n, "IconColor")]
                            } : {
                                color: o.palette[n].main
                            }
                        }
                    }
                }), ...Object.entries(o.palette).filter(e => {
                    let [, o] = e;
                    return o.main && o.light
                }).map(e => {
                    let [r] = e;
                    return {
                        props: {
                            colorSeverity: r,
                            variant: "outlined"
                        },
                        style: {
                            color: o.vars ? o.vars.palette.Alert["".concat(r, "Color")] : t(o.palette[r].light, .6),
                            border: "1px solid ".concat((o.vars || o).palette[r].light),
                            ["& .".concat(C.icon)]: o.vars ? {
                                color: o.vars.palette.Alert["".concat(r, "IconColor")]
                            } : {
                                color: o.palette[r].main
                            }
                        }
                    }
                }), ...Object.entries(o.palette).filter(e => {
                    let [, o] = e;
                    return o.main && o.dark
                }).map(e => {
                    let [t] = e;
                    return {
                        props: {
                            colorSeverity: t,
                            variant: "filled"
                        },
                        style: (0, s._)({
                            fontWeight: o.typography.fontWeightMedium
                        }, o.vars ? {
                            color: o.vars.palette.Alert["".concat(t, "FilledColor")],
                            backgroundColor: o.vars.palette.Alert["".concat(t, "FilledBg")]
                        } : {
                            backgroundColor: "dark" === o.palette.mode ? o.palette[t].dark : o.palette[t].main,
                            color: o.palette.getContrastText(o.palette[t].main)
                        })
                    }
                })]
            })
        }),
        D = (0, c.s)("div", {
            name: "MuiAlert",
            slot: "Icon",
            overridesResolver: (e, o) => o.icon
        })({
            marginRight: 12,
            padding: "7px 0",
            display: "flex",
            fontSize: 22,
            opacity: .9
        }),
        B = (0, c.s)("div", {
            name: "MuiAlert",
            slot: "Message",
            overridesResolver: (e, o) => o.message
        })({
            padding: "8px 0",
            minWidth: 0,
            overflow: "auto"
        }),
        L = (0, c.s)("div", {
            name: "MuiAlert",
            slot: "Action",
            overridesResolver: (e, o) => o.action
        })({
            display: "flex",
            alignItems: "flex-start",
            padding: "4px 0 0 16px",
            marginLeft: "auto",
            marginRight: -8
        }),
        F = {
            success: (0, m.jsx)(v, {
                fontSize: "inherit"
            }),
            warning: (0, m.jsx)(b, {
                fontSize: "inherit"
            }),
            error: (0, m.jsx)(S, {
                fontSize: "inherit"
            }),
            info: (0, m.jsx)(T, {
                fontSize: "inherit"
            })
        },
        _ = t.forwardRef(function(e, o) {
            let t = (0, g.u)({
                    props: e,
                    name: "MuiAlert"
                }),
                {
                    action: r,
                    children: n,
                    className: a,
                    closeText: i = "Close",
                    color: u,
                    components: p = {},
                    componentsProps: C = {},
                    icon: v,
                    iconMapping: b = F,
                    onClose: S,
                    role: T = "alert",
                    severity: _ = "success",
                    slotProps: M = {},
                    slots: A = {},
                    variant: E = "standard"
                } = t,
                w = (0, l._)(t, y),
                R = (0, s._)({}, t, {
                    color: u,
                    severity: _,
                    variant: E,
                    colorSeverity: u || _
                }),
                j = (e => {
                    let {
                        variant: o,
                        color: t,
                        severity: r,
                        classes: n
                    } = e, a = {
                        root: ["root", "color".concat((0, l.a)(t || r)), "".concat(o).concat((0, l.a)(t || r)), "".concat(o)],
                        icon: ["icon"],
                        message: ["message"],
                        action: ["action"]
                    };
                    return (0, c.a)(a, f, n)
                })(R),
                O = {
                    slots: (0, s._)({
                        closeButton: p.CloseButton,
                        closeIcon: p.CloseIcon
                    }, A),
                    slotProps: (0, s._)({}, C, M)
                },
                [P, H] = (0, d.u)("closeButton", {
                    elementType: h.I,
                    externalForwardedProps: O,
                    ownerState: R
                }),
                [I, N] = (0, d.u)("closeIcon", {
                    elementType: k,
                    externalForwardedProps: O,
                    ownerState: R
                });
            return (0, m.jsxs)(x, (0, s._)({
                role: T,
                elevation: 0,
                ownerState: R,
                className: (0, c.c)(j.root, a),
                ref: o
            }, w, {
                children: [!1 !== v ? (0, m.jsx)(D, {
                    ownerState: R,
                    className: j.icon,
                    children: v || b[_] || F[_]
                }) : null, (0, m.jsx)(B, {
                    ownerState: R,
                    className: j.message,
                    children: n
                }), null != r ? (0, m.jsx)(L, {
                    ownerState: R,
                    className: j.action,
                    children: r
                }) : null, null == r && S ? (0, m.jsx)(L, {
                    ownerState: R,
                    className: j.action,
                    children: (0, m.jsx)(P, (0, s._)({
                        size: "small",
                        "aria-label": i,
                        title: i,
                        color: "inherit",
                        onClick: S
                    }, H, {
                        children: (0, m.jsx)(I, (0, s._)({
                            fontSize: "small"
                        }, N))
                    }))
                }) : null]
            }))
        });
    var M = (0, r.default)({
            name: "Alert"
        })(function(e) {
            var t, r, n, a;
            return {
                root: (0, o._)((0, o._)((0, o._)({}, e.typography.smallLabel1), e.border.radius.medium), {
                    "& a": {
                        color: "inherit",
                        textDecoration: "underline"
                    },
                    '& [class*="InlineCode-root"]': {
                        color: "inherit",
                        backgroundColor: "rgba(0, 0, 0, 0.1)"
                    }
                }),
                action: {
                    alignItems: "flex-start",
                    marginRight: 0,
                    paddingTop: 6,
                    "& > a:hover": {
                        color: "inherit"
                    }
                },
                standardSuccess: ((t = {
                    backgroundColor: e.palette.components.alert.activeFill,
                    color: e.palette.components.alert.activeContent
                })["& .".concat(C.icon)] = {
                    color: e.palette.components.alert.activeContent
                }, t),
                standardInfo: ((r = {
                    backgroundColor: e.palette.components.alert.informFill,
                    color: e.palette.components.alert.informContent
                })["& .".concat(C.icon)] = {
                    color: e.palette.components.alert.informContent
                }, r),
                standardError: ((n = {
                    backgroundColor: e.palette.components.alert.importantFill,
                    color: e.palette.components.alert.importantContent
                })["& .".concat(C.icon)] = {
                    color: e.palette.components.alert.importantContent
                }, n),
                standardWarning: ((a = {
                    backgroundColor: e.palette.components.alert.noticeFill,
                    color: e.palette.components.alert.noticeContent
                })["& .".concat(C.icon)] = {
                    color: e.palette.components.alert.noticeContent
                }, a),
                outlinedError: {
                    borderColor: e.palette.surface.outline,
                    color: e.palette.content.standard,
                    padding: "5px 15px"
                },
                outlinedSuccess: {
                    borderColor: e.palette.surface.outline,
                    color: e.palette.content.standard,
                    padding: "5px 15px"
                },
                outlinedInfo: {
                    borderColor: e.palette.surface.outline,
                    color: e.palette.content.standard,
                    padding: "5px 15px"
                },
                outlinedWarning: {
                    borderColor: e.palette.surface.outline,
                    color: e.palette.content.standard,
                    padding: "5px 15px"
                },
                filledSuccess: {
                    backgroundColor: e.palette.actionV2.active.fill,
                    color: e.palette.content.static.dark
                },
                filledInfo: {
                    backgroundColor: e.palette.actionV2.primaryBrand.fill,
                    color: e.palette.content.static.light
                },
                filledError: {
                    backgroundColor: e.palette.actionV2.important.fill,
                    color: e.palette.content.static.light
                },
                filledWarning: {
                    backgroundColor: e.palette.actionV2.notice.fill,
                    color: e.palette.content.static.dark
                }
            }
        }),
        A = (0, t.forwardRef)(function(e, r) {
            var a = e.severity,
                l = void 0 === a ? "success" : a,
                s = e.icon,
                c = e.children,
                d = e.classes,
                u = e.className,
                m = (0, o.a)(e, ["severity", "icon", "children", "classes", "className"]),
                k = M(void 0, {
                    props: {
                        classes: (0, n.default)(d, u)
                    }
                }),
                p = "success" === l && void 0 === s ? t.default.createElement(i.C, {
                    fontSize: "inherit"
                }) : s;
            return t.default.createElement(_, (0, o._)({}, m, {
                classes: k.classes,
                icon: p,
                ref: r,
                severity: l
            }), c)
        });
    e.s(["A", 0, A, "a", 0, C], 692226), e.s(["Alert", 0, A], 335681)
}, 472552, e => {
    "use strict";
    var o = e.i(221628),
        t = (0, e.i(634034).c)((0, o.jsx)("path", {
            d: "M16.59 7.58 10 14.17l-3.59-3.58L5 12l5 5 8-8zM12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2m0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8"
        }), "CheckCircleOutline");
    e.s(["C", 0, t])
}, 348148, e => {
    "use strict";
    var o = e.i(690569),
        t = e.i(945146),
        r = e.i(416340),
        n = e.i(251635),
        a = e.i(787802),
        l = e.i(894852),
        i = e.i(221628),
        s = e.i(121880),
        c = e.i(335527),
        d = e.i(396249),
        u = e.i(586926),
        m = e.i(783536);
    e.i(465957);
    let k = ["component", "direction", "spacing", "divider", "children", "className", "useFlexGap"],
        p = (0, o.c)(),
        g = (0, u.s)("div", {
            name: "MuiStack",
            slot: "Root",
            overridesResolver: (e, o) => o.root
        });

    function h(e) {
        return (0, m.u)({
            props: e,
            name: "MuiStack",
            defaultTheme: p
        })
    }
    let f = e => {
            let {
                ownerState: r,
                theme: n
            } = e, a = (0, t._)({
                display: "flex",
                flexDirection: "column"
            }, (0, o.m)({
                theme: n
            }, (0, o.r)({
                values: r.direction,
                breakpoints: n.breakpoints.values
            }), e => ({
                flexDirection: e
            })));
            if (r.spacing) {
                let e = (0, o.w)(n),
                    t = Object.keys(n.breakpoints.values).reduce((e, o) => (("object" == typeof r.spacing && null != r.spacing[o] || "object" == typeof r.direction && null != r.direction[o]) && (e[o] = !0), e), {}),
                    l = (0, o.r)({
                        values: r.direction,
                        base: t
                    }),
                    i = (0, o.r)({
                        values: r.spacing,
                        base: t
                    });
                "object" == typeof l && Object.keys(l).forEach((e, o, t) => {
                    if (!l[e]) {
                        let r = o > 0 ? l[t[o - 1]] : "column";
                        l[e] = r
                    }
                }), a = (0, o.d)(a, (0, o.m)({
                    theme: n
                }, i, (t, n) => r.useFlexGap ? {
                    gap: (0, o.y)(e, t)
                } : {
                    "& > :not(style):not(style)": {
                        margin: 0
                    },
                    "& > :not(style) ~ :not(style)": {
                        ["margin".concat({
                            row: "Left",
                            "row-reverse": "Right",
                            column: "Top",
                            "column-reverse": "Bottom"
                        } [n ? l[n] : r.direction])]: (0, o.y)(e, t)
                    }
                }))
            }
            return (0, o.x)(n.breakpoints, a)
        },
        C = function() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                {
                    createStyledComponent: a = g,
                    useThemeProps: l = h,
                    componentName: s = "MuiStack"
                } = e,
                c = a(f);
            return r.forwardRef(function(e, a) {
                let d, u = l(e),
                    m = (0, n.e)(u),
                    {
                        component: p = "div",
                        direction: g = "column",
                        spacing: h = 0,
                        divider: f,
                        children: C,
                        className: v,
                        useFlexGap: b = !1
                    } = m,
                    S = (0, o._)(m, k),
                    T = (0, n.a)({
                        root: ["root"]
                    }, e => (0, o.g)(s, e), {});
                return (0, i.jsx)(c, (0, t._)({
                    as: p,
                    ownerState: {
                        direction: g,
                        spacing: h,
                        useFlexGap: b
                    },
                    ref: a,
                    className: (0, n.c)(T.root, v)
                }, S, {
                    children: f ? (d = r.Children.toArray(C).filter(Boolean)).reduce((e, o, t) => (e.push(o), t < d.length - 1 && e.push(r.cloneElement(f, {
                        key: "separator-".concat(t)
                    })), e), []) : C
                }))
            })
        }({
            createStyledComponent: (0, n.s)("div", {
                name: "MuiStack",
                slot: "Root",
                overridesResolver: (e, o) => o.root
            }),
            useThemeProps: e => (0, s.u)({
                props: e,
                name: "MuiStack"
            })
        });

    function v(e) {
        return (0, o.g)("MuiFormControlLabel", e)
    }
    var b = (0, a.g)("MuiFormControlLabel", ["root", "labelPlacementStart", "labelPlacementTop", "labelPlacementBottom", "disabled", "label", "error", "required", "asterisk"]);
    let S = ["checked", "className", "componentsProps", "control", "disabled", "disableTypography", "inputRef", "label", "labelPlacement", "name", "onChange", "required", "slotProps", "value"],
        T = (0, n.s)("label", {
            name: "MuiFormControlLabel",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [{
                    ["& .".concat(b.label)]: t.label
                }, t.root, t["labelPlacement".concat((0, o.a)(r.labelPlacement))]]
            }
        })(e => {
            let {
                theme: o,
                ownerState: r
            } = e;
            return (0, t._)({
                display: "inline-flex",
                alignItems: "center",
                cursor: "pointer",
                verticalAlign: "middle",
                WebkitTapHighlightColor: "transparent",
                marginLeft: -11,
                marginRight: 16,
                ["&.".concat(b.disabled)]: {
                    cursor: "default"
                }
            }, "start" === r.labelPlacement && {
                flexDirection: "row-reverse",
                marginLeft: 16,
                marginRight: -11
            }, "top" === r.labelPlacement && {
                flexDirection: "column-reverse",
                marginLeft: 16
            }, "bottom" === r.labelPlacement && {
                flexDirection: "column",
                marginLeft: 16
            }, {
                ["& .".concat(b.label)]: {
                    ["&.".concat(b.disabled)]: {
                        color: (o.vars || o).palette.text.disabled
                    }
                }
            })
        }),
        y = (0, n.s)("span", {
            name: "MuiFormControlLabel",
            slot: "Asterisk",
            overridesResolver: (e, o) => o.asterisk
        })(e => {
            let {
                theme: o
            } = e;
            return {
                ["&.".concat(b.error)]: {
                    color: (o.vars || o).palette.error.main
                }
            }
        }),
        x = r.forwardRef(function(e, a) {
            var u, m;
            let k = (0, s.u)({
                    props: e,
                    name: "MuiFormControlLabel"
                }),
                {
                    className: p,
                    componentsProps: g = {},
                    control: h,
                    disabled: f,
                    disableTypography: b,
                    label: x,
                    labelPlacement: D = "end",
                    required: B,
                    slotProps: L = {}
                } = k,
                F = (0, o._)(k, S),
                _ = (0, c.u)(),
                M = null != (u = null != f ? f : h.props.disabled) ? u : null == _ ? void 0 : _.disabled,
                A = null != B ? B : h.props.required,
                E = {
                    disabled: M,
                    required: A
                };
            ["checked", "name", "onChange", "value", "inputRef"].forEach(e => {
                void 0 === h.props[e] && void 0 !== k[e] && (E[e] = k[e])
            });
            let w = (0, l.f)({
                    props: k,
                    muiFormControl: _,
                    states: ["error"]
                }),
                R = (0, t._)({}, k, {
                    disabled: M,
                    labelPlacement: D,
                    required: A,
                    error: w.error
                }),
                j = (e => {
                    let {
                        classes: t,
                        disabled: r,
                        labelPlacement: a,
                        error: l,
                        required: i
                    } = e, s = {
                        root: ["root", r && "disabled", "labelPlacement".concat((0, o.a)(a)), l && "error", i && "required"],
                        label: ["label", r && "disabled"],
                        asterisk: ["asterisk", l && "error"]
                    };
                    return (0, n.a)(s, v, t)
                })(R),
                O = null != (m = L.typography) ? m : g.typography,
                P = x;
            return null == P || P.type === d.T || b || (P = (0, i.jsx)(d.T, (0, t._)({
                component: "span"
            }, O, {
                className: (0, n.c)(j.label, null == O ? void 0 : O.className),
                children: P
            }))), (0, i.jsxs)(T, (0, t._)({
                className: (0, n.c)(j.root, p),
                ownerState: R,
                ref: a
            }, F, {
                children: [r.cloneElement(h, E), A ? (0, i.jsxs)(C, {
                    display: "block",
                    children: [P, (0, i.jsxs)(y, {
                        ownerState: R,
                        "aria-hidden": !0,
                        className: j.asterisk,
                        children: [" ", "*"]
                    })]
                }) : P]
            }))
        });
    e.s(["FormControlLabel", 0, x], 348148)
}, 547352, e => {
    "use strict";
    var o = e.i(945146),
        t = e.i(690569),
        r = e.i(196189);
    let n = ["ownerState"],
        a = ["variants"],
        l = ["name", "slot", "skipVariantsResolver", "skipSx", "overridesResolver"];

    function i(e) {
        return "ownerState" !== e && "theme" !== e && "sx" !== e && "as" !== e
    }

    function s(e, o) {
        return o && e && "object" == typeof e && e.styles && !e.styles.startsWith("@layer") && (e.styles = "@layer ".concat(o, "{").concat(String(e.styles), "}")), e
    }
    let c = (0, t.c)();

    function d(e) {
        let {
            defaultTheme: o,
            theme: t,
            themeId: r
        } = e;
        return 0 === Object.keys(t).length ? o : t[r] || t
    }

    function u(e, l, i) {
        let {
            ownerState: c
        } = l, d = (0, t._)(l, n), m = "function" == typeof e ? e((0, o._)({
            ownerState: c
        }, d)) : e;
        if (Array.isArray(m)) return m.flatMap(e => u(e, (0, o._)({
            ownerState: c
        }, d), i));
        if (m && "object" == typeof m && Array.isArray(m.variants)) {
            let {
                variants: e = []
            } = m, n = (0, t._)(m, a);
            return e.forEach(e => {
                let t = !0;
                if ("function" == typeof e.props ? t = e.props((0, o._)({
                        ownerState: c
                    }, d, c)) : Object.keys(e.props).forEach(o => {
                        (null == c ? void 0 : c[o]) !== e.props[o] && d[o] !== e.props[o] && (t = !1)
                    }), t) {
                    Array.isArray(n) || (n = [n]);
                    let t = "function" == typeof e.style ? e.style((0, o._)({
                        ownerState: c
                    }, d, c)) : e.style;
                    n.push(i ? s((0, r.a)(t), i) : t)
                }
            }), n
        }
        return i ? s((0, r.a)(m), i) : m
    }
    e.s(["c", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            {
                themeId: n,
                defaultTheme: a = c,
                rootShouldForwardProp: s = i,
                slotShouldForwardProp: m = i
            } = e,
            k = e => (0, t.s)((0, o._)({}, e, {
                theme: d((0, o._)({}, e, {
                    defaultTheme: a,
                    themeId: n
                }))
            }));
        return k.__mui_systemSx = !0,
            function(e) {
                var c;
                let p, g = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                (0, r.i)(e, e => e.filter(e => !(null != e && e.__mui_systemSx)));
                let {
                    name: h,
                    slot: f,
                    skipVariantsResolver: C,
                    skipSx: v,
                    overridesResolver: b = (c = f ? f.charAt(0).toLowerCase() + f.slice(1) : f) ? (e, o) => o[c] : null
                } = g, S = (0, t._)(g, l), T = h && h.startsWith("Mui") || f ? "components" : "custom", y = void 0 !== C ? C : f && "Root" !== f && "root" !== f || !1, x = v || !1, D = i;
                "Root" === f || "root" === f ? D = s : f ? D = m : "string" == typeof e && e.charCodeAt(0) > 96 && (D = void 0);
                let B = (0, r.s)(e, (0, o._)({
                        shouldForwardProp: D,
                        label: p
                    }, S)),
                    L = e => "function" == typeof e && e.__emotion_real !== e || (0, t.i)(e) ? t => {
                        let r = d({
                            theme: t.theme,
                            defaultTheme: a,
                            themeId: n
                        });
                        return u(e, (0, o._)({}, t, {
                            theme: r
                        }), r.modularCssLayers ? T : void 0)
                    } : e,
                    F = function(t) {
                        for (var r = arguments.length, l = Array(r > 1 ? r - 1 : 0), i = 1; i < r; i++) l[i - 1] = arguments[i];
                        let s = L(t),
                            c = l ? l.map(L) : [];
                        h && b && c.push(e => {
                            let t = d((0, o._)({}, e, {
                                defaultTheme: a,
                                themeId: n
                            }));
                            if (!t.components || !t.components[h] || !t.components[h].styleOverrides) return null;
                            let r = t.components[h].styleOverrides,
                                l = {};
                            return Object.entries(r).forEach(r => {
                                let [n, a] = r;
                                l[n] = u(a, (0, o._)({}, e, {
                                    theme: t
                                }), t.modularCssLayers ? "theme" : void 0)
                            }), b(e, l)
                        }), h && !y && c.push(e => {
                            var t;
                            let r = d((0, o._)({}, e, {
                                defaultTheme: a,
                                themeId: n
                            }));
                            return u({
                                variants: null == r || null == (t = r.components) || null == (t = t[h]) ? void 0 : t.variants
                            }, (0, o._)({}, e, {
                                theme: r
                            }), r.modularCssLayers ? "theme" : void 0)
                        }), x || c.push(k);
                        let m = c.length - l.length;
                        if (Array.isArray(t) && m > 0) {
                            let e = Array(m).fill("");
                            (s = [...t, ...e]).raw = [...t.raw, ...e]
                        }
                        let p = B(s, ...c);
                        return e.muiName && (p.muiName = e.muiName), p
                    };
                return B.withConfig && (F.withConfig = B.withConfig), F
            }
    }, "s", 0, i])
}, 586926, e => {
    "use strict";
    var o = (0, e.i(547352).c)();
    e.s(["s", 0, o])
}, 406952, e => {
    "use strict";
    var o, t, r = e.i(416340),
        n = e.i(194250),
        a = e.i(779401);

    function l() {
        for (var e = [], o = 0; o < arguments.length; o++) e[o] = arguments[o];
        return ["".concat(e[0], "px ").concat(e[1], "px ").concat(e[2], "px ").concat(e[3], "px rgba(0, 0, 0, ").concat(.2, ")"), "".concat(e[4], "px ").concat(e[5], "px ").concat(e[6], "px ").concat(e[7], "px rgba(0, 0, 0, ").concat(.14, ")"), "".concat(e[8], "px ").concat(e[9], "px ").concat(e[10], "px ").concat(e[11], "px rgba(0, 0, 0, ").concat(.12, ")")].join(",")
    }
    var i = ["none", l(0, 1, 3, 0, 0, 1, 1, 0, 0, 2, 1, -1), l(0, 1, 5, 0, 0, 2, 2, 0, 0, 3, 1, -2), l(0, 1, 8, 0, 0, 3, 4, 0, 0, 3, 3, -2), l(0, 2, 4, -1, 0, 4, 5, 0, 0, 1, 10, 0), l(0, 3, 5, -1, 0, 5, 8, 0, 0, 1, 14, 0), l(0, 3, 5, -1, 0, 6, 10, 0, 0, 1, 18, 0), l(0, 4, 5, -2, 0, 7, 10, 1, 0, 2, 16, 1), l(0, 5, 5, -3, 0, 8, 10, 1, 0, 3, 14, 2), l(0, 5, 6, -3, 0, 9, 12, 1, 0, 3, 16, 2), l(0, 6, 6, -3, 0, 10, 14, 1, 0, 4, 18, 3), l(0, 6, 7, -4, 0, 11, 15, 1, 0, 4, 20, 3), l(0, 7, 8, -4, 0, 12, 17, 2, 0, 5, 22, 4), l(0, 7, 8, -4, 0, 13, 19, 2, 0, 5, 24, 4), l(0, 7, 9, -4, 0, 14, 21, 2, 0, 5, 26, 4), l(0, 8, 9, -5, 0, 15, 22, 2, 0, 6, 28, 5), l(0, 8, 10, -5, 0, 16, 24, 2, 0, 6, 30, 5), l(0, 8, 11, -5, 0, 17, 26, 2, 0, 6, 32, 5), l(0, 9, 11, -5, 0, 18, 28, 2, 0, 7, 34, 6), l(0, 9, 12, -6, 0, 19, 29, 2, 0, 7, 36, 6), l(0, 10, 13, -6, 0, 20, 31, 3, 0, 8, 38, 7), l(0, 10, 13, -6, 0, 21, 33, 3, 0, 8, 40, 7), l(0, 10, 14, -6, 0, 22, 35, 3, 0, 8, 42, 7), l(0, 11, 14, -7, 0, 23, 36, 3, 0, 9, 44, 8), l(0, 11, 15, -7, 0, 24, 38, 3, 0, 9, 46, 8)];
    (o = t || (t = {})).BottomLeft = "borderBottomLeftRadius", o.BottomRight = "borderBottomRightRadius", o.TopLeft = "borderTopLeftRadius", o.TopRight = "borderTopRightRadius", o.All = "borderRadius";
    var s = function(e, o) {
            var t;
            return (t = {})[o] = e, t
        },
        c = function(e) {
            return {
                none: s(0, e),
                xsmall: s("4px", e),
                small: s("6px", e),
                medium: s("8px", e),
                large: s("12px", e),
                circle: s("50%", e)
            }
        },
        d = {
            radius: (0, n._)((0, n._)({}, c(t.All)), {
                bottomLeft: c(t.BottomLeft),
                bottomRight: c(t.BottomRight),
                topLeft: c(t.TopLeft),
                topRight: c(t.TopRight)
            })
        },
        u = function(e) {
            return e.split("").map(function(e, o) {
                return e.toUpperCase() === e ? "".concat(0 !== o ? "-" : "").concat(e.toLowerCase()) : e
            }).join("")
        },
        m = function() {
            for (var e = [], o = 0; o < arguments.length; o++) e[o] = arguments[o];
            return e.reduce(function(e, o) {
                return "".concat(e).concat(o)
            }, "")
        },
        k = e.i(734578),
        p = e.i(707571),
        g = "#000000",
        h = "#FFFFFF",
        f = {
            1200: .96,
            1100: .88,
            1e3: .8,
            900: .72,
            800: .64,
            700: .56,
            600: .48,
            500: .4,
            400: .32,
            300: .24,
            250: .2,
            200: .16,
            150: .12,
            125: .1,
            100: .08,
            75: .06,
            50: .04,
            0: 0
        },
        C = function(e) {
            return Object.fromEntries(Object.entries(f).map(function(o) {
                var t = o[0],
                    r = o[1];
                return [t, (0, p.a)(e, r)]
            }))
        },
        v = {
            black: g,
            1200: "#111216",
            1100: "#18191D",
            1e3: "#1F2024",
            900: "#25272C",
            800: "#2B2D33",
            700: "#313339",
            650: "#696A6D",
            600: "#A1A2A5",
            500: "#BBBCBE",
            400: "#D5D5D7",
            300: "#E5E5E6",
            200: "#F2F2F3",
            100: "#F9F9F9",
            white: h
        },
        b = {
            1200: "#270402",
            1100: "#3B0703",
            1e3: "#580A04",
            900: "#881007",
            800: "#B0140C",
            700: "#D5241A",
            600: "#EF2F25",
            500: "#F45B52",
            400: "#F57E75",
            300: "#F89C95",
            200: "#FAB4AF",
            100: "#FCD0CD"
        },
        S = {
            1200: "#291D00",
            1100: "#3D2C00",
            1e3: "#634700",
            900: "#946A00",
            800: "#B28410",
            700: "#D4A121",
            600: "#F3BA2B",
            500: "#F5C73D",
            400: "#F7D469",
            300: "#FADE89",
            200: "#FBE6AD",
            100: "#FDF0CE"
        },
        T = {
            1200: "#022716",
            1100: "#02311B",
            1e3: "#044E2C",
            900: "#036D3D",
            800: "#06844B",
            700: "#0F995B",
            600: "#0FB369",
            500: "#27C473",
            400: "#44DA87",
            300: "#60E6A1",
            200: "#8FEAB7",
            100: "#C3F4DA"
        },
        y = {
            1400: "#00145C",
            1300: "#001B7A",
            1200: "#002299",
            1100: "#0027B8",
            1e3: "#002DD6",
            900: "#0035F5",
            800: "#1446FF",
            700: "#335FFF",
            600: "#528BFF",
            500: "#70A0FF",
            400: "#8FB4FF",
            300: "#ADC9FF",
            200: "#CCDDFF",
            100: "#EBF1FF"
        },
        x = {
            black: C(g),
            white: C(h),
            mutedBlue: {
                dark: C("#333B4C"),
                light: C("#BBC2D1")
            }
        },
        D = "#009E57",
        B = "#CF2017",
        L = "#DEA517",
        F = {
            primary: {
                main: y[800],
                light: y[300],
                dark: y[700],
                contrastText: v[1200]
            },
            statePrimary: {
                containedHoverBackground: "#3C87B3",
                outlinedHoverBackground: "#292D2F",
                outlinedRestingBorder: "#4E768E"
            },
            secondary: {
                main: v[300],
                light: v[100],
                dark: v[500],
                contrastText: (0, p.a)(v.black, .87)
            },
            stateSecondary: {
                containedHoverBackground: "#898989",
                outlinedHoverBackground: (0, p.a)(v[100], .16),
                outlinedRestingBorder: v[600]
            },
            error: {
                main: b[500],
                dark: b[700],
                light: b[300],
                contrastText: v[1200]
            },
            stateError: {
                containedHoverBackground: "#AB2F26",
                outlinedHoverBackground: (0, p.a)("#F44336", .08),
                outlinedRestingBorder: (0, p.a)("#F44336", .5)
            },
            alertError: {
                content: b[300],
                background: b[1100]
            },
            info: {
                main: y[500],
                dark: y[700],
                light: y[300],
                contrastText: v[1200]
            },
            stateInfo: {
                containedHoverBackground: "#0071B3",
                outlinedHoverBackground: (0, p.a)(y[600], .5),
                outlinedRestingBorder: (0, p.a)(y[600], .16)
            },
            alertInfo: {
                content: y[300],
                background: y[1100]
            },
            warning: {
                main: S[500],
                dark: S[700],
                light: S[300],
                contrastText: (0, p.a)(v[1200], .87)
            },
            stateWarning: {
                containedHoverBackground: "#AD8B30",
                outlinedHoverBackground: (0, p.a)(S[600], .5),
                outlinedRestingBorder: (0, p.a)(S[600], .16)
            },
            alertWarning: {
                content: S[300],
                background: S[1100]
            },
            success: {
                main: T[500],
                dark: T[700],
                light: T[300],
                contrastText: v[1200]
            },
            stateSuccess: {
                containedHoverBackground: "#008146",
                outlinedHoverBackground: (0, p.a)(T[500], .5),
                outlinedRestingBorder: (0, p.a)(T[500], .16)
            },
            alertSuccess: {
                content: T[300],
                background: T[1100]
            },
            text: {
                primary: v.white,
                secondary: v[500],
                disabled: v[600]
            },
            action: {
                active: v[100],
                hover: x.white[100],
                selected: x.white[150],
                disabled: v[600],
                disabledBackground: v[800],
                focus: (0, p.a)(v.white, .12)
            },
            background: {
                default: k.l.TokensDark.Color.Surface.Surface_0,
                tooltips: v[700],
                media: v[900],
                snackbar: v[900],
                paper: v[1e3]
            },
            foreground: {
                paper: v[900],
                main: v[700],
                secondary: v[600]
            },
            media: {
                secondaryBackground: v[1e3],
                toolbar: v[800],
                divider: v[700],
                bottomOverlay: "linear-gradient(0deg, rgba(29, 29, 29, 0.6), rgba(29, 29, 29, 0))",
                inlineCodeBackground: v[800],
                topOverlay: "linear-gradient(180deg, rgba(29, 29, 29, 0.6), rgba(29, 29, 29, 0))"
            },
            layout: {
                divider: v.black
            },
            stickyFooter: {
                defaultFill: (0, p.a)(v[1200], .8)
            },
            divider: v[700],
            outlineBorder: v[700],
            standardInputLine: (0, p.a)(v.white, .42),
            backdropOverlay: (0, p.a)(v[1e3], .5),
            activeRating: S[700],
            filledInputBackground: (0, p.a)(v.white, .09)
        },
        _ = {
            primary: {
                main: y[800],
                light: y[500],
                dark: y[700],
                contrastText: v.white
            },
            statePrimary: {
                containedHoverBackground: y[800],
                outlinedHoverBackground: x.mutedBlue.dark[75],
                outlinedRestingBorder: x.black[150]
            },
            secondary: {
                main: v[1200],
                light: v[100],
                dark: v[1200],
                contrastText: v.white
            },
            stateSecondary: {
                containedHoverBackground: v[800],
                outlinedHoverBackground: x.mutedBlue.dark[75],
                outlinedRestingBorder: x.black[150]
            },
            error: {
                main: B,
                dark: B,
                light: B,
                contrastText: v.white
            },
            stateError: {
                containedHoverBackground: b[800],
                outlinedHoverBackground: x.mutedBlue.dark[75],
                outlinedRestingBorder: x.black[150]
            },
            alertError: {
                content: b[1e3],
                background: b[100]
            },
            info: {
                main: y[700],
                light: y[500],
                dark: y[700],
                contrastText: v.white
            },
            stateInfo: {
                containedHoverBackground: y[800],
                outlinedHoverBackground: x.mutedBlue.dark[75],
                outlinedRestingBorder: x.black[150]
            },
            alertInfo: {
                content: y[1e3],
                background: y[100]
            },
            warning: {
                main: L,
                dark: L,
                light: L,
                contrastText: v[1200]
            },
            stateWarning: {
                containedHoverBackground: S[500],
                outlinedHoverBackground: x.mutedBlue.dark[75],
                outlinedRestingBorder: x.black[150]
            },
            alertWarning: {
                content: S[1e3],
                background: S[100]
            },
            success: {
                main: D,
                dark: D,
                light: D,
                contrastText: v[1200]
            },
            stateSuccess: {
                containedHoverBackground: T[500],
                outlinedHoverBackground: x.mutedBlue.dark[75],
                outlinedRestingBorder: x.black[150]
            },
            alertSuccess: {
                content: T[1e3],
                background: T[100]
            },
            text: {
                primary: v[1200],
                secondary: v[700],
                disabled: v[600]
            },
            action: {
                active: v[700],
                hover: x.mutedBlue.dark[75],
                selected: x.mutedBlue.dark[150],
                disabled: v[600],
                disabledBackground: x.mutedBlue.dark[75],
                focus: x.mutedBlue.dark[150]
            },
            background: {
                default: k.l.TokensLight.Color.Surface.Surface_0,
                tooltips: v[300],
                media: v[300],
                snackbar: v.white,
                paper: v.white
            },
            foreground: {
                paper: v.white,
                main: v[200],
                secondary: v[300]
            },
            media: {
                secondaryBackground: v.white,
                toolbar: v[300],
                divider: x.black[150],
                bottomOverlay: "linear-gradient(0deg, rgba(29, 29, 29, 0.6), rgba(29, 29, 29, 0))",
                inlineCodeBackground: v[300],
                topOverlay: "linear-gradient(180deg, rgba(29, 29, 29, 0.6), rgba(29, 29, 29, 0))"
            },
            layout: {
                divider: x.black[150]
            },
            stickyFooter: {
                defaultFill: (0, p.a)("#F9F9F9", .8)
            },
            divider: x.black[150],
            outlineBorder: x.black[150],
            standardInputLine: k.l.TokensLight.Color.Stroke.Default,
            backdropOverlay: x.black[600],
            activeRating: S[600],
            filledInputBackground: x.mutedBlue.dark[100]
        },
        M = {
            active: k.l.TokensDark.Color.System.Neutral,
            disabled: k.l.TokensDark.Color.Extended.Gray.Gray_600,
            dragged: k.l.TokensDark.Color.Shift.Shift_100,
            disabledBackground: k.l.TokensDark.Color.State.Hover,
            focusVisible: k.l.TokensDark.Color.Shift.Shift_300,
            focus: k.l.TokensDark.Color.State.Press,
            selected: k.l.TokensDark.Color.State.Press,
            hover: k.l.TokensDark.Color.State.Hover
        },
        A = {
            outline: k.l.TokensDark.Color.Stroke.Emphasis,
            400: k.l.TokensDark.Color.Shift.Shift_100,
            300: k.l.TokensDark.Color.Surface.Surface_300,
            200: k.l.TokensDark.Color.Surface.Surface_200,
            100: k.l.TokensDark.Color.Surface.Surface_100,
            0: k.l.TokensDark.Color.Surface.Surface_0
        },
        E = {
            primaryBrand: {
                fill: k.l.TokensDark.Color.System.Emphasis,
                containedHoverFocus: k.l.TokensDark.Color.Extended.Blue.Blue_600
            },
            primary: {
                fill: k.l.TokensDark.Color.Content.Default,
                containedHoverFocus: k.l.TokensDark.Color.Content.Emphasis
            },
            secondary: {
                fill: k.l.TokensDark.Color.ActionStandard.Background,
                containedHoverFocus: k.l.TokensDark.Color.Shift.Shift_400
            },
            important: {
                fill: k.l.TokensDark.Color.System.Alert,
                containedHoverFocus: k.l.TokensDark.Color.Extended.Red.Red_700
            },
            notice: {
                fill: k.l.TokensDark.Color.System.Warning,
                containedHoverFocus: k.l.TokensDark.Color.Extended.Yellow.Yellow_300
            },
            active: {
                fill: k.l.TokensDark.Color.System.Success,
                containedHoverFocus: k.l.TokensDark.Color.Extended.Green.Green_400
            }
        },
        w = {
            standard: k.l.TokensDark.Color.Content.Emphasis,
            muted: k.l.TokensDark.Color.Content.Default,
            disabled: k.l.TokensDark.Color.Content.Muted,
            inverse: k.l.TokensDark.Inverse.Content.Emphasis,
            action: k.l.TokensDark.Color.Content.Link,
            static: {
                light: k.l.TokensDark.LightMode.Surface.Surface_0,
                dark: k.l.TokensDark.DarkMode.Surface.Surface_0
            },
            alert: {
                inform: k.l.TokensDark.Color.System.Emphasis,
                important: k.l.TokensDark.Color.System.Alert,
                active: k.l.TokensDark.Color.System.Success,
                notice: k.l.TokensDark.Color.System.Warning
            }
        },
        R = {
            divider: k.l.TokensDark.Color.Stroke.Default,
            input: {
                filled: {
                    enableFill: k.l.TokensDark.Color.Surface.Surface_200,
                    hoverFill: k.l.TokensDark.Color.Surface.Surface_300
                },
                outlined: {
                    enabledBorder: k.l.TokensDark.Color.Stroke.Default,
                    hoverBorder: k.l.TokensDark.Color.Content.Default,
                    focusBorder: k.l.TokensDark.Color.Content.Default,
                    errorBorder: k.l.TokensDark.Color.System.Alert
                }
            },
            alert: {
                importantContent: k.l.TokensDark.DarkMode.Content.Emphasis,
                importantFill: "rgba(223, 40, 31, 0.16)",
                noticeContent: k.l.TokensDark.DarkMode.Content.Emphasis,
                noticeFill: "rgba(242, 186, 42, 0.16)",
                informContent: k.l.TokensDark.DarkMode.Content.Emphasis,
                informFill: "rgba(51, 95, 255, 0.16)",
                activeContent: k.l.TokensDark.DarkMode.Content.Emphasis,
                activeFill: "rgba(57, 197, 130, 0.16)"
            },
            backdrop: {
                fill: k.l.TokensDark.Color.Common.Scrim
            },
            button: {
                disabled: k.l.TokensDark.Color.Content.Muted
            },
            label: {
                warningText: k.l.TokensDark.Color.System.Warning,
                importantContent: b[300],
                importantFill: b[1100],
                noticeContent: S[300],
                noticeFill: S[1100],
                informContent: y[300],
                informFill: y[1100],
                activeContent: T[300],
                activeFill: T[1100]
            },
            rating: {
                enabledBorder: k.l.TokensDark.Color.System.Warning,
                activeFill: k.l.TokensDark.Color.ActionStandard.Foreground
            },
            stickyFooter: {
                fill: k.l.TokensDark.Color.Common.Scrim
            },
            media: {
                fill: k.l.TokensDark.Color.OverMedia.OverMedia_300,
                toolbar: k.l.TokensDark.Color.Common.NavigationBar,
                overlay: k.l.TokensDark.DarkMode.OverMedia.OverMedia_200
            },
            mediaButtons: {
                onMediaLight: {
                    fill: k.l.TokensDark.DarkMode.Common.Shadow,
                    hover: k.l.TokensDark.DarkMode.Common.Scrim,
                    focus: k.l.TokensDark.DarkMode.Common.Scrim
                },
                onMediaDark: {
                    fill: k.l.TokensDark.Color.OverMedia.OverMedia_0,
                    hover: k.l.TokensDark.Color.OverMedia.OverMedia_300,
                    focus: k.l.TokensDark.Color.OverMedia.OverMedia_300
                },
                outlined: {
                    enabledBorder: A.outline,
                    hoverBorder: k.l.TokensDark.Color.Stroke.Emphasis,
                    focusBorder: k.l.TokensDark.Color.Stroke.Emphasis,
                    errorBorder: k.l.TokensDark.Color.System.Alert
                }
            },
            avatar: {
                fill: k.l.TokensDark.Color.Shift.Shift_400
            },
            switch: {
                slideFill: k.l.TokensDark.Inverse.Content.Muted,
                knobFill: k.l.TokensDark.Color.Content.Emphasis,
                disabledKnob: k.l.TokensDark.Inverse.Content.Muted
            },
            inlineCode: {
                asText: {
                    fill: k.l.TokensDark.Color.Shift.Shift_400,
                    color: w.standard
                },
                asLink: {
                    fill: k.l.TokensDark.Color.Shift.Shift_400,
                    color: k.l.TokensDark.Color.Content.Link
                }
            },
            linearProgress: {
                backgroundSecondary: k.l.TokensDark.Inverse.Content.Muted
            }
        },
        j = {
            global: k.l.TokensDark.Color.Common.NavigationBar,
            default: k.l.TokensDark.Color.Common.NavigationBar
        },
        O = (0, n._)({
            mode: "dark",
            common: {
                black: k.l.TokensDark.DarkMode.Surface.Surface_0,
                white: k.l.TokensDark.LightMode.Surface.Surface_0
            },
            actionV2: E,
            content: w,
            states: M,
            surface: A,
            navigation: j,
            components: R
        }, F),
        P = {
            active: k.l.TokensLight.Color.System.Neutral,
            disabled: k.l.TokensLight.Color.Extended.Gray.Gray_200,
            dragged: k.l.TokensLight.Color.Shift.Shift_100,
            disabledBackground: k.l.TokensLight.Color.State.Hover,
            focusVisible: k.l.TokensLight.Color.Shift.Shift_300,
            focus: k.l.TokensLight.Color.State.Press,
            selected: k.l.TokensLight.Color.State.Press,
            hover: k.l.TokensLight.Color.State.Hover
        },
        H = {
            outline: k.l.TokensLight.Color.Stroke.Emphasis,
            400: k.l.TokensLight.Color.Shift.Shift_100,
            300: k.l.TokensLight.Color.Surface.Surface_300,
            200: k.l.TokensLight.Color.Surface.Surface_200,
            100: k.l.TokensLight.Color.Surface.Surface_100,
            0: k.l.TokensLight.Color.Surface.Surface_0
        },
        I = {
            primaryBrand: {
                fill: k.l.TokensLight.Color.System.Emphasis,
                containedHoverFocus: k.l.TokensLight.Color.Extended.Blue.Blue_800
            },
            primary: {
                fill: k.l.TokensLight.Color.Content.Default,
                containedHoverFocus: k.l.TokensLight.Color.Content.Emphasis
            },
            secondary: {
                fill: k.l.TokensLight.Color.ActionStandard.Background,
                containedHoverFocus: k.l.TokensLight.Color.Shift.Shift_400
            },
            important: {
                fill: k.l.TokensLight.Color.System.Alert,
                containedHoverFocus: k.l.TokensLight.Color.Extended.Red.Red_900
            },
            notice: {
                fill: k.l.TokensLight.Color.System.Warning,
                containedHoverFocus: k.l.TokensLight.Color.Extended.Yellow.Yellow_500
            },
            active: {
                fill: k.l.TokensLight.Color.System.Success,
                containedHoverFocus: k.l.TokensLight.Color.Extended.Green.Green_600
            }
        },
        N = {
            standard: k.l.TokensLight.Color.Content.Emphasis,
            muted: k.l.TokensLight.Color.Content.Default,
            disabled: k.l.TokensLight.Color.Content.Muted,
            inverse: k.l.TokensLight.Inverse.Content.Emphasis,
            action: k.l.TokensLight.Color.Content.Link,
            static: {
                light: k.l.TokensLight.LightMode.Surface.Surface_0,
                dark: k.l.TokensLight.DarkMode.Surface.Surface_0
            },
            alert: {
                inform: k.l.TokensLight.Color.System.Emphasis,
                important: k.l.TokensLight.Color.System.Alert,
                active: k.l.TokensLight.Color.System.Success,
                notice: k.l.TokensLight.Color.System.Warning
            }
        },
        W = {
            divider: k.l.TokensLight.Color.Stroke.Default,
            input: {
                filled: {
                    enableFill: k.l.TokensLight.Color.Surface.Surface_200,
                    hoverFill: k.l.TokensLight.Color.Surface.Surface_300
                },
                outlined: {
                    enabledBorder: k.l.TokensLight.Color.Stroke.Default,
                    hoverBorder: k.l.TokensLight.Color.Content.Default,
                    focusBorder: k.l.TokensLight.Color.Content.Default,
                    errorBorder: k.l.TokensLight.Color.System.Alert
                }
            },
            alert: {
                importantContent: k.l.TokensLight.LightMode.Content.Emphasis,
                importantFill: "rgba(223, 40, 31, 0.16)",
                noticeContent: k.l.TokensLight.LightMode.Content.Emphasis,
                noticeFill: "rgba(242, 186, 42, 0.16)",
                informContent: k.l.TokensLight.LightMode.Content.Emphasis,
                informFill: "rgba(51, 95, 255, 0.16)",
                activeContent: k.l.TokensLight.LightMode.Content.Emphasis,
                activeFill: "rgba(57, 197, 130, 0.16)"
            },
            backdrop: {
                fill: k.l.TokensLight.Color.Common.Scrim
            },
            label: {
                warningText: k.l.TokensLight.Color.Extended.Yellow.Yellow_800,
                importantContent: b[1e3],
                importantFill: b[100],
                noticeContent: S[1e3],
                noticeFill: S[100],
                informContent: y[1e3],
                informFill: y[100],
                activeContent: T[1e3],
                activeFill: T[100]
            },
            button: {
                disabled: k.l.TokensLight.Color.Content.Muted
            },
            rating: {
                enabledBorder: k.l.TokensLight.Color.System.Warning,
                activeFill: k.l.TokensLight.Color.ActionStandard.Foreground
            },
            stickyFooter: {
                fill: k.l.TokensLight.Color.Common.Scrim
            },
            media: {
                fill: k.l.TokensLight.Color.OverMedia.OverMedia_300,
                toolbar: k.l.TokensLight.Color.Common.NavigationBar,
                overlay: k.l.TokensLight.DarkMode.OverMedia.OverMedia_200
            },
            mediaButtons: {
                onMediaLight: {
                    fill: k.l.TokensLight.DarkMode.Common.Shadow,
                    hover: k.l.TokensLight.DarkMode.Common.Scrim,
                    focus: k.l.TokensLight.DarkMode.Common.Scrim
                },
                onMediaDark: {
                    fill: k.l.TokensLight.Color.OverMedia.OverMedia_0,
                    hover: k.l.TokensLight.Color.OverMedia.OverMedia_300,
                    focus: k.l.TokensLight.Color.OverMedia.OverMedia_300
                },
                outlined: {
                    enabledBorder: H.outline,
                    hoverBorder: k.l.TokensLight.Color.Stroke.Emphasis,
                    focusBorder: k.l.TokensLight.Color.Stroke.Emphasis,
                    errorBorder: k.l.TokensLight.Color.System.Alert
                }
            },
            avatar: {
                fill: k.l.TokensLight.Color.Shift.Shift_400
            },
            switch: {
                slideFill: k.l.TokensLight.Inverse.Content.Muted,
                knobFill: k.l.TokensLight.Color.Content.Emphasis,
                disabledKnob: k.l.TokensLight.Inverse.Content.Muted
            },
            inlineCode: {
                asText: {
                    fill: k.l.TokensLight.Color.Shift.Shift_400,
                    color: N.standard
                },
                asLink: {
                    fill: k.l.TokensLight.Color.Shift.Shift_400,
                    color: k.l.TokensLight.Color.Content.Link
                }
            },
            linearProgress: {
                backgroundSecondary: k.l.TokensLight.Inverse.Content.Muted
            }
        },
        z = {
            global: k.l.TokensLight.Color.Common.NavigationBar,
            default: k.l.TokensLight.Color.Common.NavigationBar
        },
        V = (0, n._)({
            mode: "light",
            common: {
                black: k.l.TokensLight.DarkMode.Surface.Surface_0,
                white: k.l.TokensLight.LightMode.Surface.Surface_0
            },
            actionV2: I,
            content: N,
            states: P,
            surface: H,
            navigation: z,
            components: W
        }, _),
        G = e.i(690569),
        q = e.i(931622),
        Y = e.i(243746),
        K = function(e, o) {
            var t, r, l, s;
            return {
                typography: a.default,
                palette: e,
                shadows: i,
                elevation: o,
                border: d,
                breakpoints: {
                    values: {
                        xs: 0,
                        sm: 601,
                        md: 1141,
                        lg: 1521,
                        xl: 1921,
                        XSmall: 0,
                        Small: 361,
                        Medium: 601,
                        Large: 1141,
                        XLarge: 1521,
                        XXLarge: 1921
                    }
                },
                components: {
                    MuiSvgIcon: {
                        variants: [{
                            props: {
                                fontSize: "large"
                            },
                            style: {
                                fontSize: 24
                            }
                        }, {
                            props: {
                                fontSize: "medium"
                            },
                            style: {
                                fontSize: 20
                            }
                        }, {
                            props: {
                                fontSize: "small"
                            },
                            style: {
                                fontSize: 16
                            }
                        }]
                    },
                    MuiCssBaseline: {
                        styleOverrides: m(a.fontFaces.reduce(function(e, o) {
                            return "".concat(e, "@font-face {\n    ").concat(Object.keys(o).map(function(e) {
                                return "".concat(u(e), ": ").concat(o[e], ";")
                            }).join("\n"), "\n}\n")
                        }, ""), (s = a.default.body2, "body {\n  ".concat(Object.keys(s).map(function(e) {
                            return "".concat(u(e), ": ").concat(s[e], ";")
                        }).join("\n"), "\n}\n")))
                    },
                    MuiMenuItem: {
                        styleOverrides: {
                            root: ((t = {})["&.".concat(q.m.selected)] = ((r = {
                                backgroundColor: e.action.selected
                            })["&.".concat(q.m.focusVisible)] = {
                                backgroundColor: e.action.selected
                            }, r["&:hover"] = {
                                backgroundColor: e.action.selected
                            }, r), t)
                        }
                    },
                    MuiPopper: {
                        defaultProps: {
                            sx: (0, n._)({}, d.radius.large)
                        }
                    },
                    MuiPaper: {
                        styleOverrides: {
                            root: ((l = {
                                "&.MuiPickersPopper-paper": (0, n._)({}, d.radius.large)
                            })["&.".concat(Y.p.elevation)] = {
                                backgroundImage: "none"
                            }, l)
                        }
                    }
                }
            }
        },
        U = (0, G.f)(K(O, {
            outlined: "0px 0px 0px 1px rgba(187, 194, 209, 0.12)",
            subtle: "0px 1px 4px 0px rgba(0, 0, 0, 0.24), 0px 1px 1px 0px rgba(0, 0, 0, 0.16)",
            overlay: "0px 6px 20px 0px rgba(0, 0, 0, 0.16), 0px 4px 16px 0px rgba(0, 0, 0, 0.12)"
        })),
        X = (0, G.f)(K(V, {
            outlined: "0px 0px 0px 1px rgba(255, 255, 255, 0.10)",
            subtle: "0px 1px 4px 0px rgba(0, 0, 0, 0.12), 0px 1px 1px 0px rgba(0, 0, 0, 0.12)",
            overlay: "0px 6px 20px 0px rgba(0, 0, 0, 0.08), 0px 4px 16px 0px rgba(0, 0, 0, 0.04)"
        })),
        Z = {},
        J = e.i(546995),
        Q = e.i(945146),
        $ = e.i(221628),
        ee = e.i(121880),
        eo = e.i(662701),
        et = e.i(170199),
        er = e.i(245528),
        en = e.i(977987),
        ea = e.i(236365),
        el = e.i(230505);
    e.i(734994);
    var ei = e.i(141121);
    let es = r.createContext(null);

    function ec() {
        return r.useContext(es)
    }
    var ed = "function" == typeof Symbol && Symbol.for ? Symbol.for("mui.nested") : "__THEME_NESTED__";

    function eu(e) {
        let {
            children: o,
            theme: t
        } = e, n = ec(), a = r.useMemo(() => {
            let e = null === n ? t : "function" == typeof t ? t(n) : (0, Q._)({}, n, t);
            return null != e && (e[ed] = null !== n), e
        }, [t, n]);
        return (0, $.jsx)(es.Provider, {
            value: a,
            children: o
        })
    }
    let em = {};

    function ek(e, o, t) {
        let n = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
        return r.useMemo(() => {
            let r = e && o[e] || o;
            if ("function" == typeof t) {
                let a = t(r),
                    l = e ? (0, Q._)({}, o, {
                        [e]: a
                    }) : a;
                return n ? () => l : l
            }
            return (0, Q._)({}, o, e ? {
                [e]: t
            } : t)
        }, [e, o, t, n])
    }

    function ep(e) {
        let {
            children: o,
            theme: t,
            themeId: r
        } = e, n = (0, er.u)(em), a = ec() || em, l = ek(r, n, t), i = ek(r, a, t, !0), s = "rtl" === l.direction, c = function(e) {
            let o = (0, er.u)(),
                t = (0, ea.u)() || "",
                {
                    modularCssLayers: r
                } = e,
                n = "mui.global, mui.components, mui.theme, mui.custom, mui.sx";
            return n = r && null === o ? "string" == typeof r ? r.replace(/mui(?!\.)/g, n) : "@layer ".concat(n, ";") : "", (0, el.u)(() => {
                var e, o;
                let r = document.querySelector("head");
                if (!r) return;
                let a = r.firstChild;
                if (n) {
                    if (a && null != (e = a.hasAttribute) && e.call(a, "data-mui-layer-order") && a.getAttribute("data-mui-layer-order") === t) return;
                    let o = document.createElement("style");
                    o.setAttribute("data-mui-layer-order", t), o.textContent = n, r.prepend(o)
                } else null == (o = r.querySelector('style[data-mui-layer-order="'.concat(t, '"]'))) || o.remove()
            }, [n, t]), n ? (0, $.jsx)(eo.a, {
                styles: n
            }) : null
        }(l);
        return (0, $.jsx)(eu, {
            theme: i,
            children: (0, $.jsx)(ei.ThemeContext.Provider, {
                value: l,
                children: (0, $.jsx)(en.R, {
                    value: s,
                    children: (0, $.jsxs)(ee.D, {
                        value: null == l ? void 0 : l.components,
                        children: [c, o]
                    })
                })
            })
        })
    }
    let eg = ["theme"];

    function eh(e) {
        let {
            theme: o
        } = e, t = (0, G._)(e, eg), r = o[et.T], n = r || o;
        return "function" != typeof o && (r && !r.vars ? n = (0, Q._)({}, r, {
            vars: null
        }) : o && !o.vars && (n = (0, Q._)({}, o, {
            vars: null
        }))), (0, $.jsx)(ep, (0, Q._)({}, t, {
            themeId: r ? et.T : void 0,
            theme: n
        }))
    }
    let ef = function(e) {
        var o;
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            r = {};
        t && e.colorSchemes && Object.entries(e.colorSchemes).forEach(o => {
            var t;
            let [n, a] = o;
            r[e.getColorSchemeSelector(n).replace(/\s*&/, "")] = {
                colorScheme: null == (t = a.palette) ? void 0 : t.mode
            }
        });
        let n = (0, Q._)({
                html: (0, Q._)({
                    WebkitFontSmoothing: "antialiased",
                    MozOsxFontSmoothing: "grayscale",
                    boxSizing: "border-box",
                    WebkitTextSizeAdjust: "100%"
                }, t && !e.vars && {
                    colorScheme: e.palette.mode
                }),
                "*, *::before, *::after": {
                    boxSizing: "inherit"
                },
                "strong, b": {
                    fontWeight: e.typography.fontWeightBold
                },
                body: (0, Q._)({
                    margin: 0
                }, (0, Q._)({
                    color: (e.vars || e).palette.text.primary
                }, e.typography.body1, {
                    backgroundColor: (e.vars || e).palette.background.default,
                    "@media print": {
                        backgroundColor: (e.vars || e).palette.common.white
                    }
                }), {
                    "&::backdrop": {
                        backgroundColor: (e.vars || e).palette.background.default
                    }
                })
            }, r),
            a = null == (o = e.components) || null == (o = o.MuiCssBaseline) ? void 0 : o.styleOverrides;
        return a && (n = [n, a]), n
    };

    function eC(e) {
        let {
            children: o,
            enableColorScheme: t = !1
        } = (0, ee.u)({
            props: e,
            name: "MuiCssBaseline"
        });
        return (0, $.jsxs)(r.Fragment, {
            children: [(0, $.jsx)(eo.G, {
                styles: e => ef(e, t)
            }), o]
        })
    }
    e.s(["UIThemeProvider", 0, function(e) {
        var o, t = e.theme,
            n = void 0 === t ? "dark" : t,
            a = e.cssBaselineMode,
            l = e.children;
        switch (n) {
            case "dark":
                o = U;
                break;
            case "light":
                o = X;
                break;
            default:
                o = Z[n] || U
        }
        var i = null;
        switch (void 0 === a ? "enabled" : a) {
            case "enabled":
                i = r.default.createElement(eC, {
                    enableColorScheme: !0
                });
                break;
            case "client-only":
                i = r.default.createElement(J.N, null, r.default.createElement(eC, {
                    enableColorScheme: !0
                }))
        }
        return r.default.createElement(eh, {
            theme: o
        }, i, l)
    }], 406952)
}]);

//# debugId=0f77a0bc-5a6e-0891-d191-be1d3c560d3f
//# sourceMappingURL=12-tvma-h18t7.js.map
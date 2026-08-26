;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "77c8bcfe-9145-a15d-0b8e-038634b65dfe")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 725085, e => {
    "use strict";
    var t = e.i(865800),
        r = e.i(416340),
        n = e.i(614515),
        a = e.i(993807),
        o = e.i(962560),
        i = e.i(273589),
        l = e.i(42569),
        s = e.i(696180),
        c = e.i(221628),
        u = e.i(719409),
        d = e.i(963320);

    function f(e) {
        return (0, i.g)("MuiCard", e)
    }
    e.i(485511), (0, s.g)("MuiCard", ["root"]);
    let p = ["className", "raised"],
        m = (0, l.s)(u.M, {
            name: "MuiCard",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })(() => ({
            overflow: "hidden"
        })),
        h = r.forwardRef(function(e, t) {
            let r = (0, d.u)({
                    props: e,
                    name: "MuiCard"
                }),
                {
                    className: n,
                    raised: a = !1
                } = r,
                s = (0, i._)(r, p),
                u = (0, o._)({}, r, {
                    raised: a
                }),
                h = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, l.a)({
                        root: ["root"]
                    }, f, t)
                })(u);
            return (0, c.jsx)(m, (0, o._)({
                className: (0, l.c)(h.root, n),
                elevation: a ? 8 : void 0,
                ref: t,
                ownerState: u
            }, s))
        });
    var y = (0, n.default)({
            name: "Card"
        })(function(e, r) {
            var n = r.variant;
            return {
                root: (0, t._)({
                    boxShadow: "none",
                    overflow: "hidden",
                    WebkitMaskImage: "-webkit-radial-gradient(white, black)",
                    backgroundColor: "outlined" === n ? "transparent" : e.palette.surface[200],
                    position: "relative"
                }, e.border.radius.large)
            }
        }),
        g = (0, r.forwardRef)(function(e, n) {
            var o = e.children,
                i = e.classes,
                l = e.variant,
                s = e.className,
                c = (0, t.a)(e, ["children", "classes", "variant", "className"]),
                u = y((0, t._)((0, t._)({}, c), {
                    variant: l
                }), {
                    props: {
                        classes: (0, a.default)(i, s)
                    }
                });
            return r.default.createElement(h, (0, t._)({}, c, {
                variant: "outlined" === l ? "outlined" : "elevation",
                classes: u.classes,
                ref: n
            }), o)
        });
    e.s(["C", 0, g])
}, 802737, e => {
    "use strict";
    var t = e.i(725085);
    e.s(["Card", () => t.C])
}, 464782, 81751, e => {
    "use strict";
    var t = e.i(221628),
        r = (0, e.i(751498).c)((0, t.jsx)("path", {
            d: "M9 16.17 4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"
        }), "Check");
    e.s(["C", 0, r], 81751), e.s(["CheckIcon", 0, r], 464782)
}, 938780, e => {
    "use strict";
    var t = e.i(273589),
        r = e.i(962560),
        n = e.i(416340),
        a = e.i(42569),
        o = e.i(576881),
        i = e.i(751498),
        l = e.i(221628),
        s = e.i(112896),
        c = e.i(963320);
    e.i(197094);
    var u = (0, i.c)((0, l.jsx)("path", {
            d: "M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"
        }), "CheckBoxOutlineBlank"),
        d = (0, i.c)((0, l.jsx)("path", {
            d: "M19 3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.11 0 2-.9 2-2V5c0-1.1-.89-2-2-2zm-9 14l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"
        }), "CheckBox"),
        f = (0, i.c)((0, l.jsx)("path", {
            d: "M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-2 10H7v-2h10v2z"
        }), "IndeterminateCheckBox");
    let p = ["checkedIcon", "color", "icon", "indeterminate", "indeterminateIcon", "inputProps", "size", "className"],
        m = (0, a.s)(o.S, {
            shouldForwardProp: e => (0, a.r)(e) || "classes" === e,
            name: "MuiCheckbox",
            slot: "Root",
            overridesResolver: (e, r) => {
                let {
                    ownerState: n
                } = e;
                return [r.root, n.indeterminate && r.indeterminate, r["size".concat((0, t.a)(n.size))], "default" !== n.color && r["color".concat((0, t.a)(n.color))]]
            }
        })(e => {
            let {
                theme: n,
                ownerState: a
            } = e;
            return (0, r._)({
                color: (n.vars || n).palette.text.secondary
            }, !a.disableRipple && {
                "&:hover": {
                    backgroundColor: n.vars ? "rgba(".concat("default" === a.color ? n.vars.palette.action.activeChannel : n.vars.palette[a.color].mainChannel, " / ").concat(n.vars.palette.action.hoverOpacity, ")") : (0, t.b)("default" === a.color ? n.palette.action.active : n.palette[a.color].main, n.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== a.color && {
                ["&.".concat(s.c.checked, ", &.").concat(s.c.indeterminate)]: {
                    color: (n.vars || n).palette[a.color].main
                },
                ["&.".concat(s.c.disabled)]: {
                    color: (n.vars || n).palette.action.disabled
                }
            })
        }),
        h = (0, l.jsx)(d, {}),
        y = (0, l.jsx)(u, {}),
        g = (0, l.jsx)(f, {}),
        b = n.forwardRef(function(e, o) {
            var i, u;
            let d = (0, c.u)({
                    props: e,
                    name: "MuiCheckbox"
                }),
                {
                    checkedIcon: f = h,
                    color: b = "primary",
                    icon: v = y,
                    indeterminate: _ = !1,
                    indeterminateIcon: S = g,
                    inputProps: R,
                    size: x = "medium",
                    className: w
                } = d,
                O = (0, t._)(d, p),
                E = _ ? S : v,
                P = _ ? S : f,
                C = (0, r._)({}, d, {
                    color: b,
                    indeterminate: _,
                    size: x
                }),
                T = (e => {
                    let {
                        classes: n,
                        indeterminate: o,
                        color: i,
                        size: l
                    } = e, c = {
                        root: ["root", o && "indeterminate", "color".concat((0, t.a)(i)), "size".concat((0, t.a)(l))]
                    }, u = (0, a.a)(c, s.g, n);
                    return (0, r._)({}, n, u)
                })(C);
            return (0, l.jsx)(m, (0, r._)({
                type: "checkbox",
                inputProps: (0, r._)({
                    "data-indeterminate": _
                }, R),
                icon: n.cloneElement(E, {
                    fontSize: null != (i = E.props.fontSize) ? i : x
                }),
                checkedIcon: n.cloneElement(P, {
                    fontSize: null != (u = P.props.fontSize) ? u : x
                }),
                ownerState: C,
                ref: o,
                className: (0, a.c)(T.root, w)
            }, O, {
                classes: T
            }))
        });
    e.s(["M", 0, b])
}, 382058, e => {
    "use strict";
    var t = e.i(480160);
    e.s(["List", () => t.L])
}, 576881, e => {
    "use strict";
    var t = e.i(273589),
        r = e.i(962560),
        n = e.i(416340),
        a = e.i(42569),
        o = e.i(155607),
        i = e.i(696180),
        l = e.i(221628),
        s = e.i(232625),
        c = e.i(640878);

    function u(e) {
        return (0, t.g)("PrivateSwitchBase", e)
    }
    e.i(197094), (0, i.g)("PrivateSwitchBase", ["root", "checked", "disabled", "input", "edgeStart", "edgeEnd"]);
    let d = ["autoFocus", "checked", "checkedIcon", "className", "defaultChecked", "disabled", "disableFocusRipple", "edge", "icon", "id", "inputProps", "inputRef", "name", "onBlur", "onChange", "onFocus", "readOnly", "required", "tabIndex", "type", "value"],
        f = (0, a.s)(s.B, {
            name: "MuiSwitchBase"
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, r._)({
                padding: 9,
                borderRadius: "50%"
            }, "start" === t.edge && {
                marginLeft: "small" === t.size ? -3 : -12
            }, "end" === t.edge && {
                marginRight: "small" === t.size ? -3 : -12
            })
        }),
        p = (0, a.s)("input", {
            name: "MuiSwitchBase",
            shouldForwardProp: a.r
        })({
            cursor: "inherit",
            position: "absolute",
            opacity: 0,
            width: "100%",
            height: "100%",
            top: 0,
            left: 0,
            margin: 0,
            padding: 0,
            zIndex: 1
        }),
        m = n.forwardRef(function(e, n) {
            let {
                autoFocus: i,
                checked: s,
                checkedIcon: m,
                className: h,
                defaultChecked: y,
                disabled: g,
                disableFocusRipple: b = !1,
                edge: v = !1,
                icon: _,
                id: S,
                inputProps: R,
                inputRef: x,
                name: w,
                onBlur: O,
                onChange: E,
                onFocus: P,
                readOnly: C,
                required: T = !1,
                tabIndex: M,
                type: j,
                value: k
            } = e, L = (0, t._)(e, d), [I, z] = (0, c.u)({
                controlled: s,
                default: !!y,
                name: "SwitchBase",
                state: "checked"
            }), F = (0, o.u)(), A = g;
            F && void 0 === A && (A = F.disabled);
            let N = "checkbox" === j || "radio" === j,
                B = (0, r._)({}, e, {
                    checked: I,
                    disabled: A,
                    disableFocusRipple: b,
                    edge: v
                }),
                H = (e => {
                    let {
                        classes: r,
                        checked: n,
                        disabled: o,
                        edge: i
                    } = e, l = {
                        root: ["root", n && "checked", o && "disabled", i && "edge".concat((0, t.a)(i))],
                        input: ["input"]
                    };
                    return (0, a.a)(l, u, r)
                })(B);
            return (0, l.jsxs)(f, (0, r._)({
                component: "span",
                className: (0, a.c)(H.root, h),
                centerRipple: !0,
                focusRipple: !b,
                disabled: A,
                tabIndex: null,
                role: void 0,
                onFocus: e => {
                    P && P(e), F && F.onFocus && F.onFocus(e)
                },
                onBlur: e => {
                    O && O(e), F && F.onBlur && F.onBlur(e)
                },
                ownerState: B,
                ref: n
            }, L, {
                children: [(0, l.jsx)(p, (0, r._)({
                    autoFocus: i,
                    checked: s,
                    defaultChecked: y,
                    className: H.input,
                    disabled: A,
                    id: N ? S : void 0,
                    name: w,
                    onChange: e => {
                        if (e.nativeEvent.defaultPrevented) return;
                        let t = e.target.checked;
                        z(t), E && E(e, t)
                    },
                    readOnly: C,
                    ref: x,
                    required: T,
                    ownerState: B,
                    tabIndex: M,
                    type: j
                }, "checkbox" === j && void 0 === k ? {} : {
                    value: k
                }, R)), I ? m : _]
            }))
        });
    e.s(["S", 0, m])
}, 373887, e => {
    "use strict";
    var t = e.i(865800),
        r = e.i(416340),
        n = e.i(614515),
        a = e.i(993807),
        o = e.i(470657),
        i = e.i(998331),
        l = e.i(273589),
        s = e.i(962560),
        c = e.i(42569),
        u = e.i(59656),
        d = e.i(221628),
        f = e.i(232625),
        p = e.i(963320),
        m = e.i(969708),
        h = e.i(208958),
        y = e.i(175705);
    let g = ["alignItems", "autoFocus", "component", "children", "dense", "disableGutters", "divider", "focusVisibleClassName", "selected", "className"],
        b = (0, c.s)(f.B, {
            shouldForwardProp: e => (0, c.r)(e) || "classes" === e,
            name: "MuiListItemButton",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.root, r.dense && t.dense, "flex-start" === r.alignItems && t.alignItemsFlexStart, r.divider && t.divider, !r.disableGutters && t.gutters]
            }
        })(e => {
            let {
                theme: t,
                ownerState: r
            } = e;
            return (0, s._)({
                display: "flex",
                flexGrow: 1,
                justifyContent: "flex-start",
                alignItems: "center",
                position: "relative",
                textDecoration: "none",
                minWidth: 0,
                boxSizing: "border-box",
                textAlign: "left",
                paddingTop: 8,
                paddingBottom: 8,
                transition: t.transitions.create("background-color", {
                    duration: t.transitions.duration.shortest
                }),
                "&:hover": {
                    textDecoration: "none",
                    backgroundColor: (t.vars || t).palette.action.hover,
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                },
                ["&.".concat(i.l.selected)]: {
                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette.primary.mainChannel, " / ").concat(t.vars.palette.action.selectedOpacity, ")") : (0, l.b)(t.palette.primary.main, t.palette.action.selectedOpacity),
                    ["&.".concat(i.l.focusVisible)]: {
                        backgroundColor: t.vars ? "rgba(".concat(t.vars.palette.primary.mainChannel, " / calc(").concat(t.vars.palette.action.selectedOpacity, " + ").concat(t.vars.palette.action.focusOpacity, "))") : (0, l.b)(t.palette.primary.main, t.palette.action.selectedOpacity + t.palette.action.focusOpacity)
                    }
                },
                ["&.".concat(i.l.selected, ":hover")]: {
                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette.primary.mainChannel, " / calc(").concat(t.vars.palette.action.selectedOpacity, " + ").concat(t.vars.palette.action.hoverOpacity, "))") : (0, l.b)(t.palette.primary.main, t.palette.action.selectedOpacity + t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: t.vars ? "rgba(".concat(t.vars.palette.primary.mainChannel, " / ").concat(t.vars.palette.action.selectedOpacity, ")") : (0, l.b)(t.palette.primary.main, t.palette.action.selectedOpacity)
                    }
                },
                ["&.".concat(i.l.focusVisible)]: {
                    backgroundColor: (t.vars || t).palette.action.focus
                },
                ["&.".concat(i.l.disabled)]: {
                    opacity: (t.vars || t).palette.action.disabledOpacity
                }
            }, r.divider && {
                borderBottom: "1px solid ".concat((t.vars || t).palette.divider),
                backgroundClip: "padding-box"
            }, "flex-start" === r.alignItems && {
                alignItems: "flex-start"
            }, !r.disableGutters && {
                paddingLeft: 16,
                paddingRight: 16
            }, r.dense && {
                paddingTop: 4,
                paddingBottom: 4
            })
        }),
        v = r.forwardRef(function(e, t) {
            let n = (0, p.u)({
                    props: e,
                    name: "MuiListItemButton"
                }),
                {
                    alignItems: a = "center",
                    autoFocus: o = !1,
                    component: f = "div",
                    children: y,
                    dense: v = !1,
                    disableGutters: _ = !1,
                    divider: S = !1,
                    focusVisibleClassName: R,
                    selected: x = !1,
                    className: w
                } = n,
                O = (0, l._)(n, g),
                E = r.useContext(u.L),
                P = r.useMemo(() => ({
                    dense: v || E.dense || !1,
                    alignItems: a,
                    disableGutters: _
                }), [a, E.dense, v, _]),
                C = r.useRef(null);
            (0, m.u)(() => {
                o && C.current && C.current.focus()
            }, [o]);
            let T = (0, s._)({}, n, {
                    alignItems: a,
                    dense: P.dense,
                    disableGutters: _,
                    divider: S,
                    selected: x
                }),
                M = (e => {
                    let {
                        alignItems: t,
                        classes: r,
                        dense: n,
                        disabled: a,
                        disableGutters: o,
                        divider: l,
                        selected: u
                    } = e, d = (0, c.a)({
                        root: ["root", n && "dense", !o && "gutters", l && "divider", a && "disabled", "flex-start" === t && "alignItemsFlexStart", u && "selected"]
                    }, i.g, r);
                    return (0, s._)({}, r, d)
                })(T),
                j = (0, h.u)(C, t);
            return (0, d.jsx)(u.L.Provider, {
                value: P,
                children: (0, d.jsx)(b, (0, s._)({
                    ref: j,
                    href: O.href || O.to,
                    component: (O.href || O.to) && "div" === f ? "button" : f,
                    focusVisibleClassName: (0, c.c)(M.focusVisible, R),
                    ownerState: T,
                    className: (0, c.c)(M.root, w)
                }, O, {
                    classes: M,
                    children: y
                }))
            })
        });
    var _ = (0, n.default)({
            name: "ListItemButton"
        })(function(e) {
            var r, n, a, l;
            return {
                root: (0, t._)((0, t._)({}, e.border.radius.medium), ((r = {})["& .".concat(y.l.primary, ", & .").concat(y.l.secondary, ", & .").concat(o.l.root)] = {
                    color: e.palette.content.muted
                }, r["&:hover"] = ((n = {
                    backgroundColor: e.palette.states.hover
                })["& .".concat(y.l.primary, ", & .").concat(o.l.root)] = {
                    color: e.palette.content.standard
                }, n), r["&.".concat(i.l.selected, ", &.").concat(i.l.selected, ":hover")] = ((a = {
                    backgroundColor: e.palette.action.selected
                })["& .".concat(y.l.primary)] = {
                    fontWeight: e.typography.fontWeightMedium
                }, a["& .".concat(y.l.primary, ", & .").concat(o.l.root)] = {
                    color: e.palette.content.standard
                }, a), r)),
                dense: ((l = {})["& .".concat(y.l.primary, ", & .").concat(y.l.secondary)] = (0, t._)({}, e.typography.body2), l)
            }
        }),
        S = (0, r.forwardRef)(function(e, n) {
            var o = e.classes,
                i = e.className,
                l = (0, t.a)(e, ["classes", "className"]),
                s = _(void 0, {
                    props: {
                        classes: (0, a.default)(o, i)
                    }
                });
            return r.default.createElement(v, (0, t._)({}, l, {
                classes: s.classes,
                ref: n
            }))
        });
    e.s(["default", 0, S])
}, 920518, e => {
    "use strict";
    var t = e.i(373887);
    e.s(["ListItemButton", () => t.default])
}, 584334, e => {
    "use strict";
    var t = e.i(865800),
        r = e.i(416340),
        n = e.i(614515),
        a = e.i(993807),
        o = e.i(273589),
        i = e.i(962560),
        l = e.i(42569),
        s = e.i(59656),
        c = e.i(175705),
        u = e.i(221628),
        d = e.i(963320),
        f = e.i(972455);
    let p = ["children", "className", "disableTypography", "inset", "primary", "primaryTypographyProps", "secondary", "secondaryTypographyProps"],
        m = (0, l.s)("div", {
            name: "MuiListItemText",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [{
                    ["& .".concat(c.l.primary)]: t.primary
                }, {
                    ["& .".concat(c.l.secondary)]: t.secondary
                }, t.root, r.inset && t.inset, r.primary && r.secondary && t.multiline, r.dense && t.dense]
            }
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, i._)({
                flex: "1 1 auto",
                minWidth: 0,
                marginTop: 4,
                marginBottom: 4
            }, t.primary && t.secondary && {
                marginTop: 6,
                marginBottom: 6
            }, t.inset && {
                paddingLeft: 56
            })
        }),
        h = r.forwardRef(function(e, t) {
            let n = (0, d.u)({
                    props: e,
                    name: "MuiListItemText"
                }),
                {
                    children: a,
                    className: h,
                    disableTypography: y = !1,
                    inset: g = !1,
                    primary: b,
                    primaryTypographyProps: v,
                    secondary: _,
                    secondaryTypographyProps: S
                } = n,
                R = (0, o._)(n, p),
                {
                    dense: x
                } = r.useContext(s.L),
                w = null != b ? b : a,
                O = _,
                E = (0, i._)({}, n, {
                    disableTypography: y,
                    inset: g,
                    primary: !!w,
                    secondary: !!O,
                    dense: x
                }),
                P = (e => {
                    let {
                        classes: t,
                        inset: r,
                        primary: n,
                        secondary: a,
                        dense: o
                    } = e;
                    return (0, l.a)({
                        root: ["root", r && "inset", o && "dense", n && a && "multiline"],
                        primary: ["primary"],
                        secondary: ["secondary"]
                    }, c.g, t)
                })(E);
            return null == w || w.type === f.T || y || (w = (0, u.jsx)(f.T, (0, i._)({
                variant: x ? "body2" : "body1",
                className: P.primary,
                component: null != v && v.variant ? void 0 : "span",
                display: "block"
            }, v, {
                children: w
            }))), null == O || O.type === f.T || y || (O = (0, u.jsx)(f.T, (0, i._)({
                variant: "body2",
                className: P.secondary,
                color: "text.secondary",
                display: "block"
            }, S, {
                children: O
            }))), (0, u.jsxs)(m, (0, i._)({
                className: (0, l.c)(P.root, h),
                ownerState: E,
                ref: t
            }, R, {
                children: [w, O]
            }))
        });
    var y = (0, n.default)({
            name: "ListItemText"
        })(function(e) {
            return {
                primary: (0, t._)((0, t._)({}, e.typography.body1), {
                    color: e.palette.content.standard
                }),
                secondary: (0, t._)((0, t._)({}, e.typography.body2), {
                    color: e.palette.content.muted
                })
            }
        }),
        g = (0, r.forwardRef)(function(e, n) {
            var o = e.classes,
                i = e.className,
                l = (0, t.a)(e, ["classes", "className"]),
                s = y(void 0, {
                    props: {
                        classes: (0, a.default)(o, i)
                    }
                });
            return r.default.createElement(h, (0, t._)({}, l, {
                classes: s.classes,
                ref: n
            }))
        });
    e.s(["ListItemText", 0, g], 584334)
}, 998331, e => {
    "use strict";
    var t = e.i(696180),
        r = e.i(273589),
        n = (0, t.g)("MuiListItemButton", ["root", "focusVisible", "dense", "alignItemsFlexStart", "disabled", "divider", "gutters", "selected"]);
    e.s(["g", 0, function(e) {
        return (0, r.g)("MuiListItemButton", e)
    }, "l", 0, n])
}, 916417, e => {
    "use strict";
    var t = e.i(865800),
        r = "https://cdn.foundation.roblox.com/current/fonts/builder-sans/",
        n = "https://cdn.foundation.roblox.com/current/fonts/builder-mono/",
        a = "https://cdn.foundation.roblox.com/current/fonts/builder-extended/",
        o = "'Builder Sans'",
        i = "'Builder Mono'",
        l = [o, "Helvetica", "Arial", "san-serif"].join(", "),
        s = [i, "monospace"].join(", "),
        c = {
            fontFamily: o,
            fontWeight: 400,
            fontStyle: "normal"
        },
        u = {
            fontFamily: o,
            fontWeight: 600,
            fontStyle: "normal"
        },
        d = {
            fontFamily: o,
            fontWeight: 700,
            fontStyle: "normal"
        },
        f = {
            fontFamily: i,
            fontWeight: 400,
            fontStyle: "normal"
        },
        p = "'Builder Extended'",
        m = [p, "Helvetica", "Arial", "san-serif"].join(", "),
        h = {
            fontFamily: p,
            fontWeight: 700,
            fontStyle: "normal"
        },
        y = [(0, t._)((0, t._)({}, c), {
            src: "url(".concat(r, "BuilderSans-Regular.woff2) format('woff2'), url(").concat(r, "BuilderSans-Regular.woff) format('woff')"),
            fontDisplay: "swap"
        }), (0, t._)((0, t._)({}, u), {
            src: "url(".concat(r, "BuilderSans-SemiBold.woff2) format('woff2'), url(").concat(r, "BuilderSans-SemiBold.woff) format('woff')"),
            fontDisplay: "swap"
        }), (0, t._)((0, t._)({}, d), {
            src: "url(".concat(r, "BuilderSans-Bold.woff2) format('woff2'), url(").concat(r, "BuilderSans-Bold.woff) format('woff')"),
            fontDisplay: "swap"
        }), (0, t._)((0, t._)({}, f), {
            src: "url(".concat(n, "BuilderMono-Regular.woff2) format('woff2'), url(").concat(n, "BuilderMono-Regular.woff) format('woff')"),
            fontDisplay: "swap"
        }), (0, t._)((0, t._)({}, h), {
            src: "url(".concat(a, "BuilderExtended-Bold.woff2) format('woff2'), url(").concat(a, "BuilderExtended-Bold.woff) format('woff')"),
            fontDisplay: "swap"
        })],
        g = {
            100: "8px",
            125: "10px",
            150: "12px",
            175: "14px",
            200: "16px",
            250: "20px",
            300: "24px",
            350: "28px",
            400: "32px",
            500: "40px",
            600: "48px",
            700: "56px",
            800: "64px",
            900: "72px",
            1e3: "80px",
            1100: "88px",
            1200: "96px"
        },
        b = {
            Display: {
                Large: (0, t._)((0, t._)({}, d), {
                    fontFamily: l,
                    fontSize: g[1e3],
                    lineHeight: "100%"
                }),
                Medium: (0, t._)((0, t._)({}, d), {
                    fontFamily: l,
                    fontSize: g[800],
                    lineHeight: "100%"
                }),
                Small: (0, t._)((0, t._)({}, d), {
                    fontFamily: l,
                    fontSize: g[500],
                    lineHeight: "120%"
                })
            },
            Heading: {
                Large: (0, t._)((0, t._)({}, d), {
                    fontFamily: l,
                    fontSize: g[350],
                    lineHeight: "130%"
                }),
                Medium: (0, t._)((0, t._)({}, d), {
                    fontFamily: l,
                    fontSize: g[300],
                    lineHeight: "135%"
                }),
                Small: (0, t._)((0, t._)({}, d), {
                    fontFamily: l,
                    fontSize: g[250],
                    lineHeight: "120%"
                })
            },
            Title: {
                Large: (0, t._)((0, t._)({}, d), {
                    fontFamily: l,
                    fontSize: g[200],
                    lineHeight: "140%"
                }),
                Medium: (0, t._)((0, t._)({}, d), {
                    fontFamily: l,
                    fontSize: g[175],
                    lineHeight: "140%"
                }),
                Small: (0, t._)((0, t._)({}, d), {
                    fontFamily: l,
                    fontSize: g[150],
                    lineHeight: "130%"
                })
            },
            Label: {
                ExtraLarge: (0, t._)((0, t._)({}, d), {
                    fontFamily: l,
                    fontSize: g[200],
                    lineHeight: "100%"
                }),
                Large: (0, t._)((0, t._)({}, d), {
                    fontFamily: l,
                    fontSize: g[200],
                    lineHeight: "100%"
                }),
                Medium: (0, t._)((0, t._)({}, d), {
                    fontFamily: l,
                    fontSize: g[175],
                    lineHeight: "100%"
                }),
                Small: (0, t._)((0, t._)({}, d), {
                    fontFamily: l,
                    fontSize: g[150],
                    lineHeight: "100%"
                })
            },
            Body: {
                Large: (0, t._)((0, t._)({}, c), {
                    fontFamily: l,
                    fontSize: g[200],
                    lineHeight: "140%"
                }),
                Medium: (0, t._)((0, t._)({}, c), {
                    fontFamily: l,
                    fontSize: g[175],
                    lineHeight: "140%"
                }),
                Small: (0, t._)((0, t._)({}, c), {
                    fontFamily: l,
                    fontSize: g[150],
                    lineHeight: "130%"
                })
            },
            Caption: {
                Large: (0, t._)((0, t._)({}, u), {
                    fontFamily: l,
                    fontSize: g[150],
                    lineHeight: "130%"
                }),
                Small: (0, t._)((0, t._)({}, u), {
                    fontFamily: l,
                    fontSize: g[125],
                    lineHeight: "140%"
                })
            },
            Hero: {
                Large: (0, t._)((0, t._)({}, h), {
                    fontFamily: m,
                    fontSize: g[800],
                    lineHeight: "120%"
                })
            }
        };

    function v(e, r) {
        return (0, t._)({}, b[e][r])
    }
    var _ = {
            captionHeader: v("Title", "Medium"),
            captionBody: v("Body", "Medium"),
            captionSmall: v("Caption", "Small"),
            footer: v("Body", "Medium"),
            code: (0, t._)((0, t._)({}, f), {
                fontFamily: s,
                fontSize: g[200],
                lineHeight: "140%"
            }),
            codeDense: (0, t._)((0, t._)({}, f), {
                fontFamily: s,
                fontSize: g[175],
                lineHeight: "140%"
            }),
            chip: v("Label", "Medium"),
            largeLabel1: v("Body", "Large"),
            largeLabel2: v("Label", "ExtraLarge"),
            legalDisclaimer: v("Caption", "Large"),
            smallLabel1: v("Body", "Medium"),
            smallLabel2: v("Label", "Medium"),
            buttonLarge: v("Label", "ExtraLarge"),
            buttonMedium: v("Label", "ExtraLarge"),
            buttonSmall: v("Label", "Medium"),
            tooltip: v("Label", "Medium"),
            alertTitle: v("Label", "ExtraLarge"),
            tableHead: v("Label", "Medium"),
            avatarLetter: v("Heading", "Small"),
            hero: v("Hero", "Large")
        },
        S = (0, t._)({
            h1: v("Heading", "Large"),
            h2: v("Heading", "Medium"),
            h3: v("Heading", "Medium"),
            h4: v("Heading", "Medium"),
            h5: v("Heading", "Small"),
            h6: v("Title", "Large"),
            subtitle1: v("Heading", "Small"),
            subtitle2: v("Title", "Large"),
            body1: v("Body", "Large"),
            body2: v("Body", "Medium"),
            caption: _.captionBody,
            overline: v("Body", "Medium"),
            button: _.buttonMedium,
            fontWeightBold: 700,
            fontWeightLight: 300,
            fontWeightMedium: 500,
            fontWeightRegular: 400,
            htmlFontSize: 16,
            fontFamily: l
        }, _);
    e.s(["default", 0, S, "fontFaces", 0, y])
}, 726756, e => {
    "use strict";
    var t = e.i(962560),
        r = e.i(273589),
        n = e.i(797301),
        a = e.i(208958);
    let o = ["className", "elementType", "ownerState", "externalForwardedProps", "getSlotOwnerState", "internalForwardedProps"],
        i = ["component", "slots", "slotProps"],
        l = ["component"];
    e.s(["u", 0, function(e, s) {
        let {
            className: c,
            elementType: u,
            ownerState: d,
            externalForwardedProps: f,
            getSlotOwnerState: p,
            internalForwardedProps: m
        } = s, h = (0, r._)(s, o), {
            component: y,
            slots: g = {
                [e]: void 0
            },
            slotProps: b = {
                [e]: void 0
            }
        } = f, v = (0, r._)(f, i), _ = g[e] || u, S = (0, n.r)(b[e], d), R = (0, n.m)((0, t._)({
            className: c
        }, h, {
            externalForwardedProps: "root" === e ? v : void 0,
            externalSlotProps: S
        })), {
            props: {
                component: x
            },
            internalRef: w
        } = R, O = (0, r._)(R.props, l), E = (0, a.u)(w, null == S ? void 0 : S.ref, s.ref), P = p ? p(O) : {}, C = (0, t._)({}, d, P), T = "root" === e ? x || y : x, M = (0, n.a)(_, (0, t._)({}, "root" === e && !y && !g[e] && m, "root" !== e && !g[e] && m, O, T && {
            as: T
        }, {
            ref: E
        }), C);
        return Object.keys(P).forEach(e => {
            delete M[e]
        }), [_, M]
    }])
}, 101873, e => {
    "use strict";
    var t = e.i(896729),
        r = e.i(252900);
    e.s(["u", 0, function(e) {
        let {
            props: n,
            name: a,
            defaultTheme: o,
            themeId: i
        } = e, l = (0, r.u)(o);
        return i && (l = l[i] || l), (0, t.g)({
            theme: l,
            name: a,
            props: n
        })
    }])
}, 182012, 436175, e => {
    "use strict";
    var t, r, n, a, o, i, l, s, c, u, d, f = e.i(416340),
        p = e.i(711300),
        m = e.i(634203),
        h = e.i(35877),
        y = e.i(422898),
        g = e.i(630844),
        b = e.i(665564),
        v = e.i(199189),
        _ = e.i(919122),
        S = (t = new WeakMap, r = new WeakMap, n = new WeakMap, a = new WeakMap, o = new WeakSet, class extends v.Removable {
            setOptions(e) {
                this.options = e, this.updateGcTime(this.options.gcTime)
            }
            get meta() {
                return this.options.meta
            }
            addObserver(e) {
                (0, p._)(this, r).includes(e) || ((0, p._)(this, r).push(e), this.clearGcTimeout(), (0, p._)(this, n).notify({
                    type: "observerAdded",
                    mutation: this,
                    observer: e
                }))
            }
            removeObserver(e) {
                (0, h._)(this, r, (0, p._)(this, r).filter(t => t !== e)), this.scheduleGc(), (0, p._)(this, n).notify({
                    type: "observerRemoved",
                    mutation: this,
                    observer: e
                })
            }
            optionalRemove() {
                (0, p._)(this, r).length || ("pending" === this.state.status ? this.scheduleGc() : (0, p._)(this, n).remove(this))
            }
            continue () {
                var e, t;
                return null != (e = null == (t = (0, p._)(this, a)) ? void 0 : t.continue()) ? e : this.execute(this.state.variables)
            }
            async execute(e) {
                var r, i, l, s, c, u, d, f, m, g, b, v, S, R, w, O, E, P, C, T, M;
                let j = () => {
                        (0, y._)(this, o, x).call(this, {
                            type: "continue"
                        })
                    },
                    k = {
                        client: (0, p._)(this, t),
                        meta: this.options.meta,
                        mutationKey: this.options.mutationKey
                    };
                (0, h._)(this, a, (0, _.createRetryer)({
                    fn: () => this.options.mutationFn ? this.options.mutationFn(e, k) : Promise.reject(Error("No mutationFn found")),
                    onFail: (e, t) => {
                        (0, y._)(this, o, x).call(this, {
                            type: "failed",
                            failureCount: e,
                            error: t
                        })
                    },
                    onPause: () => {
                        (0, y._)(this, o, x).call(this, {
                            type: "pause"
                        })
                    },
                    onContinue: j,
                    retry: null != (r = this.options.retry) ? r : 0,
                    retryDelay: this.options.retryDelay,
                    networkMode: this.options.networkMode,
                    canRun: () => (0, p._)(this, n).canRun(this)
                }));
                let L = "pending" === this.state.status,
                    I = !(0, p._)(this, a).canStart();
                try {
                    if (L) j();
                    else {
                        (0, y._)(this, o, x).call(this, {
                            type: "pending",
                            variables: e,
                            isPaused: I
                        }), await (null == (g = (b = (0, p._)(this, n).config).onMutate) ? void 0 : g.call(b, e, this, k));
                        let t = await (null == (v = (S = this.options).onMutate) ? void 0 : v.call(S, e, k));
                        t !== this.state.context && (0, y._)(this, o, x).call(this, {
                            type: "pending",
                            context: t,
                            variables: e,
                            isPaused: I
                        })
                    }
                    let t = await (0, p._)(this, a).start();
                    return await (null == (i = (l = (0, p._)(this, n).config).onSuccess) ? void 0 : i.call(l, t, e, this.state.context, this, k)), await (null == (s = (c = this.options).onSuccess) ? void 0 : s.call(c, t, e, this.state.context, k)), await (null == (u = (d = (0, p._)(this, n).config).onSettled) ? void 0 : u.call(d, t, null, this.state.variables, this.state.context, this, k)), await (null == (f = (m = this.options).onSettled) ? void 0 : f.call(m, t, null, e, this.state.context, k)), (0, y._)(this, o, x).call(this, {
                        type: "success",
                        data: t
                    }), t
                } catch (t) {
                    try {
                        throw await (null == (R = (w = (0, p._)(this, n).config).onError) ? void 0 : R.call(w, t, e, this.state.context, this, k)), await (null == (O = (E = this.options).onError) ? void 0 : O.call(E, t, e, this.state.context, k)), await (null == (P = (C = (0, p._)(this, n).config).onSettled) ? void 0 : P.call(C, void 0, t, this.state.variables, this.state.context, this, k)), await (null == (T = (M = this.options).onSettled) ? void 0 : T.call(M, void 0, t, e, this.state.context, k)), t
                    } finally {
                        (0, y._)(this, o, x).call(this, {
                            type: "error",
                            error: t
                        })
                    }
                } finally {
                    (0, p._)(this, n).runNext(this)
                }
            }
            constructor(e) {
                super(), (0, g._)(this, o), (0, m._)(this, t, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, t, e.client), this.mutationId = e.mutationId, (0, h._)(this, n, e.mutationCache), (0, h._)(this, r, []), this.state = e.state || R(), this.setOptions(e.options), this.scheduleGc()
            }
        });

    function R() {
        return {
            context: void 0,
            data: void 0,
            error: null,
            failureCount: 0,
            failureReason: null,
            isPaused: !1,
            status: "idle",
            variables: void 0,
            submittedAt: 0
        }
    }

    function x(e) {
        this.state = (t => {
            switch (e.type) {
                case "failed":
                    return {
                        ...t, failureCount: e.failureCount, failureReason: e.error
                    };
                case "pause":
                    return {
                        ...t, isPaused: !0
                    };
                case "continue":
                    return {
                        ...t, isPaused: !1
                    };
                case "pending":
                    return {
                        ...t, context: e.context, data: void 0, failureCount: 0, failureReason: null, error: null, isPaused: e.isPaused, status: "pending", variables: e.variables, submittedAt: Date.now()
                    };
                case "success":
                    return {
                        ...t, data: e.data, failureCount: 0, failureReason: null, error: null, status: "success", isPaused: !1
                    };
                case "error":
                    return {
                        ...t, data: void 0, error: e.error, failureCount: t.failureCount + 1, failureReason: e.error, isPaused: !1, status: "error"
                    }
            }
        })(this.state), b.notifyManager.batch(() => {
            (0, p._)(this, r).forEach(t => {
                t.onMutationUpdate(e)
            }), (0, p._)(this, n).notify({
                mutation: this,
                type: "updated",
                action: e
            })
        })
    }
    e.s(["Mutation", 0, S, "getDefaultState", 0, R], 436175);
    var w = e.i(211089),
        O = e.i(711367),
        E = (i = new WeakMap, l = new WeakMap, s = new WeakMap, c = new WeakMap, u = new WeakSet, d = new WeakSet, class extends w.Subscribable {
            bindMethods() {
                this.mutate = this.mutate.bind(this), this.reset = this.reset.bind(this)
            }
            setOptions(e) {
                var t;
                let r = this.options;
                this.options = (0, p._)(this, i).defaultMutationOptions(e), (0, O.shallowEqualObjects)(this.options, r) || (0, p._)(this, i).getMutationCache().notify({
                    type: "observerOptionsUpdated",
                    mutation: (0, p._)(this, s),
                    observer: this
                }), (null == r ? void 0 : r.mutationKey) && this.options.mutationKey && (0, O.hashKey)(r.mutationKey) !== (0, O.hashKey)(this.options.mutationKey) ? this.reset() : (null == (t = (0, p._)(this, s)) ? void 0 : t.state.status) === "pending" && (0, p._)(this, s).setOptions(this.options)
            }
            onUnsubscribe() {
                if (!this.hasListeners()) {
                    var e;
                    null == (e = (0, p._)(this, s)) || e.removeObserver(this)
                }
            }
            onMutationUpdate(e) {
                (0, y._)(this, u, P).call(this), (0, y._)(this, d, C).call(this, e)
            }
            getCurrentResult() {
                return (0, p._)(this, l)
            }
            reset() {
                var e;
                null == (e = (0, p._)(this, s)) || e.removeObserver(this), (0, h._)(this, s, void 0), (0, y._)(this, u, P).call(this), (0, y._)(this, d, C).call(this)
            }
            mutate(e, t) {
                var r;
                return (0, h._)(this, c, t), null == (r = (0, p._)(this, s)) || r.removeObserver(this), (0, h._)(this, s, (0, p._)(this, i).getMutationCache().build((0, p._)(this, i), this.options)), (0, p._)(this, s).addObserver(this), (0, p._)(this, s).execute(e)
            }
            constructor(e, t) {
                super(), (0, g._)(this, u), (0, g._)(this, d), (0, m._)(this, i, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, l, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, i, e), this.setOptions(t), this.bindMethods(), (0, y._)(this, u, P).call(this)
            }
        });

    function P() {
        var e, t;
        let r = null != (e = null == (t = (0, p._)(this, s)) ? void 0 : t.state) ? e : R();
        (0, h._)(this, l, {
            ...r,
            isPending: "pending" === r.status,
            isSuccess: "success" === r.status,
            isError: "error" === r.status,
            isIdle: "idle" === r.status,
            mutate: this.mutate,
            reset: this.reset
        })
    }

    function C(e) {
        b.notifyManager.batch(() => {
            if ((0, p._)(this, c) && this.hasListeners()) {
                var t, r, n, a, o, s, u, d;
                let f = (0, p._)(this, l).variables,
                    m = (0, p._)(this, l).context,
                    h = {
                        client: (0, p._)(this, i),
                        meta: this.options.meta,
                        mutationKey: this.options.mutationKey
                    };
                (null == e ? void 0 : e.type) === "success" ? (null == (t = (r = (0, p._)(this, c)).onSuccess) || t.call(r, e.data, f, m, h), null == (n = (a = (0, p._)(this, c)).onSettled) || n.call(a, e.data, null, f, m, h)) : (null == e ? void 0 : e.type) === "error" && (null == (o = (s = (0, p._)(this, c)).onError) || o.call(s, e.error, f, m, h), null == (u = (d = (0, p._)(this, c)).onSettled) || u.call(d, void 0, e.error, f, m, h))
            }
            this.listeners.forEach(e => {
                e((0, p._)(this, l))
            })
        })
    }
    var T = e.i(795621);
    e.s(["useMutation", 0, function(e, t) {
        let r = (0, T.useQueryClient)(t),
            [n] = f.useState(() => new E(r, e));
        f.useEffect(() => {
            n.setOptions(e)
        }, [n, e]);
        let a = f.useSyncExternalStore(f.useCallback(e => n.subscribe(b.notifyManager.batchCalls(e)), [n]), () => n.getCurrentResult(), () => n.getCurrentResult()),
            o = f.useCallback((e, t) => {
                n.mutate(e, t).catch(O.noop)
            }, [n]);
        if (a.error && (0, O.shouldThrowError)(n.options.throwOnError, [a.error])) throw a.error;
        return {
            ...a,
            mutate: o,
            mutateAsync: a.mutate
        }
    }], 182012)
}, 548972, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        HTTPAccessErrorStatus: function() {
            return o
        },
        HTTP_ERROR_FALLBACK_ERROR_CODE: function() {
            return l
        },
        getAccessFallbackErrorTypeByStatus: function() {
            return u
        },
        getAccessFallbackHTTPStatus: function() {
            return c
        },
        isHTTPAccessFallbackError: function() {
            return s
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = {
            NOT_FOUND: 404,
            FORBIDDEN: 403,
            UNAUTHORIZED: 401
        },
        i = new Set(Object.values(o)),
        l = "NEXT_HTTP_ERROR_FALLBACK";

    function s(e) {
        if ("object" != typeof e || null === e || !("digest" in e) || "string" != typeof e.digest) return !1;
        let [t, r] = e.digest.split(";");
        return t === l && i.has(Number(r))
    }

    function c(e) {
        return Number(e.digest.split(";")[1])
    }

    function u(e) {
        switch (e) {
            case 401:
                return "unauthorized";
            case 403:
                return "forbidden";
            case 404:
                return "not-found";
            default:
                return
        }
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 248643, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "isNextRouterError", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let n = e.r(548972),
        a = e.r(489069);

    function o(e) {
        return (0, a.isRedirectError)(e) || (0, n.isHTTPAccessFallbackError)(e)
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 620712, (e, t, r) => {
    "use strict";
    let n, a;
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var o = {
        useDynamicRouteParams: function() {
            return n
        },
        useDynamicSearchParams: function() {
            return a
        }
    };
    for (var i in o) Object.defineProperty(r, i, {
        enumerable: !0,
        get: o[i]
    });
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 261514, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        ServerInsertedHTMLContext: function() {
            return i
        },
        useServerInsertedHTML: function() {
            return l
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = e.r(887602)._(e.r(416340)),
        i = o.default.createContext(null);

    function l(e) {
        let t = (0, o.useContext)(i);
        t && t(e)
    }
}, 636657, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        UnrecognizedActionError: function() {
            return o
        },
        unstable_isUnrecognizedActionError: function() {
            return i
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    class o extends Error {
        constructor(...e) {
            super(...e), this.name = "UnrecognizedActionError"
        }
    }

    function i(e) {
        return !!(e && "object" == typeof e && e instanceof o)
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 517848, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "notFound", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let n = e.r(548972),
        a = "".concat(n.HTTP_ERROR_FALLBACK_ERROR_CODE, ";404");

    function o() {
        let e = Object.defineProperty(Error(a), "__NEXT_ERROR_CODE", {
            value: "E1041",
            enumerable: !1,
            configurable: !0
        });
        throw e.digest = a, e
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 911627, (e, t, r) => {
    "use strict";

    function n() {
        throw Object.defineProperty(Error("`forbidden()` is experimental and only allowed to be enabled when `experimental.authInterrupts` is enabled."), "__NEXT_ERROR_CODE", {
            value: "E488",
            enumerable: !1,
            configurable: !0
        })
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "forbidden", {
        enumerable: !0,
        get: function() {
            return n
        }
    }), e.r(548972).HTTP_ERROR_FALLBACK_ERROR_CODE, ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 571536, (e, t, r) => {
    "use strict";

    function n() {
        throw Object.defineProperty(Error("`unauthorized()` is experimental and only allowed to be used when `experimental.authInterrupts` is enabled."), "__NEXT_ERROR_CODE", {
            value: "E411",
            enumerable: !1,
            configurable: !0
        })
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "unauthorized", {
        enumerable: !0,
        get: function() {
            return n
        }
    }), e.r(548972).HTTP_ERROR_FALLBACK_ERROR_CODE, ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 498611, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "ReadonlyURLSearchParams", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    class n extends Error {
        constructor() {
            super("Method unavailable on `ReadonlyURLSearchParams`. Read more: https://nextjs.org/docs/app/api-reference/functions/use-search-params#updating-searchparams"), Object.defineProperty(this, "__NEXT_ERROR_CODE", {
                value: "E1174",
                enumerable: !1,
                configurable: !0
            })
        }
    }
    class a extends URLSearchParams {
        append() {
            throw new n
        }
        delete() {
            throw new n
        }
        set() {
            throw new n
        }
        sort() {
            throw new n
        }
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 489069, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        REDIRECT_ERROR_CODE: function() {
            return i
        },
        isRedirectError: function() {
            return l
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = e.r(17374),
        i = "NEXT_REDIRECT";

    function l(e) {
        if ("object" != typeof e || null === e || !("digest" in e) || "string" != typeof e.digest) return !1;
        let t = e.digest.split(";"),
            [r, n] = t,
            a = t.slice(2, -2).join(";"),
            l = Number(t.at(-2));
        return r === i && ("replace" === n || "push" === n) && "string" == typeof a && !isNaN(l) && l in o.RedirectStatusCode
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 17374, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "RedirectStatusCode", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    var n, a = ((n = {})[n.SeeOther = 303] = "SeeOther", n[n.TemporaryRedirect = 307] = "TemporaryRedirect", n[n.PermanentRedirect = 308] = "PermanentRedirect", n);
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 709817, (e, t, r) => {
    "use strict";
    let n, a, o;
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var i = {
        actionAsyncStorage: function() {
            return n
        },
        workAsyncStorage: function() {
            return a
        },
        workUnitAsyncStorage: function() {
            return o
        }
    };
    for (var l in i) Object.defineProperty(r, l, {
        enumerable: !0,
        get: i[l]
    });
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 892416, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        getRedirectError: function() {
            return s
        },
        getRedirectStatusCodeFromError: function() {
            return p
        },
        getRedirectTypeFromError: function() {
            return f
        },
        getURLFromRedirectError: function() {
            return d
        },
        permanentRedirect: function() {
            return u
        },
        redirect: function() {
            return c
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = e.r(17374),
        i = e.r(489069),
        l = e.r(709817);

    function s(e, t) {
        let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : o.RedirectStatusCode.TemporaryRedirect,
            n = Object.defineProperty(Error(i.REDIRECT_ERROR_CODE), "__NEXT_ERROR_CODE", {
                value: "E394",
                enumerable: !1,
                configurable: !0
            });
        return n.digest = "".concat(i.REDIRECT_ERROR_CODE, ";").concat(t, ";").concat(e, ";").concat(r, ";"), n
    }

    function c(e, t) {
        var r, n;
        throw null != t || (t = (null == (n = l.actionAsyncStorage) || null == (r = n.getStore()) ? void 0 : r.isAction) ? "push" : "replace"), s(e, t, o.RedirectStatusCode.TemporaryRedirect)
    }

    function u(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "replace";
        throw s(e, t, o.RedirectStatusCode.PermanentRedirect)
    }

    function d(e) {
        return (0, i.isRedirectError)(e) ? e.digest.split(";").slice(2, -2).join(";") : null
    }

    function f(e) {
        if (!(0, i.isRedirectError)(e)) throw Object.defineProperty(Error("Not a redirect error"), "__NEXT_ERROR_CODE", {
            value: "E260",
            enumerable: !1,
            configurable: !0
        });
        return e.digest.split(";", 2)[1]
    }

    function p(e) {
        if (!(0, i.isRedirectError)(e)) throw Object.defineProperty(Error("Not a redirect error"), "__NEXT_ERROR_CODE", {
            value: "E260",
            enumerable: !1,
            configurable: !0
        });
        return Number(e.digest.split(";").at(-2))
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 55491, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "unstable_rethrow", {
        enumerable: !0,
        get: function() {
            return function e(t) {
                if ((0, a.isNextRouterError)(t) || (0, n.isBailoutToCSRError)(t)) throw t;
                t instanceof Error && "cause" in t && e(t.cause)
            }
        }
    });
    let n = e.r(450392),
        a = e.r(248643);
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 786200, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        ReadonlyURLSearchParams: function() {
            return o.ReadonlyURLSearchParams
        },
        RedirectType: function() {
            return f
        },
        forbidden: function() {
            return s.forbidden
        },
        notFound: function() {
            return l.notFound
        },
        permanentRedirect: function() {
            return i.permanentRedirect
        },
        redirect: function() {
            return i.redirect
        },
        unauthorized: function() {
            return c.unauthorized
        },
        unstable_isUnrecognizedActionError: function() {
            return d
        },
        unstable_rethrow: function() {
            return u.unstable_rethrow
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = e.r(498611),
        i = e.r(892416),
        l = e.r(517848),
        s = e.r(911627),
        c = e.r(571536),
        u = e.r(55491);

    function d() {
        throw Object.defineProperty(Error("`unstable_isUnrecognizedActionError` can only be used on the client."), "__NEXT_ERROR_CODE", {
            value: "E776",
            enumerable: !1,
            configurable: !0
        })
    }
    let f = {
        push: "push",
        replace: "replace"
    };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 734756, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        ReadonlyURLSearchParams: function() {
            return l.ReadonlyURLSearchParams
        },
        RedirectType: function() {
            return f.RedirectType
        },
        ServerInsertedHTMLContext: function() {
            return u.ServerInsertedHTMLContext
        },
        forbidden: function() {
            return f.forbidden
        },
        notFound: function() {
            return f.notFound
        },
        permanentRedirect: function() {
            return f.permanentRedirect
        },
        redirect: function() {
            return f.redirect
        },
        unauthorized: function() {
            return f.unauthorized
        },
        unstable_isUnrecognizedActionError: function() {
            return d.unstable_isUnrecognizedActionError
        },
        unstable_rethrow: function() {
            return f.unstable_rethrow
        },
        useParams: function() {
            return v
        },
        usePathname: function() {
            return g
        },
        useRouter: function() {
            return b
        },
        useSearchParams: function() {
            return y
        },
        useSelectedLayoutSegment: function() {
            return S
        },
        useSelectedLayoutSegments: function() {
            return _
        },
        useServerInsertedHTML: function() {
            return u.useServerInsertedHTML
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = e.r(887602)._(e.r(416340)),
        i = e.r(419810),
        l = e.r(956959),
        s = e.r(970739),
        c = e.r(620712),
        u = e.r(261514),
        d = e.r(636657),
        f = e.r(786200),
        {
            instrumentParamsForClientValidation: p,
            instrumentSearchParamsForClientValidation: m,
            expectCompleteParamsInClientValidation: h
        } = {};

    function y() {
        var e;
        null == (e = c.useDynamicSearchParams) || e.call(c, "useSearchParams()");
        let t = (0, o.useContext)(l.SearchParamsContext);
        return (0, o.useMemo)(() => t ? new l.ReadonlyURLSearchParams(t) : null, [t])
    }

    function g() {
        var e;
        return null == (e = c.useDynamicRouteParams) || e.call(c, "usePathname()"), (0, o.useContext)(l.PathnameContext)
    }

    function b() {
        var e;
        let t = (0, o.useContext)(i.AppRouterContext);
        if (null === t) throw Object.defineProperty(Error("invariant expected app router to be mounted"), "__NEXT_ERROR_CODE", {
            value: "E238",
            enumerable: !1,
            configurable: !0
        });
        let r = (0, o.useContext)(i.LayoutRouterContext),
            n = null != (e = null == r ? void 0 : r.parentCacheNode.bfcacheId) ? e : 0;
        return (0, o.useMemo)(() => ({
            back: t.back,
            forward: t.forward,
            refresh: t.refresh,
            hmrRefresh: t.hmrRefresh,
            push: t.push,
            replace: t.replace,
            prefetch: t.prefetch,
            experimental_gesturePush: t.experimental_gesturePush,
            bfcacheId: "_b_" + n + "_"
        }), [t, n])
    }

    function v() {
        var e;
        return null == (e = c.useDynamicRouteParams) || e.call(c, "useParams()"), (0, o.useContext)(l.PathParamsContext)
    }

    function _() {
        var e;
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "children";
        null == (e = c.useDynamicRouteParams) || e.call(c, "useSelectedLayoutSegments()");
        let r = (0, o.useContext)(i.LayoutRouterContext);
        return r ? (0, s.getSelectedLayoutSegmentPath)(r.parentTree, t) : null
    }

    function S() {
        var e;
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "children";
        null == (e = c.useDynamicRouteParams) || e.call(c, "useSelectedLayoutSegment()"), (0, o.useContext)(l.NavigationPromisesContext);
        let r = _(t);
        return (0, s.computeSelectedLayoutSegment)(r, t)
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 425892, (e, t, r) => {
    t.exports = e.r(734756)
}, 419810, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        AppRouterContext: function() {
            return i
        },
        GlobalLayoutRouterContext: function() {
            return s
        },
        LayoutRouterContext: function() {
            return l
        },
        MissingSlotContext: function() {
            return u
        },
        TemplateContext: function() {
            return c
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = e.r(2879)._(e.r(416340)),
        i = o.default.createContext(null),
        l = o.default.createContext(null),
        s = o.default.createContext(null),
        c = o.default.createContext(null),
        u = o.default.createContext(new Set)
}, 103509, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        default: function() {
            return h
        },
        defaultHead: function() {
            return d
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = e.r(2879),
        i = e.r(887602),
        l = e.r(221628),
        s = i._(e.r(416340)),
        c = o._(e.r(918590)),
        u = e.r(4063);

    function d() {
        return [(0, l.jsx)("meta", {
            charSet: "utf-8"
        }, "charset"), (0, l.jsx)("meta", {
            name: "viewport",
            content: "width=device-width"
        }, "viewport")]
    }

    function f(e, t) {
        return "string" == typeof t || "number" == typeof t ? e : t.type === s.default.Fragment ? e.concat(s.default.Children.toArray(t.props.children).reduce((e, t) => "string" == typeof t || "number" == typeof t ? e : e.concat(t), [])) : e.concat(t)
    }
    let p = ["name", "httpEquiv", "charSet", "itemProp"];

    function m(e) {
        let t, r, n, a;
        return e.reduce(f, []).reverse().concat(d().reverse()).filter((t = new Set, r = new Set, n = new Set, a = {}, e => {
            let o = !0,
                i = !1;
            if (e.key && "number" != typeof e.key && e.key.indexOf("$") > 0) {
                i = !0;
                let r = e.key.slice(e.key.indexOf("$") + 1);
                t.has(r) ? o = !1 : t.add(r)
            }
            switch (e.type) {
                case "title":
                case "base":
                    r.has(e.type) ? o = !1 : r.add(e.type);
                    break;
                case "meta":
                    for (let t = 0, r = p.length; t < r; t++) {
                        let r = p[t];
                        if (e.props.hasOwnProperty(r))
                            if ("charSet" === r) n.has(r) ? o = !1 : n.add(r);
                            else {
                                let t = e.props[r],
                                    n = a[r] || new Set;
                                ("name" !== r || !i) && n.has(t) ? o = !1 : (n.add(t), a[r] = n)
                            }
                    }
            }
            return o
        })).reverse().map((e, t) => {
            let r = e.key || t;
            return s.default.cloneElement(e, {
                key: r
            })
        })
    }
    let h = function(e) {
        let {
            children: t
        } = e, r = (0, s.useContext)(u.HeadManagerContext);
        return (0, l.jsx)(c.default, {
            reduceComponentsToState: m,
            headManager: r,
            children: t
        })
    };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 956959, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        NavigationPromisesContext: function() {
            return u
        },
        PathParamsContext: function() {
            return c
        },
        PathnameContext: function() {
            return s
        },
        ReadonlyURLSearchParams: function() {
            return i.ReadonlyURLSearchParams
        },
        SearchParamsContext: function() {
            return l
        },
        createDevToolsInstrumentedPromise: function() {
            return d
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = e.r(416340),
        i = e.r(498611),
        l = (0, o.createContext)(null),
        s = (0, o.createContext)(null),
        c = (0, o.createContext)(null),
        u = (0, o.createContext)(null);

    function d(e, t) {
        let r = Promise.resolve(t);
        return r.status = "fulfilled", r.value = t, r.displayName = "".concat(e, " (SSR)"), r
    }
}, 450392, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        BailoutToCSRError: function() {
            return i
        },
        isBailoutToCSRError: function() {
            return l
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = "BAILOUT_TO_CLIENT_SIDE_RENDERING";
    class i extends Error {
        constructor(e) {
            super("Bail out to client-side rendering: ".concat(e)), this.reason = e, this.digest = o
        }
    }

    function l(e) {
        return "object" == typeof e && null !== e && "digest" in e && e.digest === o
    }
}, 918590, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return l
        }
    });
    let n = e.r(416340),
        a = "u" < typeof window,
        o = a ? () => {} : n.useLayoutEffect,
        i = a ? () => {} : n.useEffect;

    function l(e) {
        let {
            headManager: t,
            reduceComponentsToState: r
        } = e;

        function l() {
            if (t && t.mountedInstances) {
                let e = n.Children.toArray(Array.from(t.mountedInstances).filter(Boolean));
                t.updateHead(r(e))
            }
        }
        if (a) {
            var s;
            null == t || null == (s = t.mountedInstances) || s.add(e.children), l()
        }
        return o(() => {
            var r;
            return null == t || null == (r = t.mountedInstances) || r.add(e.children), () => {
                var r;
                null == t || null == (r = t.mountedInstances) || r.delete(e.children)
            }
        }), o(() => (t && (t._pendingUpdate = l), () => {
            t && (t._pendingUpdate = l)
        })), i(() => (t && t._pendingUpdate && (t._pendingUpdate(), t._pendingUpdate = null), () => {
            t && t._pendingUpdate && (t._pendingUpdate(), t._pendingUpdate = null)
        })), null
    }
}, 298372, (e, t, r) => {
    t.exports = e.r(103509)
}, 37819, e => {
    "use strict";
    var t = e.i(721281),
        r = e.i(772738),
        n = e.i(237401),
        a = e.i(416340),
        o = e.i(298372);
    let i = {
            maxItems: 10,
            maxStoredItems: 100,
            maxDaysAgo: 140,
            queryParamsToKeep: ["activeTab", "tab"],
            pathsToSkip: [/^\/api(\/.*)?\/?$/, /^\/_next(\/.*)?\/?$/, /^\/404$/, /^\/500$/]
        },
        l = "Creator.RecentlyVisited";

    function s(e) {
        return e ? "".concat(l, ".").concat(e) : l
    }
    let c = ["CreatorDocumentation.RecentlyVisited"],
        u = "hub:";
    var d, f = ((d = {}).CreatorHub = "Creator Hub", d.Store = "Store", d.TalentHub = "Talent Hub", d.Learn = "Learn", d);
    let p = r.z.union([r.z.string(), r.z.object({
            translationKey: r.z.string(),
            translationKeyParams: r.z.record(r.z.string(), r.z.string()).optional(),
            defaultLabel: r.z.string().optional()
        })]),
        m = r.z.object({
            id: r.z.union([r.z.string(), r.z.number()]).optional(),
            name: r.z.string().optional(),
            displayName: r.z.string().optional(),
            hasVerifiedBadge: r.z.boolean().optional()
        }).passthrough(),
        h = r.z.object({
            title: r.z.string(),
            path: r.z.string(),
            description: r.z.string().optional(),
            siteName: r.z.string().optional(),
            contentType: r.z.string().optional(),
            authorName: r.z.string().optional(),
            entityName: r.z.string().optional(),
            breadcrumb: r.z.string().optional(),
            entityId: r.z.string().optional(),
            userId: r.z.string().optional(),
            keywords: r.z.string().optional(),
            className: r.z.string().optional(),
            ariaLabel: r.z.string().optional(),
            translatedCategoryDisplayText: r.z.string().optional(),
            documentationContentType: r.z.string().nullable().optional(),
            documentationSubType: r.z.string().nullable().optional(),
            documentationThirdType: r.z.string().nullable().optional(),
            createdAtUtc: r.z.string().optional(),
            updatedAtUtc: r.z.string().optional(),
            author: m.optional(),
            type: r.z.string().optional(),
            isTitleCode: r.z.boolean().optional(),
            label: p.optional(),
            ignoreHash: r.z.boolean().optional()
        }).passthrough(),
        y = r.z.object({
            id: r.z.string(),
            accessedAt: r.z.number(),
            metadata: h
        });
    r.z.array(y);
    let g = {
        getItem(e) {
            try {
                return window.localStorage.getItem(e)
            } catch (e) {
                return null
            }
        },
        setItem(e, t) {
            try {
                window.localStorage.setItem(e, t)
            } catch (e) {}
        },
        removeItem(e) {
            try {
                window.localStorage.removeItem(e)
            } catch (e) {}
        }
    };

    function b(e) {
        try {
            let t = g.getItem(e);
            if (!t) return [];
            let r = JSON.parse(t);
            if (!Array.isArray(r)) return [];
            return r.reduce((e, t) => {
                let r = y.safeParse(t);
                if (r.success) return e.push(r.data), e;
                let n = function(e) {
                    var t;
                    if (!e || "object" != typeof e || e.metadata) return null;
                    let {
                        title: r
                    } = e, n = null != (t = e.path) ? t : e.id;
                    if ("string" != typeof r || !r || "string" != typeof n || !n) return null;
                    let a = "string" == typeof e.id && e.id ? e.id : n,
                        o = Date.now();
                    "number" == typeof e.accessedAt ? o = e.accessedAt : "string" == typeof e.accessedAt && (o = new Date(e.accessedAt).getTime() || Date.now());
                    let {
                        id: i,
                        accessedAt: l,
                        ...s
                    } = e;
                    return {
                        id: a,
                        accessedAt: o,
                        metadata: {
                            title: r,
                            path: n,
                            ...s
                        }
                    }
                }(t);
                if (n) {
                    let t = y.safeParse(n);
                    t.success && e.push(t.data)
                }
                return e
            }, [])
        } catch (e) {
            return []
        }
    }
    let v = new class {
        setActiveUser(e) {
            let t = s(e);
            if (t === this.storageKey) return;
            let r = !this.currentUserId;
            this.currentUserId = e, this.storageKey = t, this.hasMigrated = !1, r && e && this.migrateAnonymousToUser()
        }
        migrateAnonymousToUser() {
            let e = s(),
                t = b(e);
            if (0 === t.length) return;
            let r = b(this.storageKey),
                n = new Map;
            t.forEach(e => n.set(e.id, e)), r.forEach(e => {
                let t = n.get(e.id);
                (!t || e.accessedAt > t.accessedAt) && n.set(e.id, e)
            });
            let a = Array.from(n.values()).sort((e, t) => t.accessedAt - e.accessedAt).slice(0, this.config.maxStoredItems);
            g.setItem(this.storageKey, JSON.stringify(a)), g.removeItem(e)
        }
        migrateIfNeeded() {
            if (this.hasMigrated || (this.hasMigrated = !0, b(this.storageKey).length > 0)) return;
            let e = [];
            if (c.forEach(t => {
                    e.push(...b(t))
                }), 0 === e.length) return;
            let t = new Map;
            e.forEach(e => {
                let r = t.get(e.id);
                (!r || e.accessedAt > r.accessedAt) && t.set(e.id, e)
            });
            let r = Array.from(t.values()).sort((e, t) => t.accessedAt - e.accessedAt).slice(0, this.config.maxStoredItems);
            g.setItem(this.storageKey, JSON.stringify(r)), c.forEach(e => {
                g.removeItem(e)
            })
        }
        getAllFilteredItems() {
            return this.migrateIfNeeded(), b(this.storageKey).filter(e => e.accessedAt && e.accessedAt >= this.maxDaysAgoTimestamp)
        }
        async getRecentlyVisited(e) {
            try {
                return this.getAllFilteredItems().slice(0, null != e ? e : this.config.maxItems)
            } catch (e) {
                return []
            }
        }
        async addToRecentlyVisited(e) {
            var t, r;
            if ((null == (t = e.metadata) ? void 0 : t.path) && (null == (r = e.metadata) ? void 0 : r.title)) try {
                let t = this.getAllFilteredItems(),
                    r = e.id.split("?")[0],
                    n = e.id.includes("?"),
                    a = t.filter(t => t.id !== e.id && (t.id.split("?")[0] !== r || t.metadata.title !== e.metadata.title || !!t.id.includes("?") && !!n)),
                    o = [e, ...a].slice(0, this.config.maxStoredItems);
                g.setItem(this.storageKey, JSON.stringify(o))
            } catch (e) {}
        }
        async removeFromRecentlyVisited(e) {
            try {
                let t = this.getAllFilteredItems().filter(t => t.id !== e);
                return g.setItem(this.storageKey, JSON.stringify(t)), t.slice(0, this.config.maxItems)
            } catch (e) {
                return []
            }
        }
        async clearHistory() {
            try {
                g.removeItem(this.storageKey)
            } catch (e) {}
        }
        constructor(e = {}) {
            (0, t._)(this, "config", void 0), (0, t._)(this, "storageKey", l), (0, t._)(this, "currentUserId", void 0), (0, t._)(this, "maxDaysAgoTimestamp", void 0), (0, t._)(this, "hasMigrated", !1), this.config = {
                ...i,
                ...e
            }, this.maxDaysAgoTimestamp = Date.now() - 24 * this.config.maxDaysAgo * 36e5
        }
    };

    function _() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        let n = t.filter(Boolean);
        return n.length > 0 ? n.join(" / ") : void 0
    }

    function S(e) {
        let {
            origin: t,
            pathname: r,
            search: n
        } = e, a = "".concat(t).concat(r).concat(n), o = new URLSearchParams(n);
        Array.from(o.keys()).filter(e => !i.queryParamsToKeep.includes(e)).forEach(e => o.delete(e)), o.sort();
        let l = o.toString(),
            s = "".concat(r).concat(l ? "?".concat(l) : ""),
            c = "".concat(t).concat(s);
        return {
            id: s,
            cleanedUrl: c,
            originalUrl: a
        }
    }

    function R(e) {
        var t;
        let r = null != (t = document.querySelector('meta[property="'.concat(e, '"]'))) ? t : document.querySelector('meta[name="'.concat(e, '"]'));
        return (null == r ? void 0 : r.content) || void 0
    }

    function x(e) {
        return R("".concat(u).concat(e))
    }

    function w(e, t) {
        return x(e) || R(t) || void 0
    }

    function O() {
        let e = {
                title: x("title") || document.title || R("og:title") || ""
            },
            t = w("description", "og:description") || R("description");
        t && (e.description = t);
        let r = w("site_name", "og:site_name");
        r && (e.siteName = r);
        let n = w("type", "og:type");
        n && (e.contentType = n);
        let a = w("author", "article:author");
        a && (e.authorName = a);
        let o = x("entity-name");
        o && (e.entityName = o);
        let i = x("entity-id");
        i && (e.entityId = i);
        let l = x("user-id");
        l && (e.userId = l);
        let s = R("keywords");
        s && (e.keywords = s);
        let c = x("breadcrumb");
        c && (e.breadcrumb = c);
        let u = x("label");
        if (u) try {
            e.label = JSON.parse(u)
        } catch (t) {
            e.label = u
        }
        return "true" === x("is-title-code") && (e.isTitleCode = !0), e
    }
    class E {
        collect() {
            return this.collectFn()
        }
        constructor() {
            (0, t._)(this, "collectFn", O)
        }
    }
    class P {
        detect(e, t) {
            var r;
            this.cleanup();
            let n = () => {
                this.cleanupPrimary();
                let r = e.collect();
                t(r), this.watchForLateUpdates(e, r.title, t)
            };
            this.maxTimer = setTimeout(n, 3e3);
            let a = () => {
                this.debounceTimer && clearTimeout(this.debounceTimer), this.debounceTimer = setTimeout(n, 300)
            };
            this.observer = new MutationObserver(() => {
                a()
            });
            let o = null != (r = document.head) ? r : document.querySelector("head");
            o && this.observer.observe(o, {
                childList: !0,
                subtree: !0,
                characterData: !0,
                attributes: !0
            }), a()
        }
        watchForLateUpdates(e, t, r) {
            var n;
            let a = null != (n = document.head) ? n : document.querySelector("head");
            if (!a) return;
            this.postSettleTimer = setTimeout(() => {
                this.cleanupPostSettle()
            }, 5e3);
            let o = 'meta[name="'.concat(u, 'title"]');
            this.postSettleObserver = new MutationObserver(() => {
                let n = document.querySelector(o),
                    a = null == n ? void 0 : n.content;
                a && a !== t && (this.cleanupPostSettle(), r(e.collect()))
            }), this.postSettleObserver.observe(a, {
                childList: !0,
                subtree: !0,
                attributes: !0
            })
        }
        cleanupPrimary() {
            this.observer && (this.observer.disconnect(), this.observer = null), this.debounceTimer && (clearTimeout(this.debounceTimer), this.debounceTimer = null), this.maxTimer && (clearTimeout(this.maxTimer), this.maxTimer = null)
        }
        cleanupPostSettle() {
            this.postSettleObserver && (this.postSettleObserver.disconnect(), this.postSettleObserver = null), this.postSettleTimer && (clearTimeout(this.postSettleTimer), this.postSettleTimer = null)
        }
        cleanup() {
            this.cleanupPrimary(), this.cleanupPostSettle()
        }
        constructor() {
            (0, t._)(this, "observer", null), (0, t._)(this, "debounceTimer", null), (0, t._)(this, "maxTimer", null), (0, t._)(this, "postSettleObserver", null), (0, t._)(this, "postSettleTimer", null)
        }
    }
    let C = (0, a.createContext)({
        trackPageVisit: async () => {
            throw Error("trackPageVisit is not implemented")
        },
        getRecentlyVisited: async () => {
            throw Error("getRecentlyVisited is not implemented")
        },
        removeFromHistory: async () => {
            throw Error("removeFromHistory is not implemented")
        },
        clearHistory: async () => {
            throw Error("clearHistory is not implemented")
        },
        eventLogger: void 0
    });

    function T() {
        return S(window.location)
    }
    let M = a.default.memo(e => {
        var t, r;
        let {
            hubOnly: n = !1,
            title: i,
            seoTitle: l,
            ogTitle: s,
            description: c,
            seoDescription: d,
            ogDescription: p,
            author: m,
            seoAuthor: h,
            siteName: y = f.CreatorHub,
            keywords: g,
            robots: b,
            ogImage: v,
            ogUrl: S,
            ogType: R,
            canonical: x,
            type: w,
            entityName: O,
            entityId: E,
            userId: P,
            label: C,
            breadcrumb: T,
            breadcrumbItems: M,
            isTitleCode: j,
            children: k
        } = e, L = e => n ? void 0 : e, I = L(null != l ? l : i), z = L(null != (t = null != s ? s : l) ? t : i), F = L(null != d ? d : c), A = L(null != (r = null != p ? p : d) ? r : c), N = L(null != h ? h : m), B = null != T ? T : M && M.length > 0 ? _(...M.map(e => e.name)) : void 0;
        return a.default.createElement(o.default, null, I && a.default.createElement("title", null, I), z && a.default.createElement("meta", {
            property: "og:title",
            content: z,
            key: "og:title"
        }), i && a.default.createElement("meta", {
            name: "".concat(u, "title"),
            content: i,
            key: "".concat(u, "title")
        }), A && a.default.createElement("meta", {
            property: "og:description",
            content: A,
            key: "og:description"
        }), F && a.default.createElement("meta", {
            name: "description",
            content: F,
            key: "description"
        }), c && a.default.createElement("meta", {
            name: "".concat(u, "description"),
            content: c,
            key: "".concat(u, "description")
        }), N && a.default.createElement("meta", {
            property: "article:author",
            content: N,
            key: "article:author"
        }), m && a.default.createElement("meta", {
            name: "".concat(u, "author"),
            content: m,
            key: "".concat(u, "author")
        }), !n && a.default.createElement("meta", {
            property: "og:site_name",
            content: y,
            key: "og:site_name"
        }), a.default.createElement("meta", {
            name: "".concat(u, "site_name"),
            content: y,
            key: "".concat(u, "site_name")
        }), !n && g && a.default.createElement("meta", {
            name: "keywords",
            content: g,
            key: "keywords"
        }), !n && b && a.default.createElement("meta", {
            name: "robots",
            content: b,
            key: "robots"
        }), !n && v && a.default.createElement("meta", {
            property: "og:image",
            content: v,
            key: "og:image"
        }), !n && S && a.default.createElement("meta", {
            property: "og:url",
            content: S,
            key: "og:url"
        }), !n && R && a.default.createElement("meta", {
            property: "og:type",
            content: R,
            key: "og:type"
        }), !n && x && a.default.createElement("link", {
            rel: "canonical",
            href: x
        }), w && a.default.createElement("meta", {
            name: "".concat(u, "type"),
            content: w,
            key: "".concat(u, "type")
        }), O && a.default.createElement("meta", {
            name: "".concat(u, "entity-name"),
            content: O,
            key: "".concat(u, "entity-name")
        }), E && a.default.createElement("meta", {
            name: "".concat(u, "entity-id"),
            content: E,
            key: "".concat(u, "entity-id")
        }), P && a.default.createElement("meta", {
            name: "".concat(u, "user-id"),
            content: P,
            key: "".concat(u, "user-id")
        }), C && a.default.createElement("meta", {
            name: "".concat(u, "label"),
            content: C,
            key: "".concat(u, "label")
        }), B && a.default.createElement("meta", {
            name: "".concat(u, "breadcrumb"),
            content: B,
            key: "".concat(u, "breadcrumb")
        }), j && a.default.createElement("meta", {
            name: "".concat(u, "is-title-code"),
            content: "true",
            key: "".concat(u, "is-title-code")
        }), !n && M && M.length > 0 && a.default.createElement("script", {
            type: "application/ld+json",
            key: "breadcrumb-jsonld",
            dangerouslySetInnerHTML: {
                __html: JSON.stringify({
                    "@context": "https://schema.org",
                    "@type": "BreadcrumbList",
                    itemListElement: M.map((e, t) => ({
                        "@type": "ListItem",
                        position: t + 1,
                        name: e.name,
                        item: e.url
                    }))
                })
            }
        }), k)
    });
    M.displayName = "HubMeta", e.s(["HistoryProvider", 0, e => {
        let {
            children: t,
            userId: r,
            getMetadataForPath: o,
            eventLogger: l
        } = e, s = (0, n.useRouter)(), c = (0, a.useRef)(new E), u = (0, a.useRef)(new P);
        (0, a.useEffect)(() => {
            v.setActiveUser(r)
        }, [r]);
        let d = (0, a.useCallback)(e => {
                let {
                    id: t,
                    originalUrl: r
                } = T();
                if (i.pathsToSkip.some(e => e.test(t)) || !e.title) return;
                let {
                    title: n,
                    ...a
                } = e, o = {
                    title: n,
                    path: r,
                    ...a
                };
                v.addToRecentlyVisited({
                    id: t,
                    metadata: o,
                    accessedAt: Date.now()
                })
            }, []),
            f = (0, a.useCallback)(async (e, t) => {
                let {
                    id: r,
                    originalUrl: n
                } = T();
                if (!i.pathsToSkip.some(e => e.test(r))) try {
                    var a;
                    let e = {
                        title: t || (null == (a = document) ? void 0 : a.title) || r,
                        path: n
                    };
                    if (o) {
                        let t = o(r);
                        t && (e = {
                            ...e,
                            ...t
                        })
                    }
                    if (!e.title) return;
                    await v.addToRecentlyVisited({
                        id: r,
                        metadata: e,
                        accessedAt: Date.now()
                    })
                } catch (e) {}
            }, [o]),
            p = (0, a.useCallback)(async e => v.getRecentlyVisited(e), []),
            m = (0, a.useCallback)(async e => v.removeFromRecentlyVisited(e), []),
            h = (0, a.useCallback)(async () => v.clearHistory(), []);
        (0, a.useEffect)(() => {
            let e = u.current,
                t = c.current,
                r = () => {
                    e.detect(t, e => {
                        d(e)
                    })
                };
            r();
            let n = () => {
                r()
            };
            return s.events.on("routeChangeComplete", n), () => {
                s.events.off("routeChangeComplete", n), e.cleanup()
            }
        }, [s.events, d]);
        let y = (0, a.useMemo)(() => ({
            trackPageVisit: f,
            getRecentlyVisited: p,
            removeFromHistory: m,
            clearHistory: h,
            eventLogger: l
        }), [f, p, m, h, l]);
        return a.default.createElement(C.Provider, {
            value: y
        }, t)
    }, "HubMeta", 0, M, "SiteName", 0, f, "TITLE_SEPARATOR", 0, " / ", "buildBreadcrumb", 0, _, "buildTitle", 0, function() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return t.filter(Boolean).join(" / ")
    }, "cleanUrl", 0, S, "historyClient", 0, v])
}]);

//# debugId=77c8bcfe-9145-a15d-0b8e-038634b65dfe
//# sourceMappingURL=1g-fofu-dee8u.js.map
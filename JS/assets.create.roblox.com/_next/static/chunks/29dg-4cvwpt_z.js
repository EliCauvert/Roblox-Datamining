;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "aa880743-6db4-d094-5138-7dc271bfd1a0")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 982234, e => {
    "use strict";
    var t = e.i(865800),
        o = e.i(416340),
        s = e.i(431346),
        r = e.i(614515),
        n = e.i(993807),
        i = e.i(273589),
        l = e.i(962560),
        c = e.i(42569),
        a = e.i(696180),
        p = e.i(221628),
        u = e.i(972455),
        d = e.i(963320),
        h = e.i(738508),
        m = e.i(208958);

    function b(e) {
        return (0, i.g)("MuiLink", e)
    }
    e.i(737153);
    var f = (0, a.g)("MuiLink", ["root", "underlineNone", "underlineHover", "underlineAlways", "button", "focusVisible"]);
    let v = {
            primary: "primary.main",
            textPrimary: "text.primary",
            secondary: "secondary.main",
            textSecondary: "text.secondary",
            error: "error.main"
        },
        x = ["className", "color", "component", "onBlur", "onFocus", "TypographyClasses", "underline", "variant", "sx"],
        g = (0, c.s)(u.T, {
            name: "MuiLink",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: o
                } = e;
                return [t.root, t["underline".concat((0, i.a)(o.underline))], "button" === o.component && t.button]
            }
        })(e => {
            let {
                theme: t,
                ownerState: o
            } = e;
            return (0, l._)({}, "none" === o.underline && {
                textDecoration: "none"
            }, "hover" === o.underline && {
                textDecoration: "none",
                "&:hover": {
                    textDecoration: "underline"
                }
            }, "always" === o.underline && (0, l._)({
                textDecoration: "underline"
            }, "inherit" !== o.color && {
                textDecorationColor: (e => {
                    let t, {
                            theme: o,
                            ownerState: s
                        } = e,
                        r = v[t = s.color] || t,
                        n = (0, i.k)(o, "palette.".concat(r), !1) || s.color,
                        l = (0, i.k)(o, "palette.".concat(r, "Channel"));
                    return "vars" in o && l ? "rgba(".concat(l, " / 0.4)") : (0, i.b)(n, .4)
                })({
                    theme: t,
                    ownerState: o
                })
            }, {
                "&:hover": {
                    textDecorationColor: "inherit"
                }
            }), "button" === o.component && {
                position: "relative",
                WebkitTapHighlightColor: "transparent",
                backgroundColor: "transparent",
                outline: 0,
                border: 0,
                margin: 0,
                borderRadius: 0,
                padding: 0,
                cursor: "pointer",
                userSelect: "none",
                verticalAlign: "middle",
                MozAppearance: "none",
                WebkitAppearance: "none",
                "&::-moz-focus-inner": {
                    borderStyle: "none"
                },
                ["&.".concat(f.focusVisible)]: {
                    outline: "auto"
                }
            })
        }),
        y = o.forwardRef(function(e, t) {
            let s = (0, d.u)({
                    props: e,
                    name: "MuiLink"
                }),
                {
                    className: r,
                    color: n = "primary",
                    component: a = "a",
                    onBlur: u,
                    onFocus: f,
                    TypographyClasses: y,
                    underline: w = "always",
                    variant: S = "inherit",
                    sx: k
                } = s,
                C = (0, i._)(s, x),
                {
                    isFocusVisibleRef: P,
                    onBlur: U,
                    onFocus: T,
                    ref: A
                } = (0, h.u)(),
                [M, R] = o.useState(!1),
                _ = (0, m.u)(t, A),
                I = (0, l._)({}, s, {
                    color: n,
                    component: a,
                    focusVisible: M,
                    underline: w,
                    variant: S
                }),
                j = (e => {
                    let {
                        classes: t,
                        component: o,
                        focusVisible: s,
                        underline: r
                    } = e, n = {
                        root: ["root", "underline".concat((0, i.a)(r)), "button" === o && "button", s && "focusVisible"]
                    };
                    return (0, c.a)(n, b, t)
                })(I);
            return (0, p.jsx)(g, (0, l._)({
                color: n,
                className: (0, c.c)(j.root, r),
                classes: y,
                component: a,
                onBlur: e => {
                    U(e), !1 === P.current && R(!1), u && u(e)
                },
                onFocus: e => {
                    T(e), !0 === P.current && R(!0), f && f(e)
                },
                ref: _,
                ownerState: I,
                variant: S,
                sx: [...Object.keys(v).includes(n) ? [] : [{
                    color: n
                }], ...Array.isArray(k) ? k : [k]]
            }, C))
        });
    var w = (0, r.default)({
            name: "Link"
        })(function(e) {
            return {
                root: {
                    fontWeight: e.typography.fontWeightMedium,
                    textUnderlineOffset: 4
                },
                colorInherit: {
                    color: "inherit"
                },
                colorPrimary: {
                    color: e.palette.content.action
                }
            }
        }),
        S = (0, o.forwardRef)(function(e, r) {
            var i = e.classes,
                l = e.underline,
                c = e.color,
                a = void 0 === c ? "primary" : c,
                p = e.className,
                u = (0, t.a)(e, ["classes", "underline", "color", "className"]),
                d = w(void 0, {
                    props: {
                        classes: (0, n.default)(i, p)
                    }
                }),
                h = d.classes,
                m = d.cx;
            return o.default.createElement(y, (0, t._)({}, u, {
                classes: (0, t._)((0, t._)({}, h), {
                    root: m(h["color".concat((0, s.capitalize)(a))], h.root, null == i ? void 0 : i.root)
                }),
                underline: void 0 === l ? "hover" : l,
                color: a,
                ref: r
            }))
        });
    e.s(["Link", 0, S], 982234)
}, 645909, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["OpenInNewIcon", () => t.OpenInNew])
}, 988012, 189498, e => {
    "use strict";
    var t = e.i(865800),
        o = e.i(416340),
        s = e.i(614515),
        r = e.i(993807),
        n = e.i(232625),
        i = e.i(79559);
    e.i(221628);
    var l = (0, s.default)({
            name: "IconButton"
        })(function(e, o) {
            var s, r, l, c, a, p, u, d, h, m, b = o.color,
                f = o.variant,
                v = {
                    color: e.palette.actionV2.primaryBrand.fill
                },
                x = {
                    color: e.palette.content.standard
                },
                g = {
                    color: e.palette.content.alert.important
                };
            return "contained" === f && (Object.assign(v, ((s = {
                color: e.palette.content.static.light,
                backgroundColor: e.palette.actionV2.primaryBrand.fill
            })["&:hover, &.".concat(n.b.focusVisible, " .").concat(n.t.root)] = {
                backgroundColor: e.palette.actionV2.primaryBrand.containedHoverFocus
            }, s)), Object.assign(x, ((r = {
                color: e.palette.content.inverse,
                backgroundColor: e.palette.actionV2.primary.fill
            })["&:hover, &.".concat(n.b.focusVisible, " .").concat(n.t.root)] = {
                backgroundColor: e.palette.actionV2.primary.containedHoverFocus
            }, r)), Object.assign(g, ((l = {
                color: e.palette.content.static.light,
                backgroundColor: e.palette.actionV2.important.fill
            })["&:hover, &.".concat(n.b.focusVisible, " .").concat(n.t.root)] = {
                backgroundColor: e.palette.actionV2.important.containedHoverFocus
            }, l))), "onMediaLight" === b || "onMediaDark" === b ? ((c = {
                backdropFilter: "blur(5px)",
                "-webkit-backdrop-filter": "blur(5px)",
                color: e.palette.content.static.light,
                backgroundColor: "transparent",
                "&:hover": {
                    backgroundColor: e.palette.components.mediaButtons[b].hover
                }
            })["&.".concat(n.b.focusVisible)] = {
                zIndex: 0,
                backgroundColor: e.palette.components.mediaButtons[b].focus
            }, c["&.".concat(n.b.focusVisible, " .").concat(n.t.root)] = {
                zIndex: -1,
                color: e.palette.components.mediaButtons[b].focus
            }, c["&.".concat(i.i.disabled)] = {
                color: e.palette.states.disabled
            }, m = c, "contained" === f && Object.assign(m, ((a = {
                backgroundColor: e.palette.components.mediaButtons[b].fill
            })["&.".concat(i.i.disabled)] = (0, t._)((0, t._)({}, m["&.".concat(i.i.disabled)]), {
                backgroundColor: e.palette.components.mediaButtons[b].fill
            }), a))) : ((p = {})["&.".concat(n.b.focusVisible)] = {
                zIndex: 0
            }, p["&.".concat(n.b.focusVisible, " .").concat(n.t.root)] = {
                zIndex: -1
            }, p["&.".concat(i.i.disabled)] = {
                color: e.palette.states.disabled
            }, m = p, "default" === b && Object.assign(m, ((u = {
                color: e.palette.states.active,
                "&:hover": {
                    color: e.palette.content.standard,
                    backgroundColor: e.palette.states.hover
                }
            })["&.".concat(n.b.focusVisible, " .").concat(n.t.root)] = {
                color: e.palette.content.standard,
                backgroundColor: e.palette.states.focus
            }, u)), "contained" === f && Object.assign(m, ((d = {
                backgroundColor: e.palette.actionV2.secondary.fill,
                "&:hover": (0, t._)((0, t._)({}, m["&:hover"]), {
                    backgroundColor: e.palette.actionV2.secondary.containedHoverFocus
                })
            })["&.".concat(i.i.disabled)] = (0, t._)((0, t._)({}, m["&.".concat(i.i.disabled)]), {
                backgroundColor: e.palette.states.disabledBackground
            }), d)), "outlined" === f && Object.assign(m, (0, t._)((0, t._)({}, e.border.radius.circle), ((h = {
                border: "1px solid ".concat(e.palette.surface.outline),
                "&:hover": (0, t._)((0, t._)({}, m["&:hover"]), {
                    backgroundColor: e.palette.states.hover
                })
            })["&.".concat(n.b.focusVisible, " .").concat(n.t.root)] = {
                backgroundColor: e.palette.states.focus
            }, h)))), {
                root: m,
                colorPrimary: v,
                colorSecondary: x,
                colorError: g,
                sizeSmall: {
                    padding: 4
                }
            }
        }),
        c = (0, o.forwardRef)(function(e, s) {
            var n = e.children,
                c = e.classes,
                a = e.className,
                p = e.color,
                u = void 0 === p ? "primary" : p,
                d = e.variant,
                h = (0, t.a)(e, ["children", "classes", "className", "color", "variant"]),
                m = l({
                    color: u,
                    variant: void 0 === d ? "default" : d
                }, {
                    props: {
                        classes: (0, r.default)(c, a)
                    }
                }),
                b = "onMediaLight" === u || "onMediaDark" === u ? "default" : u;
            return o.default.createElement(i.I, (0, t._)({}, h, {
                classes: m.classes,
                color: b,
                ref: s
            }), n)
        });
    e.s(["default", 0, c], 189498), e.s(["IconButton", 0, c], 988012)
}, 169722, 217198, e => {
    "use strict";
    var t = e.i(865800),
        o = e.i(416340),
        s = e.i(614515),
        r = e.i(993807),
        n = e.i(273589),
        i = e.i(962560),
        l = e.i(42569),
        c = e.i(652199),
        a = e.i(696180),
        p = e.i(221628),
        u = e.i(963320);
    let d = o.createContext();

    function h(e) {
        return (0, n.g)("MuiGrid", e)
    }
    let m = ["auto", !0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    var b = (0, a.g)("MuiGrid", ["root", "container", "item", "zeroMinWidth", ...[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(e => "spacing-xs-".concat(e)), ...["column-reverse", "column", "row-reverse", "row"].map(e => "direction-xs-".concat(e)), ...["nowrap", "wrap-reverse", "wrap"].map(e => "wrap-xs-".concat(e)), ...m.map(e => "grid-xs-".concat(e)), ...m.map(e => "grid-sm-".concat(e)), ...m.map(e => "grid-md-".concat(e)), ...m.map(e => "grid-lg-".concat(e)), ...m.map(e => "grid-xl-".concat(e))]);
    let f = ["className", "columns", "columnSpacing", "component", "container", "direction", "item", "rowSpacing", "spacing", "wrap", "zeroMinWidth"];

    function v(e) {
        let t = parseFloat(e);
        return "".concat(t).concat(String(e).replace(String(t), "") || "px")
    }

    function x(e) {
        let {
            breakpoints: t,
            values: o
        } = e, s = "";
        Object.keys(o).forEach(e => {
            "" === s && 0 !== o[e] && (s = e)
        });
        let r = Object.keys(t).sort((e, o) => t[e] - t[o]);
        return r.slice(0, r.indexOf(s))
    }
    let g = (0, l.s)("div", {
            name: "MuiGrid",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: o
                } = e, {
                    container: s,
                    direction: r,
                    item: n,
                    spacing: i,
                    wrap: l,
                    zeroMinWidth: c,
                    breakpoints: a
                } = o, p = [];
                s && (p = function(e, t) {
                    let o = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    if (!e || e <= 0) return [];
                    if ("string" == typeof e && !Number.isNaN(Number(e)) || "number" == typeof e) return [o["spacing-xs-".concat(String(e))]];
                    let s = [];
                    return t.forEach(t => {
                        let r = e[t];
                        Number(r) > 0 && s.push(o["spacing-".concat(t, "-").concat(String(r))])
                    }), s
                }(i, a, t));
                let u = [];
                return a.forEach(e => {
                    let s = o[e];
                    s && u.push(t["grid-".concat(e, "-").concat(String(s))])
                }), [t.root, s && t.container, n && t.item, c && t.zeroMinWidth, ...p, "row" !== r && t["direction-xs-".concat(String(r))], "wrap" !== l && t["wrap-xs-".concat(String(l))], ...u]
            }
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, i._)({
                boxSizing: "border-box"
            }, t.container && {
                display: "flex",
                flexWrap: "wrap",
                width: "100%"
            }, t.item && {
                margin: 0
            }, t.zeroMinWidth && {
                minWidth: 0
            }, "wrap" !== t.wrap && {
                flexWrap: t.wrap
            })
        }, function(e) {
            let {
                theme: t,
                ownerState: o
            } = e, s = (0, n.r)({
                values: o.direction,
                breakpoints: t.breakpoints.values
            });
            return (0, n.m)({
                theme: t
            }, s, e => {
                let t = {
                    flexDirection: e
                };
                return 0 === e.indexOf("column") && (t["& > .".concat(b.item)] = {
                    maxWidth: "none"
                }), t
            })
        }, function(e) {
            let {
                theme: t,
                ownerState: o
            } = e, {
                container: s,
                rowSpacing: r
            } = o, i = {};
            if (s && 0 !== r) {
                let e, o = (0, n.r)({
                    values: r,
                    breakpoints: t.breakpoints.values
                });
                "object" == typeof o && (e = x({
                    breakpoints: t.breakpoints.values,
                    values: o
                })), i = (0, n.m)({
                    theme: t
                }, o, (o, s) => {
                    var r;
                    let n = t.spacing(o);
                    return "0px" !== n ? {
                        marginTop: "-".concat(v(n)),
                        ["& > .".concat(b.item)]: {
                            paddingTop: v(n)
                        }
                    } : null != (r = e) && r.includes(s) ? {} : {
                        marginTop: 0,
                        ["& > .".concat(b.item)]: {
                            paddingTop: 0
                        }
                    }
                })
            }
            return i
        }, function(e) {
            let {
                theme: t,
                ownerState: o
            } = e, {
                container: s,
                columnSpacing: r
            } = o, i = {};
            if (s && 0 !== r) {
                let e, o = (0, n.r)({
                    values: r,
                    breakpoints: t.breakpoints.values
                });
                "object" == typeof o && (e = x({
                    breakpoints: t.breakpoints.values,
                    values: o
                })), i = (0, n.m)({
                    theme: t
                }, o, (o, s) => {
                    var r;
                    let n = t.spacing(o);
                    return "0px" !== n ? {
                        width: "calc(100% + ".concat(v(n), ")"),
                        marginLeft: "-".concat(v(n)),
                        ["& > .".concat(b.item)]: {
                            paddingLeft: v(n)
                        }
                    } : null != (r = e) && r.includes(s) ? {} : {
                        width: "100%",
                        marginLeft: 0,
                        ["& > .".concat(b.item)]: {
                            paddingLeft: 0
                        }
                    }
                })
            }
            return i
        }, function(e) {
            let t, {
                theme: o,
                ownerState: s
            } = e;
            return o.breakpoints.keys.reduce((e, r) => {
                let l = {};
                if (s[r] && (t = s[r]), !t) return e;
                if (!0 === t) l = {
                    flexBasis: 0,
                    flexGrow: 1,
                    maxWidth: "100%"
                };
                else if ("auto" === t) l = {
                    flexBasis: "auto",
                    flexGrow: 0,
                    flexShrink: 0,
                    maxWidth: "none",
                    width: "auto"
                };
                else {
                    let c = (0, n.r)({
                            values: s.columns,
                            breakpoints: o.breakpoints.values
                        }),
                        a = "object" == typeof c ? c[r] : c;
                    if (null == a) return e;
                    let p = Math.round(t / a * 1e8) / 1e6 + "%",
                        u = {};
                    if (s.container && s.item && 0 !== s.columnSpacing) {
                        let e = o.spacing(s.columnSpacing);
                        if ("0px" !== e) {
                            let t = "calc(".concat(p, " + ").concat(v(e), ")");
                            u = {
                                flexBasis: t,
                                maxWidth: t
                            }
                        }
                    }
                    l = (0, i._)({
                        flexBasis: p,
                        flexGrow: 0,
                        maxWidth: p
                    }, u)
                }
                return 0 === o.breakpoints.values[r] ? Object.assign(e, l) : e[o.breakpoints.up(r)] = l, e
            }, {})
        }),
        y = o.forwardRef(function(e, t) {
            let s = (0, u.u)({
                    props: e,
                    name: "MuiGrid"
                }),
                {
                    breakpoints: r
                } = (0, c.u)(),
                a = (0, l.e)(s),
                {
                    className: m,
                    columns: b,
                    columnSpacing: v,
                    component: x = "div",
                    container: y = !1,
                    direction: w = "row",
                    item: S = !1,
                    rowSpacing: k,
                    spacing: C = 0,
                    wrap: P = "wrap",
                    zeroMinWidth: U = !1
                } = a,
                T = (0, n._)(a, f),
                A = k || C,
                M = v || C,
                R = o.useContext(d),
                _ = y ? b || 12 : R,
                I = {},
                j = (0, i._)({}, T);
            r.keys.forEach(e => {
                null != T[e] && (I[e] = T[e], delete j[e])
            });
            let O = (0, i._)({}, a, {
                    columns: _,
                    container: y,
                    direction: w,
                    item: S,
                    rowSpacing: A,
                    columnSpacing: M,
                    wrap: P,
                    zeroMinWidth: U,
                    spacing: C
                }, I, {
                    breakpoints: r.keys
                }),
                E = (e => {
                    let {
                        classes: t,
                        container: o,
                        direction: s,
                        item: r,
                        spacing: n,
                        wrap: i,
                        zeroMinWidth: c,
                        breakpoints: a
                    } = e, p = [];
                    o && (p = function(e, t) {
                        if (!e || e <= 0) return [];
                        if ("string" == typeof e && !Number.isNaN(Number(e)) || "number" == typeof e) return ["spacing-xs-".concat(String(e))];
                        let o = [];
                        return t.forEach(t => {
                            let s = e[t];
                            if (Number(s) > 0) {
                                let e = "spacing-".concat(t, "-").concat(String(s));
                                o.push(e)
                            }
                        }), o
                    }(n, a));
                    let u = [];
                    a.forEach(t => {
                        let o = e[t];
                        o && u.push("grid-".concat(t, "-").concat(String(o)))
                    });
                    let d = {
                        root: ["root", o && "container", r && "item", c && "zeroMinWidth", ...p, "row" !== s && "direction-xs-".concat(String(s)), "wrap" !== i && "wrap-xs-".concat(String(i)), ...u]
                    };
                    return (0, l.a)(d, h, t)
                })(O);
            return (0, p.jsx)(d.Provider, {
                value: _,
                children: (0, p.jsx)(g, (0, i._)({
                    ownerState: O,
                    className: (0, l.c)(E.root, m),
                    as: x,
                    ref: t
                }, j))
            })
        });
    e.s(["G", 0, y, "g", 0, b], 217198);
    var w = (0, s.default)({
            name: "Grid"
        })(function(e, t) {
            var o, s = t.direction;
            return {
                root: ((o = {})["& > .".concat(b.item)] = {
                    maxWidth: "column" === s || "column-reverse" === s ? "100%" : void 0
                }, o)
            }
        }),
        S = (0, o.forwardRef)(function(e, s) {
            var n = e.children,
                i = e.classes,
                l = e.className,
                c = (0, t.a)(e, ["children", "classes", "className"]),
                a = w(c, {
                    props: {
                        classes: (0, r.default)(i, l)
                    }
                });
            return o.default.createElement(y, (0, t._)({}, c, {
                classes: a.classes,
                ref: s
            }), n)
        });
    e.s(["Grid", 0, S], 169722)
}, 899391, (e, t, o) => {
    "use strict";

    function s(e, t, o, s) {
        return !1
    }
    Object.defineProperty(o, "__esModule", {
        value: !0
    }), Object.defineProperty(o, "getDomainLocale", {
        enumerable: !0,
        get: function() {
            return s
        }
    }), e.r(768766), ("function" == typeof o.default || "object" == typeof o.default && null !== o.default) && void 0 === o.default.__esModule && (Object.defineProperty(o.default, "__esModule", {
        value: !0
    }), Object.assign(o.default, o), t.exports = o.default)
}, 697765, (e, t, o) => {
    "use strict";
    Object.defineProperty(o, "__esModule", {
        value: !0
    }), Object.defineProperty(o, "useIntersection", {
        enumerable: !0,
        get: function() {
            return c
        }
    });
    let s = e.r(416340),
        r = e.r(479907),
        n = "function" == typeof IntersectionObserver,
        i = new Map,
        l = [];

    function c(e) {
        let {
            rootRef: t,
            rootMargin: o,
            disabled: c
        } = e, a = c || !n, [p, u] = (0, s.useState)(!1), d = (0, s.useRef)(null), h = (0, s.useCallback)(e => {
            d.current = e
        }, []);
        return (0, s.useEffect)(() => {
            if (n) {
                if (a || p) return;
                let e = d.current;
                if (e && e.tagName) return function(e, t, o) {
                    let {
                        id: s,
                        observer: r,
                        elements: n
                    } = function(e) {
                        let t, o = {
                                root: e.root || null,
                                margin: e.rootMargin || ""
                            },
                            s = l.find(e => e.root === o.root && e.margin === o.margin);
                        if (s && (t = i.get(s))) return t;
                        let r = new Map;
                        return t = {
                            id: o,
                            observer: new IntersectionObserver(e => {
                                e.forEach(e => {
                                    let t = r.get(e.target),
                                        o = e.isIntersecting || e.intersectionRatio > 0;
                                    t && o && t(o)
                                })
                            }, e),
                            elements: r
                        }, l.push(o), i.set(o, t), t
                    }(o);
                    return n.set(e, t), r.observe(e),
                        function() {
                            if (n.delete(e), r.unobserve(e), 0 === n.size) {
                                r.disconnect(), i.delete(s);
                                let e = l.findIndex(e => e.root === s.root && e.margin === s.margin);
                                e > -1 && l.splice(e, 1)
                            }
                        }
                }(e, e => e && u(e), {
                    root: null == t ? void 0 : t.current,
                    rootMargin: o
                })
            } else if (!p) {
                let e = (0, r.requestIdleCallback)(() => u(!0));
                return () => (0, r.cancelIdleCallback)(e)
            }
        }, [a, o, t, p, d.current]), [h, p, (0, s.useCallback)(() => {
            u(!1)
        }, [])]
    }("function" == typeof o.default || "object" == typeof o.default && null !== o.default) && void 0 === o.default.__esModule && (Object.defineProperty(o.default, "__esModule", {
        value: !0
    }), Object.assign(o.default, o), t.exports = o.default)
}, 84069, (e, t, o) => {
    "use strict";
    Object.defineProperty(o, "__esModule", {
        value: !0
    }), Object.defineProperty(o, "useMergedRef", {
        enumerable: !0,
        get: function() {
            return r
        }
    });
    let s = e.r(416340);

    function r(e, t) {
        let o = (0, s.useRef)(null),
            r = (0, s.useRef)(null);
        return (0, s.useCallback)(s => {
            if (null === s) {
                let e = o.current;
                e && (o.current = null, e());
                let t = r.current;
                t && (r.current = null, t())
            } else e && (o.current = n(e, s)), t && (r.current = n(t, s))
        }, [e, t])
    }

    function n(e, t) {
        if ("function" != typeof e) return e.current = t, () => {
            e.current = null
        };
        {
            let o = e(t);
            return "function" == typeof o ? o : () => e(null)
        }
    }("function" == typeof o.default || "object" == typeof o.default && null !== o.default) && void 0 === o.default.__esModule && (Object.defineProperty(o.default, "__esModule", {
        value: !0
    }), Object.assign(o.default, o), t.exports = o.default)
}, 917501, (e, t, o) => {
    "use strict";
    Object.defineProperty(o, "__esModule", {
        value: !0
    });
    var s = {
        default: function() {
            return C
        },
        useLinkStatus: function() {
            return k
        }
    };
    for (var r in s) Object.defineProperty(o, r, {
        enumerable: !0,
        get: s[r]
    });
    let n = e.r(887602),
        i = e.r(221628),
        l = n._(e.r(416340)),
        c = e.r(990504),
        a = e.r(808064),
        p = e.r(989251),
        u = e.r(396326),
        d = e.r(875052),
        h = e.r(35391),
        m = e.r(697765),
        b = e.r(899391),
        f = e.r(333626),
        v = e.r(84069),
        x = new Set;

    function g(e, t, o, s) {
        if (!("u" < typeof window) && (0, a.isLocalURL)(t)) {
            if (!s.bypassPrefetchedCheck) {
                let r = t + "%" + o + "%" + (void 0 !== s.locale ? s.locale : "locale" in e ? e.locale : void 0);
                if (x.has(r)) return;
                x.add(r)
            }
            e.prefetch(t, o, s).catch(e => {})
        }
    }

    function y(e) {
        return "string" == typeof e ? e : (0, p.formatUrl)(e)
    }
    let w = l.default.forwardRef(function(e, t) {
            let o, s, {
                href: r,
                as: n,
                children: p,
                prefetch: x = null,
                passHref: w,
                replace: S,
                shallow: k,
                scroll: C,
                locale: P,
                onClick: U,
                onNavigate: T,
                onMouseEnter: A,
                onTouchStart: M,
                legacyBehavior: R = !1,
                transitionTypes: _,
                ...I
            } = e;
            o = p, R && ("string" == typeof o || "number" == typeof o) && (o = (0, i.jsx)("a", {
                children: o
            }));
            let j = l.default.useContext(h.RouterContext),
                O = !1 !== x,
                {
                    href: E,
                    as: V
                } = l.default.useMemo(() => {
                    if (!j) {
                        let e = y(r);
                        return {
                            href: e,
                            as: n ? y(n) : e
                        }
                    }
                    let [e, t] = (0, c.resolveHref)(j, r, !0);
                    return {
                        href: e,
                        as: n ? (0, c.resolveHref)(j, n) : t || e
                    }
                }, [j, r, n]),
                B = l.default.useRef(E),
                D = l.default.useRef(V);
            R && (s = l.default.Children.only(o));
            let N = R ? s && "object" == typeof s && s.ref : t,
                [L, W, F] = (0, m.useIntersection)({
                    rootMargin: "200px"
                }),
                G = l.default.useCallback(e => {
                    (D.current !== V || B.current !== E) && (F(), D.current = V, B.current = E), L(e)
                }, [V, E, F, L]),
                z = (0, v.useMergedRef)(G, N);
            l.default.useEffect(() => {
                !j || W && O && g(j, E, V, {
                    bypassPrefetchedCheck: !1,
                    locale: P
                })
            }, [V, E, W, P, O, null == j ? void 0 : j.locale, j]);
            let H = {
                ref: z,
                onClick(e) {
                    R || "function" != typeof U || U(e), R && s.props && "function" == typeof s.props.onClick && s.props.onClick(e), !j || e.defaultPrevented || function(e, t, o, s, r, n, i, l, c) {
                        let p, {
                            nodeName: u
                        } = e.currentTarget;
                        if (!("A" === u.toUpperCase() && ((p = e.currentTarget.getAttribute("target")) && "_self" !== p || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey || e.nativeEvent && 2 === e.nativeEvent.which) || e.currentTarget.hasAttribute("download"))) {
                            if (!(0, a.isLocalURL)(o)) {
                                r && (e.preventDefault(), location.replace(o));
                                return
                            }
                            e.preventDefault(), (() => {
                                if (c) {
                                    let e = !1;
                                    if (c({
                                            preventDefault: () => {
                                                e = !0
                                            }
                                        }), e) return
                                }
                                let e = null == i || i;
                                "beforePopState" in t ? t[r ? "replace" : "push"](o, s, {
                                    shallow: n,
                                    locale: l,
                                    scroll: e
                                }) : t[r ? "replace" : "push"](s || o, {
                                    scroll: e
                                })
                            })()
                        }
                    }(e, j, E, V, S, k, C, P, T)
                },
                onMouseEnter(e) {
                    R || "function" != typeof A || A(e), R && s.props && "function" == typeof s.props.onMouseEnter && s.props.onMouseEnter(e), j && g(j, E, V, {
                        locale: P,
                        priority: !0,
                        bypassPrefetchedCheck: !0
                    })
                },
                onTouchStart: function(e) {
                    R || "function" != typeof M || M(e), R && s.props && "function" == typeof s.props.onTouchStart && s.props.onTouchStart(e), j && g(j, E, V, {
                        locale: P,
                        priority: !0,
                        bypassPrefetchedCheck: !0
                    })
                }
            };
            if ((0, u.isAbsoluteUrl)(V)) H.href = V;
            else if (!R || w || "a" === s.type && !("href" in s.props)) {
                let e = void 0 !== P ? P : null == j ? void 0 : j.locale;
                H.href = (null == j ? void 0 : j.isLocaleDomain) && (0, b.getDomainLocale)(V, e, null == j ? void 0 : j.locales, null == j ? void 0 : j.domainLocales) || (0, f.addBasePath)((0, d.addLocale)(V, e, null == j ? void 0 : j.defaultLocale))
            }
            return R ? l.default.cloneElement(s, H) : (0, i.jsx)("a", {
                ...I,
                ...H,
                children: o
            })
        }),
        S = (0, l.createContext)({
            pending: !1
        }),
        k = () => (0, l.useContext)(S),
        C = w;
    ("function" == typeof o.default || "object" == typeof o.default && null !== o.default) && void 0 === o.default.__esModule && (Object.defineProperty(o.default, "__esModule", {
        value: !0
    }), Object.assign(o.default, o), t.exports = o.default)
}, 780481, (e, t, o) => {
    t.exports = e.r(917501)
}, 237401, (e, t, o) => {
    t.exports = e.r(761438)
}, 260022, e => {
    "use strict";
    let t = {
        accountSessionProtectionHelpArticle: {
            global: {
                development: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                sitetest3: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                sitetest2: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                sitetest1: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                production: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        aiBasedToolsSupplementalTermsAndDisclaimer: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                production: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorsRestrictionsOnUse: {
            global: {
                development: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                sitetest3: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                sitetest2: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                sitetest1: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                production: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        agreementsManagerUrl: {
            global: {
                development: "https://content-licensing-public-test.simulpong.com",
                sitetest3: "https://content-licensing-public-test.simulpong.com",
                sitetest2: "https://content-licensing-public-test.simulpong.com",
                sitetest1: "https://content-licensing-public-test.simulpong.com",
                production: "https://agreements-manageraws.rbxcdn.com"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        devForumWAYWOCInspirationUrl: {
            global: {
                development: "http://devforum.roblox.com/waywoc",
                sitetest3: "http://devforum.roblox.com/waywoc",
                sitetest2: "http://devforum.roblox.com/waywoc",
                sitetest1: "http://devforum.roblox.com/waywoc",
                production: "http://devforum.roblox.com/waywoc"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        shopifyMerchantUrl: {
            global: {
                development: "https://apps.shopify.com/roblox",
                sitetest3: "https://apps.shopify.com/roblox",
                sitetest2: "https://apps.shopify.com/roblox",
                sitetest1: "https://apps.shopify.com/roblox",
                production: "https://apps.shopify.com/roblox"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        copyrightFairUseUrl: {
            global: {
                development: "https://copyright.gov/fair-use/",
                sitetest3: "https://copyright.gov/fair-use/",
                sitetest2: "https://copyright.gov/fair-use/",
                sitetest1: "https://copyright.gov/fair-use/",
                production: "https://copyright.gov/fair-use/"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        aboutUsUrl: {
            global: {
                development: "https://www.roblox.com/info/about-us",
                sitetest3: "https://www.roblox.com/info/about-us",
                sitetest2: "https://www.roblox.com/info/about-us",
                sitetest1: "https://www.roblox.com/info/about-us",
                production: "https://www.roblox.com/info/about-us"
            },
            luobu: {
                development: "https://corp.roblox.cn/",
                sitetest3: "https://corp.roblox.cn/",
                sitetest2: "https://corp.roblox.cn/",
                sitetest1: "https://corp.roblox.cn/",
                production: "https://corp.roblox.cn/"
            }
        },
        joinUsUrl: {
            global: {
                development: "https://www.roblox.com/info/jobs",
                sitetest3: "https://www.roblox.com/info/jobs",
                sitetest2: "https://www.roblox.com/info/jobs",
                sitetest1: "https://www.roblox.com/info/jobs",
                production: "https://www.roblox.com/info/jobs"
            },
            luobu: {
                development: "https://corp.roblox.cn/career/",
                sitetest3: "https://corp.roblox.cn/career/",
                sitetest2: "https://corp.roblox.cn/career/",
                sitetest1: "https://corp.roblox.cn/career/",
                production: "https://corp.roblox.cn/career/"
            }
        },
        termsOfServiceUrl: {
            global: {
                development: "https://www.roblox.com/info/terms",
                sitetest3: "https://www.roblox.com/info/terms",
                sitetest2: "https://www.roblox.com/info/terms",
                sitetest1: "https://www.roblox.com/info/terms",
                production: "https://www.roblox.com/info/terms"
            },
            luobu: {
                development: "https://robloxdev.cn/dev-terms.html",
                sitetest3: "https://robloxdev.cn/dev-terms.html",
                sitetest2: "https://robloxdev.cn/dev-terms.html",
                sitetest1: "https://robloxdev.cn/dev-terms.html",
                production: "https://robloxdev.cn/dev-terms.html"
            }
        },
        privacyPolicyUrl: {
            global: {
                development: "https://www.roblox.com/info/privacy",
                sitetest3: "https://www.roblox.com/info/privacy",
                sitetest2: "https://www.roblox.com/info/privacy",
                sitetest1: "https://www.roblox.com/info/privacy",
                production: "https://www.roblox.com/info/privacy"
            },
            luobu: {
                development: "https://robloxdev.cn/dev-privacy-policy.html",
                sitetest3: "https://robloxdev.cn/dev-privacy-policy.html",
                sitetest2: "https://robloxdev.cn/dev-privacy-policy.html",
                sitetest1: "https://robloxdev.cn/dev-privacy-policy.html",
                production: "https://robloxdev.cn/dev-privacy-policy.html"
            }
        },
        accessibilityPolicyUrl: {
            global: {
                development: "https://www.roblox.com/info/accessibility",
                sitetest3: "https://www.roblox.com/info/accessibility",
                sitetest2: "https://www.roblox.com/info/accessibility",
                sitetest1: "https://www.roblox.com/info/accessibility",
                production: "https://www.roblox.com/info/accessibility"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        devexPolicyUrl: {
            global: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            },
            luobu: {
                development: "https://robloxdev.cn/dev-ex-policy.html",
                sitetest3: "https://robloxdev.cn/dev-ex-policy.html",
                sitetest2: "https://robloxdev.cn/dev-ex-policy.html",
                sitetest1: "https://robloxdev.cn/dev-ex-policy.html",
                production: "https://robloxdev.cn/dev-ex-policy.html"
            }
        },
        robloxCubeAnnouncementUrl: {
            global: {
                development: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                sitetest3: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                sitetest2: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                sitetest1: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                production: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleBadgesSpecialGameAwardsUrl: {
            global: {
                development: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                sitetest3: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                sitetest2: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                sitetest1: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                production: "https://developer.roblox.com/articles/Badges-Special-Game-Awards"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleProductsInGamePurchasesUrl: {
            global: {
                development: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                sitetest3: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                sitetest2: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                sitetest1: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                production: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleRedirectCreatePlaceAsyncUrl: {
            global: {
                development: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                sitetest3: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                sitetest2: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                sitetest1: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                production: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleCreateVipServerUrl: {
            global: {
                development: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                sitetest3: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                sitetest2: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                sitetest1: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                production: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleGamesAndPlacesUrl: {
            global: {
                development: "https://developer.roblox.com/en-us/articles/games-and-places",
                sitetest3: "https://developer.roblox.com/en-us/articles/games-and-places",
                sitetest2: "https://developer.roblox.com/en-us/articles/games-and-places",
                sitetest1: "https://developer.roblox.com/en-us/articles/games-and-places",
                production: "https://developer.roblox.com/en-us/articles/games-and-places"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        ugcSubscriptionTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/19694609252884/",
                sitetest3: "https://en.help.roblox.com/hc/articles/19694609252884/",
                sitetest2: "https://en.help.roblox.com/hc/articles/19694609252884/",
                sitetest1: "https://en.help.roblox.com/hc/articles/19694609252884/",
                production: "https://en.help.roblox.com/hc/articles/19694609252884/"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorStoreTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/21308223046932",
                sitetest3: "https://en.help.roblox.com/hc/articles/21308223046932",
                sitetest2: "https://en.help.roblox.com/hc/articles/21308223046932",
                sitetest1: "https://en.help.roblox.com/hc/articles/21308223046932",
                production: "https://en.help.roblox.com/hc/articles/21308223046932"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        accountVerificationUrl: {
            global: {
                development: "https://create.sitetest3.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                sitetest3: "https://create.sitetest3.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                sitetest2: "https://create.sitetest3.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                sitetest1: "https://create.sitetest1.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                production: "https://create.roblox.com/docs/en-us/production/publishing/account-verification#verify-through-government-id"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        audioUploadLicenseAgreementUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/23359485439124",
                sitetest3: "https://en.help.roblox.com/hc/articles/23359485439124",
                sitetest2: "https://en.help.roblox.com/hc/articles/23359485439124",
                sitetest1: "https://en.help.roblox.com/hc/articles/23359485439124",
                production: "https://en.help.roblox.com/hc/articles/23359485439124"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        audioThumbnailModerationUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                production: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        extendedServicesTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/37967848292500",
                sitetest3: "https://en.help.roblox.com/hc/articles/37967848292500",
                sitetest2: "https://en.help.roblox.com/hc/articles/37967848292500",
                sitetest1: "https://en.help.roblox.com/hc/articles/37967848292500",
                production: "https://en.help.roblox.com/hc/articles/37967848292500"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        robloxTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                production: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        advertisingStandardsUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                production: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorThirdPartyTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                production: "https://en.help.roblox.com/hc/en-us/articles/15887203369620"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        dataCollectionOptInUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                production: "https://en.help.roblox.com/hc/en-us/articles/18922542221076"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        robloxCommunityStandardsUrl: {
            global: {
                development: "https://about.roblox.com/community-standards",
                sitetest3: "https://about.roblox.com/community-standards",
                sitetest2: "https://about.roblox.com/community-standards",
                sitetest1: "https://about.roblox.com/community-standards",
                production: "https://about.roblox.com/community-standards"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorThirdPartyPolicyUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                production: "https://en.help.roblox.com/hc/en-us/articles/37924211313044"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorAnalyticsTermsOfUseUrl: {
            global: {
                development: "https://help.roblox.com/hc/articles/10949046065044",
                sitetest3: "https://help.roblox.com/hc/articles/10949046065044",
                sitetest2: "https://help.roblox.com/hc/articles/10949046065044",
                sitetest1: "https://help.roblox.com/hc/articles/10949046065044",
                production: "https://help.roblox.com/hc/articles/10949046065044"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        friendRewardsTermsOfUseUrl: {
            global: {
                development: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                sitetest3: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                sitetest2: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                sitetest1: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                production: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerExchangeHelpAndInformationPageUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                production: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        trustedConnectionsLearnMoreUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                production: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        templateUrl: {
            global: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        gameDetailsPageDocsUrl: {
            global: {
                development: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest3: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest2: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest1: "https://create.sitetest1.robloxlabs.com/docs/en-us/audio/assets#visibility",
                production: "https://create.roblox.com/docs/audio/assets#visibility"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        songEligibilityDocsUrl: {
            global: {
                development: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest3: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest2: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest1: "https://create.sitetest1.robloxlabs.com/docs/en-us/audio/assets#visibility",
                production: "https://create.roblox.com/docs/audio/assets#visibility"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        }
    };
    e.s(["getProductionCreatorHubUrl", 0, e => "luobu" === e ? "https://create.roblox.cn" : "https://create.roblox.com", "resolveUrl", 0, (e, o, s) => {
        var r, n;
        return (null == (n = t[e]) || null == (r = n[s]) ? void 0 : r[o]) || (console.warn("No URL found for ".concat(e, " in environment ").concat(o, " and target ").concat(s)), "")
    }])
}]);

//# debugId=aa880743-6db4-d094-5138-7dc271bfd1a0
//# sourceMappingURL=2lodxn3t9vzke.js.map
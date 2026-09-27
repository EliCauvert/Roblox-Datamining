;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f5b12c62-fe56-1ddb-36a6-e63b9df98984")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 272593, 650502, t => {
    "use strict";
    var o = t.i(677753),
        r = t.i(215955);

    function n(t) {
        return "https://".concat(t, ".").concat("roblox.com")
    }

    function i(t) {
        return "".concat("https://apis.roblox.com", "/").concat(t)
    }
    t.s(["getBEDEV1ServiceBasePath", 0, n, "getBEDEV2ServiceBasePath", 0, i], 650502), t.s(["createClientConfiguration", 0, function(t, s, a) {
        var l, c;
        let u = "bedev1" === s ? n(t) : i(t),
            p = null == (l = null == a ? void 0 : a.enableMrRouter) || l;
        return new o.Configuration({
            robloxSiteDomain: "roblox.com",
            basePath: u,
            credentials: null != (c = null == a ? void 0 : a.credentials) ? c : "include",
            unifiedLogger: r.default,
            enableMrRouter: p,
            ...(null == a ? void 0 : a.middleware) && {
                middleware: a.middleware
            },
            ...(null == a ? void 0 : a.enableBoundAuthToken) !== void 0 && {
                enableBoundAuthToken: a.enableBoundAuthToken
            },
            ...(null == a ? void 0 : a.boundAuthTokenLoadTimeout) !== void 0 && {
                boundAuthTokenLoadTimeout: a.boundAuthTokenLoadTimeout
            },
            ...(null == a ? void 0 : a.boundAuthTokenDataTimeout) !== void 0 && {
                boundAuthTokenDataTimeout: a.boundAuthTokenDataTimeout
            }
        })
    }], 272593)
}, 686762, t => {
    "use strict";
    var o = t.i(194250),
        r = t.i(416340),
        n = t.i(532045),
        i = t.i(863605),
        s = t.i(154502),
        a = t.i(690569),
        l = t.i(945146),
        c = t.i(251635),
        u = t.i(787802),
        p = t.i(221628),
        d = t.i(396249),
        m = t.i(121880),
        h = t.i(352705),
        b = t.i(710302);

    function f(t) {
        return (0, a.g)("MuiLink", t)
    }
    t.i(482979);
    var v = (0, u.g)("MuiLink", ["root", "underlineNone", "underlineHover", "underlineAlways", "button", "focusVisible"]);
    let g = {
            primary: "primary.main",
            textPrimary: "text.primary",
            secondary: "secondary.main",
            textSecondary: "text.secondary",
            error: "error.main"
        },
        x = ["className", "color", "component", "onBlur", "onFocus", "TypographyClasses", "underline", "variant", "sx"],
        y = (0, c.s)(d.T, {
            name: "MuiLink",
            slot: "Root",
            overridesResolver: (t, o) => {
                let {
                    ownerState: r
                } = t;
                return [o.root, o["underline".concat((0, a.a)(r.underline))], "button" === r.component && o.button]
            }
        })(t => {
            let {
                theme: o,
                ownerState: r
            } = t;
            return (0, l._)({}, "none" === r.underline && {
                textDecoration: "none"
            }, "hover" === r.underline && {
                textDecoration: "none",
                "&:hover": {
                    textDecoration: "underline"
                }
            }, "always" === r.underline && (0, l._)({
                textDecoration: "underline"
            }, "inherit" !== r.color && {
                textDecorationColor: (t => {
                    let o, {
                            theme: r,
                            ownerState: n
                        } = t,
                        i = g[o = n.color] || o,
                        s = (0, a.k)(r, "palette.".concat(i), !1) || n.color,
                        l = (0, a.k)(r, "palette.".concat(i, "Channel"));
                    return "vars" in r && l ? "rgba(".concat(l, " / 0.4)") : (0, a.b)(s, .4)
                })({
                    theme: o,
                    ownerState: r
                })
            }, {
                "&:hover": {
                    textDecorationColor: "inherit"
                }
            }), "button" === r.component && {
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
                ["&.".concat(v.focusVisible)]: {
                    outline: "auto"
                }
            })
        }),
        w = r.forwardRef(function(t, o) {
            let n = (0, m.u)({
                    props: t,
                    name: "MuiLink"
                }),
                {
                    className: i,
                    color: s = "primary",
                    component: u = "a",
                    onBlur: d,
                    onFocus: v,
                    TypographyClasses: w,
                    underline: S = "always",
                    variant: C = "inherit",
                    sx: P
                } = n,
                k = (0, a._)(n, x),
                {
                    isFocusVisibleRef: M,
                    onBlur: T,
                    onFocus: _,
                    ref: R
                } = (0, h.u)(),
                [E, O] = r.useState(!1),
                L = (0, b.u)(o, R),
                A = (0, l._)({}, n, {
                    color: s,
                    component: u,
                    focusVisible: E,
                    underline: S,
                    variant: C
                }),
                I = (t => {
                    let {
                        classes: o,
                        component: r,
                        focusVisible: n,
                        underline: i
                    } = t, s = {
                        root: ["root", "underline".concat((0, a.a)(i)), "button" === r && "button", n && "focusVisible"]
                    };
                    return (0, c.a)(s, f, o)
                })(A);
            return (0, p.jsx)(y, (0, l._)({
                color: s,
                className: (0, c.c)(I.root, i),
                classes: w,
                component: u,
                onBlur: t => {
                    T(t), !1 === M.current && O(!1), d && d(t)
                },
                onFocus: t => {
                    _(t), !0 === M.current && O(!0), v && v(t)
                },
                ref: L,
                ownerState: A,
                variant: C,
                sx: [...Object.keys(g).includes(s) ? [] : [{
                    color: s
                }], ...Array.isArray(P) ? P : [P]]
            }, k))
        });
    var S = (0, i.default)({
            name: "Link"
        })(function(t) {
            return {
                root: {
                    fontWeight: t.typography.fontWeightMedium,
                    textUnderlineOffset: 4
                },
                colorInherit: {
                    color: "inherit"
                },
                colorPrimary: {
                    color: t.palette.content.action
                }
            }
        }),
        C = (0, r.forwardRef)(function(t, i) {
            var a = t.classes,
                l = t.underline,
                c = t.color,
                u = void 0 === c ? "primary" : c,
                p = t.className,
                d = (0, o.a)(t, ["classes", "underline", "color", "className"]),
                m = S(void 0, {
                    props: {
                        classes: (0, s.default)(a, p)
                    }
                }),
                h = m.classes,
                b = m.cx;
            return r.default.createElement(w, (0, o._)({}, d, {
                classes: (0, o._)((0, o._)({}, h), {
                    root: b(h["color".concat((0, n.capitalize)(u))], h.root, null == a ? void 0 : a.root)
                }),
                underline: void 0 === l ? "hover" : l,
                color: u,
                ref: i
            }))
        });
    t.s(["Link", 0, C], 686762)
}, 355079, 291787, 346616, t => {
    "use strict";
    var o = t.i(945146),
        r = t.i(690569),
        n = t.i(416340);
    t.i(535072);
    var i = t.i(251635),
        s = t.i(977987),
        a = t.i(787802),
        l = t.i(221628),
        c = t.i(806009),
        u = t.i(770593),
        p = t.i(121880),
        d = t.i(710302),
        m = t.i(441872),
        h = t.i(942363),
        b = t.i(605503),
        f = t.i(15686),
        v = t.i(578143);
    t.i(465957), t.i(407110), t.i(164136), t.i(39651), t.i(482979);
    var g = t.i(577474),
        x = t.i(230505);
    let y = n.createContext({});

    function w(t) {
        return (0, r.g)("MuiList", t)
    }
    t.s(["L", 0, y], 291787), (0, a.g)("MuiList", ["root", "padding", "dense", "subheader"]);
    let S = ["children", "className", "component", "dense", "disablePadding", "subheader"],
        C = (0, i.s)("ul", {
            name: "MuiList",
            slot: "Root",
            overridesResolver: (t, o) => {
                let {
                    ownerState: r
                } = t;
                return [o.root, !r.disablePadding && o.padding, r.dense && o.dense, r.subheader && o.subheader]
            }
        })(t => {
            let {
                ownerState: r
            } = t;
            return (0, o._)({
                listStyle: "none",
                margin: 0,
                padding: 0,
                position: "relative"
            }, !r.disablePadding && {
                paddingTop: 8,
                paddingBottom: 8
            }, r.subheader && {
                paddingTop: 0
            })
        }),
        P = n.forwardRef(function(t, s) {
            let a = (0, p.u)({
                    props: t,
                    name: "MuiList"
                }),
                {
                    children: c,
                    className: u,
                    component: d = "ul",
                    dense: m = !1,
                    disablePadding: h = !1,
                    subheader: b
                } = a,
                f = (0, r._)(a, S),
                v = n.useMemo(() => ({
                    dense: m
                }), [m]),
                g = (0, o._)({}, a, {
                    component: d,
                    dense: m,
                    disablePadding: h
                }),
                x = (t => {
                    let {
                        classes: o,
                        disablePadding: r,
                        dense: n,
                        subheader: s
                    } = t;
                    return (0, i.a)({
                        root: ["root", !r && "padding", n && "dense", s && "subheader"]
                    }, w, o)
                })(g);
            return (0, l.jsx)(y.Provider, {
                value: v,
                children: (0, l.jsxs)(C, (0, o._)({
                    as: d,
                    className: (0, i.c)(x.root, u),
                    ref: s,
                    ownerState: g
                }, f, {
                    children: [b, c]
                }))
            })
        });
    t.s(["L", 0, P], 346616);
    let k = ["actions", "autoFocus", "autoFocusItem", "children", "className", "disabledItemsFocusable", "disableListWrap", "onKeyDown", "variant"];

    function M(t, o, r) {
        return t === o ? t.firstChild : o && o.nextElementSibling ? o.nextElementSibling : r ? null : t.firstChild
    }

    function T(t, o, r) {
        return t === o ? r ? t.firstChild : t.lastChild : o && o.previousElementSibling ? o.previousElementSibling : r ? null : t.lastChild
    }

    function _(t, o) {
        if (void 0 === o) return !0;
        let r = t.innerText;
        return void 0 === r && (r = t.textContent), 0 !== (r = r.trim().toLowerCase()).length && (o.repeating ? r[0] === o.keys[0] : 0 === r.indexOf(o.keys.join("")))
    }

    function R(t, o, r, n, i, s) {
        let a = !1,
            l = i(t, o, !!o && r);
        for (; l;) {
            if (l === t.firstChild) {
                if (a) return !1;
                a = !0
            }
            let o = !n && (l.disabled || "true" === l.getAttribute("aria-disabled"));
            if (l.hasAttribute("tabindex") && _(l, s) && !o) return l.focus(), !0;
            l = i(t, l, r)
        }
        return !1
    }
    let E = n.forwardRef(function(t, i) {
        let {
            actions: s,
            autoFocus: a = !1,
            autoFocusItem: u = !1,
            children: p,
            className: h,
            disabledItemsFocusable: b = !1,
            disableListWrap: f = !1,
            onKeyDown: v,
            variant: g = "selectedMenu"
        } = t, y = (0, r._)(t, k), w = n.useRef(null), S = n.useRef({
            keys: [],
            repeating: !0,
            previousKeyMatched: !0,
            lastTime: null
        });
        (0, x.u)(() => {
            a && w.current.focus()
        }, [a]), n.useImperativeHandle(s, () => ({
            adjustStyleForScrollbar: (t, o) => {
                let {
                    direction: r
                } = o, n = !w.current.style.width;
                if (t.clientHeight < w.current.clientHeight && n) {
                    let o = "".concat((0, c.g)((0, m.o)(t)), "px");
                    w.current.style["rtl" === r ? "paddingLeft" : "paddingRight"] = o, w.current.style.width = "calc(100% + ".concat(o, ")")
                }
                return w.current
            }
        }), []);
        let C = (0, d.u)(w, i),
            E = -1;
        n.Children.forEach(p, (t, o) => {
            n.isValidElement(t) ? (t.props.disabled || ("selectedMenu" === g && t.props.selected || -1 === E) && (E = o), E === o && (t.props.disabled || t.props.muiSkipListHighlight || t.type.muiSkipListHighlight) && (E += 1) >= p.length && (E = -1)) : E === o && (E += 1) >= p.length && (E = -1)
        });
        let O = n.Children.map(p, (t, o) => {
            if (o === E) {
                let o = {};
                return u && (o.autoFocus = !0), void 0 === t.props.tabIndex && "selectedMenu" === g && (o.tabIndex = 0), n.cloneElement(t, o)
            }
            return t
        });
        return (0, l.jsx)(P, (0, o._)({
            role: "menu",
            ref: C,
            className: h,
            onKeyDown: t => {
                let o = w.current,
                    r = t.key,
                    n = (0, m.o)(o).activeElement;
                if ("ArrowDown" === r) t.preventDefault(), R(o, n, f, b, M);
                else if ("ArrowUp" === r) t.preventDefault(), R(o, n, f, b, T);
                else if ("Home" === r) t.preventDefault(), R(o, null, f, b, M);
                else if ("End" === r) t.preventDefault(), R(o, null, f, b, T);
                else if (1 === r.length) {
                    let i = S.current,
                        s = r.toLowerCase(),
                        a = performance.now();
                    i.keys.length > 0 && (a - i.lastTime > 500 ? (i.keys = [], i.repeating = !0, i.previousKeyMatched = !0) : i.repeating && s !== i.keys[0] && (i.repeating = !1)), i.lastTime = a, i.keys.push(s);
                    let l = n && !i.repeating && _(n, i);
                    i.previousKeyMatched && (l || R(o, n, !1, b, M, i)) ? t.preventDefault() : i.previousKeyMatched = !1
                }
                v && v(t)
            },
            tabIndex: a ? 0 : -1
        }, y, {
            children: O
        }))
    });

    function O(t) {
        return (0, r.g)("MuiPopover", t)
    }(0, a.g)("MuiPopover", ["root", "paper"]);
    let L = ["onEntering"],
        A = ["action", "anchorEl", "anchorOrigin", "anchorPosition", "anchorReference", "children", "className", "container", "elevation", "marginThreshold", "open", "PaperProps", "slots", "slotProps", "transformOrigin", "TransitionComponent", "transitionDuration", "TransitionProps", "disableScrollLock"],
        I = ["slotProps"];

    function D(t, o) {
        let r = 0;
        return "number" == typeof o ? r = o : "center" === o ? r = t.height / 2 : "bottom" === o && (r = t.height), r
    }

    function j(t, o) {
        let r = 0;
        return "number" == typeof o ? r = o : "center" === o ? r = t.width / 2 : "right" === o && (r = t.width), r
    }

    function U(t) {
        return [t.horizontal, t.vertical].map(t => "number" == typeof t ? "".concat(t, "px") : t).join(" ")
    }

    function N(t) {
        return "function" == typeof t ? t() : t
    }
    let B = (0, i.s)(c.M, {
            name: "MuiPopover",
            slot: "Root",
            overridesResolver: (t, o) => o.root
        })({}),
        z = (0, i.s)(u.M, {
            name: "MuiPopover",
            slot: "Paper",
            overridesResolver: (t, o) => o.paper
        })({
            position: "absolute",
            overflowY: "auto",
            overflowX: "hidden",
            minWidth: 16,
            minHeight: 16,
            maxWidth: "calc(100% - 32px)",
            maxHeight: "calc(100% - 32px)",
            outline: 0
        }),
        F = n.forwardRef(function(t, s) {
            var a, c, u;
            let x = (0, p.u)({
                    props: t,
                    name: "MuiPopover"
                }),
                {
                    action: y,
                    anchorEl: w,
                    anchorOrigin: S = {
                        vertical: "top",
                        horizontal: "left"
                    },
                    anchorPosition: C,
                    anchorReference: P = "anchorEl",
                    children: k,
                    className: M,
                    container: T,
                    elevation: _ = 8,
                    marginThreshold: R = 16,
                    open: E,
                    PaperProps: F = {},
                    slots: V,
                    slotProps: W,
                    transformOrigin: H = {
                        vertical: "top",
                        horizontal: "left"
                    },
                    TransitionComponent: G = g.G,
                    transitionDuration: $ = "auto",
                    TransitionProps: {
                        onEntering: K
                    } = {},
                    disableScrollLock: X = !1
                } = x,
                Y = (0, r._)(x.TransitionProps, L),
                q = (0, r._)(x, A),
                J = null != (a = null == W ? void 0 : W.paper) ? a : F,
                Q = n.useRef(),
                Z = (0, d.u)(Q, J.ref),
                ee = (0, o._)({}, x, {
                    anchorOrigin: S,
                    anchorReference: P,
                    elevation: _,
                    marginThreshold: R,
                    externalPaperSlotProps: J,
                    transformOrigin: H,
                    TransitionComponent: G,
                    transitionDuration: $,
                    TransitionProps: Y
                }),
                et = (t => {
                    let {
                        classes: o
                    } = t;
                    return (0, i.a)({
                        root: ["root"],
                        paper: ["paper"]
                    }, O, o)
                })(ee),
                eo = n.useCallback(() => {
                    if ("anchorPosition" === P) return C;
                    let t = N(w),
                        o = (t && 1 === t.nodeType ? t : (0, m.o)(Q.current).body).getBoundingClientRect();
                    return {
                        top: o.top + D(o, S.vertical),
                        left: o.left + j(o, S.horizontal)
                    }
                }, [w, S.horizontal, S.vertical, C, P]),
                er = n.useCallback(t => ({
                    vertical: D(t, H.vertical),
                    horizontal: j(t, H.horizontal)
                }), [H.horizontal, H.vertical]),
                en = n.useCallback(t => {
                    let o = {
                            width: t.offsetWidth,
                            height: t.offsetHeight
                        },
                        r = er(o);
                    if ("none" === P) return {
                        top: null,
                        left: null,
                        transformOrigin: U(r)
                    };
                    let n = eo(),
                        i = n.top - r.vertical,
                        s = n.left - r.horizontal,
                        a = i + o.height,
                        l = s + o.width,
                        c = (0, h.o)(N(w)),
                        u = c.innerHeight - R,
                        p = c.innerWidth - R;
                    if (null !== R && i < R) {
                        let t = i - R;
                        i -= t, r.vertical += t
                    } else if (null !== R && a > u) {
                        let t = a - u;
                        i -= t, r.vertical += t
                    }
                    if (null !== R && s < R) {
                        let t = s - R;
                        s -= t, r.horizontal += t
                    } else if (l > p) {
                        let t = l - p;
                        s -= t, r.horizontal += t
                    }
                    return {
                        top: "".concat(Math.round(i), "px"),
                        left: "".concat(Math.round(s), "px"),
                        transformOrigin: U(r)
                    }
                }, [w, P, eo, er, R]),
                [ei, es] = n.useState(E),
                ea = n.useCallback(() => {
                    let t = Q.current;
                    if (!t) return;
                    let o = en(t);
                    null !== o.top && (t.style.top = o.top), null !== o.left && (t.style.left = o.left), t.style.transformOrigin = o.transformOrigin, es(!0)
                }, [en]);
            n.useEffect(() => (X && window.addEventListener("scroll", ea), () => window.removeEventListener("scroll", ea)), [w, X, ea]), n.useEffect(() => {
                E && ea()
            }), n.useImperativeHandle(y, () => E ? {
                updatePosition: () => {
                    ea()
                }
            } : null, [E, ea]), n.useEffect(() => {
                if (!E) return;
                let t = (0, b.d)(() => {
                        ea()
                    }),
                    o = (0, h.o)(w);
                return o.addEventListener("resize", t), () => {
                    t.clear(), o.removeEventListener("resize", t)
                }
            }, [w, E, ea]);
            let el = $;
            "auto" !== $ || G.muiSupportAuto || (el = void 0);
            let ec = T || (w ? (0, m.o)(N(w)).body : void 0),
                eu = null != (c = null == V ? void 0 : V.root) ? c : B,
                ep = null != (u = null == V ? void 0 : V.paper) ? u : z,
                ed = (0, f.u)({
                    elementType: ep,
                    externalSlotProps: (0, o._)({}, J, {
                        style: ei ? J.style : (0, o._)({}, J.style, {
                            opacity: 0
                        })
                    }),
                    additionalProps: {
                        elevation: _,
                        ref: Z
                    },
                    ownerState: ee,
                    className: (0, i.c)(et.paper, null == J ? void 0 : J.className)
                }),
                em = (0, f.u)({
                    elementType: eu,
                    externalSlotProps: (null == W ? void 0 : W.root) || {},
                    externalForwardedProps: q,
                    additionalProps: {
                        ref: s,
                        slotProps: {
                            backdrop: {
                                invisible: !0
                            }
                        },
                        container: ec,
                        open: E
                    },
                    ownerState: ee,
                    className: (0, i.c)(et.root, M)
                }),
                {
                    slotProps: eh
                } = em,
                eb = (0, r._)(em, I);
            return (0, l.jsx)(eu, (0, o._)({}, eb, !(0, v.i)(eu) && {
                slotProps: eh,
                disableScrollLock: X
            }, {
                children: (0, l.jsx)(G, (0, o._)({
                    appear: !0,
                    in: E,
                    onEntering: (t, o) => {
                        K && K(t, o), ea()
                    },
                    onExited: () => {
                        es(!1)
                    },
                    timeout: el
                }, Y, {
                    children: (0, l.jsx)(ep, (0, o._)({}, ed, {
                        children: k
                    }))
                }))
            }))
        });

    function V(t) {
        return (0, r.g)("MuiMenu", t)
    }(0, a.g)("MuiMenu", ["root", "paper", "list"]);
    let W = ["onEntering"],
        H = ["autoFocus", "children", "className", "disableAutoFocusItem", "MenuListProps", "onClose", "open", "PaperProps", "PopoverClasses", "transitionDuration", "TransitionProps", "variant", "slots", "slotProps"],
        G = {
            vertical: "top",
            horizontal: "right"
        },
        $ = {
            vertical: "top",
            horizontal: "left"
        },
        K = (0, i.s)(F, {
            shouldForwardProp: t => (0, i.r)(t) || "classes" === t,
            name: "MuiMenu",
            slot: "Root",
            overridesResolver: (t, o) => o.root
        })({}),
        X = (0, i.s)(z, {
            name: "MuiMenu",
            slot: "Paper",
            overridesResolver: (t, o) => o.paper
        })({
            maxHeight: "calc(100% - 96px)",
            WebkitOverflowScrolling: "touch"
        }),
        Y = (0, i.s)(E, {
            name: "MuiMenu",
            slot: "List",
            overridesResolver: (t, o) => o.list
        })({
            outline: 0
        }),
        q = n.forwardRef(function(t, a) {
            var c, u;
            let d = (0, p.u)({
                    props: t,
                    name: "MuiMenu"
                }),
                {
                    autoFocus: m = !0,
                    children: h,
                    className: b,
                    disableAutoFocusItem: v = !1,
                    MenuListProps: g = {},
                    onClose: x,
                    open: y,
                    PaperProps: w = {},
                    PopoverClasses: S,
                    transitionDuration: C = "auto",
                    TransitionProps: {
                        onEntering: P
                    } = {},
                    variant: k = "selectedMenu",
                    slots: M = {},
                    slotProps: T = {}
                } = d,
                _ = (0, r._)(d.TransitionProps, W),
                R = (0, r._)(d, H),
                E = (0, s.u)(),
                O = (0, o._)({}, d, {
                    autoFocus: m,
                    disableAutoFocusItem: v,
                    MenuListProps: g,
                    onEntering: P,
                    PaperProps: w,
                    transitionDuration: C,
                    TransitionProps: _,
                    variant: k
                }),
                L = (t => {
                    let {
                        classes: o
                    } = t;
                    return (0, i.a)({
                        root: ["root"],
                        paper: ["paper"],
                        list: ["list"]
                    }, V, o)
                })(O),
                A = m && !v && y,
                I = n.useRef(null),
                D = -1;
            n.Children.map(h, (t, o) => {
                n.isValidElement(t) && (t.props.disabled || ("selectedMenu" === k && t.props.selected || -1 === D) && (D = o))
            });
            let j = null != (c = M.paper) ? c : X,
                U = null != (u = T.paper) ? u : w,
                N = (0, f.u)({
                    elementType: M.root,
                    externalSlotProps: T.root,
                    ownerState: O,
                    className: [L.root, b]
                }),
                B = (0, f.u)({
                    elementType: j,
                    externalSlotProps: U,
                    ownerState: O,
                    className: L.paper
                });
            return (0, l.jsx)(K, (0, o._)({
                onClose: x,
                anchorOrigin: {
                    vertical: "bottom",
                    horizontal: E ? "right" : "left"
                },
                transformOrigin: E ? G : $,
                slots: {
                    paper: j,
                    root: M.root
                },
                slotProps: {
                    root: N,
                    paper: B
                },
                open: y,
                ref: a,
                transitionDuration: C,
                TransitionProps: (0, o._)({
                    onEntering: (t, o) => {
                        I.current && I.current.adjustStyleForScrollbar(t, {
                            direction: E ? "rtl" : "ltr"
                        }), P && P(t, o)
                    }
                }, _),
                ownerState: O
            }, R, {
                classes: S,
                children: (0, l.jsx)(Y, (0, o._)({
                    onKeyDown: t => {
                        "Tab" === t.key && (t.preventDefault(), x && x(t, "tabKeyDown"))
                    },
                    actions: I,
                    autoFocus: m && (-1 === D || v),
                    autoFocusItem: A,
                    variant: k
                }, g, {
                    className: (0, i.c)(L.list, g.className),
                    children: h
                }))
            }))
        });
    t.s(["M", 0, q, "a", 0, E], 355079)
}, 504415, t => {
    "use strict";
    var o = t.i(690569),
        r = t.i(945146),
        n = t.i(416340),
        i = t.i(251635),
        s = t.i(291787),
        a = t.i(931622),
        l = t.i(221628),
        c = t.i(690768),
        u = t.i(588763),
        p = t.i(355390),
        d = t.i(362297),
        m = t.i(121880),
        h = t.i(230505),
        b = t.i(710302);
    let f = ["autoFocus", "component", "dense", "divider", "disableGutters", "focusVisibleClassName", "role", "tabIndex", "className"],
        v = (0, i.s)(c.B, {
            shouldForwardProp: t => (0, i.r)(t) || "classes" === t,
            name: "MuiMenuItem",
            slot: "Root",
            overridesResolver: (t, o) => {
                let {
                    ownerState: r
                } = t;
                return [o.root, r.dense && o.dense, r.divider && o.divider, !r.disableGutters && o.gutters]
            }
        })(t => {
            let {
                theme: n,
                ownerState: i
            } = t;
            return (0, r._)({}, n.typography.body1, {
                display: "flex",
                justifyContent: "flex-start",
                alignItems: "center",
                position: "relative",
                textDecoration: "none",
                minHeight: 48,
                paddingTop: 6,
                paddingBottom: 6,
                boxSizing: "border-box",
                whiteSpace: "nowrap"
            }, !i.disableGutters && {
                paddingLeft: 16,
                paddingRight: 16
            }, i.divider && {
                borderBottom: "1px solid ".concat((n.vars || n).palette.divider),
                backgroundClip: "padding-box"
            }, {
                "&:hover": {
                    textDecoration: "none",
                    backgroundColor: (n.vars || n).palette.action.hover,
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                },
                ["&.".concat(a.m.selected)]: {
                    backgroundColor: n.vars ? "rgba(".concat(n.vars.palette.primary.mainChannel, " / ").concat(n.vars.palette.action.selectedOpacity, ")") : (0, o.b)(n.palette.primary.main, n.palette.action.selectedOpacity),
                    ["&.".concat(a.m.focusVisible)]: {
                        backgroundColor: n.vars ? "rgba(".concat(n.vars.palette.primary.mainChannel, " / calc(").concat(n.vars.palette.action.selectedOpacity, " + ").concat(n.vars.palette.action.focusOpacity, "))") : (0, o.b)(n.palette.primary.main, n.palette.action.selectedOpacity + n.palette.action.focusOpacity)
                    }
                },
                ["&.".concat(a.m.selected, ":hover")]: {
                    backgroundColor: n.vars ? "rgba(".concat(n.vars.palette.primary.mainChannel, " / calc(").concat(n.vars.palette.action.selectedOpacity, " + ").concat(n.vars.palette.action.hoverOpacity, "))") : (0, o.b)(n.palette.primary.main, n.palette.action.selectedOpacity + n.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: n.vars ? "rgba(".concat(n.vars.palette.primary.mainChannel, " / ").concat(n.vars.palette.action.selectedOpacity, ")") : (0, o.b)(n.palette.primary.main, n.palette.action.selectedOpacity)
                    }
                },
                ["&.".concat(a.m.focusVisible)]: {
                    backgroundColor: (n.vars || n).palette.action.focus
                },
                ["&.".concat(a.m.disabled)]: {
                    opacity: (n.vars || n).palette.action.disabledOpacity
                },
                ["& + .".concat(u.d.root)]: {
                    marginTop: n.spacing(1),
                    marginBottom: n.spacing(1)
                },
                ["& + .".concat(u.d.inset)]: {
                    marginLeft: 52
                },
                ["& .".concat(p.l.root)]: {
                    marginTop: 0,
                    marginBottom: 0
                },
                ["& .".concat(p.l.inset)]: {
                    paddingLeft: 36
                },
                ["& .".concat(d.l.root)]: {
                    minWidth: 36
                }
            }, !i.dense && {
                [n.breakpoints.up("sm")]: {
                    minHeight: "auto"
                }
            }, i.dense && (0, r._)({
                minHeight: 32,
                paddingTop: 4,
                paddingBottom: 4
            }, n.typography.body2, {
                ["& .".concat(d.l.root, " svg")]: {
                    fontSize: "1.25rem"
                }
            }))
        }),
        g = n.forwardRef(function(t, c) {
            let u, p = (0, m.u)({
                    props: t,
                    name: "MuiMenuItem"
                }),
                {
                    autoFocus: d = !1,
                    component: g = "li",
                    dense: x = !1,
                    divider: y = !1,
                    disableGutters: w = !1,
                    focusVisibleClassName: S,
                    role: C = "menuitem",
                    tabIndex: P,
                    className: k
                } = p,
                M = (0, o._)(p, f),
                T = n.useContext(s.L),
                _ = n.useMemo(() => ({
                    dense: x || T.dense || !1,
                    disableGutters: w
                }), [T.dense, x, w]),
                R = n.useRef(null);
            (0, h.u)(() => {
                d && R.current && R.current.focus()
            }, [d]);
            let E = (0, r._)({}, p, {
                    dense: _.dense,
                    divider: y,
                    disableGutters: w
                }),
                O = (t => {
                    let {
                        disabled: o,
                        dense: n,
                        divider: s,
                        disableGutters: l,
                        selected: c,
                        classes: u
                    } = t, p = (0, i.a)({
                        root: ["root", n && "dense", o && "disabled", !l && "gutters", s && "divider", c && "selected"]
                    }, a.g, u);
                    return (0, r._)({}, u, p)
                })(p),
                L = (0, b.u)(R, c);
            return p.disabled || (u = void 0 !== P ? P : -1), (0, l.jsx)(s.L.Provider, {
                value: _,
                children: (0, l.jsx)(v, (0, r._)({
                    ref: L,
                    role: C,
                    tabIndex: u,
                    component: g,
                    focusVisibleClassName: (0, i.c)(O.focusVisible, S),
                    className: (0, i.c)(O.root, k)
                }, M, {
                    ownerState: E,
                    classes: O
                }))
            })
        });
    t.s(["M", 0, g])
}, 863762, t => {
    "use strict";
    var o = t.i(194250),
        r = t.i(416340),
        n = t.i(863605),
        i = t.i(690569),
        s = t.i(945146),
        a = t.i(353512),
        l = t.i(950711),
        c = t.i(81962),
        u = t.i(787802),
        p = t.i(221628),
        d = t.i(251635),
        m = t.i(121880),
        h = t.i(342607),
        b = t.i(15686),
        f = t.i(710302),
        v = t.i(782353),
        g = t.i(441872);
    t.i(304064), t.i(734994);
    var x = t.i(770593),
        y = t.i(577474);

    function w(t) {
        return t.substring(2).toLowerCase()
    }

    function S(t) {
        let {
            children: o,
            disableReactTree: n = !1,
            mouseEvent: i = "onClick",
            onClickAway: s,
            touchEvent: a = "onTouchEnd"
        } = t, c = r.useRef(!1), u = r.useRef(null), d = r.useRef(!1), m = r.useRef(!1);
        r.useEffect(() => (setTimeout(() => {
            d.current = !0
        }, 0), () => {
            d.current = !1
        }), []);
        let h = (0, f.u)((0, v.g)(o), u),
            b = (0, l.u)(t => {
                let o = m.current;
                m.current = !1;
                let r = (0, g.o)(u.current);
                if (!(!d.current || !u.current || "clientX" in t && (r.documentElement.clientWidth < t.clientX || r.documentElement.clientHeight < t.clientY))) {
                    if (c.current) return void(c.current = !1);
                    (t.composedPath ? t.composedPath().indexOf(u.current) > -1 : !r.documentElement.contains(t.target) || u.current.contains(t.target)) || !n && o || s(t)
                }
            }),
            x = t => r => {
                m.current = !0;
                let n = o.props[t];
                n && n(r)
            },
            y = {
                ref: h
            };
        return !1 !== a && (y[a] = x(a)), r.useEffect(() => {
            if (!1 !== a) {
                let t = w(a),
                    o = (0, g.o)(u.current),
                    r = () => {
                        c.current = !0
                    };
                return o.addEventListener(t, b), o.addEventListener("touchmove", r), () => {
                    o.removeEventListener(t, b), o.removeEventListener("touchmove", r)
                }
            }
        }, [b, a]), !1 !== i && (y[i] = x(i)), r.useEffect(() => {
            if (!1 !== i) {
                let t = w(i),
                    o = (0, g.o)(u.current);
                return o.addEventListener(t, b), () => {
                    o.removeEventListener(t, b)
                }
            }
        }, [b, i]), (0, p.jsx)(r.Fragment, {
            children: r.cloneElement(o, y)
        })
    }

    function C(t) {
        return (0, i.g)("MuiSnackbarContent", t)
    }(0, u.g)("MuiSnackbarContent", ["root", "message", "action"]);
    let P = ["action", "className", "message", "role"],
        k = (0, d.s)(x.M, {
            name: "MuiSnackbarContent",
            slot: "Root",
            overridesResolver: (t, o) => o.root
        })(t => {
            let {
                theme: o
            } = t, r = "light" === o.palette.mode ? .8 : .98, n = (0, i.n)(o.palette.background.default, r);
            return (0, s._)({}, o.typography.body2, {
                color: o.vars ? o.vars.palette.SnackbarContent.color : o.palette.getContrastText(n),
                backgroundColor: o.vars ? o.vars.palette.SnackbarContent.bg : n,
                display: "flex",
                alignItems: "center",
                flexWrap: "wrap",
                padding: "6px 16px",
                borderRadius: (o.vars || o).shape.borderRadius,
                flexGrow: 1,
                [o.breakpoints.up("sm")]: {
                    flexGrow: "initial",
                    minWidth: 288
                }
            })
        }),
        M = (0, d.s)("div", {
            name: "MuiSnackbarContent",
            slot: "Message",
            overridesResolver: (t, o) => o.message
        })({
            padding: "8px 0"
        }),
        T = (0, d.s)("div", {
            name: "MuiSnackbarContent",
            slot: "Action",
            overridesResolver: (t, o) => o.action
        })({
            display: "flex",
            alignItems: "center",
            marginLeft: "auto",
            paddingLeft: 16,
            marginRight: -8
        }),
        _ = r.forwardRef(function(t, o) {
            let r = (0, m.u)({
                    props: t,
                    name: "MuiSnackbarContent"
                }),
                {
                    action: n,
                    className: a,
                    message: l,
                    role: c = "alert"
                } = r,
                u = (0, i._)(r, P),
                h = (t => {
                    let {
                        classes: o
                    } = t;
                    return (0, d.a)({
                        root: ["root"],
                        action: ["action"],
                        message: ["message"]
                    }, C, o)
                })(r);
            return (0, p.jsxs)(k, (0, s._)({
                role: c,
                square: !0,
                elevation: 6,
                className: (0, d.c)(h.root, a),
                ownerState: r,
                ref: o
            }, u, {
                children: [(0, p.jsx)(M, {
                    className: h.message,
                    ownerState: r,
                    children: l
                }), n ? (0, p.jsx)(T, {
                    className: h.action,
                    ownerState: r,
                    children: n
                }) : null]
            }))
        });

    function R(t) {
        return (0, i.g)("MuiSnackbar", t)
    }(0, u.g)("MuiSnackbar", ["root", "anchorOriginTopCenter", "anchorOriginBottomCenter", "anchorOriginTopRight", "anchorOriginBottomRight", "anchorOriginTopLeft", "anchorOriginBottomLeft"]);
    let E = ["onEnter", "onExited"],
        O = ["action", "anchorOrigin", "autoHideDuration", "children", "className", "ClickAwayListenerProps", "ContentProps", "disableWindowBlurListener", "message", "onBlur", "onClose", "onFocus", "onMouseEnter", "onMouseLeave", "open", "resumeHideDuration", "TransitionComponent", "transitionDuration", "TransitionProps"],
        L = (0, d.s)("div", {
            name: "MuiSnackbar",
            slot: "Root",
            overridesResolver: (t, o) => {
                let {
                    ownerState: r
                } = t;
                return [o.root, o["anchorOrigin".concat((0, i.a)(r.anchorOrigin.vertical)).concat((0, i.a)(r.anchorOrigin.horizontal))]]
            }
        })(t => {
            let {
                theme: o,
                ownerState: r
            } = t;
            return (0, s._)({
                zIndex: (o.vars || o).zIndex.snackbar,
                position: "fixed",
                display: "flex",
                left: 8,
                right: 8,
                justifyContent: "center",
                alignItems: "center"
            }, "top" === r.anchorOrigin.vertical ? {
                top: 8
            } : {
                bottom: 8
            }, "left" === r.anchorOrigin.horizontal && {
                justifyContent: "flex-start"
            }, "right" === r.anchorOrigin.horizontal && {
                justifyContent: "flex-end"
            }, {
                [o.breakpoints.up("sm")]: (0, s._)({}, "top" === r.anchorOrigin.vertical ? {
                    top: 24
                } : {
                    bottom: 24
                }, "center" === r.anchorOrigin.horizontal && {
                    left: "50%",
                    right: "auto",
                    transform: "translateX(-50%)"
                }, "left" === r.anchorOrigin.horizontal && {
                    left: 24,
                    right: "auto"
                }, "right" === r.anchorOrigin.horizontal && {
                    right: 24,
                    left: "auto"
                })
            })
        }),
        A = r.forwardRef(function(t, o) {
            let n = (0, m.u)({
                    props: t,
                    name: "MuiSnackbar"
                }),
                u = (0, h.u)(),
                f = {
                    enter: u.transitions.duration.enteringScreen,
                    exit: u.transitions.duration.leavingScreen
                },
                {
                    action: v,
                    anchorOrigin: {
                        vertical: g,
                        horizontal: x
                    } = {
                        vertical: "bottom",
                        horizontal: "left"
                    },
                    autoHideDuration: w = null,
                    children: C,
                    className: P,
                    ClickAwayListenerProps: k,
                    ContentProps: M,
                    disableWindowBlurListener: T = !1,
                    message: A,
                    open: I,
                    TransitionComponent: D = y.G,
                    transitionDuration: j = f,
                    TransitionProps: {
                        onEnter: U,
                        onExited: N
                    } = {}
                } = n,
                B = (0, i._)(n.TransitionProps, E),
                z = (0, i._)(n, O),
                F = (0, s._)({}, n, {
                    anchorOrigin: {
                        vertical: g,
                        horizontal: x
                    },
                    autoHideDuration: w,
                    disableWindowBlurListener: T,
                    TransitionComponent: D,
                    transitionDuration: j
                }),
                V = (t => {
                    let {
                        classes: o,
                        anchorOrigin: r
                    } = t, n = {
                        root: ["root", "anchorOrigin".concat((0, i.a)(r.vertical)).concat((0, i.a)(r.horizontal))]
                    };
                    return (0, d.a)(n, R, o)
                })(F),
                {
                    getRootProps: W,
                    onClickAway: H
                } = function() {
                    let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        {
                            autoHideDuration: o = null,
                            disableWindowBlurListener: n = !1,
                            onClose: i,
                            open: u,
                            resumeHideDuration: p
                        } = t,
                        d = (0, a.u)();
                    r.useEffect(() => {
                        if (u) return document.addEventListener("keydown", t), () => {
                            document.removeEventListener("keydown", t)
                        };

                        function t(t) {
                            t.defaultPrevented || "Escape" !== t.key && "Esc" !== t.key || null == i || i(t, "escapeKeyDown")
                        }
                    }, [u, i]);
                    let m = (0, l.u)((t, o) => {
                            null == i || i(t, o)
                        }),
                        h = (0, l.u)(t => {
                            i && null != t && d.start(t, () => {
                                m(null, "timeout")
                            })
                        });
                    r.useEffect(() => (u && h(o), d.clear), [u, o, h, d]);
                    let b = d.clear,
                        f = r.useCallback(() => {
                            null != o && h(null != p ? p : .5 * o)
                        }, [o, p, h]);
                    return r.useEffect(() => {
                        if (!n && u) return window.addEventListener("focus", f), window.addEventListener("blur", b), () => {
                            window.removeEventListener("focus", f), window.removeEventListener("blur", b)
                        }
                    }, [n, u, f, b]), {
                        getRootProps: function() {
                            let o = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                                r = (0, s._)({}, (0, c.e)(t), (0, c.e)(o));
                            return (0, s._)({
                                role: "presentation"
                            }, o, r, {
                                onBlur: t => {
                                    let o = r.onBlur;
                                    null == o || o(t), f()
                                },
                                onFocus: t => {
                                    let o = r.onFocus;
                                    null == o || o(t), b()
                                },
                                onMouseEnter: t => {
                                    let o = r.onMouseEnter;
                                    null == o || o(t), b()
                                },
                                onMouseLeave: t => {
                                    let o = r.onMouseLeave;
                                    null == o || o(t), f()
                                }
                            })
                        },
                        onClickAway: t => {
                            null == i || i(t, "clickaway")
                        }
                    }
                }((0, s._)({}, F)),
                [G, $] = r.useState(!0),
                K = (0, b.u)({
                    elementType: L,
                    getSlotProps: W,
                    externalForwardedProps: z,
                    ownerState: F,
                    additionalProps: {
                        ref: o
                    },
                    className: [V.root, P]
                });
            return !I && G ? null : (0, p.jsx)(S, (0, s._)({
                onClickAway: H
            }, k, {
                children: (0, p.jsx)(L, (0, s._)({}, K, {
                    children: (0, p.jsx)(D, (0, s._)({
                        appear: !0,
                        in: I,
                        timeout: j,
                        direction: "top" === g ? "down" : "up",
                        onEnter: (t, o) => {
                            $(!1), U && U(t, o)
                        },
                        onExited: t => {
                            $(!0), N && N(t)
                        }
                    }, B, {
                        children: C || (0, p.jsx)(_, (0, s._)({
                            message: A,
                            action: v
                        }, M))
                    }))
                }))
            }))
        });
    var I = (0, n.default)({
            name: "Snackbar"
        })(function(t) {
            return {
                root: (0, o._)((0, o._)({
                    boxShadow: t.elevation.overlay
                }, t.border.radius.medium), {
                    backgroundColor: t.palette.background.snackbar,
                    color: t.palette.content.standard
                })
            }
        }),
        D = (0, r.forwardRef)(function(t, n) {
            var i = t.ContentProps,
                s = t.autoHide,
                a = t.anchorOrigin,
                l = t.className,
                c = t.classes,
                u = (0, o.a)(t, ["ContentProps", "autoHide", "anchorOrigin", "className", "classes"]),
                p = I(void 0, {
                    props: {
                        classes: null == i ? void 0 : i.classes
                    }
                });
            return r.default.createElement(A, (0, o._)({}, u, {
                classes: (0, o._)((0, o._)({}, c), {
                    root: p.cx(null == c ? void 0 : c.root, l)
                }),
                ref: n,
                anchorOrigin: (0, o._)({
                    vertical: "bottom",
                    horizontal: "left"
                }, a),
                autoHideDuration: void 0 !== s && s ? 4e3 : null,
                ContentProps: {
                    classes: p.classes
                }
            }))
        });
    t.s(["S", 0, D])
}, 41445, t => {
    "use strict";
    var o = t.i(787802),
        r = t.i(690569),
        n = (0, o.g)("MuiCheckbox", ["root", "checked", "disabled", "indeterminate", "colorPrimary", "colorSecondary", "sizeSmall", "sizeMedium"]);
    t.s(["c", 0, n, "g", 0, function(t) {
        return (0, r.g)("MuiCheckbox", t)
    }])
}, 260782, 507558, t => {
    "use strict";
    var o = t.i(194250),
        r = t.i(416340),
        n = t.i(863605),
        i = t.i(154502),
        s = t.i(690569),
        a = t.i(945146),
        l = t.i(251635),
        c = t.i(588763),
        u = t.i(221628),
        p = t.i(121880);
    let d = ["absolute", "children", "className", "component", "flexItem", "light", "orientation", "role", "textAlign", "variant"],
        m = (0, l.s)("div", {
            name: "MuiDivider",
            slot: "Root",
            overridesResolver: (t, o) => {
                let {
                    ownerState: r
                } = t;
                return [o.root, r.absolute && o.absolute, o[r.variant], r.light && o.light, "vertical" === r.orientation && o.vertical, r.flexItem && o.flexItem, r.children && o.withChildren, r.children && "vertical" === r.orientation && o.withChildrenVertical, "right" === r.textAlign && "vertical" !== r.orientation && o.textAlignRight, "left" === r.textAlign && "vertical" !== r.orientation && o.textAlignLeft]
            }
        })(t => {
            let {
                theme: o,
                ownerState: r
            } = t;
            return (0, a._)({
                margin: 0,
                flexShrink: 0,
                borderWidth: 0,
                borderStyle: "solid",
                borderColor: (o.vars || o).palette.divider,
                borderBottomWidth: "thin"
            }, r.absolute && {
                position: "absolute",
                bottom: 0,
                left: 0,
                width: "100%"
            }, r.light && {
                borderColor: o.vars ? "rgba(".concat(o.vars.palette.dividerChannel, " / 0.08)") : (0, s.b)(o.palette.divider, .08)
            }, "inset" === r.variant && {
                marginLeft: 72
            }, "middle" === r.variant && "horizontal" === r.orientation && {
                marginLeft: o.spacing(2),
                marginRight: o.spacing(2)
            }, "middle" === r.variant && "vertical" === r.orientation && {
                marginTop: o.spacing(1),
                marginBottom: o.spacing(1)
            }, "vertical" === r.orientation && {
                height: "100%",
                borderBottomWidth: 0,
                borderRightWidth: "thin"
            }, r.flexItem && {
                alignSelf: "stretch",
                height: "auto"
            })
        }, t => {
            let {
                ownerState: o
            } = t;
            return (0, a._)({}, o.children && {
                display: "flex",
                whiteSpace: "nowrap",
                textAlign: "center",
                border: 0,
                borderTopStyle: "solid",
                borderLeftStyle: "solid",
                "&::before, &::after": {
                    content: '""',
                    alignSelf: "center"
                }
            })
        }, t => {
            let {
                theme: o,
                ownerState: r
            } = t;
            return (0, a._)({}, r.children && "vertical" !== r.orientation && {
                "&::before, &::after": {
                    width: "100%",
                    borderTop: "thin solid ".concat((o.vars || o).palette.divider),
                    borderTopStyle: "inherit"
                }
            })
        }, t => {
            let {
                theme: o,
                ownerState: r
            } = t;
            return (0, a._)({}, r.children && "vertical" === r.orientation && {
                flexDirection: "column",
                "&::before, &::after": {
                    height: "100%",
                    borderLeft: "thin solid ".concat((o.vars || o).palette.divider),
                    borderLeftStyle: "inherit"
                }
            })
        }, t => {
            let {
                ownerState: o
            } = t;
            return (0, a._)({}, "right" === o.textAlign && "vertical" !== o.orientation && {
                "&::before": {
                    width: "90%"
                },
                "&::after": {
                    width: "10%"
                }
            }, "left" === o.textAlign && "vertical" !== o.orientation && {
                "&::before": {
                    width: "10%"
                },
                "&::after": {
                    width: "90%"
                }
            })
        }),
        h = (0, l.s)("span", {
            name: "MuiDivider",
            slot: "Wrapper",
            overridesResolver: (t, o) => {
                let {
                    ownerState: r
                } = t;
                return [o.wrapper, "vertical" === r.orientation && o.wrapperVertical]
            }
        })(t => {
            let {
                theme: o,
                ownerState: r
            } = t;
            return (0, a._)({
                display: "inline-block",
                paddingLeft: "calc(".concat(o.spacing(1), " * 1.2)"),
                paddingRight: "calc(".concat(o.spacing(1), " * 1.2)")
            }, "vertical" === r.orientation && {
                paddingTop: "calc(".concat(o.spacing(1), " * 1.2)"),
                paddingBottom: "calc(".concat(o.spacing(1), " * 1.2)")
            })
        }),
        b = r.forwardRef(function(t, o) {
            let r = (0, p.u)({
                    props: t,
                    name: "MuiDivider"
                }),
                {
                    absolute: n = !1,
                    children: i,
                    className: b,
                    component: f = i ? "div" : "hr",
                    flexItem: v = !1,
                    light: g = !1,
                    orientation: x = "horizontal",
                    role: y = "hr" !== f ? "separator" : void 0,
                    textAlign: w = "center",
                    variant: S = "fullWidth"
                } = r,
                C = (0, s._)(r, d),
                P = (0, a._)({}, r, {
                    absolute: n,
                    component: f,
                    flexItem: v,
                    light: g,
                    orientation: x,
                    role: y,
                    textAlign: w,
                    variant: S
                }),
                k = (t => {
                    let {
                        absolute: o,
                        children: r,
                        classes: n,
                        flexItem: i,
                        light: s,
                        orientation: a,
                        textAlign: u,
                        variant: p
                    } = t;
                    return (0, l.a)({
                        root: ["root", o && "absolute", p, s && "light", "vertical" === a && "vertical", i && "flexItem", r && "withChildren", r && "vertical" === a && "withChildrenVertical", "right" === u && "vertical" !== a && "textAlignRight", "left" === u && "vertical" !== a && "textAlignLeft"],
                        wrapper: ["wrapper", "vertical" === a && "wrapperVertical"]
                    }, c.g, n)
                })(P);
            return (0, u.jsx)(m, (0, a._)({
                as: f,
                className: (0, l.c)(k.root, b),
                role: y,
                ref: o,
                ownerState: P
            }, C, {
                children: i ? (0, u.jsx)(h, {
                    className: k.wrapper,
                    ownerState: P,
                    children: i
                }) : null
            }))
        });
    b.muiSkipListHighlight = !0, t.s(["D", 0, b], 507558);
    var f = (0, n.default)({
            name: "Divider"
        })(function(t, o) {
            return {
                root: {
                    borderBottomWidth: "small" === o.size ? .5 : 1
                }
            }
        }),
        v = (0, r.forwardRef)(function(t, n) {
            var s = t.classes,
                a = t.size,
                l = t.className,
                c = (0, o.a)(t, ["classes", "size", "className"]),
                u = f({
                    size: void 0 === a ? "medium" : a
                }, {
                    props: {
                        classes: (0, i.default)(s, l)
                    }
                });
            return r.default.createElement(b, (0, o._)({}, c, {
                classes: u.classes,
                ref: n
            }))
        });
    t.s(["Divider", 0, v], 260782)
}, 605503, t => {
    "use strict";
    t.s(["d", 0, function(t) {
        let o, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 166;

        function n() {
            for (var n = arguments.length, i = Array(n), s = 0; s < n; s++) i[s] = arguments[s];
            clearTimeout(o), o = setTimeout(() => {
                t.apply(this, i)
            }, r)
        }
        return n.clear = () => {
            clearTimeout(o)
        }, n
    }])
}, 11473, t => {
    "use strict";
    var o = t.i(29013);
    t.s(["OpenInNewIcon", () => o.OpenInNew])
}, 649114, 195920, t => {
    "use strict";
    var o = t.i(194250),
        r = t.i(416340),
        n = t.i(863605),
        i = t.i(154502),
        s = t.i(690768),
        a = t.i(576592);
    t.i(221628);
    var l = (0, n.default)({
            name: "IconButton"
        })(function(t, r) {
            var n, i, l, c, u, p, d, m, h, b, f = r.color,
                v = r.variant,
                g = {
                    color: t.palette.actionV2.primaryBrand.fill
                },
                x = {
                    color: t.palette.content.standard
                },
                y = {
                    color: t.palette.content.alert.important
                };
            return "contained" === v && (Object.assign(g, ((n = {
                color: t.palette.content.static.light,
                backgroundColor: t.palette.actionV2.primaryBrand.fill
            })["&:hover, &.".concat(s.b.focusVisible, " .").concat(s.t.root)] = {
                backgroundColor: t.palette.actionV2.primaryBrand.containedHoverFocus
            }, n)), Object.assign(x, ((i = {
                color: t.palette.content.inverse,
                backgroundColor: t.palette.actionV2.primary.fill
            })["&:hover, &.".concat(s.b.focusVisible, " .").concat(s.t.root)] = {
                backgroundColor: t.palette.actionV2.primary.containedHoverFocus
            }, i)), Object.assign(y, ((l = {
                color: t.palette.content.static.light,
                backgroundColor: t.palette.actionV2.important.fill
            })["&:hover, &.".concat(s.b.focusVisible, " .").concat(s.t.root)] = {
                backgroundColor: t.palette.actionV2.important.containedHoverFocus
            }, l))), "onMediaLight" === f || "onMediaDark" === f ? ((c = {
                backdropFilter: "blur(5px)",
                "-webkit-backdrop-filter": "blur(5px)",
                color: t.palette.content.static.light,
                backgroundColor: "transparent",
                "&:hover": {
                    backgroundColor: t.palette.components.mediaButtons[f].hover
                }
            })["&.".concat(s.b.focusVisible)] = {
                zIndex: 0,
                backgroundColor: t.palette.components.mediaButtons[f].focus
            }, c["&.".concat(s.b.focusVisible, " .").concat(s.t.root)] = {
                zIndex: -1,
                color: t.palette.components.mediaButtons[f].focus
            }, c["&.".concat(a.i.disabled)] = {
                color: t.palette.states.disabled
            }, b = c, "contained" === v && Object.assign(b, ((u = {
                backgroundColor: t.palette.components.mediaButtons[f].fill
            })["&.".concat(a.i.disabled)] = (0, o._)((0, o._)({}, b["&.".concat(a.i.disabled)]), {
                backgroundColor: t.palette.components.mediaButtons[f].fill
            }), u))) : ((p = {})["&.".concat(s.b.focusVisible)] = {
                zIndex: 0
            }, p["&.".concat(s.b.focusVisible, " .").concat(s.t.root)] = {
                zIndex: -1
            }, p["&.".concat(a.i.disabled)] = {
                color: t.palette.states.disabled
            }, b = p, "default" === f && Object.assign(b, ((d = {
                color: t.palette.states.active,
                "&:hover": {
                    color: t.palette.content.standard,
                    backgroundColor: t.palette.states.hover
                }
            })["&.".concat(s.b.focusVisible, " .").concat(s.t.root)] = {
                color: t.palette.content.standard,
                backgroundColor: t.palette.states.focus
            }, d)), "contained" === v && Object.assign(b, ((m = {
                backgroundColor: t.palette.actionV2.secondary.fill,
                "&:hover": (0, o._)((0, o._)({}, b["&:hover"]), {
                    backgroundColor: t.palette.actionV2.secondary.containedHoverFocus
                })
            })["&.".concat(a.i.disabled)] = (0, o._)((0, o._)({}, b["&.".concat(a.i.disabled)]), {
                backgroundColor: t.palette.states.disabledBackground
            }), m)), "outlined" === v && Object.assign(b, (0, o._)((0, o._)({}, t.border.radius.circle), ((h = {
                border: "1px solid ".concat(t.palette.surface.outline),
                "&:hover": (0, o._)((0, o._)({}, b["&:hover"]), {
                    backgroundColor: t.palette.states.hover
                })
            })["&.".concat(s.b.focusVisible, " .").concat(s.t.root)] = {
                backgroundColor: t.palette.states.focus
            }, h)))), {
                root: b,
                colorPrimary: g,
                colorSecondary: x,
                colorError: y,
                sizeSmall: {
                    padding: 4
                }
            }
        }),
        c = (0, r.forwardRef)(function(t, n) {
            var s = t.children,
                c = t.classes,
                u = t.className,
                p = t.color,
                d = void 0 === p ? "primary" : p,
                m = t.variant,
                h = (0, o.a)(t, ["children", "classes", "className", "color", "variant"]),
                b = l({
                    color: d,
                    variant: void 0 === m ? "default" : m
                }, {
                    props: {
                        classes: (0, i.default)(c, u)
                    }
                }),
                f = "onMediaLight" === d || "onMediaDark" === d ? "default" : d;
            return r.default.createElement(a.I, (0, o._)({}, h, {
                classes: b.classes,
                color: f,
                ref: n
            }), s)
        });
    t.s(["default", 0, c], 195920), t.s(["IconButton", 0, c], 649114)
}, 535072, t => {
    "use strict";
    var o, r = {},
        n = {};
    ({
        get exports() {
            return r
        },
        set exports(e) {
            r = e
        }
    }).exports = function() {
        if (o) return n;
        o = 1;
        var t = Symbol.for("react.transitional.element"),
            r = Symbol.for("react.portal"),
            i = Symbol.for("react.fragment"),
            s = Symbol.for("react.strict_mode"),
            a = Symbol.for("react.profiler"),
            l = Symbol.for("react.consumer"),
            c = Symbol.for("react.context"),
            u = Symbol.for("react.forward_ref"),
            p = Symbol.for("react.suspense"),
            d = Symbol.for("react.suspense_list"),
            m = Symbol.for("react.memo"),
            h = Symbol.for("react.lazy"),
            b = Symbol.for("react.view_transition"),
            f = Symbol.for("react.client.reference");

        function v(o) {
            if ("object" == typeof o && null !== o) {
                var n = o.$$typeof;
                switch (n) {
                    case t:
                        switch (o = o.type) {
                            case i:
                            case a:
                            case s:
                            case p:
                            case d:
                            case b:
                                return o;
                            default:
                                switch (o = o && o.$$typeof) {
                                    case c:
                                    case u:
                                    case h:
                                    case m:
                                    case l:
                                        return o;
                                    default:
                                        return n
                                }
                        }
                    case r:
                        return n
                }
            }
        }
        return n.ContextConsumer = l, n.ContextProvider = c, n.Element = t, n.ForwardRef = u, n.Fragment = i, n.Lazy = h, n.Memo = m, n.Portal = r, n.Profiler = a, n.StrictMode = s, n.Suspense = p, n.SuspenseList = d, n.isContextConsumer = function(t) {
            return v(t) === l
        }, n.isContextProvider = function(t) {
            return v(t) === c
        }, n.isElement = function(o) {
            return "object" == typeof o && null !== o && o.$$typeof === t
        }, n.isForwardRef = function(t) {
            return v(t) === u
        }, n.isFragment = function(t) {
            return v(t) === i
        }, n.isLazy = function(t) {
            return v(t) === h
        }, n.isMemo = function(t) {
            return v(t) === m
        }, n.isPortal = function(t) {
            return v(t) === r
        }, n.isProfiler = function(t) {
            return v(t) === a
        }, n.isStrictMode = function(t) {
            return v(t) === s
        }, n.isSuspense = function(t) {
            return v(t) === p
        }, n.isSuspenseList = function(t) {
            return v(t) === d
        }, n.isValidElementType = function(t) {
            return "string" == typeof t || "function" == typeof t || t === i || t === a || t === s || t === p || t === d || "object" == typeof t && null !== t && (t.$$typeof === h || t.$$typeof === m || t.$$typeof === c || t.$$typeof === l || t.$$typeof === u || t.$$typeof === f || void 0 !== t.getModuleId)
        }, n.typeOf = v, n
    }(), t.s(["r", () => r])
}, 345886, 719853, t => {
    "use strict";
    var o = t.i(194250),
        r = t.i(416340),
        n = t.i(863605),
        i = t.i(154502),
        s = t.i(690569),
        a = t.i(945146),
        l = t.i(251635),
        c = t.i(342607),
        u = t.i(787802),
        p = t.i(221628),
        d = t.i(121880);
    let m = r.createContext();

    function h(t) {
        return (0, s.g)("MuiGrid", t)
    }
    let b = ["auto", !0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    var f = (0, u.g)("MuiGrid", ["root", "container", "item", "zeroMinWidth", ...[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(t => "spacing-xs-".concat(t)), ...["column-reverse", "column", "row-reverse", "row"].map(t => "direction-xs-".concat(t)), ...["nowrap", "wrap-reverse", "wrap"].map(t => "wrap-xs-".concat(t)), ...b.map(t => "grid-xs-".concat(t)), ...b.map(t => "grid-sm-".concat(t)), ...b.map(t => "grid-md-".concat(t)), ...b.map(t => "grid-lg-".concat(t)), ...b.map(t => "grid-xl-".concat(t))]);
    let v = ["className", "columns", "columnSpacing", "component", "container", "direction", "item", "rowSpacing", "spacing", "wrap", "zeroMinWidth"];

    function g(t) {
        let o = parseFloat(t);
        return "".concat(o).concat(String(t).replace(String(o), "") || "px")
    }

    function x(t) {
        let {
            breakpoints: o,
            values: r
        } = t, n = "";
        Object.keys(r).forEach(t => {
            "" === n && 0 !== r[t] && (n = t)
        });
        let i = Object.keys(o).sort((t, r) => o[t] - o[r]);
        return i.slice(0, i.indexOf(n))
    }
    let y = (0, l.s)("div", {
            name: "MuiGrid",
            slot: "Root",
            overridesResolver: (t, o) => {
                let {
                    ownerState: r
                } = t, {
                    container: n,
                    direction: i,
                    item: s,
                    spacing: a,
                    wrap: l,
                    zeroMinWidth: c,
                    breakpoints: u
                } = r, p = [];
                n && (p = function(t, o) {
                    let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    if (!t || t <= 0) return [];
                    if ("string" == typeof t && !Number.isNaN(Number(t)) || "number" == typeof t) return [r["spacing-xs-".concat(String(t))]];
                    let n = [];
                    return o.forEach(o => {
                        let i = t[o];
                        Number(i) > 0 && n.push(r["spacing-".concat(o, "-").concat(String(i))])
                    }), n
                }(a, u, o));
                let d = [];
                return u.forEach(t => {
                    let n = r[t];
                    n && d.push(o["grid-".concat(t, "-").concat(String(n))])
                }), [o.root, n && o.container, s && o.item, c && o.zeroMinWidth, ...p, "row" !== i && o["direction-xs-".concat(String(i))], "wrap" !== l && o["wrap-xs-".concat(String(l))], ...d]
            }
        })(t => {
            let {
                ownerState: o
            } = t;
            return (0, a._)({
                boxSizing: "border-box"
            }, o.container && {
                display: "flex",
                flexWrap: "wrap",
                width: "100%"
            }, o.item && {
                margin: 0
            }, o.zeroMinWidth && {
                minWidth: 0
            }, "wrap" !== o.wrap && {
                flexWrap: o.wrap
            })
        }, function(t) {
            let {
                theme: o,
                ownerState: r
            } = t, n = (0, s.r)({
                values: r.direction,
                breakpoints: o.breakpoints.values
            });
            return (0, s.m)({
                theme: o
            }, n, t => {
                let o = {
                    flexDirection: t
                };
                return 0 === t.indexOf("column") && (o["& > .".concat(f.item)] = {
                    maxWidth: "none"
                }), o
            })
        }, function(t) {
            let {
                theme: o,
                ownerState: r
            } = t, {
                container: n,
                rowSpacing: i
            } = r, a = {};
            if (n && 0 !== i) {
                let t, r = (0, s.r)({
                    values: i,
                    breakpoints: o.breakpoints.values
                });
                "object" == typeof r && (t = x({
                    breakpoints: o.breakpoints.values,
                    values: r
                })), a = (0, s.m)({
                    theme: o
                }, r, (r, n) => {
                    var i;
                    let s = o.spacing(r);
                    return "0px" !== s ? {
                        marginTop: "-".concat(g(s)),
                        ["& > .".concat(f.item)]: {
                            paddingTop: g(s)
                        }
                    } : null != (i = t) && i.includes(n) ? {} : {
                        marginTop: 0,
                        ["& > .".concat(f.item)]: {
                            paddingTop: 0
                        }
                    }
                })
            }
            return a
        }, function(t) {
            let {
                theme: o,
                ownerState: r
            } = t, {
                container: n,
                columnSpacing: i
            } = r, a = {};
            if (n && 0 !== i) {
                let t, r = (0, s.r)({
                    values: i,
                    breakpoints: o.breakpoints.values
                });
                "object" == typeof r && (t = x({
                    breakpoints: o.breakpoints.values,
                    values: r
                })), a = (0, s.m)({
                    theme: o
                }, r, (r, n) => {
                    var i;
                    let s = o.spacing(r);
                    return "0px" !== s ? {
                        width: "calc(100% + ".concat(g(s), ")"),
                        marginLeft: "-".concat(g(s)),
                        ["& > .".concat(f.item)]: {
                            paddingLeft: g(s)
                        }
                    } : null != (i = t) && i.includes(n) ? {} : {
                        width: "100%",
                        marginLeft: 0,
                        ["& > .".concat(f.item)]: {
                            paddingLeft: 0
                        }
                    }
                })
            }
            return a
        }, function(t) {
            let o, {
                theme: r,
                ownerState: n
            } = t;
            return r.breakpoints.keys.reduce((t, i) => {
                let l = {};
                if (n[i] && (o = n[i]), !o) return t;
                if (!0 === o) l = {
                    flexBasis: 0,
                    flexGrow: 1,
                    maxWidth: "100%"
                };
                else if ("auto" === o) l = {
                    flexBasis: "auto",
                    flexGrow: 0,
                    flexShrink: 0,
                    maxWidth: "none",
                    width: "auto"
                };
                else {
                    let c = (0, s.r)({
                            values: n.columns,
                            breakpoints: r.breakpoints.values
                        }),
                        u = "object" == typeof c ? c[i] : c;
                    if (null == u) return t;
                    let p = Math.round(o / u * 1e8) / 1e6 + "%",
                        d = {};
                    if (n.container && n.item && 0 !== n.columnSpacing) {
                        let t = r.spacing(n.columnSpacing);
                        if ("0px" !== t) {
                            let o = "calc(".concat(p, " + ").concat(g(t), ")");
                            d = {
                                flexBasis: o,
                                maxWidth: o
                            }
                        }
                    }
                    l = (0, a._)({
                        flexBasis: p,
                        flexGrow: 0,
                        maxWidth: p
                    }, d)
                }
                return 0 === r.breakpoints.values[i] ? Object.assign(t, l) : t[r.breakpoints.up(i)] = l, t
            }, {})
        }),
        w = r.forwardRef(function(t, o) {
            let n = (0, d.u)({
                    props: t,
                    name: "MuiGrid"
                }),
                {
                    breakpoints: i
                } = (0, c.u)(),
                u = (0, l.e)(n),
                {
                    className: b,
                    columns: f,
                    columnSpacing: g,
                    component: x = "div",
                    container: w = !1,
                    direction: S = "row",
                    item: C = !1,
                    rowSpacing: P,
                    spacing: k = 0,
                    wrap: M = "wrap",
                    zeroMinWidth: T = !1
                } = u,
                _ = (0, s._)(u, v),
                R = P || k,
                E = g || k,
                O = r.useContext(m),
                L = w ? f || 12 : O,
                A = {},
                I = (0, a._)({}, _);
            i.keys.forEach(t => {
                null != _[t] && (A[t] = _[t], delete I[t])
            });
            let D = (0, a._)({}, u, {
                    columns: L,
                    container: w,
                    direction: S,
                    item: C,
                    rowSpacing: R,
                    columnSpacing: E,
                    wrap: M,
                    zeroMinWidth: T,
                    spacing: k
                }, A, {
                    breakpoints: i.keys
                }),
                j = (t => {
                    let {
                        classes: o,
                        container: r,
                        direction: n,
                        item: i,
                        spacing: s,
                        wrap: a,
                        zeroMinWidth: c,
                        breakpoints: u
                    } = t, p = [];
                    r && (p = function(t, o) {
                        if (!t || t <= 0) return [];
                        if ("string" == typeof t && !Number.isNaN(Number(t)) || "number" == typeof t) return ["spacing-xs-".concat(String(t))];
                        let r = [];
                        return o.forEach(o => {
                            let n = t[o];
                            if (Number(n) > 0) {
                                let t = "spacing-".concat(o, "-").concat(String(n));
                                r.push(t)
                            }
                        }), r
                    }(s, u));
                    let d = [];
                    u.forEach(o => {
                        let r = t[o];
                        r && d.push("grid-".concat(o, "-").concat(String(r)))
                    });
                    let m = {
                        root: ["root", r && "container", i && "item", c && "zeroMinWidth", ...p, "row" !== n && "direction-xs-".concat(String(n)), "wrap" !== a && "wrap-xs-".concat(String(a)), ...d]
                    };
                    return (0, l.a)(m, h, o)
                })(D);
            return (0, p.jsx)(m.Provider, {
                value: L,
                children: (0, p.jsx)(y, (0, a._)({
                    ownerState: D,
                    className: (0, l.c)(j.root, b),
                    as: x,
                    ref: o
                }, I))
            })
        });
    t.s(["G", 0, w, "g", 0, f], 719853);
    var S = (0, n.default)({
            name: "Grid"
        })(function(t, o) {
            var r, n = o.direction;
            return {
                root: ((r = {})["& > .".concat(f.item)] = {
                    maxWidth: "column" === n || "column-reverse" === n ? "100%" : void 0
                }, r)
            }
        }),
        C = (0, r.forwardRef)(function(t, n) {
            var s = t.children,
                a = t.classes,
                l = t.className,
                c = (0, o.a)(t, ["children", "classes", "className"]),
                u = S(c, {
                    props: {
                        classes: (0, i.default)(a, l)
                    }
                });
            return r.default.createElement(w, (0, o._)({}, c, {
                classes: u.classes,
                ref: n
            }), s)
        });
    t.s(["Grid", 0, C], 345886)
}, 362297, t => {
    "use strict";
    var o = t.i(787802),
        r = t.i(690569),
        n = (0, o.g)("MuiListItemIcon", ["root", "alignItemsFlexStart"]);
    t.s(["g", 0, function(t) {
        return (0, r.g)("MuiListItemIcon", t)
    }, "l", 0, n])
}, 355390, t => {
    "use strict";
    var o = t.i(787802),
        r = t.i(690569),
        n = (0, o.g)("MuiListItemText", ["root", "multiline", "dense", "inset", "primary", "secondary"]);
    t.s(["g", 0, function(t) {
        return (0, r.g)("MuiListItemText", t)
    }, "l", 0, n])
}, 79238, t => {
    "use strict";
    var o = t.i(194250),
        r = t.i(416340),
        n = t.i(863605),
        i = t.i(154502),
        s = t.i(355079);
    t.i(221628), t.i(149285);
    var a = (0, n.default)({
            name: "Menu"
        })(function(t, r) {
            var n = r.variant;
            return {
                paper: (0, o._)((0, o._)({}, t.border.radius.medium), {
                    boxShadow: t.elevation.overlay,
                    background: t.palette.surface[200],
                    color: "modal" === n ? t.palette.content.inverse : t.palette.content.standard
                })
            }
        }),
        l = (0, r.forwardRef)(function(t, n) {
            var l = t.children,
                c = t.variant,
                u = void 0 === c ? "menu" : c,
                p = t.classes,
                d = t.anchorOrigin,
                m = void 0 === d ? {
                    vertical: "bottom",
                    horizontal: "center"
                } : d,
                h = t.transformOrigin,
                b = void 0 === h ? {
                    vertical: "top",
                    horizontal: "center"
                } : h,
                f = t.className,
                v = (0, o.a)(t, ["children", "variant", "classes", "anchorOrigin", "transformOrigin", "className"]),
                g = a((0, o._)((0, o._)({}, v), {
                    anchorOrigin: m,
                    classes: p,
                    transformOrigin: b,
                    variant: u
                }), {
                    props: {
                        classes: (0, i.default)(p, f)
                    }
                });
            return r.default.createElement(s.M, (0, o._)({}, v, {
                classes: g.classes,
                ref: n,
                anchorOrigin: m,
                transformOrigin: b,
                variant: "modal" === u ? "selectedMenu" : u
            }), l)
        });
    t.s(["Menu", 0, l], 79238)
}, 249259, t => {
    "use strict";
    var o = t.i(194250),
        r = t.i(416340),
        n = t.i(863605),
        i = t.i(154502),
        s = t.i(931622),
        a = t.i(504415),
        l = t.i(362297),
        c = t.i(41445),
        u = t.i(690569);
    t.i(221628);
    var p = (0, n.default)({
            name: "MenuItem"
        })(function(t, r) {
            var n, i, a, p = r.variant,
                d = ((n = {
                    color: t.palette.content.standard,
                    backgroundColor: t.palette.states.hover
                })["& .".concat(l.l.root, ", & .").concat(c.c.root, ", & .").concat(c.c.root, ".").concat(c.c.checked)] = {
                    color: t.palette.content.standard
                }, n);
            return "modal" === p && (d = (0, o._)((0, o._)({}, d), {
                backgroundColor: u.e[500]
            })), {
                root: (0, o._)((0, o._)({
                    color: t.palette.content.muted
                }, t.border.radius.medium), ((i = {
                    margin: "0 8px",
                    padding: 8,
                    "&:hover": d
                })["& .".concat(l.l.root, ", & .").concat(c.c.root, ", & .").concat(c.c.root, ".").concat(c.c.checked)] = {
                    color: t.palette.states.active,
                    minWidth: 40
                }, i["&.".concat(s.m.selected)] = ((a = {
                    color: t.palette.content.standard,
                    backgroundColor: t.palette.action.selected
                })["& .".concat(l.l.root, ", & .").concat(c.c.root, ", & .").concat(c.c.root, ".").concat(c.c.checked)] = {
                    color: t.palette.content.standard
                }, a), i))
            }
        }),
        d = (0, r.forwardRef)(function(t, n) {
            var s = t.children,
                l = t.variant,
                c = t.classes,
                u = t.className,
                d = (0, o.a)(t, ["children", "variant", "classes", "className"]),
                m = p((0, o._)((0, o._)({}, d), {
                    variant: void 0 === l ? "standardMenu" : l
                }), {
                    props: {
                        classes: (0, i.default)(c, u)
                    }
                });
            return r.default.createElement(a.M, (0, o._)({}, d, {
                classes: m.classes,
                ref: n
            }), s)
        });
    t.s(["MenuItem", 0, d], 249259)
}, 946029, t => {
    "use strict";
    var o = t.i(416340);
    t.s(["u", 0, function(t) {
        let {
            controlled: r,
            default: n,
            name: i,
            state: s = "value"
        } = t, {
            current: a
        } = o.useRef(void 0 !== r), [l, c] = o.useState(n);
        return [a ? r : l, o.useCallback(t => {
            a || c(t)
        }, [])]
    }])
}, 782694, (t, o, r) => {
    "use strict";

    function n(t, o, r, n) {
        return !1
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "getDomainLocale", {
        enumerable: !0,
        get: function() {
            return n
        }
    }), t.r(963643), ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), o.exports = r.default)
}, 71482, (t, o, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "useIntersection", {
        enumerable: !0,
        get: function() {
            return c
        }
    });
    let n = t.r(416340),
        i = t.r(571853),
        s = "function" == typeof IntersectionObserver,
        a = new Map,
        l = [];

    function c(t) {
        let {
            rootRef: o,
            rootMargin: r,
            disabled: c
        } = t, u = c || !s, [p, d] = (0, n.useState)(!1), m = (0, n.useRef)(null), h = (0, n.useCallback)(t => {
            m.current = t
        }, []);
        return (0, n.useEffect)(() => {
            if (s) {
                if (u || p) return;
                let t = m.current;
                if (t && t.tagName) return function(t, o, r) {
                    let {
                        id: n,
                        observer: i,
                        elements: s
                    } = function(t) {
                        let o, r = {
                                root: t.root || null,
                                margin: t.rootMargin || ""
                            },
                            n = l.find(t => t.root === r.root && t.margin === r.margin);
                        if (n && (o = a.get(n))) return o;
                        let i = new Map;
                        return o = {
                            id: r,
                            observer: new IntersectionObserver(t => {
                                t.forEach(t => {
                                    let o = i.get(t.target),
                                        r = t.isIntersecting || t.intersectionRatio > 0;
                                    o && r && o(r)
                                })
                            }, t),
                            elements: i
                        }, l.push(r), a.set(r, o), o
                    }(r);
                    return s.set(t, o), i.observe(t),
                        function() {
                            if (s.delete(t), i.unobserve(t), 0 === s.size) {
                                i.disconnect(), a.delete(n);
                                let t = l.findIndex(t => t.root === n.root && t.margin === n.margin);
                                t > -1 && l.splice(t, 1)
                            }
                        }
                }(t, t => t && d(t), {
                    root: null == o ? void 0 : o.current,
                    rootMargin: r
                })
            } else if (!p) {
                let t = (0, i.requestIdleCallback)(() => d(!0));
                return () => (0, i.cancelIdleCallback)(t)
            }
        }, [u, r, o, p, m.current]), [h, p, (0, n.useCallback)(() => {
            d(!1)
        }, [])]
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), o.exports = r.default)
}, 56695, (t, o, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "useMergedRef", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let n = t.r(416340);

    function i(t, o) {
        let r = (0, n.useRef)(null),
            i = (0, n.useRef)(null);
        return (0, n.useCallback)(n => {
            if (null === n) {
                let t = r.current;
                t && (r.current = null, t());
                let o = i.current;
                o && (i.current = null, o())
            } else t && (r.current = s(t, n)), o && (i.current = s(o, n))
        }, [t, o])
    }

    function s(t, o) {
        if ("function" != typeof t) return t.current = o, () => {
            t.current = null
        };
        {
            let r = t(o);
            return "function" == typeof r ? r : () => t(null)
        }
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), o.exports = r.default)
}, 895813, (t, o, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        default: function() {
            return k
        },
        useLinkStatus: function() {
            return P
        }
    };
    for (var i in n) Object.defineProperty(r, i, {
        enumerable: !0,
        get: n[i]
    });
    let s = t.r(887602),
        a = t.r(221628),
        l = s._(t.r(416340)),
        c = t.r(86210),
        u = t.r(820510),
        p = t.r(311269),
        d = t.r(321769),
        m = t.r(112173),
        h = t.r(574935),
        b = t.r(71482),
        f = t.r(782694),
        v = t.r(504725),
        g = t.r(56695),
        x = new Set;

    function y(t, o, r, n) {
        if (!("u" < typeof window) && (0, u.isLocalURL)(o)) {
            if (!n.bypassPrefetchedCheck) {
                let i = o + "%" + r + "%" + (void 0 !== n.locale ? n.locale : "locale" in t ? t.locale : void 0);
                if (x.has(i)) return;
                x.add(i)
            }
            t.prefetch(o, r, n).catch(t => {})
        }
    }

    function w(t) {
        return "string" == typeof t ? t : (0, p.formatUrl)(t)
    }
    let S = l.default.forwardRef(function(t, o) {
            let r, n, {
                href: i,
                as: s,
                children: p,
                prefetch: x = null,
                passHref: S,
                replace: C,
                shallow: P,
                scroll: k,
                locale: M,
                onClick: T,
                onNavigate: _,
                onMouseEnter: R,
                onTouchStart: E,
                legacyBehavior: O = !1,
                transitionTypes: L,
                ...A
            } = t;
            r = p, O && ("string" == typeof r || "number" == typeof r) && (r = (0, a.jsx)("a", {
                children: r
            }));
            let I = l.default.useContext(h.RouterContext),
                D = !1 !== x,
                {
                    href: j,
                    as: U
                } = l.default.useMemo(() => {
                    if (!I) {
                        let t = w(i);
                        return {
                            href: t,
                            as: s ? w(s) : t
                        }
                    }
                    let [t, o] = (0, c.resolveHref)(I, i, !0);
                    return {
                        href: t,
                        as: s ? (0, c.resolveHref)(I, s) : o || t
                    }
                }, [I, i, s]),
                N = l.default.useRef(j),
                B = l.default.useRef(U);
            O && (n = l.default.Children.only(r));
            let z = O ? n && "object" == typeof n && n.ref : o,
                [F, V, W] = (0, b.useIntersection)({
                    rootMargin: "200px"
                }),
                H = l.default.useCallback(t => {
                    (B.current !== U || N.current !== j) && (W(), B.current = U, N.current = j), F(t)
                }, [U, j, W, F]),
                G = (0, g.useMergedRef)(H, z);
            l.default.useEffect(() => {
                !I || V && D && y(I, j, U, {
                    bypassPrefetchedCheck: !1,
                    locale: M
                })
            }, [U, j, V, M, D, null == I ? void 0 : I.locale, I]);
            let $ = {
                ref: G,
                onClick(t) {
                    O || "function" != typeof T || T(t), O && n.props && "function" == typeof n.props.onClick && n.props.onClick(t), !I || t.defaultPrevented || function(t, o, r, n, i, s, a, l, c) {
                        let p, {
                            nodeName: d
                        } = t.currentTarget;
                        if (!("A" === d.toUpperCase() && ((p = t.currentTarget.getAttribute("target")) && "_self" !== p || t.metaKey || t.ctrlKey || t.shiftKey || t.altKey || t.nativeEvent && 2 === t.nativeEvent.which) || t.currentTarget.hasAttribute("download"))) {
                            if (!(0, u.isLocalURL)(r)) {
                                i && (t.preventDefault(), location.replace(r));
                                return
                            }
                            t.preventDefault(), (() => {
                                if (c) {
                                    let t = !1;
                                    if (c({
                                            preventDefault: () => {
                                                t = !0
                                            }
                                        }), t) return
                                }
                                let t = null == a || a;
                                "beforePopState" in o ? o[i ? "replace" : "push"](r, n, {
                                    shallow: s,
                                    locale: l,
                                    scroll: t
                                }) : o[i ? "replace" : "push"](n || r, {
                                    scroll: t
                                })
                            })()
                        }
                    }(t, I, j, U, C, P, k, M, _)
                },
                onMouseEnter(t) {
                    O || "function" != typeof R || R(t), O && n.props && "function" == typeof n.props.onMouseEnter && n.props.onMouseEnter(t), I && y(I, j, U, {
                        locale: M,
                        priority: !0,
                        bypassPrefetchedCheck: !0
                    })
                },
                onTouchStart: function(t) {
                    O || "function" != typeof E || E(t), O && n.props && "function" == typeof n.props.onTouchStart && n.props.onTouchStart(t), I && y(I, j, U, {
                        locale: M,
                        priority: !0,
                        bypassPrefetchedCheck: !0
                    })
                }
            };
            if ((0, d.isAbsoluteUrl)(U)) $.href = U;
            else if (!O || S || "a" === n.type && !("href" in n.props)) {
                let t = void 0 !== M ? M : null == I ? void 0 : I.locale;
                $.href = (null == I ? void 0 : I.isLocaleDomain) && (0, f.getDomainLocale)(U, t, null == I ? void 0 : I.locales, null == I ? void 0 : I.domainLocales) || (0, v.addBasePath)((0, m.addLocale)(U, t, null == I ? void 0 : I.defaultLocale))
            }
            return O ? l.default.cloneElement(n, $) : (0, a.jsx)("a", {
                ...A,
                ...$,
                children: r
            })
        }),
        C = (0, l.createContext)({
            pending: !1
        }),
        P = () => (0, l.useContext)(C),
        k = S;
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), o.exports = r.default)
}, 537068, (t, o, r) => {
    o.exports = t.r(895813)
}, 260022, t => {
    "use strict";
    let o = {
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
    t.s(["getProductionCreatorHubUrl", 0, t => "luobu" === t ? "https://create.roblox.cn" : "https://create.roblox.com", "resolveUrl", 0, (t, r, n) => {
        var i, s;
        return (null == (s = o[t]) || null == (i = s[n]) ? void 0 : i[r]) || (console.warn("No URL found for ".concat(t, " in environment ").concat(r, " and target ").concat(n)), "")
    }])
}]);

//# debugId=f5b12c62-fe56-1ddb-36a6-e63b9df98984
//# sourceMappingURL=0vq_0_7igs09v.js.map
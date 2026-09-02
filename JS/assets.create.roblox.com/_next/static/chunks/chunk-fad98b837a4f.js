;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f80b90c7-3101-2f8c-31d1-3b66da9b4f6e")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 23342, 78892, e => {
    "use strict";
    var t = e.i(416340);

    function r(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function a() {
        for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
        return e => {
            let a = !1,
                n = t.map(t => {
                    let n = r(t, e);
                    return a || "function" != typeof n || (a = !0), n
                });
            if (a) return () => {
                for (let e = 0; e < n.length; e++) {
                    let a = n[e];
                    "function" == typeof a ? a() : r(t[e], null)
                }
            }
        }
    }
    e.s(["composeRefs", 0, a, "useComposedRefs", 0, function() {
        for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
        return t.useCallback(a(...r), r)
    }], 78892);
    var n = e.i(221628),
        i = Symbol.for("react.lazy"),
        o = t[" use ".trim().toString()];

    function l(e) {
        var t;
        return null != e && "object" == typeof e && "$$typeof" in e && e.$$typeof === i && "_payload" in e && "object" == typeof(t = e._payload) && null !== t && "then" in t
    }

    function s(e) {
        var r;
        let i, s = (r = e, (i = t.forwardRef((e, r) => {
                let {
                    children: n,
                    ...i
                } = e;
                if (l(n) && "function" == typeof o && (n = o(n._payload)), t.isValidElement(n)) {
                    var s, c, u;
                    let e, o, l = (o = (e = null == (c = Object.getOwnPropertyDescriptor((s = n).props, "ref")) ? void 0 : c.get) && "isReactWarning" in e && e.isReactWarning) ? s.ref : (o = (e = null == (u = Object.getOwnPropertyDescriptor(s, "ref")) ? void 0 : u.get) && "isReactWarning" in e && e.isReactWarning) ? s.props.ref : s.props.ref || s.ref,
                        d = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let a in t) {
                                let n = e[a],
                                    i = t[a];
                                /^on[A-Z]/.test(a) ? n && i ? r[a] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    let a = i(...t);
                                    return n(...t), a
                                } : n && (r[a] = n) : "style" === a ? r[a] = {
                                    ...n,
                                    ...i
                                } : "className" === a && (r[a] = [n, i].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(i, n.props);
                    return n.type !== t.Fragment && (d.ref = r ? a(r, l) : l), t.cloneElement(n, d)
                }
                return t.Children.count(n) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(r, ".SlotClone"), i),
            c = t.forwardRef((e, r) => {
                let {
                    children: a,
                    ...i
                } = e;
                l(a) && "function" == typeof o && (a = o(a._payload));
                let c = t.Children.toArray(a),
                    u = c.find(d);
                if (u) {
                    let e = u.props.children,
                        a = c.map(r => r !== u ? r : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, n.jsx)(s, {
                        ...i,
                        ref: r,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, a) : null
                    })
                }
                return (0, n.jsx)(s, {
                    ...i,
                    ref: r,
                    children: a
                })
            });
        return c.displayName = "".concat(e, ".Slot"), c
    }
    var c = s("Slot"),
        u = Symbol("radix.slottable");

    function d(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === u
    }
    e.s(["Slot", 0, c, "createSlot", 0, s], 23342)
}, 888379, e => {
    "use strict";
    var t = e.i(472536),
        r = e.i(922834),
        a = e.i(367411),
        n = e.i(725074),
        i = e.i(197649),
        o = e.i(416340),
        l = e.i(23342);
    let s = {
            Large: 24,
            Medium: 20,
            Small: 16,
            XSmall: 12
        },
        c = {
            Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
            Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
            Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
            XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
        },
        u = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        d = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        f = (0, o.forwardRef)((e, f) => {
            let {
                children: m,
                className: p,
                style: h,
                isDisabled: y = !1,
                isLoading: g = !1,
                icon: b,
                size: v = "Large",
                variant: _ = "Emphasis",
                asChild: S,
                ...x
            } = e, E = (0, i.default)("foundation-web-button", y ? r.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", c[v], y ? d[_] : u[_], p), R = {
                textDecoration: "none",
                ...h
            }, w = e => o.default.createElement(o.default.Fragment, null, o.default.createElement(t.StateLayer, null), g && o.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, o.default.createElement(a.LoadingSpinner, {
                width: s[v],
                height: s[v]
            })), o.default.createElement("span", {
                className: (0, i.default)("flex items-center min-width-0", "Large" === v || "Medium" === v ? "gap-small" : "gap-xsmall", g && "invisible")
            }, b && o.default.createElement(n.Icon, {
                name: b,
                size: v
            }), o.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, e)));
            if (S) {
                let {
                    as: e,
                    ...t
                } = x, r = o.default.Children.only(m);
                return o.default.createElement(l.Slot, {
                    ref: f,
                    ...t,
                    className: E,
                    style: R,
                    "aria-disabled": y || void 0
                }, o.default.cloneElement(r, {}, w(r.props.children)))
            }
            if ("a" === x.as) {
                let {
                    as: e,
                    href: t,
                    ...r
                } = x;
                return o.default.createElement("a", {
                    ref: f,
                    ...r,
                    "aria-disabled": y,
                    href: y ? void 0 : t,
                    className: E,
                    style: R
                }, w(m))
            }
            let {
                as: C,
                ...O
            } = x;
            return o.default.createElement("button", {
                ref: f,
                type: "button",
                ...O,
                disabled: y,
                className: E,
                style: R
            }, w(m))
        });
    e.s(["Button", 0, f])
}, 725074, e => {
    "use strict";
    var t = e.i(197649),
        r = e.i(416340);
    let a = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        n = r.default.forwardRef((e, n) => {
            let {
                name: i,
                size: o = "Medium",
                className: l,
                children: s,
                ...c
            } = e;
            return r.default.createElement("span", {
                ref: n,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon", i, a[o], l),
                ...c
            })
        });
    n.displayName = "Icon", e.s(["Icon", 0, n])
}, 339724, e => {
    "use strict";
    var t = e.i(472536),
        r = e.i(922834),
        a = e.i(197649),
        n = e.i(416340),
        i = e.i(23342);
    let o = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        l = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        s = {
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
        c = {
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
        d = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        f = {
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
        m = {
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
        p = (0, n.forwardRef)((e, p) => {
            let h, {
                className: y,
                icon: g,
                ariaLabel: b,
                isDisabled: v = !1,
                isCircular: _ = !1,
                isSelected: S = !1,
                size: x = "Large",
                variant: E = "Emphasis",
                iconColor: R = "Default",
                asChild: w,
                children: C,
                ...O
            } = e;
            h = v ? u[E] : S ? d[E] : c[E];
            let P = (0, a.default)("foundation-web-icon-button", v ? r.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", o[x], s[x][_ ? "circular" : "square"], h, y),
                M = n.default.createElement(n.default.Fragment, null, n.default.createElement(t.StateLayer, null), n.default.createElement("span", {
                    className: (0, a.default)("icon", g, l[x], v ? m[R][E] : f[R][E])
                }));
            if (w) {
                let {
                    as: e,
                    ...t
                } = O, r = n.default.Children.only(C);
                return n.default.createElement(i.Slot, {
                    ref: p,
                    ...t,
                    className: P,
                    "aria-label": b,
                    "aria-disabled": v || void 0
                }, n.default.cloneElement(r, {}, M))
            }
            if ("a" === O.as) {
                let {
                    as: e,
                    href: t,
                    ...r
                } = O;
                return n.default.createElement("a", {
                    ref: p,
                    ...r,
                    "aria-label": b,
                    "aria-disabled": v,
                    href: v ? void 0 : t,
                    className: P
                }, M)
            }
            let {
                as: j,
                ...T
            } = O;
            return n.default.createElement("button", {
                ref: p,
                type: "button",
                ...T,
                "aria-label": b,
                disabled: v,
                className: P
            }, M)
        });
    e.s(["IconButton", 0, p])
}, 329781, e => {
    "use strict";
    var t = e.i(197649),
        r = e.i(416340);
    let a = {
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
        n = r.default.forwardRef((e, n) => {
            let {
                className: i,
                size: o = "Large",
                variant: l = "Determinate",
                value: s = 0,
                showValue: c = !1,
                ariaLabel: u,
                ...d
            } = e, {
                dimension: f,
                strokeWidth: m,
                textClass: p,
                valueContainerSize: h
            } = a[o], y = (f - m) / 2, g = 2 * Math.PI * y, b = f / 2, v = Math.min(100, Math.max(0, s)), _ = c && void 0 !== h ? h : f, S = "Determinate" === l;
            return r.default.createElement("div", {
                ref: n,
                className: (0, t.default)("foundation-web-progress-circle inline-flex items-center justify-center", i),
                role: "progressbar",
                "aria-label": u,
                "aria-valuemin": S ? 0 : void 0,
                "aria-valuemax": S ? 100 : void 0,
                "aria-valuenow": S ? v : void 0,
                style: {
                    width: _,
                    height: _
                },
                ...d
            }, r.default.createElement("svg", {
                width: f,
                height: f,
                viewBox: "0 0 ".concat(f, " ").concat(f),
                className: "relative"
            }, r.default.createElement("circle", {
                cx: b,
                cy: b,
                r: y,
                fill: "none",
                strokeWidth: m,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), r.default.createElement("circle", {
                cx: b,
                cy: b,
                r: y,
                fill: "none",
                strokeWidth: m,
                strokeDasharray: S ? g : "".concat(.75 * g, " ").concat(.25 * g),
                strokeDashoffset: S ? g * (1 - v / 100) : 0,
                strokeLinecap: "round",
                className: (0, t.default)(!S && "foundation-web-progress-circle-indeterminate"),
                style: S ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), S && c && "Large" === o && r.default.createElement("div", {
                className: (0, t.default)("absolute content-emphasis flex items-center justify-center", p),
                "aria-hidden": "true"
            }, r.default.createElement("span", null, Math.round(v)), r.default.createElement("span", null, "%")))
        });
    n.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, n])
}, 367411, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["LoadingSpinner", 0, e => {
        let {
            width: r,
            height: a
        } = e;
        return t.default.createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: r,
            height: a,
            viewBox: "0 0 20 20",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg"
        }, t.default.createElement("path", {
            fillRule: "evenodd",
            clipRule: "evenodd",
            fill: "currentColor",
            d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
        }))
    }])
}, 472536, e => {
    "use strict";
    var t = e.i(197649),
        r = e.i(416340);
    e.s(["StateLayer", 0, e => {
        let {
            className: a
        } = e;
        return r.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-state-layer",
            className: (0, t.default)("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", a)
        })
    }, "interactable", 0, "relative clip group/interactable focus-visible:outline-focus disabled:outline-none"])
}, 922834, e => {
    "use strict";
    e.s(["disabledOpacity", 0, "opacity-[0.5]"])
}, 579325, e => {
    "use strict";
    var t = e.i(416340);
    let r = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            a = (0, t.useRef)();
        return a.current || (r += 1, a.current = "".concat(e).concat(r)), a.current
    }])
}, 725085, e => {
    "use strict";
    var t = e.i(865800),
        r = e.i(416340),
        a = e.i(614515),
        n = e.i(993807),
        i = e.i(962560),
        o = e.i(273589),
        l = e.i(42569),
        s = e.i(696180),
        c = e.i(221628),
        u = e.i(719409),
        d = e.i(963320);

    function f(e) {
        return (0, o.g)("MuiCard", e)
    }
    e.i(485511), (0, s.g)("MuiCard", ["root"]);
    let m = ["className", "raised"],
        p = (0, l.s)(u.M, {
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
                    className: a,
                    raised: n = !1
                } = r,
                s = (0, o._)(r, m),
                u = (0, i._)({}, r, {
                    raised: n
                }),
                h = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, l.a)({
                        root: ["root"]
                    }, f, t)
                })(u);
            return (0, c.jsx)(p, (0, i._)({
                className: (0, l.c)(h.root, a),
                elevation: n ? 8 : void 0,
                ref: t,
                ownerState: u
            }, s))
        });
    var y = (0, a.default)({
            name: "Card"
        })(function(e, r) {
            var a = r.variant;
            return {
                root: (0, t._)({
                    boxShadow: "none",
                    overflow: "hidden",
                    WebkitMaskImage: "-webkit-radial-gradient(white, black)",
                    backgroundColor: "outlined" === a ? "transparent" : e.palette.surface[200],
                    position: "relative"
                }, e.border.radius.large)
            }
        }),
        g = (0, r.forwardRef)(function(e, a) {
            var i = e.children,
                o = e.classes,
                l = e.variant,
                s = e.className,
                c = (0, t.a)(e, ["children", "classes", "variant", "className"]),
                u = y((0, t._)((0, t._)({}, c), {
                    variant: l
                }), {
                    props: {
                        classes: (0, n.default)(o, s)
                    }
                });
            return r.default.createElement(h, (0, t._)({}, c, {
                variant: "outlined" === l ? "outlined" : "elevation",
                classes: u.classes,
                ref: a
            }), i)
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
        a = e.i(416340),
        n = e.i(42569),
        i = e.i(576881),
        o = e.i(751498),
        l = e.i(221628),
        s = e.i(112896),
        c = e.i(963320);
    e.i(197094);
    var u = (0, o.c)((0, l.jsx)("path", {
            d: "M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"
        }), "CheckBoxOutlineBlank"),
        d = (0, o.c)((0, l.jsx)("path", {
            d: "M19 3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.11 0 2-.9 2-2V5c0-1.1-.89-2-2-2zm-9 14l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"
        }), "CheckBox"),
        f = (0, o.c)((0, l.jsx)("path", {
            d: "M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-2 10H7v-2h10v2z"
        }), "IndeterminateCheckBox");
    let m = ["checkedIcon", "color", "icon", "indeterminate", "indeterminateIcon", "inputProps", "size", "className"],
        p = (0, n.s)(i.S, {
            shouldForwardProp: e => (0, n.r)(e) || "classes" === e,
            name: "MuiCheckbox",
            slot: "Root",
            overridesResolver: (e, r) => {
                let {
                    ownerState: a
                } = e;
                return [r.root, a.indeterminate && r.indeterminate, r["size".concat((0, t.a)(a.size))], "default" !== a.color && r["color".concat((0, t.a)(a.color))]]
            }
        })(e => {
            let {
                theme: a,
                ownerState: n
            } = e;
            return (0, r._)({
                color: (a.vars || a).palette.text.secondary
            }, !n.disableRipple && {
                "&:hover": {
                    backgroundColor: a.vars ? "rgba(".concat("default" === n.color ? a.vars.palette.action.activeChannel : a.vars.palette[n.color].mainChannel, " / ").concat(a.vars.palette.action.hoverOpacity, ")") : (0, t.b)("default" === n.color ? a.palette.action.active : a.palette[n.color].main, a.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== n.color && {
                ["&.".concat(s.c.checked, ", &.").concat(s.c.indeterminate)]: {
                    color: (a.vars || a).palette[n.color].main
                },
                ["&.".concat(s.c.disabled)]: {
                    color: (a.vars || a).palette.action.disabled
                }
            })
        }),
        h = (0, l.jsx)(d, {}),
        y = (0, l.jsx)(u, {}),
        g = (0, l.jsx)(f, {}),
        b = a.forwardRef(function(e, i) {
            var o, u;
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
                    inputProps: x,
                    size: E = "medium",
                    className: R
                } = d,
                w = (0, t._)(d, m),
                C = _ ? S : v,
                O = _ ? S : f,
                P = (0, r._)({}, d, {
                    color: b,
                    indeterminate: _,
                    size: E
                }),
                M = (e => {
                    let {
                        classes: a,
                        indeterminate: i,
                        color: o,
                        size: l
                    } = e, c = {
                        root: ["root", i && "indeterminate", "color".concat((0, t.a)(o)), "size".concat((0, t.a)(l))]
                    }, u = (0, n.a)(c, s.g, a);
                    return (0, r._)({}, a, u)
                })(P);
            return (0, l.jsx)(p, (0, r._)({
                type: "checkbox",
                inputProps: (0, r._)({
                    "data-indeterminate": _
                }, x),
                icon: a.cloneElement(C, {
                    fontSize: null != (o = C.props.fontSize) ? o : E
                }),
                checkedIcon: a.cloneElement(O, {
                    fontSize: null != (u = O.props.fontSize) ? u : E
                }),
                ownerState: P,
                ref: i,
                className: (0, n.c)(M.root, R)
            }, w, {
                classes: M
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
        a = e.i(416340),
        n = e.i(42569),
        i = e.i(155607),
        o = e.i(696180),
        l = e.i(221628),
        s = e.i(232625),
        c = e.i(640878);

    function u(e) {
        return (0, t.g)("PrivateSwitchBase", e)
    }
    e.i(197094), (0, o.g)("PrivateSwitchBase", ["root", "checked", "disabled", "input", "edgeStart", "edgeEnd"]);
    let d = ["autoFocus", "checked", "checkedIcon", "className", "defaultChecked", "disabled", "disableFocusRipple", "edge", "icon", "id", "inputProps", "inputRef", "name", "onBlur", "onChange", "onFocus", "readOnly", "required", "tabIndex", "type", "value"],
        f = (0, n.s)(s.B, {
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
        m = (0, n.s)("input", {
            name: "MuiSwitchBase",
            shouldForwardProp: n.r
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
        p = a.forwardRef(function(e, a) {
            let {
                autoFocus: o,
                checked: s,
                checkedIcon: p,
                className: h,
                defaultChecked: y,
                disabled: g,
                disableFocusRipple: b = !1,
                edge: v = !1,
                icon: _,
                id: S,
                inputProps: x,
                inputRef: E,
                name: R,
                onBlur: w,
                onChange: C,
                onFocus: O,
                readOnly: P,
                required: M = !1,
                tabIndex: j,
                type: T,
                value: k
            } = e, L = (0, t._)(e, d), [z, I] = (0, c.u)({
                controlled: s,
                default: !!y,
                name: "SwitchBase",
                state: "checked"
            }), N = (0, i.u)(), A = g;
            N && void 0 === A && (A = N.disabled);
            let F = "checkbox" === T || "radio" === T,
                B = (0, r._)({}, e, {
                    checked: z,
                    disabled: A,
                    disableFocusRipple: b,
                    edge: v
                }),
                H = (e => {
                    let {
                        classes: r,
                        checked: a,
                        disabled: i,
                        edge: o
                    } = e, l = {
                        root: ["root", a && "checked", i && "disabled", o && "edge".concat((0, t.a)(o))],
                        input: ["input"]
                    };
                    return (0, n.a)(l, u, r)
                })(B);
            return (0, l.jsxs)(f, (0, r._)({
                component: "span",
                className: (0, n.c)(H.root, h),
                centerRipple: !0,
                focusRipple: !b,
                disabled: A,
                tabIndex: null,
                role: void 0,
                onFocus: e => {
                    O && O(e), N && N.onFocus && N.onFocus(e)
                },
                onBlur: e => {
                    w && w(e), N && N.onBlur && N.onBlur(e)
                },
                ownerState: B,
                ref: a
            }, L, {
                children: [(0, l.jsx)(m, (0, r._)({
                    autoFocus: o,
                    checked: s,
                    defaultChecked: y,
                    className: H.input,
                    disabled: A,
                    id: F ? S : void 0,
                    name: R,
                    onChange: e => {
                        if (e.nativeEvent.defaultPrevented) return;
                        let t = e.target.checked;
                        I(t), C && C(e, t)
                    },
                    readOnly: P,
                    ref: E,
                    required: M,
                    ownerState: B,
                    tabIndex: j,
                    type: T
                }, "checkbox" === T && void 0 === k ? {} : {
                    value: k
                }, x)), z ? p : _]
            }))
        });
    e.s(["S", 0, p])
}, 373887, e => {
    "use strict";
    var t = e.i(865800),
        r = e.i(416340),
        a = e.i(614515),
        n = e.i(993807),
        i = e.i(470657),
        o = e.i(998331),
        l = e.i(273589),
        s = e.i(962560),
        c = e.i(42569),
        u = e.i(59656),
        d = e.i(221628),
        f = e.i(232625),
        m = e.i(963320),
        p = e.i(969708),
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
                ["&.".concat(o.l.selected)]: {
                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette.primary.mainChannel, " / ").concat(t.vars.palette.action.selectedOpacity, ")") : (0, l.b)(t.palette.primary.main, t.palette.action.selectedOpacity),
                    ["&.".concat(o.l.focusVisible)]: {
                        backgroundColor: t.vars ? "rgba(".concat(t.vars.palette.primary.mainChannel, " / calc(").concat(t.vars.palette.action.selectedOpacity, " + ").concat(t.vars.palette.action.focusOpacity, "))") : (0, l.b)(t.palette.primary.main, t.palette.action.selectedOpacity + t.palette.action.focusOpacity)
                    }
                },
                ["&.".concat(o.l.selected, ":hover")]: {
                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette.primary.mainChannel, " / calc(").concat(t.vars.palette.action.selectedOpacity, " + ").concat(t.vars.palette.action.hoverOpacity, "))") : (0, l.b)(t.palette.primary.main, t.palette.action.selectedOpacity + t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: t.vars ? "rgba(".concat(t.vars.palette.primary.mainChannel, " / ").concat(t.vars.palette.action.selectedOpacity, ")") : (0, l.b)(t.palette.primary.main, t.palette.action.selectedOpacity)
                    }
                },
                ["&.".concat(o.l.focusVisible)]: {
                    backgroundColor: (t.vars || t).palette.action.focus
                },
                ["&.".concat(o.l.disabled)]: {
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
            let a = (0, m.u)({
                    props: e,
                    name: "MuiListItemButton"
                }),
                {
                    alignItems: n = "center",
                    autoFocus: i = !1,
                    component: f = "div",
                    children: y,
                    dense: v = !1,
                    disableGutters: _ = !1,
                    divider: S = !1,
                    focusVisibleClassName: x,
                    selected: E = !1,
                    className: R
                } = a,
                w = (0, l._)(a, g),
                C = r.useContext(u.L),
                O = r.useMemo(() => ({
                    dense: v || C.dense || !1,
                    alignItems: n,
                    disableGutters: _
                }), [n, C.dense, v, _]),
                P = r.useRef(null);
            (0, p.u)(() => {
                i && P.current && P.current.focus()
            }, [i]);
            let M = (0, s._)({}, a, {
                    alignItems: n,
                    dense: O.dense,
                    disableGutters: _,
                    divider: S,
                    selected: E
                }),
                j = (e => {
                    let {
                        alignItems: t,
                        classes: r,
                        dense: a,
                        disabled: n,
                        disableGutters: i,
                        divider: l,
                        selected: u
                    } = e, d = (0, c.a)({
                        root: ["root", a && "dense", !i && "gutters", l && "divider", n && "disabled", "flex-start" === t && "alignItemsFlexStart", u && "selected"]
                    }, o.g, r);
                    return (0, s._)({}, r, d)
                })(M),
                T = (0, h.u)(P, t);
            return (0, d.jsx)(u.L.Provider, {
                value: O,
                children: (0, d.jsx)(b, (0, s._)({
                    ref: T,
                    href: w.href || w.to,
                    component: (w.href || w.to) && "div" === f ? "button" : f,
                    focusVisibleClassName: (0, c.c)(j.focusVisible, x),
                    ownerState: M,
                    className: (0, c.c)(j.root, R)
                }, w, {
                    classes: j,
                    children: y
                }))
            })
        });
    var _ = (0, a.default)({
            name: "ListItemButton"
        })(function(e) {
            var r, a, n, l;
            return {
                root: (0, t._)((0, t._)({}, e.border.radius.medium), ((r = {})["& .".concat(y.l.primary, ", & .").concat(y.l.secondary, ", & .").concat(i.l.root)] = {
                    color: e.palette.content.muted
                }, r["&:hover"] = ((a = {
                    backgroundColor: e.palette.states.hover
                })["& .".concat(y.l.primary, ", & .").concat(i.l.root)] = {
                    color: e.palette.content.standard
                }, a), r["&.".concat(o.l.selected, ", &.").concat(o.l.selected, ":hover")] = ((n = {
                    backgroundColor: e.palette.action.selected
                })["& .".concat(y.l.primary)] = {
                    fontWeight: e.typography.fontWeightMedium
                }, n["& .".concat(y.l.primary, ", & .").concat(i.l.root)] = {
                    color: e.palette.content.standard
                }, n), r)),
                dense: ((l = {})["& .".concat(y.l.primary, ", & .").concat(y.l.secondary)] = (0, t._)({}, e.typography.body2), l)
            }
        }),
        S = (0, r.forwardRef)(function(e, a) {
            var i = e.classes,
                o = e.className,
                l = (0, t.a)(e, ["classes", "className"]),
                s = _(void 0, {
                    props: {
                        classes: (0, n.default)(i, o)
                    }
                });
            return r.default.createElement(v, (0, t._)({}, l, {
                classes: s.classes,
                ref: a
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
        a = e.i(614515),
        n = e.i(993807),
        i = e.i(273589),
        o = e.i(962560),
        l = e.i(42569),
        s = e.i(59656),
        c = e.i(175705),
        u = e.i(221628),
        d = e.i(963320),
        f = e.i(972455);
    let m = ["children", "className", "disableTypography", "inset", "primary", "primaryTypographyProps", "secondary", "secondaryTypographyProps"],
        p = (0, l.s)("div", {
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
            return (0, o._)({
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
            let a = (0, d.u)({
                    props: e,
                    name: "MuiListItemText"
                }),
                {
                    children: n,
                    className: h,
                    disableTypography: y = !1,
                    inset: g = !1,
                    primary: b,
                    primaryTypographyProps: v,
                    secondary: _,
                    secondaryTypographyProps: S
                } = a,
                x = (0, i._)(a, m),
                {
                    dense: E
                } = r.useContext(s.L),
                R = null != b ? b : n,
                w = _,
                C = (0, o._)({}, a, {
                    disableTypography: y,
                    inset: g,
                    primary: !!R,
                    secondary: !!w,
                    dense: E
                }),
                O = (e => {
                    let {
                        classes: t,
                        inset: r,
                        primary: a,
                        secondary: n,
                        dense: i
                    } = e;
                    return (0, l.a)({
                        root: ["root", r && "inset", i && "dense", a && n && "multiline"],
                        primary: ["primary"],
                        secondary: ["secondary"]
                    }, c.g, t)
                })(C);
            return null == R || R.type === f.T || y || (R = (0, u.jsx)(f.T, (0, o._)({
                variant: E ? "body2" : "body1",
                className: O.primary,
                component: null != v && v.variant ? void 0 : "span",
                display: "block"
            }, v, {
                children: R
            }))), null == w || w.type === f.T || y || (w = (0, u.jsx)(f.T, (0, o._)({
                variant: "body2",
                className: O.secondary,
                color: "text.secondary",
                display: "block"
            }, S, {
                children: w
            }))), (0, u.jsxs)(p, (0, o._)({
                className: (0, l.c)(O.root, h),
                ownerState: C,
                ref: t
            }, x, {
                children: [R, w]
            }))
        });
    var y = (0, a.default)({
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
        g = (0, r.forwardRef)(function(e, a) {
            var i = e.classes,
                o = e.className,
                l = (0, t.a)(e, ["classes", "className"]),
                s = y(void 0, {
                    props: {
                        classes: (0, n.default)(i, o)
                    }
                });
            return r.default.createElement(h, (0, t._)({}, l, {
                classes: s.classes,
                ref: a
            }))
        });
    e.s(["ListItemText", 0, g], 584334)
}, 998331, e => {
    "use strict";
    var t = e.i(696180),
        r = e.i(273589),
        a = (0, t.g)("MuiListItemButton", ["root", "focusVisible", "dense", "alignItemsFlexStart", "disabled", "divider", "gutters", "selected"]);
    e.s(["g", 0, function(e) {
        return (0, r.g)("MuiListItemButton", e)
    }, "l", 0, a])
}, 916417, e => {
    "use strict";
    var t = e.i(865800),
        r = "https://cdn.foundation.roblox.com/current/fonts/builder-sans/",
        a = "https://cdn.foundation.roblox.com/current/fonts/builder-mono/",
        n = "https://cdn.foundation.roblox.com/current/fonts/builder-extended/",
        i = "'Builder Sans'",
        o = "'Builder Mono'",
        l = [i, "Helvetica", "Arial", "san-serif"].join(", "),
        s = [o, "monospace"].join(", "),
        c = {
            fontFamily: i,
            fontWeight: 400,
            fontStyle: "normal"
        },
        u = {
            fontFamily: i,
            fontWeight: 600,
            fontStyle: "normal"
        },
        d = {
            fontFamily: i,
            fontWeight: 700,
            fontStyle: "normal"
        },
        f = {
            fontFamily: o,
            fontWeight: 400,
            fontStyle: "normal"
        },
        m = "'Builder Extended'",
        p = [m, "Helvetica", "Arial", "san-serif"].join(", "),
        h = {
            fontFamily: m,
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
            src: "url(".concat(a, "BuilderMono-Regular.woff2) format('woff2'), url(").concat(a, "BuilderMono-Regular.woff) format('woff')"),
            fontDisplay: "swap"
        }), (0, t._)((0, t._)({}, h), {
            src: "url(".concat(n, "BuilderExtended-Bold.woff2) format('woff2'), url(").concat(n, "BuilderExtended-Bold.woff) format('woff')"),
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
                    fontFamily: p,
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
        a = e.i(797301),
        n = e.i(208958);
    let i = ["className", "elementType", "ownerState", "externalForwardedProps", "getSlotOwnerState", "internalForwardedProps"],
        o = ["component", "slots", "slotProps"],
        l = ["component"];
    e.s(["u", 0, function(e, s) {
        let {
            className: c,
            elementType: u,
            ownerState: d,
            externalForwardedProps: f,
            getSlotOwnerState: m,
            internalForwardedProps: p
        } = s, h = (0, r._)(s, i), {
            component: y,
            slots: g = {
                [e]: void 0
            },
            slotProps: b = {
                [e]: void 0
            }
        } = f, v = (0, r._)(f, o), _ = g[e] || u, S = (0, a.r)(b[e], d), x = (0, a.m)((0, t._)({
            className: c
        }, h, {
            externalForwardedProps: "root" === e ? v : void 0,
            externalSlotProps: S
        })), {
            props: {
                component: E
            },
            internalRef: R
        } = x, w = (0, r._)(x.props, l), C = (0, n.u)(R, null == S ? void 0 : S.ref, s.ref), O = m ? m(w) : {}, P = (0, t._)({}, d, O), M = "root" === e ? E || y : E, j = (0, a.a)(_, (0, t._)({}, "root" === e && !y && !g[e] && p, "root" !== e && !g[e] && p, w, M && {
            as: M
        }, {
            ref: C
        }), P);
        return Object.keys(O).forEach(e => {
            delete j[e]
        }), [_, j]
    }])
}, 101873, e => {
    "use strict";
    var t = e.i(896729),
        r = e.i(252900);
    e.s(["u", 0, function(e) {
        let {
            props: a,
            name: n,
            defaultTheme: i,
            themeId: o
        } = e, l = (0, r.u)(i);
        return o && (l = l[o] || l), (0, t.g)({
            theme: l,
            name: n,
            props: a
        })
    }])
}, 620068, 221180, e => {
    "use strict";
    var t = e.i(371927);
    e.i(416340);
    var r = t.u;
    e.s(["default", 0, r], 221180), e.s(["useMediaQuery", 0, r], 620068)
}, 182012, 436175, e => {
    "use strict";
    var t, r, a, n, i, o, l, s, c, u, d, f = e.i(416340),
        m = e.i(711300),
        p = e.i(634203),
        h = e.i(35877),
        y = e.i(422898),
        g = e.i(630844),
        b = e.i(665564),
        v = e.i(199189),
        _ = e.i(919122),
        S = (t = new WeakMap, r = new WeakMap, a = new WeakMap, n = new WeakMap, i = new WeakSet, class extends v.Removable {
            setOptions(e) {
                this.options = e, this.updateGcTime(this.options.gcTime)
            }
            get meta() {
                return this.options.meta
            }
            addObserver(e) {
                (0, m._)(this, r).includes(e) || ((0, m._)(this, r).push(e), this.clearGcTimeout(), (0, m._)(this, a).notify({
                    type: "observerAdded",
                    mutation: this,
                    observer: e
                }))
            }
            removeObserver(e) {
                (0, h._)(this, r, (0, m._)(this, r).filter(t => t !== e)), this.scheduleGc(), (0, m._)(this, a).notify({
                    type: "observerRemoved",
                    mutation: this,
                    observer: e
                })
            }
            optionalRemove() {
                (0, m._)(this, r).length || ("pending" === this.state.status ? this.scheduleGc() : (0, m._)(this, a).remove(this))
            }
            continue () {
                var e, t;
                return null != (e = null == (t = (0, m._)(this, n)) ? void 0 : t.continue()) ? e : this.execute(this.state.variables)
            }
            async execute(e) {
                var r, o, l, s, c, u, d, f, p, g, b, v, S, x, R, w, C, O, P, M, j;
                let T = () => {
                        (0, y._)(this, i, E).call(this, {
                            type: "continue"
                        })
                    },
                    k = {
                        client: (0, m._)(this, t),
                        meta: this.options.meta,
                        mutationKey: this.options.mutationKey
                    };
                (0, h._)(this, n, (0, _.createRetryer)({
                    fn: () => this.options.mutationFn ? this.options.mutationFn(e, k) : Promise.reject(Error("No mutationFn found")),
                    onFail: (e, t) => {
                        (0, y._)(this, i, E).call(this, {
                            type: "failed",
                            failureCount: e,
                            error: t
                        })
                    },
                    onPause: () => {
                        (0, y._)(this, i, E).call(this, {
                            type: "pause"
                        })
                    },
                    onContinue: T,
                    retry: null != (r = this.options.retry) ? r : 0,
                    retryDelay: this.options.retryDelay,
                    networkMode: this.options.networkMode,
                    canRun: () => (0, m._)(this, a).canRun(this)
                }));
                let L = "pending" === this.state.status,
                    z = !(0, m._)(this, n).canStart();
                try {
                    if (L) T();
                    else {
                        (0, y._)(this, i, E).call(this, {
                            type: "pending",
                            variables: e,
                            isPaused: z
                        }), await (null == (g = (b = (0, m._)(this, a).config).onMutate) ? void 0 : g.call(b, e, this, k));
                        let t = await (null == (v = (S = this.options).onMutate) ? void 0 : v.call(S, e, k));
                        t !== this.state.context && (0, y._)(this, i, E).call(this, {
                            type: "pending",
                            context: t,
                            variables: e,
                            isPaused: z
                        })
                    }
                    let t = await (0, m._)(this, n).start();
                    return await (null == (o = (l = (0, m._)(this, a).config).onSuccess) ? void 0 : o.call(l, t, e, this.state.context, this, k)), await (null == (s = (c = this.options).onSuccess) ? void 0 : s.call(c, t, e, this.state.context, k)), await (null == (u = (d = (0, m._)(this, a).config).onSettled) ? void 0 : u.call(d, t, null, this.state.variables, this.state.context, this, k)), await (null == (f = (p = this.options).onSettled) ? void 0 : f.call(p, t, null, e, this.state.context, k)), (0, y._)(this, i, E).call(this, {
                        type: "success",
                        data: t
                    }), t
                } catch (t) {
                    try {
                        throw await (null == (x = (R = (0, m._)(this, a).config).onError) ? void 0 : x.call(R, t, e, this.state.context, this, k)), await (null == (w = (C = this.options).onError) ? void 0 : w.call(C, t, e, this.state.context, k)), await (null == (O = (P = (0, m._)(this, a).config).onSettled) ? void 0 : O.call(P, void 0, t, this.state.variables, this.state.context, this, k)), await (null == (M = (j = this.options).onSettled) ? void 0 : M.call(j, void 0, t, e, this.state.context, k)), t
                    } finally {
                        (0, y._)(this, i, E).call(this, {
                            type: "error",
                            error: t
                        })
                    }
                } finally {
                    (0, m._)(this, a).runNext(this)
                }
            }
            constructor(e) {
                super(), (0, g._)(this, i), (0, p._)(this, t, {
                    writable: !0,
                    value: void 0
                }), (0, p._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, p._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, p._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, t, e.client), this.mutationId = e.mutationId, (0, h._)(this, a, e.mutationCache), (0, h._)(this, r, []), this.state = e.state || x(), this.setOptions(e.options), this.scheduleGc()
            }
        });

    function x() {
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

    function E(e) {
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
            (0, m._)(this, r).forEach(t => {
                t.onMutationUpdate(e)
            }), (0, m._)(this, a).notify({
                mutation: this,
                type: "updated",
                action: e
            })
        })
    }
    e.s(["Mutation", 0, S, "getDefaultState", 0, x], 436175);
    var R = e.i(211089),
        w = e.i(711367),
        C = (o = new WeakMap, l = new WeakMap, s = new WeakMap, c = new WeakMap, u = new WeakSet, d = new WeakSet, class extends R.Subscribable {
            bindMethods() {
                this.mutate = this.mutate.bind(this), this.reset = this.reset.bind(this)
            }
            setOptions(e) {
                var t;
                let r = this.options;
                this.options = (0, m._)(this, o).defaultMutationOptions(e), (0, w.shallowEqualObjects)(this.options, r) || (0, m._)(this, o).getMutationCache().notify({
                    type: "observerOptionsUpdated",
                    mutation: (0, m._)(this, s),
                    observer: this
                }), (null == r ? void 0 : r.mutationKey) && this.options.mutationKey && (0, w.hashKey)(r.mutationKey) !== (0, w.hashKey)(this.options.mutationKey) ? this.reset() : (null == (t = (0, m._)(this, s)) ? void 0 : t.state.status) === "pending" && (0, m._)(this, s).setOptions(this.options)
            }
            onUnsubscribe() {
                if (!this.hasListeners()) {
                    var e;
                    null == (e = (0, m._)(this, s)) || e.removeObserver(this)
                }
            }
            onMutationUpdate(e) {
                (0, y._)(this, u, O).call(this), (0, y._)(this, d, P).call(this, e)
            }
            getCurrentResult() {
                return (0, m._)(this, l)
            }
            reset() {
                var e;
                null == (e = (0, m._)(this, s)) || e.removeObserver(this), (0, h._)(this, s, void 0), (0, y._)(this, u, O).call(this), (0, y._)(this, d, P).call(this)
            }
            mutate(e, t) {
                var r;
                return (0, h._)(this, c, t), null == (r = (0, m._)(this, s)) || r.removeObserver(this), (0, h._)(this, s, (0, m._)(this, o).getMutationCache().build((0, m._)(this, o), this.options)), (0, m._)(this, s).addObserver(this), (0, m._)(this, s).execute(e)
            }
            constructor(e, t) {
                super(), (0, g._)(this, u), (0, g._)(this, d), (0, p._)(this, o, {
                    writable: !0,
                    value: void 0
                }), (0, p._)(this, l, {
                    writable: !0,
                    value: void 0
                }), (0, p._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, p._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, o, e), this.setOptions(t), this.bindMethods(), (0, y._)(this, u, O).call(this)
            }
        });

    function O() {
        var e, t;
        let r = null != (e = null == (t = (0, m._)(this, s)) ? void 0 : t.state) ? e : x();
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

    function P(e) {
        b.notifyManager.batch(() => {
            if ((0, m._)(this, c) && this.hasListeners()) {
                var t, r, a, n, i, s, u, d;
                let f = (0, m._)(this, l).variables,
                    p = (0, m._)(this, l).context,
                    h = {
                        client: (0, m._)(this, o),
                        meta: this.options.meta,
                        mutationKey: this.options.mutationKey
                    };
                (null == e ? void 0 : e.type) === "success" ? (null == (t = (r = (0, m._)(this, c)).onSuccess) || t.call(r, e.data, f, p, h), null == (a = (n = (0, m._)(this, c)).onSettled) || a.call(n, e.data, null, f, p, h)) : (null == e ? void 0 : e.type) === "error" && (null == (i = (s = (0, m._)(this, c)).onError) || i.call(s, e.error, f, p, h), null == (u = (d = (0, m._)(this, c)).onSettled) || u.call(d, void 0, e.error, f, p, h))
            }
            this.listeners.forEach(e => {
                e((0, m._)(this, l))
            })
        })
    }
    var M = e.i(795621);
    e.s(["useMutation", 0, function(e, t) {
        let r = (0, M.useQueryClient)(t),
            [a] = f.useState(() => new C(r, e));
        f.useEffect(() => {
            a.setOptions(e)
        }, [a, e]);
        let n = f.useSyncExternalStore(f.useCallback(e => a.subscribe(b.notifyManager.batchCalls(e)), [a]), () => a.getCurrentResult(), () => a.getCurrentResult()),
            i = f.useCallback((e, t) => {
                a.mutate(e, t).catch(w.noop)
            }, [a]);
        if (n.error && (0, w.shouldThrowError)(a.options.throwOnError, [n.error])) throw n.error;
        return {
            ...n,
            mutate: i,
            mutateAsync: n.mutate
        }
    }], 182012)
}, 197649, e => {
    "use strict";

    function t() {
        for (var e, t, r = 0, a = "", n = arguments.length; r < n; r++)(e = arguments[r]) && (t = function e(t) {
            var r, a, n = "";
            if ("string" == typeof t || "number" == typeof t) n += t;
            else if ("object" == typeof t)
                if (Array.isArray(t)) {
                    var i = t.length;
                    for (r = 0; r < i; r++) t[r] && (a = e(t[r])) && (n && (n += " "), n += a)
                } else
                    for (a in t) t[a] && (n && (n += " "), n += a);
            return n
        }(e)) && (a && (a += " "), a += t);
        return a
    }
    e.s(["clsx", 0, t, "default", 0, t])
}, 548972, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        HTTPAccessErrorStatus: function() {
            return i
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
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = {
            NOT_FOUND: 404,
            FORBIDDEN: 403,
            UNAUTHORIZED: 401
        },
        o = new Set(Object.values(i)),
        l = "NEXT_HTTP_ERROR_FALLBACK";

    function s(e) {
        if ("object" != typeof e || null === e || !("digest" in e) || "string" != typeof e.digest) return !1;
        let [t, r] = e.digest.split(";");
        return t === l && o.has(Number(r))
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
            return i
        }
    });
    let a = e.r(548972),
        n = e.r(489069);

    function i(e) {
        return (0, n.isRedirectError)(e) || (0, a.isHTTPAccessFallbackError)(e)
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 620712, (e, t, r) => {
    "use strict";
    let a, n;
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var i = {
        useDynamicRouteParams: function() {
            return a
        },
        useDynamicSearchParams: function() {
            return n
        }
    };
    for (var o in i) Object.defineProperty(r, o, {
        enumerable: !0,
        get: i[o]
    });
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 261514, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        ServerInsertedHTMLContext: function() {
            return o
        },
        useServerInsertedHTML: function() {
            return l
        }
    };
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = e.r(887602)._(e.r(416340)),
        o = i.default.createContext(null);

    function l(e) {
        let t = (0, i.useContext)(o);
        t && t(e)
    }
}, 636657, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        UnrecognizedActionError: function() {
            return i
        },
        unstable_isUnrecognizedActionError: function() {
            return o
        }
    };
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    class i extends Error {
        constructor(...e) {
            super(...e), this.name = "UnrecognizedActionError"
        }
    }

    function o(e) {
        return !!(e && "object" == typeof e && e instanceof i)
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
            return i
        }
    });
    let a = e.r(548972),
        n = "".concat(a.HTTP_ERROR_FALLBACK_ERROR_CODE, ";404");

    function i() {
        let e = Object.defineProperty(Error(n), "__NEXT_ERROR_CODE", {
            value: "E1041",
            enumerable: !1,
            configurable: !0
        });
        throw e.digest = n, e
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 911627, (e, t, r) => {
    "use strict";

    function a() {
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
            return a
        }
    }), e.r(548972).HTTP_ERROR_FALLBACK_ERROR_CODE, ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 571536, (e, t, r) => {
    "use strict";

    function a() {
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
            return a
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
            return n
        }
    });
    class a extends Error {
        constructor() {
            super("Method unavailable on `ReadonlyURLSearchParams`. Read more: https://nextjs.org/docs/app/api-reference/functions/use-search-params#updating-searchparams"), Object.defineProperty(this, "__NEXT_ERROR_CODE", {
                value: "E1174",
                enumerable: !1,
                configurable: !0
            })
        }
    }
    class n extends URLSearchParams {
        append() {
            throw new a
        }
        delete() {
            throw new a
        }
        set() {
            throw new a
        }
        sort() {
            throw new a
        }
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 489069, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        REDIRECT_ERROR_CODE: function() {
            return o
        },
        isRedirectError: function() {
            return l
        }
    };
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = e.r(17374),
        o = "NEXT_REDIRECT";

    function l(e) {
        if ("object" != typeof e || null === e || !("digest" in e) || "string" != typeof e.digest) return !1;
        let t = e.digest.split(";"),
            [r, a] = t,
            n = t.slice(2, -2).join(";"),
            l = Number(t.at(-2));
        return r === o && ("replace" === a || "push" === a) && "string" == typeof n && !isNaN(l) && l in i.RedirectStatusCode
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
            return n
        }
    });
    var a, n = ((a = {})[a.SeeOther = 303] = "SeeOther", a[a.TemporaryRedirect = 307] = "TemporaryRedirect", a[a.PermanentRedirect = 308] = "PermanentRedirect", a);
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 709817, (e, t, r) => {
    "use strict";
    let a, n, i;
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var o = {
        actionAsyncStorage: function() {
            return a
        },
        workAsyncStorage: function() {
            return n
        },
        workUnitAsyncStorage: function() {
            return i
        }
    };
    for (var l in o) Object.defineProperty(r, l, {
        enumerable: !0,
        get: o[l]
    });
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 892416, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        getRedirectError: function() {
            return s
        },
        getRedirectStatusCodeFromError: function() {
            return m
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
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = e.r(17374),
        o = e.r(489069),
        l = e.r(709817);

    function s(e, t) {
        let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : i.RedirectStatusCode.TemporaryRedirect,
            a = Object.defineProperty(Error(o.REDIRECT_ERROR_CODE), "__NEXT_ERROR_CODE", {
                value: "E394",
                enumerable: !1,
                configurable: !0
            });
        return a.digest = "".concat(o.REDIRECT_ERROR_CODE, ";").concat(t, ";").concat(e, ";").concat(r, ";"), a
    }

    function c(e, t) {
        var r, a;
        throw null != t || (t = (null == (a = l.actionAsyncStorage) || null == (r = a.getStore()) ? void 0 : r.isAction) ? "push" : "replace"), s(e, t, i.RedirectStatusCode.TemporaryRedirect)
    }

    function u(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "replace";
        throw s(e, t, i.RedirectStatusCode.PermanentRedirect)
    }

    function d(e) {
        return (0, o.isRedirectError)(e) ? e.digest.split(";").slice(2, -2).join(";") : null
    }

    function f(e) {
        if (!(0, o.isRedirectError)(e)) throw Object.defineProperty(Error("Not a redirect error"), "__NEXT_ERROR_CODE", {
            value: "E260",
            enumerable: !1,
            configurable: !0
        });
        return e.digest.split(";", 2)[1]
    }

    function m(e) {
        if (!(0, o.isRedirectError)(e)) throw Object.defineProperty(Error("Not a redirect error"), "__NEXT_ERROR_CODE", {
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
                if ((0, n.isNextRouterError)(t) || (0, a.isBailoutToCSRError)(t)) throw t;
                t instanceof Error && "cause" in t && e(t.cause)
            }
        }
    });
    let a = e.r(450392),
        n = e.r(248643);
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 786200, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        ReadonlyURLSearchParams: function() {
            return i.ReadonlyURLSearchParams
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
            return o.permanentRedirect
        },
        redirect: function() {
            return o.redirect
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
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = e.r(498611),
        o = e.r(892416),
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
    var a = {
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
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = e.r(887602)._(e.r(416340)),
        o = e.r(419810),
        l = e.r(956959),
        s = e.r(970739),
        c = e.r(620712),
        u = e.r(261514),
        d = e.r(636657),
        f = e.r(786200),
        {
            instrumentParamsForClientValidation: m,
            instrumentSearchParamsForClientValidation: p,
            expectCompleteParamsInClientValidation: h
        } = {};

    function y() {
        var e;
        null == (e = c.useDynamicSearchParams) || e.call(c, "useSearchParams()");
        let t = (0, i.useContext)(l.SearchParamsContext);
        return (0, i.useMemo)(() => t ? new l.ReadonlyURLSearchParams(t) : null, [t])
    }

    function g() {
        var e;
        return null == (e = c.useDynamicRouteParams) || e.call(c, "usePathname()"), (0, i.useContext)(l.PathnameContext)
    }

    function b() {
        var e;
        let t = (0, i.useContext)(o.AppRouterContext);
        if (null === t) throw Object.defineProperty(Error("invariant expected app router to be mounted"), "__NEXT_ERROR_CODE", {
            value: "E238",
            enumerable: !1,
            configurable: !0
        });
        let r = (0, i.useContext)(o.LayoutRouterContext),
            a = null != (e = null == r ? void 0 : r.parentCacheNode.bfcacheId) ? e : 0;
        return (0, i.useMemo)(() => ({
            back: t.back,
            forward: t.forward,
            refresh: t.refresh,
            hmrRefresh: t.hmrRefresh,
            push: t.push,
            replace: t.replace,
            prefetch: t.prefetch,
            experimental_gesturePush: t.experimental_gesturePush,
            bfcacheId: "_b_" + a + "_"
        }), [t, a])
    }

    function v() {
        var e;
        return null == (e = c.useDynamicRouteParams) || e.call(c, "useParams()"), (0, i.useContext)(l.PathParamsContext)
    }

    function _() {
        var e;
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "children";
        null == (e = c.useDynamicRouteParams) || e.call(c, "useSelectedLayoutSegments()");
        let r = (0, i.useContext)(o.LayoutRouterContext);
        return r ? (0, s.getSelectedLayoutSegmentPath)(r.parentTree, t) : null
    }

    function S() {
        var e;
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "children";
        null == (e = c.useDynamicRouteParams) || e.call(c, "useSelectedLayoutSegment()"), (0, i.useContext)(l.NavigationPromisesContext);
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
    var a = {
        AppRouterContext: function() {
            return o
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
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = e.r(2879)._(e.r(416340)),
        o = i.default.createContext(null),
        l = i.default.createContext(null),
        s = i.default.createContext(null),
        c = i.default.createContext(null),
        u = i.default.createContext(new Set)
}, 103509, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        default: function() {
            return h
        },
        defaultHead: function() {
            return d
        }
    };
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = e.r(2879),
        o = e.r(887602),
        l = e.r(221628),
        s = o._(e.r(416340)),
        c = i._(e.r(918590)),
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
    let m = ["name", "httpEquiv", "charSet", "itemProp"];

    function p(e) {
        let t, r, a, n;
        return e.reduce(f, []).reverse().concat(d().reverse()).filter((t = new Set, r = new Set, a = new Set, n = {}, e => {
            let i = !0,
                o = !1;
            if (e.key && "number" != typeof e.key && e.key.indexOf("$") > 0) {
                o = !0;
                let r = e.key.slice(e.key.indexOf("$") + 1);
                t.has(r) ? i = !1 : t.add(r)
            }
            switch (e.type) {
                case "title":
                case "base":
                    r.has(e.type) ? i = !1 : r.add(e.type);
                    break;
                case "meta":
                    for (let t = 0, r = m.length; t < r; t++) {
                        let r = m[t];
                        if (e.props.hasOwnProperty(r))
                            if ("charSet" === r) a.has(r) ? i = !1 : a.add(r);
                            else {
                                let t = e.props[r],
                                    a = n[r] || new Set;
                                ("name" !== r || !o) && a.has(t) ? i = !1 : (a.add(t), n[r] = a)
                            }
                    }
            }
            return i
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
            reduceComponentsToState: p,
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
    var a = {
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
            return o.ReadonlyURLSearchParams
        },
        SearchParamsContext: function() {
            return l
        },
        createDevToolsInstrumentedPromise: function() {
            return d
        }
    };
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = e.r(416340),
        o = e.r(498611),
        l = (0, i.createContext)(null),
        s = (0, i.createContext)(null),
        c = (0, i.createContext)(null),
        u = (0, i.createContext)(null);

    function d(e, t) {
        let r = Promise.resolve(t);
        return r.status = "fulfilled", r.value = t, r.displayName = "".concat(e, " (SSR)"), r
    }
}, 450392, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        BailoutToCSRError: function() {
            return o
        },
        isBailoutToCSRError: function() {
            return l
        }
    };
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = "BAILOUT_TO_CLIENT_SIDE_RENDERING";
    class o extends Error {
        constructor(e) {
            super("Bail out to client-side rendering: ".concat(e)), this.reason = e, this.digest = i
        }
    }

    function l(e) {
        return "object" == typeof e && null !== e && "digest" in e && e.digest === i
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
    let a = e.r(416340),
        n = "u" < typeof window,
        i = n ? () => {} : a.useLayoutEffect,
        o = n ? () => {} : a.useEffect;

    function l(e) {
        let {
            headManager: t,
            reduceComponentsToState: r
        } = e;

        function l() {
            if (t && t.mountedInstances) {
                let e = a.Children.toArray(Array.from(t.mountedInstances).filter(Boolean));
                t.updateHead(r(e))
            }
        }
        if (n) {
            var s;
            null == t || null == (s = t.mountedInstances) || s.add(e.children), l()
        }
        return i(() => {
            var r;
            return null == t || null == (r = t.mountedInstances) || r.add(e.children), () => {
                var r;
                null == t || null == (r = t.mountedInstances) || r.delete(e.children)
            }
        }), i(() => (t && (t._pendingUpdate = l), () => {
            t && (t._pendingUpdate = l)
        })), o(() => (t && t._pendingUpdate && (t._pendingUpdate(), t._pendingUpdate = null), () => {
            t && t._pendingUpdate && (t._pendingUpdate(), t._pendingUpdate = null)
        })), null
    }
}, 298372, (e, t, r) => {
    t.exports = e.r(103509)
}, 37819, e => {
    "use strict";
    var t = e.i(721281),
        r = e.i(772738),
        a = e.i(237401),
        n = e.i(416340),
        i = e.i(298372);
    let o = {
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
    let m = r.z.union([r.z.string(), r.z.object({
            translationKey: r.z.string(),
            translationKeyParams: r.z.record(r.z.string(), r.z.string()).optional(),
            defaultLabel: r.z.string().optional()
        })]),
        p = r.z.object({
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
            author: p.optional(),
            type: r.z.string().optional(),
            isTitleCode: r.z.boolean().optional(),
            label: m.optional(),
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
                let a = function(e) {
                    var t;
                    if (!e || "object" != typeof e || e.metadata) return null;
                    let {
                        title: r
                    } = e, a = null != (t = e.path) ? t : e.id;
                    if ("string" != typeof r || !r || "string" != typeof a || !a) return null;
                    let n = "string" == typeof e.id && e.id ? e.id : a,
                        i = Date.now();
                    "number" == typeof e.accessedAt ? i = e.accessedAt : "string" == typeof e.accessedAt && (i = new Date(e.accessedAt).getTime() || Date.now());
                    let {
                        id: o,
                        accessedAt: l,
                        ...s
                    } = e;
                    return {
                        id: n,
                        accessedAt: i,
                        metadata: {
                            title: r,
                            path: a,
                            ...s
                        }
                    }
                }(t);
                if (a) {
                    let t = y.safeParse(a);
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
                a = new Map;
            t.forEach(e => a.set(e.id, e)), r.forEach(e => {
                let t = a.get(e.id);
                (!t || e.accessedAt > t.accessedAt) && a.set(e.id, e)
            });
            let n = Array.from(a.values()).sort((e, t) => t.accessedAt - e.accessedAt).slice(0, this.config.maxStoredItems);
            g.setItem(this.storageKey, JSON.stringify(n)), g.removeItem(e)
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
                    a = e.id.includes("?"),
                    n = t.filter(t => t.id !== e.id && (t.id.split("?")[0] !== r || t.metadata.title !== e.metadata.title || !!t.id.includes("?") && !!a)),
                    i = [e, ...n].slice(0, this.config.maxStoredItems);
                g.setItem(this.storageKey, JSON.stringify(i))
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
                ...o,
                ...e
            }, this.maxDaysAgoTimestamp = Date.now() - 24 * this.config.maxDaysAgo * 36e5
        }
    };

    function _() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        let a = t.filter(Boolean);
        return a.length > 0 ? a.join(" / ") : void 0
    }

    function S(e) {
        let {
            origin: t,
            pathname: r,
            search: a
        } = e, n = "".concat(t).concat(r).concat(a), i = new URLSearchParams(a);
        Array.from(i.keys()).filter(e => !o.queryParamsToKeep.includes(e)).forEach(e => i.delete(e)), i.sort();
        let l = i.toString(),
            s = "".concat(r).concat(l ? "?".concat(l) : ""),
            c = "".concat(t).concat(s);
        return {
            id: s,
            cleanedUrl: c,
            originalUrl: n
        }
    }

    function x(e) {
        var t;
        let r = null != (t = document.querySelector('meta[property="'.concat(e, '"]'))) ? t : document.querySelector('meta[name="'.concat(e, '"]'));
        return (null == r ? void 0 : r.content) || void 0
    }

    function E(e) {
        return x("".concat(u).concat(e))
    }

    function R(e, t) {
        return E(e) || x(t) || void 0
    }

    function w() {
        let e = {
                title: E("title") || document.title || x("og:title") || ""
            },
            t = R("description", "og:description") || x("description");
        t && (e.description = t);
        let r = R("site_name", "og:site_name");
        r && (e.siteName = r);
        let a = R("type", "og:type");
        a && (e.contentType = a);
        let n = R("author", "article:author");
        n && (e.authorName = n);
        let i = E("entity-name");
        i && (e.entityName = i);
        let o = E("entity-id");
        o && (e.entityId = o);
        let l = E("user-id");
        l && (e.userId = l);
        let s = x("keywords");
        s && (e.keywords = s);
        let c = E("breadcrumb");
        c && (e.breadcrumb = c);
        let u = E("label");
        if (u) try {
            e.label = JSON.parse(u)
        } catch (t) {
            e.label = u
        }
        return "true" === E("is-title-code") && (e.isTitleCode = !0), e
    }
    class C {
        collect() {
            return this.collectFn()
        }
        constructor() {
            (0, t._)(this, "collectFn", w)
        }
    }
    class O {
        detect(e, t) {
            var r;
            this.cleanup();
            let a = () => {
                this.cleanupPrimary();
                let r = e.collect();
                t(r), this.watchForLateUpdates(e, r.title, t)
            };
            this.maxTimer = setTimeout(a, 3e3);
            let n = () => {
                this.debounceTimer && clearTimeout(this.debounceTimer), this.debounceTimer = setTimeout(a, 300)
            };
            this.observer = new MutationObserver(() => {
                n()
            });
            let i = null != (r = document.head) ? r : document.querySelector("head");
            i && this.observer.observe(i, {
                childList: !0,
                subtree: !0,
                characterData: !0,
                attributes: !0
            }), n()
        }
        watchForLateUpdates(e, t, r) {
            var a;
            let n = null != (a = document.head) ? a : document.querySelector("head");
            if (!n) return;
            this.postSettleTimer = setTimeout(() => {
                this.cleanupPostSettle()
            }, 5e3);
            let i = 'meta[name="'.concat(u, 'title"]');
            this.postSettleObserver = new MutationObserver(() => {
                let a = document.querySelector(i),
                    n = null == a ? void 0 : a.content;
                n && n !== t && (this.cleanupPostSettle(), r(e.collect()))
            }), this.postSettleObserver.observe(n, {
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
    let P = (0, n.createContext)({
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

    function M() {
        return S(window.location)
    }
    let j = n.default.memo(e => {
        var t, r;
        let {
            hubOnly: a = !1,
            title: o,
            seoTitle: l,
            ogTitle: s,
            description: c,
            seoDescription: d,
            ogDescription: m,
            author: p,
            seoAuthor: h,
            siteName: y = f.CreatorHub,
            keywords: g,
            robots: b,
            ogImage: v,
            ogUrl: S,
            ogType: x,
            canonical: E,
            type: R,
            entityName: w,
            entityId: C,
            userId: O,
            label: P,
            breadcrumb: M,
            breadcrumbItems: j,
            isTitleCode: T,
            children: k
        } = e, L = e => a ? void 0 : e, z = L(null != l ? l : o), I = L(null != (t = null != s ? s : l) ? t : o), N = L(null != d ? d : c), A = L(null != (r = null != m ? m : d) ? r : c), F = L(null != h ? h : p), B = null != M ? M : j && j.length > 0 ? _(...j.map(e => e.name)) : void 0;
        return n.default.createElement(i.default, null, z && n.default.createElement("title", null, z), I && n.default.createElement("meta", {
            property: "og:title",
            content: I,
            key: "og:title"
        }), o && n.default.createElement("meta", {
            name: "".concat(u, "title"),
            content: o,
            key: "".concat(u, "title")
        }), A && n.default.createElement("meta", {
            property: "og:description",
            content: A,
            key: "og:description"
        }), N && n.default.createElement("meta", {
            name: "description",
            content: N,
            key: "description"
        }), c && n.default.createElement("meta", {
            name: "".concat(u, "description"),
            content: c,
            key: "".concat(u, "description")
        }), F && n.default.createElement("meta", {
            property: "article:author",
            content: F,
            key: "article:author"
        }), p && n.default.createElement("meta", {
            name: "".concat(u, "author"),
            content: p,
            key: "".concat(u, "author")
        }), !a && n.default.createElement("meta", {
            property: "og:site_name",
            content: y,
            key: "og:site_name"
        }), n.default.createElement("meta", {
            name: "".concat(u, "site_name"),
            content: y,
            key: "".concat(u, "site_name")
        }), !a && g && n.default.createElement("meta", {
            name: "keywords",
            content: g,
            key: "keywords"
        }), !a && b && n.default.createElement("meta", {
            name: "robots",
            content: b,
            key: "robots"
        }), !a && v && n.default.createElement("meta", {
            property: "og:image",
            content: v,
            key: "og:image"
        }), !a && S && n.default.createElement("meta", {
            property: "og:url",
            content: S,
            key: "og:url"
        }), !a && x && n.default.createElement("meta", {
            property: "og:type",
            content: x,
            key: "og:type"
        }), !a && E && n.default.createElement("link", {
            rel: "canonical",
            href: E
        }), R && n.default.createElement("meta", {
            name: "".concat(u, "type"),
            content: R,
            key: "".concat(u, "type")
        }), w && n.default.createElement("meta", {
            name: "".concat(u, "entity-name"),
            content: w,
            key: "".concat(u, "entity-name")
        }), C && n.default.createElement("meta", {
            name: "".concat(u, "entity-id"),
            content: C,
            key: "".concat(u, "entity-id")
        }), O && n.default.createElement("meta", {
            name: "".concat(u, "user-id"),
            content: O,
            key: "".concat(u, "user-id")
        }), P && n.default.createElement("meta", {
            name: "".concat(u, "label"),
            content: P,
            key: "".concat(u, "label")
        }), B && n.default.createElement("meta", {
            name: "".concat(u, "breadcrumb"),
            content: B,
            key: "".concat(u, "breadcrumb")
        }), T && n.default.createElement("meta", {
            name: "".concat(u, "is-title-code"),
            content: "true",
            key: "".concat(u, "is-title-code")
        }), !a && j && j.length > 0 && n.default.createElement("script", {
            type: "application/ld+json",
            key: "breadcrumb-jsonld",
            dangerouslySetInnerHTML: {
                __html: JSON.stringify({
                    "@context": "https://schema.org",
                    "@type": "BreadcrumbList",
                    itemListElement: j.map((e, t) => ({
                        "@type": "ListItem",
                        position: t + 1,
                        name: e.name,
                        item: e.url
                    }))
                })
            }
        }), k)
    });
    j.displayName = "HubMeta", e.s(["HistoryProvider", 0, e => {
        let {
            children: t,
            userId: r,
            getMetadataForPath: i,
            eventLogger: l
        } = e, s = (0, a.useRouter)(), c = (0, n.useRef)(new C), u = (0, n.useRef)(new O);
        (0, n.useEffect)(() => {
            v.setActiveUser(r)
        }, [r]);
        let d = (0, n.useCallback)(e => {
                let {
                    id: t,
                    originalUrl: r
                } = M();
                if (o.pathsToSkip.some(e => e.test(t)) || !e.title) return;
                let {
                    title: a,
                    ...n
                } = e, i = {
                    title: a,
                    path: r,
                    ...n
                };
                v.addToRecentlyVisited({
                    id: t,
                    metadata: i,
                    accessedAt: Date.now()
                })
            }, []),
            f = (0, n.useCallback)(async (e, t) => {
                let {
                    id: r,
                    originalUrl: a
                } = M();
                if (!o.pathsToSkip.some(e => e.test(r))) try {
                    var n;
                    let e = {
                        title: t || (null == (n = document) ? void 0 : n.title) || r,
                        path: a
                    };
                    if (i) {
                        let t = i(r);
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
            }, [i]),
            m = (0, n.useCallback)(async e => v.getRecentlyVisited(e), []),
            p = (0, n.useCallback)(async e => v.removeFromRecentlyVisited(e), []),
            h = (0, n.useCallback)(async () => v.clearHistory(), []);
        (0, n.useEffect)(() => {
            let e = u.current,
                t = c.current,
                r = () => {
                    e.detect(t, e => {
                        d(e)
                    })
                };
            r();
            let a = () => {
                r()
            };
            return s.events.on("routeChangeComplete", a), () => {
                s.events.off("routeChangeComplete", a), e.cleanup()
            }
        }, [s.events, d]);
        let y = (0, n.useMemo)(() => ({
            trackPageVisit: f,
            getRecentlyVisited: m,
            removeFromHistory: p,
            clearHistory: h,
            eventLogger: l
        }), [f, m, p, h, l]);
        return n.default.createElement(P.Provider, {
            value: y
        }, t)
    }, "HubMeta", 0, j, "SiteName", 0, f, "TITLE_SEPARATOR", 0, " / ", "buildBreadcrumb", 0, _, "buildTitle", 0, function() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return t.filter(Boolean).join(" / ")
    }, "cleanUrl", 0, S, "historyClient", 0, v])
}]);

//# debugId=f80b90c7-3101-2f8c-31d1-3b66da9b4f6e
//# sourceMappingURL=2jxi97nb9c84g.js.map
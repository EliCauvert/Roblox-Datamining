;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "4af04034-dd7d-c8a8-5ccc-c855ee4006f1")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 978100, e => {
    "use strict";
    var t = e.i(273589),
        n = e.i(962560),
        r = e.i(416340),
        a = e.i(42569),
        o = e.i(696180),
        i = e.i(221628),
        l = e.i(963320);

    function s(e) {
        return (0, t.g)("MuiCardMedia", e)
    }
    e.i(485511), (0, o.g)("MuiCardMedia", ["root", "media", "img"]);
    let u = ["children", "className", "component", "image", "src", "style"],
        c = (0, a.s)("div", {
            name: "MuiCardMedia",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e, {
                    isMediaComponent: r,
                    isImageComponent: a
                } = n;
                return [t.root, r && t.media, a && t.img]
            }
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, n._)({
                display: "block",
                backgroundSize: "cover",
                backgroundRepeat: "no-repeat",
                backgroundPosition: "center"
            }, t.isMediaComponent && {
                width: "100%"
            }, t.isImageComponent && {
                objectFit: "cover"
            })
        }),
        d = ["video", "audio", "picture", "iframe", "img"],
        f = ["picture", "img"],
        p = r.forwardRef(function(e, r) {
            let o = (0, l.u)({
                    props: e,
                    name: "MuiCardMedia"
                }),
                {
                    children: p,
                    className: v,
                    component: m = "div",
                    image: h,
                    src: b,
                    style: g
                } = o,
                y = (0, t._)(o, u),
                S = -1 !== d.indexOf(m),
                k = !S && h ? (0, n._)({
                    backgroundImage: 'url("'.concat(h, '")')
                }, g) : g,
                x = (0, n._)({}, o, {
                    component: m,
                    isMediaComponent: S,
                    isImageComponent: -1 !== f.indexOf(m)
                }),
                w = (e => {
                    let {
                        classes: t,
                        isMediaComponent: n,
                        isImageComponent: r
                    } = e;
                    return (0, a.a)({
                        root: ["root", n && "media", r && "img"]
                    }, s, t)
                })(x);
            return (0, i.jsx)(c, (0, n._)({
                className: (0, a.c)(w.root, v),
                as: m,
                role: !S && h ? "img" : void 0,
                ref: r,
                style: k,
                ownerState: x,
                src: S ? h || b : void 0
            }, y, {
                children: p
            }))
        });
    e.s(["M", 0, p])
}, 3359, 663991, e => {
    "use strict";
    let t;
    var n = e.i(865800),
        r = e.i(416340),
        a = e.i(614515),
        o = e.i(993807),
        i = e.i(696180),
        l = e.i(273589),
        s = e.i(990857),
        u = e.i(962560),
        c = e.i(42569),
        d = e.i(270673),
        f = e.i(640878),
        p = e.i(983545),
        v = e.i(738508),
        m = e.i(208958),
        h = e.i(969708),
        b = e.i(586278),
        g = e.i(578084),
        y = e.i(797301),
        S = e.i(169923),
        k = e.i(488339),
        x = e.i(221628),
        w = e.i(963320),
        E = e.i(715843);

    function C(e, t) {
        return e - t
    }

    function L(e, t) {
        var n;
        let {
            index: r
        } = null != (n = e.reduce((e, n, r) => {
            let a = Math.abs(t - n);
            return null === e || a < e.distance || a === e.distance ? {
                distance: a,
                index: r
            } : e
        }, null)) ? n : {};
        return r
    }

    function T(e, t) {
        if (void 0 !== t.current && e.changedTouches) {
            for (let n = 0; n < e.changedTouches.length; n += 1) {
                let r = e.changedTouches[n];
                if (r.identifier === t.current) return {
                    x: r.clientX,
                    y: r.clientY
                }
            }
            return !1
        }
        return {
            x: e.clientX,
            y: e.clientY
        }
    }
    e.i(485511);

    function A(e) {
        let {
            values: t,
            newValue: n,
            index: r
        } = e, a = t.slice();
        return a[r] = n, a.sort(C)
    }

    function R(e) {
        var t, n, r;
        let {
            sliderRef: a,
            activeIndex: o,
            setActive: i
        } = e, l = (0, g.o)(a.current);
        null != (t = a.current) && t.contains(l.activeElement) && Number(null == l || null == (n = l.activeElement) ? void 0 : n.getAttribute("data-index")) === o || null == (r = a.current) || r.querySelector('[type="range"][data-index="'.concat(o, '"]')).focus(), i && i(o)
    }

    function M(e, t) {
        return "number" == typeof e && "number" == typeof t ? e === t : "object" == typeof e && "object" == typeof t && function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : (e, t) => e === t;
            return e.length === t.length && e.every((e, r) => n(e, t[r]))
        }(e, t)
    }
    let P = {
            horizontal: {
                offset: e => ({
                    left: "".concat(e, "%")
                }),
                leap: e => ({
                    width: "".concat(e, "%")
                })
            },
            "horizontal-reverse": {
                offset: e => ({
                    right: "".concat(e, "%")
                }),
                leap: e => ({
                    width: "".concat(e, "%")
                })
            },
            vertical: {
                offset: e => ({
                    bottom: "".concat(e, "%")
                }),
                leap: e => ({
                    height: "".concat(e, "%")
                })
            }
        },
        I = e => e;

    function V() {
        return void 0 === t && (t = "u" < typeof CSS || "function" != typeof CSS.supports || CSS.supports("touch-action", "none")), t
    }

    function O(e) {
        return (0, l.g)("MuiSlider", e)
    }
    var N = (0, i.g)("MuiSlider", ["root", "active", "colorPrimary", "colorSecondary", "colorError", "colorInfo", "colorSuccess", "colorWarning", "disabled", "dragging", "focusVisible", "mark", "markActive", "marked", "markLabel", "markLabelActive", "rail", "sizeSmall", "thumb", "thumbColorPrimary", "thumbColorSecondary", "thumbColorError", "thumbColorSuccess", "thumbColorInfo", "thumbColorWarning", "track", "trackInverted", "trackFalse", "thumbSizeSmall", "valueLabel", "valueLabelOpen", "valueLabelCircle", "valueLabelLabel", "vertical"]);
    let F = ["aria-label", "aria-valuetext", "aria-labelledby", "component", "components", "componentsProps", "color", "classes", "className", "disableSwap", "disabled", "getAriaLabel", "getAriaValueText", "marks", "max", "min", "name", "onChange", "onChangeCommitted", "orientation", "shiftStep", "size", "step", "scale", "slotProps", "slots", "tabIndex", "track", "value", "valueLabelDisplay", "valueLabelFormat"];

    function D(e) {
        return e
    }
    let z = (0, c.s)("span", {
            name: "MuiSlider",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.root, t["color".concat((0, l.a)(n.color))], "medium" !== n.size && t["size".concat((0, l.a)(n.size))], n.marked && t.marked, "vertical" === n.orientation && t.vertical, "inverted" === n.track && t.trackInverted, !1 === n.track && t.trackFalse]
            }
        })(e => {
            var t;
            let {
                theme: n
            } = e;
            return {
                borderRadius: 12,
                boxSizing: "content-box",
                display: "inline-block",
                position: "relative",
                cursor: "pointer",
                touchAction: "none",
                WebkitTapHighlightColor: "transparent",
                "@media print": {
                    colorAdjust: "exact"
                },
                ["&.".concat(N.disabled)]: {
                    pointerEvents: "none",
                    cursor: "default",
                    color: (n.vars || n).palette.grey[400]
                },
                ["&.".concat(N.dragging)]: {
                    ["& .".concat(N.thumb, ", & .").concat(N.track)]: {
                        transition: "none"
                    }
                },
                variants: [...Object.keys((null != (t = n.vars) ? t : n).palette).filter(e => {
                    var t;
                    return (null != (t = n.vars) ? t : n).palette[e].main
                }).map(e => ({
                    props: {
                        color: e
                    },
                    style: {
                        color: (n.vars || n).palette[e].main
                    }
                })), {
                    props: {
                        orientation: "horizontal"
                    },
                    style: {
                        height: 4,
                        width: "100%",
                        padding: "13px 0",
                        "@media (pointer: coarse)": {
                            padding: "20px 0"
                        }
                    }
                }, {
                    props: {
                        orientation: "horizontal",
                        size: "small"
                    },
                    style: {
                        height: 2
                    }
                }, {
                    props: {
                        orientation: "horizontal",
                        marked: !0
                    },
                    style: {
                        marginBottom: 20
                    }
                }, {
                    props: {
                        orientation: "vertical"
                    },
                    style: {
                        height: "100%",
                        width: 4,
                        padding: "0 13px",
                        "@media (pointer: coarse)": {
                            padding: "0 20px"
                        }
                    }
                }, {
                    props: {
                        orientation: "vertical",
                        size: "small"
                    },
                    style: {
                        width: 2
                    }
                }, {
                    props: {
                        orientation: "vertical",
                        marked: !0
                    },
                    style: {
                        marginRight: 44
                    }
                }]
            }
        }),
        j = (0, c.s)("span", {
            name: "MuiSlider",
            slot: "Rail",
            overridesResolver: (e, t) => t.rail
        })({
            display: "block",
            position: "absolute",
            borderRadius: "inherit",
            backgroundColor: "currentColor",
            opacity: .38,
            variants: [{
                props: {
                    orientation: "horizontal"
                },
                style: {
                    width: "100%",
                    height: "inherit",
                    top: "50%",
                    transform: "translateY(-50%)"
                }
            }, {
                props: {
                    orientation: "vertical"
                },
                style: {
                    height: "100%",
                    width: "inherit",
                    left: "50%",
                    transform: "translateX(-50%)"
                }
            }, {
                props: {
                    track: "inverted"
                },
                style: {
                    opacity: 1
                }
            }]
        }),
        _ = (0, c.s)("span", {
            name: "MuiSlider",
            slot: "Track",
            overridesResolver: (e, t) => t.track
        })(e => {
            var t;
            let {
                theme: n
            } = e;
            return {
                display: "block",
                position: "absolute",
                borderRadius: "inherit",
                border: "1px solid currentColor",
                backgroundColor: "currentColor",
                transition: n.transitions.create(["left", "width", "bottom", "height"], {
                    duration: n.transitions.duration.shortest
                }),
                variants: [{
                    props: {
                        size: "small"
                    },
                    style: {
                        border: "none"
                    }
                }, {
                    props: {
                        orientation: "horizontal"
                    },
                    style: {
                        height: "inherit",
                        top: "50%",
                        transform: "translateY(-50%)"
                    }
                }, {
                    props: {
                        orientation: "vertical"
                    },
                    style: {
                        width: "inherit",
                        left: "50%",
                        transform: "translateX(-50%)"
                    }
                }, {
                    props: {
                        track: !1
                    },
                    style: {
                        display: "none"
                    }
                }, ...Object.keys((null != (t = n.vars) ? t : n).palette).filter(e => {
                    var t;
                    return (null != (t = n.vars) ? t : n).palette[e].main
                }).map(e => ({
                    props: {
                        color: e,
                        track: "inverted"
                    },
                    style: (0, u._)({}, n.vars ? {
                        backgroundColor: n.vars.palette.Slider["".concat(e, "Track")],
                        borderColor: n.vars.palette.Slider["".concat(e, "Track")]
                    } : (0, u._)({
                        backgroundColor: (0, l.l)(n.palette[e].main, .62),
                        borderColor: (0, l.l)(n.palette[e].main, .62)
                    }, n.applyStyles("dark", {
                        backgroundColor: (0, l.j)(n.palette[e].main, .5)
                    }), n.applyStyles("dark", {
                        borderColor: (0, l.j)(n.palette[e].main, .5)
                    })))
                }))]
            }
        }),
        B = (0, c.s)("span", {
            name: "MuiSlider",
            slot: "Thumb",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.thumb, t["thumbColor".concat((0, l.a)(n.color))], "medium" !== n.size && t["thumbSize".concat((0, l.a)(n.size))]]
            }
        })(e => {
            var t;
            let {
                theme: n
            } = e;
            return {
                position: "absolute",
                width: 20,
                height: 20,
                boxSizing: "border-box",
                borderRadius: "50%",
                outline: 0,
                backgroundColor: "currentColor",
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                transition: n.transitions.create(["box-shadow", "left", "bottom"], {
                    duration: n.transitions.duration.shortest
                }),
                "&::before": {
                    position: "absolute",
                    content: '""',
                    borderRadius: "inherit",
                    width: "100%",
                    height: "100%",
                    boxShadow: (n.vars || n).shadows[2]
                },
                "&::after": {
                    position: "absolute",
                    content: '""',
                    borderRadius: "50%",
                    width: 42,
                    height: 42,
                    top: "50%",
                    left: "50%",
                    transform: "translate(-50%, -50%)"
                },
                ["&.".concat(N.disabled)]: {
                    "&:hover": {
                        boxShadow: "none"
                    }
                },
                variants: [{
                    props: {
                        size: "small"
                    },
                    style: {
                        width: 12,
                        height: 12,
                        "&::before": {
                            boxShadow: "none"
                        }
                    }
                }, {
                    props: {
                        orientation: "horizontal"
                    },
                    style: {
                        top: "50%",
                        transform: "translate(-50%, -50%)"
                    }
                }, {
                    props: {
                        orientation: "vertical"
                    },
                    style: {
                        left: "50%",
                        transform: "translate(-50%, 50%)"
                    }
                }, ...Object.keys((null != (t = n.vars) ? t : n).palette).filter(e => {
                    var t;
                    return (null != (t = n.vars) ? t : n).palette[e].main
                }).map(e => ({
                    props: {
                        color: e
                    },
                    style: {
                        ["&:hover, &.".concat(N.focusVisible)]: (0, u._)({}, n.vars ? {
                            boxShadow: "0px 0px 0px 8px rgba(".concat(n.vars.palette[e].mainChannel, " / 0.16)")
                        } : {
                            boxShadow: "0px 0px 0px 8px ".concat((0, l.b)(n.palette[e].main, .16))
                        }, {
                            "@media (hover: none)": {
                                boxShadow: "none"
                            }
                        }),
                        ["&.".concat(N.active)]: (0, u._)({}, n.vars ? {
                            boxShadow: "0px 0px 0px 14px rgba(".concat(n.vars.palette[e].mainChannel, " / 0.16)")
                        } : {
                            boxShadow: "0px 0px 0px 14px ".concat((0, l.b)(n.palette[e].main, .16))
                        })
                    }
                }))]
            }
        }),
        U = (0, c.s)(function(e) {
            let {
                children: t,
                className: n,
                value: a
            } = e, o = (e => {
                let {
                    open: t
                } = e;
                return {
                    offset: (0, c.c)(t && N.valueLabelOpen),
                    circle: N.valueLabelCircle,
                    label: N.valueLabelLabel
                }
            })(e);
            return t ? r.cloneElement(t, {
                className: (0, c.c)(t.props.className)
            }, (0, x.jsxs)(r.Fragment, {
                children: [t.props.children, (0, x.jsx)("span", {
                    className: (0, c.c)(o.offset, n),
                    "aria-hidden": !0,
                    children: (0, x.jsx)("span", {
                        className: o.circle,
                        children: (0, x.jsx)("span", {
                            className: o.label,
                            children: a
                        })
                    })
                })]
            })) : null
        }, {
            name: "MuiSlider",
            slot: "ValueLabel",
            overridesResolver: (e, t) => t.valueLabel
        })(e => {
            let {
                theme: t
            } = e;
            return (0, u._)({
                zIndex: 1,
                whiteSpace: "nowrap"
            }, t.typography.body2, {
                fontWeight: 500,
                transition: t.transitions.create(["transform"], {
                    duration: t.transitions.duration.shortest
                }),
                position: "absolute",
                backgroundColor: (t.vars || t).palette.grey[600],
                borderRadius: 2,
                color: (t.vars || t).palette.common.white,
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                padding: "0.25rem 0.75rem",
                variants: [{
                    props: {
                        orientation: "horizontal"
                    },
                    style: {
                        transform: "translateY(-100%) scale(0)",
                        top: "-10px",
                        transformOrigin: "bottom center",
                        "&::before": {
                            position: "absolute",
                            content: '""',
                            width: 8,
                            height: 8,
                            transform: "translate(-50%, 50%) rotate(45deg)",
                            backgroundColor: "inherit",
                            bottom: 0,
                            left: "50%"
                        },
                        ["&.".concat(N.valueLabelOpen)]: {
                            transform: "translateY(-100%) scale(1)"
                        }
                    }
                }, {
                    props: {
                        orientation: "vertical"
                    },
                    style: {
                        transform: "translateY(-50%) scale(0)",
                        right: "30px",
                        top: "50%",
                        transformOrigin: "right center",
                        "&::before": {
                            position: "absolute",
                            content: '""',
                            width: 8,
                            height: 8,
                            transform: "translate(-50%, -50%) rotate(45deg)",
                            backgroundColor: "inherit",
                            right: -8,
                            top: "50%"
                        },
                        ["&.".concat(N.valueLabelOpen)]: {
                            transform: "translateY(-50%) scale(1)"
                        }
                    }
                }, {
                    props: {
                        size: "small"
                    },
                    style: {
                        fontSize: t.typography.pxToRem(12),
                        padding: "0.25rem 0.5rem"
                    }
                }, {
                    props: {
                        orientation: "vertical",
                        size: "small"
                    },
                    style: {
                        right: "20px"
                    }
                }]
            })
        }),
        H = (0, c.s)("span", {
            name: "MuiSlider",
            slot: "Mark",
            shouldForwardProp: e => (0, c.b)(e) && "markActive" !== e,
            overridesResolver: (e, t) => {
                let {
                    markActive: n
                } = e;
                return [t.mark, n && t.markActive]
            }
        })(e => {
            let {
                theme: t
            } = e;
            return {
                position: "absolute",
                width: 2,
                height: 2,
                borderRadius: 1,
                backgroundColor: "currentColor",
                variants: [{
                    props: {
                        orientation: "horizontal"
                    },
                    style: {
                        top: "50%",
                        transform: "translate(-1px, -50%)"
                    }
                }, {
                    props: {
                        orientation: "vertical"
                    },
                    style: {
                        left: "50%",
                        transform: "translate(-50%, 1px)"
                    }
                }, {
                    props: {
                        markActive: !0
                    },
                    style: {
                        backgroundColor: (t.vars || t).palette.background.paper,
                        opacity: .8
                    }
                }]
            }
        }),
        W = (0, c.s)("span", {
            name: "MuiSlider",
            slot: "MarkLabel",
            shouldForwardProp: e => (0, c.b)(e) && "markLabelActive" !== e,
            overridesResolver: (e, t) => t.markLabel
        })(e => {
            let {
                theme: t
            } = e;
            return (0, u._)({}, t.typography.body2, {
                color: (t.vars || t).palette.text.secondary,
                position: "absolute",
                whiteSpace: "nowrap",
                variants: [{
                    props: {
                        orientation: "horizontal"
                    },
                    style: {
                        top: 30,
                        transform: "translateX(-50%)",
                        "@media (pointer: coarse)": {
                            top: 40
                        }
                    }
                }, {
                    props: {
                        orientation: "vertical"
                    },
                    style: {
                        left: 36,
                        transform: "translateY(50%)",
                        "@media (pointer: coarse)": {
                            left: 44
                        }
                    }
                }, {
                    props: {
                        markLabelActive: !0
                    },
                    style: {
                        color: (t.vars || t).palette.text.primary
                    }
                }]
            })
        }),
        X = e => {
            let {
                children: t
            } = e;
            return t
        },
        Y = r.forwardRef(function(e, t) {
            var n, a, o, i, s, N, Y, $, q, G, K, J, Z, Q, ee, et, en, er, ea, eo, ei, el, es, eu;
            let ec = (0, w.u)({
                    props: e,
                    name: "MuiSlider"
                }),
                ed = (0, d.u)(),
                {
                    "aria-label": ef,
                    "aria-valuetext": ep,
                    "aria-labelledby": ev,
                    component: em = "span",
                    components: eh = {},
                    componentsProps: eb = {},
                    color: eg = "primary",
                    classes: ey,
                    className: eS,
                    disableSwap: ek = !1,
                    disabled: ex = !1,
                    getAriaLabel: ew,
                    getAriaValueText: eE,
                    marks: eC = !1,
                    max: eL = 100,
                    min: eT = 0,
                    orientation: eA = "horizontal",
                    shiftStep: eR = 10,
                    size: eM = "medium",
                    step: eP = 1,
                    scale: eI = D,
                    slotProps: eV,
                    slots: eO,
                    track: eN = "normal",
                    valueLabelDisplay: eF = "off",
                    valueLabelFormat: eD = D
                } = ec,
                ez = (0, l._)(ec, F),
                ej = (0, u._)({}, ec, {
                    isRtl: ed,
                    max: eL,
                    min: eT,
                    classes: ey,
                    disabled: ex,
                    disableSwap: ek,
                    orientation: eA,
                    marks: eC,
                    color: eg,
                    size: eM,
                    step: eP,
                    shiftStep: eR,
                    scale: eI,
                    track: eN,
                    valueLabelDisplay: eF,
                    valueLabelFormat: eD
                }),
                {
                    axisProps: e_,
                    getRootProps: eB,
                    getHiddenInputProps: eU,
                    getThumbProps: eH,
                    open: eW,
                    active: eX,
                    axis: eY,
                    focusedThumbIndex: e$,
                    range: eq,
                    dragging: eG,
                    marks: eK,
                    values: eJ,
                    trackOffset: eZ,
                    trackLeap: eQ,
                    getThumbStyle: e0
                } = function(e) {
                    let {
                        "aria-labelledby": t,
                        defaultValue: n,
                        disabled: a = !1,
                        disableSwap: o = !1,
                        isRtl: i = !1,
                        marks: l = !1,
                        max: s = 100,
                        min: c = 0,
                        name: d,
                        onChange: k,
                        onChangeCommitted: x,
                        orientation: w = "horizontal",
                        rootRef: E,
                        scale: O = I,
                        step: N = 1,
                        shiftStep: F = 10,
                        tabIndex: D,
                        value: z
                    } = e, j = r.useRef(void 0), [_, B] = r.useState(-1), [U, H] = r.useState(-1), [W, X] = r.useState(!1), Y = r.useRef(0), [$, q] = (0, f.u)({
                        controlled: z,
                        default: null != n ? n : c,
                        name: "Slider"
                    }), G = k && ((e, t, n) => {
                        let r = e.nativeEvent || e,
                            a = new r.constructor(r.type, r);
                        Object.defineProperty(a, "target", {
                            writable: !0,
                            value: {
                                value: t,
                                name: d
                            }
                        }), k(a, t, n)
                    }), K = Array.isArray($), J = K ? $.slice().sort(C) : [$];
                    J = J.map(e => null == e ? c : (0, p.c)(e, c, s));
                    let Z = !0 === l && null !== N ? [...Array(Math.floor((s - c) / N) + 1)].map((e, t) => ({
                            value: c + N * t
                        })) : l || [],
                        Q = Z.map(e => e.value),
                        {
                            isFocusVisibleRef: ee,
                            onBlur: et,
                            onFocus: en,
                            ref: er
                        } = (0, v.u)(),
                        [ea, eo] = r.useState(-1),
                        ei = r.useRef(null),
                        el = (0, m.u)(er, ei),
                        es = (0, m.u)(E, el),
                        eu = (e, t) => {
                            let n = Number(e.currentTarget.getAttribute("data-index")),
                                r = J[n],
                                a = Q.indexOf(r),
                                i = t;
                            if (Z && null == N) {
                                let e = Q[Q.length - 1];
                                i = i > e ? e : i < Q[0] ? Q[0] : i < r ? Q[a - 1] : Q[a + 1]
                            }
                            if (i = (0, p.c)(i, c, s), K) {
                                o && (i = (0, p.c)(i, J[n - 1] || -1 / 0, J[n + 1] || 1 / 0));
                                let e = i;
                                i = A({
                                    values: J,
                                    newValue: i,
                                    index: n
                                });
                                let t = n;
                                o || (t = i.indexOf(e)), R({
                                    sliderRef: ei,
                                    activeIndex: t
                                })
                            }
                            q(i), eo(n), G && !M(i, $) && G(e, i, n), x && x(e, i)
                        };
                    (0, h.u)(() => {
                        var e;
                        a && ei.current.contains(document.activeElement) && (null == (e = document.activeElement) || e.blur())
                    }, [a]), a && -1 !== _ && B(-1), a && -1 !== ea && eo(-1);
                    let ec = r.useRef(void 0),
                        ed = w;
                    i && "horizontal" === w && (ed += "-reverse");
                    let ef = e => {
                            let t, n, {
                                    finger: r,
                                    move: a = !1
                                } = e,
                                {
                                    current: i
                                } = ei,
                                {
                                    width: l,
                                    height: u,
                                    bottom: d,
                                    left: f
                                } = i.getBoundingClientRect();
                            if (t = 0 === ed.indexOf("vertical") ? (d - r.y) / u : (r.x - f) / l, -1 !== ed.indexOf("-reverse") && (t = 1 - t), n = (s - c) * t + c, N) n = Number((Math.round((n - c) / N) * N + c).toFixed(function(e) {
                                if (1 > Math.abs(e)) {
                                    let t = e.toExponential().split("e-"),
                                        n = t[0].split(".")[1];
                                    return (n ? n.length : 0) + parseInt(t[1], 10)
                                }
                                let t = e.toString().split(".")[1];
                                return t ? t.length : 0
                            }(N)));
                            else {
                                let e = L(Q, n);
                                n = Q[e]
                            }
                            n = (0, p.c)(n, c, s);
                            let v = 0;
                            if (K) {
                                v = a ? ec.current : L(J, n), o && (n = (0, p.c)(n, J[v - 1] || -1 / 0, J[v + 1] || 1 / 0));
                                let e = n;
                                n = A({
                                    values: J,
                                    newValue: n,
                                    index: v
                                }), o && a || (ec.current = v = n.indexOf(e))
                            }
                            return {
                                newValue: n,
                                activeIndex: v
                            }
                        },
                        ep = (0, b.u)(e => {
                            let t = T(e, j);
                            if (!t) return;
                            if (Y.current += 1, "mousemove" === e.type && 0 === e.buttons) return void ev(e);
                            let {
                                newValue: n,
                                activeIndex: r
                            } = ef({
                                finger: t,
                                move: !0
                            });
                            R({
                                sliderRef: ei,
                                activeIndex: r,
                                setActive: B
                            }), q(n), !W && Y.current > 2 && X(!0), G && !M(n, $) && G(e, n, r)
                        }),
                        ev = (0, b.u)(e => {
                            let t = T(e, j);
                            if (X(!1), !t) return;
                            let {
                                newValue: n
                            } = ef({
                                finger: t,
                                move: !0
                            });
                            B(-1), "touchend" === e.type && H(-1), x && x(e, n), j.current = void 0, eh()
                        }),
                        em = (0, b.u)(e => {
                            if (a) return;
                            V() || e.preventDefault();
                            let t = e.changedTouches[0];
                            null != t && (j.current = t.identifier);
                            let n = T(e, j);
                            if (!1 !== n) {
                                let {
                                    newValue: t,
                                    activeIndex: r
                                } = ef({
                                    finger: n
                                });
                                R({
                                    sliderRef: ei,
                                    activeIndex: r,
                                    setActive: B
                                }), q(t), G && !M(t, $) && G(e, t, r)
                            }
                            Y.current = 0;
                            let r = (0, g.o)(ei.current);
                            r.addEventListener("touchmove", ep, {
                                passive: !0
                            }), r.addEventListener("touchend", ev, {
                                passive: !0
                            })
                        }),
                        eh = r.useCallback(() => {
                            let e = (0, g.o)(ei.current);
                            e.removeEventListener("mousemove", ep), e.removeEventListener("mouseup", ev), e.removeEventListener("touchmove", ep), e.removeEventListener("touchend", ev)
                        }, [ev, ep]);
                    r.useEffect(() => {
                        let {
                            current: e
                        } = ei;
                        return e.addEventListener("touchstart", em, {
                            passive: V()
                        }), () => {
                            e.removeEventListener("touchstart", em), eh()
                        }
                    }, [eh, em]), r.useEffect(() => {
                        a && eh()
                    }, [a, eh]);
                    let eb = 100 * ((K ? J[0] : c) - c) / (s - c),
                        eg = 100 * (J[J.length - 1] - c) / (s - c) - eb;
                    return {
                        active: _,
                        axis: ed,
                        axisProps: P,
                        dragging: W,
                        focusedThumbIndex: ea,
                        getHiddenInputProps: function() {
                            var n, r;
                            let o, l, f, p = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                                v = (0, y.e)(p),
                                m = {
                                    onChange: (r = v || {}, e => {
                                        var t;
                                        null == (t = r.onChange) || t.call(r, e), eu(e, e.target.valueAsNumber)
                                    }),
                                    onFocus: (o = v || {}, e => {
                                        var t;
                                        let n = Number(e.currentTarget.getAttribute("data-index"));
                                        en(e), !0 === ee.current && eo(n), H(n), null == o || null == (t = o.onFocus) || t.call(o, e)
                                    }),
                                    onBlur: (l = v || {}, e => {
                                        var t;
                                        et(e), !1 === ee.current && eo(-1), H(-1), null == l || null == (t = l.onBlur) || t.call(l, e)
                                    }),
                                    onKeyDown: (f = v || {}, e => {
                                        var t;
                                        if (null !== N) {
                                            let t = J[Number(e.currentTarget.getAttribute("data-index"))],
                                                n = null;
                                            ("ArrowLeft" === e.key || "ArrowDown" === e.key) && e.shiftKey || "PageDown" === e.key ? n = Math.max(t - F, c) : (("ArrowRight" === e.key || "ArrowUp" === e.key) && e.shiftKey || "PageUp" === e.key) && (n = Math.min(t + F, s)), null !== n && (eu(e, n), e.preventDefault())
                                        }
                                        null == f || null == (t = f.onKeyDown) || t.call(f, e)
                                    })
                                },
                                h = (0, u._)({}, v, m);
                            return (0, u._)({
                                tabIndex: D,
                                "aria-labelledby": t,
                                "aria-orientation": w,
                                "aria-valuemax": O(s),
                                "aria-valuemin": O(c),
                                name: d,
                                type: "range",
                                min: e.min,
                                max: e.max,
                                step: null === e.step && e.marks ? "any" : null != (n = e.step) ? n : void 0,
                                disabled: a
                            }, p, h, {
                                style: (0, u._)({}, S.v, {
                                    direction: i ? "rtl" : "ltr",
                                    width: "100%",
                                    height: "100%"
                                })
                            })
                        },
                        getRootProps: function() {
                            var e;
                            let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                                n = (0, y.e)(t),
                                r = {
                                    onMouseDown: (e = n || {}, t => {
                                        var n;
                                        if (null == (n = e.onMouseDown) || n.call(e, t), a || t.defaultPrevented || 0 !== t.button) return;
                                        t.preventDefault();
                                        let r = T(t, j);
                                        if (!1 !== r) {
                                            let {
                                                newValue: e,
                                                activeIndex: n
                                            } = ef({
                                                finger: r
                                            });
                                            R({
                                                sliderRef: ei,
                                                activeIndex: n,
                                                setActive: B
                                            }), q(e), G && !M(e, $) && G(t, e, n)
                                        }
                                        Y.current = 0;
                                        let o = (0, g.o)(ei.current);
                                        o.addEventListener("mousemove", ep, {
                                            passive: !0
                                        }), o.addEventListener("mouseup", ev)
                                    })
                                },
                                o = (0, u._)({}, n, r);
                            return (0, u._)({}, t, {
                                ref: es
                            }, o)
                        },
                        getThumbProps: function() {
                            var e;
                            let t, n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                                r = (0, y.e)(n),
                                a = {
                                    onMouseOver: (e = r || {}, t => {
                                        var n;
                                        null == (n = e.onMouseOver) || n.call(e, t), H(Number(t.currentTarget.getAttribute("data-index")))
                                    }),
                                    onMouseLeave: (t = r || {}, e => {
                                        var n;
                                        null == (n = t.onMouseLeave) || n.call(t, e), H(-1)
                                    })
                                };
                            return (0, u._)({}, n, r, a)
                        },
                        marks: Z,
                        open: U,
                        range: K,
                        rootRef: es,
                        trackLeap: eg,
                        trackOffset: eb,
                        values: J,
                        getThumbStyle: e => ({
                            pointerEvents: -1 !== _ && _ !== e ? "none" : void 0
                        })
                    }
                }((0, u._)({}, ej, {
                    rootRef: t
                }));
            ej.marked = eK.length > 0 && eK.some(e => e.label), ej.dragging = eG, ej.focusedThumbIndex = e$;
            let e1 = (e => {
                    let {
                        disabled: t,
                        dragging: n,
                        marked: r,
                        orientation: a,
                        track: o,
                        classes: i,
                        color: s,
                        size: u
                    } = e, d = {
                        root: ["root", t && "disabled", n && "dragging", r && "marked", "vertical" === a && "vertical", "inverted" === o && "trackInverted", !1 === o && "trackFalse", s && "color".concat((0, l.a)(s)), u && "size".concat((0, l.a)(u))],
                        rail: ["rail"],
                        track: ["track"],
                        mark: ["mark"],
                        markActive: ["markActive"],
                        markLabel: ["markLabel"],
                        markLabelActive: ["markLabelActive"],
                        valueLabel: ["valueLabel"],
                        thumb: ["thumb", t && "disabled", u && "thumbSize".concat((0, l.a)(u)), s && "thumbColor".concat((0, l.a)(s))],
                        active: ["active"],
                        disabled: ["disabled"],
                        focusVisible: ["focusVisible"]
                    };
                    return (0, c.a)(d, O, i)
                })(ej),
                e2 = null != (n = null != (a = null == eO ? void 0 : eO.root) ? a : eh.Root) ? n : z,
                e5 = null != (o = null != (i = null == eO ? void 0 : eO.rail) ? i : eh.Rail) ? o : j,
                e4 = null != (s = null != (N = null == eO ? void 0 : eO.track) ? N : eh.Track) ? s : _,
                e3 = null != (Y = null != ($ = null == eO ? void 0 : eO.thumb) ? $ : eh.Thumb) ? Y : B,
                e8 = null != (q = null != (G = null == eO ? void 0 : eO.valueLabel) ? G : eh.ValueLabel) ? q : U,
                e6 = null != (K = null != (J = null == eO ? void 0 : eO.mark) ? J : eh.Mark) ? K : H,
                e9 = null != (Z = null != (Q = null == eO ? void 0 : eO.markLabel) ? Q : eh.MarkLabel) ? Z : W,
                e7 = null != (ee = null != (et = null == eO ? void 0 : eO.input) ? et : eh.Input) ? ee : "input",
                te = null != (en = null == eV ? void 0 : eV.root) ? en : eb.root,
                tt = null != (er = null == eV ? void 0 : eV.rail) ? er : eb.rail,
                tn = null != (ea = null == eV ? void 0 : eV.track) ? ea : eb.track,
                tr = null != (eo = null == eV ? void 0 : eV.thumb) ? eo : eb.thumb,
                ta = null != (ei = null == eV ? void 0 : eV.valueLabel) ? ei : eb.valueLabel,
                to = null != (el = null == eV ? void 0 : eV.mark) ? el : eb.mark,
                ti = null != (es = null == eV ? void 0 : eV.markLabel) ? es : eb.markLabel,
                tl = null != (eu = null == eV ? void 0 : eV.input) ? eu : eb.input,
                ts = (0, E.u)({
                    elementType: e2,
                    getSlotProps: eB,
                    externalSlotProps: te,
                    externalForwardedProps: ez,
                    additionalProps: (0, u._)({}, (!e2 || !(0, k.i)(e2)) && {
                        as: em
                    }),
                    ownerState: (0, u._)({}, ej, null == te ? void 0 : te.ownerState),
                    className: [e1.root, eS]
                }),
                tu = (0, E.u)({
                    elementType: e5,
                    externalSlotProps: tt,
                    ownerState: ej,
                    className: e1.rail
                }),
                tc = (0, E.u)({
                    elementType: e4,
                    externalSlotProps: tn,
                    additionalProps: {
                        style: (0, u._)({}, e_[eY].offset(eZ), e_[eY].leap(eQ))
                    },
                    ownerState: (0, u._)({}, ej, null == tn ? void 0 : tn.ownerState),
                    className: e1.track
                }),
                td = (0, E.u)({
                    elementType: e3,
                    getSlotProps: eH,
                    externalSlotProps: tr,
                    ownerState: (0, u._)({}, ej, null == tr ? void 0 : tr.ownerState),
                    className: e1.thumb
                }),
                tf = (0, E.u)({
                    elementType: e8,
                    externalSlotProps: ta,
                    ownerState: (0, u._)({}, ej, null == ta ? void 0 : ta.ownerState),
                    className: e1.valueLabel
                }),
                tp = (0, E.u)({
                    elementType: e6,
                    externalSlotProps: to,
                    ownerState: ej,
                    className: e1.mark
                }),
                tv = (0, E.u)({
                    elementType: e9,
                    externalSlotProps: ti,
                    ownerState: ej,
                    className: e1.markLabel
                }),
                tm = (0, E.u)({
                    elementType: e7,
                    getSlotProps: eU,
                    externalSlotProps: tl,
                    ownerState: ej
                });
            return (0, x.jsxs)(e2, (0, u._)({}, ts, {
                children: [(0, x.jsx)(e5, (0, u._)({}, tu)), (0, x.jsx)(e4, (0, u._)({}, tc)), eK.filter(e => e.value >= eT && e.value <= eL).map((e, t) => {
                    let n, a = 100 * (e.value - eT) / (eL - eT),
                        o = e_[eY].offset(a);
                    return n = !1 === eN ? -1 !== eJ.indexOf(e.value) : "normal" === eN && (eq ? e.value >= eJ[0] && e.value <= eJ[eJ.length - 1] : e.value <= eJ[0]) || "inverted" === eN && (eq ? e.value <= eJ[0] || e.value >= eJ[eJ.length - 1] : e.value >= eJ[0]), (0, x.jsxs)(r.Fragment, {
                        children: [(0, x.jsx)(e6, (0, u._)({
                            "data-index": t
                        }, tp, !(0, k.i)(e6) && {
                            markActive: n
                        }, {
                            style: (0, u._)({}, o, tp.style),
                            className: (0, c.c)(tp.className, n && e1.markActive)
                        })), null != e.label ? (0, x.jsx)(e9, (0, u._)({
                            "aria-hidden": !0,
                            "data-index": t
                        }, tv, !(0, k.i)(e9) && {
                            markLabelActive: n
                        }, {
                            style: (0, u._)({}, o, tv.style),
                            className: (0, c.c)(e1.markLabel, tv.className, n && e1.markLabelActive),
                            children: e.label
                        })) : null]
                    }, t)
                }), eJ.map((e, t) => {
                    let n = 100 * (e - eT) / (eL - eT),
                        r = e_[eY].offset(n),
                        a = "off" === eF ? X : e8;
                    return (0, x.jsx)(a, (0, u._)({}, !(0, k.i)(a) && {
                        valueLabelFormat: eD,
                        valueLabelDisplay: eF,
                        value: "function" == typeof eD ? eD(eI(e), t) : eD,
                        index: t,
                        open: eW === t || eX === t || "on" === eF,
                        disabled: ex
                    }, tf, {
                        children: (0, x.jsx)(e3, (0, u._)({
                            "data-index": t
                        }, td, {
                            className: (0, c.c)(e1.thumb, td.className, eX === t && e1.active, e$ === t && e1.focusVisible),
                            style: (0, u._)({}, r, e0(t), td.style),
                            children: (0, x.jsx)(e7, (0, u._)({
                                "data-index": t,
                                "aria-label": ew ? ew(t) : ef,
                                "aria-valuenow": eI(e),
                                "aria-labelledby": ev,
                                "aria-valuetext": eE ? eE(eI(e), t) : ep,
                                value: eJ[t]
                            }, tm))
                        }))
                    }), t)
                })]
            }))
        });
    var $ = (0, a.default)({
            name: "Slider"
        })(function(e) {
            var t, r;
            return {
                thumb: {
                    boxShadow: e.elevation.subtle
                },
                valueLabel: (0, n._)((0, n._)({}, e.typography.smallLabel1), {
                    color: e.palette.content.inverse,
                    backgroundColor: e.palette.actionV2.primary.fill
                }),
                colorPrimary: ((t = {})["& .".concat(N.rail)] = {
                    color: e.palette.content.disabled
                }, t["&.".concat(N.trackInverted)] = ((r = {})["& .".concat(N.track)] = {
                    backgroundColor: (0, s.l)(e.palette.content.disabled, .62),
                    borderColor: (0, s.l)(e.palette.content.disabled, .62)
                }, r["& .".concat(N.rail)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, r), t)
            }
        }),
        q = (0, r.forwardRef)(function(e, t) {
            var a = e.classes,
                i = e.className,
                l = (0, n.a)(e, ["classes", "className"]),
                s = $(void 0, {
                    props: {
                        classes: (0, o.default)(a, i)
                    }
                });
            return r.default.createElement(Y, (0, n._)({}, l, {
                classes: s.classes,
                ref: t
            }))
        });
    e.s(["S", 0, q, "s", 0, N], 663991), e.s(["Slider", 0, q], 3359)
}, 914040, e => {
    "use strict";
    var t, n, r, a = e.i(416340),
        o = e.i(706442),
        i = e.i(3359),
        l = e.i(988012),
        s = e.i(833172),
        s = s,
        u = e.i(183047),
        c = s,
        d = s,
        f = s,
        p = s,
        v = e.i(865800),
        m = e.i(614515),
        h = e.i(993807),
        b = e.i(978100);
    e.i(221628);
    var g = (0, m.default)({
            name: "Video"
        })(function(e) {
            return {
                media: {
                    width: "100%"
                },
                header: {
                    position: "absolute",
                    top: 0,
                    left: 0,
                    width: "100%",
                    background: e.palette.media.topOverlay,
                    zIndex: 10
                }
            }
        }),
        y = (0, a.forwardRef)(function(e, t) {
            var n = e.children,
                r = e.classes,
                o = e.headerContent,
                i = e.className,
                l = (0, v.a)(e, ["children", "classes", "headerContent", "className"]),
                s = g(void 0, {
                    props: {
                        classes: (0, h.default)(r, i)
                    }
                }).classes,
                u = s.header,
                c = (0, v.a)(s, ["header"]);
            return a.default.createElement(a.Fragment, null, o && a.default.createElement("div", {
                className: u
            }, o), a.default.createElement(b.M, (0, v._)({}, l, {
                component: "video",
                classes: c,
                ref: t
            }), n))
        }),
        S = e.i(95656),
        k = e.i(252842),
        x = function() {
            return (x = Object.assign || function(e) {
                for (var t, n = 1, r = arguments.length; n < r; n++)
                    for (var a in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
                return e
            }).apply(this, arguments)
        };

    function w(e, t) {
        var n = {};
        for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
        if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
            var a = 0;
            for (r = Object.getOwnPropertySymbols(e); a < r.length; a++) 0 > t.indexOf(r[a]) && Object.prototype.propertyIsEnumerable.call(e, r[a]) && (n[r[a]] = e[r[a]])
        }
        return n
    }

    function E(e, t, n, r) {
        return new(n || (n = Promise))(function(a, o) {
            function i(e) {
                try {
                    s(r.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function l(e) {
                try {
                    s(r.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(i, l)
            }
            s((r = r.apply(e, t || [])).next())
        })
    }

    function C(e, t) {
        var n, r, a, o = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return i.next = l(0), i.throw = l(1), i.return = l(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function l(l) {
            return function(s) {
                var u = [l, s];
                if (n) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                    if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                    switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                        case 0:
                        case 1:
                            a = u;
                            break;
                        case 4:
                            return o.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            o.label++, r = u[1], u = [0];
                            continue;
                        case 7:
                            u = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                o.label = u[1];
                                break
                            }
                            if (6 === u[0] && o.label < a[1]) {
                                o.label = a[1], a = u;
                                break
                            }
                            if (a && o.label < a[2]) {
                                o.label = a[2], o.ops.push(u);
                                break
                            }
                            a[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    u = t.call(e, o)
                } catch (e) {
                    u = [6, e], r = 0
                } finally {
                    n = a = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var L, T, A, R, M, P = (0, o.makeStyles)()(function() {
            return {
                container: {
                    position: "relative"
                }
            }
        }),
        I = (0, o.makeStyles)()(function(e) {
            return {
                controls: {
                    position: "absolute",
                    bottom: 0,
                    left: 0,
                    width: "100%",
                    height: "100%",
                    zIndex: 10
                },
                controlsWrapper: {
                    height: "100%",
                    width: "100%",
                    display: "flex",
                    flexDirection: "column",
                    justifyContent: "end",
                    background: "linear-gradient(transparent 0%, transparent 80%, rgba(0, 0, 0, 0.3) 90%, rgba(0, 0, 0, 0.6) 100%)"
                },
                controlsFooter: {
                    display: "flex",
                    flexDirection: "column",
                    justifyContent: "end",
                    padding: e.spacing(1, 2.5),
                    "& .MuiSlider-root": {
                        color: e.palette.content.static.light
                    },
                    "& .MuiSlider-thumb": {
                        backgroundColor: e.palette.content.static.light
                    },
                    "& .MuiSlider-track": {
                        backgroundColor: e.palette.content.static.light
                    },
                    "& .MuiSlider-rail": {
                        backgroundColor: e.palette.content.static.light
                    },
                    "&.noTransitions": {
                        "& .MuiSlider-thumb": {
                            transition: "none !important"
                        },
                        "& .MuiSlider-track": {
                            transition: "none !important"
                        }
                    }
                },
                controlsRow: {
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "space-between"
                },
                rightControls: {
                    display: "flex",
                    alignItems: "center",
                    marginLeft: "auto",
                    gap: e.spacing(1)
                },
                volumeControl: {
                    position: "relative",
                    display: "flex",
                    alignItems: "center"
                },
                volumeSlider: {
                    width: 80,
                    position: "absolute",
                    right: "100%",
                    marginRight: e.spacing(1),
                    opacity: 0,
                    visibility: "hidden",
                    transition: "opacity 0.2s, visibility 0.2s",
                    "&.expanded": {
                        opacity: 1,
                        visibility: "visible"
                    }
                },
                overlayButton: {
                    flex: 1,
                    outline: "none !important",
                    "&:focus": {
                        outline: "none !important",
                        boxShadow: "none !important"
                    },
                    "&:focus-visible": {
                        outline: "none !important"
                    }
                },
                mobileControls: {
                    position: "absolute",
                    bottom: 0,
                    left: 0,
                    width: "100%",
                    height: "100%",
                    zIndex: 1e3,
                    pointerEvents: "auto"
                },
                noTransitions: {
                    "& .MuiSlider-thumb": {
                        transition: "none !important"
                    },
                    "& .MuiSlider-track": {
                        transition: "none !important"
                    },
                    "& .MuiSlider-rail": {
                        transition: "none !important"
                    },
                    "& *": {
                        transition: "none !important"
                    }
                }
            }
        });
    (t = L || (L = {})).VideoImpression = "VIDEO_IMPRESSION", t.VideoAction = "VIDEO_ACTION", t.VideoProgress = "VIDEO_PROGRESS", (n = T || (T = {})).Play = "play", n.Pause = "pause", n.Fullscreen = "fullscreen", n.Navigate = "navigate", n.Volume = "volume", n.Scrub = "scrub", n.ExitFullscreen = "exit_fullscreen", n.Hover = "hover", n.Loop = "loop", n.Load = "load", n.Complete = "complete", n.End = "end", (A || (A = {})).Video = "video", (r = R || (R = {})).Home = "Home", r.GameDetails = "GameDetails", (M || (M = {})).VideoEngagementEvent = "videoEngagementEventType";
    var V = {
            error: 0,
            warn: 1,
            info: 2,
            debug: 3
        },
        O = function() {
            function e(e) {
                this.config = "boolean" == typeof e ? {
                    enabled: e,
                    level: "debug",
                    prefix: "[VideoAnalytics]",
                    excludeErrors: !1
                } : {
                    enabled: e.enabled,
                    level: e.level,
                    prefix: e.prefix || "[VideoAnalytics]",
                    excludeErrors: e.excludeErrors || !1
                }
            }
            return e.prototype.shouldLog = function(e) {
                return !!this.config.enabled && (!this.config.excludeErrors || "error" !== e) && V[e] <= V[this.config.level]
            }, e.prototype.formatMessage = function(e, t, n) {
                var r = (new Date).toISOString(),
                    a = e.toUpperCase().padEnd(5),
                    o = "".concat(this.config.prefix, " [").concat(a, "] ").concat(r, " ").concat(t);
                return void 0 !== n ? [o, n] : [o]
            }, e.prototype.error = function(e, t) {
                if (this.shouldLog("error")) {
                    var n = this.formatMessage("error", e, t);
                    console.error.apply(console, n)
                }
            }, e.prototype.warn = function(e, t) {
                if (this.shouldLog("warn")) {
                    var n = this.formatMessage("warn", e, t);
                    console.warn.apply(console, n)
                }
            }, e.prototype.info = function(e, t) {
                if (this.shouldLog("info")) {
                    var n = this.formatMessage("info", e, t);
                    console.log.apply(console, n)
                }
            }, e.prototype.log = function(e, t) {
                if (this.shouldLog("debug")) {
                    var n = this.formatMessage("debug", e, t);
                    console.log.apply(console, n)
                }
            }, e
        }(),
        N = function(e, t) {
            void 0 === t && (t = {});
            var n = (0, a.useState)(!1),
                r = n[0],
                o = n[1],
                i = t.threshold,
                l = void 0 === i ? .8 : i,
                s = t.debugLogger,
                u = t.id;
            return (0, a.useEffect)(function() {
                if (e) {
                    var t = new IntersectionObserver(function(e) {
                        e.forEach(function(e) {
                            o(e.isIntersecting), s && !e.isIntersecting ? s.log("".concat(u, " is no longer visible")) : s && e.isIntersecting && s.log("".concat(u, " is now visible"))
                        })
                    }, {
                        threshold: l
                    });
                    return t.observe(e),
                        function() {
                            t.unobserve(e)
                        }
                }
            }, [e, l, s, u]), r
        },
        F = function(e, t, n, r, o, i, l, s) {
            void 0 === o && (o = !1), void 0 === i && (i = !1), void 0 === l && (l = !1), void 0 === s && (s = !1);
            var u = (0, a.useMemo)(function() {
                    return new O(i)
                }, [i]),
                c = (0, a.useRef)(null),
                d = (0, a.useRef)(!1),
                f = (0, a.useRef)(k.uuidService.generateRandomUuid()),
                p = (0, a.useRef)(k.uuidService.generateRandomUuid()),
                v = (0, a.useRef)(!1),
                m = (0, a.useRef)(!1),
                h = (0, a.useRef)({
                    startTime: null,
                    isPlaying: !1,
                    scrubStartTime: null,
                    scrubStartPosition: null,
                    playStartTime: null,
                    hasPlayedOneSecond: !1
                }),
                b = (0, a.useRef)(!1);
            (0, a.useRef)(!0);
            var g = (0, a.useRef)({
                    startTime: null
                }),
                y = (0, a.useRef)(void 0),
                w = N(o && t ? e.current : null, {
                    threshold: (null == t ? void 0 : t.visibilityThreshold) || .8,
                    debugLogger: u,
                    id: "VideoPlayer"
                }),
                E = N(o && (null == r ? void 0 : r.current) || null, {
                    threshold: (null == t ? void 0 : t.visibilityThreshold) || .8,
                    debugLogger: u,
                    id: "CTAElement"
                }),
                C = (0, a.useCallback)(function(r, a, i) {
                    var l;
                    if (o && c.current && t && e.current) try {
                        var s = e.current,
                            d = s.duration,
                            v = {
                                target: t.target,
                                eventType: "videoEngagementEvent",
                                context: A.Video,
                                localTime: new Date,
                                additionalProperties: x({
                                    videoEngagementEventType: r,
                                    videoAssetId: t.assetId,
                                    sourceId: t.sourceId,
                                    source: t.source,
                                    pageContext: t.pageContext,
                                    impressionId: f.current,
                                    playbackSessionId: p.current,
                                    videoAssetDuration: d,
                                    isVisible: !0,
                                    isAudible: !s.muted && s.volume > 0,
                                    isFullscreen: n,
                                    volumeLevel: s.muted ? 0 : s.volume,
                                    autoplayByDefault: s.autoplay,
                                    actionType: a
                                }, i)
                            };
                        c.current.sendEventViaImg(v), u.log("".concat(r, ": ").concat(JSON.stringify(v))), null == (l = t.onSendEvent) || l.call(t, "".concat(r, ": ").concat(JSON.stringify(v)))
                    } catch (e) {
                        u.error("Failed to send event:", e)
                    }
                }, [o, t, n, u, e]);
            (0, a.useEffect)(function() {
                l && !b.current ? (C(L.VideoAction, T.Hover), b.current = !0) : b.current = l
            }, [C, l]), (0, a.useEffect)(function() {
                if (o && t) {
                    if (!v.current) try {
                        var e, n, r = (n = "production" === (e = t.environment) ? "https://ecsv2.roblox.com" : "https://ecsv2.".concat(e, ".robloxlabs.com"), new S.Configuration({
                            baseUrl: "".concat(n, "/").concat(t.target)
                        }));
                        c.current = new S.Tracker(r), v.current = !0, u.log("Event stream tracker initialized:", {
                            analyticsConfig: t,
                            enableAnalytics: o
                        })
                    } catch (e) {
                        u.error("Failed to initialize event stream tracker:", e)
                    }
                } else u.warn("Analytics not enabled, config not provided")
            }, [o, t, u]);
            var R = (0, a.useCallback)(function() {
                    if (!d.current && e.current && t && w) {
                        var n, r, a, o, i = h.current,
                            u = e.current;
                        r = (n = {
                            hasPlayedOneSecond: i.hasPlayedOneSecond,
                            autoPlayActive: u.autoplay,
                            onHoverActive: l,
                            meetsCtaCriteria: E && w || s
                        }).hasPlayedOneSecond, a = n.autoPlayActive, o = n.onHoverActive, (n.meetsCtaCriteria || a && r || r || o && r) && (C(L.VideoImpression), d.current = !0)
                    }
                }, [e, t, C, l, w, E, s]),
                M = (0, a.useCallback)(function(e, t) {
                    C(L.VideoProgress, void 0, {
                        progressStartTime: e,
                        progressEndTime: t
                    })
                }, [C]),
                P = (0, a.useCallback)(function() {
                    g.current.startTime = Date.now()
                }, []),
                I = (0, a.useCallback)(function() {
                    var e = g.current;
                    null !== e.startTime && (C(L.VideoAction, T.Load, {
                        loadTime: Date.now() - e.startTime
                    }), e.startTime = null)
                }, [C]),
                V = (0, a.useCallback)(function(e, n) {
                    var r, a;
                    if (o && t) {
                        var i = h.current;
                        null !== i.playStartTime && !i.hasPlayedOneSecond && e - i.playStartTime >= (null != (r = t.impressionPlaybackThreshold) ? r : 1) && (i.hasPlayedOneSecond = !0, R()), n > 0 && t.completionThreshold && !m.current && e / n * 100 >= t.completionThreshold && (null == (a = t.onComplete) || a.call(t), C(L.VideoAction, T.Complete), m.current = !0)
                    }
                }, [o, t, R, C]),
                F = (0, a.useCallback)(function() {
                    var t = h.current;
                    if (e.current && null !== t.startTime) {
                        var n = e.current.currentTime;
                        t.isPlaying && n > t.startTime && M(t.startTime, n), t.startTime = null
                    }
                    C(L.VideoAction, T.Loop)
                }, [C, e, M]),
                D = (0, a.useCallback)(function() {
                    var t = h.current;
                    e.current && (t.startTime = e.current.currentTime, t.isPlaying = !0, t.playStartTime = e.current.currentTime, C(L.VideoAction, T.Play))
                }, [e, C]),
                z = (0, a.useCallback)(function() {
                    var t = h.current;
                    if (e.current && null !== t.startTime) {
                        var n = e.current.currentTime;
                        t.isPlaying && n > t.startTime && M(t.startTime, n), C(L.VideoAction, T.Pause), t.isPlaying = !1, t.startTime = null
                    }
                }, [e, C, M]),
                j = (0, a.useCallback)(function(e, t) {
                    C(L.VideoAction, T.Volume, {
                        volumeLevel: t ? 0 : e
                    })
                }, [C]),
                _ = (0, a.useCallback)(function(t) {
                    var n = h.current;
                    n.isPlaying && null !== n.startTime && e.current && (M(n.startTime, t), n.isPlaying = !1), n.scrubStartTime = Date.now(), n.scrubStartPosition = t
                }, [e, M]),
                B = (0, a.useCallback)(function(t) {
                    var n = h.current;
                    if (null !== n.scrubStartTime && null !== n.scrubStartPosition) {
                        var r = n.scrubStartPosition;
                        C(L.VideoAction, T.Scrub, {
                            scrubStartTime: r,
                            scrubEndTime: t
                        }), e.current && !e.current.paused && (n.startTime = t, n.isPlaying = !0), n.scrubStartTime = null, n.scrubStartPosition = null
                    }
                }, [e, C]),
                U = (0, a.useCallback)(function() {
                    C(L.VideoAction, T.Fullscreen)
                }, [C]),
                H = (0, a.useCallback)(function() {
                    C(L.VideoAction, T.ExitFullscreen)
                }, [C]);
            (0, a.useEffect)(function() {
                void 0 !== y.current && y.current !== n && (n ? U() : H()), y.current = n
            }, [n, U, H]);
            var W = (0, a.useCallback)(function() {
                    z(), C(L.VideoAction, T.Navigate, {
                        destination: null == t ? void 0 : t.navigationDestination
                    })
                }, [C, z, t]),
                X = (0, a.useCallback)(function() {
                    var t = h.current;
                    if (e.current && null !== t.startTime) {
                        var n = e.current.currentTime;
                        n > t.startTime && M(t.startTime, n), C(L.VideoAction, T.End)
                    }
                }, [C, M, e]);
            (0, a.useEffect)(function() {
                w && R()
            }, [w, E, R]);
            var Y = (0, a.useCallback)(function() {
                e.current && (X(), p.current = k.uuidService.generateRandomUuid(), m.current = !1, h.current = {
                    startTime: null,
                    isPlaying: !1,
                    scrubStartTime: null,
                    scrubStartPosition: null,
                    playStartTime: null,
                    hasPlayedOneSecond: !1
                }, g.current = {
                    startTime: null
                }, u.log("Video reset: New playback session created"))
            }, [e, u, X]);
            return {
                onPlay: D,
                onPause: z,
                onVolumeChange: j,
                onSeekStart: _,
                onSeekEnd: B,
                onFullscreen: U,
                onExitFullscreen: H,
                onNavigate: W,
                onEnd: X,
                onLoop: F,
                onLoadStart: P,
                onLoadEnd: I,
                onTimeUpdate: V,
                resetVideo: Y
            }
        },
        D = (0, a.forwardRef)(function(e, t) {
            var n, r, o = e.videoElementRef,
                v = e.disableVolumeSlider,
                m = e.enableAnalytics,
                h = e.analyticsConfig,
                b = e.fullScreenEnabled,
                g = void 0 !== b && b,
                y = e.debug,
                S = void 0 !== y && y,
                k = e.onHoverActive,
                x = e.ctaObject,
                w = e.loop,
                L = void 0 !== w && w,
                T = e.hidden,
                A = e.initialVolume,
                R = void 0 === A ? 1 : A,
                M = e.isMobileView,
                P = I(),
                V = P.classes,
                D = P.cx,
                z = (0, a.useRef)(null),
                j = (0, a.useState)(!1),
                _ = j[0],
                B = j[1],
                U = (0, a.useState)(0),
                H = U[0],
                W = U[1],
                X = (0, a.useState)(1),
                Y = X[0],
                $ = X[1],
                q = (0, a.useState)(!1),
                G = q[0],
                K = q[1],
                J = (0, a.useState)(!1),
                Z = J[0],
                Q = J[1],
                ee = (0, a.useState)(!1),
                et = ee[0],
                en = ee[1],
                er = (0, a.useState)(0),
                ea = er[0],
                eo = er[1],
                ei = (0, a.useState)(!1),
                el = ei[0],
                es = ei[1],
                eu = (0, a.useRef)(!1),
                ec = (0, a.useRef)(!1),
                ed = (0, a.useRef)(!1),
                ef = (0, a.useRef)(!1),
                ep = (0, a.useRef)(!0),
                ev = (0, a.useMemo)(function() {
                    return new O(S)
                }, [S]),
                em = (0, a.useRef)(null);
            (0, a.useEffect)(function() {
                var e = o.current;
                e && (K(e.muted), $(R), e.volume = R)
            }, [o, R]);
            var eh = N(z.current, {
                    threshold: (null == h ? void 0 : h.visibilityThreshold) || .8,
                    debugLogger: ev,
                    id: "PlayPauseButton"
                }),
                eb = F(o, h, et, x, void 0 !== m && m, S, void 0 !== k && k, eh);
            (0, a.useImperativeHandle)(t, function() {
                var e = o.current;
                return e ? Object.assign(e, {
                    reset: function() {
                        e.pause(), eb.resetVideo(), e.currentTime = 0, Q(!1), eu.current = !1, ec.current = !1, ed.current = !1, ef.current = !1, ev.log("Video reset: All state and refs have been reset")
                    }
                }) : {}
            }, [o, eb, ev]);
            var eg = (0, a.useCallback)(function() {
                    var e = o.current;
                    !e || e.paused || e.ended || (eo(e.currentTime), em.current = requestAnimationFrame(eg))
                }, [o]),
                ey = (0, a.useCallback)(function() {
                    null == em.current && (em.current = requestAnimationFrame(eg))
                }, [eg]),
                eS = (0, a.useCallback)(function() {
                    null != em.current && (cancelAnimationFrame(em.current), em.current = null)
                }, []);
            (0, a.useEffect)(function() {
                return _ ? ey() : eS(), eS
            }, [_, ey, eS]);
            var ek = (0, a.useCallback)(function() {
                    var e = o.current;
                    e && (_ ? e.pause() : e.play())
                }, [_, o]),
                ex = (0, a.useCallback)(function() {
                    var e, t;
                    if (o.current) return (null == h ? void 0 : h.videoClickAction) ? (e = h.videoClickAction, t = ({
                        fullScreenEnabled: g,
                        onFullscreen: eb.onFullscreen,
                        onExitFullscreen: eb.onExitFullscreen,
                        onNavigate: eb.onNavigate
                    }).onNavigate, void("NAVIGATE" === e && t())) : void ek()
                }, [o, h, g, eb, ek]),
                ew = (0, a.useCallback)(function() {
                    var e = o.current;
                    e && eb.onTimeUpdate(e.currentTime, e.duration)
                }, [o, eb]),
                eE = (0, a.useCallback)(function() {
                    eb.onLoadStart()
                }, [eb]),
                eC = (0, a.useCallback)(function() {
                    eb.onLoadEnd()
                }, [eb]),
                eL = (0, a.useCallback)(function() {
                    var e = o.current;
                    e && (W(e.duration), eo(e.currentTime)), eC()
                }, [o, eC]),
                eT = (0, a.useCallback)(function() {
                    _ || eb.onPlay(), B(!0)
                }, [eb, _]),
                eA = (0, a.useCallback)(function() {
                    var e = o.current,
                        t = e && e.duration > 0 && e.duration - e.currentTime <= .1,
                        n = e && e.duration > 0 && e.currentTime / e.duration * 100 >= 100 && !0 === L;
                    t && !n ? (es(!0), B(!1), e.currentTime = 0, eo(0), setTimeout(function() {
                        return es(!1)
                    }, 50), eb.onPause()) : n ? (eb.onLoop(), e.currentTime = 0, eo(0), e.play().catch(function(e) {
                        ev.warn("[VideoControlsOverlay] Loop play failed:", e)
                    })) : (B(!1), eb.onPause())
                }, [o, eb, L, ev]),
                eR = (0, a.useCallback)(function() {
                    eb.onEnd()
                }, [eb]),
                eM = (0, a.useCallback)(function() {
                    var e = o.current;
                    if (e) {
                        var t = e.volume,
                            n = e.muted;
                        $(t), K(n), ef.current || ep.current || eb.onVolumeChange(t, n), ep.current && (ep.current = !1)
                    }
                }, [eb, o]);
            (0, a.useEffect)(function() {
                var e = o.current;
                if (e) return e.addEventListener("volumechange", eM), e.addEventListener("beforeunload", eR), e.addEventListener("timeupdate", ew), e.addEventListener("loadedmetadata", eL), e.addEventListener("play", eT), e.addEventListener("pause", eA), e.addEventListener("loadstart", eE),
                    function() {
                        e.removeEventListener("timeupdate", ew), e.removeEventListener("loadedmetadata", eL), e.removeEventListener("play", eT), e.removeEventListener("pause", eA), e.removeEventListener("loadstart", eE), e.removeEventListener("beforeunload", eR), e.removeEventListener("volumechange", eM)
                    }
            }, [o, eb, ew, eL, eT, eA, eE, eC, eR, eM]);
            var eP = (0, a.useCallback)(function() {
                    var e = o.current;
                    e && (eu.current = !0, ec.current = _, _ && e.pause(), eb.onSeekStart(e.currentTime))
                }, [o, eb, _]),
                eI = (0, a.useCallback)(function() {
                    var e = o.current;
                    e && eu.current && (eu.current = !1, eb.onSeekEnd(e.currentTime), ec.current && e.play())
                }, [o, eb]),
                eV = (0, a.useCallback)(function(e, t) {
                    var n = o.current;
                    if (n) {
                        var r = Array.isArray(t) ? t[0] : t;
                        n.currentTime = r, eo(r)
                    }
                }, [o]),
                eO = (0, a.useCallback)(function(e, t) {
                    if (o.current) {
                        var n = o.current,
                            r = Array.isArray(t) ? t[0] : t;
                        n.muted = 0 === r, n.volume = r
                    }
                }, [o]),
                eN = (0, a.useCallback)(function(e) {
                    e.stopPropagation(), ef.current = !0
                }, []),
                eF = (0, a.useCallback)(function() {
                    ef.current && (ef.current = !1, eb.onVolumeChange(Y, G))
                }, [eb, Y, G]);
            (0, a.useEffect)(function() {
                var e = function() {
                    eu.current && eI(), ef.current && eF()
                };
                return document.addEventListener("mouseup", e), document.addEventListener("touchend", e),
                    function() {
                        document.removeEventListener("mouseup", e), document.removeEventListener("touchend", e)
                    }
            }, [eI, eF]);
            var eD = (0, a.useCallback)(function() {
                    var e = o.current;
                    e && (e.muted = !e.muted)
                }, [o]),
                ez = (0, a.useCallback)(function() {
                    return E(void 0, void 0, void 0, function() {
                        var e, t;
                        return C(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    if (!(e = o.current)) return [2];
                                    n.label = 1;
                                case 1:
                                    return n.trys.push([1, 7, , 8]), e.requestFullscreen ? [4, e.requestFullscreen()] : [3, 3];
                                case 2:
                                case 4:
                                    return n.sent(), [3, 6];
                                case 3:
                                    return e.webkitRequestFullscreen ? [4, e.webkitRequestFullscreen()] : [3, 5];
                                case 5:
                                    e.webkitEnterFullscreen && e.webkitEnterFullscreen(), n.label = 6;
                                case 6:
                                    return en(!0), [3, 8];
                                case 7:
                                    return t = n.sent(), ev.warn("[VideoControlsOverlay] Enter fullscreen failed:", t), [3, 8];
                                case 8:
                                    return [2]
                            }
                        })
                    })
                }, [o, ev]),
                ej = (0, a.useCallback)(function() {
                    return E(void 0, void 0, void 0, function() {
                        var e, t, n;
                        return C(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    e = document, t = o.current, r.label = 1;
                                case 1:
                                    return r.trys.push([1, 7, , 8]), document.exitFullscreen ? [4, document.exitFullscreen()] : [3, 3];
                                case 2:
                                case 4:
                                    return r.sent(), [3, 6];
                                case 3:
                                    return e.webkitExitFullscreen ? [4, e.webkitExitFullscreen()] : [3, 5];
                                case 5:
                                    t && t.webkitExitFullscreen && t.webkitExitFullscreen(), r.label = 6;
                                case 6:
                                    return en(!1), [3, 8];
                                case 7:
                                    return n = r.sent(), ev.warn("[VideoControlsOverlay] Exit fullscreen failed:", n), [3, 8];
                                case 8:
                                    return [2]
                            }
                        })
                    })
                }, [o, ev]),
                e_ = (0, a.useCallback)(function(e) {
                    null == e || e.stopPropagation(), g && (et ? ej() : ez())
                }, [g, et, ez, ej]);
            (0, a.useEffect)(function() {
                var e = document,
                    t = o.current,
                    n = function() {
                        en(!!(document.fullscreenElement || e.webkitFullscreenElement || t && (t.webkitDisplayingFullscreen || "fullscreen" === t.webkitPresentationMode)))
                    };
                return document.addEventListener("fullscreenchange", n), document.addEventListener("webkitfullscreenchange", n), t && (t.addEventListener("webkitbeginfullscreen", n), t.addEventListener("webkitendfullscreen", n)),
                    function() {
                        document.removeEventListener("fullscreenchange", n), document.removeEventListener("webkitfullscreenchange", n), t && (t.removeEventListener("webkitbeginfullscreen", n), t.removeEventListener("webkitendfullscreen", n))
                    }
            }, [o]);
            var eB = (0, a.useCallback)(function(e) {
                    " " === e.key && (e.stopPropagation(), e.preventDefault(), ek())
                }, [ek]),
                eU = (0, a.useCallback)(function() {
                    return Q(!0)
                }, []),
                eH = (0, a.useCallback)(function() {
                    ef.current || Q(!1)
                }, []);
            return a.default.createElement("div", {
                className: D(void 0 !== M && M && g ? V.mobileControls : V.controls, ((n = {})[V.noTransitions] = _ || el, n)),
                style: {
                    display: void 0 !== T && T ? "none" : void 0
                }
            }, a.default.createElement("div", {
                className: V.controlsWrapper
            }, a.default.createElement("div", {
                className: V.overlayButton,
                onClick: ex,
                onKeyDown: eB,
                tabIndex: -1,
                role: "button",
                "aria-label": _ ? "Pause video" : "Play video"
            }), a.default.createElement("div", {
                className: V.controlsFooter
            }, a.default.createElement(i.Slider, {
                value: ea,
                max: H || 100,
                onChange: eV,
                onMouseDown: eP,
                onTouchStart: eP,
                onClick: (0, a.useCallback)(function(e) {
                    return e.stopPropagation()
                }, []),
                color: "secondary",
                size: "small",
                step: 1e-6,
                "aria-label": "Video progress"
            }), a.default.createElement("div", {
                className: V.controlsRow
            }, a.default.createElement(l.IconButton, {
                ref: z,
                onClick: function(e) {
                    e.stopPropagation(), ek()
                },
                color: "onMediaLight",
                size: "small",
                "aria-label": _ ? "Pause" : "Play"
            }, _ ? a.default.createElement(s.Pause, null) : a.default.createElement(u.PlayArrowIcon, null)), a.default.createElement("div", {
                className: V.rightControls
            }, a.default.createElement("div", {
                className: V.volumeControl,
                onMouseEnter: eU,
                onMouseLeave: eH,
                onClick: (0, a.useCallback)(function(e) {
                    return e.stopPropagation()
                }, [])
            }, !v && a.default.createElement(i.Slider, {
                className: D(((r = {})[V.volumeSlider] = !0, r.expanded = Z, r)),
                value: G ? 0 : Y,
                max: 1,
                step: 1e-6,
                onChange: eO,
                onMouseDown: eN,
                onTouchStart: eN,
                color: "secondary",
                size: "small",
                "aria-label": "Volume"
            }), a.default.createElement(l.IconButton, {
                onClick: eD,
                color: "onMediaLight",
                size: "small",
                "aria-label": G ? "Unmute" : "Mute"
            }, G ? a.default.createElement(c.VolumeOffRounded, null) : a.default.createElement(d.VolumeUpRounded, null))), g && a.default.createElement(l.IconButton, {
                onClick: e_,
                color: "onMediaLight",
                size: "small",
                "aria-label": et ? "Exit fullscreen" : "Enter fullscreen"
            }, et ? a.default.createElement(f.FullscreenExit, null) : a.default.createElement(p.Fullscreen, null)))))))
        });
    D.displayName = "VideoControlsOverlay";
    var z = function(e) {
            var t = (0, a.useRef)(null);
            return (0, a.useEffect)(function() {
                e && ("function" == typeof e ? e(t.current) : e.current = t.current)
            }), t
        },
        j = function(e, t) {
            var n = e.enableAnalytics,
                r = e.analyticsConfig,
                o = e.headerContent,
                i = e.disableControls,
                l = e.controlsConfig,
                s = e.debug,
                u = e.fullscreenActive,
                c = e.onHoverActive,
                d = e.ctaObject,
                f = e.loop,
                p = w(e, ["enableAnalytics", "analyticsConfig", "headerContent", "disableControls", "controlsConfig", "debug", "fullscreenActive", "onHoverActive", "ctaObject", "loop"]),
                v = z(t),
                m = P().classes;
            return a.default.createElement("div", {
                className: m.container
            }, a.default.createElement(y, x({
                ref: v
            }, p, {
                controls: !1,
                headerContent: o
            })), a.default.createElement(D, x({
                ref: t,
                videoElementRef: v,
                ctaObject: d,
                enableAnalytics: n,
                analyticsConfig: r,
                debug: void 0 !== s && s,
                fullScreenEnabled: void 0 !== u && u,
                onHoverActive: void 0 !== c && c,
                loop: void 0 !== f && f,
                hidden: i
            }, l)))
        };
    j.displayName = "VideoPlayer";
    var _ = a.default.forwardRef(j),
        B = function(e, t) {
            if (!e) return t;
            try {
                return JSON.parse(e)
            } catch (e) {
                return t
            }
        },
        U = function(e) {
            return null != e && "" !== e
        };

    function H(e, t) {
        for (var n = 0; n < e.length; n += 1) {
            var r = e.start(n),
                a = e.end(n);
            if (t >= r && t < a) return {
                start: r,
                end: a
            }
        }
        return null
    }
    var W = function(e, t) {
            this.name = e, this.value = t
        },
        X = function(e, t) {
            this.width = e, this.height = t
        },
        Y = "RESOLUTION",
        $ = "FRAME-RATE",
        q = "NAME",
        G = "QUERYPARAM",
        K = "VALUE",
        J = function() {
            function e(e, t, n, r) {
                var a = this;
                this.duration = function() {
                    return a.durations.reduce(function(e, t) {
                        return e + t
                    }, 0)
                }, this.nextSegmentIdx = function(e) {
                    return a.segmentIdxByTime(e) + 1
                }, this.segmentUrl = function(e) {
                    return new URL(a.segments[e], a.url).toString()
                }, this.url = e, this.segments = t, this.durations = n, this.startTimes = r
            }
            return e.prototype.segmentIdxByTime = function(e) {
                var t = function(e, t, n) {
                    for (var r = 0, a = e.length - 1; r <= a;) {
                        var o = a + r >> 1,
                            i = n(t, e[o]);
                        if (i > 0) r = o + 1;
                        else {
                            if (!(i < 0)) return o;
                            a = o - 1
                        }
                    }
                    return -r - 1
                }(this.startTimes, e, function(e, t) {
                    return e - t
                });
                return t < 0 && (t = -t - 2), t
            }, e.parse = function(t, n) {
                for (var r = this, a = n.split("\n"), o = a.filter(function(e) {
                        return e.startsWith("#EXTINF")
                    }), i = this.getXDefines(a, t.toString()), l = a.filter(function(e) {
                        return !e.startsWith("#") && "" !== e.trim()
                    }).map(function(e) {
                        return r.replaceAllDefines(i, e)
                    }), s = o.map(function(e) {
                        return parseFloat(e.split(":", 2)[1].replace(",", ""))
                    }), u = [0], c = 0; c < s.length; c += 1) {
                    var d = s[c];
                    u.push(u[u.length - 1] + d)
                }
                return new e(t, l, s, u)
            }, e.getXDefines = function(e, t) {
                var n = this,
                    r = this.parseQueryParams(t);
                return e.filter(function(e) {
                    return e.startsWith("#EXT-X-DEFINE")
                }).map(function(e) {
                    var t = n.parseAttrsToMap(e);
                    if (t.has(G)) {
                        var a = t.get(G) || "",
                            o = String(B(a, a.replace(/^"|"$/g, ""))),
                            i = r.get(o) || "";
                        return new W(o, i)
                    }
                    if (t.has(q) && t.has(K)) {
                        var l = t.get(q) || "",
                            s = String(B(l, l.replace(/^"|"$/g, ""))),
                            u = t.get(K) || "";
                        return new W(s, String(B(u, u.replace(/^"|"$/g, ""))))
                    }
                    return new W("", "")
                }).filter(function(e) {
                    return null != e && U(e.name)
                })
            }, e.parseAttrsToMap = function(e) {
                var t, n = e.indexOf(":");
                if (n < 0) return new Map;
                var r = e.substring(n + 1),
                    a = new Map,
                    o = null == (t = r.match(/[A-Z-]+=/g)) ? void 0 : t.map(function(e) {
                        return e.replace(/=$/, "")
                    }),
                    i = r.split(/[A-Z-]+=/).filter(function(e) {
                        return "" !== e
                    }).map(function(e) {
                        return e.replace(/,$/, "")
                    });
                if (o && i)
                    for (var l = 0; l < o.length; l += 1) l < i.length && a.set(o[l], i[l]);
                return a
            }, e.parseQueryParams = function(e) {
                var t = e.indexOf("?"),
                    n = new Map;
                if (t < 0) return n;
                for (var r = e.substring(t + 1).split("&"), a = 0; a < r.length; a += 1) {
                    var o = r[a],
                        i = o.indexOf("=");
                    if (i >= 1) {
                        var l = o.substring(0, i),
                            s = o.substring(i + 1);
                        n.set(l, s)
                    }
                }
                return n
            }, e.replaceAllDefines = function(e, t) {
                for (var n = t, r = 0; r < e.length; r += 1) {
                    var a = e[r];
                    n = n.replace("{$".concat(a.name, "}"), a.value)
                }
                return n
            }, e.selectHighestResStream = function(e) {
                for (var t = e[0], n = 0; n < e.length; n += 1) {
                    var r = e[n],
                        a = r.get(Y),
                        o = t.get(Y);
                    a.height > o.height && (t = r)
                }
                return t
            }, e.parseMasterManifest = function(e, t) {
                for (var n, r = e.split("\n"), a = this.getXDefines(r, (null == t ? void 0 : t.toString()) || ""), o = new Map, i = 0; i < a.length; i += 1) {
                    var l = a[i];
                    if (o.set(l.name, l.value), "RBX-DURATION" === l.name) {
                        var s = parseFloat(l.value);
                        Number.isNaN(s) || (n = s)
                    }
                }
                var u = r.filter(function(e) {
                    return !e.startsWith("#")
                }).map(function(e) {
                    return e.trim()
                }).filter(function(e) {
                    return U(e)
                });
                return {
                    streams: r.filter(function(e) {
                        return e.startsWith("#EXT-X-STREAM-INF")
                    }).map(function(e, t) {
                        var n = function(e) {
                                var t, n = e.indexOf(":");
                                if (n < 0) return [];
                                var r = e.substring(n + 1),
                                    a = null == (t = r.match(/[A-Z-]+=/g)) ? void 0 : t.map(function(e) {
                                        return e.replace(/=$/, "")
                                    }),
                                    o = r.split(/[A-Z-]+=/).filter(function(e) {
                                        return "" !== e
                                    }).map(function(e) {
                                        return e.replace(/,$/, "")
                                    });
                                return (null == a ? void 0 : a.map(function(e, t) {
                                    return [e, o[t]]
                                })) || [
                                    []
                                ]
                            }(e),
                            r = new Map;
                        r.set("URL", function(e, t) {
                            for (var n = t, r = 0; r < e.length; r += 1) {
                                var a = e[r];
                                n = n.replace("{$".concat(a.name, "}"), a.value)
                            }
                            return n
                        }(a, u[t]));
                        for (var o = 0; o < n.length; o += 1) {
                            var i = n[o],
                                l = i[0],
                                s = i[1],
                                c = void 0;
                            if ("AVERAGE-BANDWIDTH" === l) c = parseInt(s, 10);
                            else if ("BANDWIDTH" === l) c = parseInt(s, 10);
                            else if (l === Y) {
                                var d = s.split("x", 2).map(function(e) {
                                    return parseInt(e, 10)
                                });
                                c = new X(d[0], d[1])
                            } else c = l === $ ? parseFloat(s) : s;
                            r.set(l, c)
                        }
                        return r
                    }),
                    rbxDurationSeconds: n,
                    metadata: o
                }
            }, e
        }(),
        Z = function() {
            function e(e) {
                this.chunkState = new Map, this.videoElement = e
            }
            return e.prototype.downloadBuf = function(e) {
                return E(this, void 0, void 0, function() {
                    var t;
                    return C(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return this.chunkState.set(e, "loading"), [4, fetch(e)];
                            case 1:
                                return [4, n.sent().blob()];
                            case 2:
                                return [4, n.sent().arrayBuffer()];
                            case 3:
                                return t = n.sent(), this.chunkState.set(e, "loaded"), [2, t]
                        }
                    })
                })
            }, e.prototype.appendSegmentByIdx = function(e) {
                return E(this, void 0, void 0, function() {
                    var t, n, r, a, o, i, l = this;
                    return C(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return null == (t = this.playlist) ? [2] : t.segments[e] ? (n = t.segmentUrl(e), this.chunkState.has(n) ? [3, 2] : [4, this.downloadBuf(n)]) : [2];
                            case 1:
                                r = s.sent(), null == (o = this.sourceBuffer) || o.appendBuffer(r), e === (t.segments.length || 0) - 1 && (a = function() {
                                    var e, t;
                                    null == (e = l.sourceBuffer) || e.removeEventListener("updateend", a), null == (t = l.mediaSource) || t.endOfStream()
                                }, null == (i = this.sourceBuffer) || i.addEventListener("updateend", a)), s.label = 2;
                            case 2:
                                return [2]
                        }
                    })
                })
            }, e.prototype.open = function(e, t, n) {
                return E(this, void 0, void 0, function() {
                    var r, a, o, i, l = this;
                    return C(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return r = new MediaSource, this.mediaSource = r, this.videoElement.src = URL.createObjectURL(r), [4, fetch(e.toString())];
                            case 1:
                                return [4, s.sent().text()];
                            case 2:
                                return a = s.sent(), o = J.parse(e, a), this.playlist = o, this.frameRate = n, [4, new Promise(function(e, n) {
                                    var a = function() {
                                        try {
                                            var a = r.addSourceBuffer('video/webm; codecs="'.concat(t, '"'));
                                            e(a)
                                        } catch (e) {
                                            n(e)
                                        }
                                    };
                                    "open" === r.readyState ? (r.duration = o.duration(), a()) : r.addEventListener("sourceopen", function() {
                                        r.duration = o.duration(), a()
                                    })
                                })];
                            case 3:
                                return i = s.sent(), this.sourceBuffer = i, [4, this.appendSegmentByIdx(0)];
                            case 4:
                                return s.sent(), this.videoElement.ontimeupdate = function() {
                                    return E(l, void 0, void 0, function() {
                                        var e, t, n;
                                        return C(this, function(a) {
                                            switch (a.label) {
                                                case 0:
                                                    return 0 === r.sourceBuffers.length ? [2] : (e = this.videoElement.currentTime, (t = H(i.buffered, e)) && 3 > Math.abs(t.end - e) ? (n = o.nextSegmentIdx(e), [4, this.appendSegmentByIdx(n)]) : [3, 2]);
                                                case 1:
                                                    a.sent(), a.label = 2;
                                                case 2:
                                                    return [2]
                                            }
                                        })
                                    })
                                }, this.videoElement.onseeking = function() {
                                    return E(l, void 0, void 0, function() {
                                        var e, t;
                                        return C(this, function(n) {
                                            switch (n.label) {
                                                case 0:
                                                    return 0 === r.sourceBuffers.length ? [2] : (e = this.videoElement.currentTime, null != H(i.buffered, e) ? [3, 2] : (t = o.segmentIdxByTime(e), [4, this.appendSegmentByIdx(t)]));
                                                case 1:
                                                    n.sent(), n.label = 2;
                                                case 2:
                                                    return [2]
                                            }
                                        })
                                    })
                                }, [2]
                        }
                    })
                })
            }, e.fetchManifestFromUrl = function(e) {
                return E(this, void 0, void 0, function() {
                    var t, n, r, a, o, i;
                    return C(this, function(l) {
                        switch (l.label) {
                            case 0:
                                return [4, fetch(e)];
                            case 1:
                                return [4, (t = l.sent()).text()];
                            case 2:
                                if (n = l.sent(), t.status < 200 || t.status >= 400) throw Error("ERROR: ".concat(t.status, " ").concat(t.statusText, "\n").concat(n));
                                if (!n.startsWith("#EXTM3U")) throw Error("not an HLS manifest");
                                return r = J.parseMasterManifest(n, e), "" === (o = (o = (a = J.selectHighestResStream(r.streams)).get("CODECS") || "").replace(/^"|"$/g, "")) && (o = "vp9,opus"), i = a.get($) || 60, [2, {
                                    playlistUrl: e,
                                    manifestText: n,
                                    rbxDurationSeconds: r.rbxDurationSeconds,
                                    metadata: r.metadata,
                                    bestStream: a,
                                    codecs: o,
                                    frameRate: i
                                }]
                        }
                    })
                })
            }, e.fetchManifestData = function(e) {
                return E(this, void 0, void 0, function() {
                    var t;
                    return C(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, fetch(e, {
                                    method: "GET",
                                    credentials: "include"
                                })];
                            case 1:
                                return [4, n.sent().text()];
                            case 2:
                                return t = new URL(JSON.parse(n.sent()).locations[0].location), [2, this.fetchManifestFromUrl(t)]
                        }
                    })
                })
            }, e.prototype.openFromManifestData = function(e, t) {
                return E(this, void 0, void 0, function() {
                    return C(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return this.manifestMetadata = e.metadata, this.rbxDurationSeconds = e.rbxDurationSeconds, [4, this.open(new URL(e.bestStream.get("URL"), e.playlistUrl), e.codecs, e.frameRate)];
                            case 1:
                                return n.sent(), t && t(this), [2]
                        }
                    })
                })
            }, e.prototype.openMasterManifestURL = function(t, n) {
                return E(this, void 0, void 0, function() {
                    var r;
                    return C(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, e.fetchManifestData(t)];
                            case 1:
                                return r = a.sent(), [4, this.openFromManifestData(r, n)];
                            case 2:
                                return a.sent(), [2]
                        }
                    })
                })
            }, e.prototype.frameVisitOffset = function() {
                return .5 / (this.frameRate || .001)
            }, e.prototype.cleanup = function() {
                try {
                    this.mediaSource && "open" === this.mediaSource.readyState && this.mediaSource.endOfStream()
                } catch (e) {}
                this.sourceBuffer = void 0, this.mediaSource = void 0, this.playlist = void 0, this.chunkState.clear(), this.videoElement && (this.videoElement.ontimeupdate = null, this.videoElement.onseeking = null)
            }, e.getRbxDurationFromManifestData = function(e) {
                return e.rbxDurationSeconds
            }, e.prototype.getRbxDuration = function() {
                return this.rbxDurationSeconds
            }, e.prototype.getManifestMetadata = function() {
                return this.manifestMetadata
            }, e.fetchManifestDataFromAssetId = function(t, n) {
                return E(this, void 0, void 0, function() {
                    var r, a;
                    return C(this, function(o) {
                        return r = encodeURIComponent(btoa('[{"format":"hls","majorVersion":"1","fidelity":"main"}]')), a = "production" === n ? "https://assetdelivery.roblox.com/v2/asset?Id=".concat(t, "&&ContentRepresentationPriorityList=").concat(r) : "https://assetdelivery.".concat(n, ".robloxlabs.com/v2/asset?Id=").concat(t, "&&ContentRepresentationPriorityList=").concat(r), [2, e.fetchManifestData(a)]
                    })
                })
            }, e
        }(),
        Q = (0, o.makeStyles)()(function(e) {
            return {
                errorContainer: {
                    position: "relative",
                    backgroundColor: e.palette.content.static.dark,
                    width: "100%",
                    height: "100%"
                }
            }
        }),
        ee = function(e, t) {
            var n = e.manifest,
                r = e.manifestUrl,
                o = e.videoAssetId,
                i = e.environment,
                l = e.debug,
                s = e.analyticsConfig,
                u = e.enableAnalytics,
                c = e.onHoverActive,
                d = e.loop,
                f = e.fullscreenActive,
                p = e.onLoadVideoStart,
                v = e.onLoadVideoEnd,
                m = e.onLoadError,
                h = w(e, ["manifest", "manifestUrl", "videoAssetId", "environment", "debug", "analyticsConfig", "enableAnalytics", "onHoverActive", "loop", "fullscreenActive", "onLoadVideoStart", "onLoadVideoEnd", "onLoadError"]),
                b = z(t),
                g = Q(),
                y = g.classes,
                S = g.cx,
                k = (0, a.useRef)(void 0),
                L = (0, a.useMemo)(function() {
                    var e = [];
                    try {
                        if ("u" > typeof window) {
                            var t = window.navigator.userAgent;
                            (/^((?!chrome|android).)*safari/i.test(t) && ("ManagedMediaSource" in window || e.push("Safari 16 or older is not supported")), window.MediaSource) ? MediaSource.isTypeSupported('video/webm; codecs="vp9,opus"') || e.push("WebM VP9/Opus codec is not supported in this browser"): e.push("MediaSource API is not supported in this browser")
                        }
                    } catch (t) {
                        e.push("Browser compatibility check failed")
                    }
                    return {
                        isSupported: 0 === e.length,
                        errors: e
                    }
                }, []),
                T = function(e) {
                    var t = this,
                        n = e.videoAssetId,
                        r = e.environment,
                        o = e.manifestUrl,
                        i = e.enabled,
                        l = void 0 === i || i,
                        s = (0, a.useState)(void 0),
                        u = s[0],
                        c = s[1],
                        d = (0, a.useState)(!1),
                        f = d[0],
                        p = d[1],
                        v = (0, a.useState)(null),
                        m = v[0],
                        h = v[1],
                        b = (0, a.useCallback)(function() {
                            return E(t, void 0, void 0, function() {
                                var e, t;
                                return C(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (!l || !(o || n && r)) return [2];
                                            a.label = 1;
                                        case 1:
                                            return a.trys.push([1, 6, 7, 8]), p(!0), h(null), o ? (e = c, [4, Z.fetchManifestFromUrl(new URL(o))]) : [3, 3];
                                        case 2:
                                            return e.apply(void 0, [a.sent()]), [3, 5];
                                        case 3:
                                            return t = c, [4, Z.fetchManifestDataFromAssetId(n, r)];
                                        case 4:
                                            t.apply(void 0, [a.sent()]), a.label = 5;
                                        case 5:
                                            return [3, 8];
                                        case 6:
                                            return h(a.sent()), c(void 0), [3, 8];
                                        case 7:
                                            return p(!1), [7];
                                        case 8:
                                            return [2]
                                    }
                                })
                            })
                        }, [n, r, o, l]),
                        g = null == u ? void 0 : u.rbxDurationSeconds;
                    return (0, a.useEffect)(function() {
                        b()
                    }, [b]), {
                        manifest: u,
                        durationInSeconds: g,
                        loading: f,
                        error: m,
                        refetch: (0, a.useCallback)(function() {
                            b()
                        }, [b])
                    }
                }({
                    videoAssetId: o,
                    environment: i,
                    manifestUrl: r,
                    enabled: !n && L.isSupported
                }),
                A = n || T.manifest;
            return (0, a.useEffect)(function() {
                T.error && m && m(T.error)
            }, [T.error, m]), (0, a.useEffect)(function() {
                !L.isSupported && m && m(Error("Browser not supported: ".concat(L.errors.join(", "))))
            }, [m, L.isSupported, L.errors]), (0, a.useEffect)(function() {
                var e = b.current;
                if (null != e && void 0 !== A && L.isSupported && !T.error) return E(void 0, void 0, void 0, function() {
                        var t, n;
                        return C(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    if (!e || !A) return [2];
                                    r.label = 1;
                                case 1:
                                    return r.trys.push([1, 3, , 4]), null == p || p(), k.current = t = new Z(e), [4, t.openFromManifestData(A, function() {
                                        null == v || v()
                                    })];
                                case 2:
                                    return r.sent(), [3, 4];
                                case 3:
                                    return n = r.sent(), m && n instanceof Error && m(n), [3, 4];
                                case 4:
                                    return [2]
                            }
                        })
                    }),
                    function() {
                        k.current && (k.current.cleanup(), k.current = void 0)
                    }
            }, [A, b, p, v, m, T.error, L.isSupported]), L.isSupported && !T.error && A ? a.default.createElement(_, x({
                ref: b,
                debug: void 0 !== l && l,
                analyticsConfig: s,
                enableAnalytics: u,
                onHoverActive: void 0 !== c && c,
                loop: void 0 !== d && d,
                fullscreenActive: void 0 !== f && f
            }, h)) : a.default.createElement("div", {
                className: S(h.className, y.errorContainer)
            })
        };
    ee.displayName = "RobloxVideoPlayer";
    var et = a.default.forwardRef(ee);
    e.s(["RobloxVideoPlayer", 0, et], 914040)
}]);

//# debugId=4af04034-dd7d-c8a8-5ccc-c855ee4006f1
//# sourceMappingURL=2c0i4otubrfyj.js.map
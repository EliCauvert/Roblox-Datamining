;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "480ac161-039a-6295-cc11-31b96d656425")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 448599, e => {
    "use strict";
    var t = e.i(690569),
        n = e.i(945146),
        r = e.i(416340),
        a = e.i(251635),
        o = e.i(787802),
        i = e.i(221628),
        l = e.i(121880);

    function s(e) {
        return (0, t.g)("MuiCardMedia", e)
    }
    e.i(407110), (0, o.g)("MuiCardMedia", ["root", "media", "img"]);
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
}, 707111, 683329, e => {
    "use strict";
    let t;
    var n = e.i(194250),
        r = e.i(416340),
        a = e.i(863605),
        o = e.i(154502),
        i = e.i(787802),
        l = e.i(690569),
        s = e.i(707571),
        u = e.i(945146),
        c = e.i(251635),
        d = e.i(977987),
        f = e.i(946029),
        p = e.i(887833),
        v = e.i(352705),
        m = e.i(710302),
        h = e.i(230505),
        b = e.i(950711),
        g = e.i(441872),
        y = e.i(81962),
        S = e.i(722417),
        k = e.i(578143),
        x = e.i(221628),
        w = e.i(121880),
        E = e.i(15686);

    function C(e, t) {
        return e - t
    }

    function T(e, t) {
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

    function L(e, t) {
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
    e.i(407110);

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

    function P(e, t) {
        return "number" == typeof e && "number" == typeof t ? e === t : "object" == typeof e && "object" == typeof t && function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : (e, t) => e === t;
            return e.length === t.length && e.every((e, r) => n(e, t[r]))
        }(e, t)
    }
    let I = {
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
        M = e => e;

    function O() {
        return void 0 === t && (t = "u" < typeof CSS || "function" != typeof CSS.supports || CSS.supports("touch-action", "none")), t
    }

    function V(e) {
        return (0, l.g)("MuiSlider", e)
    }
    var N = (0, i.g)("MuiSlider", ["root", "active", "colorPrimary", "colorSecondary", "colorError", "colorInfo", "colorSuccess", "colorWarning", "disabled", "dragging", "focusVisible", "mark", "markActive", "marked", "markLabel", "markLabelActive", "rail", "sizeSmall", "thumb", "thumbColorPrimary", "thumbColorSecondary", "thumbColorError", "thumbColorSuccess", "thumbColorInfo", "thumbColorWarning", "track", "trackInverted", "trackFalse", "thumbSizeSmall", "valueLabel", "valueLabelOpen", "valueLabelCircle", "valueLabelLabel", "vertical"]);
    let D = ["aria-label", "aria-valuetext", "aria-labelledby", "component", "components", "componentsProps", "color", "classes", "className", "disableSwap", "disabled", "getAriaLabel", "getAriaValueText", "marks", "max", "min", "name", "onChange", "onChangeCommitted", "orientation", "shiftStep", "size", "step", "scale", "slotProps", "slots", "tabIndex", "track", "value", "valueLabelDisplay", "valueLabelFormat"];

    function F(e) {
        return e
    }
    let j = (0, c.s)("span", {
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
        U = (0, c.s)("span", {
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
        z = (0, c.s)("span", {
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
        _ = (0, c.s)("span", {
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
        B = (0, c.s)(function(e) {
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
        K = r.forwardRef(function(e, t) {
            var n, a, o, i, s, N, K, Y, q, $, G, J, Q, Z, ee, et, en, er, ea, eo, ei, el, es, eu;
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
                    max: eT = 100,
                    min: eL = 0,
                    orientation: eA = "horizontal",
                    shiftStep: eR = 10,
                    size: eP = "medium",
                    step: eI = 1,
                    scale: eM = F,
                    slotProps: eO,
                    slots: eV,
                    track: eN = "normal",
                    valueLabelDisplay: eD = "off",
                    valueLabelFormat: eF = F
                } = ec,
                ej = (0, l._)(ec, D),
                eU = (0, u._)({}, ec, {
                    isRtl: ed,
                    max: eT,
                    min: eL,
                    classes: ey,
                    disabled: ex,
                    disableSwap: ek,
                    orientation: eA,
                    marks: eC,
                    color: eg,
                    size: eP,
                    step: eI,
                    shiftStep: eR,
                    scale: eM,
                    track: eN,
                    valueLabelDisplay: eD,
                    valueLabelFormat: eF
                }),
                {
                    axisProps: ez,
                    getRootProps: e_,
                    getHiddenInputProps: eB,
                    getThumbProps: eH,
                    open: eW,
                    active: eX,
                    axis: eK,
                    focusedThumbIndex: eY,
                    range: eq,
                    dragging: e$,
                    marks: eG,
                    values: eJ,
                    trackOffset: eQ,
                    trackLeap: eZ,
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
                        scale: V = M,
                        step: N = 1,
                        shiftStep: D = 10,
                        tabIndex: F,
                        value: j
                    } = e, U = r.useRef(void 0), [z, _] = r.useState(-1), [B, H] = r.useState(-1), [W, X] = r.useState(!1), K = r.useRef(0), [Y, q] = (0, f.u)({
                        controlled: j,
                        default: null != n ? n : c,
                        name: "Slider"
                    }), $ = k && ((e, t, n) => {
                        let r = e.nativeEvent || e,
                            a = new r.constructor(r.type, r);
                        Object.defineProperty(a, "target", {
                            writable: !0,
                            value: {
                                value: t,
                                name: d
                            }
                        }), k(a, t, n)
                    }), G = Array.isArray(Y), J = G ? Y.slice().sort(C) : [Y];
                    J = J.map(e => null == e ? c : (0, p.c)(e, c, s));
                    let Q = !0 === l && null !== N ? [...Array(Math.floor((s - c) / N) + 1)].map((e, t) => ({
                            value: c + N * t
                        })) : l || [],
                        Z = Q.map(e => e.value),
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
                                a = Z.indexOf(r),
                                i = t;
                            if (Q && null == N) {
                                let e = Z[Z.length - 1];
                                i = i > e ? e : i < Z[0] ? Z[0] : i < r ? Z[a - 1] : Z[a + 1]
                            }
                            if (i = (0, p.c)(i, c, s), G) {
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
                            q(i), eo(n), $ && !P(i, Y) && $(e, i, n), x && x(e, i)
                        };
                    (0, h.u)(() => {
                        var e;
                        a && ei.current.contains(document.activeElement) && (null == (e = document.activeElement) || e.blur())
                    }, [a]), a && -1 !== z && _(-1), a && -1 !== ea && eo(-1);
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
                                let e = T(Z, n);
                                n = Z[e]
                            }
                            n = (0, p.c)(n, c, s);
                            let v = 0;
                            if (G) {
                                v = a ? ec.current : T(J, n), o && (n = (0, p.c)(n, J[v - 1] || -1 / 0, J[v + 1] || 1 / 0));
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
                            let t = L(e, U);
                            if (!t) return;
                            if (K.current += 1, "mousemove" === e.type && 0 === e.buttons) return void ev(e);
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
                                setActive: _
                            }), q(n), !W && K.current > 2 && X(!0), $ && !P(n, Y) && $(e, n, r)
                        }),
                        ev = (0, b.u)(e => {
                            let t = L(e, U);
                            if (X(!1), !t) return;
                            let {
                                newValue: n
                            } = ef({
                                finger: t,
                                move: !0
                            });
                            _(-1), "touchend" === e.type && H(-1), x && x(e, n), U.current = void 0, eh()
                        }),
                        em = (0, b.u)(e => {
                            if (a) return;
                            O() || e.preventDefault();
                            let t = e.changedTouches[0];
                            null != t && (U.current = t.identifier);
                            let n = L(e, U);
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
                                    setActive: _
                                }), q(t), $ && !P(t, Y) && $(e, t, r)
                            }
                            K.current = 0;
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
                            passive: O()
                        }), () => {
                            e.removeEventListener("touchstart", em), eh()
                        }
                    }, [eh, em]), r.useEffect(() => {
                        a && eh()
                    }, [a, eh]);
                    let eb = 100 * ((G ? J[0] : c) - c) / (s - c),
                        eg = 100 * (J[J.length - 1] - c) / (s - c) - eb;
                    return {
                        active: z,
                        axis: ed,
                        axisProps: I,
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
                                            ("ArrowLeft" === e.key || "ArrowDown" === e.key) && e.shiftKey || "PageDown" === e.key ? n = Math.max(t - D, c) : (("ArrowRight" === e.key || "ArrowUp" === e.key) && e.shiftKey || "PageUp" === e.key) && (n = Math.min(t + D, s)), null !== n && (eu(e, n), e.preventDefault())
                                        }
                                        null == f || null == (t = f.onKeyDown) || t.call(f, e)
                                    })
                                },
                                h = (0, u._)({}, v, m);
                            return (0, u._)({
                                tabIndex: F,
                                "aria-labelledby": t,
                                "aria-orientation": w,
                                "aria-valuemax": V(s),
                                "aria-valuemin": V(c),
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
                                        let r = L(t, U);
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
                                                setActive: _
                                            }), q(e), $ && !P(e, Y) && $(t, e, n)
                                        }
                                        K.current = 0;
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
                        marks: Q,
                        open: B,
                        range: G,
                        rootRef: es,
                        trackLeap: eg,
                        trackOffset: eb,
                        values: J,
                        getThumbStyle: e => ({
                            pointerEvents: -1 !== z && z !== e ? "none" : void 0
                        })
                    }
                }((0, u._)({}, eU, {
                    rootRef: t
                }));
            eU.marked = eG.length > 0 && eG.some(e => e.label), eU.dragging = e$, eU.focusedThumbIndex = eY;
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
                    return (0, c.a)(d, V, i)
                })(eU),
                e2 = null != (n = null != (a = null == eV ? void 0 : eV.root) ? a : eh.Root) ? n : j,
                e5 = null != (o = null != (i = null == eV ? void 0 : eV.rail) ? i : eh.Rail) ? o : U,
                e4 = null != (s = null != (N = null == eV ? void 0 : eV.track) ? N : eh.Track) ? s : z,
                e3 = null != (K = null != (Y = null == eV ? void 0 : eV.thumb) ? Y : eh.Thumb) ? K : _,
                e6 = null != (q = null != ($ = null == eV ? void 0 : eV.valueLabel) ? $ : eh.ValueLabel) ? q : B,
                e8 = null != (G = null != (J = null == eV ? void 0 : eV.mark) ? J : eh.Mark) ? G : H,
                e7 = null != (Q = null != (Z = null == eV ? void 0 : eV.markLabel) ? Z : eh.MarkLabel) ? Q : W,
                e9 = null != (ee = null != (et = null == eV ? void 0 : eV.input) ? et : eh.Input) ? ee : "input",
                te = null != (en = null == eO ? void 0 : eO.root) ? en : eb.root,
                tt = null != (er = null == eO ? void 0 : eO.rail) ? er : eb.rail,
                tn = null != (ea = null == eO ? void 0 : eO.track) ? ea : eb.track,
                tr = null != (eo = null == eO ? void 0 : eO.thumb) ? eo : eb.thumb,
                ta = null != (ei = null == eO ? void 0 : eO.valueLabel) ? ei : eb.valueLabel,
                to = null != (el = null == eO ? void 0 : eO.mark) ? el : eb.mark,
                ti = null != (es = null == eO ? void 0 : eO.markLabel) ? es : eb.markLabel,
                tl = null != (eu = null == eO ? void 0 : eO.input) ? eu : eb.input,
                ts = (0, E.u)({
                    elementType: e2,
                    getSlotProps: e_,
                    externalSlotProps: te,
                    externalForwardedProps: ej,
                    additionalProps: (0, u._)({}, (!e2 || !(0, k.i)(e2)) && {
                        as: em
                    }),
                    ownerState: (0, u._)({}, eU, null == te ? void 0 : te.ownerState),
                    className: [e1.root, eS]
                }),
                tu = (0, E.u)({
                    elementType: e5,
                    externalSlotProps: tt,
                    ownerState: eU,
                    className: e1.rail
                }),
                tc = (0, E.u)({
                    elementType: e4,
                    externalSlotProps: tn,
                    additionalProps: {
                        style: (0, u._)({}, ez[eK].offset(eQ), ez[eK].leap(eZ))
                    },
                    ownerState: (0, u._)({}, eU, null == tn ? void 0 : tn.ownerState),
                    className: e1.track
                }),
                td = (0, E.u)({
                    elementType: e3,
                    getSlotProps: eH,
                    externalSlotProps: tr,
                    ownerState: (0, u._)({}, eU, null == tr ? void 0 : tr.ownerState),
                    className: e1.thumb
                }),
                tf = (0, E.u)({
                    elementType: e6,
                    externalSlotProps: ta,
                    ownerState: (0, u._)({}, eU, null == ta ? void 0 : ta.ownerState),
                    className: e1.valueLabel
                }),
                tp = (0, E.u)({
                    elementType: e8,
                    externalSlotProps: to,
                    ownerState: eU,
                    className: e1.mark
                }),
                tv = (0, E.u)({
                    elementType: e7,
                    externalSlotProps: ti,
                    ownerState: eU,
                    className: e1.markLabel
                }),
                tm = (0, E.u)({
                    elementType: e9,
                    getSlotProps: eB,
                    externalSlotProps: tl,
                    ownerState: eU
                });
            return (0, x.jsxs)(e2, (0, u._)({}, ts, {
                children: [(0, x.jsx)(e5, (0, u._)({}, tu)), (0, x.jsx)(e4, (0, u._)({}, tc)), eG.filter(e => e.value >= eL && e.value <= eT).map((e, t) => {
                    let n, a = 100 * (e.value - eL) / (eT - eL),
                        o = ez[eK].offset(a);
                    return n = !1 === eN ? -1 !== eJ.indexOf(e.value) : "normal" === eN && (eq ? e.value >= eJ[0] && e.value <= eJ[eJ.length - 1] : e.value <= eJ[0]) || "inverted" === eN && (eq ? e.value <= eJ[0] || e.value >= eJ[eJ.length - 1] : e.value >= eJ[0]), (0, x.jsxs)(r.Fragment, {
                        children: [(0, x.jsx)(e8, (0, u._)({
                            "data-index": t
                        }, tp, !(0, k.i)(e8) && {
                            markActive: n
                        }, {
                            style: (0, u._)({}, o, tp.style),
                            className: (0, c.c)(tp.className, n && e1.markActive)
                        })), null != e.label ? (0, x.jsx)(e7, (0, u._)({
                            "aria-hidden": !0,
                            "data-index": t
                        }, tv, !(0, k.i)(e7) && {
                            markLabelActive: n
                        }, {
                            style: (0, u._)({}, o, tv.style),
                            className: (0, c.c)(e1.markLabel, tv.className, n && e1.markLabelActive),
                            children: e.label
                        })) : null]
                    }, t)
                }), eJ.map((e, t) => {
                    let n = 100 * (e - eL) / (eT - eL),
                        r = ez[eK].offset(n),
                        a = "off" === eD ? X : e6;
                    return (0, x.jsx)(a, (0, u._)({}, !(0, k.i)(a) && {
                        valueLabelFormat: eF,
                        valueLabelDisplay: eD,
                        value: "function" == typeof eF ? eF(eM(e), t) : eF,
                        index: t,
                        open: eW === t || eX === t || "on" === eD,
                        disabled: ex
                    }, tf, {
                        children: (0, x.jsx)(e3, (0, u._)({
                            "data-index": t
                        }, td, {
                            className: (0, c.c)(e1.thumb, td.className, eX === t && e1.active, eY === t && e1.focusVisible),
                            style: (0, u._)({}, r, e0(t), td.style),
                            children: (0, x.jsx)(e9, (0, u._)({
                                "data-index": t,
                                "aria-label": ew ? ew(t) : ef,
                                "aria-valuenow": eM(e),
                                "aria-labelledby": ev,
                                "aria-valuetext": eE ? eE(eM(e), t) : ep,
                                value: eJ[t]
                            }, tm))
                        }))
                    }), t)
                })]
            }))
        });
    var Y = (0, a.default)({
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
                s = Y(void 0, {
                    props: {
                        classes: (0, o.default)(a, i)
                    }
                });
            return r.default.createElement(K, (0, n._)({}, l, {
                classes: s.classes,
                ref: t
            }))
        });
    e.s(["S", 0, q, "s", 0, N], 683329), e.s(["Slider", 0, q], 707111)
}, 186930, e => {
    "use strict";
    var t, n = e.i(416340),
        r = e.i(697973),
        a = e.i(707111),
        o = e.i(649114),
        i = e.i(29013),
        i = i,
        l = e.i(367094),
        s = i,
        u = i,
        c = i,
        d = i,
        f = e.i(194250),
        p = e.i(863605),
        v = e.i(154502),
        m = e.i(448599);
    e.i(221628);
    var h = (0, p.default)({
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
        b = (0, n.forwardRef)(function(e, t) {
            var r = e.children,
                a = e.classes,
                o = e.headerContent,
                i = e.className,
                l = (0, f.a)(e, ["children", "classes", "headerContent", "className"]),
                s = h(void 0, {
                    props: {
                        classes: (0, v.default)(a, i)
                    }
                }).classes,
                u = s.header,
                c = (0, f.a)(s, ["header"]);
            return n.default.createElement(n.Fragment, null, o && n.default.createElement("div", {
                className: u
            }, o), n.default.createElement(m.M, (0, f._)({}, l, {
                component: "video",
                classes: c,
                ref: t
            }), r))
        }),
        g = e.i(95656),
        y = e.i(252842),
        S = e.i(408068),
        k = function() {
            return (k = Object.assign || function(e) {
                for (var t, n = 1, r = arguments.length; n < r; n++)
                    for (var a in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
                return e
            }).apply(this, arguments)
        };

    function x(e, t) {
        var n = {};
        for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
        if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
            var a = 0;
            for (r = Object.getOwnPropertySymbols(e); a < r.length; a++) 0 > t.indexOf(r[a]) && Object.prototype.propertyIsEnumerable.call(e, r[a]) && (n[r[a]] = e[r[a]])
        }
        return n
    }

    function w(e, t, n, r) {
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

    function E(e, t) {
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
    var C, T, L, A, R, P = (0, r.makeStyles)()(function() {
            return {
                container: {
                    position: "relative"
                }
            }
        }),
        I = (0, r.makeStyles)()(function(e) {
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
    (U = C || (C = {})).VideoImpression = "VIDEO_IMPRESSION", U.VideoAction = "VIDEO_ACTION", U.VideoProgress = "VIDEO_PROGRESS", (z = T || (T = {})).Play = "play", z.Pause = "pause", z.Fullscreen = "fullscreen", z.Navigate = "navigate", z.Volume = "volume", z.Scrub = "scrub", z.ExitFullscreen = "exit_fullscreen", z.Hover = "hover", z.Loop = "loop", z.Load = "load", z.Complete = "complete", z.End = "end", (L || (L = {})).Video = "video", (_ = A || (A = {})).Home = "Home", _.GameDetails = "GameDetails", _.PreAuthLanding = "PreAuthLanding", _.Spotlight = "Spotlight", (R || (R = {})).VideoEngagementEvent = "videoEngagementEventType";
    var M = {
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
                return !!this.config.enabled && (!this.config.excludeErrors || "error" !== e) && M[e] <= M[this.config.level]
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
        V = function(e, t) {
            void 0 === t && (t = {});
            var r = (0, n.useState)(!1),
                a = r[0],
                o = r[1],
                i = t.threshold,
                l = void 0 === i ? .8 : i,
                s = t.debugLogger,
                u = t.id;
            return (0, n.useEffect)(function() {
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
            }, [e, l, s, u]), a
        },
        N = function(e, t, r, a, o, i, l, s) {
            void 0 === o && (o = !1), void 0 === i && (i = !1), void 0 === l && (l = !1), void 0 === s && (s = !1);
            var u = (0, n.useMemo)(function() {
                    return new O(i)
                }, [i]),
                c = (0, n.useRef)(null),
                d = (0, n.useRef)(!1),
                f = (0, n.useRef)(y.uuidService.generateRandomUuid()),
                p = (0, n.useRef)(y.uuidService.generateRandomUuid()),
                v = (0, n.useRef)(!1),
                m = (0, n.useRef)(!1),
                h = (0, n.useRef)({
                    startTime: null,
                    isPlaying: !1,
                    scrubStartTime: null,
                    scrubStartPosition: null,
                    playStartTime: null,
                    hasPlayedOneSecond: !1
                }),
                b = (0, n.useRef)(!1);
            (0, n.useRef)(!0);
            var S = (0, n.useRef)({
                    startTime: null
                }),
                x = (0, n.useRef)(void 0),
                w = V(o && t ? e.current : null, {
                    threshold: (null == t ? void 0 : t.visibilityThreshold) || .8,
                    debugLogger: u,
                    id: "VideoPlayer"
                }),
                E = V(o && (null == a ? void 0 : a.current) || null, {
                    threshold: (null == t ? void 0 : t.visibilityThreshold) || .8,
                    debugLogger: u,
                    id: "CTAElement"
                }),
                A = (0, n.useCallback)(function(n, a, i) {
                    var l;
                    if (o && c.current && t && e.current) try {
                        var s = e.current,
                            d = s.duration,
                            v = {
                                target: t.target,
                                eventType: "videoEngagementEvent",
                                context: L.Video,
                                localTime: new Date,
                                additionalProperties: k({
                                    videoEngagementEventType: n,
                                    videoAssetId: t.assetId,
                                    sourceId: t.sourceId,
                                    source: t.source,
                                    pageContext: t.pageContext,
                                    impressionId: f.current,
                                    playbackSessionId: p.current,
                                    videoAssetDuration: d,
                                    isVisible: !0,
                                    isAudible: !s.muted && s.volume > 0,
                                    isFullscreen: r,
                                    volumeLevel: s.muted ? 0 : s.volume,
                                    autoplayByDefault: s.autoplay,
                                    actionType: a
                                }, i)
                            };
                        c.current.sendEventViaImg(v), u.log("".concat(n, ": ").concat(JSON.stringify(v))), null == (l = t.onSendEvent) || l.call(t, "".concat(n, ": ").concat(JSON.stringify(v)))
                    } catch (e) {
                        u.error("Failed to send event:", e)
                    }
                }, [o, t, r, u, e]);
            (0, n.useEffect)(function() {
                l && !b.current ? (A(C.VideoAction, T.Hover), b.current = !0) : b.current = l
            }, [A, l]), (0, n.useEffect)(function() {
                if (o && t) {
                    if (!v.current) try {
                        var e, n, r = (n = "production" === (e = t.environment) ? "https://ecsv2.roblox.com" : "https://ecsv2.".concat(e, ".robloxlabs.com"), new g.Configuration({
                            baseUrl: "".concat(n, "/").concat(t.target)
                        }));
                        c.current = new g.Tracker(r), v.current = !0, u.log("Event stream tracker initialized:", {
                            analyticsConfig: t,
                            enableAnalytics: o
                        })
                    } catch (e) {
                        u.error("Failed to initialize event stream tracker:", e)
                    }
                } else u.warn("Analytics not enabled, config not provided")
            }, [o, t, u]);
            var R = (0, n.useCallback)(function() {
                    if (!d.current && e.current && t && w) {
                        var n, r, a, o, i = h.current,
                            u = e.current;
                        r = (n = {
                            hasPlayedOneSecond: i.hasPlayedOneSecond,
                            autoPlayActive: u.autoplay,
                            onHoverActive: l,
                            meetsCtaCriteria: E && w || s
                        }).hasPlayedOneSecond, a = n.autoPlayActive, o = n.onHoverActive, (n.meetsCtaCriteria || a && r || r || o && r) && (A(C.VideoImpression), d.current = !0)
                    }
                }, [e, t, A, l, w, E, s]),
                P = (0, n.useCallback)(function(e, t) {
                    A(C.VideoProgress, void 0, {
                        progressStartTime: e,
                        progressEndTime: t
                    })
                }, [A]),
                I = (0, n.useCallback)(function() {
                    S.current.startTime = Date.now()
                }, []),
                M = (0, n.useCallback)(function() {
                    var e = S.current;
                    null !== e.startTime && (A(C.VideoAction, T.Load, {
                        loadTime: Date.now() - e.startTime
                    }), e.startTime = null)
                }, [A]),
                N = (0, n.useCallback)(function(e, n) {
                    var r, a;
                    if (o && t) {
                        var i = h.current;
                        null !== i.playStartTime && !i.hasPlayedOneSecond && e - i.playStartTime >= (null != (r = t.impressionPlaybackThreshold) ? r : 1) && (i.hasPlayedOneSecond = !0, R()), n > 0 && t.completionThreshold && !m.current && e / n * 100 >= t.completionThreshold && (null == (a = t.onComplete) || a.call(t), A(C.VideoAction, T.Complete), m.current = !0)
                    }
                }, [o, t, R, A]),
                D = (0, n.useCallback)(function() {
                    var t = h.current;
                    if (e.current && null !== t.startTime) {
                        var n = e.current.currentTime;
                        t.isPlaying && n > t.startTime && P(t.startTime, n), t.startTime = null
                    }
                    A(C.VideoAction, T.Loop)
                }, [A, e, P]),
                F = (0, n.useCallback)(function() {
                    var t = h.current;
                    e.current && (t.startTime = e.current.currentTime, t.isPlaying = !0, t.playStartTime = e.current.currentTime, A(C.VideoAction, T.Play))
                }, [e, A]),
                j = (0, n.useCallback)(function() {
                    var t = h.current;
                    if (e.current && null !== t.startTime) {
                        var n = e.current.currentTime;
                        t.isPlaying && n > t.startTime && P(t.startTime, n), A(C.VideoAction, T.Pause), t.isPlaying = !1, t.startTime = null
                    }
                }, [e, A, P]),
                U = (0, n.useCallback)(function(e, t) {
                    A(C.VideoAction, T.Volume, {
                        volumeLevel: t ? 0 : e
                    })
                }, [A]),
                z = (0, n.useCallback)(function(t) {
                    var n = h.current;
                    n.isPlaying && null !== n.startTime && e.current && (P(n.startTime, t), n.isPlaying = !1), n.scrubStartTime = Date.now(), n.scrubStartPosition = t
                }, [e, P]),
                _ = (0, n.useCallback)(function(t) {
                    var n = h.current;
                    if (null !== n.scrubStartTime && null !== n.scrubStartPosition) {
                        var r = n.scrubStartPosition;
                        A(C.VideoAction, T.Scrub, {
                            scrubStartTime: r,
                            scrubEndTime: t
                        }), e.current && !e.current.paused && (n.startTime = t, n.isPlaying = !0), n.scrubStartTime = null, n.scrubStartPosition = null
                    }
                }, [e, A]),
                B = (0, n.useCallback)(function() {
                    A(C.VideoAction, T.Fullscreen)
                }, [A]),
                H = (0, n.useCallback)(function() {
                    A(C.VideoAction, T.ExitFullscreen)
                }, [A]);
            (0, n.useEffect)(function() {
                void 0 !== x.current && x.current !== r && (r ? B() : H()), x.current = r
            }, [r, B, H]);
            var W = (0, n.useCallback)(function() {
                    j(), A(C.VideoAction, T.Navigate, {
                        destination: null == t ? void 0 : t.navigationDestination
                    })
                }, [A, j, t]),
                X = (0, n.useCallback)(function() {
                    var t = h.current;
                    if (e.current && null !== t.startTime) {
                        var n = e.current.currentTime;
                        n > t.startTime && P(t.startTime, n), A(C.VideoAction, T.End)
                    }
                }, [A, P, e]);
            (0, n.useEffect)(function() {
                w && R()
            }, [w, E, R]);
            var K = (0, n.useCallback)(function() {
                e.current && (X(), p.current = y.uuidService.generateRandomUuid(), m.current = !1, h.current = {
                    startTime: null,
                    isPlaying: !1,
                    scrubStartTime: null,
                    scrubStartPosition: null,
                    playStartTime: null,
                    hasPlayedOneSecond: !1
                }, S.current = {
                    startTime: null
                }, u.log("Video reset: New playback session created"))
            }, [e, u, X]);
            return {
                onPlay: F,
                onPause: j,
                onVolumeChange: U,
                onSeekStart: z,
                onSeekEnd: _,
                onFullscreen: B,
                onExitFullscreen: H,
                onNavigate: W,
                onEnd: X,
                onLoop: D,
                onLoadStart: I,
                onLoadEnd: M,
                onTimeUpdate: N,
                resetVideo: K
            }
        },
        D = (0, n.forwardRef)(function(e, t) {
            var r, f, p = e.videoElementRef,
                v = e.disableVolumeSlider,
                m = e.enableAnalytics,
                h = e.analyticsConfig,
                b = e.fullScreenEnabled,
                g = void 0 !== b && b,
                y = e.debug,
                S = void 0 !== y && y,
                k = e.onHoverActive,
                x = e.ctaObject,
                C = e.loop,
                T = void 0 !== C && C,
                L = e.hidden,
                A = e.initialVolume,
                R = void 0 === A ? 1 : A,
                P = e.isMobileView,
                M = I(),
                D = M.classes,
                F = M.cx,
                j = (0, n.useRef)(null),
                U = (0, n.useState)(!1),
                z = U[0],
                _ = U[1],
                B = (0, n.useState)(0),
                H = B[0],
                W = B[1],
                X = (0, n.useState)(1),
                K = X[0],
                Y = X[1],
                q = (0, n.useState)(!1),
                $ = q[0],
                G = q[1],
                J = (0, n.useState)(!1),
                Q = J[0],
                Z = J[1],
                ee = (0, n.useState)(!1),
                et = ee[0],
                en = ee[1],
                er = (0, n.useState)(0),
                ea = er[0],
                eo = er[1],
                ei = (0, n.useState)(!1),
                el = ei[0],
                es = ei[1],
                eu = (0, n.useRef)(!1),
                ec = (0, n.useRef)(!1),
                ed = (0, n.useRef)(!1),
                ef = (0, n.useRef)(!1),
                ep = (0, n.useRef)(!0),
                ev = (0, n.useMemo)(function() {
                    return new O(S)
                }, [S]),
                em = (0, n.useRef)(null);
            (0, n.useEffect)(function() {
                var e = p.current;
                e && (G(e.muted), Y(R), e.volume = R)
            }, [p, R]);
            var eh = V(j.current, {
                    threshold: (null == h ? void 0 : h.visibilityThreshold) || .8,
                    debugLogger: ev,
                    id: "PlayPauseButton"
                }),
                eb = N(p, h, et, x, void 0 !== m && m, S, void 0 !== k && k, eh);
            (0, n.useImperativeHandle)(t, function() {
                var e = p.current;
                return e ? Object.assign(e, {
                    reset: function() {
                        e.pause(), eb.resetVideo(), e.currentTime = 0, Z(!1), eu.current = !1, ec.current = !1, ed.current = !1, ef.current = !1, ev.log("Video reset: All state and refs have been reset")
                    }
                }) : {}
            }, [p, eb, ev]);
            var eg = (0, n.useCallback)(function() {
                    var e = p.current;
                    !e || e.paused || e.ended || (eo(e.currentTime), em.current = requestAnimationFrame(eg))
                }, [p]),
                ey = (0, n.useCallback)(function() {
                    null == em.current && (em.current = requestAnimationFrame(eg))
                }, [eg]),
                eS = (0, n.useCallback)(function() {
                    null != em.current && (cancelAnimationFrame(em.current), em.current = null)
                }, []);
            (0, n.useEffect)(function() {
                return z ? ey() : eS(), eS
            }, [z, ey, eS]);
            var ek = (0, n.useCallback)(function() {
                    var e = p.current;
                    e && (z ? e.pause() : e.play())
                }, [z, p]),
                ex = (0, n.useCallback)(function() {
                    var e, t;
                    if (p.current) return (null == h ? void 0 : h.videoClickAction) ? (e = h.videoClickAction, t = ({
                        fullScreenEnabled: g,
                        onFullscreen: eb.onFullscreen,
                        onExitFullscreen: eb.onExitFullscreen,
                        onNavigate: eb.onNavigate
                    }).onNavigate, void("NAVIGATE" === e && t())) : void ek()
                }, [p, h, g, eb, ek]),
                ew = (0, n.useCallback)(function() {
                    var e = p.current;
                    e && eb.onTimeUpdate(e.currentTime, e.duration)
                }, [p, eb]),
                eE = (0, n.useCallback)(function() {
                    eb.onLoadStart()
                }, [eb]),
                eC = (0, n.useCallback)(function() {
                    eb.onLoadEnd()
                }, [eb]),
                eT = (0, n.useCallback)(function() {
                    var e = p.current;
                    e && (W(e.duration), eo(e.currentTime)), eC()
                }, [p, eC]),
                eL = (0, n.useCallback)(function() {
                    z || eb.onPlay(), _(!0)
                }, [eb, z]),
                eA = (0, n.useCallback)(function() {
                    var e = p.current,
                        t = e && e.duration > 0 && e.duration - e.currentTime <= .1,
                        n = e && e.duration > 0 && e.currentTime / e.duration * 100 >= 100 && !0 === T;
                    t && !n ? (es(!0), _(!1), e.currentTime = 0, eo(0), setTimeout(function() {
                        return es(!1)
                    }, 50), eb.onPause()) : n ? (eb.onLoop(), e.currentTime = 0, eo(0), e.play().catch(function(e) {
                        ev.warn("[VideoControlsOverlay] Loop play failed:", e)
                    })) : (_(!1), eb.onPause())
                }, [p, eb, T, ev]),
                eR = (0, n.useCallback)(function() {
                    eb.onEnd()
                }, [eb]),
                eP = (0, n.useCallback)(function() {
                    var e = p.current;
                    if (e) {
                        var t = e.volume,
                            n = e.muted;
                        Y(t), G(n), ef.current || ep.current || eb.onVolumeChange(t, n), ep.current && (ep.current = !1)
                    }
                }, [eb, p]);
            (0, n.useEffect)(function() {
                var e = p.current;
                if (e) return e.addEventListener("volumechange", eP), e.addEventListener("beforeunload", eR), e.addEventListener("timeupdate", ew), e.addEventListener("loadedmetadata", eT), e.addEventListener("play", eL), e.addEventListener("pause", eA), e.addEventListener("loadstart", eE),
                    function() {
                        e.removeEventListener("timeupdate", ew), e.removeEventListener("loadedmetadata", eT), e.removeEventListener("play", eL), e.removeEventListener("pause", eA), e.removeEventListener("loadstart", eE), e.removeEventListener("beforeunload", eR), e.removeEventListener("volumechange", eP)
                    }
            }, [p, eb, ew, eT, eL, eA, eE, eC, eR, eP]);
            var eI = (0, n.useCallback)(function() {
                    var e = p.current;
                    e && (eu.current = !0, ec.current = z, z && e.pause(), eb.onSeekStart(e.currentTime))
                }, [p, eb, z]),
                eM = (0, n.useCallback)(function() {
                    var e = p.current;
                    e && eu.current && (eu.current = !1, eb.onSeekEnd(e.currentTime), ec.current && e.play())
                }, [p, eb]),
                eO = (0, n.useCallback)(function(e, t) {
                    var n = p.current;
                    if (n) {
                        var r = Array.isArray(t) ? t[0] : t;
                        n.currentTime = r, eo(r)
                    }
                }, [p]),
                eV = (0, n.useCallback)(function(e, t) {
                    if (p.current) {
                        var n = p.current,
                            r = Array.isArray(t) ? t[0] : t;
                        n.muted = 0 === r, n.volume = r
                    }
                }, [p]),
                eN = (0, n.useCallback)(function(e) {
                    e.stopPropagation(), ef.current = !0
                }, []),
                eD = (0, n.useCallback)(function() {
                    ef.current && (ef.current = !1, eb.onVolumeChange(K, $))
                }, [eb, K, $]);
            (0, n.useEffect)(function() {
                var e = function() {
                    eu.current && eM(), ef.current && eD()
                };
                return document.addEventListener("mouseup", e), document.addEventListener("touchend", e),
                    function() {
                        document.removeEventListener("mouseup", e), document.removeEventListener("touchend", e)
                    }
            }, [eM, eD]);
            var eF = (0, n.useCallback)(function() {
                    var e = p.current;
                    e && (e.muted = !e.muted)
                }, [p]),
                ej = (0, n.useCallback)(function() {
                    return w(void 0, void 0, void 0, function() {
                        var e, t;
                        return E(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    if (!(e = p.current)) return [2];
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
                }, [p, ev]),
                eU = (0, n.useCallback)(function() {
                    return w(void 0, void 0, void 0, function() {
                        var e, t, n;
                        return E(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    e = document, t = p.current, r.label = 1;
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
                }, [p, ev]),
                ez = (0, n.useCallback)(function(e) {
                    null == e || e.stopPropagation(), g && (et ? eU() : ej())
                }, [g, et, ej, eU]);
            (0, n.useEffect)(function() {
                var e = document,
                    t = p.current,
                    n = function() {
                        en(!!(document.fullscreenElement || e.webkitFullscreenElement || t && (t.webkitDisplayingFullscreen || "fullscreen" === t.webkitPresentationMode)))
                    };
                return document.addEventListener("fullscreenchange", n), document.addEventListener("webkitfullscreenchange", n), t && (t.addEventListener("webkitbeginfullscreen", n), t.addEventListener("webkitendfullscreen", n)),
                    function() {
                        document.removeEventListener("fullscreenchange", n), document.removeEventListener("webkitfullscreenchange", n), t && (t.removeEventListener("webkitbeginfullscreen", n), t.removeEventListener("webkitendfullscreen", n))
                    }
            }, [p]);
            var e_ = (0, n.useCallback)(function(e) {
                    " " === e.key && (e.stopPropagation(), e.preventDefault(), ek())
                }, [ek]),
                eB = (0, n.useCallback)(function() {
                    return Z(!0)
                }, []),
                eH = (0, n.useCallback)(function() {
                    ef.current || Z(!1)
                }, []);
            return n.default.createElement("div", {
                className: F(void 0 !== P && P && g ? D.mobileControls : D.controls, ((r = {})[D.noTransitions] = z || el, r)),
                style: {
                    display: void 0 !== L && L ? "none" : void 0
                }
            }, n.default.createElement("div", {
                className: D.controlsWrapper
            }, n.default.createElement("div", {
                className: D.overlayButton,
                onClick: ex,
                onKeyDown: e_,
                tabIndex: -1,
                role: "button",
                "aria-label": z ? "Pause video" : "Play video"
            }), n.default.createElement("div", {
                className: D.controlsFooter
            }, n.default.createElement(a.Slider, {
                value: ea,
                max: H || 100,
                onChange: eO,
                onMouseDown: eI,
                onTouchStart: eI,
                onClick: (0, n.useCallback)(function(e) {
                    return e.stopPropagation()
                }, []),
                color: "secondary",
                size: "small",
                step: 1e-6,
                "aria-label": "Video progress"
            }), n.default.createElement("div", {
                className: D.controlsRow
            }, n.default.createElement(o.IconButton, {
                ref: j,
                onClick: function(e) {
                    e.stopPropagation(), ek()
                },
                color: "onMediaLight",
                size: "small",
                "aria-label": z ? "Pause" : "Play"
            }, z ? n.default.createElement(i.Pause, null) : n.default.createElement(l.PlayArrowIcon, null)), n.default.createElement("div", {
                className: D.rightControls
            }, n.default.createElement("div", {
                className: D.volumeControl,
                onMouseEnter: eB,
                onMouseLeave: eH,
                onClick: (0, n.useCallback)(function(e) {
                    return e.stopPropagation()
                }, [])
            }, !v && n.default.createElement(a.Slider, {
                className: F(((f = {})[D.volumeSlider] = !0, f.expanded = Q, f)),
                value: $ ? 0 : K,
                max: 1,
                step: 1e-6,
                onChange: eV,
                onMouseDown: eN,
                onTouchStart: eN,
                color: "secondary",
                size: "small",
                "aria-label": "Volume"
            }), n.default.createElement(o.IconButton, {
                onClick: eF,
                color: "onMediaLight",
                size: "small",
                "aria-label": $ ? "Unmute" : "Mute"
            }, $ ? n.default.createElement(s.VolumeOffRounded, null) : n.default.createElement(u.VolumeUpRounded, null))), g && n.default.createElement(o.IconButton, {
                onClick: ez,
                color: "onMediaLight",
                size: "small",
                "aria-label": et ? "Exit fullscreen" : "Enter fullscreen"
            }, et ? n.default.createElement(c.FullscreenExit, null) : n.default.createElement(d.Fullscreen, null)))))))
        });
    D.displayName = "VideoControlsOverlay";
    var F = function(e) {
            var t = (0, n.useRef)(null);
            return (0, n.useEffect)(function() {
                e && ("function" == typeof e ? e(t.current) : e.current = t.current)
            }), t
        },
        j = function(e, t) {
            var r = e.enableAnalytics,
                a = e.analyticsConfig,
                o = e.headerContent,
                i = e.disableControls,
                l = e.controlsConfig,
                s = e.debug,
                u = e.fullscreenActive,
                c = e.onHoverActive,
                d = e.ctaObject,
                f = e.loop,
                p = x(e, ["enableAnalytics", "analyticsConfig", "headerContent", "disableControls", "controlsConfig", "debug", "fullscreenActive", "onHoverActive", "ctaObject", "loop"]),
                v = F(t),
                m = P().classes;
            return n.default.createElement("div", {
                className: m.container
            }, n.default.createElement(b, k({
                ref: v
            }, p, {
                controls: !1,
                headerContent: o
            })), n.default.createElement(D, k({
                ref: t,
                videoElementRef: v,
                ctaObject: d,
                enableAnalytics: r,
                analyticsConfig: a,
                debug: void 0 !== s && s,
                fullScreenEnabled: void 0 !== u && u,
                onHoverActive: void 0 !== c && c,
                loop: void 0 !== f && f,
                hidden: i
            }, l)))
        };
    j.displayName = "VideoPlayer";
    var U, z, _, B, H = n.default.forwardRef(j);

    function W(e) {
        return Object.entries(e).filter(function(e) {
            return null != e[1]
        }).map(function(e) {
            var t = e[0],
                n = e[1];
            return "".concat(t, '="').concat(String(n), '"')
        }).join(",")
    }(t = B || (B = {})).Home = "Home", t.ExperiencePage = "ExperiencePage", t.CreatorStore = "CreatorStore", t.AdsManager = "AdsManager", t.ProfilePage = "ProfilePage", t.PreAuthLanding = "PreAuthLanding", t.Spotlight = "Spotlight", t.CreatorDashboard = "CreatorDashboard";
    var X = "RESOLUTION",
        K = "FRAME-RATE",
        Y = "NAME",
        q = "QUERYPARAM",
        $ = "VALUE",
        G = function(e, t) {
            this.width = e, this.height = t
        },
        J = function(e) {
            var t = e.get(X);
            return t instanceof G ? t : void 0
        },
        Q = function(e) {
            var t = (e.get("CODECS") || "").replace(/^"|"$/g, "");
            return "" === t ? "vp9,opus" : t
        },
        Z = function(e) {
            for (var t = e[0], n = -1, r = 0; r < e.length; r += 1) {
                var a = J(e[r]),
                    o = a ? a.width * a.height : -1;
                o > n && (t = e[r], n = o)
            }
            return t
        },
        ee = function(e) {
            return e.width * e.height
        },
        et = {
            standard: ["main"],
            fhd: ["fhd", "fhd_beta", "main"]
        },
        en = function(e, t) {
            if (!e) return t;
            try {
                return JSON.parse(e)
            } catch (e) {
                return t
            }
        },
        er = function(e) {
            return null != e && "" !== e
        };

    function ea(e, t) {
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
    var eo = function(e, t) {
            this.name = e, this.value = t
        },
        ei = function() {
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
                    if (t.has(q)) {
                        var a = t.get(q) || "",
                            o = String(en(a, a.replace(/^"|"$/g, ""))),
                            i = r.get(o) || "";
                        return new eo(o, i)
                    }
                    if (t.has(Y) && t.has($)) {
                        var l = t.get(Y) || "",
                            s = String(en(l, l.replace(/^"|"$/g, ""))),
                            u = t.get($) || "";
                        return new eo(s, String(en(u, u.replace(/^"|"$/g, ""))))
                    }
                    return new eo("", "")
                }).filter(function(e) {
                    return null != e && er(e.name)
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
                    return er(e)
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
                            else if (l === X) {
                                var d = s.split("x", 2).map(function(e) {
                                    return parseInt(e, 10)
                                });
                                c = new G(d[0], d[1])
                            } else c = l === K ? parseFloat(s) : s;
                            r.set(l, c)
                        }
                        return r
                    }),
                    rbxDurationSeconds: n,
                    metadata: o
                }
            }, e
        }();

    function el(e) {
        return "number" == typeof e.status && (e.status < 200 || e.status >= 300)
    }
    var es = function() {
            function e(e, t) {
                this.chunkState = new Map, this.videoElement = e, this.sessionId = t.sessionId, this.cmcdInstanceType = t.instanceType, this.cmcdUserKey = t.userKey, this.assetId = t.assetId, this.isReady = !1, this.selectedVariantHeight = 0
            }
            return e.prototype.isPlaying = function() {
                var e = this.videoElement;
                return !!e && !e.paused && !e.ended
            }, e.prototype.buildCmcdSessionHeader = function() {
                var e;
                return W({
                    sid: this.sessionId,
                    cid: this.assetId,
                    "r-videoType": this.videoType || (null == (e = this.manifestMetadata) ? void 0 : e.get("RBX-VIDEOTYPE")) || "Unknown",
                    "r-app": "WWW",
                    "r-instanceType": this.cmcdInstanceType,
                    "r-formatName": "hls",
                    "r-userIdHash": this.cmcdUserKey,
                    "r-ready": this.isReady,
                    "r-playing": this.isPlaying(),
                    "r-hlsVar": this.selectedVariantHeight
                })
            }, e.prototype.downloadBuf = function(e) {
                return w(this, void 0, void 0, function() {
                    var t;
                    return E(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return this.chunkState.set(e, "loading"), [4, fetch(e, {
                                    headers: {
                                        "CMCD-Session": this.buildCmcdSessionHeader()
                                    }
                                })];
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
                return w(this, void 0, void 0, function() {
                    var t, n, r, a, o, i, l = this;
                    return E(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return null == (t = this.playlist) ? [2] : t.segments[e] ? (n = t.segmentUrl(e), this.chunkState.has(n) ? [3, 2] : [4, this.downloadBuf(n)]) : [2];
                            case 1:
                                r = s.sent(), null == (o = this.sourceBuffer) || o.appendBuffer(r), this.isReady = !0, e === (t.segments.length || 0) - 1 && (a = function() {
                                    var e, t;
                                    null == (e = l.sourceBuffer) || e.removeEventListener("updateend", a), null == (t = l.mediaSource) || t.endOfStream()
                                }, null == (i = this.sourceBuffer) || i.addEventListener("updateend", a)), s.label = 2;
                            case 2:
                                return [2]
                        }
                    })
                })
            }, e.prototype.open = function(e, t, n) {
                return w(this, void 0, void 0, function() {
                    var r, a, o, i, l = this;
                    return E(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return r = new MediaSource, this.mediaSource = r, this.objectUrl = URL.createObjectURL(r), this.videoElement.src = this.objectUrl, [4, fetch(e.toString(), {
                                    headers: {
                                        "CMCD-Session": this.buildCmcdSessionHeader()
                                    }
                                })];
                            case 1:
                                return [4, s.sent().text()];
                            case 2:
                                return a = s.sent(), o = ei.parse(e, a), this.playlist = o, this.frameRate = n, [4, new Promise(function(e, n) {
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
                                    return w(l, void 0, void 0, function() {
                                        var e, t, n;
                                        return E(this, function(a) {
                                            switch (a.label) {
                                                case 0:
                                                    return 0 === r.sourceBuffers.length ? [2] : (e = this.videoElement.currentTime, (t = ea(i.buffered, e)) && 3 > Math.abs(t.end - e) ? (n = o.nextSegmentIdx(e), [4, this.appendSegmentByIdx(n)]) : [3, 2]);
                                                case 1:
                                                    a.sent(), a.label = 2;
                                                case 2:
                                                    return [2]
                                            }
                                        })
                                    })
                                }, this.videoElement.onseeking = function() {
                                    return w(l, void 0, void 0, function() {
                                        var e, t;
                                        return E(this, function(n) {
                                            switch (n.label) {
                                                case 0:
                                                    return 0 === r.sourceBuffers.length ? [2] : (e = this.videoElement.currentTime, null != ea(i.buffered, e) ? [3, 2] : (t = o.segmentIdxByTime(e), [4, this.appendSegmentByIdx(t)]));
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
            }, e.fetchManifestFromUrl = function(e, t) {
                return w(this, void 0, void 0, function() {
                    var n, r, a, o;
                    return E(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, fetch(e.toString(), {
                                    headers: {
                                        "CMCD-Session": W({
                                            sid: t.sessionId,
                                            cid: t.assetId,
                                            "r-app": "WWW",
                                            "r-instanceType": t.instanceType,
                                            "r-formatName": "hls",
                                            "r-userIdHash": t.userKey,
                                            "r-ready": !1
                                        })
                                    }
                                })];
                            case 1:
                                return [4, (n = i.sent()).text()];
                            case 2:
                                if (r = i.sent(), n.status < 200 || n.status >= 400) throw Error("ERROR: ".concat(n.status, " ").concat(n.statusText, "\n").concat(r));
                                if (!r.startsWith("#EXTM3U")) throw Error("not an HLS manifest");
                                return o = Z((a = ei.parseMasterManifest(r, e)).streams), [2, {
                                    playlistUrl: e,
                                    manifestText: r,
                                    streams: a.streams,
                                    rbxDurationSeconds: a.rbxDurationSeconds,
                                    metadata: a.metadata,
                                    bestStream: o
                                }]
                        }
                    })
                })
            }, e.fetchManifestData = function(e, t) {
                return w(this, void 0, void 0, function() {
                    var n, r, a, o;
                    return E(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, fetch(e, {
                                    method: "GET",
                                    credentials: "include"
                                })];
                            case 1:
                                return [4, (n = i.sent()).text()];
                            case 2:
                                r = i.sent();
                                try {
                                    a = JSON.parse(r)
                                } catch (e) {
                                    if (el(n)) throw Error("Asset delivery request failed: HTTP ".concat(n.status, " ").concat(n.statusText, ": invalid JSON"));
                                    throw Error("Asset delivery returned invalid JSON")
                                }
                                return o = function(e, t) {
                                    var n, r = "object" == typeof e && null !== e ? e : {},
                                        a = Array.isArray(r.errors) ? r.errors.map(function(e) {
                                            return null == e ? void 0 : e.message
                                        }).filter(function(e) {
                                            return "string" == typeof e && e.length > 0
                                        }) : [];
                                    if (el(t)) {
                                        var o = a.length > 0 ? ": ".concat(a.join("; ")) : "";
                                        throw Error("Asset delivery request failed: HTTP ".concat(t.status, " ").concat(t.statusText).concat(o))
                                    }
                                    var i = Array.isArray(r.locations) ? null == (n = r.locations[0]) ? void 0 : n.location : void 0;
                                    if ("string" == typeof i && i.length > 0) return new URL(i);
                                    if (a.length > 0) throw Error("Asset delivery request failed: ".concat(a.join("; ")));
                                    throw Error("Asset delivery response missing playlist location")
                                }(a, n), [2, this.fetchManifestFromUrl(o, t)]
                        }
                    })
                })
            }, e.prototype.openFromManifestData = function(e, t, n) {
                return w(this, void 0, void 0, function() {
                    var r, a, o, i;
                    return E(this, function(l) {
                        switch (l.label) {
                            case 0:
                                return r = null != n ? n : e.bestStream, this.manifestMetadata = e.metadata, this.rbxDurationSeconds = e.rbxDurationSeconds, a = J(r), this.selectedVariantHeight = null != (o = null == a ? void 0 : a.height) ? o : 0, this.videoType = (null == (i = this.manifestMetadata) ? void 0 : i.get("RBX-VIDEOTYPE")) || "Unknown", [4, this.open(new URL(r.get("URL") || "", e.playlistUrl), Q(r), r.get(K) || 60)];
                            case 1:
                                return l.sent(), t && t(this), [2]
                        }
                    })
                })
            }, e.prototype.frameVisitOffset = function() {
                return .5 / (this.frameRate || .001)
            }, e.prototype.cleanup = function() {
                try {
                    this.mediaSource && "open" === this.mediaSource.readyState && this.mediaSource.endOfStream()
                } catch (e) {}
                this.sourceBuffer = void 0, this.mediaSource = void 0, this.playlist = void 0, this.chunkState.clear(), this.objectUrl && (URL.revokeObjectURL(this.objectUrl), this.objectUrl = void 0), this.videoElement && (this.videoElement.ontimeupdate = null, this.videoElement.onseeking = null)
            }, e.getRbxDurationFromManifestData = function(e) {
                return e.rbxDurationSeconds
            }, e.prototype.getRbxDuration = function() {
                return this.rbxDurationSeconds
            }, e.prototype.getManifestMetadata = function() {
                return this.manifestMetadata
            }, e.fetchManifestDataFromAssetId = function(t, n, r) {
                return w(this, arguments, void 0, function(t, n, r, a) {
                    var o, i;
                    return void 0 === a && (a = ["main"]), E(this, function(l) {
                        return o = encodeURIComponent(btoa(JSON.stringify(a.map(function(e) {
                            return {
                                format: "hls",
                                majorVersion: "1",
                                fidelity: e
                            }
                        })))), i = "production" === n ? "https://assetdelivery.roblox.com/v2/asset?Id=".concat(t, "&&ContentRepresentationPriorityList=").concat(o) : "https://assetdelivery.".concat(n, ".robloxlabs.com/v2/asset?Id=").concat(t, "&&ContentRepresentationPriorityList=").concat(o), [2, e.fetchManifestData(i, r)]
                    })
                })
            }, e
        }(),
        eu = (0, r.makeStyles)()(function(e) {
            return {
                errorContainer: {
                    position: "relative",
                    backgroundColor: e.palette.content.static.dark,
                    width: "100%",
                    height: "100%"
                }
            }
        }),
        ec = function(e, t) {
            var r = e.manifest,
                a = e.manifestUrl,
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
                h = e.cmcdInstanceType,
                b = e.cmcdUserKey,
                g = e.cmcdUserId,
                C = e.maxQuality,
                T = e.adaptiveResolution,
                L = void 0 !== T && T,
                A = x(e, ["manifest", "manifestUrl", "videoAssetId", "environment", "debug", "analyticsConfig", "enableAnalytics", "onHoverActive", "loop", "fullscreenActive", "onLoadVideoStart", "onLoadVideoEnd", "onLoadError", "cmcdInstanceType", "cmcdUserKey", "cmcdUserId", "maxQuality", "adaptiveResolution"]),
                R = F(t),
                P = eu(),
                I = P.classes,
                M = P.cx,
                O = (0, n.useRef)(void 0),
                V = (0, n.useMemo)(function() {
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
                N = (0, n.useMemo)(function() {
                    return y.uuidService.generateRandomUuid()
                }, []),
                D = (0, n.useMemo)(function() {
                    return b || (null != g && "" !== g ? (0, S.md5)(g.toString()) : void 0)
                }, [b, g]),
                j = (0, n.useMemo)(function() {
                    return {
                        instanceType: h,
                        userKey: D,
                        assetId: o,
                        sessionId: N
                    }
                }, [h, D, o, N]),
                U = function(e) {
                    var t = this,
                        r = e.videoAssetId,
                        a = e.environment,
                        o = e.manifestUrl,
                        i = e.cmcdOptions,
                        l = e.enabled,
                        s = void 0 === l || l,
                        u = e.maxQuality,
                        c = void 0 === u ? "standard" : u,
                        d = (0, n.useState)(void 0),
                        f = d[0],
                        p = d[1],
                        v = (0, n.useState)(!1),
                        m = v[0],
                        h = v[1],
                        b = (0, n.useState)(null),
                        g = b[0],
                        y = b[1],
                        S = (0, n.useCallback)(function() {
                            return w(t, void 0, void 0, function() {
                                var e, t, n;
                                return E(this, function(l) {
                                    switch (l.label) {
                                        case 0:
                                            if (!s || !(o || r && a)) return [2];
                                            l.label = 1;
                                        case 1:
                                            return l.trys.push([1, 6, 7, 8]), h(!0), y(null), o ? (e = new URL(o), t = p, [4, es.fetchManifestFromUrl(e, i)]) : [3, 3];
                                        case 2:
                                            return t.apply(void 0, [l.sent()]), [3, 5];
                                        case 3:
                                            return n = p, [4, es.fetchManifestDataFromAssetId(r, a, i, et[c])];
                                        case 4:
                                            n.apply(void 0, [l.sent()]), l.label = 5;
                                        case 5:
                                            return [3, 8];
                                        case 6:
                                            return y(l.sent()), p(void 0), [3, 8];
                                        case 7:
                                            return h(!1), [7];
                                        case 8:
                                            return [2]
                                    }
                                })
                            })
                        }, [r, a, o, s, i, c]),
                        k = null == f ? void 0 : f.rbxDurationSeconds;
                    return (0, n.useEffect)(function() {
                        S()
                    }, [S]), {
                        manifest: f,
                        durationInSeconds: k,
                        loading: m,
                        error: g,
                        refetch: (0, n.useCallback)(function() {
                            S()
                        }, [S])
                    }
                }({
                    videoAssetId: o,
                    environment: i,
                    manifestUrl: a,
                    enabled: !r && V.isSupported,
                    cmcdOptions: j,
                    maxQuality: void 0 === C ? "standard" : C
                }),
                z = r || U.manifest,
                _ = void 0 !== z && V.isSupported && !U.error;
            return (0, n.useEffect)(function() {
                U.error && m && m(U.error)
            }, [U.error, m]), (0, n.useEffect)(function() {
                !V.isSupported && m && m(Error("Browser not supported: ".concat(V.errors.join(", "))))
            }, [m, V.isSupported, V.errors]), (0, n.useEffect)(function() {
                var e = R.current;
                if (null != e && void 0 !== z && V.isSupported && !U.error) {
                    var t, n, r = L ? function(e, t) {
                        if (e.length <= 1) return e[0];
                        var n = t.width,
                            r = t.height,
                            a = t.devicePixelRatio;
                        if (n <= 0 || r <= 0) return Z(e);
                        var o = a > 0 ? a : 1,
                            i = n * o,
                            l = r * o,
                            s = e.map(function(e) {
                                return {
                                    stream: e,
                                    res: J(e)
                                }
                            }).filter(function(e) {
                                return null != e.res && e.res.width > 0 && e.res.height > 0
                            });
                        if (0 === s.length) return Z(e);
                        var u = s.filter(function(e) {
                            var t = e.res;
                            return t.width >= i && t.height >= l
                        });
                        return u.length > 0 ? u.reduce(function(e, t) {
                            return ee(t.res) < ee(e.res) ? t : e
                        }).stream : s.reduce(function(e, t) {
                            return ee(t.res) > ee(e.res) ? t : e
                        }).stream
                    }(z.streams, (t = "function" == typeof e.getBoundingClientRect ? e.getBoundingClientRect() : {
                        width: 0,
                        height: 0
                    }, n = "u" > typeof window && window.devicePixelRatio > 0 ? window.devicePixelRatio : 1, {
                        width: t.width,
                        height: t.height,
                        devicePixelRatio: n
                    })) : z.bestStream;
                    return w(void 0, void 0, void 0, function() {
                            var t, n;
                            return E(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return a.trys.push([0, 2, , 3]), null == p || p(), O.current = t = new es(e, j), [4, t.openFromManifestData(z, function() {
                                            null == v || v()
                                        }, r)];
                                    case 1:
                                        return a.sent(), [3, 3];
                                    case 2:
                                        return n = a.sent(), m && n instanceof Error && m(n), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        }),
                        function() {
                            O.current && (O.current.cleanup(), O.current = void 0)
                        }
                }
            }, [L, z, R, p, v, m, U.error, V.isSupported, j]), _ ? n.default.createElement(H, k({
                ref: R,
                debug: void 0 !== l && l,
                analyticsConfig: s,
                enableAnalytics: u,
                onHoverActive: void 0 !== c && c,
                loop: void 0 !== d && d,
                fullscreenActive: void 0 !== f && f
            }, A)) : n.default.createElement("div", {
                className: M(A.className, I.errorContainer)
            })
        };
    ec.displayName = "RobloxVideoPlayer";
    var ed = n.default.forwardRef(ec);
    e.s(["CmcdInstanceType", 0, B, "RobloxVideoPlayer", 0, ed], 186930)
}]);

//# debugId=480ac161-039a-6295-cc11-31b96d656425
//# sourceMappingURL=41lyuczvvty9c.js.map
;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "aaccd568-0198-25e9-fe4c-66ce27677456")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 425353, 199512, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(19655),
        n = e.i(78892),
        o = e.i(608652),
        i = e.i(40266),
        a = e.i(428156),
        s = e.i(598943),
        l = e.i(44265),
        d = e.i(763960),
        c = e.i(226972),
        u = e.i(594278),
        p = e.i(793808),
        f = e.i(813593),
        m = e.i(3300),
        h = e.i(699704),
        g = e.i(221628),
        v = "Dialog",
        [x, b] = (0, o.createContextScope)(v),
        [y, w] = x(v),
        R = e => {
            let {
                __scopeDialog: r,
                children: n,
                open: o,
                defaultOpen: s,
                onOpenChange: l,
                modal: d = !0
            } = e, c = t.useRef(null), u = t.useRef(null), [p = !1, f] = (0, a.useControllableState)({
                prop: o,
                defaultProp: s,
                onChange: l
            });
            return (0, g.jsx)(y, {
                scope: r,
                triggerRef: c,
                contentRef: u,
                contentId: (0, i.useId)(),
                titleId: (0, i.useId)(),
                descriptionId: (0, i.useId)(),
                open: p,
                onOpenChange: f,
                onOpenToggle: t.useCallback(() => f(e => !e), [f]),
                modal: d,
                children: n
            })
        };
    R.displayName = v;
    var E = "DialogTrigger",
        C = t.forwardRef((e, t) => {
            let {
                __scopeDialog: o,
                ...i
            } = e, a = w(E, o), s = (0, n.useComposedRefs)(t, a.triggerRef);
            return (0, g.jsx)(u.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": a.open,
                "aria-controls": a.contentId,
                "data-state": V(a.open),
                ...i,
                ref: s,
                onClick: (0, r.composeEventHandlers)(e.onClick, a.onOpenToggle)
            })
        });
    C.displayName = E;
    var _ = "DialogPortal",
        [S, D] = x(_, {
            forceMount: void 0
        }),
        A = e => {
            let {
                __scopeDialog: r,
                forceMount: n,
                children: o,
                container: i
            } = e, a = w(_, r);
            return (0, g.jsx)(S, {
                scope: r,
                forceMount: n,
                children: t.Children.map(o, e => (0, g.jsx)(c.Presence, {
                    present: n || a.open,
                    children: (0, g.jsx)(d.Portal, {
                        asChild: !0,
                        container: i,
                        children: e
                    })
                }))
            })
        };
    A.displayName = _;
    var N = "DialogOverlay",
        k = t.forwardRef((e, t) => {
            let r = D(N, e.__scopeDialog),
                {
                    forceMount: n = r.forceMount,
                    ...o
                } = e,
                i = w(N, e.__scopeDialog);
            return i.modal ? (0, g.jsx)(c.Presence, {
                present: n || i.open,
                children: (0, g.jsx)(j, {
                    ...o,
                    ref: t
                })
            }) : null
        });
    k.displayName = N;
    var P = (0, h.createSlot)("DialogOverlay.RemoveScroll"),
        j = t.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...n
            } = e, o = w(N, r);
            return (0, g.jsx)(f.RemoveScroll, {
                as: P,
                allowPinchZoom: !0,
                shards: [o.contentRef],
                children: (0, g.jsx)(u.Primitive.div, {
                    "data-state": V(o.open),
                    ...n,
                    ref: t,
                    style: {
                        pointerEvents: "auto",
                        ...n.style
                    }
                })
            })
        }),
        I = "DialogContent",
        M = t.forwardRef((e, t) => {
            let r = D(I, e.__scopeDialog),
                {
                    forceMount: n = r.forceMount,
                    ...o
                } = e,
                i = w(I, e.__scopeDialog);
            return (0, g.jsx)(c.Presence, {
                present: n || i.open,
                children: i.modal ? (0, g.jsx)(T, {
                    ...o,
                    ref: t
                }) : (0, g.jsx)(O, {
                    ...o,
                    ref: t
                })
            })
        });
    M.displayName = I;
    var T = t.forwardRef((e, o) => {
            let i = w(I, e.__scopeDialog),
                a = t.useRef(null),
                s = (0, n.useComposedRefs)(o, i.contentRef, a);
            return t.useEffect(() => {
                let e = a.current;
                if (e) return (0, m.hideOthers)(e)
            }, []), (0, g.jsx)(B, {
                ...e,
                ref: s,
                trapFocus: i.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: (0, r.composeEventHandlers)(e.onCloseAutoFocus, e => {
                    var t;
                    e.preventDefault(), null == (t = i.triggerRef.current) || t.focus()
                }),
                onPointerDownOutside: (0, r.composeEventHandlers)(e.onPointerDownOutside, e => {
                    let t = e.detail.originalEvent,
                        r = 0 === t.button && !0 === t.ctrlKey;
                    (2 === t.button || r) && e.preventDefault()
                }),
                onFocusOutside: (0, r.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault())
            })
        }),
        O = t.forwardRef((e, r) => {
            let n = w(I, e.__scopeDialog),
                o = t.useRef(!1),
                i = t.useRef(!1);
            return (0, g.jsx)(B, {
                ...e,
                ref: r,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var r, a;
                    null == (r = e.onCloseAutoFocus) || r.call(e, t), t.defaultPrevented || (o.current || null == (a = n.triggerRef.current) || a.focus(), t.preventDefault()), o.current = !1, i.current = !1
                },
                onInteractOutside: t => {
                    var r, a;
                    null == (r = e.onInteractOutside) || r.call(e, t), t.defaultPrevented || (o.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                    let s = t.target;
                    (null == (a = n.triggerRef.current) ? void 0 : a.contains(s)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                }
            })
        }),
        B = t.forwardRef((e, r) => {
            let {
                __scopeDialog: o,
                trapFocus: i,
                onOpenAutoFocus: a,
                onCloseAutoFocus: d,
                ...c
            } = e, u = w(I, o), f = t.useRef(null), m = (0, n.useComposedRefs)(r, f);
            return (0, p.useFocusGuards)(), (0, g.jsxs)(g.Fragment, {
                children: [(0, g.jsx)(l.FocusScope, {
                    asChild: !0,
                    loop: !0,
                    trapped: i,
                    onMountAutoFocus: a,
                    onUnmountAutoFocus: d,
                    children: (0, g.jsx)(s.DismissableLayer, {
                        role: "dialog",
                        id: u.contentId,
                        "aria-describedby": u.descriptionId,
                        "aria-labelledby": u.titleId,
                        "data-state": V(u.open),
                        ...c,
                        ref: m,
                        onDismiss: () => u.onOpenChange(!1)
                    })
                }), (0, g.jsxs)(g.Fragment, {
                    children: [(0, g.jsx)(X, {
                        titleId: u.titleId
                    }), (0, g.jsx)(K, {
                        contentRef: f,
                        descriptionId: u.descriptionId
                    })]
                })]
            })
        }),
        z = "DialogTitle",
        F = t.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...n
            } = e, o = w(z, r);
            return (0, g.jsx)(u.Primitive.h2, {
                id: o.titleId,
                ...n,
                ref: t
            })
        });
    F.displayName = z;
    var L = "DialogDescription",
        G = t.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...n
            } = e, o = w(L, r);
            return (0, g.jsx)(u.Primitive.p, {
                id: o.descriptionId,
                ...n,
                ref: t
            })
        });
    G.displayName = L;
    var H = "DialogClose",
        W = t.forwardRef((e, t) => {
            let {
                __scopeDialog: n,
                ...o
            } = e, i = w(H, n);
            return (0, g.jsx)(u.Primitive.button, {
                type: "button",
                ...o,
                ref: t,
                onClick: (0, r.composeEventHandlers)(e.onClick, () => i.onOpenChange(!1))
            })
        });

    function V(e) {
        return e ? "open" : "closed"
    }
    W.displayName = H;
    var U = "DialogTitleWarning",
        [q, Y] = (0, o.createContext)(U, {
            contentName: I,
            titleName: z,
            docsSlug: "dialog"
        }),
        X = e => {
            let {
                titleId: r
            } = e, n = Y(U), o = "`".concat(n.contentName, "` requires a `").concat(n.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(n.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(n.docsSlug);
            return t.useEffect(() => {
                r && (document.getElementById(r) || console.error(o))
            }, [o, r]), null
        },
        K = e => {
            let {
                contentRef: r,
                descriptionId: n
            } = e, o = Y("DialogDescriptionWarning"), i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(o.contentName, "}.");
            return t.useEffect(() => {
                var e;
                let t = null == (e = r.current) ? void 0 : e.getAttribute("aria-describedby");
                n && t && (document.getElementById(n) || console.warn(i))
            }, [i, r, n]), null
        };
    e.s(["Close", 0, W, "Content", 0, M, "Description", 0, G, "Overlay", 0, k, "Portal", 0, A, "Root", 0, R, "Title", 0, F, "Trigger", 0, C], 425353), e.i(149285);
    var Z = e.i(23342),
        $ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, r) => {
            let n = (0, Z.createSlot)("Primitive.".concat(r)),
                o = t.forwardRef((e, t) => {
                    let {
                        asChild: o,
                        ...i
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, g.jsx)(o ? n : r, {
                        ...i,
                        ref: t
                    })
                });
            return o.displayName = "Primitive.".concat(r), {
                ...e,
                [r]: o
            }
        }, {}),
        J = Object.freeze({
            position: "absolute",
            border: 0,
            width: 1,
            height: 1,
            padding: 0,
            margin: -1,
            overflow: "hidden",
            clip: "rect(0, 0, 0, 0)",
            whiteSpace: "nowrap",
            wordWrap: "normal"
        }),
        Q = t.forwardRef((e, t) => (0, g.jsx)($.span, {
            ...e,
            ref: t,
            style: {
                ...J,
                ...e.style
            }
        }));
    Q.displayName = "VisuallyHidden", e.s(["VisuallyHidden", 0, Q], 199512)
}, 145842, e => {
    "use strict";
    var t = e.i(194250),
        r = e.i(416340),
        n = e.i(863605),
        o = e.i(154502),
        i = e.i(945146),
        a = e.i(690569);
    e.i(535072);
    var s = e.i(251635),
        l = e.i(78292),
        d = e.i(836108),
        c = e.i(787802),
        u = e.i(221628),
        p = e.i(770593),
        f = e.i(121880),
        m = e.i(946029),
        h = e.i(838731);

    function g(e) {
        return (0, a.g)("MuiAccordion", e)
    }
    e.i(407110);
    var v = (0, c.g)("MuiAccordion", ["root", "rounded", "expanded", "disabled", "gutters", "region"]);
    let x = ["children", "className", "defaultExpanded", "disabled", "disableGutters", "expanded", "onChange", "square", "slots", "slotProps", "TransitionComponent", "TransitionProps"],
        b = (0, s.s)(p.M, {
            name: "MuiAccordion",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [{
                    ["& .".concat(v.region)]: t.region
                }, t.root, !r.square && t.rounded, !r.disableGutters && t.gutters]
            }
        })(e => {
            let {
                theme: t
            } = e, r = {
                duration: t.transitions.duration.shortest
            };
            return {
                position: "relative",
                transition: t.transitions.create(["margin"], r),
                overflowAnchor: "none",
                "&::before": {
                    position: "absolute",
                    left: 0,
                    top: -1,
                    right: 0,
                    height: 1,
                    content: '""',
                    opacity: 1,
                    backgroundColor: (t.vars || t).palette.divider,
                    transition: t.transitions.create(["opacity", "background-color"], r)
                },
                "&:first-of-type": {
                    "&::before": {
                        display: "none"
                    }
                },
                ["&.".concat(v.expanded)]: {
                    "&::before": {
                        opacity: 0
                    },
                    "&:first-of-type": {
                        marginTop: 0
                    },
                    "&:last-of-type": {
                        marginBottom: 0
                    },
                    "& + &": {
                        "&::before": {
                            display: "none"
                        }
                    }
                },
                ["&.".concat(v.disabled)]: {
                    backgroundColor: (t.vars || t).palette.action.disabledBackground
                }
            }
        }, e => {
            let {
                theme: t
            } = e;
            return {
                variants: [{
                    props: e => !e.square,
                    style: {
                        borderRadius: 0,
                        "&:first-of-type": {
                            borderTopLeftRadius: (t.vars || t).shape.borderRadius,
                            borderTopRightRadius: (t.vars || t).shape.borderRadius
                        },
                        "&:last-of-type": {
                            borderBottomLeftRadius: (t.vars || t).shape.borderRadius,
                            borderBottomRightRadius: (t.vars || t).shape.borderRadius,
                            "@supports (-ms-ime-align: auto)": {
                                borderBottomLeftRadius: 0,
                                borderBottomRightRadius: 0
                            }
                        }
                    }
                }, {
                    props: e => !e.disableGutters,
                    style: {
                        ["&.".concat(v.expanded)]: {
                            margin: "16px 0"
                        }
                    }
                }]
            }
        }),
        y = r.forwardRef(function(e, t) {
            let n = (0, f.u)({
                    props: e,
                    name: "MuiAccordion"
                }),
                {
                    children: o,
                    className: c,
                    defaultExpanded: p = !1,
                    disabled: v = !1,
                    disableGutters: y = !1,
                    expanded: w,
                    onChange: R,
                    square: E = !1,
                    slots: C = {},
                    slotProps: _ = {},
                    TransitionComponent: S,
                    TransitionProps: D
                } = n,
                A = (0, a._)(n, x),
                [N, k] = (0, m.u)({
                    controlled: w,
                    default: p,
                    name: "Accordion",
                    state: "expanded"
                }),
                P = r.useCallback(e => {
                    k(!N), R && R(e, !N)
                }, [N, R, k]),
                [j, ...I] = r.Children.toArray(o),
                M = r.useMemo(() => ({
                    expanded: N,
                    disabled: v,
                    disableGutters: y,
                    toggle: P
                }), [N, v, y, P]),
                T = (0, i._)({}, n, {
                    square: E,
                    disabled: v,
                    disableGutters: y,
                    expanded: N
                }),
                O = (e => {
                    let {
                        classes: t,
                        square: r,
                        expanded: n,
                        disabled: o,
                        disableGutters: i
                    } = e;
                    return (0, s.a)({
                        root: ["root", !r && "rounded", n && "expanded", o && "disabled", !i && "gutters"],
                        region: ["region"]
                    }, g, t)
                })(T),
                B = (0, i._)({
                    transition: S
                }, C),
                z = (0, i._)({
                    transition: D
                }, _),
                [F, L] = (0, d.u)("transition", {
                    elementType: h.C,
                    externalForwardedProps: {
                        slots: B,
                        slotProps: z
                    },
                    ownerState: T
                });
            return (0, u.jsxs)(b, (0, i._)({
                className: (0, s.c)(O.root, c),
                ref: t,
                ownerState: T,
                square: E
            }, A, {
                children: [(0, u.jsx)(l.A.Provider, {
                    value: M,
                    children: j
                }), (0, u.jsx)(F, (0, i._)({
                    in: N,
                    timeout: "auto"
                }, L, {
                    children: (0, u.jsx)("div", {
                        "aria-labelledby": j.props.id,
                        id: j.props["aria-controls"],
                        role: "region",
                        className: O.region,
                        children: I
                    })
                }))]
            }))
        });
    var w = (0, n.default)({
            name: "Accordion"
        })(function(e, r) {
            var n = r.variant,
                o = r.square,
                i = void 0 !== o && o ? (0, t._)({}, e.border.radius.none) : (0, t._)((0, t._)({}, e.border.radius.large), {
                    "&:first-of-type": (0, t._)((0, t._)({}, e.border.radius.topLeft.large), e.border.radius.topRight.large),
                    "&:last-of-type": (0, t._)((0, t._)({}, e.border.radius.bottomLeft.large), e.border.radius.bottomRight.large)
                });
            return {
                root: (0, t._)((0, t._)({}, i), {
                    boxShadow: "none",
                    backgroundColor: "outlined" === n ? "transparent" : e.palette.surface[300],
                    "&:before": {
                        backgroundColor: e.palette.components.divider
                    }
                })
            }
        }),
        R = (0, r.forwardRef)(function(e, n) {
            var i = e.children,
                a = e.variant,
                s = e.classes,
                l = e.className,
                d = (0, t.a)(e, ["children", "variant", "classes", "className"]),
                c = w((0, t._)((0, t._)({}, d), {
                    children: i,
                    variant: a
                }), {
                    props: {
                        classes: (0, o.default)(s, l)
                    }
                });
            return r.default.createElement(y, (0, t._)({}, d, {
                variant: "outlined" === a ? "outlined" : "elevation",
                classes: c.classes,
                ref: n
            }), i)
        });
    e.s(["Accordion", 0, R], 145842)
}, 78292, e => {
    "use strict";
    let t = e.i(416340).createContext({});
    e.s(["A", 0, t])
}, 40262, e => {
    "use strict";
    var t = e.i(194250),
        r = e.i(416340),
        n = e.i(863605),
        o = e.i(154502),
        i = e.i(945146),
        a = e.i(690569),
        s = e.i(251635),
        l = e.i(787802),
        d = e.i(221628),
        c = e.i(121880);

    function u(e) {
        return (0, a.g)("MuiAccordionDetails", e)
    }(0, l.g)("MuiAccordionDetails", ["root"]);
    let p = ["className"],
        f = (0, s.s)("div", {
            name: "MuiAccordionDetails",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })(e => {
            let {
                theme: t
            } = e;
            return {
                padding: t.spacing(1, 2, 2)
            }
        }),
        m = r.forwardRef(function(e, t) {
            let r = (0, c.u)({
                    props: e,
                    name: "MuiAccordionDetails"
                }),
                {
                    className: n
                } = r,
                o = (0, a._)(r, p),
                l = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, s.a)({
                        root: ["root"]
                    }, u, t)
                })(r);
            return (0, d.jsx)(f, (0, i._)({
                className: (0, s.c)(l.root, n),
                ref: t,
                ownerState: r
            }, o))
        });
    var h = (0, n.default)({
            name: "AccordionDetails"
        })(function(e) {
            return {
                root: (0, t._)({}, e.typography.body1)
            }
        }),
        g = (0, r.forwardRef)(function(e, n) {
            var i = e.children,
                a = e.classes,
                s = e.className,
                l = (0, t.a)(e, ["children", "classes", "className"]),
                d = h(void 0, {
                    props: {
                        classes: (0, o.default)(a, s)
                    }
                });
            return r.default.createElement(m, (0, t._)({}, l, {
                classes: d.classes,
                ref: n
            }), i)
        });
    e.s(["AccordionDetails", 0, g], 40262)
}, 275666, e => {
    "use strict";
    var t = e.i(194250),
        r = e.i(416340),
        n = e.i(863605),
        o = e.i(154502),
        i = e.i(787802),
        a = e.i(690569),
        s = e.i(945146),
        l = e.i(251635),
        d = e.i(78292),
        c = e.i(221628),
        u = e.i(690768),
        p = e.i(121880),
        f = e.i(763485);

    function m(e) {
        return (0, a.g)("MuiAccordionSummary", e)
    }
    var h = (0, i.g)("MuiAccordionSummary", ["root", "expanded", "focusVisible", "disabled", "gutters", "contentGutters", "content", "expandIconWrapper"]);
    let g = ["children", "className", "expandIcon", "focusVisibleClassName", "onClick"],
        v = (0, l.s)(u.B, {
            name: "MuiAccordionSummary",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })(e => {
            let {
                theme: t
            } = e, r = {
                duration: t.transitions.duration.shortest
            };
            return {
                display: "flex",
                minHeight: 48,
                padding: t.spacing(0, 2),
                transition: t.transitions.create(["min-height", "background-color"], r),
                ["&.".concat(h.focusVisible)]: {
                    backgroundColor: (t.vars || t).palette.action.focus
                },
                ["&.".concat(h.disabled)]: {
                    opacity: (t.vars || t).palette.action.disabledOpacity
                },
                ["&:hover:not(.".concat(h.disabled, ")")]: {
                    cursor: "pointer"
                },
                variants: [{
                    props: e => !e.disableGutters,
                    style: {
                        ["&.".concat(h.expanded)]: {
                            minHeight: 64
                        }
                    }
                }]
            }
        }),
        x = (0, l.s)("div", {
            name: "MuiAccordionSummary",
            slot: "Content",
            overridesResolver: (e, t) => t.content
        })(e => {
            let {
                theme: t
            } = e;
            return {
                display: "flex",
                flexGrow: 1,
                margin: "12px 0",
                variants: [{
                    props: e => !e.disableGutters,
                    style: {
                        transition: t.transitions.create(["margin"], {
                            duration: t.transitions.duration.shortest
                        }),
                        ["&.".concat(h.expanded)]: {
                            margin: "20px 0"
                        }
                    }
                }]
            }
        }),
        b = (0, l.s)("div", {
            name: "MuiAccordionSummary",
            slot: "ExpandIconWrapper",
            overridesResolver: (e, t) => t.expandIconWrapper
        })(e => {
            let {
                theme: t
            } = e;
            return {
                display: "flex",
                color: (t.vars || t).palette.action.active,
                transform: "rotate(0deg)",
                transition: t.transitions.create("transform", {
                    duration: t.transitions.duration.shortest
                }),
                ["&.".concat(h.expanded)]: {
                    transform: "rotate(180deg)"
                }
            }
        }),
        y = r.forwardRef(function(e, t) {
            let n = (0, p.u)({
                    props: e,
                    name: "MuiAccordionSummary"
                }),
                {
                    children: o,
                    className: i,
                    expandIcon: u,
                    focusVisibleClassName: f,
                    onClick: h
                } = n,
                y = (0, a._)(n, g),
                {
                    disabled: w = !1,
                    disableGutters: R,
                    expanded: E,
                    toggle: C
                } = r.useContext(d.A),
                _ = (0, s._)({}, n, {
                    expanded: E,
                    disabled: w,
                    disableGutters: R
                }),
                S = (e => {
                    let {
                        classes: t,
                        expanded: r,
                        disabled: n,
                        disableGutters: o
                    } = e;
                    return (0, l.a)({
                        root: ["root", r && "expanded", n && "disabled", !o && "gutters"],
                        focusVisible: ["focusVisible"],
                        content: ["content", r && "expanded", !o && "contentGutters"],
                        expandIconWrapper: ["expandIconWrapper", r && "expanded"]
                    }, m, t)
                })(_);
            return (0, c.jsxs)(v, (0, s._)({
                focusRipple: !1,
                disableRipple: !0,
                disabled: w,
                component: "div",
                "aria-expanded": E,
                className: (0, l.c)(S.root, i),
                focusVisibleClassName: (0, l.c)(S.focusVisible, f),
                onClick: e => {
                    C && C(e), h && h(e)
                },
                ref: t,
                ownerState: _
            }, y, {
                children: [(0, c.jsx)(x, {
                    className: S.content,
                    ownerState: _,
                    children: o
                }), u && (0, c.jsx)(b, {
                    className: S.expandIconWrapper,
                    ownerState: _,
                    children: u
                })]
            }))
        });
    var w = (0, n.default)({
            name: "AccordionSummary"
        })(function(e) {
            var r;
            return {
                root: (0, t._)({}, e.typography.largeLabel1),
                content: ((r = {
                    margin: "22px 0"
                })["&.".concat(h.expanded)] = {
                    margin: "22px 0"
                }, r)
            }
        }),
        R = (0, r.forwardRef)(function(e, n) {
            var i = e.expandIcon,
                a = e.children,
                s = e.classes,
                l = e.className,
                d = (0, t.a)(e, ["expandIcon", "children", "classes", "className"]),
                c = w(void 0, {
                    props: {
                        classes: (0, o.default)(s, l)
                    }
                });
            return r.default.createElement(y, (0, t._)({}, d, {
                classes: c.classes,
                expandIcon: null != i ? i : r.default.createElement(f.E, null),
                ref: n
            }), a)
        });
    e.s(["A", 0, R, "a", 0, h])
}, 943402, e => {
    "use strict";
    var t = e.i(275666);
    e.s(["AccordionSummary", () => t.A])
}, 838731, e => {
    "use strict";
    var t = e.i(690569),
        r = e.i(945146),
        n = e.i(416340),
        o = e.i(251635),
        i = e.i(737041),
        a = e.i(342607),
        s = e.i(787802),
        l = e.i(221628),
        d = e.i(121880),
        c = e.i(353512),
        u = e.i(710302);

    function p(e) {
        return (0, t.g)("MuiCollapse", e)
    }
    e.i(482979);
    var f = (0, s.g)("MuiCollapse", ["root", "horizontal", "vertical", "entered", "hidden", "wrapper", "wrapperInner"]);
    let m = ["addEndListener", "children", "className", "collapsedSize", "component", "easing", "in", "onEnter", "onEntered", "onEntering", "onExit", "onExited", "onExiting", "orientation", "style", "timeout", "TransitionComponent"],
        h = (0, o.s)("div", {
            name: "MuiCollapse",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.root, t[r.orientation], "entered" === r.state && t.entered, "exited" === r.state && !r.in && "0px" === r.collapsedSize && t.hidden]
            }
        })(e => {
            let {
                theme: t,
                ownerState: n
            } = e;
            return (0, r._)({
                height: 0,
                overflow: "hidden",
                transition: t.transitions.create("height")
            }, "horizontal" === n.orientation && {
                height: "auto",
                width: 0,
                transition: t.transitions.create("width")
            }, "entered" === n.state && (0, r._)({
                height: "auto",
                overflow: "visible"
            }, "horizontal" === n.orientation && {
                width: "auto"
            }), "exited" === n.state && !n.in && "0px" === n.collapsedSize && {
                visibility: "hidden"
            })
        }),
        g = (0, o.s)("div", {
            name: "MuiCollapse",
            slot: "Wrapper",
            overridesResolver: (e, t) => t.wrapper
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, r._)({
                display: "flex",
                width: "100%"
            }, "horizontal" === t.orientation && {
                width: "auto",
                height: "100%"
            })
        }),
        v = (0, o.s)("div", {
            name: "MuiCollapse",
            slot: "WrapperInner",
            overridesResolver: (e, t) => t.wrapperInner
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, r._)({
                width: "100%"
            }, "horizontal" === t.orientation && {
                width: "auto",
                height: "100%"
            })
        }),
        x = n.forwardRef(function(e, s) {
            let f = (0, d.u)({
                    props: e,
                    name: "MuiCollapse"
                }),
                {
                    addEndListener: x,
                    children: b,
                    className: y,
                    collapsedSize: w = "0px",
                    component: R,
                    easing: E,
                    in: C,
                    onEnter: _,
                    onEntered: S,
                    onEntering: D,
                    onExit: A,
                    onExited: N,
                    onExiting: k,
                    orientation: P = "vertical",
                    style: j,
                    timeout: I = t.h.standard,
                    TransitionComponent: M = i.T
                } = f,
                T = (0, t._)(f, m),
                O = (0, r._)({}, f, {
                    orientation: P,
                    collapsedSize: w
                }),
                B = (e => {
                    let {
                        orientation: t,
                        classes: r
                    } = e;
                    return (0, o.a)({
                        root: ["root", "".concat(t)],
                        entered: ["entered"],
                        hidden: ["hidden"],
                        wrapper: ["wrapper", "".concat(t)],
                        wrapperInner: ["wrapperInner", "".concat(t)]
                    }, p, r)
                })(O),
                z = (0, a.u)(),
                F = (0, c.u)(),
                L = n.useRef(null),
                G = n.useRef(),
                H = "number" == typeof w ? "".concat(w, "px") : w,
                W = "horizontal" === P,
                V = W ? "width" : "height",
                U = n.useRef(null),
                q = (0, u.u)(s, U),
                Y = e => t => {
                    if (e) {
                        let r = U.current;
                        void 0 === t ? e(r) : e(r, t)
                    }
                },
                X = () => L.current ? L.current[W ? "clientWidth" : "clientHeight"] : 0,
                K = Y((e, t) => {
                    L.current && W && (L.current.style.position = "absolute"), e.style[V] = H, _ && _(e, t)
                }),
                Z = Y((e, t) => {
                    let r = X();
                    L.current && W && (L.current.style.position = "");
                    let {
                        duration: n,
                        easing: o
                    } = (0, i.g)({
                        style: j,
                        timeout: I,
                        easing: E
                    }, {
                        mode: "enter"
                    });
                    if ("auto" === I) {
                        let t = z.transitions.getAutoHeightDuration(r);
                        e.style.transitionDuration = "".concat(t, "ms"), G.current = t
                    } else e.style.transitionDuration = "string" == typeof n ? n : "".concat(n, "ms");
                    e.style[V] = "".concat(r, "px"), e.style.transitionTimingFunction = o, D && D(e, t)
                }),
                $ = Y((e, t) => {
                    e.style[V] = "auto", S && S(e, t)
                }),
                J = Y(e => {
                    e.style[V] = "".concat(X(), "px"), A && A(e)
                }),
                Q = Y(N),
                ee = Y(e => {
                    let t = X(),
                        {
                            duration: r,
                            easing: n
                        } = (0, i.g)({
                            style: j,
                            timeout: I,
                            easing: E
                        }, {
                            mode: "exit"
                        });
                    if ("auto" === I) {
                        let r = z.transitions.getAutoHeightDuration(t);
                        e.style.transitionDuration = "".concat(r, "ms"), G.current = r
                    } else e.style.transitionDuration = "string" == typeof r ? r : "".concat(r, "ms");
                    e.style[V] = H, e.style.transitionTimingFunction = n, k && k(e)
                });
            return (0, l.jsx)(M, (0, r._)({
                in: C,
                onEnter: K,
                onEntered: $,
                onEntering: Z,
                onExit: J,
                onExited: Q,
                onExiting: ee,
                addEndListener: e => {
                    "auto" === I && F.start(G.current || 0, e), x && x(U.current, e)
                },
                nodeRef: U,
                timeout: "auto" === I ? null : I
            }, T, {
                children: (e, t) => (0, l.jsx)(h, (0, r._)({
                    as: R,
                    className: (0, o.c)(B.root, y, {
                        entered: B.entered,
                        exited: !C && "0px" === H && B.hidden
                    } [e]),
                    style: (0, r._)({
                        [W ? "minWidth" : "minHeight"]: H
                    }, j),
                    ref: q
                }, t, {
                    ownerState: (0, r._)({}, O, {
                        state: e
                    }),
                    children: (0, l.jsx)(g, {
                        ownerState: (0, r._)({}, O, {
                            state: e
                        }),
                        className: B.wrapper,
                        ref: L,
                        children: (0, l.jsx)(v, {
                            ownerState: (0, r._)({}, O, {
                                state: e
                            }),
                            className: B.wrapperInner,
                            children: b
                        })
                    })
                }))
            }))
        });
    x.muiSupportAuto = !0, e.s(["C", 0, x, "c", 0, f])
}, 16397, e => {
    "use strict";
    var t = e.i(194250),
        r = e.i(416340),
        n = e.i(863605),
        o = e.i(154502),
        i = e.i(690569),
        a = e.i(945146),
        s = e.i(251635),
        l = e.i(977987),
        d = e.i(342607),
        c = e.i(787802),
        u = e.i(221628),
        p = e.i(806009),
        f = e.i(770593),
        m = e.i(121880);
    e.i(39651);
    var h = e.i(737041),
        g = e.i(710302),
        v = e.i(782353),
        x = e.i(942363);
    e.i(304064), e.i(407110), e.i(164136);
    var b = e.i(605503);
    let y = ["addEndListener", "appear", "children", "container", "direction", "easing", "in", "onEnter", "onEntered", "onEntering", "onExit", "onExited", "onExiting", "style", "timeout", "TransitionComponent"];

    function w(e, t, r) {
        let n = function(e, t, r) {
            let n, o = t.getBoundingClientRect(),
                i = r && r.getBoundingClientRect(),
                a = (0, x.o)(t);
            if (t.fakeTransform) n = t.fakeTransform;
            else {
                let e = a.getComputedStyle(t);
                n = e.getPropertyValue("-webkit-transform") || e.getPropertyValue("transform")
            }
            let s = 0,
                l = 0;
            if (n && "none" !== n && "string" == typeof n) {
                let e = n.split("(")[1].split(")")[0].split(",");
                s = parseInt(e[4], 10), l = parseInt(e[5], 10)
            }
            return "left" === e ? i ? "translateX(".concat(i.right + s - o.left, "px)") : "translateX(".concat(a.innerWidth + s - o.left, "px)") : "right" === e ? i ? "translateX(-".concat(o.right - i.left - s, "px)") : "translateX(-".concat(o.left + o.width - s, "px)") : "up" === e ? i ? "translateY(".concat(i.bottom + l - o.top, "px)") : "translateY(".concat(a.innerHeight + l - o.top, "px)") : i ? "translateY(-".concat(o.top - i.top + o.height - l, "px)") : "translateY(-".concat(o.top + o.height - l, "px)")
        }(e, t, "function" == typeof r ? r() : r);
        n && (t.style.webkitTransform = n, t.style.transform = n)
    }
    let R = r.forwardRef(function(e, t) {
        let n = (0, d.u)(),
            o = {
                enter: n.transitions.easing.easeOut,
                exit: n.transitions.easing.sharp
            },
            s = {
                enter: n.transitions.duration.enteringScreen,
                exit: n.transitions.duration.leavingScreen
            },
            {
                addEndListener: l,
                appear: c = !0,
                children: p,
                container: f,
                direction: m = "down",
                easing: R = o,
                in: E,
                onEnter: C,
                onEntered: _,
                onEntering: S,
                onExit: D,
                onExited: A,
                onExiting: N,
                style: k,
                timeout: P = s,
                TransitionComponent: j = h.T
            } = e,
            I = (0, i._)(e, y),
            M = r.useRef(null),
            T = (0, g.u)((0, v.g)(p), M, t),
            O = e => t => {
                e && (void 0 === t ? e(M.current) : e(M.current, t))
            },
            B = O((e, t) => {
                w(m, e, f), (0, h.r)(e), C && C(e, t)
            }),
            z = O((e, t) => {
                let r = (0, h.g)({
                    timeout: P,
                    style: k,
                    easing: R
                }, {
                    mode: "enter"
                });
                e.style.webkitTransition = n.transitions.create("-webkit-transform", (0, a._)({}, r)), e.style.transition = n.transitions.create("transform", (0, a._)({}, r)), e.style.webkitTransform = "none", e.style.transform = "none", S && S(e, t)
            }),
            F = O(_),
            L = O(N),
            G = O(e => {
                let t = (0, h.g)({
                    timeout: P,
                    style: k,
                    easing: R
                }, {
                    mode: "exit"
                });
                e.style.webkitTransition = n.transitions.create("-webkit-transform", t), e.style.transition = n.transitions.create("transform", t), w(m, e, f), D && D(e)
            }),
            H = O(e => {
                e.style.webkitTransition = "", e.style.transition = "", A && A(e)
            }),
            W = r.useCallback(() => {
                M.current && w(m, M.current, f)
            }, [m, f]);
        return r.useEffect(() => {
            if (E || "down" === m || "right" === m) return;
            let e = (0, b.d)(() => {
                    M.current && w(m, M.current, f)
                }),
                t = (0, x.o)(M.current);
            return t.addEventListener("resize", e), () => {
                e.clear(), t.removeEventListener("resize", e)
            }
        }, [m, E, f]), r.useEffect(() => {
            E || W()
        }, [E, W]), (0, u.jsx)(j, (0, a._)({
            nodeRef: M,
            onEnter: B,
            onEntered: F,
            onEntering: z,
            onExit: G,
            onExited: H,
            onExiting: L,
            addEndListener: e => {
                l && l(M.current, e)
            },
            appear: c,
            in: E,
            timeout: P
        }, I, {
            children: (e, t) => r.cloneElement(p, (0, a._)({
                ref: T,
                style: (0, a._)({
                    visibility: "exited" !== e || E ? void 0 : "hidden"
                }, k, p.props.style)
            }, t))
        }))
    });

    function E(e) {
        return (0, i.g)("MuiDrawer", e)
    }(0, c.g)("MuiDrawer", ["root", "docked", "paper", "paperAnchorLeft", "paperAnchorRight", "paperAnchorTop", "paperAnchorBottom", "paperAnchorDockedLeft", "paperAnchorDockedRight", "paperAnchorDockedTop", "paperAnchorDockedBottom", "modal"]);
    let C = ["BackdropProps"],
        _ = ["anchor", "BackdropProps", "children", "className", "elevation", "hideBackdrop", "ModalProps", "onClose", "open", "PaperProps", "SlideProps", "TransitionComponent", "transitionDuration", "variant"],
        S = (e, t) => {
            let {
                ownerState: r
            } = e;
            return [t.root, ("permanent" === r.variant || "persistent" === r.variant) && t.docked, t.modal]
        },
        D = (0, s.s)(p.M, {
            name: "MuiDrawer",
            slot: "Root",
            overridesResolver: S
        })(e => {
            let {
                theme: t
            } = e;
            return {
                zIndex: (t.vars || t).zIndex.drawer
            }
        }),
        A = (0, s.s)("div", {
            shouldForwardProp: s.r,
            name: "MuiDrawer",
            slot: "Docked",
            skipVariantsResolver: !1,
            overridesResolver: S
        })({
            flex: "0 0 auto"
        }),
        N = (0, s.s)(f.M, {
            name: "MuiDrawer",
            slot: "Paper",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.paper, t["paperAnchor".concat((0, i.a)(r.anchor))], "temporary" !== r.variant && t["paperAnchorDocked".concat((0, i.a)(r.anchor))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: r
            } = e;
            return (0, a._)({
                overflowY: "auto",
                display: "flex",
                flexDirection: "column",
                height: "100%",
                flex: "1 0 auto",
                zIndex: (t.vars || t).zIndex.drawer,
                WebkitOverflowScrolling: "touch",
                position: "fixed",
                top: 0,
                outline: 0
            }, "left" === r.anchor && {
                left: 0
            }, "top" === r.anchor && {
                top: 0,
                left: 0,
                right: 0,
                height: "auto",
                maxHeight: "100%"
            }, "right" === r.anchor && {
                right: 0
            }, "bottom" === r.anchor && {
                top: "auto",
                left: 0,
                bottom: 0,
                right: 0,
                height: "auto",
                maxHeight: "100%"
            }, "left" === r.anchor && "temporary" !== r.variant && {
                borderRight: "1px solid ".concat((t.vars || t).palette.divider)
            }, "top" === r.anchor && "temporary" !== r.variant && {
                borderBottom: "1px solid ".concat((t.vars || t).palette.divider)
            }, "right" === r.anchor && "temporary" !== r.variant && {
                borderLeft: "1px solid ".concat((t.vars || t).palette.divider)
            }, "bottom" === r.anchor && "temporary" !== r.variant && {
                borderTop: "1px solid ".concat((t.vars || t).palette.divider)
            })
        }),
        k = {
            left: "right",
            right: "left",
            top: "down",
            bottom: "up"
        },
        P = r.forwardRef(function(e, t) {
            let n = (0, m.u)({
                    props: e,
                    name: "MuiDrawer"
                }),
                o = (0, d.u)(),
                c = (0, l.u)(),
                p = {
                    enter: o.transitions.duration.enteringScreen,
                    exit: o.transitions.duration.leavingScreen
                },
                {
                    anchor: f = "left",
                    BackdropProps: h,
                    children: g,
                    className: v,
                    elevation: x = 16,
                    hideBackdrop: b = !1,
                    ModalProps: {
                        BackdropProps: y
                    } = {},
                    onClose: w,
                    open: S = !1,
                    PaperProps: P = {},
                    SlideProps: j,
                    TransitionComponent: I = R,
                    transitionDuration: M = p,
                    variant: T = "temporary"
                } = n,
                O = (0, i._)(n.ModalProps, C),
                B = (0, i._)(n, _),
                z = r.useRef(!1);
            r.useEffect(() => {
                z.current = !0
            }, []);
            let F = function(e, t) {
                    let {
                        direction: r
                    } = e;
                    return "rtl" === r && -1 !== ["left", "right"].indexOf(t) ? k[t] : t
                }({
                    direction: c ? "rtl" : "ltr"
                }, f),
                L = (0, a._)({}, n, {
                    anchor: f,
                    elevation: x,
                    open: S,
                    variant: T
                }, B),
                G = (e => {
                    let {
                        classes: t,
                        anchor: r,
                        variant: n
                    } = e, o = {
                        root: ["root"],
                        docked: [("permanent" === n || "persistent" === n) && "docked"],
                        modal: ["modal"],
                        paper: ["paper", "paperAnchor".concat((0, i.a)(r)), "temporary" !== n && "paperAnchorDocked".concat((0, i.a)(r))]
                    };
                    return (0, s.a)(o, E, t)
                })(L),
                H = (0, u.jsx)(N, (0, a._)({
                    elevation: "temporary" === T ? x : 0,
                    square: !0
                }, P, {
                    className: (0, s.c)(G.paper, P.className),
                    ownerState: L,
                    children: g
                }));
            if ("permanent" === T) return (0, u.jsx)(A, (0, a._)({
                className: (0, s.c)(G.root, G.docked, v),
                ownerState: L,
                ref: t
            }, B, {
                children: H
            }));
            let W = (0, u.jsx)(I, (0, a._)({
                in: S,
                direction: k[F],
                timeout: M,
                appear: z.current
            }, j, {
                children: H
            }));
            return "persistent" === T ? (0, u.jsx)(A, (0, a._)({
                className: (0, s.c)(G.root, G.docked, v),
                ownerState: L,
                ref: t
            }, B, {
                children: W
            })) : (0, u.jsx)(D, (0, a._)({
                BackdropProps: (0, a._)({}, h, y, {
                    transitionDuration: M
                }),
                className: (0, s.c)(G.root, G.modal, v),
                open: S,
                ownerState: L,
                onClose: w,
                hideBackdrop: b,
                ref: t
            }, B, O, {
                children: W
            }))
        });
    var j = (0, n.default)({
            name: "Drawer"
        })(function(e) {
            return {
                root: {
                    elevation: e.shadows[16]
                }
            }
        }),
        I = (0, r.forwardRef)(function(e, n) {
            var i = e.classes,
                a = e.children,
                s = e.className,
                l = (0, t.a)(e, ["classes", "children", "className"]),
                d = j(void 0, {
                    props: {
                        classes: (0, o.default)(i, s)
                    }
                });
            return r.default.createElement(P, (0, t._)({}, l, {
                classes: d.classes,
                ref: n
            }), a)
        });
    I.displayName = "Drawer", e.s(["Drawer", 0, I], 16397)
}, 763485, e => {
    "use strict";
    var t = e.i(221628),
        r = (0, e.i(634034).c)((0, t.jsx)("path", {
            d: "M16.59 8.59 12 13.17 7.41 8.59 6 10l6 6 6-6z"
        }), "ExpandMore");
    e.s(["E", 0, r])
}, 11473, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["OpenInNewIcon", () => t.OpenInNew])
}, 458451, e => {
    "use strict";
    var t = e.i(416340);
    let r = e => e;

    function n(e) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : r,
            o = t.default.useSyncExternalStore(e.subscribe, t.default.useCallback(() => n(e.getState()), [e, n]), t.default.useCallback(() => n(e.getInitialState()), [e, n]));
        return t.default.useDebugValue(o), o
    }
    let o = async e => {
        try {
            let t = await e.json();
            if (t.errors.length > 0) {
                let e = t.errors[0];
                if (e) return {
                    code: e.code,
                    message: e.message
                }
            }
            return null
        } catch (e) {
            return null
        }
    }, i = (0, t.createContext)({
        user: null,
        status: "initial",
        isFetched: !1,
        login: () => {
            throw Error("useRobloxAuthentication must be used within a RobloxAuthenticationProvider")
        },
        logout: () => {
            throw Error("useRobloxAuthentication must be used within a RobloxAuthenticationProvider")
        }
    });
    e.s(["RobloxAuthenticationProvider", 0, e => {
        let {
            clientId: r,
            authenticationClient: a,
            discoveryClient: s,
            usersClient: l,
            store: d,
            children: c
        } = e, [u, p] = (0, t.useState)(!1), [f, m] = (0, t.useState)("initial"), h = (0, t.useCallback)(async function() {
            let {
                redirectUri: e,
                ...t
            } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, n = "string" == typeof e ? e : window.location.href.replace(/#.*$/, ""), {
                authorizationEndpoint: o
            } = await s.discoveryGetDiscoveryConfiguration(), i = new URL(o);
            i.search = new URLSearchParams({
                client_id: r,
                redirect_uri: n,
                scope: "openid",
                response_type: "none",
                prompt: "none",
                ...t
            }).toString(), window.location.assign(i.href)
        }, [r, s]), {
            user: g,
            setUser: v
        } = {
            user: n(d, e => e.user),
            setUser: n(d, e => e.setUser)
        }, x = (0, t.useCallback)(async () => {
            await a.v1LogoutPost(), null !== g && (v(null), m("logged-out"))
        }, [a, g, v]);
        (0, t.useEffect)(() => {
            (async () => {
                try {
                    m("loading");
                    let {
                        id: e,
                        name: t,
                        displayName: r
                    } = await l.v1UsersAuthenticatedGet();
                    void 0 !== e && void 0 !== t ? (v({
                        id: e,
                        name: t,
                        displayName: r
                    }), m("success")) : m("error")
                } catch (r) {
                    let e = r.response,
                        t = e ? await o(e) : null;
                    (null == t ? void 0 : t.message) === "User is moderated" ? m("moderated"): (null == t ? void 0 : t.code) === 9002 || (null == e ? void 0 : e.status) === 401 ? m("unauthenticated") : m("error")
                } finally {
                    p(!0)
                }
            })()
        }, []);
        let b = (0, t.useMemo)(() => ({
            user: g,
            isFetched: u,
            status: f,
            login: h,
            logout: x
        }), [g, u, f, h, x]);
        return t.default.createElement(i.Provider, {
            value: b
        }, c)
    }, "initializeAuthStore", 0, function() {
        var e;
        let t, r, n, o, i;
        return e = e => ({
            user: null,
            setUser: t => e({
                user: t
            })
        }), r = new Set, o = {
            setState: n = (e, n) => {
                let o = "function" == typeof e ? e(t) : e;
                if (!Object.is(o, t)) {
                    let e = t;
                    t = (null != n ? n : "object" != typeof o || null === o) ? o : Object.assign({}, t, o), r.forEach(r => r(t, e))
                }
            },
            getState: () => t,
            getInitialState: () => i,
            subscribe: e => (r.add(e), () => r.delete(e))
        }, i = t = e(n), o
    }, "useRobloxAuthentication", 0, () => (0, t.useContext)(i)])
}, 814975, e => {
    "use strict";
    var t = e.i(458451);
    e.s(["useAuthentication", () => t.useRobloxAuthentication])
}]);

//# debugId=aaccd568-0198-25e9-fe4c-66ce27677456
//# sourceMappingURL=0r_t_uf-8_sws.js.map